unit nick.toolsapi.shortcut.ToolsApiRepository;

{$I jedi.inc}

interface

uses
  Menus,
  ToolsAPI,
  nick.toolsapi.shortcut.IRegistryRepository,
  nick.toolsapi.shortcut.IToolsApiRepository;

type
  TToolsApiRepository = class(TInterfacedObject, IToolsApiRepository)
  private
    FRegistryRepository: IRegistryRepository;
  public
    constructor Create(const ARegistryRepository: IRegistryRepository); reintroduce;
    function GetBDSVersion : Integer;
    function GetPackageVersion : Integer;
    function GetIDEName : string;

    function GetMainMenu() : TMainMenu;

    function GetBaseRegistryKey(out ABaseRegistryKey: string) : Boolean;

    function IsPackageLoaded(const APackageName: string): Boolean;

    function GetKeyboardServices(out AOTAKeyboardServices : IOTAKeyboardServices) : Boolean;
  end;

implementation

uses
  SysUtils;

{ TToolsApiRepository }

constructor TToolsApiRepository.Create(const ARegistryRepository: IRegistryRepository);
begin
  inherited Create();
  FRegistryRepository := ARegistryRepository;
end;

function TToolsApiRepository.GetBDSVersion: Integer;
begin
  Result := Trunc(RTLVersion) - 14;
  if (Result >= 13) then
    Result := Result + 1;
end;

function TToolsApiRepository.GetPackageVersion: Integer;
{$IFNDEF DELPHIXE7}
var
  LBaseRegistryKey : string;
  LProductVersion: string;
{$ENDIF}
begin
  {$IFNDEF DELPHIXE7}
  // Delphi XE7 has this value incorrect :( It is set to 20 and not 21
  // as per http://docwiki.embarcadero.com/RADStudio/XE7/en/Compiler_Versions

  if GetBaseRegistryKey(LBaseRegistryKey) then
  begin
    if FRegistryRepository.OpenKeyReadOnly(LBaseRegistryKey) and
       FRegistryRepository.ValueExists('ProductVersion') then
    begin
      LProductVersion := FRegistryRepository.ReadString('ProductVersion');

      if (TryStrToInt(LProductVersion, Result)) then
        Exit(Result);
    end;
  end;
  {$ENDIF}

  // Product version : http://docwiki.embarcadero.com/RADStudio/XE6/en/Compiler_Versions
  // RTL/Compiler version : http://blog.blong.com/p/ancient-blog-posts.html

  Result := Trunc(System.RTLVersion) - 7;
  if (Result <= 13) then
    Result := Result - 1;
end;

function TToolsApiRepository.GetIDEName: string;
var
  LVersion : Integer;
begin
  Result := '';

  LVersion := GetPackageVersion();

  case LVersion of
    // Not sure of these...
    1..5 : Result := IntToStr(LVersion);
    6,7  : Result := IntToStr(LVersion);
    // Delphi for .Net
    8    : Result := IntToStr(LVersion);
    9..11,14 : Result := IntToStr(1996 + LVersion);
    12 : Result := IntToStr(1997 + LVersion);
    15 : Result := 'XE';
    else
      Result := 'XE' + IntToStr(LVersion - 14);
  end;
end;

function TToolsApiRepository.GetKeyboardServices(out AOTAKeyboardServices: IOTAKeyboardServices): Boolean;
begin
  Result := SysUtils.Supports(ToolsAPI.BorlandIDEServices, IOTAKeyboardServices, AOTAKeyboardServices);
end;

function TToolsApiRepository.GetMainMenu: TMainMenu;
var
  LNTAServices : INTAServices;
begin
  Result := nil;
  if not SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAServices, LNTAServices) then
    Exit;

  Result := LNTAServices.MainMenu;
end;

function TToolsApiRepository.IsPackageLoaded(const APackageName: string): Boolean;
var
  LOTAPackageInfo : IOTAPackageInfo;
  LOTAPackageServices : IOTAPackageServices;
  lp: Integer;
begin
  Result := False;

  if not SysUtils.Supports(BorlandIDEServices, IOTAPackageServices, LOTAPackageServices) then
    Exit;

  for lp := 0 to LOTAPackageServices.PackageCount - 1 do
  begin
    LOTAPackageInfo := LOTAPackageServices.Package[lp];

    if not LOTAPackageInfo.Loaded then
      Continue;

    Result := SameText(LOTAPackageInfo.Name, APackageName);
    if Result then
      Exit;
  end;
end;

function TToolsApiRepository.GetBaseRegistryKey(out ABaseRegistryKey: string): Boolean;
var
  LOTAServices: IOTAServices;
begin
  Result := SysUtils.Supports(BorlandIDEServices, IOTAServices, LOTAServices);

  if Result then
    ABaseRegistryKey := LOTAServices.GetBaseRegistryKey();
end;

end.

