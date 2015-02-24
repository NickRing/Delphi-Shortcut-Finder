unit nick.shortcut.export.Csv;

interface

implementation

uses
  nick.shortcut.repository.ShortcutExport,
  System.SysUtils,
  System.Classes,
  nick.shortcut.core.ShortcutExport,
  nick.shortcut.other.VirtualKeys,
  Vcl.Forms;

type
  TCsvShortcutExport = class(TShortcutExport)
  private
    type
      TCsvShortcutData = class(TObject)
      private
        FStreamWriter : TStreamWriter;
        FRowDetails   : TStrings;
        FCellDetails : TStrings;
      public
        constructor Create(const AFileName : string);
        destructor Destroy; override;

        property CellDetails : TStrings read FCellDetails;
        property RowDetails : TStrings read FRowDetails;
      end;
  private
    function GetUserData(const AExportData : Pointer) : TCsvShortcutData;
  public
    class function ExportName() : string; override;

    function FileExtension : string; override;

    function InitialiseExport(const AFileName : string; out AExportData : Pointer) : Boolean; override;
    procedure FinaliseExport(const AExportData : Pointer); override;

    procedure StartHeader(const AExportData : Pointer); override;
    procedure AddHeader(const AExportData : Pointer; const AHeader : string); override;
    procedure EndHeader(const AExportData : Pointer); override;

    procedure StartKey(const AExportData : Pointer; const AVirtualKeyDetail: TVirtualKeyDetail); override;
    procedure EndKey(const AExportData : Pointer); override;

    procedure StartKeyWithModifier(const AExportData : Pointer); override;
    procedure AddKeyWithModifierDetails(const AExportData : Pointer; const ADetails : string; const ADetailsType : TDetailsType); override;
    procedure EndKeyWithModifier(const AExportData : Pointer); override;
  end;

{ TCsvShortcutExport }

class function TCsvShortcutExport.ExportName: string;
begin
  Result := 'CSV';
end;

function TCsvShortcutExport.InitialiseExport(const AFileName : string; out AExportData: Pointer): Boolean;
begin
  Result := False;
  try
    AExportData := TCsvShortcutData.Create(AFileName);
    Result := True;
  except
    TCsvShortcutData(AExportData).Free;
  end;
end;

function TCsvShortcutExport.FileExtension: string;
begin
  Result := 'csv';
end;

procedure TCsvShortcutExport.FinaliseExport(const AExportData: Pointer);
begin
  GetUserData(AExportData).Free;
end;

function TCsvShortcutExport.GetUserData(const AExportData: Pointer): TCsvShortcutData;
begin
  Result := (TObject(AExportData) as TCsvShortcutData);
end;

procedure TCsvShortcutExport.StartHeader(const AExportData: Pointer);
begin
  GetUserData(AExportData).RowDetails.Clear;
end;

procedure TCsvShortcutExport.AddHeader(const AExportData: Pointer; const AHeader: string);
begin
  GetUserData(AExportData).RowDetails.Add(AHeader);
end;

procedure TCsvShortcutExport.EndHeader(const AExportData: Pointer);
begin
  EndKey(AExportData);
end;

procedure TCsvShortcutExport.StartKey(const AExportData: Pointer; const AVirtualKeyDetail: TVirtualKeyDetail);
var
  LExportData: TCsvShortcutData;
begin
  LExportData := GetUserData(AExportData);
  LExportData.RowDetails.Clear;

  if (AVirtualKeyDetail.ConstantName <> '') then
    LExportData.RowDetails.Add(AVirtualKeyDetail.ConstantName)
  else
    LExportData.RowDetails.Add('$' + IntToHex(AVirtualKeyDetail.Value, 2));

  LExportData.RowDetails.Add(AVirtualKeyDetail.Description);
end;

procedure TCsvShortcutExport.EndKey(const AExportData: Pointer);
var
  LExportData: TCsvShortcutData;
begin
  LExportData := GetUserData(AExportData);
  LExportData.FStreamWriter.WriteLine(LExportData.RowDetails.CommaText);
end;

procedure TCsvShortcutExport.StartKeyWithModifier(const AExportData: Pointer);
begin
  GetUserData(AExportData).CellDetails.Clear;
end;

procedure TCsvShortcutExport.AddKeyWithModifierDetails(const AExportData: Pointer; const ADetails: string; const ADetailsType: TDetailsType);
begin
  GetUserData(AExportData).CellDetails.Add(ADetails)
end;

procedure TCsvShortcutExport.EndKeyWithModifier(const AExportData: Pointer);
var
  LExportData: TCsvShortcutData;
begin
  LExportData := GetUserData(AExportData);
  LExportData.RowDetails.Add(LExportData.CellDetails.CommaText);
end;

{ TCsvShortcutExport.TUserData }

constructor TCsvShortcutExport.TCsvShortcutData.Create(const AFileName: string);
begin
  inherited Create;

  FStreamWriter := TStreamWriter.Create(AFileName, False, TEncoding.Default, 4096);
  FRowDetails   := TStringList.Create;
  FCellDetails := TStringList.Create;
end;

destructor TCsvShortcutExport.TCsvShortcutData.Destroy;
begin
  FRowDetails.Free;
  FCellDetails.Free;
  FStreamWriter.Free;
  inherited;
end;

initialization
  GetShortcutExportRepository().Add(TCsvShortcutExport);

end.

