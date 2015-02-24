unit nick.shortcut.core.IShortCutList;

interface

uses
  nick.shortcut.core.ShortCutItem,
  nick.shortcut.repository.IIniFile,
  nick.shortcut.repository.IRegistry,
  nick.shortcut.repository.IXmlFile;

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
