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
    tsKnownAddons: TTabSheet;
    tsIdeRegisteredShortCut: TTabSheet;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  nick.toolsapi.shortcut.KnownAddOnFrame,
  nick.toolsapi.shortcut.IdeRegisteredShortCutFrame,
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

  LFrame := TfrmKnownAddOn.Create(Self, LRepositoryFactory, nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository());
  LFrame.Align       := alClient;
  LFrame.Parent      := tsKnownAddons;
  LFrame.Visible     := True;

  LFrame := TfrmIdeRegisteredShortCut.Create(Self, LRepositoryFactory);
  LFrame.Align       := alClient;
  LFrame.Parent      := tsIdeRegisteredShortCut;
  LFrame.Visible     := True;

  pgc1.ActivePage := tsKnownAddons;
end;

end.

