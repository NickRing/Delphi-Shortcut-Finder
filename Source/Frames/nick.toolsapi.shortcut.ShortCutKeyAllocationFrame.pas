unit nick.toolsapi.shortcut.ShortCutKeyAllocationFrame;

interface

uses
  ComCtrls,
  Controls,
  Classes,
  Forms;

type
  TfrmShortCutKeyAllocation = class(TFrame)
    pgc1: TPageControl;
    tsKnownShortcuts: TTabSheet;
    tsSearchRegisteredShortcuts: TTabSheet;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  nick.toolsapi.shortcut.KnownShortcutsFrame,
  nick.toolsapi.shortcut.SearchRegisteredShortcutsFrame,
  nick.toolsapi.shortcut.IRepositoryFactory,
  nick.toolsapi.shortcut.RepositoryFactory,
  nick.toolsapi.shortcut.ShortCutRepository;

{$R *.dfm}

{ TfrmShortCutKeyAllocation }

constructor TfrmShortCutKeyAllocation.Create(AOwner: TComponent);
var
  LFrame : TFrame;
  LRepositoryFactory : IRepositoryFactory;
begin
  inherited Create(AOwner);

  LRepositoryFactory := TRepositoryFactory.New();

  LFrame := TfrmKnownShortcuts.Create(Self, LRepositoryFactory, nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository());
  LFrame.Align       := alClient;
  LFrame.Parent      := tsKnownShortcuts;
  LFrame.Visible     := True;

  LFrame := TfrmSearchRegisteredShortcuts.Create(Self, LRepositoryFactory);
  LFrame.Align       := alClient;
  LFrame.Parent      := tsSearchRegisteredShortcuts;
  LFrame.Visible     := True;

  pgc1.ActivePage := tsKnownShortcuts;
end;

end.

