unit nick.toolsapi.shortcut.IToolsApiRepository;

interface

uses
  Menus,
  ToolsAPI;

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
  end;

implementation

end.
