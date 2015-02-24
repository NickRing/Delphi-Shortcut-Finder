unit nick.shortcut.repository.IniFile;

interface

uses
  nick.shortcut.repository.IIniFile,
  System.IniFiles;

type
  TIniFileRepository = class(TInterfacedObject, IIniFileRepository)
  private
    FMemIniFile : TMemIniFile;
  public
    constructor Create;
    destructor Destroy; override;

    procedure OpenFile(const AFileName : string);
    function Exists(const ASection : string; const AIdent : string) : Boolean;
    function ReadString(const ASection : string; const AIdent : string; const ADefault : string): string;
  end;

implementation

uses
  System.SysUtils;

constructor TIniFileRepository.Create;
begin
  FMemIniFile := TMemIniFile.Create('');
end;

destructor TIniFileRepository.Destroy;
begin
  FMemIniFile.Free;
  inherited;
end;

function TIniFileRepository.Exists(const ASection : string; const AIdent : string): Boolean;
begin
  Result := FMemIniFile.ValueExists(ASection, AIdent);
end;

procedure TIniFileRepository.OpenFile(const AFileName : string);
begin
  if (not AnsiSameText(AFileName, FMemIniFile.FileName)) then
    FMemIniFile.Rename(AFileName, True);
end;

function TIniFileRepository.ReadString(const ASection : string; const AIdent : string; const ADefault : string): string;
begin
  Result := FMemIniFile.ReadString(ASection, AIdent, ADefault);
end;

end.

