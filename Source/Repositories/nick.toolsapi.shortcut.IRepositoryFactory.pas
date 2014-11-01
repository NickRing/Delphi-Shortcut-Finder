unit nick.toolsapi.shortcut.IRepositoryFactory;

interface

uses
  nick.toolsapi.shortcut.IIniFileRepository,
  nick.toolsapi.shortcut.IRegistryRepository,
  nick.toolsapi.shortcut.ISystemRepository,
  nick.toolsapi.shortcut.IToolsApiRepository,
  nick.toolsapi.shortcut.IXmlFileRepository;

type
  IRepositoryFactory = interface
    ['{DDE31772-7AF9-4CFF-A6CE-7D1082D8C6B6}']
    function IniFileRepository() : IIniFileRepository;
    function RegistryRepository() : IRegistryRepository;
    function SystemRepository() : ISystemRepository;
    function ToolsApiRepository() : IToolsApiRepository;
    function XmlFileRepository() : IXmlFileRepository;
  end;

implementation

end.
