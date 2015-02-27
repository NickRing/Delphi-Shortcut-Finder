unit nick.shortcut.factory.Repository;

interface

uses
  nick.shortcut.factory.IRepository,
  nick.shortcut.repository.IIniFile,
  nick.shortcut.repository.IRegistry,
  nick.shortcut.repository.ISystem,
  nick.shortcut.repository.IToolsApi,
  nick.shortcut.repository.IXmlFile;

type
  TRepositoryFactory = class(TInterfacedObject, IRepositoryFactory)
  public
    class function New() : IRepositoryFactory;

    function IniFileRepository() : IIniFileRepository;
    function RegistryRepository() : IRegistryRepository; overload;
    function RegistryRepository(const AAccess: LongWord) : IRegistryRepository; overload;
    function SystemRepository() : ISystemRepository;
    function ToolsApiRepository() : IToolsApiRepository;
    function XmlFileRepository() : IXmlFileRepository;
  end;

implementation

uses
  nick.shortcut.repository.System,
  nick.shortcut.repository.ToolsApi,
  nick.shortcut.repository.Registry,
  nick.shortcut.repository.IniFile,
  nick.shortcut.repository.XmlFile,
  {$IFDEF VER220}
  Windows;
  {$ELSE}
  Winapi.Windows;
  {$ENDIF}

function TRepositoryFactory.IniFileRepository: IIniFileRepository;
begin
  Result := TIniFileRepository.Create
end;

class function TRepositoryFactory.New: IRepositoryFactory;
begin
  Result := TRepositoryFactory.Create();
end;

function TRepositoryFactory.RegistryRepository(const AAccess: LongWord): IRegistryRepository;
begin
  Result := TRegistryRepository.Create(AAccess);
end;

function TRepositoryFactory.RegistryRepository: IRegistryRepository;
begin
  Result := RegistryRepository(KEY_READ);
end;

function TRepositoryFactory.SystemRepository: ISystemRepository;
begin
  Result := TSystemRepository.Create;
end;

function TRepositoryFactory.ToolsApiRepository: IToolsApiRepository;
begin
  Result := TToolsApiRepository.Create(RegistryRepository(), SystemRepository());
end;

function TRepositoryFactory.XmlFileRepository: IXmlFileRepository;
begin
  Result := TXmlFileRepository.Create
end;

end.
