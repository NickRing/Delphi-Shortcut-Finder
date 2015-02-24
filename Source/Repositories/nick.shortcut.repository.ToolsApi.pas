unit nick.shortcut.repository.ToolsApi;

{$I jedi.inc}

interface

uses
  System.Classes,
  Vcl.Menus,
  ToolsAPI,
  nick.shortcut.repository.IRegistry,
  nick.shortcut.repository.IToolsApi,
  nick.shortcut.repository.ISystem;

type
  TToolsApiRepository = class(TInterfacedObject, IToolsApiRepository)
  private
    FRegistryRepository: IRegistryRepository;
    FSystemRepository : ISystemRepository;
    procedure FindModuleDetails(const AKeyBindingRec: TKeyBindingRec;
                                const ASystemRepository: ISystemRepository;
                                const ASnapShotHandle: THandle;
                                var AModuleDetail: TModuleDetail);
  public
    constructor Create(const ARegistryRepository: IRegistryRepository; const ASystemRepository : ISystemRepository); reintroduce;
    function GetBDSVersion : Integer;
    function GetPackageVersion : Integer;
    function GetIDEName : string;

    function GetMainMenu() : TMainMenu;

    function GetBaseRegistryKey(out ABaseRegistryKey: string) : Boolean;

    function IsPackageLoaded(const APackageName: string): Boolean;

    function GetKeyboardServices(out AOTAKeyboardServices : IOTAKeyboardServices) : Boolean;

    function GetKeyboardBindingsDetails(const AShortCut : TShortcut) : TArray<TModuleDetail>;
  end;

implementation

uses
  System.SysUtils,
  Winapi.TlHelp32,
  System.Generics.Collections;

constructor TToolsApiRepository.Create(const ARegistryRepository: IRegistryRepository; const ASystemRepository : ISystemRepository);
begin
  inherited Create();
  FRegistryRepository := ARegistryRepository;
  FSystemRepository := ASystemRepository;
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
    if FRegistryRepository.OpenKeyReadOnly(LBaseRegistryKey) then
    try
      if FRegistryRepository.ValueExists('ProductVersion') then
      begin
        LProductVersion := FRegistryRepository.ReadString('ProductVersion');

        if (TryStrToInt(LProductVersion, Result)) then
          Exit(Result);
      end;
    finally
      FRegistryRepository.CloseKey;
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

procedure TToolsApiRepository.FindModuleDetails(const AKeyBindingRec: TKeyBindingRec;
                                                const ASystemRepository: ISystemRepository;
                                                const ASnapShotHandle: THandle;
                                                var AModuleDetail: TModuleDetail);
var
  LModuleEntry32: TModuleEntry32;
  LValidModuleEntry: Boolean;
begin
  if (ASnapShotHandle = INVALID_HANDLE_VALUE) then
    Exit;

  LModuleEntry32.dwSize := SizeOf(LModuleEntry32);
  LValidModuleEntry := ASystemRepository.Module32First(ASnapShotHandle, LModuleEntry32);
  while LValidModuleEntry do
  begin
    if (NativeUInt(LModuleEntry32.modBaseAddr) <= NativeUInt(@AKeyBindingRec.KeyProc)) and
       (NativeUInt(@AKeyBindingRec.KeyProc) < (NativeUInt(LModuleEntry32.modBaseAddr) + LModuleEntry32.modBaseSize)) then
    begin
      AModuleDetail.Module := LModuleEntry32.szModule;
      AModuleDetail.Path := LModuleEntry32.szExePath;
      break;
    end;
    LValidModuleEntry := ASystemRepository.Module32Next(ASnapShotHandle, LModuleEntry32);
  end;
end;

function TToolsApiRepository.GetKeyboardBindingsDetails(const AShortCut: TShortcut): TArray<TModuleDetail>;
var
  LKeyBindingRec : TKeyBindingRec;
  LModuleDetail : TModuleDetail;
  LOTAKeyboardServices : IOTAKeyboardServices;
  LSnapShotHandle : THandle;
  LModuleDetails : TList<TModuleDetail>;
begin
  LModuleDetails := nil;
  try
    LModuleDetails := TList<TModuleDetail>.Create;

    if (AShortCut and 255 = 0) then
      Exit;

    if not GetKeyboardServices(LOTAKeyboardServices) then
      Exit;

    if not LOTAKeyboardServices.LookupKeyBinding([AShortCut], LKeyBindingRec) then
      Exit;

    LSnapShotHandle := FSystemRepository.CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, FSystemRepository.GetCurrentProcessID());
    try
      repeat
        LModuleDetail.Module := '<ide?>';
        LModuleDetail.Path := '<unknown>';
        LModuleDetail.KeyBindingRec := LKeyBindingRec;

        FindModuleDetails(LKeyBindingRec, FSystemRepository, LSnapShotHandle, LModuleDetail);
        LModuleDetail.FileVersionInformation := FSystemRepository.GetVersionInformation(LModuleDetail.Path);

        LModuleDetails.Add(LModuleDetail);
      until not LOTAKeyboardServices.GetNextBindingRec(LKeyBindingRec);

    finally
      if (LSnapShotHandle <> INVALID_HANDLE_VALUE) then
        FSystemRepository.CloseHandle(LSnapShotHandle);
    end;
  finally
    Result := LModuleDetails.ToArray;

    LModuleDetails.Free;
  end;
end;

function TToolsApiRepository.GetKeyboardServices(out AOTAKeyboardServices: IOTAKeyboardServices): Boolean;
begin
  Result := System.SysUtils.Supports(ToolsAPI.BorlandIDEServices, IOTAKeyboardServices, AOTAKeyboardServices);
end;

function TToolsApiRepository.GetMainMenu: TMainMenu;
var
  LNTAServices : INTAServices;
begin
  Result := nil;
  if not System.SysUtils.Supports(ToolsAPI.BorlandIDEServices, INTAServices, LNTAServices) then
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

  if not System.SysUtils.Supports(BorlandIDEServices, IOTAPackageServices, LOTAPackageServices) then
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
  Result := System.SysUtils.Supports(BorlandIDEServices, IOTAServices, LOTAServices);

  if Result then
    ABaseRegistryKey := LOTAServices.GetBaseRegistryKey();
end;

end.

