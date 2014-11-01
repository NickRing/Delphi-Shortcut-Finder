unit nick.toolsapi.shortcut.DocumentInsight3Element;

interface

uses
  nick.toolsapi.shortcut.DLLExpertBaseElement,
  Windows;

type
  TDocumentInsight3Element = class(TDLLExpertBaseElement)
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
  nick.toolsapi.shortcut.IIniFileRepository,
  Classes,
  Menus;

{ TDocumentInsight3Element }

function TDocumentInsight3Element.GetDescription: string;
begin
  Result := 'Documentation Insight integrates into RAD Studio IDE to enable you ' +
     'naturally browse and document source code. It also helps you to produce ' +
     'professional API documentation files and deliver to your customers.' +
     System.sLineBreak + System.sLineBreak +
     'http://www.devjetsoftware.com/products/documentation-insight/';
end;

function TDocumentInsight3Element.GetName: string;
begin
  Result := 'Document Insight 3';
end;

function TDocumentInsight3Element.IsUseable: Boolean;
begin
  Result := CheckForExpertDLL('Documentation Insight');
end;

function TDocumentInsight3Element.IsVersionAllowed(const AVSFixedFileInfo: TVSFixedFileInfo): Boolean;
begin
  Result := (HiWord(AVSFixedFileInfo.dwFileVersionMS) = 3) and
            (LoWord(AVSFixedFileInfo.dwFileVersionMS) = 1);
end;

procedure TDocumentInsight3Element.PopulateShortCuts;
var
  LAppDataDirectory: string;
  LIniFileName: string;
  LShortCutDecoder : TIniDecoder<TShortCut>;
begin
  if not RepositoryFactory().SystemRepository.GetAppDataDirectory(LAppDataDirectory) then
    Exit;

  LShortCutDecoder := function(const AIniFileRepository : IIniFileRepository; const ASectionKey : string; const AKey : string) : TShortCut
                      var
                        LHotKeyString: string;
                      begin
                        LHotKeyString := AIniFileRepository.ReadString(ASectionKey, AKey, '');
                        Result := TextToShortCut(LHotKeyString);
                      end;

  LIniFileName := LAppDataDirectory + 'DevJet\DocInsight\3.0\Settings.ini:HotKeys#';

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Documentation Inspector')
                                            .WithDescription('Documentation -> Documentation Inspector')
                                            .WithShortCut(Menus.ShortCut(Ord('D'), [ssShift, ssCtrl]))
                                            .IsINIFile()
                                            .WithFIleName(LIniFileName)
                                            .WithSection('HotKeys')
                                            .WithKey('DocInspector')
                                            .WithDecoder(LShortCutDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Documentation Explorer')
                                            .WithDescription('Documentation -> Documentation Explorer')
                                            .WithShortCut(Menus.ShortCut(Ord('N'), [ssCtrl, ssAlt]))
                                            .IsINIFile()
                                            .WithFIleName(LIniFileName)
                                            .WithSection('HotKeys')
                                            .WithKey('DocExplorer')
                                            .WithDecoder(LShortCutDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Fold Documentation')
                                            .WithDescription('Documentation -> Fold Documentation')
                                            .WithShortCut(Menus.ShortCut(Ord('C'), [ssCtrl, ssAlt]))
                                            .IsINIFile()
                                            .WithFIleName(LIniFileName)
                                            .WithSection('HotKeys')
                                            .WithKey('FoldDocs')
                                            .WithDecoder(LShortCutDecoder)
                                            .Build();

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Unfold Documentation')
                                            .WithDescription('Documentation -> Unfold Documentation')
                                            .WithShortCut(Menus.ShortCut(Ord('E'), [ssCtrl, ssAlt]))
                                            .IsINIFile()
                                            .WithFIleName(LIniFileName)
                                            .WithSection('HotKeys')
                                            .WithKey('UnfoldDocs')
                                            .WithDecoder(LShortCutDecoder)
                                            .Build();
end;

initialization
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TDocumentInsight3Element);

end.
