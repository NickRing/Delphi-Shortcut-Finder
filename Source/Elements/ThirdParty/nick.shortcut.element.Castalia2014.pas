unit nick.shortcut.element.Castalia2014;

interface

implementation

uses
  nick.shortcut.repository.ShortCut,
  nick.shortcut.repository.IRegistry,
  nick.shortcut.builder.ShortCutItem,
  nick.shortcut.builder.IShortCutItem,
  nick.shortcut.element.PackageExpertBase,
  {$IFDEF VER220}
  SysUtils,
  Classes,
//  Menus,
  Windows;
  {$ELSE}
  System.SysUtils,
  System.Classes,
  Vcl.Menus,
  WinApi.Windows;
  {$ENDIF}

type
  TCastalia2014Element = class(TPackageExpertBaseElement)
  private
  protected
    procedure PopulateShortCuts(); override;
    function GetName() : string; override;
    function GetDescription() : string; override;
  public
    function IsUseable() : Boolean; override;
  end;

const
  cSOFTWARE_TWODESK_CASTALIA_OPTION = '\Software\TwoDesk\Castalia\Options2014';

function TCastalia2014Element.GetDescription: string;
begin
  Result := 'Castalia is for any programmer using the Delphi programming ' +
            'language. Castalia combines your best skills as a programmer ' +
            'with the best abilities of the computer to turn the Delphi code ' +
            'editor into an amazing, cutting-edge tool.' + System.sLineBreak +
            System.sLineBreak + 'http://twodesk.com/castalia/';
end;

function TCastalia2014Element.GetName: string;
begin
  Result := 'Castalia v2014';
end;

function TCastalia2014Element.IsUseable: Boolean;
var
  LPackageVersion: Integer;
  LRegistryRepository: IRegistryRepository;
begin
  Result := False;

  LRegistryRepository := RepositoryFactory().RegistryRepository();

  if not LRegistryRepository.OpenKeyReadOnly(cSOFTWARE_TWODESK_CASTALIA_OPTION) then
    Exit;

  try
    if not LRegistryRepository.ValueExists('About:Current Version') then
      Exit;

    if (Copy(LRegistryRepository.ReadString('About:Current Version'), 1, 5) <> '2014.') then
      Exit;

    // Descriptions            - Name
    // 'Castalia Essentials'   - CastaliaEssentials15.bpl
    // 'Castalia Professional' - CastaliaProfessional15.bpl
    // 'Castalia Suite'        - CastaliaSuite15.bpl

    LPackageVersion := RepositoryFactory().ToolsApiRepository().GetPackageVersion();

    Result := IsPackageLoaded(Format('CastaliaEssentials%d.bpl', [LPackageVersion])) or
              IsPackageLoaded(Format('CastaliaProfessional%d.bpl', [LPackageVersion])) or
              IsPackageLoaded(Format('CastaliaSuite%d.bpl', [LPackageVersion]));
  finally
    LRegistryRepository.CloseKey;
  end;
end;

procedure TCastalia2014Element.PopulateShortCuts;
var
  LShortCutDecoder : TRegistryDecoder<TShortCut>;
  LEnabledDecoder : TRegistryDecoder<Boolean>;
begin
  LEnabledDecoder := function(const ARegistryRepository : IRegistryRepository; const ASectionKey : string) : Boolean
                     begin
                       Result := (ARegistryRepository.ReadInteger(ASectionKey) <> 0);
                     end;

  LShortCutDecoder := function(const ARegistryRepository : IRegistryRepository; const ASectionKey : string) : TShortCut
                     begin
                       Result := ARegistryRepository.ReadInteger(ASectionKey);
                     end;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Multi Paste ShortCut')
                                    .WithDescription('Configuration: Options -> Clipboard' + System.sLineBreak +
                                                     'Activate: Castalia -> MultiPaste')
                                    .WithShortCut(scNone)
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Clipboard:Multipaste shortcut')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Template trigger')
                                    .WithDescription('Configuration: Options -> Code templates')
                                    .WithShortCut(SystemRepository().ShortCut(Ord(' '), []))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Code templates:Template trigger')
                                    .WithDecoder(LShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Code templates:Enable code templates')
                                    .WithDecoder(LEnabledDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Drop bookmark hotkey')
                                    .WithDescription('Configuration: Options -> Editor -> Bookmark Stack')
                                    .WithShortCut(SystemRepository().ShortCut(VK_F2, []))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Bookmark Stack:Drop bookmark hotkey')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Pick up bookmark hotkey')
                                    .WithDescription('Configuration: Options -> Editor -> Bookmark Stack')
                                    .WithShortCut(SystemRepository().ShortCut(VK_ESCAPE, []))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Bookmark Stack:Pick up bookmark hotkey')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Swap bookmark hotkey')
                                    .WithDescription('Configuration: Options -> Editor -> Bookmark Stack')
                                    .WithShortCut(SystemRepository().ShortCut(VK_ESCAPE, [ssShift]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Bookmark Stack:Swap bookmark hotkey')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Selection expansion hotkey')
                                    .WithDescription('Configuration: Options -> Editor -> Selection')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('W'), [ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Selection:Selection expansion hotkey')
                                    .WithDecoder(LShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Selection:Enable selection expansion')
                                    .WithDecoder(LEnabledDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Sync prototypes hotkey')
                                    .WithDescription('Configuration: Options -> Editor -> Sync prototypes')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('S'), [ssShift, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Sync prototypes:Sync prototypes hotkey')
                                    .WithDecoder(LShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Sync prototypes:Enable sync prototypes')
                                    .WithDecoder(LEnabledDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('(Find) Short Cut')
                                    .WithDescription('Configuration: Options -> Editor -> Text search')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('F'), [ssShift, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Text search:Shortcut')
                                    .WithDecoder(LShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Text search:Enable text search')
                                    .WithDecoder(LEnabledDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Enable smart surround')
                                    .WithDescription('If enabled, pressing the ( or [ keys with text selected in the code editor will surround that text with (..) or [..], respectively.')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('('), []))
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Smart keys:Enable smart surround')
                                    .WithDecoder(LEnabledDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Enable smart Home key')
                                    .WithDescription('If enabled, pressing the Home key in the code editor will toggle the location of the cursor between the beginning of the line and the beginning of the text on the line (after whitespace).')
                                    .WithShortCut(SystemRepository().ShortCut(VK_HOME, []))
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Smart keys:Enable smart Home key')
                                    .WithDecoder(LEnabledDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Enable smart Tab key')
                                    .WithDescription('If enabled, pressing the Tab key with text selected in the code editor will indent that text. ' +
                              'Pressing Shift+Tab with text selected will "unindent" the text. The number of spaces to ' +
                              'indent/unindent is determined by the code editor''s "Block Indent" setting.')
                                    .WithShortCut(SystemRepository().ShortCut(VK_TAB, []))
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Smart keys:Enable smart Tab key')
                                    .WithDecoder(LEnabledDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Enable smart Slash key')
                                    .WithDescription('If enabled, pressing the / key with text selected in the code editor will comment out that text using //-style comments. If the text is already commented out, it will be uncommented.')
                                    .WithShortCut(SystemRepository().ShortCut({/}VK_OEM_2, []))
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Editor.Smart keys:Enable smart slash key')
                                    .WithDecoder(LEnabledDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Used units')
                                    .WithDescription('Configuration: Options -> Editor -> Navigation tools -> Keyboard shortcuts')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('U'), [ssAlt, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Navigation tools.Keyboard shortcuts')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Used sections')
                                    .WithDescription('Configuration: Options -> Editor -> Navigation tools -> Keyboard shortcuts')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('S'), [ssAlt, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Navigation tools.Keyboard shortcuts:Unit sections')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Class list')
                                    .WithDescription('Configuration: Options -> Editor -> Navigation tools -> Keyboard shortcuts')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('C'), [ssAlt, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Navigation tools.Keyboard shortcuts:Class list')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Procedure list')
                                    .WithDescription('Configuration: Options -> Editor -> Navigation tools -> Keyboard shortcuts')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('P'), [ssAlt, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Navigation tools.Keyboard shortcuts:Procedure list')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Forward bookmark')
                                    .WithDescription('Configuration: Options -> Editor -> Navigation tools -> Keyboard shortcuts')
                                    .WithShortCut(SystemRepository().ShortCut(VK_RIGHT, [ssAlt, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Navigation tools.Keyboard shortcuts:Forward bookmark')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Backward bookmark')
                                    .WithDescription('Configuration: Options -> Editor -> Navigation tools -> Keyboard shortcuts')
                                    .WithShortCut(SystemRepository().ShortCut(VK_LEFT, [ssAlt, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Navigation tools.Keyboard shortcuts:Backward bookmark')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Smart symbol search')
                                    .WithDescription('Configuration: Options -> Editor -> Navigation tools -> Keyboard shortcuts')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('N'), [ssAlt, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Navigation tools.Keyboard shortcuts:Smart symbol search')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Refactoring hotkey')
                                    .WithDescription('Configuration: Options -> Refactoring')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('R'), [ssAlt, ssCtrl]))
                                    .IsRegistry()
                                    .WithPath(cSOFTWARE_TWODESK_CASTALIA_OPTION)
                                    .WithKey('Refactoring:Refactoring hotkey')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build;
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TCastalia2014Element);

end.
