unit nick.shortcut.frame.ShortCutKeyAllocation;

interface

uses
  Vcl.ComCtrls,
  Vcl.Controls,
  System.Classes,
  Vcl.Forms,
  nick.shortcut.factory.IRepository,
  nick.shortcut.repository.IRegistry,
  nick.shortcut.frame.Base;

type
  TfrmShortCutKeyAllocation = class(TBaseFrame)
    pgc1: TPageControl;
    tsKnownShortcuts: TTabSheet;
    tsSearchRegisteredShortcuts: TTabSheet;
  protected
    procedure ReadRegistrySettings(const ARegistryRepository : IRegistryRepository); override;
    procedure WriteRegistrySettings(const ARegistryRepository : IRegistryRepository); override;
  public
    constructor Create(const AOwner: TComponent; const ARepositoryFactory : IRepositoryFactory); reintroduce;
  end;

implementation

uses
  nick.shortcut.frame.KnownShortcuts,
  nick.shortcut.frame.SearchRegisteredShortcuts,
  nick.shortcut.repository.ShortCut,
  nick.shortcut.repository.ShortcutExport;

const
  cHEIGHT_REGISTRY_ENTRY = 'Height';
  cWIDTH_REGISTRY_ENTRY = 'Width';

{$R *.dfm}

{ TfrmShortCutKeyAllocation }

constructor TfrmShortCutKeyAllocation.Create(const AOwner: TComponent; const ARepositoryFactory : IRepositoryFactory);
var
  LFrame : TFrame;
begin
  inherited Create(AOwner, ARepositoryFactory);

  LFrame := TfrmKnownShortcuts.Create(Self, ARepositoryFactory, nick.shortcut.repository.ShortCut.GetShortCutRepository());
  LFrame.Align       := alClient;
  LFrame.Parent      := tsKnownShortcuts;
  LFrame.Visible     := True;

  LFrame := TfrmSearchRegisteredShortcuts.Create(Self, ARepositoryFactory);
  LFrame.Align       := alClient;
  LFrame.Parent      := tsSearchRegisteredShortcuts;
  LFrame.Visible     := True;

//  LFrame := TfrmRegisteredShortcuts.Create(Self, ARepositoryFactory);
//  LFrame.Align       := alClient;
//  LFrame.Parent      := tsRegisteredShortcuts;
//  LFrame.Visible     := True;
//
//  tsRegisteredShortcuts.TabVisible := (GetShortcutExportRepository().Count <> 0);

  pgc1.ActivePage := tsKnownShortcuts;
end;

procedure TfrmShortCutKeyAllocation.ReadRegistrySettings(const ARegistryRepository: IRegistryRepository);
begin
  inherited;
  Width := ARegistryRepository.ReadInteger(cWIDTH_REGISTRY_ENTRY, Self.Width);
  Height := ARegistryRepository.ReadInteger(cHEIGHT_REGISTRY_ENTRY, Self.Height);
end;

procedure TfrmShortCutKeyAllocation.WriteRegistrySettings(const ARegistryRepository: IRegistryRepository);
begin
  inherited;
  ARegistryRepository.WriteInteger(cWIDTH_REGISTRY_ENTRY, Self.Width);
  ARegistryRepository.WriteInteger(cHEIGHT_REGISTRY_ENTRY, Self.Height);
end;

end.

