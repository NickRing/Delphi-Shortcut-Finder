unit nick.shortcut.repository.Registry;

interface

uses
  nick.shortcut.repository.IRegistry,
  {$IFDEF VER220}
  Registry;
  {$ELSE}
  System.Win.Registry;
  {$ENDIF}

type
  TRegistryRepository = class(TInterfacedObject, IRegistryRepository)
  private
    FRegistry : TRegistry;
  public
    constructor Create(const AAccess: LongWord); overload;
    constructor Create(); overload;
    destructor Destroy; override;

    procedure CloseKey;
    procedure SetAccess(const AAccess : LongWord);
    function OpenKeyReadOnly(const AKey: String): Boolean;
    function OpenKey(const AKey: String; const ACanCreate : Boolean): Boolean;

    function ValueExists(const ASection : string) : Boolean;
    function GetDataSize(const ASection : string) : Integer;

    function ReadString(const AName: string): string;
    function ReadBool(const ASection : string) : Boolean;
    function ReadInteger(const ASection : string) : Integer; overload;
    function ReadInteger(const ASection : string; const ADefault : Integer) : Integer; overload;
    function ReadBinaryData(const AKeyName: string; var ABuffer; ABufferSize: Integer): Integer;

    procedure WriteInteger(const ASection : string; const AValue : Integer);
  end;

implementation

uses
  {$IFDEF VER220}
  Windows;
  {$ELSE}
  Winapi.Windows;
  {$ENDIF}

constructor TRegistryRepository.Create;
begin
  Create(KEY_READ);
end;

constructor TRegistryRepository.Create(const AAccess: LongWord);
begin
  inherited Create;

  FRegistry := TRegistry.Create(AAccess);
  FRegistry.RootKey := HKEY_CURRENT_USER;
end;

destructor TRegistryRepository.Destroy;
begin
  FRegistry.Free;
  inherited;
end;

function TRegistryRepository.GetDataSize(const ASection: string): Integer;
begin
  Result := FRegistry.GetDataSize(ASection);
end;

procedure TRegistryRepository.CloseKey;
begin
  FRegistry.CloseKey;
end;

function TRegistryRepository.OpenKey(const AKey: String; const ACanCreate: Boolean): Boolean;
begin
  Result := FRegistry.OpenKey(AKey, ACanCreate);
end;

function TRegistryRepository.OpenKeyReadOnly(const AKey: String): Boolean;
begin
  Result := FRegistry.OpenKeyReadOnly(AKey)
end;

function TRegistryRepository.ReadBinaryData(const AKeyName: string; var ABuffer; ABufferSize: Integer): Integer;
begin
  Result := FRegistry.ReadBinaryData(AKeyName, ABuffer, ABufferSize);
end;

function TRegistryRepository.ReadBool(const ASection: string): Boolean;
begin
  Result := FRegistry.ReadBool(ASection);
end;

function TRegistryRepository.ReadInteger(const ASection: string; const ADefault: Integer): Integer;
var
  LRegDataInfo : TRegDataInfo;
begin
  Result := ADefault;

  if (FRegistry.GetDataInfo(ASection, LRegDataInfo)) and
     (LRegDataInfo.RegData = rdInteger) then
  begin
    Result := ReadInteger(ASection);
  end;
end;

function TRegistryRepository.ReadInteger(const ASection: string): Integer;
begin
  Result := FRegistry.ReadInteger(ASection);
end;

function TRegistryRepository.ReadString(const AName: string): string;
begin
  Result := FRegistry.ReadString(AName);
end;

procedure TRegistryRepository.SetAccess(const AAccess: LongWord);
begin
  FRegistry.Access := AAccess;
end;

function TRegistryRepository.ValueExists(const ASection: string): Boolean;
begin
  Result := FRegistry.ValueExists(ASection);
end;

procedure TRegistryRepository.WriteInteger(const ASection: string; const AValue: Integer);
begin
  FRegistry.WriteInteger(ASection, AValue);
end;

end.
