unit nick.shortcut.core.ShortCutFinderRegistration;

interface

procedure Register;

const
  cCAPTION = 'Delphi Shortcut Finder';

{$R ShortcutFinderImages.res}

implementation

uses
  ToolsApi,
  {$IFDEF VER220}
  Forms,
  SysUtils,
  Controls,
  Menus,
  ActnList,
  Windows,
  {$ELSE}
  Vcl.Forms,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Menus,
  Vcl.ActnList,
  Winapi.Windows,
  {$ENDIF}
  nick.shortcut.frame.ShortCutKeyAllocation,
  nick.shortcut.factory.Repository;

type
  TDelphiShortCutFinderRegistration = class(TNotifierObject, (*INTAAddInOptions, *)IOTAWizard(*, IOTAMenuWizard*))
  private
    FAddPluginInfoIndex: Integer;
    FAboutboxSplashScreenIcon : HBITMAP;
    FPluginSplashScreenIcon : HBITMAP;

    FExplorerAction: TAction;
    FExplorerMenuItem: TMenuItem;
    procedure ShowDelphiShortCutFinder(Sender : TObject);
  public
    constructor Create;
    destructor Destroy; override;

    { IOTAWizard }
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;

    { IOTAMenuWizard }
    //function GetMenuText: string;
  end;

const
  cIDE_TOOLS = 'IDE Tools';
  //cVERSION = 'version 0.01 alpha';
  //cMENU_ID_STRING = 'Delphi ShortCut Key Allocations';
  cMENU_TEXT = cCAPTION;

procedure Register;
begin
  RegisterPackageWizard(TDelphiShortCutFinderRegistration.Create);
end;

{ TDelphiKeyAllocations }

constructor TDelphiShortCutFinderRegistration.Create;
const
  cSHORTCUT_FINDER_ICON = 'SHORTCUT_FINDER_ICON';
var
  LOTAAboutBoxServices : IOTAAboutBoxServices;
  LNTAServices: INTAServices;
  LMainMenu: TMainMenu;
  LMenuItem: TMenuItem;
  lp: Integer;
  lp2: Integer;
  LParentMenu: TMenuItem;
begin
  inherited Create;

  FPluginSplashScreenIcon := LoadBitmap(HInstance, cSHORTCUT_FINDER_ICON);
  SplashScreenServices.AddPluginBitmap('Delphi Shortcut Finder', FPluginSplashScreenIcon, False, 'Freeware');

  {$IFDEF VER220}
  if SysUtils.Supports(ToolsAPI.BorlandIDEServices, IOTAAboutBoxServices, LOTAAboutBoxServices) then
  {$ELSE}
  if System.SysUtils.Supports(ToolsAPI.BorlandIDEServices, IOTAAboutBoxServices, LOTAAboutBoxServices) then
  {$ENDIF}
  begin
    if (FAboutboxSplashScreenIcon = 0) then
      FAboutboxSplashScreenIcon := LoadBitmap(HInstance, cSHORTCUT_FINDER_ICON);

    FAddPluginInfoIndex := LOTAAboutBoxServices.AddPluginInfo(cCAPTION,
                                                              'Finds registered and conflicting shortcuts',
                                                              FAboutboxSplashScreenIcon,
                                                              False,
                                                              'Freeware',
                                                              '');
  end;

  {$IFDEF VER220}
  if not SysUtils.Supports(BorlandIDEServices, INTAServices, LNTAServices) then
    Exit;
  {$ELSE}
  if not System.SysUtils.Supports(BorlandIDEServices, INTAServices, LNTAServices) then
    Exit;
  {$ENDIF}

  FExplorerAction := TAction.Create(nil);
  FExplorerAction.ActionList := LNTAServices.ActionList;
  FExplorerAction.Caption := GetName;
  FExplorerAction.Hint := 'Show the Delphi Shortcut Finder window';
  FExplorerAction.OnExecute := ShowDelphiShortCutFinder;

  LMainMenu := LNTAServices.MainMenu;
  for lp := 0 to LMainMenu.Items.Count - 1 do
  begin
    LMenuItem := LMainMenu.Items[lp];
    if not SameText(LMenuItem.Name, 'ToolsMenu') then
      Continue;

    LParentMenu := LMenuItem.Find(cIDE_TOOLS);

    if not Assigned(LParentMenu) then
    begin
      LParentMenu := TMenuItem.Create(LMenuItem);
      LParentMenu.Caption := cIDE_TOOLS;

      for lp2 := 0 to LMenuItem.Count - 1 do
      begin
        if (not LMenuItem.Items[lp2].IsLine) then
          Continue;

        LMenuItem.Insert(lp2 + 1, LParentMenu);
        LMenuItem.InsertNewLineAfter(LParentMenu);
        Break;
      end;
    end;

    FExplorerMenuItem := TMenuItem.Create(LMainMenu);
    FExplorerMenuItem.Action := FExplorerAction;
    LParentMenu.Insert(0, FExplorerMenuItem);

    Break;
  end;
end;

destructor TDelphiShortCutFinderRegistration.Destroy;
var
  LOTAAboutBoxServices : IOTAAboutBoxServices;
  LParentMenuItem: TMenuItem;
begin
  if (FAddPluginInfoIndex <> 0) then
  begin
  {$IFDEF VER220}
    if SysUtils.Supports(ToolsAPI.BorlandIDEServices, IOTAAboutBoxServices, LOTAAboutBoxServices) then
      LOTAAboutBoxServices.RemovePluginInfo(FAddPluginInfoIndex);
  {$ELSE}
    if System.SysUtils.Supports(ToolsAPI.BorlandIDEServices, IOTAAboutBoxServices, LOTAAboutBoxServices) then
      LOTAAboutBoxServices.RemovePluginInfo(FAddPluginInfoIndex);
  {$ENDIF}
  end;

  FAddPluginInfoIndex := 0;

  if Assigned(FExplorerMenuItem) then
  begin
    LParentMenuItem := FExplorerMenuItem.Parent;
    FExplorerMenuItem.Free;

    if (LParentMenuItem.Count = 0) then
      LParentMenuItem.Free;
  end;

  FExplorerAction.Free;

  inherited;
end;

{$REGION 'IOTAWizard'}
function TDelphiShortCutFinderRegistration.GetIDString: string;
begin
  Result := 'nick.toolsapi.shortcut.ShortCutFinder';
end;

function TDelphiShortCutFinderRegistration.GetName: string;
begin
  Result := cCAPTION;
end;

function TDelphiShortCutFinderRegistration.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TDelphiShortCutFinderRegistration.ShowDelphiShortCutFinder(Sender: TObject);
begin
  Execute;
end;

procedure TDelphiShortCutFinderRegistration.Execute;
var
  LForm : TForm;
  LFrame : TFrame;
begin
  LForm := TForm.Create(nil);
  try
    LForm.Caption := cCAPTION;
    LForm.BorderIcons := [biSystemMenu];

    LFrame := TfrmShortCutKeyAllocation.Create(LForm, TRepositoryFactory.New());

    LForm.ClientWidth := LFrame.Width;
    LForm.ClientHeight := LFrame.Height;

    LFrame.Parent := LForm;
    LFrame.Align := alClient;

    LForm.Position := poOwnerFormCenter;
//    LForm.PopupParent := Application.MainForm;

    LForm.ShowModal;
  finally
    LForm.Free;
  end;
end;
{$ENDREGION}

{$REGION 'IOTAMenuWizard'}
//function TDelphiShortCutFinderRegistration.GetMenuText: string;
//begin
//  Result := cMENU_TEXT;
//end;
{$ENDREGION}

end.

