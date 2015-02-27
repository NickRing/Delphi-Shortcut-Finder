unit nick.shortcut.core.ShortCutItem;

interface

uses
  nick.shortcut.repository.ISystem;

type
  IShortCutItem = interface
    ['{8763284E-F82E-4FD2-AD17-7830FB5D6400}']
    function GetDescription: string;
    function GetPrimary: TShortCut;
    function GetSecondary: TShortCut;
    function GetDetails: string;

    property Details : string read GetDetails;
    property Primary : TShortCut read GetPrimary;
    property Secondary : TShortCut read GetSecondary;
    property Description : string read GetDescription;
  end;

function NewShortCut(const ADetails : string; const APrimary : TShortCut; const ASecondary : TShortCut; const ADescription : string) : IShortCutItem;

implementation

type
  TShortCutItem = class(TInterfacedObject, IShortCutItem)
  private
    FDetails : string;
    FPrimary : TShortCut;
    FSecondary : TShortCut;
    FDescription : string;

    function GetDetails: string;
    function GetPrimary: TShortCut;
    function GetSecondary: TShortCut;
    function GetDescription: string;
  public
    constructor Create(const ADetails : string; const APrimary : TShortCut; const ASecondary : TShortCut; const ADescription : string);

    property Details : string read GetDetails;
    property Primary : TShortCut read GetPrimary;
    property Secondary : TShortCut read GetSecondary;
    property Description : string read GetDescription;
  end;

function NewShortCut(const ADetails : string; const APrimary : TShortCut; const ASecondary : TShortCut; const ADescription : string) : IShortCutItem;
begin
  Result := TShortCutItem.Create(ADetails, APrimary, ASecondary, ADescription);
end;

constructor TShortCutItem.Create(const ADetails : string;
                                 const APrimary : TShortCut;
                                 const ASecondary : TShortCut;
                                 const ADescription : string);
begin
  inherited Create;

  FDetails := ADetails;
  FPrimary := APrimary;
  FSecondary := ASecondary;
  FDescription := ADescription;
end;

function TShortCutItem.GetDescription: string;
begin
  Result := FDescription;
end;

function TShortCutItem.GetDetails: string;
begin
  Result := FDetails;
end;

function TShortCutItem.GetPrimary: TShortCut;
begin
  Result := FPrimary;
end;

function TShortCutItem.GetSecondary: TShortCut;
begin
  Result := FSecondary;
end;

end.
