unit nick.shortcut.frame.Base;

interface

uses
  {$IFDEF VER220}
  Classes,
  Controls,
  Forms,
  {$ELSE}
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  {$ENDIF}
  nick.shortcut.factory.IRepository,
  nick.shortcut.repository.IRegistry;

type
  TBaseFrame = class(TFrame)
  private
    FRepositoryFactory : IRepositoryFactory;
  protected
    procedure ReadRegistrySettings(const ARegistryRepository : IRegistryRepository); virtual;
    procedure WriteRegistrySettings(const ARegistryRepository : IRegistryRepository); virtual;

    property RepositoryFactory : IRepositoryFactory read FRepositoryFactory;
  public
    constructor Create(const AOwner: TComponent; const ARepositoryFactory : IRepositoryFactory); reintroduce; virtual;
    destructor Destroy; override;
  end;

implementation

uses
  {$IFDEF VER220}
  Windows;
  {$ELSE}
  Winapi.Windows;
  {$ENDIF}

{$R *.dfm}

{ TBaseFrame }

constructor TBaseFrame.Create(const AOwner: TComponent; const ARepositoryFactory : IRepositoryFactory);
var
  LBaseRegistryKey: string;
  LRegistryRepository: IRegistryRepository;
begin
  inherited Create(AOwner);

  FRepositoryFactory := ARepositoryFactory;

  if FRepositoryFactory.ToolsApiRepository().GetBaseRegistryKey(LBaseRegistryKey) then
  begin
    LRegistryRepository := FRepositoryFactory.RegistryRepository();
    if not LRegistryRepository.OpenKeyReadOnly(LBaseRegistryKey + '\nick.toolsapi\Shortcuts\' + Self.ClassName) then
    begin
      LRegistryRepository := nil;
      exit;
    end;

    ReadRegistrySettings(LRegistryRepository)
  end;
end;

destructor TBaseFrame.Destroy;
var
  LBaseRegistryKey: string;
  LRegistryRepository: IRegistryRepository;
begin
  if FRepositoryFactory.ToolsApiRepository().GetBaseRegistryKey(LBaseRegistryKey) then
  begin
    LRegistryRepository := FRepositoryFactory.RegistryRepository(KEY_ALL_ACCESS);
    if not LRegistryRepository.OpenKey(LBaseRegistryKey + '\nick.toolsapi\Shortcuts\' + Self.ClassName, True) then
    begin
      LRegistryRepository := nil;
      exit;
    end;

    WriteRegistrySettings(LRegistryRepository)
  end;

  inherited Destroy;
end;

procedure TBaseFrame.ReadRegistrySettings(const ARegistryRepository: IRegistryRepository);
begin

end;

procedure TBaseFrame.WriteRegistrySettings(const ARegistryRepository: IRegistryRepository);
begin

end;

end.

