unit nick.toolsapi.shortcut.KnownShortcutsFrame;

interface

uses
  Messages,
  SysUtils,
  Classes,
  Controls,
  Forms,
  StdCtrls,
  ExtCtrls,
  VirtualTrees,
  ComCtrls,
  nick.toolsapi.shortcut.ShortCutItem,
  nick.toolsapi.shortcut.IShortCutList,
  nick.toolsapi.shortcut.ShortCutRepository,
  nick.toolsapi.shortcut.IRepositoryFactory,
  Generics.Collections;

type
  TfrmKnownShortcuts = class(TFrame)
    grpFiltering: TGroupBox;
    lblPrimary: TLabel;
    lblSecondary: TLabel;
    lbDescription: TLabel;
    chkConficts: TCheckBox;
    hkPrimary: THotKey;
    hkSecondary: THotKey;
    edtDesc: TEdit;
    btnRescan: TButton;
    chkRegExp: TCheckBox;
    chkCaseSensitive: TCheckBox;
    vtAssignments: TVirtualStringTree;
    splDescription: TSplitter;
    mmoExtraInfo: TRichEdit;
    procedure chkCaseSensitiveClick(Sender: TObject);
    procedure chkConfictsClick(Sender: TObject);
    procedure chkRegExpClick(Sender: TObject);
    procedure edtDescChange(Sender: TObject);
    procedure hkPrimaryChange(Sender: TObject);
    procedure hkSecondaryChange(Sender: TObject);
    procedure vtAssignmentsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vtAssignmentsGetHint(Sender: TBaseVirtualTree;
                                   Node: PVirtualNode;
                                   Column: TColumnIndex;
                                   var LineBreakStyle: TVTTooltipLineBreakStyle;
                                   var HintText: string);
    procedure vtAssignmentsGetText(Sender: TBaseVirtualTree;
                                   Node: PVirtualNode;
                                   Column: TColumnIndex;
                                   TextType: TVSTTextType;
                                   var CellText: string);
  private type
    TFilterFunc = reference to function (const AShortCutItem : IShortCutItem): Boolean;
  private
    FRepositoryFactory: IRepositoryFactory;
    FShortCutRepository : IShortCutRepository;
    FShortCutElements : TArray<IShortCutList>;
    FConflict : TObjectDictionary<TPair<TShortCut, TShortCut>, TList<IShortCutItem>>;
    procedure ModifyVirtualTree(const AProc : TProc);
    procedure FilterShortCuts();
    procedure PopulateConflicts;
    procedure AddTextFilter(const AFilterList : TList<TFilterFunc>);
    procedure AddConflictingFilter(const AFilterList : TList<TFilterFunc>);
    procedure AddHotKeyFilter(const AFilterList : TList<TFilterFunc>;
                              const AShortCutFunc : TFunc<TShortCut>;
                              const AShortCutItemFunc : TFunc<IShortCutItem, TShortCut>);
    procedure InitRichEditURLDetection(const ARichEdit : TRichEdit);
  protected
    procedure CMShowingChanged(var M: TMessage); message CM_SHOWINGCHANGED;
    procedure WndProc(var Msg: TMessage); override;
  public
    constructor Create(const AOwner: TComponent;
                       const ARepositoryFactory : IRepositoryFactory;
                       const AShortCutRepository : IShortCutRepository); reintroduce;
    destructor Destroy; override;

    procedure RescanShortCutKeys;
  end;

implementation

uses
  RegularExpressions,
  StrUtils,
  Menus,
  Windows,
  RichEdit,
  ShellAPI,
  Generics.Defaults;

{$R *.dfm}

constructor TfrmKnownShortcuts.Create(const AOwner: TComponent;
                                  const ARepositoryFactory : IRepositoryFactory;
                                  const AShortCutRepository : IShortCutRepository);
begin
  inherited Create(AOwner);
  FRepositoryFactory := ARepositoryFactory;
  FShortCutRepository := AShortCutRepository;

  SetLength(FShortCutElements, 0);

  vtAssignments.ShowHint := True;
  vtAssignments.HintAnimation := hatFade;
  vtAssignments.HintMode := hmHint;

  vtAssignments.Header.Columns.Items[3].Options := vtAssignments.Header.Columns.Items[3].Options - [coVisible];
  vtAssignments.TreeOptions.SelectionOptions := vtAssignments.TreeOptions.SelectionOptions + [toFullRowSelect];
  vtAssignments.TreeOptions.PaintOptions := vtAssignments.TreeOptions.PaintOptions + [toUseExplorerTheme];
end;

destructor TfrmKnownShortcuts.Destroy;
begin
  FConflict.Free;
  inherited;
end;

procedure TfrmKnownShortcuts.CMShowingChanged(var M: TMessage);
begin
  inherited;
  if Showing and (Length(FShortCutElements) = 0) then
  begin
    RescanShortCutKeys;
    InitRichEditURLDetection(mmoExtraInfo);
  end;
end;

// The following two methods are from: http://delphi.about.com/library/code/ncaa111803a.htm
// To implement clickable links in TRichEdit
procedure TfrmKnownShortcuts.InitRichEditURLDetection(const ARichEdit: TRichEdit);
var
  LMask: NativeInt;
begin
  LMask := SendMessage(ARichEdit.Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(ARichEdit.Handle, EM_SETEVENTMASK, 0, LMask or ENM_LINK);
  SendMessage(ARichEdit.Handle, EM_AUTOURLDETECT, Integer(True), 0);
end;

procedure TfrmKnownShortcuts.WndProc(var Msg: TMessage);
var
  LENLink: TENLink;
  LURL: string;
  LRichEdit : TRichEdit;
begin
 if (Msg.Msg = WM_NOTIFY) then
 begin
    if (PNMHDR(Msg.lParam).code = EN_LINK) then
    begin
      LENLink := TENLink(Pointer(TWMNotify(Msg).NMHdr)^);
      if (LENLink.Msg = WM_LBUTTONDOWN) then
      begin
        try
          LRichEdit := mmoExtraInfo; // TRichEdit(Self.ActiveControl);
          SendMessage(LRichEdit.Handle, EM_EXSETSEL, 0, LongInt(@(LENLink.chrg)));
          LURL := LRichEdit.SelText;
          ShellExecute(Handle, 'open', PChar(LURL), nil, nil, SW_SHOWNORMAL);
        except
        end;
      end;
    end;
  end;
  inherited;
end;

procedure TfrmKnownShortcuts.AddConflictingFilter(const AFilterList: TList<TFilterFunc>);
begin
  if (not chkConficts.Checked) then
    Exit;

  AFilterList.Add(function(const AShortCutItem : IShortCutItem) : Boolean
                  var
                    LPair : TPair<TShortCut, TShortCut>;
                    LList : TList<IShortCutItem>;
                  begin
                    LPair := TPair<TShortCut, TShortCut>.Create(AShortCutItem.Primary, AShortCutItem.Secondary);
                    LList := nil;

                    if not FConflict.TryGetValue(LPair, LList) then
                      Exit(False);

                    Result := (LList.Count > 1);
                  end);
end;

procedure TfrmKnownShortcuts.AddHotKeyFilter(const AFilterList: TList<TFilterFunc>;
  const AShortCutFunc: TFunc<TShortCut>;
  const AShortCutItemFunc: TFunc<IShortCutItem, TShortCut>);
var
  LShortCut: TShortCut;
begin
  LShortCut := AShortCutFunc();

  if (LShortCut = scNone) then
    Exit;

  // If it is only scShift and/or scCtrl and/or scAlt
  if ((LShortCut and not (scShift or scCtrl or scAlt)) = 0) then
  begin
    AFilterList.Add(function(const AShortCutItem : IShortCutItem) : Boolean
                    begin
                      Result := ((AShortCutItemFunc(AShortCutItem) and AShortCutFunc()) = AShortCutFunc());
                    end);
    Exit;
  end;

  // Only a character is pressed - no modifiers
  if ((LShortCut and (scShift or scCtrl or scAlt)) = 0) then
  begin
    AFilterList.Add(function(const AShortCutItem : IShortCutItem) : Boolean
                    begin
                      Result := ((AShortCutItemFunc(AShortCutItem) and not (scShift or scCtrl or scAlt)) = AShortCutFunc());
                    end);
    Exit;
  end;

  AFilterList.Add(function(const AShortCutItem : IShortCutItem) : Boolean
                  begin
                    Result := (AShortCutItemFunc(AShortCutItem) = AShortCutFunc());
                  end);
end;

procedure TfrmKnownShortcuts.AddTextFilter(const AFilterList: TList<TFilterFunc>);
var
  LRegEx: TRegEx;
  LRegExOptions: TRegExOptions;
  LComparison : function(const AText, ASubText: string): Boolean;
begin
  if (Length(Trim(edtDesc.Text)) = 0) then
    Exit;

  if (chkRegExp.Checked) then
  begin
    LRegExOptions := [roCompiled, roMultiLine];
    if not chkCaseSensitive.Checked then
      Include(LRegExOptions, roIgnoreCase);

    LRegEx := TRegEx.Create(edtDesc.Text, LRegExOptions);

    AFilterList.Add(function(const AShortCutItem : IShortCutItem) : Boolean
                    begin
                      Result := LRegEx.IsMatch(AShortCutItem.Details) or LRegEx.IsMatch(AShortCutItem.Description);
                    end);
  end;

  LComparison := StrUtils.ContainsText;
  if chkCaseSensitive.Checked then
    LComparison := StrUtils.ContainsStr;

  AFilterList.Add(function(const AShortCutItem : IShortCutItem) : Boolean
                  begin
                    Result := LComparison(AShortCutItem.Details, edtDesc.Text) or
                              LComparison(AShortCutItem.Description, edtDesc.Text);
                  end);
end;

procedure TfrmKnownShortcuts.ModifyVirtualTree(const AProc: TProc);
begin
  vtAssignments.TreeOptions.MiscOptions := vtAssignments.TreeOptions.MiscOptions - [toReadOnly];
  try
    AProc();
  finally
    vtAssignments.TreeOptions.MiscOptions := vtAssignments.TreeOptions.MiscOptions + [toReadOnly];
  end;
end;

procedure TfrmKnownShortcuts.chkCaseSensitiveClick(Sender: TObject);
begin
  FilterShortCuts();
end;

procedure TfrmKnownShortcuts.chkConfictsClick(Sender: TObject);
begin
  if chkConficts.Checked and not Assigned(FConflict) then
    PopulateConflicts();
  FilterShortCuts();
end;

procedure TfrmKnownShortcuts.chkRegExpClick(Sender: TObject);
begin
  FilterShortCuts();
end;

procedure TfrmKnownShortcuts.edtDescChange(Sender: TObject);
begin
  FilterShortCuts();
end;

procedure TfrmKnownShortcuts.FilterShortCuts;
var
  LFilter: TFilterFunc;
  LFilterList: TList<TFilterFunc>;
  LNode : PVirtualNode;
  LShortCutItem: IShortCutItem;
  LVisible: Boolean;
begin
  LFilterList := nil;
  try
    LFilterList := TList<TFilterFunc>.Create;

    // Primary
    AddHotKeyFilter(LFilterList,
                    function() : TShortCut begin Result := hkPrimary.HotKey end,
                    function(AShortCutItem : IShortCutItem) : TShortCut begin Result := AShortCutItem.Primary; end);
    // Secondary
    AddHotKeyFilter(LFilterList,
                    function() : TShortCut begin Result := hkSecondary.HotKey end,
                    function(AShortCutItem : IShortCutItem) : TShortCut begin Result := AShortCutItem.Secondary; end);

    // Description/Detail
    AddTextFilter(LFilterList);

    // Keep conflicting shortcuts
    AddConflictingFilter(LFilterList);

    vtAssignments.BeginUpdate;
    try
      if (LFilterList.Count <> 0) then
        vtAssignments.FullExpand();

      for LNode in vtAssignments.Nodes(true) do
      begin
        LVisible := True;

        if (Assigned(LNode.Parent) and (LNode.Parent <> vtAssignments.RootNode)) then
        begin
          LShortCutItem := FShortCutElements[LNode.Parent.Index].ShortCut[LNode.Index];

          for LFilter in LFilterList do
          begin
            LVisible := LVisible and LFilter(LShortCutItem);
            if not LVisible then
              Break;
          end;
        end;
        vtAssignments.IsVisible[LNode] := LVisible
      end;
    finally
      vtAssignments.EndUpdate;
    end;
  finally
    LFilterList.Free;
  end;
end;

procedure TfrmKnownShortcuts.hkPrimaryChange(Sender: TObject);
begin
  FilterShortCuts();
end;

procedure TfrmKnownShortcuts.hkSecondaryChange(Sender: TObject);
begin
  FilterShortCuts();
end;

procedure TfrmKnownShortcuts.PopulateConflicts;
var
  lp: Integer;
  LPair: TPair<TShortCut, TShortCut>;
  LShortCutItem: IShortCutItem;
  LShortCutList: IShortCutList;
begin
  FConflict.Free;
  FConflict := TObjectDictionary<TPair<TShortCut, TShortCut>, TList<IShortCutItem>>.Create([doOwnsValues]);

  for LShortCutList in FShortCutElements do
    for lp := 0 to LShortCutList.Count - 1 do
    begin
      LShortCutItem := LShortCutList.ShortCut[lp];
      LPair := TPair<TShortCut, TShortCut>.Create(LShortCutItem.Primary, LShortCutItem.Secondary);
      if (not FConflict.ContainsKey(LPair)) then
        FConflict.Add(LPair, TList<IShortCutItem>.Create);
      FConflict.Items[LPair].Add(LShortCutItem);
    end;
end;

procedure TfrmKnownShortcuts.RescanShortCutKeys;
begin
  vtAssignments.RootNodeCount := 0;

  FShortCutElements := FShortCutRepository.GetShortCutElements();

  TArray.Sort<IShortCutList>(FShortCutElements , TDelegatedComparer<IShortCutList>.Construct(
    function(const Left, Right: IShortCutList): Integer
    begin
      Result := CompareStr(Left.Name, Right.Name);
    end));

  ModifyVirtualTree(procedure
                    begin
                      vtAssignments.RootNodeCount := Length(FShortCutElements);
                    end);
end;

procedure TfrmKnownShortcuts.vtAssignmentsChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  LShortCut: IShortCutItem;
begin
  if (not Assigned(Node)) then
    Exit;

  mmoExtraInfo.Lines.BeginUpdate;
  try
    mmoExtraInfo.Lines.Clear;

    if (not Assigned(Node.Parent)) or (Node.Parent = Sender.RootNode) then
    begin
      mmoExtraInfo.Lines.Text := FShortCutElements[Node.Index].GetDescription;
      Exit;
    end;

    LShortCut := FShortCutElements[Node.Parent.Index].ShortCut[Node.Index];
    if (LShortCut.Description <> '') then
      mmoExtraInfo.Lines.Text := LShortCut.Description
    else
      mmoExtraInfo.Lines.Text := LShortCut.Details;
  finally
    mmoExtraInfo.Lines.EndUpdate;
  end;
end;

procedure TfrmKnownShortcuts.vtAssignmentsGetHint(Sender: TBaseVirtualTree; Node:
    PVirtualNode; Column: TColumnIndex; var LineBreakStyle:
    TVTTooltipLineBreakStyle; var HintText: string);
var
  LShortCut: IShortCutItem;
begin
  if (Column <> 3) or
     (not Assigned(Node.Parent)) or
     (Node.Parent = Sender.RootNode) then
  begin
    HintText := '';
    Exit;
  end;

  LShortCut := FShortCutElements[Node.Parent.Index].ShortCut[Node.Index];
  HintText := LShortCut.Description;
  LineBreakStyle := hlbForceMultiLine;
end;

procedure TfrmKnownShortcuts.vtAssignmentsGetText(Sender: TBaseVirtualTree; Node:
    PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText:
    string);
var
  LShortCutElement : IShortCutList;
  LShortCut : IShortCutItem;
begin
  CellText := '';

  if (not Assigned(Node.Parent)) or (Node.Parent = Sender.RootNode) then
  begin
    if (Column = 0) then
    begin
      LShortCutElement := FShortCutElements[Node.Index];
      CellText := LShortCutElement.Name;

      ModifyVirtualTree(procedure
                        begin
                          Sender.ChildCount[Node] := LShortCutElement.Count;
                        end);
    end;
    Exit;
  end;

  LShortCutElement := FShortCutElements[Node.Parent.Index];
  LShortCut := LShortCutElement.ShortCut[Node.Index];

  case Column of
    0 : CellText := LShortCut.Details;
    1 : if (LShortCut.Primary <> scNone) then
          CellText := ShortCutToText(LShortCut.Primary);
    2 : if (LShortCut.Secondary <> scNone) then
          CellText := ShortCutToText(LShortCut.Secondary);
    3 : CellText := LShortCut.Description;
  end;
end;

end.

