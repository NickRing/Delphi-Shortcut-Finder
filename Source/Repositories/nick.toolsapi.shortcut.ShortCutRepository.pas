unit nick.toolsapi.shortcut.ShortCutRepository;

interface

uses
  nick.toolsapi.shortcut.ShortCutList,
  nick.toolsapi.shortcut.IShortCutList,
  Generics.Collections;

type
  IShortCutRepository = interface
    ['{086C2D97-295A-43E6-8F20-823212F2FF28}']
    procedure Add(const AShortCutListClass : TShortCutListClass);

    function GetShortCutElements : TArray<IShortCutList>;
  end;

function GetShortCutRepository() : IShortCutRepository;

implementation

uses
  SysUtils,
  nick.toolsapi.shortcut.IRepositoryFactory,
  nick.toolsapi.shortcut.RepositoryFactory;

var
  FShortCutRepository : IShortCutRepository = nil;

type
  TShortCutRepository = class(TInterfacedObject, IShortCutRepository)
  private
    FShortCutListClassList : TList<TShortCutListClass>;
    FRepositoryFactory : IRepositoryFactory;
  public
    constructor Create(const ARepositoryFactory : IRepositoryFactory);
    destructor Destroy; override;

    procedure Add(const AShortCutListClass : TShortCutListClass);

    function GetShortCutElements : TArray<IShortCutList>;
  end;

constructor TShortCutRepository.Create(const ARepositoryFactory : IRepositoryFactory);
begin
  inherited Create();
  FRepositoryFactory := ARepositoryFactory;
  FShortCutListClassList := TList<TShortCutListClass>.Create;
end;

destructor TShortCutRepository.Destroy;
begin
  FShortCutListClassList.Free;
  inherited;
end;

function GetShortCutRepository() : IShortCutRepository;
begin
  if not Assigned(FShortCutRepository) then
    FShortCutRepository := TShortCutRepository.Create(TRepositoryFactory.New());

  Result := FShortCutRepository;
end;

procedure TShortCutRepository.Add(const AShortCutListClass: TShortCutListClass);
begin
  FShortCutListClassList.Add(AShortCutListClass);
end;

function TShortCutRepository.GetShortCutElements: TArray<IShortCutList>;
var
  LShortCutListList : TList<IShortCutList>;
  LShortCutList : IShortCutList;
  LShortCutListClass: TShortCutListClass;
begin
  LShortCutListList := nil;
  try
    LShortCutListList := TList<IShortCutList>.Create;

    for LShortCutListClass in FShortCutListClassList do
    begin
      LShortCutList := LShortCutListClass.Create(FRepositoryFactory);
      if (LShortCutList.IsUseable) then
      begin
        LShortCutList.RetrieveShortCuts();
        if (LShortCutList.Count <> 0) then
          LShortCutListList.Add(LShortCutList);
      end;
    end;

    Result := LShortCutListList.ToArray;
  finally
    LShortCutListList.Free;
  end;
end;

end.

