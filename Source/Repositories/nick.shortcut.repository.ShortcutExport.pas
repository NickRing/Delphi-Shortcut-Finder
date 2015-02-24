unit nick.shortcut.repository.ShortcutExport;

interface

uses
  nick.shortcut.core.ShortcutExport;

type
  IShortcutExportRepository = interface
    ['{474C2693-276A-4941-A57A-3D6AE146D6EE}']
    procedure Add(const AShortcutExportClass : TShortcutExportClass);
    function ExportsList() : TArray<TShortcutExportClass>;
    function Count : Integer;
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
    destructor Destroy; override;

    procedure Add(const AShortcutExportClass : TShortcutExportClass);

    function ExportsList() : TArray<TShortcutExportClass>;
    function Count : Integer;
  end;

function GetShortcutExportRepository() : IShortcutExportRepository;
begin
  if not Assigned(LShortcutExportRepository) then
    LShortcutExportRepository := TShortcutExportRepository.Create;

  Result := LShortcutExportRepository;
end;

{ TShortcutExportRepository }

procedure TShortcutExportRepository.Add(const AShortcutExportClass: TShortcutExportClass);
begin
  FShortcutExportClassList.Add(AShortcutExportClass);
end;

function TShortcutExportRepository.Count: Integer;
begin
  Result := FShortcutExportClassList.Count;
end;

constructor TShortcutExportRepository.Create;
begin
  inherited Create;
  FShortcutExportClassList := TList<TShortcutExportClass>.Create;
end;

destructor TShortcutExportRepository.Destroy;
begin
  FShortcutExportClassList.Free;
  inherited;
end;

function TShortcutExportRepository.ExportsList: TArray<TShortcutExportClass>;
begin
  Result := FShortcutExportClassList.ToArray;
end;

end.

