unit nick.toolsapi.shortcut.RepositoryFactory;

interface

uses
  nick.toolsapi.shortcut.IRepositoryFactory,
  nick.toolsapi.shortcut.IIniFileRepository,
  nick.toolsapi.shortcut.IRegistryRepository,
  nick.toolsapi.shortcut.ISystemRepository,
  nick.toolsapi.shortcut.IToolsApiRepository,
  nick.toolsapi.shortcut.IXmlFileRepository;

type
  TRepositoryFactory = class(TInterfacedObject, IRepositoryFactory)
  public
    class function New() : IRepositoryFactory;

    function IniFileRepository() : IIniFileRepository;
    function RegistryRepository() : IRegistryRepository;
    function SystemRepository() : ISystemRepository;
    function ToolsApiRepository() : IToolsApiRepository;
    function XmlFileRepository() : IXmlFileRepository;
  end;

implementation

uses
  nick.toolsapi.shortcut.SystemRepository,
  nick.toolsapi.shortcut.ToolsApiRepository,
  nick.toolsapi.shortcut.RegistryRepository,
  nick.toolsapi.shortcut.IniFileRepository,
  nick.toolsapi.shortcut.XmlFileRepository;

{ TToolsApiFactory }

function TRepositoryFactory.IniFileRepository: IIniFileRepository;
begin
  Result := TIniFileRepository.Create
end;

class function TRepositoryFactory.New: IRepositoryFactory;
begin
  Result := TRepositoryFactory.Create;
end;

function TRepositoryFactory.RegistryRepository: IRegistryRepository;
begin
  Result := TRegistryRepository.Create;
end;

function TRepositoryFactory.SystemRepository: ISystemRepository;
begin
  Result := TSystemRepository.Create;
end;

function TRepositoryFactory.ToolsApiRepository: IToolsApiRepository;
begin
  Result := TToolsApiRepository.Create(RegistryRepository());
end;

function TRepositoryFactory.XmlFileRepository: IXmlFileRepository;
begin
  Result := TXmlFileRepository.Create
end;

end.
