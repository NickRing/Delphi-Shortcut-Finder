unit nick.shortcut.factory.IRepository;

interface

uses
  nick.shortcut.repository.IIniFile,
  nick.shortcut.repository.IRegistry,
  nick.shortcut.repository.ISystem,
  nick.shortcut.repository.IToolsApi,
  nick.shortcut.repository.IXmlFile;

type
  IRepositoryFactory = interface
    ['{DDE31772-7AF9-4CFF-A6CE-7D1082D8C6B6}']
    function IniFileRepository() : IIniFileRepository;
    function RegistryRepository() : IRegistryRepository; overload;
    function RegistryRepository(const AAccess: LongWord) : IRegistryRepository; overload;
    function SystemRepository() : ISystemRepository;
    function ToolsApiRepository() : IToolsApiRepository;
    function XmlFileRepository() : IXmlFileRepository;
  end;

implementation

end.
