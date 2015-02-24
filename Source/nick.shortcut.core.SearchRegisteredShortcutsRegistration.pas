unit nick.shortcut.core.SearchRegisteredShortcutsRegistration;

interface

procedure Register;

implementation

uses
  ToolsApi,
  Vcl.Forms,
  System.SysUtils,
  Vcl.Controls,
  nick.shortcut.frame.SearchRegisteredShortcuts,
  nick.shortcut.core.ShortCutFinderRegistration,
  nick.shortcut.factory.Repository;

type
  TSearchRegisteredShortcutsRegistration = class(TInterfacedObject, INTAAddInOptions)
  public
    { INTAAddInOptions }
    function GetArea: string;
    function GetCaption: string;
    function GetFrameClass: TCustomFrameClass;
    procedure FrameCreated(AFrame: TCustomFrame);
    procedure DialogClosed(Accepted: Boolean);
    function ValidateContents: Boolean;
    function GetHelpContext: Integer;
    function IncludeInIDEInsight: Boolean;
  end;

const
  cCAPTION = 'Search Registered Shortcuts';

var
  FSearchRegisteredShortcutsRegistration : TSearchRegisteredShortcutsRegistration = nil;

procedure Register;
var
  LNTAEnvironmentOptionsServices : INTAEnvironmentOptionsServices;
begin
  if not System.SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAEnvironmentOptionsServices, LNTAEnvironmentOptionsServices) then
    Exit;

  FSearchRegisteredShortcutsRegistration := TSearchRegisteredShortcutsRegistration.Create;
  LNTAEnvironmentOptionsServices.RegisterAddInOptions(FSearchRegisteredShortcutsRegistration);
end;

{ TDelphiKeyAllocations }

{$REGION 'INTAAddInOptions'}
procedure TSearchRegisteredShortcutsRegistration.DialogClosed(Accepted: Boolean);
begin
  // Do nothing / Do not care about it
end;

procedure TSearchRegisteredShortcutsRegistration.FrameCreated(AFrame: TCustomFrame);
var
  LFrame : TFrame;
begin
  LFrame := TfrmSearchRegisteredShortcuts.Create(AFrame, TRepositoryFactory.New());
  LFrame.Align       := alClient;
  LFrame.Parent      := AFrame;
  LFrame.Visible     := True;
end;

function TSearchRegisteredShortcutsRegistration.GetArea: string;
begin
  Result := '';
end;

function TSearchRegisteredShortcutsRegistration.GetCaption: string;
begin
  Result := nick.shortcut.core.ShortCutFinderRegistration.cCAPTION + '.' + cCAPTION;
end;

function TSearchRegisteredShortcutsRegistration.GetFrameClass: TCustomFrameClass;
begin
  Result := TFrame;
end;

function TSearchRegisteredShortcutsRegistration.GetHelpContext: Integer;
begin
  Result := 0;
end;

function TSearchRegisteredShortcutsRegistration.IncludeInIDEInsight: Boolean;
begin
  Result := True;
end;

function TSearchRegisteredShortcutsRegistration.ValidateContents: Boolean;
begin
  Result := True;
end;
{$ENDREGION}

procedure UnregisterOptionPage;
var
  LNTAEnvironmentOptionsServices : INTAEnvironmentOptionsServices;
begin
  if Assigned(FSearchRegisteredShortcutsRegistration) then
  begin
    if not System.SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAEnvironmentOptionsServices, LNTAEnvironmentOptionsServices) then
      Exit;

    LNTAEnvironmentOptionsServices.UnregisterAddInOptions(FSearchRegisteredShortcutsRegistration);
  end;
end;

initialization

finalization
  UnregisterOptionPage();

end.

