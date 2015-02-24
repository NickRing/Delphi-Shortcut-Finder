unit nick.shortcut.repository.IShortcutExport;

interface

type
  IShortcutExportRepository = interface
    ['{474C2693-276A-4941-A57A-3D6AE146D6EE}']
  end;

function GetShortcutExportRepository() : IShortcutExportRepository;

implementation

uses
  System.Generics.Collections;

var
  LShortcutExportRepository : IShortcutExportRepository = nil;

type
  TShortcutExportRepository = class(TInterfacedObject, IShortcutExportRepository)
  private
    FShortcutExportClassList : TList<TShortcutExportClass>;
  public
    constructor Create;
    destructor Destory; override;
  end;

function GetShortcutExportRepository() : IShortcutExportRepository;
begin
  if not Assigned(LShortcutExportRepository) then
    LShortcutExportRepository := TShortcutExportRepository.Create;

  Result := LShortcutExportRepository;
end;

{ TShortcutExportRepository }

constructor TShortcutExportRepository.Create;
begin

end;

destructor TShortcutExportRepository.Destory;
begin

  inherited;
end;

end.

