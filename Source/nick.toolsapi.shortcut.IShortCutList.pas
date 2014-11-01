unit nick.toolsapi.shortcut.IShortCutList;

interface

uses
  nick.toolsapi.shortcut.ShortCutItem,
  nick.toolsapi.shortcut.IIniFileRepository,
  nick.toolsapi.shortcut.IRegistryRepository,
  nick.toolsapi.shortcut.IXmlFileRepository;

type
  IShortCutList = interface
    ['{DB18AC7F-7A53-45DC-9129-DF9975A12B8F}']

    function Count() : Integer;

    function IsUseable() : Boolean;

    function IniFileRepository() : IIniFileRepository;
    function XmlFileRepository() : IXmlFileRepository;
    function RegistryRepository() : IRegistryRepository;

    procedure RetrieveShortCuts();

    procedure Add(const AShortCutItem : IShortCutItem);

    function GetShortCut(const AIndex : Integer) : IShortCutItem;
    property ShortCut [const AIndex : Integer] : IShortCutItem read GetShortCut;

    function GetName() : string;
    property Name : string read GetName;

    function GetDescription() : string;
    property Description : string read GetDescription;
  end;

implementation

end.
