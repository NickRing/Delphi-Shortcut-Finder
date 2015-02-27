unit nick.shortcut.other.FileVersionInformation;

interface

uses
  nick.shortcut.other.IFileVersionInformation,
  nick.shortcut.repository.ISystem,
  {$IFDEF VER220}
  Generics.Collections,
  Windows;
  {$ELSE}
  System.Generics.Collections,
  Winapi.Windows;
  {$ENDIF}

type
  TFileVersionInformation = class(TInterfacedObject, IFileVersionInformation)
  private type
    TVersionInformationDetail = record
      DisplayName : string;
      Field : string;
    end;
  private const
    // http://msdn.microsoft.com/en-us/library/windows/desktop/aa381058(v=vs.85).aspx
    TVersionInformationDetails : array[TVersionInformation] of string =(
        'ERROR:',
        'Author',
        'Comments',
        'Company Name',
        'File Description',
        'File Version',
        'Internal Name',
        'Legal Copyright',
        'Legal TradeMarks',
        'Original Filename',
        'Private Build',
        'Product Name',
        'Product Version',
        'Special Build');
  private
    FFileName: string;
    FSystemRepository : ISystemRepository;
    FValuesList : TList<TPair<TVersionInformation, string>>;
    FValuesDictionary : TDictionary<TVersionInformation, string>;
    FVersionFixedFileInfo : PVSFixedFileInfo;
    procedure PopulateVersionInformation;
    function GetCount: Cardinal;
    function GetFieldName(const AIndex: Integer): string;
    function GetFieldValue(const AIndex: Integer): string; overload;
    function GetFieldString(const AIndex: TVersionInformation): string; overload;
    procedure SyncLists(Sender: TObject; const Item: TPair<TVersionInformation, string>; Action: TCollectionNotification);
  public
    constructor Create(const AFileName : string; const ASystemRepository : ISystemRepository);
    destructor Destroy; override;

    function HasErrored : Boolean;
    function GetFileVersion : TVSFixedFileInfo;

    property Count : Cardinal read GetCount;
    property FieldName [const AIndex : Integer] : string read GetFieldName;
    property FieldValue [const AIndex : Integer] : string read GetFieldValue;
    property FieldString [const AIndex : TVersionInformation] : string read GetFieldString;
  end;

implementation

uses
  {$IFDEF VER220}
  SysUtils,
  TypInfo;
  {$ELSE}
  System.SysUtils,
  System.TypInfo;
  {$ENDIF}

constructor TFileVersionInformation.Create(const AFileName : string; const ASystemRepository : ISystemRepository);
begin
  inherited Create;
  FFileName := AFileName;
  FSystemRepository := ASystemRepository;
end;

destructor TFileVersionInformation.Destroy;
begin
  FValuesList.Free;
  FValuesDictionary.Free;
  inherited;
end;

function TFileVersionInformation.GetCount: Cardinal;
begin
  if not Assigned(FValuesList) then
  begin
    FValuesList := TList<TPair<TVersionInformation, string>>.Create;
    FValuesDictionary := TDictionary<TVersionInformation, string>.Create;

    FValuesList.OnNotify := SyncLists;
    PopulateVersionInformation();
  end;
  Result := FValuesList.Count;
end;

function TFileVersionInformation.GetFieldName(const AIndex: Integer): string;
begin
  if HasErrored() then
    Exit('');

  Result := TVersionInformationDetails[FValuesList.Items[AIndex].Key];
end;

function TFileVersionInformation.GetFieldString(const AIndex: TVersionInformation): string;
begin
  if HasErrored() then
    Exit('');

  if not FValuesDictionary.TryGetValue(AIndex, Result) then
    Result := '';
end;

function TFileVersionInformation.GetFieldValue(const AIndex: Integer): string;
begin
  if HasErrored() then
    Exit('');

  Result := FValuesList.Items[AIndex].Value;
end;

function TFileVersionInformation.GetFileVersion: TVSFixedFileInfo;
begin
  if HasErrored() then
    Exit(default(TVSFixedFileInfo));

  Result := FVersionFixedFileInfo^;
end;

function TFileVersionInformation.HasErrored: Boolean;
begin
  Result := (Count = 1) and (FValuesList.Items[0].Key = TVersionInformation.Error);
end;

procedure TFileVersionInformation.PopulateVersionInformation;
var
  LKey: string;
  LLastError: DWORD;
  LSubBlockTemplate: string;
  LTmpDWord: DWORD;
  LVersionInformation: Pointer;
  LVersionInformationSize: DWORD;
  LVersionInfoTranslation : PInteger;
  LValueLen : Cardinal;
  LPCharResult: PChar;
  LResult: string;
  LResultLength: Cardinal;
  LVersionInformationEnum: TVersionInformation;
begin
  LVersionInformationSize := FSystemRepository.GetFileVersionInfoSize(PChar(FFileName), LTmpDWord);

  if (LVersionInformationSize = 0) then
  begin
    LLastError := FSystemRepository.GetLastError();
    FValuesList.Add(TPair<TVersionInformation, string>.Create(TVersionInformation.Error, Format('%d (%0:.4x) - %s', [LLastError, SysErrorMessage(LLastError)])));
    Exit;
  end;

  LVersionInformation := nil;
  try
    FSystemRepository.GetMem(LVersionInformation, LVersionInformationSize);
    FSystemRepository.GetFileVersionInfo(PChar(FFileName), 0, LVersionInformationSize, LVersionInformation);
    FSystemRepository.VerQueryValue(LVersionInformation, PChar('\VarFileInfo\Translation'), Pointer(LVersionInfoTranslation), LValueLen);
    FSystemRepository.VerQueryValue(LVersionInformation, '\', Pointer(FVersionFixedFileInfo), LValueLen);

    LSubBlockTemplate := Format('\StringFileInfo\%4.4x%4.4x\', [LoWord(LVersionInfoTranslation^),
                      HiWord(LVersionInfoTranslation^)]);

    for LVersionInformationEnum := Succ(Low(TVersionInformation)) to High(TVersionInformation) do
    begin
      LKey := GetEnumName(TypeInfo(TVersionInformation), Ord(LVersionInformationEnum));

      if FSystemRepository.VerQueryValue(LVersionInformation, PChar(LSubBlockTemplate + LKey), Pointer(LPCharResult), LResultLength) then
      begin
        LResult := Copy(string(LPCharResult), 1, LResultLength);
        if (LResult <> EmptyStr) then
          FValuesList.Add(TPair<TVersionInformation, string>.Create(LVersionInformationEnum, LResult));
      end;
    end;
  finally
    if Assigned(LVersionInformation) then
      FSystemRepository.FreeMem(LVersionInformation);
  end;
end;

procedure TFileVersionInformation.SyncLists(Sender: TObject; const Item: TPair<TVersionInformation, string>; Action: TCollectionNotification);
begin
  case Action of
    cnAdded :
      begin
        FValuesDictionary.AddOrSetValue(Item.Key, Item.Value);
      end;
    cnRemoved,
    cnExtracted :
      begin
        FValuesDictionary.Remove(Item.Key);
      end;
  end;
end;

end.

