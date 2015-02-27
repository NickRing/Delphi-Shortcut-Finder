unit nick.shortcut.element.XExPlusPack;

interface

implementation

uses
  nick.shortcut.builder.ShortCutItem,
  nick.shortcut.builder.IShortCutItem,
  nick.shortcut.repository.ShortCut,
  nick.shortcut.repository.IToolsApi,
  nick.shortcut.element.DLLExpertBase,
  nick.shortcut.repository.IRegistry,
  {$IFDEF VER220}
  Menus,
  SysUtils,
  Classes,
  Windows;
  {$ELSE}
  Vcl.Menus,
  System.SysUtils,
  System.Classes,
  Winapi.Windows;
  {$ENDIF}

type
  TXExPlusPackElement = class(TDLLExpertBaseElement)
  private
    function ShortCutDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): TShortCut; inline;
    function StructurePaneEnhancementsShortCutDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): TShortCut; inline;
    function ActivateProjectEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean; inline;
    function BookmarkGuideEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean; inline;
    function VisualFormsEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean; inline;
    function WatchPropertyGroupEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean; inline;
    function StructurePaneEnhancementsEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean; inline;
  protected
    procedure PopulateShortCuts(); override;
    function GetName() : string; override;
    function IsVersionAllowed(const AVSFixedFileInfo : TVSFixedFileInfo) : Boolean; override;
    function GetDescription() : string; override;
  public
    function IsUseable() : Boolean; override;
  end;

{ TXExPlusPackElement }

function TXExPlusPackElement.GetDescription: string;
begin
  Result := 'An evolving collection of IDE Experts, Component Editors, ' +
            'Property Editors and Utilities for new Delphi releases.' + System.sLineBreak + System.sLineBreak +
            'http://jed-software.com/xepp.htm';
end;

function TXExPlusPackElement.GetName: string;
begin
  Result := 'XE Plus Pack';
end;

function TXExPlusPackElement.IsUseable: Boolean;
var
  LToolsApiRepository: IToolsApiRepository;
begin
  LToolsApiRepository := RepositoryFactory().ToolsApiRepository();

  Result := CheckForExpertDLL('JED Software - ' + LToolsApiRepository.GetIDEName + ' Plus Pack');
end;

function TXExPlusPackElement.IsVersionAllowed(const AVSFixedFileInfo: TVSFixedFileInfo): Boolean;
begin
  Result := True; // Unsure about version numbers, so allow all :-D
end;

function TXExPlusPackElement.ActivateProjectEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean;
var
  LEnabledString: string;
begin
  LEnabledString := ARegistryRepository.ReadString(ASectionKey);
  Result := (Copy(LEnabledString, 1, 1) = '1');
end;

function TXExPlusPackElement.BookmarkGuideEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean;
var
  LEnabledString: string;
begin
  LEnabledString := ARegistryRepository.ReadString(ASectionKey);
  Result := (Copy(LEnabledString, 7, 1) = '1');
end;

function TXExPlusPackElement.ShortCutDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): TShortCut;
var
  LHotKeyString: string;
begin
  LHotKeyString := ARegistryRepository.ReadString(ASectionKey);
  Result := TextToShortCut(LHotKeyString);
end;

function TXExPlusPackElement.StructurePaneEnhancementsEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean;
var
  LEnabledString: string;
begin
  LEnabledString := ARegistryRepository.ReadString(ASectionKey);
  Result := (Copy(LEnabledString, 10, 1) = '1');
end;

function TXExPlusPackElement.StructurePaneEnhancementsShortCutDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): TShortCut;
var
  LAlt: string;
  LCntrl: string;
  LKey: string;
  LShift: string;
  LShiftState: TShiftState;
begin
  LKey := ARegistryRepository.ReadString('KeyCode');
  LShift := ARegistryRepository.ReadString('Shift');
  LCntrl := ARegistryRepository.ReadString('Ctrl');
  LAlt := ARegistryRepository.ReadString('Alt');

  LShiftState := [];
  if (LShift = '1') then
    Include(LShiftState, ssShift);
  if (LCntrl = '1') then
    Include(LShiftState, ssCtrl);
  if (LAlt = '1') then
    Include(LShiftState, ssAlt);
  if (Length(LKey) = 0) then
    Exit(scNone);

  {$IFDEF VER220}
  Result := Menus.ShortCut(Ord(LKey[1]), LShiftState);
  {$ELSE}
  Result := SystemRepository().ShortCut(Ord(LKey[1]), LShiftState);
  {$ENDIF}
end;

function TXExPlusPackElement.VisualFormsEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean;
var
  LEnabledString: string;
begin
  LEnabledString := ARegistryRepository.ReadString(ASectionKey);
  Result := (Copy(LEnabledString, 4, 1) = '1');
end;

function TXExPlusPackElement.WatchPropertyGroupEnabledDecoder(const ARegistryRepository: IRegistryRepository; const ASectionKey: string): Boolean;
var
  LEnabledString: string;
begin
  LEnabledString := ARegistryRepository.ReadString(ASectionKey);
  Result := (Copy(LEnabledString, 12, 1) = '1');
end;

procedure TXExPlusPackElement.PopulateShortCuts;
var
  LBaseRegistryKey: string;
  LChr: Char;
  LIdeName: string;
  LPlusPackPath : string;
  LToolsApiRepository: IToolsApiRepository;
begin
  LToolsApiRepository := RepositoryFactory().ToolsApiRepository();

  if not LToolsApiRepository.GetBaseRegistryKey(LBaseRegistryKey) then
    Exit;

  LBaseRegistryKey := LBaseRegistryKey + '\JED Software\';
  LIdeName := LToolsApiRepository.GetIDEName();
  LPlusPackPath := LBaseRegistryKey + LIdeName + ' Plus Pack\';

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Activate Project')
                                    .WithDescription('Tools -> Options... -> Third Party -> JED Software -> Active Project -> Keys -> Active Project -> Show dialog')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('A'), [ssCtrl, ssAlt]))
                                    .IsRegistry()
                                    .WithPath(LBaseRegistryKey + 'Activate Project\Keys')
                                    .WithKey('Activate')
                                    .WithDecoder(ShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath)
                                    .WithKey('enabled')
                                    .WithDecoder(ActivateProjectEnabledDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Activate Project:Show And Select Next')
                                    .WithDescription('Tools -> Options... -> Third Party -> JED Software -> Active Project -> Keys -> Active Project -> Switch Project -> Show And Select Next' + System.sLineBreak + 'http://www.jed-software.com/help/ActivateProject/ActivateProject.html')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('D'), [ssCtrl, ssShift, ssAlt]))
                                    .IsRegistry()
                                    .WithPath(LBaseRegistryKey + 'Activate Project\Keys')
                                    .WithKey('Switch')
                                    .WithDecoder(ShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath)
                                    .WithKey('enabled')
                                    .WithDecoder(ActivateProjectEnabledDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Activate Project:Select Prior')
                                    .WithDescription('Tools -> Options... -> Third Party -> JED Software -> Active Project -> Keys -> Active Project -> Switch Project -> Select Prior' + System.sLineBreak + 'http://www.jed-software.com/help/ActivateProject/ActivateProject.html')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('F'), [ssCtrl, ssShift, ssAlt]))
                                    .IsRegistry()
                                    .WithPath(LBaseRegistryKey + 'Activate Project\Keys')
                                    .WithKey('Switch Prior')
                                    .WithDecoder(ShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath)
                                    .WithKey('enabled')
                                    .WithDecoder(ActivateProjectEnabledDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Activate Project:Create Project Preview')
                                    .WithDescription('Tools -> Options... -> Third Party -> JED Software -> Active Project -> Keys -> Active Project -> Create Project Preview -> Create Preview' + System.sLineBreak + 'http://www.jed-software.com/help/ActivateProject/ActivateProject.html')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('S'), [ssCtrl, ssShift, ssAlt]))
                                    .IsRegistry()
                                    .WithPath(LBaseRegistryKey + 'Activate Project\Keys')
                                    .WithKey('Create Preview')
                                    .WithDecoder(ShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath)
                                    .WithKey('enabled')
                                    .WithDecoder(ActivateProjectEnabledDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Bookmark Guide:Menu Short Cut')
                                    .WithDescription('Tools -> Options... -> Third Party -> JED Software -> Active Project -> Keys -> Bookmark Guide -> Menu Short Cut' + System.sLineBreak + 'http://www.jed-software.com/help/BookmarkGuide/BookmarkGuide.html')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('B'), [ssCtrl, ssShift, ssAlt]))
                                    .IsRegistry()
                                    .WithPath(LBaseRegistryKey + 'Bookmark Guide\General')
                                    .WithKey('ShortCut')
                                    .WithDecoder(ShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath)
                                    .WithKey('enabled')
                                    .WithDecoder(BookmarkGuideEnabledDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Bookmark Guide:Floating Viewer Short Cut')
                                    .WithDescription('Tools -> Options... -> Third Party -> JED Software -> Active Project -> Keys -> Bookmark Guide -> Floating Viewer Short Cut' + System.sLineBreak + 'http://www.jed-software.com/help/BookmarkGuide/BookmarkGuide.html')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('B'), [ssCtrl, ssAlt]))
                                    .IsRegistry()
                                    .WithPath(LBaseRegistryKey + 'Bookmark Guide\General')
                                    .WithKey('FloatingShortCut')
                                    .WithDecoder(ShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath)
                                    .WithKey('enabled')
                                    .WithDecoder(BookmarkGuideEnabledDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Visual Forms')
                                    .WithDescription('http://www.jed-software.com/help/VisualForms/VisualForms.html')
                                    .WithShortCut(SystemRepository().ShortCut(VK_F12, [ssCtrl, ssShift]))
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath)
                                    .WithKey('enabled')
                                    .WithDecoder(VisualFormsEnabledDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Watch Property Group')
                                    .WithDescription(' View -> Debug Windows -> Watch Property Group' + System.sLineBreak + 'http://www.jed-software.com/help/WatchPropertyGroup/WatchPropertyGroup.html')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('W'), [ssCtrl, ssShift]))
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath)
                                    .WithKey('enabled')
                                    .WithDecoder(WatchPropertyGroupEnabledDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Structure Pane Enhancements')
                                    .WithDescription('Tools -> Options... -> Third Party -> JED Software -> ' + LIdeName + ' Plus Pack -> Structure Pane Enhancements' + System.sLineBreak + 'http://www.jed-software.com/help/StructurePane/StructurePane.html')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('S'), [ssCtrl, ssShift, ssAlt]))
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath + 'Structure View')
                                    .WithKey('KeyCode')
                                    .WithDecoder(StructurePaneEnhancementsShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(LPlusPackPath)
                                    .WithKey('enabled')
                                    .WithDecoder(StructurePaneEnhancementsEnabledDecoder)
                                    .Build();


  for LChr := '0' to '9' do
  begin
    nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                      .WithDetail('Create/removes bookmark ' + LChr)
                                      .WithDescription('Adds a bookmark at the current line, with ' +
                                                       'the specified number. If the bookmark already ' +
                                                       'exists, a small animation will show the ' +
                                                       'current location and it will not be changed. ' +
                                                       'Press the shortcut again quickly to move ' +
                                                       'the bookmark to the current line.')
                                      .WithShortCut(SystemRepository().ShortCut(Ord(LChr), [ssCtrl, ssShift]))
                                      .WithActiveState(True)
                                      .IsRegistry()
                                      .WithPath(LPlusPackPath)
                                      .WithKey('enabled')
                                      .WithDecoder(BookmarkGuideEnabledDecoder)
                                      .Build;

    nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                      .WithDetail('Goto/Jump to bookmark ' + LChr)
                                      .WithDescription('Move to the specified bookmark. The cursor ' +
                                                       'will be moved to the beginning of that line, ' +
                                                       'and the line made visible onscreen.')
                                      .WithShortCut(SystemRepository().ShortCut(Ord(LChr), [ssCtrl]))
                                      .WithActiveState(True)
                                      .IsRegistry()
                                      .WithPath(LPlusPackPath)
                                      .WithKey('enabled')
                                      .WithDecoder(BookmarkGuideEnabledDecoder)
                                      .Build;
  end;


end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TXExPlusPackElement);

end.

