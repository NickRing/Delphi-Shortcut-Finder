unit nick.shortcut.element.DocumentInsight3;

interface

implementation

uses
  nick.shortcut.repository.ShortCut,
  nick.shortcut.builder.IShortCutItem,
  nick.shortcut.builder.ShortCutItem,
  nick.shortcut.repository.IIniFile,
  nick.shortcut.element.DLLExpertBase,
  {$IFDEF VER220}
  Classes,
  Windows;
  {$ELSE}
  System.Classes,
  WinApi.Windows;
  {$ENDIF}

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
                        Result := RepositoryFactory().SystemRepository().TextToShortCut(LHotKeyString);
                      end;

  LIniFileName := LAppDataDirectory + 'DevJet\DocInsight\3.0\Settings.ini:HotKeys#';

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Documentation Inspector')
                                    .WithDescription('Documentation -> Documentation Inspector')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('D'), [ssShift, ssCtrl]))
                                    .IsINIFile()
                                    .WithFIleName(LIniFileName)
                                    .WithSection('HotKeys')
                                    .WithKey('DocInspector')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Documentation Explorer')
                                    .WithDescription('Documentation -> Documentation Explorer')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('N'), [ssCtrl, ssAlt]))
                                    .IsINIFile()
                                    .WithFIleName(LIniFileName)
                                    .WithSection('HotKeys')
                                    .WithKey('DocExplorer')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Fold Documentation')
                                    .WithDescription('Documentation -> Fold Documentation')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('C'), [ssCtrl, ssAlt]))
                                    .IsINIFile()
                                    .WithFIleName(LIniFileName)
                                    .WithSection('HotKeys')
                                    .WithKey('FoldDocs')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build();

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Unfold Documentation')
                                    .WithDescription('Documentation -> Unfold Documentation')
                                    .WithShortCut(SystemRepository().ShortCut(Ord('E'), [ssCtrl, ssAlt]))
                                    .IsINIFile()
                                    .WithFIleName(LIniFileName)
                                    .WithSection('HotKeys')
                                    .WithKey('UnfoldDocs')
                                    .WithDecoder(LShortCutDecoder)
                                    .Build();
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TDocumentInsight3Element);

end.
