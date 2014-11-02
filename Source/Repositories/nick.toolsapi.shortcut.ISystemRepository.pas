unit nick.toolsapi.shortcut.ISystemRepository;

interface

uses
  TlHelp32,
  Windows,
  nick.toolsapi.shortcut.IFileVersionInformation;

type
  ISystemRepository = interface
    ['{0729EC4D-187E-476D-B3C4-FF434C92340F}']
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

end.
