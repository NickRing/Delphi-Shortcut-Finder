unit nick.shortcut.core.KnownShortcutsRegistration;

interface

procedure Register;

implementation

uses
  ToolsApi,
  {$IFDEF VER220}
  Forms,
  SysUtils,
  Controls,
  {$ELSE}
  Vcl.Forms,
  System.SysUtils,
  Vcl.Controls,
  {$ENDIF}
  nick.shortcut.frame.KnownShortcuts,
  nick.shortcut.core.ShortCutFinderRegistration,
  nick.shortcut.factory.Repository,
  nick.shortcut.repository.ShortCut;

type
  TKnownShortcutsRegistration = class(TInterfacedObject, INTAAddInOptions)
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
  cCAPTION = 'Known Shortcuts';

var
  FKnownShortcutsRegistration : TKnownShortcutsRegistration = nil;

procedure Register;
var
  LNTAEnvironmentOptionsServices : INTAEnvironmentOptionsServices;
begin
  {$IFDEF VER220}
  if not SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAEnvironmentOptionsServices, LNTAEnvironmentOptionsServices) then
    Exit;
  {$ELSE}
  if not System.SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAEnvironmentOptionsServices, LNTAEnvironmentOptionsServices) then
    Exit;
  {$ENDIF}

  FKnownShortcutsRegistration := TKnownShortcutsRegistration.Create;
  LNTAEnvironmentOptionsServices.RegisterAddInOptions(FKnownShortcutsRegistration);
end;

{ TDelphiKeyAllocations }

{$REGION 'INTAAddInOptions'}
procedure TKnownShortcutsRegistration.DialogClosed(Accepted: Boolean);
begin
  // Do nothing / Do not care about it
end;

procedure TKnownShortcutsRegistration.FrameCreated(AFrame: TCustomFrame);
var
  LFrame : TFrame;
begin
  LFrame := TfrmKnownShortcuts.Create(AFrame, TRepositoryFactory.New(), nick.shortcut.repository.ShortCut.GetShortCutRepository());
  LFrame.Align       := alClient;
  LFrame.Parent      := AFrame;
  LFrame.Visible     := True;
end;

function TKnownShortcutsRegistration.GetArea: string;
begin
  Result := '';
end;

function TKnownShortcutsRegistration.GetCaption: string;
begin
  Result := nick.shortcut.core.ShortCutFinderRegistration.cCAPTION + '.' + cCAPTION;
end;

function TKnownShortcutsRegistration.GetFrameClass: TCustomFrameClass;
begin
  Result := TFrame;
end;

function TKnownShortcutsRegistration.GetHelpContext: Integer;
begin
  Result := 0;
end;

function TKnownShortcutsRegistration.IncludeInIDEInsight: Boolean;
begin
  Result := True;
end;

function TKnownShortcutsRegistration.ValidateContents: Boolean;
begin
  Result := True;
end;
{$ENDREGION}

procedure UnregisterOptionPage;
var
  LNTAEnvironmentOptionsServices : INTAEnvironmentOptionsServices;
begin
  if Assigned(FKnownShortcutsRegistration) then
  begin
    {$IFDEF VER220}
    if not SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAEnvironmentOptionsServices, LNTAEnvironmentOptionsServices) then
      Exit;
    {$ELSE}
    if not System.SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAEnvironmentOptionsServices, LNTAEnvironmentOptionsServices) then
      Exit;
    {$ENDIF}

    LNTAEnvironmentOptionsServices.UnregisterAddInOptions(FKnownShortcutsRegistration);
  end;
end;

initialization

finalization
  UnregisterOptionPage();

end.

