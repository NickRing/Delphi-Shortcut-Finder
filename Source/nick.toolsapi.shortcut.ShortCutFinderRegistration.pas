unit nick.toolsapi.shortcut.ShortCutFinderRegistration;

interface

procedure Register;

implementation

uses
  ToolsApi,
  Forms,
  SysUtils,
  nick.toolsapi.shortcut.ShortCutKeyAllocationFrame;

type
  TDelphiShortCutFinderRegistration = class(TInterfacedObject, INTAAddInOptions)
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
  //cVERSION = 'version 0.01 alpha';
  //cMENU_ID_STRING = 'Delphi ShortCut Key Allocations';
  cCAPTION = 'ShortCut Finder';

var
  FDelphiShortCutFinderRegistration : TDelphiShortCutFinderRegistration = nil;

procedure Register;
var
  LNTAEnvironmentOptionsServices : INTAEnvironmentOptionsServices;
begin
  FDelphiShortCutFinderRegistration := TDelphiShortCutFinderRegistration.Create;

  if not SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAEnvironmentOptionsServices, LNTAEnvironmentOptionsServices) then
    Exit;

  LNTAEnvironmentOptionsServices.RegisterAddInOptions(FDelphiShortCutFinderRegistration);
end;

{ TDelphiKeyAllocations }

{$REGION 'INTAAddInOptions'}
procedure TDelphiShortCutFinderRegistration.DialogClosed(Accepted: Boolean);
begin
  // Do nothing / Do not care about it
end;

procedure TDelphiShortCutFinderRegistration.FrameCreated(AFrame: TCustomFrame);
begin
  // Do nothing
end;

function TDelphiShortCutFinderRegistration.GetArea: string;
begin
  Result := '';
end;

function TDelphiShortCutFinderRegistration.GetCaption: string;
begin
  Result := cCAPTION;
end;

function TDelphiShortCutFinderRegistration.GetFrameClass: TCustomFrameClass;
begin
  Result := TfrmShortCutKeyAllocation;
end;

function TDelphiShortCutFinderRegistration.GetHelpContext: Integer;
begin
  Result := -1;
end;

function TDelphiShortCutFinderRegistration.IncludeInIDEInsight: Boolean;
begin
  Result := True;
end;

function TDelphiShortCutFinderRegistration.ValidateContents: Boolean;
begin
  Result := True;
end;
{$ENDREGION}

procedure UnregisterOptionPage;
var
  LNTAEnvironmentOptionsServices : INTAEnvironmentOptionsServices;
begin
  if Assigned(FDelphiShortCutFinderRegistration) then
  begin
    if not SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAEnvironmentOptionsServices, LNTAEnvironmentOptionsServices) then
      Exit;

    LNTAEnvironmentOptionsServices.UnregisterAddInOptions(FDelphiShortCutFinderRegistration);
  end;
end;

initialization

finalization
  UnregisterOptionPage();

end.

