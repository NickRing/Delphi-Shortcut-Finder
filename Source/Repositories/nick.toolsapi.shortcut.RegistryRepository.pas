unit nick.toolsapi.shortcut.RegistryRepository;

interface

uses
  nick.toolsapi.shortcut.IRegistryRepository,
  Registry;

type
  TRegistryRepository = class(TInterfacedObject, IRegistryRepository)
  private
    FRegistry : TRegistry;
  public
    constructor Create;
    destructor Destroy; override;

    procedure CloseKey;
    function OpenKeyReadOnly(const AKey: String): Boolean;
    function ReadString(const AName: string): string;
    function ValueExists(const ASection : string) : Boolean;
    function ReadBool(const ASection : string) : Boolean;
    function ReadInteger(const ASection : string) : Integer;
    function GetDataSize(const ASection : string) : Integer;
    function ReadBinaryData(const AKeyName: string; var ABuffer; ABufferSize: Integer): Integer;
  end;

implementation

uses
  Windows;

{ TRegistryRepository }

constructor TRegistryRepository.Create;
begin
  inherited Create;

  FRegistry := TRegistry.Create(KEY_READ);
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

function TRegistryRepository.ReadInteger(const ASection: string): Integer;
begin
  Result := FRegistry.ReadInteger(ASection);
end;

function TRegistryRepository.ReadString(const AName: string): string;
begin
  Result := FRegistry.ReadString(AName);
end;

function TRegistryRepository.ValueExists(const ASection: string): Boolean;
begin
  Result := FRegistry.ValueExists(ASection);
end;

end.
