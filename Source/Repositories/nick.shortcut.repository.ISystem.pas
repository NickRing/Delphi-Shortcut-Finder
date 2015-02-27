unit nick.shortcut.repository.ISystem;

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
  nick.shortcut.other.IFileVersionInformation;

{$IFDEF VER220}
type
  TShortCut = Classes.TShortCut;
  TShiftState = Classes.TShiftState;

const
  scShift = Classes.scShift;
  scCtrl = Classes.scCtrl;
  scAlt = Classes.scAlt;
  scNone = Classes.scNone;
{$ELSE}
type
  TShortCut = System.Classes.TShortCut;

const
  scShift = System.Classes.scShift;
  scCtrl = System.Classes.scCtrl;
  scAlt = System.Classes.scAlt;
  scNone = System.Classes.scNone;
{$ENDIF}


type
  ISystemRepository = interface
    ['{0729EC4D-187E-476D-B3C4-FF434C92340F}']
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

    function GlobalAddAtom(const AAtomName : string) : ATOM;
    function GlobalDeleteAtom(const AAtom : ATOM) : DWORD;

    function IsHotKeyRegisteredByTheOperatingSystem(const AWindowHandle : HWND; const AID: Integer; const AModifiers : UINT; const AVirtualKey : UINT) : Boolean;

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

end.
