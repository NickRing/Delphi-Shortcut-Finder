unit nick.toolsapi.shortcut.SystemRepository;

interface

uses
  TlHelp32,
  Windows,
  nick.toolsapi.shortcut.ISystemRepository,
  nick.toolsapi.shortcut.IFileVersionInformation;

type
  TSystemRepository = class(TInterfacedObject, ISystemRepository)
  public
    function GetAppDataDirectory(out APath : string) : Boolean;
    function GetVersionInformation(const AFileName : string; out AVSFixedFileInfo : TVSFixedFileInfo) : Boolean; overload;
    function GetVersionInformation(const AFileName : string) : IFileVersionInformation; overload;

    function GetCurrentProcessID() : DWORD;

    function CreateToolhelp32Snapshot(const AFlags : DWORD; const AProcessID: DWORD): THandle;
    function Module32First(const ASnapshotHandle: THandle; var AModuleEntry32: TModuleEntry32): BOOL;
    function Module32Next(const ASnapshotHandle: THandle; var AModuleEntry32: TModuleEntry32): BOOL;
    function CloseHandle(const AHandle: THandle): BOOL;

    function GetLastError: DWORD;

    procedure GetMem(var APointer: Pointer; const ASize: Integer);
    procedure FreeMem(var APointer: Pointer);

    function GetFileVersionInfoSize(const AFilename: PChar; var lpdwHandle: DWORD): DWORD;
    function GetFileVersionInfo(const AFilename: PChar; const AHandle : DWORD; const ALength : DWORD; const APointer: Pointer): BOOL;
    function VerQueryValue(const ABlock: Pointer; const ASubBlock: PChar; var ABuffer: Pointer; var ALength: UINT): BOOL;
  end;

implementation

uses
  ShlObj,
  SysUtils,
  nick.toolsapi.shortcut.FileVersionInformation;

{ TSystemRepository }

function TSystemRepository.CloseHandle(const AHandle: THandle): BOOL;
begin
  Result := Windows.CloseHandle(AHandle);
end;

function TSystemRepository.CreateToolhelp32Snapshot(const AFlags : DWORD; const AProcessID: DWORD): THandle;
begin
  Result := TlHelp32.CreateToolhelp32Snapshot(AFlags, AProcessID);
end;

procedure TSystemRepository.FreeMem(var APointer: Pointer);
begin
  System.FreeMem(APointer);
end;

function TSystemRepository.GetAppDataDirectory(out APath : string) : Boolean;
var
   FilePath: array [0..MAX_PATH] of char;
begin
  APath := '';

  SetLastError(ERROR_SUCCESS);

  Result := (SHGetFolderPath(0, CSIDL_APPDATA, 0, SHGFP_TYPE_CURRENT, @FilePath) = S_OK);
  if Result then
    APath := IncludeTrailingPathDelimiter(FilePath);
end;

function TSystemRepository.GetCurrentProcessID: DWORD;
begin
  Result := Windows.GetCurrentProcessId();
end;

function TSystemRepository.GetFileVersionInfo(const AFilename: PChar; const AHandle : DWORD; const ALength : DWORD; const APointer: Pointer): BOOL;
begin
  Result := Windows.GetFileVersionInfo(AFileName, AHandle, ALength, APointer);
end;

function TSystemRepository.GetFileVersionInfoSize(const AFilename: PChar; var lpdwHandle: DWORD): DWORD;
begin
  Result := Windows.GetFileVersionInfoSize(AFilename, lpdwHandle);
end;

function TSystemRepository.GetLastError: DWORD;
begin
  Result := Windows.GetLastError();
end;

procedure TSystemRepository.GetMem(var APointer: Pointer; const ASize: Integer);
begin
  System.GetMem(APointer, ASize);
end;

function TSystemRepository.GetVersionInformation(const AFileName: string): IFileVersionInformation;
begin
  Result := TFileVersionInformation.Create(AFileName, Self);
end;

function TSystemRepository.GetVersionInformation(const AFileName: string; out AVSFixedFileInfo: TVSFixedFileInfo): Boolean;
var
  LFileVersionInformation: IFileVersionInformation;
begin
  LFileVersionInformation := GetVersionInformation(AFileName);

  AVSFixedFileInfo := LFileVersionInformation.GetFileVersion;
  Result := not LFileVersionInformation.HasErrored;
end;

function TSystemRepository.Module32First(const ASnapshotHandle: THandle; var AModuleEntry32: TModuleEntry32): BOOL;
begin
  Result := TlHelp32.Module32First(ASnapshotHandle, AModuleEntry32);
end;

function TSystemRepository.Module32Next(const ASnapshotHandle: THandle; var AModuleEntry32: TModuleEntry32): BOOL;
begin
  Result := TlHelp32.Module32Next(ASnapshotHandle, AModuleEntry32);
end;

function TSystemRepository.VerQueryValue(const ABlock: Pointer; const ASubBlock: PChar; var ABuffer: Pointer; var ALength: UINT): BOOL;
begin
  Result := Windows.VerQueryValue(ABlock, ASubBlock, ABuffer, ALength);
end;

end.

