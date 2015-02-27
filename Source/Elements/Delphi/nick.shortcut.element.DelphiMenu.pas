unit nick.shortcut.element.DelphiMenu;

interface

implementation

uses
  nick.shortcut.core.ShortCutItem,
  nick.shortcut.repository.ShortCut,
  nick.shortcut.core.ShortCutList,
  {$IFDEF VER220}
  Classes,
  Menus;
  {$ELSE}
  System.Classes,
  Vcl.Menus;
  {$ENDIF}

type
  TDelphiMenuElement = class(TShortCutList)
  private
    procedure IterateMenus(const AMenu : TMenuItem; const AMenuPath : string);
  protected
    procedure PopulateShortCuts(); override;
    function GetName() : string; override;
  public
    function IsUseable() : Boolean; override;
  end;

function TDelphiMenuElement.GetName: string;
begin
  Result := 'Delphi Menu';
end;

function TDelphiMenuElement.IsUseable: Boolean;
begin
  Result := True;
end;

procedure TDelphiMenuElement.IterateMenus(const AMenu: TMenuItem; const AMenuPath : string);
var
  LMenuItem : TMenuItem;
  LMenuCaption: string;
  LMenuPath: string;
begin
  LMenuCaption := StripHotkey(AMenu.Caption);
  if (AMenuPath <> '') then
    LMenuPath := AMenuPath + ' -> ' + LMenuCaption
  else
    LMenuPath := LMenuCaption;

  if (AMenu.ShortCut <> 0) then
    Add(NewShortCut(LMenuCaption, AMenu.ShortCut, scNone, LMenuPath));

  for LMenuItem in AMenu do
    IterateMenus(LMenuItem, LMenuPath);
end;

procedure TDelphiMenuElement.PopulateShortCuts();
var
  LMainMenu: TMainMenu;
begin
  LMainMenu := RepositoryFactory().ToolsApiRepository().GetMainMenu();

  if Assigned(LMainMenu) then
    IterateMenus(LMainMenu.Items, '');
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TDelphiMenuElement);

end.

