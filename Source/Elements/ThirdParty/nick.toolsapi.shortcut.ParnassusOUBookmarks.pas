unit nick.toolsapi.shortcut.ParnassusOUBookmarks;

interface

uses
  nick.toolsapi.shortcut.DLLExpertBaseElement,
  Windows;

type
  TParnassusOUBookmarks = class(TDLLExpertBaseElement)
  private
  protected
    function IsVersionAllowed(const AVSFixedFileInfo : TVSFixedFileInfo) : Boolean; override;
    procedure PopulateShortCuts(); override;
    function GetName() : string; override;
    function GetDescription() : string; override;
  public
    function IsUseable() : Boolean; override;
  end;

implementation

uses
  nick.toolsapi.shortcut.ShortCutItemBuilder,
  nick.toolsapi.shortcut.ShortCutRepository,
  IOUtils,
  Menus,
  Classes;

{ TParnassusOUBookmarks }

function TParnassusOUBookmarks.GetDescription: string;
begin
  Result := 'Parnassus Bookmarks replaces the IDE’s inbuilt functionality with ' +
            'new, improved navigation. Place a marker with Ctrl+B – a number ' +
            'will be automatically assigned. Jump between bookmarks by pressing ' +
            'Ctrl+Alt+Left or Right Arrow. Never overwrite an existing bookmark ' +
            'accidentally. And the polished interface – suitable for a modern IDE – ' +
            'features elegant visual cues when you create, delete, or access a ' +
            'bookmark as well as succinct information about where in a unit the ' +
            'bookmark is.' + System.sLineBreak + System.sLineBreak +
            'http://parnassus.co/delphi-tools/bookmarks/';
end;

function TParnassusOUBookmarks.GetName: string;
begin
  Result := 'Parnassus OU Bookmarks';
end;

function TParnassusOUBookmarks.IsUseable: Boolean;
begin
  Result := CheckForExpertDLL('ParnassusBookmarks');
end;

function TParnassusOUBookmarks.IsVersionAllowed(const AVSFixedFileInfo: TVSFixedFileInfo): Boolean;
begin
  Result := True;
end;

procedure TParnassusOUBookmarks.PopulateShortCuts;
var
  LChr : char;
begin
  // Descriptions taken from http://parnassus.co/delphi-tools/bookmarks-documentation/

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Drop/remove a bookmark')
                                            .WithDescription('To add a bookmark, press Ctrl+B (for Bookmark.) ' +
                                                             'A bookmark will be automatically added at the ' +
                                                             'current line. You will see a small visual ' +
                                                             'animation indicating the location of the new bookmark.')
                                            .WithShortCut(Menus.ShortCut(Ord('B'), [ssCtrl]))
                                            .Build;

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Drop/remove a temporary bookmark')
                                            .WithDescription('To add a temporary bookmark, press Ctrl+Shift+B. Just ' +
                                                             'like normal bookmarks, only one exists per line, so ' +
                                                             'remove one by placing the cursor on the line and pressing ' +
                                                             'Ctrl+Shift+B again.')
                                            .WithShortCut(Menus.ShortCut(Ord('B'), [ssCtrl, ssShift]))
                                            .Build;

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Goto and remove last temporary bookmark')
                                            .WithDescription('Temporary bookmarks are navigated to in time order. To ' +
                                                             'jump back to the last placed temporary bookmark, press ' +
                                                             'Escape. This navigates to the bookmark’s location – ' +
                                                             'both line and character – and removes the bookmark. You ' +
                                                             'can place an infinite number of temporary bookmarks and ' +
                                                             'press Escape to go back in time to each one.')
                                            .WithShortCut(Menus.ShortCut(VK_ESCAPE, []))
                                            .Build;

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Goto and remove last temporary bookmark, while adding a current temporary bookmark')
                                            .WithDescription('If you want to toggle quickly between locations, ' +
                                                             'mark the first with Ctrl+Shift+B. At the second ' +
                                                             'location, when you want to return to the first, ' +
                                                             'press Shift+Escape. This navigates back, but ' +
                                                             'places a marker where you were. This means that ' +
                                                             'pressing Shift+Escape repeatedly will toggle ' +
                                                             'back and forth between two places.')
                                            .WithShortCut(Menus.ShortCut(VK_ESCAPE, [ssShift]))
                                            .Build;

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Previous bookmark')
                                            .WithDescription('Moves to the closest bookmarks before ' +
                                                             'the current line. In other words, press one of ' +
                                                             'these to cycle forwards or backwards through all ' +
                                                             'bookmarks in the current file. These cycle by file ' +
                                                             'location, not by bookmark number, and are useful ' +
                                                             'if you can’t remember a bookmark number, or if ' +
                                                             'you want to examine each area you tagged.')
                                            .WithShortCut(Menus.ShortCut(VK_LEFT, [ssCtrl, ssAlt]))
                                            .Build;

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                            .WithDetail('Next bookmark')
                                            .WithDescription('Moves to the closest bookmarks after ' +
                                                             'the current line. In other words, press one of ' +
                                                             'these to cycle forwards or backwards through all ' +
                                                             'bookmarks in the current file. These cycle by file ' +
                                                             'location, not by bookmark number, and are useful ' +
                                                             'if you can’t remember a bookmark number, or if ' +
                                                             'you want to examine each area you tagged.')
                                            .WithShortCut(Menus.ShortCut(VK_RIGHT, [ssCtrl, ssAlt]))
                                            .Build;

  for LChr := '0' to '9' do
  begin
    nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                              .WithDetail('Create/removes bookmark ' + LChr)
                                              .WithDescription('Adds a bookmark at the current line, with ' +
                                                               'the specified number. If the bookmark already ' +
                                                               'exists, a small animation will show the ' +
                                                               'current location and it will not be changed. ' +
                                                               'Press the shortcut again quickly to move ' +
                                                               'the bookmark to the current line.')
                                              .WithShortCut(Menus.ShortCut(Ord(LChr), [ssCtrl, ssShift]))
                                              .Build;

    nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
                                              .WithDetail('Goto/Jump to bookmark ' + LChr)
                                              .WithDescription('Move to the specified bookmark. The cursor ' +
                                                               'will be moved to the beginning of that line, ' +
                                                               'and the line made visible onscreen.')
                                              .WithShortCut(Menus.ShortCut(Ord(LChr), [ssCtrl]))
                                              .Build;
  end;
end;

initialization
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TParnassusOUBookmarks);

end.

