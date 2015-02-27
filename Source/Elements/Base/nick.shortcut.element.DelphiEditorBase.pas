unit nick.shortcut.element.DelphiEditorBase;

interface

uses
  nick.shortcut.core.ShortCutList,
  nick.shortcut.core.ShortCutItem;

type
  TDelphiEditorBaseElement = class abstract(TShortCutList)
  private
    FCtrlAltKeysInUse: Boolean;
    procedure SetCtrlAltKeysInUse();
  protected
    function GetSpeedSetting : string; virtual; abstract;

    procedure PopulateShortCuts(); override;
    procedure Populate(); virtual; abstract;

    procedure AddShortCut(const AShortCut : IShortCutItem);
    function GetName() : string; override;
    property CtrlAltKeysInUse : Boolean read FCtrlAltKeysInUse;
  public
    function IsUseable() : Boolean; override;
  end;

implementation

uses
  {$IFDEF VER220}
  SysUtils,
  Classes,
  {$ELSE}
  System.SysUtils,
  System.Classes,
  {$ENDIF}
  nick.shortcut.repository.IRegistry;

function TDelphiEditorBaseElement.GetName: string;
begin
  Result := 'Delphi Editor : ';
end;

function TDelphiEditorBaseElement.IsUseable: Boolean;
var
  LBaseRegistryKey: string;
  LEditorSpeedSetting: string;
  LRegistryRepository : IRegistryRepository;
begin
  Result := False;

  if not RepositoryFactory().ToolsApiRepository().GetBaseRegistryKey(LBaseRegistryKey) then
    Exit;

  LRegistryRepository := RepositoryFactory().RegistryRepository();

  if not LRegistryRepository.OpenKeyReadOnly(LBaseRegistryKey + '\Editor\Options\') then
    Exit;

  try
    LEditorSpeedSetting := LRegistryRepository.ReadString('Editor SpeedSetting');

    Result := SameText(LEditorSpeedSetting, GetSpeedSetting());
  finally
    LRegistryRepository.CloseKey;
  end;
end;

procedure TDelphiEditorBaseElement.PopulateShortCuts;
begin
  SetCtrlAltKeysInUse();
  Populate;
end;

procedure TDelphiEditorBaseElement.AddShortCut(const AShortCut: IShortCutItem);
const
  scCtrlAlt = scCtrl or scAlt;
begin
  if (not FCtrlAltKeysInUse) and
     ((AShortCut.Primary and scCtrlAlt) = scCtrlAlt) then
  begin
    Exit;
  end;

  inherited Add(AShortCut);
end;

procedure TDelphiEditorBaseElement.SetCtrlAltKeysInUse;
var
  LBaseRegistryKey: string;
  LRegistryRepository: IRegistryRepository;
  LUseCtrlAltKeys: string;
begin
  FCtrlAltKeysInUse := False;

  if not RepositoryFactory().ToolsApiRepository().GetBaseRegistryKey(LBaseRegistryKey) then
    Exit;

  LRegistryRepository := RepositoryFactory().RegistryRepository();

  if not LRegistryRepository.OpenKeyReadOnly(LBaseRegistryKey + '\Editor\Options\') then
    Exit;

  try
    LUseCtrlAltKeys := LRegistryRepository.ReadString('Use CtrlAlt Keys');

    {$IFDEF VER220}
    FCtrlAltKeysInUse := SysUtils.StrToBoolDef(LUseCtrlAltKeys, False);
    {$ELSE}
    FCtrlAltKeysInUse := System.SysUtils.StrToBoolDef(LUseCtrlAltKeys, False);
    {$ENDIF}
  finally
    LRegistryRepository.CloseKey;
  end;
end;

end.
