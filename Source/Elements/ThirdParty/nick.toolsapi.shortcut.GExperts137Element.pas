unit nick.toolsapi.shortcut.GExperts137Element;

interface

uses
  nick.toolsapi.shortcut.DLLExpertBaseElement,
  nick.toolsapi.shortcut.IRegistryRepository,
  Classes,
  Windows;

type
  TGExperts137Element = class(TDLLExpertBaseElement)
  private
    function ShortCutDecoder(const ARegistryRepository : IRegistryRepository; const ASectionKey : string) : TShortCut;
    function EnabledDecoder(const ARegistryRepository : IRegistryRepository; const ASectionKey : string) : Boolean;
    procedure CheckEditorExperts(const ABaseRegistryKey: string; const AMenuPrefix: string);
    procedure CheckTemplateShortCuts(const ABaseRegistryKey: string; const AMenuPrefix: string);
  protected
    procedure PopulateShortCuts(); override;
    function GetName() : string; override;
    function IsVersionAllowed(const AVSFixedFileInfo : TVSFixedFileInfo) : Boolean; override;
    function GetDescription() : string; override;
  public
    function IsUseable() : Boolean; override;
  end;

implementation

uses
  nick.toolsapi.shortcut.ShortCutItemBuilder,
  nick.toolsapi.shortcut.ShortCutRepository,
  nick.toolsapi.shortcut.IXmlFileRepository,
  nick.toolsapi.shortcut.INodeXml,
  nick.toolsapi.shortcut.ShortCutItem,
  Menus,
  SysUtils,
  IOUtils;

procedure TGExperts137Element.CheckTemplateShortCuts(const ABaseRegistryKey: string; const AMenuPrefix: string);
const
  cCONFIG_PATH = 'ConfigPath';
var
  LChildNode: INodeXml;
  LConfigFileName: string;
  LDescAttribute: INodeXml;
  LNodeXml: INodeXml;
  LDescription: string;
  LInteger: Integer;
  LMacroName: string;
  LNameAttribute: INodeXml;
  lp: Integer;
  LRegistryRepository: IRegistryRepository;
  LShortCutAttribute: INodeXml;
  LShortCut: TShortCut;
  LXmlFileRepository : IXmlFileRepository;
begin
  LRegistryRepository := RepositoryFactory().RegistryRepository();

  if (not LRegistryRepository.OpenKeyReadOnly(ABaseRegistryKey + 'Misc')) or
     (not LRegistryRepository.ValueExists(cCONFIG_PATH)) then
  begin
    Exit;
  end;

  LConfigFileName := SysUtils.IncludeTrailingPathDelimiter(LRegistryRepository.ReadString(cCONFIG_PATH)) + 'MacroTemplates.xml';

  if (not TFile.Exists(LConfigFileName)) then
    Exit;

  LXmlFileRepository := RepositoryFactory().XmlFileRepository();

  LXmlFileRepository.OpenFile(LConfigFileName);

  try
    LXmlFileRepository.Active(True);
  except
    // If any errors are raised while parsing the XML, then abort this process.
    Exit;
  end;

  LNodeXml := LXmlFileRepository.GetRootNode;
  if not Assigned(LNodeXml) then
    Exit;

  LNodeXml := LNodeXml.GetNode('Templates');

  for lp  := 0 to LNodeXml.ChildNodesCount - 1 do
  begin
    LChildNode := LNodeXml.ChildNode(lp);

    LShortCutAttribute := LChildNode.FindAttribute('Shortcut');
    if (not Assigned(LShortCutAttribute)) then
      Continue;

    if (TryStrToInt(LShortCutAttribute.NodeValue, LInteger)) then
      LShortCut := LInteger
    else
      LShortCut := Menus.TextToShortCut(LShortCutAttribute.NodeValue);

    LNameAttribute := LChildNode.FindAttribute('Name');

    if (not Assigned(LNameAttribute)) then
      LMacroName := 'Unknown'
    else
      LMacroName := LNameAttribute.NodeValue;

    LDescription := '';
    LDescAttribute := LChildNode.FindAttribute('Desc');
    if (Assigned(LDescAttribute)) then
      LDescription := LDescAttribute.NodeValue;

    Add(NewShortCut('Macro: ' + LMacroName, LShortCut, scNone, LDescription));
  end;
end;

function TGExperts137Element.EnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean;
begin
  Result := Boolean(StrToIntDef(ARegistryRepository.ReadString(ASectionKey), Integer(False)));
end;

function TGExperts137Element.ShortCutDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): TShortCut;
begin
  Result := ARegistryRepository.ReadInteger(ASectionKey);
end;

function TGExperts137Element.GetDescription: string;
begin
  Result := 'GExperts is a free set of tools built to increase the productivity ' +
     'of Delphi and C++Builder programmers by adding several features to the ' +
     'IDE.  GExperts is developed as Open Source software and we encourage user ' +
     'contributions to the project.' + System.sLineBreak + System.sLineBreak +
     'http://www.gexperts.org/';
end;

procedure TGExperts137Element.CheckEditorExperts(const ABaseRegistryKey: string; const AMenuPrefix: string);
const
  cEDITOR_EXPERT = 'Editor Expert: ';
  cSHORTCUT = ':ShortCut';
var
  LEnabledRegistryKey: string;
begin
  LEnabledRegistryKey := ABaseRegistryKey + 'EditorExperts\';

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Align Lines')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(Ord('Z'), [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'Align')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Change Case')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(Ord('C'), [ssShift, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'ChangeCase')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Comment Code')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut({.}VK_OEM_PERIOD, [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'Comment')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Uncomment Code')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut({,}VK_OEM_COMMA, [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'UnComment')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Sort Selected Lines')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'SortLines')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Insert Date/Time')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(Ord('A'), [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'DateTime')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Move to Matching Delimiter')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(VK_RIGHT, [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'MoveToDelimiter')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Locate Matching Delimiter')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(VK_LEFT, [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'LocateDelimiter')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Previous Identifier Reference')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(VK_UP, [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'PreviousIdent')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Next Identifier Reference')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(VK_DOWN, [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'NextIdent')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  (*ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Quote String')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(VK_SINGLEQUOTE, [ssCtrl]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'Quote')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(LShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(LEnabledDecoder)
                                            .Build();*)

  (*ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Unquote String')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(VK_SINGLEQUOTE, [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'Unquote')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(LShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(LEnabledDecoder)
                                            .Build();*)

  (*ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Copy Unquoted String')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'CopyUnquoted')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(LShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(LEnabledDecoder)
                                            .Build();*)

  (*ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Paste Quoted String')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'PasteQuoted')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(LShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(LEnabledDecoder)
                                            .Build();*)

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Reverse Statement')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(Ord('R'), [ssAlt, ssShift]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'ReverseStatement')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Select Identifier')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(Ord('I'), [ssShift, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'SelectIdent')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Uses Clause Manager')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(Ord('U'), [ssShift, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'UsesClauseMgr')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail(cEDITOR_EXPERT + 'Expand Macro Template')
                                            .WithDescription(AMenuPrefix + 'GExperts -> Configuration... -> [Editor Experts]')
                                            .WithShortCut(Menus.ShortCut(Ord('T'), [ssShift, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(ABaseRegistryKey + 'MacroTemplates\Common')
                                            .WithKey(cSHORTCUT)
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  CheckTemplateShortCuts(ABaseRegistryKey, AMenuPrefix);
end;

function TGExperts137Element.GetName: string;
begin
  Result := 'Gexperts 1.3';
end;

function TGExperts137Element.IsUseable: Boolean;
begin
  Result := CheckForExpertDLL('GExperts');
end;

function TGExperts137Element.IsVersionAllowed(const AVSFixedFileInfo: TVSFixedFileInfo): Boolean;
begin
  Result := (HiWord(AVSFixedFileInfo.dwFileVersionMS) = 1) (*and
            (LoWord(AVSFixedFileInfo.dwFileVersionMS) = 3)*);
end;

procedure TGExperts137Element.PopulateShortCuts;
var
  LBaseRegistryKey: string;
  LEnabledRegistryKey: string;
  LMenuPrefix: string;
  LRegistryRepository: IRegistryRepository;
  LShortCutRegistryKey: string;
begin
  if not RepositoryFactory().ToolsApiRepository().GetBaseRegistryKey(LBaseRegistryKey) then
    Exit;

  LBaseRegistryKey := LBaseRegistryKey + '\GExperts-1.3\';

  LEnabledRegistryKey := LBaseRegistryKey + 'EnabledExperts';
  LShortCutRegistryKey := LBaseRegistryKey + 'ExpertShortcuts';

  LMenuPrefix := '';

  LRegistryRepository := RepositoryFactory().RegistryRepository();

  if (LRegistryRepository.OpenKeyReadOnly(LBaseRegistryKey + 'Misc')) and
     (LRegistryRepository.ValueExists('PlaceGxMainMenuInToolsMenu')) and
     (Boolean(StrToIntDef(LRegistryRepository.ReadString('PlaceGxMainMenuInToolsMenu'), Integer(False)))) then
  begin
    LMenuPrefix := 'Tools -> ';
  end;

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('ASCII Chart')
                                            .WithDescription(LMenuPrefix + 'GExperts -> ASCII Chart')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ASCIIChart')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ASCIIChart')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Backup Project...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Backup Project...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('BackupProject')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('BackupProject')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Components to Code')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Components to Code')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ComponentsToCode')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ComponentsToCode')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Expert Manager...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Expert Manager...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ExpertManager')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ExpertManager')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Grep Search...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Grep Search...')
                                            .WithShortCut(Menus.ShortCut(Ord('S'), [ssAlt, ssShift]))
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('GrepSearch')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('GrepSearch')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('IDE Menu Shortcuts...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> IDE Menu Shortcuts...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('IDEMenuShortCuts')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('IDEMenuShortCuts')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Message Dialog...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Message Dialog...')
                                            .WithShortCut(Menus.ShortCut(Ord('D'), [ssCtrl, ssShift]))
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('MessageDialog')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('MessageDialog')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Procedure List...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Procedure List...')
                                            .WithShortCut(Menus.ShortCut(Ord('G'), [ssCtrl]))
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ProcedureList')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ProcedureList')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Source Export...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Source Export...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('SourceExport')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('SourceExport')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Class Browser')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Class Browser')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ClassBrowser')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ClassBrowser')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Clean Directories...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Clean Directories...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('CleanDirectories')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('CleanDirectories')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Clipboard History')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Clipboard History')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ClipboardHistory')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ClipboardHistory')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Code Librarian')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Code Librarian')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('CodeLibrarian')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('CodeLibrarian')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Code Proofreader...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Code Proofreader...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('CodeProofreader')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('CodeProofreader')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Component Grid...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Component Grid...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ComponentGrid')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ComponentGrid')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Copy Component Names')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Copy Component Names')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('CopyComponentNames')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('CopyComponentNames')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Editor Experts')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Editor Experts')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('EditorExpertsMenu')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();
  CheckEditorExperts(LBaseRegistryKey, LMenuPrefix);

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Favorite Files')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Favorite Files')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('FavoriteFiles')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('FavoriteFiles')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Find Component Reference')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Find Component Reference')
                                            .WithShortCut(Menus.ShortCut(Ord('F'), [ssShift, ssCtrl]))
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('FindComponentReference')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('FindComponentReference')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Grep Results')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Grep Results')
                                            .WithShortCut(Menus.ShortCut(Ord('R'), [ssCtrl, ssAlt]))
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('GrepResults')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('GrepResults')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Hide/Show Non-Visual')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Hide/Show Non-Visual')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('HideComponents')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('HideComponents')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Macro Library')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Macro Library')
                                            .WithShortCut(Menus.ShortCut(Ord('R'), [ssCtrl, ssShift]))
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('MacroLibrary')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('MacroLibrary')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Open File')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Open File')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('OpenFile')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('OpenFile')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('PE Information')
                                            .WithDescription(LMenuPrefix + 'GExperts -> PE Information')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('PEInformation')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('PEInformation')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Perfect Layout')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Perfect Layout')
                                            .WithShortCut(Menus.ShortCut(Ord('L'), [ssCtrl, ssShift]))
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('PerfectLayout')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(False)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('PerfectLayout')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Project Dependencies')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Project Dependencies')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ProjectDependencies')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ProjectDependencies')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Project Option Sets')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Project Option Sets')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ProjOptionSets')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ProjOptionSets')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Rename Components...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Rename Components...')
                                            .WithShortCut(Menus.ShortCut(VK_F2, [ssShift]))
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('RenameComponents')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('RenameComponents')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Replace Components...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Replace Components...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ReplaceComponents')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ReplaceComponents')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  (*ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Select Components...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Select Components...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('SelectComponents')
                                            .WithDecoder(LShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('SelectComponents')
                                            .WithDecoder(LEnabledDecoder)
                                            .Build();*)

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Set FocusControl')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Set FocusControl')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('SetFocusControl')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('SetFocusControl')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Set Component Properties...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Set Component Properties...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('SetComponentProperties')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(False)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('SetComponentProperties')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Set Tab Order...')
                                            .WithDescription(LMenuPrefix + 'GExperts -> Set Tab Order...')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('SetTabOrder')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('SetTabOrder')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('To Do List')
                                            .WithDescription(LMenuPrefix + 'GExperts -> To Do List')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LShortCutRegistryKey)
                                            .WithKey('ToDoList')
                                            .WithDecoder(ShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsRegistry()
                                            .WithPath(LEnabledRegistryKey)
                                            .WithKey('ToDoList')
                                            .WithDecoder(EnabledDecoder)
                                            .Build();
end;

initialization
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TGExperts137Element);

end.
