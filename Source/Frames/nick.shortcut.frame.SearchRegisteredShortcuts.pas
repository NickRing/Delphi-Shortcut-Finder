unit nick.shortcut.frame.SearchRegisteredShortcuts;

interface

uses
  System.SysUtils,
  Winapi.Messages,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Controls,
  System.Classes,
  Vcl.Forms,
  ToolsApi,
  VirtualTrees,
  nick.shortcut.factory.IRepository,
  nick.shortcut.other.IFileVersionInformation,
  nick.shortcut.frame.Base,
  nick.shortcut.core.ShortcutExport,
  nick.shortcut.repository.IToolsApi,
  nick.shortcut.repository.IRegistry,
  System.Actions,
  Vcl.ActnList,
  Vcl.ExtCtrls;

type
  TfrmSearchRegisteredShortcuts = class(TBaseFrame)
    vtShortCutModuleDetails: TVirtualStringTree;
    ActionList: TActionList;
    actExport: TAction;
    pbProgressBar: TProgressBar;
    pnlTop: TPanel;
    grpAdvanceFiltering: TGroupBox;
    lblHotkey: TLabel;
    hkAdvance: THotKey;
    grpExport: TGroupBox;
    cbbExports: TComboBox;
    btnExport: TButton;
    procedure actExportExecute(Sender: TObject);
    procedure actExportUpdate(Sender: TObject);
    procedure ActionListChange(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure hkAdvanceChange(Sender: TObject);
    procedure vtShortCutModuleDetailsGetText(Sender: TBaseVirtualTree;
                                             Node: PVirtualNode;
                                             Column: TColumnIndex;
                                             TextType: TVSTTextType;
                                             var CellText: string);
  private
    FModuleDetails : TArray<TModuleDetail>;
    FCurrentShortcutExport: IShortcutExport;

    procedure ModifyVirtualTree(const AProc : TProc);
    procedure FindShortCutInformation;
  protected
    procedure CMShowingChanged(var AMessage: TMessage); message CM_SHOWINGCHANGED;

    procedure ReadRegistrySettings(const ARegistryRepository : IRegistryRepository); override;
    procedure WriteRegistrySettings(const ARegistryRepository : IRegistryRepository); override;
  public
    constructor Create(const AOwner: TComponent; const ARepositoryFactory : IRepositoryFactory); reintroduce;
  end;

implementation

uses
  nick.shortcut.repository.ShortcutExport,
  nick.shortcut.repository.IIniFile,
  nick.shortcut.repository.System,
  nick.shortcut.repository.ISystem,
  nick.shortcut.other.VirtualKeys,
  Winapi.Windows,
  Vcl.Menus,
  Vcl.Dialogs,
  System.IOUtils;

const
  cCOLUMN_REGISTRY_ENTRY_PREFIX = 'Column';

{$R *.dfm}

constructor TfrmSearchRegisteredShortcuts.Create(const AOwner: TComponent; const ARepositoryFactory: IRepositoryFactory);
begin
  inherited Create(AOwner, ARepositoryFactory);
  pbProgressBar.Visible := False;

  vtShortCutModuleDetails.TreeOptions.SelectionOptions := vtShortCutModuleDetails.TreeOptions.SelectionOptions + [toFullRowSelect];
  vtShortCutModuleDetails.TreeOptions.PaintOptions := vtShortCutModuleDetails.TreeOptions.PaintOptions + [toUseExplorerTheme];
end;

procedure TfrmSearchRegisteredShortcuts.CMShowingChanged(var AMessage: TMessage);
var
  LShortcutExportClass : TShortcutExportClass;
begin
  inherited;

  if Showing and (cbbExports.Items.Count = 0) then
  begin
    cbbExports.Items.BeginUpdate;
    try
      for LShortcutExportClass in GetShortcutExportRepository().ExportsList do
        cbbExports.Items.AddObject(LShortcutExportClass.ExportName, Pointer(LShortcutExportClass));
    finally
      cbbExports.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmSearchRegisteredShortcuts.actExportExecute(Sender: TObject);
var
  LAtom: Atom;
  LVirtualKeyDetail: TVirtualKeyDetail;
  LExportData : Pointer;
  LFileName: string;
  LModifier: Integer;
  LSystemRepository: ISystemRepository;
  LModuleDetailArray : TArray<TModuleDetail>;
  LShiftState: TShiftState;
  LShortCut: TShortCut;
  LToolsApiRepository: IToolsApiRepository;
  LModuleDetail: TModuleDetail;
begin
  LSystemRepository := RepositoryFactory.SystemRepository;
  LToolsApiRepository := RepositoryFactory.ToolsApiRepository();

  if not Assigned(FCurrentShortcutExport) then
    Exit;

  if not LSystemRepository.GetSaveFileName(Self.Handle, FCurrentShortcutExport.FileExtension, LFileName) then
    Exit;

  if not FCurrentShortcutExport.InitialiseExport(LFileName, LExportData) then
    Exit;

  try
    LAtom := LSystemRepository.GlobalAddAtom(Self.ClassName);
    try
      pbProgressBar.Min := 0;
      pbProgressBar.Max := Length(TVirtualKeys);
      pbProgressBar.Position := pbProgressBar.Min;
      pbProgressBar.StepBy(1);
      pbProgressBar.Visible := True;

      FCurrentShortcutExport.StartHeader(LExportData);

      FCurrentShortcutExport.AddHeader(LExportData, 'Value/Constant');
      FCurrentShortcutExport.AddHeader(LExportData, 'Description');

      for LModifier in TModifterCheckingOrder do
      begin
        FCurrentShortcutExport.AddHeader(LExportData,  LSystemRepository.ModifiersToString(LModifier));
      end;

      FCurrentShortcutExport.EndHeader(LExportData);

      for LVirtualKeyDetail in TVirtualKeys do
      try
        if ((LVirtualKeyDetail.CheckedBy * [TCheck.Matrix]) = []) then
          Continue;

        FCurrentShortcutExport.StartKey(LExportData, LVirtualKeyDetail);

        for LModifier in TModifterCheckingOrder do
        begin
          FCurrentShortcutExport.StartKeyWithModifier(LExportData);

          if (LSystemRepository.IsHotKeyRegisteredByTheOperatingSystem(Self.Handle, LAtom, LModifier, LVirtualKeyDetail.Value)) then
          begin
            FCurrentShortcutExport.AddKeyWithModifierDetails(LExportData, 'OS Hotkey', TDetailsType.OperatingSystem);
          end;

          LShiftState := LSystemRepository.ModifiersToShiftState(LModifier);

          LShortCut := Vcl.Menus.ShortCut(LVirtualKeyDetail.Value, LShiftState);
          LModuleDetailArray := LToolsApiRepository.GetKeyboardBindingsDetails(LShortCut);
          for LModuleDetail in LModuleDetailArray do
          begin
            FCurrentShortcutExport.AddKeyWithModifierDetails(LExportData, LModuleDetail.GetDisplayText(), TDetailsType.IDE);
          end;

          FCurrentShortcutExport.EndKeyWithModifier(LExportData);
        end;

        FCurrentShortcutExport.EndKey(LExportData);
      finally
        pbProgressBar.StepIt;
        pbProgressBar.Repaint;
      end;
    finally
      LSystemRepository.GlobalDeleteAtom(LAtom);
      pbProgressBar.Visible := False;
    end;
  finally
    FCurrentShortcutExport.FinaliseExport(LExportData);

    if LSystemRepository.FileExists(LFileName) then
      LSystemRepository.ShellExecute(Self.Handle, 'open', PChar(LFileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TfrmSearchRegisteredShortcuts.actExportUpdate(Sender: TObject);
begin
  actExport.Enabled := Assigned(FCurrentShortcutExport);
end;

procedure TfrmSearchRegisteredShortcuts.ActionListChange(Sender: TObject);
var
  LShortcutExportClass : TShortcutExportClass;
begin
  FCurrentShortcutExport := nil;

  if (cbbExports.ItemIndex < 0) then
    Exit;

  LShortcutExportClass := TShortcutExportClass(cbbExports.Items.Objects[cbbExports.ItemIndex]);

  if not Assigned(LShortcutExportClass) then
    Exit;

  FCurrentShortcutExport := LShortcutExportClass.Create(RepositoryFactory);
end;

procedure TfrmSearchRegisteredShortcuts.ReadRegistrySettings(const ARegistryRepository: IRegistryRepository);
var
  lp: TColumnIndex;
  LVirtualTreeColumn: TVirtualTreeColumn;
begin
  inherited;
  for lp := 0 to vtShortCutModuleDetails.Header.Columns.Count - 1 do
  begin
    LVirtualTreeColumn := vtShortCutModuleDetails.Header.Columns.Items[lp];
    LVirtualTreeColumn.Width := ARegistryRepository.ReadInteger(cCOLUMN_REGISTRY_ENTRY_PREFIX + IntToStr(lp), LVirtualTreeColumn.Width);
  end;
end;

procedure TfrmSearchRegisteredShortcuts.WriteRegistrySettings(const ARegistryRepository: IRegistryRepository);
var
  lp: TColumnIndex;
  LVirtualTreeColumn: TVirtualTreeColumn;
begin
  inherited;
  for lp := 0 to vtShortCutModuleDetails.Header.Columns.Count - 1 do
  begin
    LVirtualTreeColumn := vtShortCutModuleDetails.Header.Columns.Items[lp];
    ARegistryRepository.WriteInteger(cCOLUMN_REGISTRY_ENTRY_PREFIX + IntToStr(lp), LVirtualTreeColumn.Width);
  end;
end;

procedure TfrmSearchRegisteredShortcuts.ModifyVirtualTree(const AProc: TProc);
begin
  vtShortCutModuleDetails.TreeOptions.MiscOptions := vtShortCutModuleDetails.TreeOptions.MiscOptions - [toReadOnly];
  try
    AProc();
  finally
    vtShortCutModuleDetails.TreeOptions.MiscOptions := vtShortCutModuleDetails.TreeOptions.MiscOptions + [toReadOnly];
  end;
end;

procedure TfrmSearchRegisteredShortcuts.hkAdvanceChange(Sender: TObject);
begin
  FindShortCutInformation();
end;

procedure TfrmSearchRegisteredShortcuts.FindShortCutInformation();
begin
  FModuleDetails := RepositoryFactory.ToolsApiRepository().GetKeyboardBindingsDetails(hkAdvance.HotKey);

  ModifyVirtualTree(procedure
                    begin
                      vtShortCutModuleDetails.RootNodeCount := 0;
                      vtShortCutModuleDetails.RootNodeCount := Length(FModuleDetails);
                    end);
end;

procedure TfrmSearchRegisteredShortcuts.FrameResize(Sender: TObject);
begin
  grpAdvanceFiltering.Width := grpAdvanceFiltering.Parent.Width shr 1;
end;

procedure TfrmSearchRegisteredShortcuts.vtShortCutModuleDetailsGetText(Sender: TBaseVirtualTree;
                                                                       Node: PVirtualNode;
                                                                       Column: TColumnIndex;
                                                                       TextType: TVSTTextType;
                                                                       var CellText: string);
var
  LKeyBindingRec: TKeyBindingRec;
  LModuleDetail : TModuleDetail;
begin
  CellText := '';

  if (not Assigned(Node.Parent)) or (Node.Parent = Sender.RootNode) then
  begin
    if (Column <> 0) then
      Exit;

    CellText := FModuleDetails[Node.Index].GetDisplayText();

    ModifyVirtualTree(procedure
                      var
                        LCount : Integer;
                      begin
                        LCount := 4;
                        if (FModuleDetails[Node.Index].FileVersionInformation.HasErrored) or
                           (FModuleDetails[Node.Index].FileVersionInformation.Count = 0) then
                          LCount := 3;

                        Sender.ChildCount[Node] := LCount;
                      end);
    Exit;
  end;

  if (Assigned(Node.Parent.Parent) and (Node.Parent.Parent <> Sender.RootNode)) then
  begin
    // Sub-items..
    LModuleDetail := FModuleDetails[Node.Parent.Parent.Index];
    LKeyBindingRec := LModuleDetail.KeyBindingRec;

    case Node.Parent.Index of
      2 :
        case Column of
          0 :
            case Node.Index of
              0 : CellText := 'KeyProc';
              1 : CellText := 'Context';
              2 : CellText := 'Next';
              3 : CellText := 'Reserved';
            end;
          1 :
            case Node.Index of
              0 : CellText := Format('$%p (Code: $%p, Data: $%p)', [@LKeyBindingRec.KeyProc, TMethod(LKeyBindingRec.KeyProc).Code, TMethod(LKeyBindingRec.KeyProc).Data]);
              1 : CellText := Format('$%p', [LKeyBindingRec.Context]);
              2 : CellText := Format('$%0:.8x (%0:d)', [LKeyBindingRec.Next]);
              3 : CellText := Format('$%0:.8x (%0:d)', [LKeyBindingRec.Reserved]);
            end;
        end;
      3 :
        case Column of
          0 : CellText := LModuleDetail.FileVersionInformation.FieldName[Node.Index];
          1 : CellText := LModuleDetail.FileVersionInformation.FieldValue[Node.Index];
        end;
    end;

    Exit;
  end;

  LModuleDetail := FModuleDetails[Node.Parent.Index];

  case Column of
    0 :
      case Node.Index of
        0 : CellText := 'Module';
        1 : CellText := 'Path';
        2 : CellText := 'Advance';
        3 : CellText := 'File Information';
      end;
    1 :
      case Node.Index of
        0 : CellText := LModuleDetail.Module;
        1 : CellText := LModuleDetail.Path;
        2 : ModifyVirtualTree(procedure
                              begin
                                Sender.ChildCount[Node] := 4;
                              end);
        3 : ModifyVirtualTree(procedure
                              begin
                                Sender.ChildCount[Node] := LModuleDetail.FileVersionInformation.Count;
                              end);
      end;
  end;
end;

end.


