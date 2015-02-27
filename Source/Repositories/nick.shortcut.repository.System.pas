unit nick.shortcut.repository.System;

interface

uses
  {$IFDEF VER220}
  TlHelp32,
  Classes,
  Windows,
  {$ELSE}
  Winapi.TlHelp32,
  System.Classes,
  Winapi.Windows,
  {$ENDIF}
  nick.shortcut.repository.ISystem,
  nick.shortcut.other.IFileVersionInformation;

type
  TSystemRepository = class(TInterfacedObject, ISystemRepository)
  public
    function FileExists(const AFileName: string; const AFollowLink: Boolean = True): Boolean;
    function DirectoryExists(const ADirectory: string; const AFollowLink: Boolean = True): Boolean;
    function GetAppDataDirectory(out APath : string) : Boolean;
    function GetVersionInformation(const AFileName : string; out AVSFixedFileInfo : TVSFixedFileInfo) : Boolean; overload;
    function GetVersionInformation(const AFileName : string) : IFileVersionInformation; overload;

    function GetCurrentProcessID() : DWORD;

    function ShortCut(const Key: Word; const Shift: TShiftState): TShortCut;
    function TextToShortCut(const Text: string): TShortCut;

    function CreateToolhelp32Snapshot(const AFlags : DWORD; const AProcessID: DWORD): THandle;
    function Module32First(const ASnapshotHandle: THandle; var AModuleEntry32: TModuleEntry32): BOOL;
    function Module32Next(const ASnapshotHandle: THandle; var AModuleEntry32: TModuleEntry32): BOOL;
    function CloseHandle(const AHandle: THandle): BOOL;

    function GetModulePath(const AModuleName : string) : string;

    function GetLastError: DWORD;

    procedure GetMem(var APointer: Pointer; const ASize: Integer);
    procedure FreeMem(var APointer: Pointer);

    function GetFileVersionInfoSize(const AFilename: PChar; var lpdwHandle: DWORD): DWORD;
    function GetFileVersionInfo(const AFilename: PChar; const AHandle : DWORD; const ALength : DWORD; const APointer: Pointer): BOOL;
    function VerQueryValue(const ABlock: Pointer; const ASubBlock: PChar; var ABuffer: Pointer; var ALength: UINT): BOOL;

    function IsHotKeyRegisteredByTheOperatingSystem(const AWindowHandle : HWND; const AID: Integer; const AModifiers : UINT; const AVirtualKey : UINT) : Boolean;

    function GlobalAddAtom(const AAtomName : string) : ATOM;
    function GlobalDeleteAtom(const AAtom : ATOM) : DWORD;

    function ModifiersToShiftState(const AModifier : Integer) : TShiftState;
    function ModifiersToString(const AModifier : Integer) : string;

    function GetSaveFileName(const AWindowHandle : HWND; const ADefaultExt : string; out AFileName : string) : Boolean;

    function ShellExecute(const AWindowHandle : HWND;
                          const AOperation : PChar;
                          const AFileName : PChar;
                          const AParameters : PChar;
                          const ADirectory: PChar;
                          const AShowCmd: Integer): HINST;
  end;

implementation

uses
  {$IFDEF VER220}
  ShlObj,
  SysUtils,
  ShellAPI,
  Consts,
  Dialogs,
  IOUtils,
  Menus,
  {$ELSE}
  Winapi.ShlObj,
  System.SysUtils,
  Winapi.ShellAPI,
  Vcl.Consts,
  Vcl.Dialogs,
  System.IOUtils,
  Vcl.Menus,
  {$ENDIF}
  nick.shortcut.other.FileVersionInformation;

function TSystemRepository.CloseHandle(const AHandle: THandle): BOOL;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms724211(v=vs.85).aspx
  {$IFDEF VER220}
  Result := Windows.CloseHandle(AHandle);
  {$ELSE}
  Result := Winapi.Windows.CloseHandle(AHandle);
  {$ENDIF}
end;

function TSystemRepository.CreateToolhelp32Snapshot(const AFlags : DWORD; const AProcessID: DWORD): THandle;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms682489(v=vs.85).aspx
  {$IFDEF VER220}
  Result := TlHelp32.CreateToolhelp32Snapshot(AFlags, AProcessID);
  {$ELSE}
  Result := Winapi.TlHelp32.CreateToolhelp32Snapshot(AFlags, AProcessID);
  {$ENDIF}
end;

function TSystemRepository.DirectoryExists(const ADirectory: string; const AFollowLink: Boolean): Boolean;
begin
  {$IFDEF VER220}
  Result := IOUtils.TDirectory.Exists(ADirectory, AFollowLink);
  {$ELSE}
  Result := System.IOUtils.TDirectory.Exists(ADirectory, AFollowLink);
  {$ENDIF}
end;

function TSystemRepository.FileExists(const AFileName: string; const AFollowLink: Boolean): Boolean;
begin
  {$IFDEF VER220}
  Result := IOUtils.TFile.Exists(AFileName, AFollowLink)
  {$ELSE}
  Result := System.IOUtils.TFile.Exists(AFileName, AFollowLink)
  {$ENDIF}
end;

procedure TSystemRepository.FreeMem(var APointer: Pointer);
begin
  System.FreeMem(APointer);
end;

function TSystemRepository.GetAppDataDirectory(out APath : string) : Boolean;
var
   FilePath: array [0..MAX_PATH] of char;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/bb762181(v=vs.85).aspx
  APath := '';

  Result := (SHGetFolderPath(0, CSIDL_APPDATA, 0, SHGFP_TYPE_CURRENT, @FilePath) = S_OK);
  if Result then
    APath := IncludeTrailingPathDelimiter(FilePath);
end;

function TSystemRepository.GetCurrentProcessID: DWORD;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms683180(v=vs.85).aspx
  {$IFDEF VER220}
  Result := Windows.GetCurrentProcessId();
  {$ELSE}
  Result := Winapi.Windows.GetCurrentProcessId();
  {$ENDIF}
end;

function TSystemRepository.GetFileVersionInfo(const AFilename: PChar; const AHandle : DWORD; const ALength : DWORD; const APointer: Pointer): BOOL;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms647003(v=vs.85).aspx
  {$IFDEF VER220}
  Result := Windows.GetFileVersionInfo(AFileName, AHandle, ALength, APointer);
  {$ELSE}
  Result := Winapi.Windows.GetFileVersionInfo(AFileName, AHandle, ALength, APointer);
  {$ENDIF}
end;

function TSystemRepository.GetFileVersionInfoSize(const AFilename: PChar; var lpdwHandle: DWORD): DWORD;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms647005(v=vs.85).aspx
  {$IFDEF VER220}
  Result := Windows.GetFileVersionInfoSize(AFilename, lpdwHandle);
  {$ELSE}
  Result := Winapi.Windows.GetFileVersionInfoSize(AFilename, lpdwHandle);
  {$ENDIF}
end;

function TSystemRepository.GetLastError: DWORD;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms679360(v=vs.85).aspx
  {$IFDEF VER220}
  Result := Windows.GetLastError();
  {$ELSE}
  Result := Winapi.Windows.GetLastError();
  {$ENDIF}
end;

procedure TSystemRepository.GetMem(var APointer: Pointer; const ASize: Integer);
begin
  System.GetMem(APointer, ASize);
end;

function TSystemRepository.GetModulePath(const AModuleName: string): string;
var
  LModuleEntry32: TModuleEntry32;
  LValidModuleEntry: Boolean;
  LSnapShotHandle : THandle;
begin
  Result := '';
  LSnapShotHandle := Self.CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, Self.GetCurrentProcessID());
  try
    LModuleEntry32.dwSize := SizeOf(LModuleEntry32);
    LValidModuleEntry := Self.Module32First(LSnapShotHandle, LModuleEntry32);
    while LValidModuleEntry do
    begin
      if (SameText(string(LModuleEntry32.szModule), AModuleName)) then
      begin
        Exit(LModuleEntry32.szExePath);
      end;

      LValidModuleEntry := Self.Module32Next(LSnapShotHandle, LModuleEntry32);
    end;
  finally
    if (LSnapShotHandle <> INVALID_HANDLE_VALUE) then
      Self.CloseHandle(LSnapShotHandle);
  end;
end;

function TSystemRepository.GetSaveFileName(const AWindowHandle : HWND; const ADefaultExt: string; out AFileName: string): Boolean;
var
  LSaveDialog: TSaveDialog;
begin
  AFileName := '';

  LSaveDialog := nil;
  try
    LSaveDialog := TSaveDialog.Create(nil);
    LSaveDialog.Title := 'Export to...';
    LSaveDialog.DefaultExt := ADefaultExt;
    LSaveDialog.Filter := Format('%0:s files (*.%0:s)|*.%0:s*|All files (*.*)|*.*', [ADefaultExt]);
    LSaveDialog.Options := [ofOverwritePrompt,
                            ofHideReadOnly,
                            ofNoChangeDir,
                            ofPathMustExist,
                            ofShareAware,
                            ofNoReadOnlyReturn,
                            ofEnableSizing,
                            ofDontAddToRecent];

    Result := LSaveDialog.Execute(AWindowHandle);
    if Result then
      AFileName := LSaveDialog.FileName;
  finally
    LSaveDialog.Free;
  end;
end;

function TSystemRepository.GetVersionInformation(const AFileName: string): IFileVersionInformation;
begin
  Result := TFileVersionInformation.Create(AFileName, Self);
end;

function TSystemRepository.GlobalAddAtom(const AAtomName: string): ATOM;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms649060(v=vs.85).aspx
  {$IFDEF VER220}
  Result := Windows.GlobalAddAtom(PChar(AAtomName));
  {$ELSE}
  Result := Winapi.Windows.GlobalAddAtom(PChar(AAtomName));
  {$ENDIF}
end;

function TSystemRepository.GlobalDeleteAtom(const AAtom: ATOM): DWORD;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms649061(v=vs.85).aspx
  {$IFDEF VER220}
  Windows.SetLastError(Windows.ERROR_SUCCESS);
  Windows.GlobalDeleteAtom(AAtom);
  Result := Windows.GetLastError;
  {$ELSE}
  Winapi.Windows.SetLastError(Winapi.Windows.ERROR_SUCCESS);
  Winapi.Windows.GlobalDeleteAtom(AAtom);
  Result := Winapi.Windows.GetLastError;
  {$ENDIF}
end;

function TSystemRepository.IsHotKeyRegisteredByTheOperatingSystem(const AWindowHandle: HWND; const AID: Integer; const AModifiers : UINT; const AVirtualKey : UINT): Boolean;
begin
  Result := True;

  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms646309(v=vs.85).aspx
  {$IFDEF VER220}
  if Windows.RegisterHotKey(AWindowHandle, AID, AModifiers, AVirtualKey) then
  {$ELSE}
  if Winapi.Windows.RegisterHotKey(AWindowHandle, AID, AModifiers, AVirtualKey) then
  {$ENDIF}
  begin
    // GetLastError() should return error code of ERROR_HOTKEY_ALREADY_REGISTERED - 1409 ($0581) : Hot key is already registered.

    // http://msdn.microsoft.com/en-us/library/windows/desktop/ms646327(v=vs.85).aspx
    {$IFDEF VER220}
    Windows.UnregisterHotKey(AWindowHandle, AID);
    {$ELSE}
    Winapi.Windows.UnregisterHotKey(AWindowHandle, AID);
    {$ENDIF}
    Result := False;
  end;
end;

function TSystemRepository.GetVersionInformation(const AFileName: string; out AVSFixedFileInfo: TVSFixedFileInfo): Boolean;
var
  LFileVersionInformation: IFileVersionInformation;
begin
  LFileVersionInformation := GetVersionInformation(AFileName);

  AVSFixedFileInfo := LFileVersionInformation.GetFileVersion;
  Result := not LFileVersionInformation.HasErrored;
end;

function TSystemRepository.ModifiersToShiftState(const AModifier: Integer): TShiftState;
begin
  Result := [];
  if ((AModifier and MOD_ALT) <> 0) then
    Include(Result, ssAlt);
  if ((AModifier and MOD_CONTROL) <> 0) then
    Include(Result, ssCtrl);
  if ((AModifier and MOD_SHIFT) <> 0) then
    Include(Result, ssShift);
end;

function TSystemRepository.ModifiersToString(const AModifier: Integer): string;
begin
  Result := '';
  if ((AModifier and MOD_ALT) <> 0) then
    Result := Result + SmkcAlt;
  if ((AModifier and MOD_CONTROL) <> 0) then
    Result := Result + SmkcCtrl;
  if ((AModifier and MOD_SHIFT) <> 0) then
    Result := Result + SmkcShift;

  Delete(Result, Length(Result), 1);
end;

function TSystemRepository.Module32First(const ASnapshotHandle: THandle; var AModuleEntry32: TModuleEntry32): BOOL;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms684218(v=vs.85).aspx
  {$IFDEF VER220}
  Result := TlHelp32.Module32First(ASnapshotHandle, AModuleEntry32);
  {$ELSE}
  Result := Winapi.TlHelp32.Module32First(ASnapshotHandle, AModuleEntry32);
  {$ENDIF}
end;

function TSystemRepository.Module32Next(const ASnapshotHandle: THandle; var AModuleEntry32: TModuleEntry32): BOOL;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms684221(v=vs.85).aspx
  {$IFDEF VER220}
  Result := TlHelp32.Module32Next(ASnapshotHandle, AModuleEntry32);
  {$ELSE}
  Result := Winapi.TlHelp32.Module32Next(ASnapshotHandle, AModuleEntry32);
  {$ENDIF}
end;

function TSystemRepository.ShellExecute(const AWindowHandle : HWND;
                                        const AOperation : PChar;
                                        const AFileName : PChar;
                                        const AParameters : PChar;
                                        const ADirectory: PChar;
                                        const AShowCmd: Integer): HINST;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/bb762153(v=vs.85).aspx
  {$IFDEF VER220}
  Result := ShellAPI.ShellExecute(AWindowHandle, AOperation, AFileName, AParameters, ADirectory, AShowCmd);
  {$ELSE}
  Result := Winapi.ShellAPI.ShellExecute(AWindowHandle, AOperation, AFileName, AParameters, ADirectory, AShowCmd);
  {$ENDIF}
end;

function TSystemRepository.VerQueryValue(const ABlock: Pointer; const ASubBlock: PChar; var ABuffer: Pointer; var ALength: UINT): BOOL;
begin
  // http://msdn.microsoft.com/en-us/library/windows/desktop/ms647464(v=vs.85).aspx
  {$IFDEF VER220}
  Result := Windows.VerQueryValue(ABlock, ASubBlock, ABuffer, ALength);
  {$ELSE}
  Result := Winapi.Windows.VerQueryValue(ABlock, ASubBlock, ABuffer, ALength);
  {$ENDIF}
end;

function TSystemRepository.ShortCut(const Key: Word; const Shift: TShiftState): TShortCut;
begin
  {$IFDEF VER220}
  Result := Menus.ShortCut(Key, Shift);
  {$ELSE}
  Result := Vcl.Menus.ShortCut(Key, Shift);
  {$ENDIF}
end;

function TSystemRepository.TextToShortCut(const Text: string): TShortCut;
begin
  {$IFDEF VER220}
  Result := Menus.TextToShortCut(Text);
  {$ELSE}
  Result := Vcl.Menus.TextToShortCut(Text);
  {$ENDIF}
end;

end.

