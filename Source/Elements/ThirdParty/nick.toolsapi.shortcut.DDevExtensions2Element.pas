unit nick.toolsapi.shortcut.DDevExtensions2Element;

interface

uses
  nick.toolsapi.shortcut.DLLExpertBaseElement,
  Windows;

type
  TDDevExtensions2Element = class(TDLLExpertBaseElement)
  private
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
  nick.toolsapi.shortcut.ShortCutRepository,
  nick.toolsapi.shortcut.IShortCutItemBuilder,
  nick.toolsapi.shortcut.ShortCutItemBuilder,
  nick.toolsapi.shortcut.IRegistryRepository,
  nick.toolsapi.shortcut.INodeXml,
  SysUtils,
  Menus,
  Classes;

{ TDDevExtensions2Element }

function TDDevExtensions2Element.GetDescription: string;
begin
  Result := 'DDevExtensions extends the Delphi/C++Builder IDE by adding some ' +
     'new productivity features.' + System.sLineBreak + System.sLineBreak +
     'http://andy.jgknet.de/blog/ide-tools/ddevextensions/';
end;

function TDDevExtensions2Element.GetName: string;
begin
  Result := 'DDevExtensions v2';
end;

function TDDevExtensions2Element.IsUseable: Boolean;
begin
  Result := CheckForExpertDLL('DDevExtensions');
end;

function TDDevExtensions2Element.IsVersionAllowed(const AVSFixedFileInfo: TVSFixedFileInfo): Boolean;
begin
  Result := (HiWord(AVSFixedFileInfo.dwFileVersionMS) = 2) (*and
            (LoWord(AVSFixedFileInfo.dwFileVersionMS) = 8)*);
end;

procedure TDDevExtensions2Element.PopulateShortCuts;
var
  LAppDataDirectory: string;
  LPackageVersion: Integer;
  LRegistryKey: string;
  LRegistryShortCutDecoder : TRegistryDecoder<TShortCut>;
  LRegistryEnabledDecoder : TRegistryDecoder<Boolean>;
  LXmlShortCutDecoder : TXmlDecoder<TShortCut>;
  LXmlEnabledDecoder : TXmlDecoder<Boolean>;
  LXmlFileName: string;
begin
  LRegistryShortCutDecoder := function(const ARegistryRepository : IRegistryRepository; const ASectionKey : string) : TShortCut
                              begin
                                Result := scNone;
                                if (ARegistryRepository.ValueExists(ASectionKey)) then
                                  Result := ARegistryRepository.ReadInteger(ASectionKey);
                              end;

  LRegistryEnabledDecoder := function(const ARegistryRepository : IRegistryRepository; const ASectionKey : string) : Boolean
                             var
                               LBytes: TArray<Byte>;
                               LToolBarDataSize: Integer;
                             begin
                               Result := False;
                               if (ARegistryRepository.ValueExists(ASectionKey)) then
                               begin
                                 LToolBarDataSize := ARegistryRepository.GetDataSize(ASectionKey);
                                 SetLength(LBytes, LToolBarDataSize);
                                 ARegistryRepository.ReadBinaryData(ASectionKey, Pointer(LBytes)^, LToolBarDataSize);
                                 Result := (LBytes[Length(LBytes) - 1] <> 0);
                               end;
                             end;

  LXmlShortCutDecoder := function(const ANodeXml : INodeXml) : TShortCut
                        var
                          LAttributeNode : INodeXml;
                        begin
                          Result := scNone;
                          if not Assigned(ANodeXml) then
                            Exit;

                          LAttributeNode := ANodeXml.FindAttribute('Value');
                          if Assigned(LAttributeNode) then
                            Result := StrToIntDef(LAttributeNode.NodeValue, scNone);
                         end;

  LXmlEnabledDecoder := function(const ANodeXml : INodeXml) : Boolean
                        var
                          LAttributeNode : INodeXml;
                        begin
                          Result := False;
                          if not Assigned(ANodeXml) then
                            Exit;

                          LAttributeNode := ANodeXml.FindAttribute('Value');
                          if Assigned(LAttributeNode) then
                            Result := StrToBoolDef(LAttributeNode.NodeValue, False);
                        end;

  LPackageVersion := RepositoryFactory().ToolsApiRepository().GetPackageVersion();

  LRegistryKey := '\Software\DelphiTools\DDevExtensions\' + IntToStr(LPackageVersion) + '\ComponentSelector';

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Component Selector')
                                            .WithDescription('Component Selector')
                                            .WithShortCut(scNone)
                                            .IsRegistry()
                                            .WithPath(LRegistryKey)
                                            .WithKey('Hotkey')
                                            .WithDecoder(LRegistryShortCutDecoder)
                                            .WithActiveState(False)
                                            .IsRegistry()
                                            .WithPath(LRegistryKey)
                                            .WithKey('Toolbar')
                                            .WithDecoder(LRegistryEnabledDecoder)
                                            .Build();

  if not (RepositoryFactory().SystemRepository().GetAppDataDirectory(LAppDataDirectory)) then
    Exit;

  LXmlFileName := LAppDataDirectory + 'DDevExtensions\DDevExtensions' + IntToStr(LPackageVersion) + '.xml';

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Extended IDE Settings')
                                            .WithShortCut(scNone)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'DSUFeatures', 'StructureViewSearchHotKey'])
                                            .WithDecoder(LXmlShortCutDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Find Unit/Use Unit')
                                            .WithShortCut(scNone)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'UnitSelector', 'FindUseUnitHotKey'])
                                            .WithDecoder(LXmlShortCutDecoder)
                                            .WithActiveState(True)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'UnitSelector', 'ReplaceUseUnit'])
                                            .WithDecoder(LXmlEnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Indent text block with Tab')
                                            .WithShortCut(Menus.ShortCut(VK_TAB, []))
                                            .WithActiveState(True)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'KeyBindings', 'TabIndent'])
                                            .WithDecoder(LXmlEnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Extended Home')
                                            .WithShortCut(Menus.ShortCut(VK_HOME, []))
                                            .WithActiveState(True)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'KeyBindings', 'ExtendedHome'])
                                            .WithDecoder(LXmlEnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Extended Ctrl-Left')
                                            .WithShortCut(Menus.ShortCut(VK_LEFT, [ssCtrl]))
                                            .WithActiveState(False)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'KeyBindings', 'ExtendedCtrlLeftRight'])
                                            .WithDecoder(LXmlEnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Extended Ctrl-Right')
                                            .WithShortCut(Menus.ShortCut(VK_RIGHT, [ssCtrl]))
                                            .WithActiveState(False)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'KeyBindings', 'ExtendedCtrlLeftRight'])
                                            .WithDecoder(LXmlEnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Shift-Ctrl-Alt-Up move line/block')
                                            .WithShortCut(Menus.ShortCut(VK_UP, [ssShift, ssAlt, ssCtrl]))
                                            .WithActiveState(True)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'KeyBindings', 'MoveLineBlock'])
                                            .WithDecoder(LXmlEnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Shift-Ctrl-Alt-Down move line/block')
                                            .WithShortCut(Menus.ShortCut(VK_DOWN, [ssShift, ssAlt, ssCtrl]))
                                            .WithActiveState(True)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'KeyBindings', 'MoveLineBlock'])
                                            .WithDecoder(LXmlEnabledDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Find declaration on Ctrl-Alt-PgUp')
                                            .WithShortCut(Menus.ShortCut(VK_PRIOR, [ssAlt, ssCtrl]))
                                            .WithActiveState(True)
                                            .IsXMLFile()
                                            .WithFileName(LXmlFileName)
                                            .WithPath(['DDevExtensions', 'KeyBindings', 'FindDeclOnCaret'])
                                            .WithDecoder(LXmlEnabledDecoder)
                                            .Build();
end;

initialization
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TDDevExtensions2Element);

end.

