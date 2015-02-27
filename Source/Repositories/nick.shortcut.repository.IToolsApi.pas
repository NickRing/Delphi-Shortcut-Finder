unit nick.shortcut.repository.IToolsApi;

interface

uses
  nick.shortcut.other.IFileVersionInformation,
  {$IFDEF VER220}
  Classes,
  Menus,
  {$ELSE}
  System.Classes,
  Vcl.Menus,
  {$ENDIF}
  ToolsAPI;

type
  TModuleDetail = record
    Module : string;
    Path : string;
    FileVersionInformation : IFileVersionInformation;
    KeyBindingRec : TKeyBindingRec;

    function GetDisplayText() : string;
  end;

type
  IToolsApiRepository = interface
    ['{A9D74550-929F-457E-B2C8-C3C100728E74}']
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
  {$IFDEF VER220}
  SysUtils;
  {$ELSE}
  System.SysUtils;
  {$ENDIF}

{ TModuleDetail }

function TModuleDetail.GetDisplayText: string;
begin
  Result := FileVersionInformation.FieldString[TVersionInformation.FileDescription];

  if (Result = EmptyStr) then
    Result := FileVersionInformation.FieldString[TVersionInformation.ProductName];

  if (Result = EmptyStr) then
    Result := Module;
end;

end.

