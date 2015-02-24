unit nick.shortcut.core.ShortcutExport;

interface

uses
  nick.shortcut.other.VirtualKeys,
  nick.shortcut.factory.IRepository,
  Vcl.Forms;

type
  {$SCOPEDENUMS ON}
  TDetailsType = (None, IDE, OperatingSystem);
  {$SCOPEDENUMS OFF}

type
  IShortcutExport = interface
    ['{AB7FF5A1-EE46-4E7A-A2C4-C1AC4E3EC6CC}']
    function FileExtension : string;

    function InitialiseExport(const AFileName : string; out AExportData : Pointer) : Boolean;
    procedure FinaliseExport(const AExportData : Pointer);

    procedure StartHeader(const AExportData : Pointer);
    procedure AddHeader(const AExportData : Pointer; const AHeader : string);
    procedure EndHeader(const AExportData : Pointer);

    procedure StartKey(const AExportData : Pointer; const AVirtualKeyDetail: TVirtualKeyDetail);
    procedure EndKey(const AExportData : Pointer);

    procedure StartKeyWithModifier(const AExportData : Pointer);
    procedure AddKeyWithModifierDetails(const AExportData : Pointer; const ADetails : string; const ADetailsType : TDetailsType);
    procedure EndKeyWithModifier(const AExportData : Pointer);
  end;

type
  TShortcutExportClass = class of TShortcutExport;
  TShortcutExport = class abstract(TInterfacedObject, IShortcutExport)
  private
    FRepositoryFactory : IRepositoryFactory;
  protected
    property RepositoryFactory : IRepositoryFactory read FRepositoryFactory;
  public
    class function ExportName() : string; virtual; abstract;

    constructor Create(const ARepositoryFactory : IRepositoryFactory); virtual;

    function FileExtension : string; virtual;

    function InitialiseExport(const AFileName : string; out AExportData : Pointer) : Boolean; virtual;
    procedure FinaliseExport(const AExportData : Pointer); virtual; abstract;

    procedure StartHeader(const AExportData : Pointer); virtual; abstract;
    procedure AddHeader(const AExportData : Pointer; const AHeader : string); virtual; abstract;
    procedure EndHeader(const AExportData : Pointer); virtual; abstract;

    procedure StartKey(const AExportData : Pointer; const AVirtualKeyDetail: TVirtualKeyDetail); virtual; abstract;
    procedure EndKey(const AExportData : Pointer); virtual; abstract;

    procedure StartKeyWithModifier(const AExportData : Pointer); virtual; abstract;
    procedure AddKeyWithModifierDetails(const AExportData : Pointer; const ADetails : string; const ADetailsType : TDetailsType); virtual; abstract;
    procedure EndKeyWithModifier(const AExportData : Pointer); virtual; abstract;
  end;

implementation

{ TShortcutExport }

constructor TShortcutExport.Create(const ARepositoryFactory : IRepositoryFactory);
begin
  inherited Create;
  FRepositoryFactory := ARepositoryFactory;
end;

function TShortcutExport.FileExtension: string;
begin
  Result := '';
end;

function TShortcutExport.InitialiseExport(const AFileName : string; out AExportData : Pointer): Boolean;
begin
  AExportData := nil;
  Result := False;
end;

end.

