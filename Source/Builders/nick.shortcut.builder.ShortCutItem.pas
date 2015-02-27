unit nick.shortcut.builder.ShortCutItem;

interface

uses
  nick.shortcut.builder.IShortCutItem,
  nick.shortcut.core.IShortCutList,
  nick.shortcut.repository.IRegistry,
  nick.shortcut.repository.IIniFile,
  nick.shortcut.repository.IXmlFile,
  nick.shortcut.other.INodeXml;

function NewShortCutItemBuilder(const AShortCutList : IShortCutList) : IShortCutItemBuilder;

implementation

uses
  nick.shortcut.core.ShortCutItem,
  nick.shortcut.repository.ISystem;

const
  cXML_PATH_SEPARATOR = '/';

{$SCOPEDENUMS ON}
type
  TFileType = (None, Registry, INIFile, XMLFile);

{$REGION 'TBaseStatus<T>'}
type
  TBaseStatus<T> = class (TAggregatedObject, IBuildShortCut)
  protected
    FValue: T;
    FFileType : TFileType;
    FFileName : string;
    FPath : string;
    FSection : string;
    FKey : string;
    FXmlDecoder : TXmlDecoder<T>;
    FRegistryDecoder: TRegistryDecoder<T>;
    FIniDecoder : TIniDecoder<T>;

    function CreateXmlPath(const APath : array of string) : string;
  public
    constructor Create(const Controller: IInterface);

    property Value: T read FValue;
    property FileType : TFileType read FFileType;
    property FileName : string read FFileName;
    property Path : string read FPath;
    property Section : string read FSection;
    property Key : string read FKey;
    property XmlDecoder : TXmlDecoder<T> read FXmlDecoder;
    property RegistryDecoder: TRegistryDecoder<T> read FRegistryDecoder;
    property IniDecoder : TIniDecoder<T> read FIniDecoder;

    // IBuildShortCut
    procedure Build();
  end;
{$ENDREGION}

{$REGION 'TShortCutStatus'}
type
  TShortCutStatus = class(TBaseStatus<TShortCut>, IBuildPrimaryShortCut,
                                                  IBuildShortCutType,

                                                  IBuildXmlShortCutFileName,
                                                  IBuildXmlShortCutPath,
                                                  IBuildXmlShortCutDecoder,

                                                  IBuildIniShortCutFileName,
                                                  IBuildIniShortCutSection,
                                                  IBuildIniShortCutKey,
                                                  IBuildIniShortCutDecoder,

                                                  IBuildRegistryShortCutPath,
                                                  IBuildRegistryShortCutKey,
                                                  IBuildRegistryShortCutDecoder,

                                                  IBuildActiveState
                                                  )
  private
  public
    // IBuildPrimaryShortCut
    function WithShortCut(const AShortCut : TShortCut) : IBuildShortCutType;

    // IBuildShortCutType
    function IsShortCutXMLFile() : IBuildXmlShortCutFileName;
    function IBuildShortCutType.IsXMLFile = IsShortCutXMLFile;
    function IsShortCutINIFile() : IBuildIniShortCutFileName;
    function IBuildShortCutType.IsINIFile = IsShortCutINIFile;
    function IsShortCutRegistry() : IBuildRegistryShortCutPath;
    function IBuildShortCutType.IsRegistry = IsShortCutRegistry;

    // IBuildXmlShortCutFileName
    function WithXmlShortCutFileName(const AFileName : string) : IBuildXmlShortCutPath;
    function IBuildXmlShortCutFileName.WithFileName = WithXmlShortCutFileName;
    // IBuildXmlShortCutPath
    function WithShortCutXmlPath(const APath : array of string) : IBuildXmlShortCutDecoder;
    function IBuildXmlShortCutPath.WithPath = WithShortCutXmlPath;
    // IBuildXmlShortCutDecoder
    function WithShortCutXmlDecoder(const ADecoder : TXmlDecoder<TShortCut>) : IBuildActiveState;
    function IBuildXmlShortCutDecoder.WithDecoder = WithShortCutXmlDecoder;

    // IBuildIniShortCutFileName
    function WithShortCutIniFileName(const AFileName : string) : IBuildIniShortCutSection;
    function IBuildIniShortCutFileName.WithFileName = WithShortCutIniFileName;
    // IBuildIniShortCutSection
    function WithShortCutSection(const ASection : string) : IBuildIniShortCutKey;
    function IBuildIniShortCutSection.WithSection = WithShortCutSection;
    // IBuildIniShortCutKey
    function WithShortCutIniKey(const AKey : string) : IBuildIniShortCutDecoder;
    function IBuildIniShortCutKey.WithKey = WithShortCutIniKey;
    // IBuildIniShortCutDecoder
    function WithShortCutIniDecoder(const ADecoder : TIniDecoder<TShortCut>) : IBuildActiveState;
    function IBuildIniShortCutDecoder.WithDecoder = WithShortCutIniDecoder;

    // IBuildRegistryShortCutPath
    function WithShortCutRegistryPath(const APath : string) : IBuildRegistryShortCutKey;
    function IBuildRegistryShortCutPath.WithPath = WithShortCutRegistryPath;
    // IBuildRegistryShortCutFileName
    function WithShortCutRegistryKey(const AKey : string) : IBuildRegistryShortCutDecoder;
    function IBuildRegistryShortCutKey.WithKey = WithShortCutRegistryKey;
    // IBuildRegistryShortCutDecoder
    function WithShortCutRegistryDecoder(const ADecoder : TRegistryDecoder<TShortCut>) : IBuildActiveState;
    function IBuildRegistryShortCutDecoder.WithDecoder = WithShortCutRegistryDecoder;

    // IBuildActiveState
    function GetBuildActiveState : IBuildActiveState;
    property BuildActiveState : IBuildActiveState read GetBuildActiveState implements IBuildActiveState;

    // IBuildShortCutType => IBuildActiveType
    function WithActiveState(const AIsActive : Boolean) : IBuildActiveType;
  end;
{$ENDREGION}

{$REGION 'TPrimaryActive'}
type
  TPrimaryActive = class(TBaseStatus<Boolean>, IBuildActiveState,
                                               IBuildActiveType,

                                               IBuildXmlActiveFileName,
                                               IBuildXmlActivePath,
                                               IBuildXmlActiveDecoder,

                                               IBuildIniActiveFileName,
                                               IBuildIniActiveSection,
                                               IBuildIniActiveKey,
                                               IBuildIniActiveDecoder,

                                               IBuildRegistryActivePath,
                                               IBuildRegistryActiveKey,
                                               IBuildRegistryActiveDecoder,

                                               IBuildParentActiveState,
                                               IBuildShortCut)
  public
    // IBuildActiveState
    function WithActiveState(const AIsActive : Boolean) : IBuildActiveType;

    // IBuildActiveType
    function IsActiveXMLFile() : IBuildXmlActiveFileName;
    function IBuildActiveType.IsXMLFile = IsActiveXMLFile;

    function IsActiveINIFile() : IBuildIniActiveFileName;
    function IBuildActiveType.IsINIFile = IsActiveINIFile;

    function IsActiveRegistry() : IBuildRegistryActivePath;
    function IBuildActiveType.IsRegistry = IsActiveRegistry;

    // IBuildXmlActiveFileName
    function WithXmlActiveFileName(const AFileName : string) : IBuildXmlActivePath;
    function IBuildXmlActiveFileName.WithFileName = WithXmlActiveFileName;
    // IBuildXmlActivePath
    function WithActiveXmlPath(const APath : array of string) : IBuildXmlActiveDecoder;
    function IBuildXmlActivePath.WithPath = WithActiveXmlPath;
    // IBuildXmlActiveDecoder
    function WithActiveXmlDecoder(const ADecoder : TXmlDecoder<Boolean>) : IBuildParentActiveState;
    function IBuildXmlActiveDecoder.WithDecoder = WithActiveXmlDecoder;

    // IBuildIniActiveFileName
    function WithActiveIniFileName(const AFileName : string) : IBuildIniActiveSection;
    function IBuildIniActiveFileName.WithFileName = WithActiveIniFileName;
    // IBuildIniActiveSection
    function WithActiveSection(const ASection : string) : IBuildIniActiveKey;
    function IBuildIniActiveSection.WithSection = WithActiveSection;
    // IBuildIniActiveKey
    function WithActiveIniKey(const AKey : string) : IBuildIniActiveDecoder;
    function IBuildIniActiveKey.WithKey = WithActiveIniKey;
    // IBuildIniActiveDecoder
    function WithActiveIniDecoder(const ADecoder : TIniDecoder<Boolean>) : IBuildParentActiveState;
    function IBuildIniActiveDecoder.WithDecoder = WithActiveIniDecoder;

    // IBuildRegistryActivePath
    function WithActiveRegistryPath(const APath : string) : IBuildRegistryActiveKey;
    function IBuildRegistryActivePath.WithPath = WithActiveRegistryPath;
    // IBuildRegistryActiveKey
    function WithActiveRegistryKey(const AKey : string) : IBuildRegistryActiveDecoder;
    function IBuildRegistryActiveKey.WithKey = WithActiveRegistryKey;
    // IBuildRegistryActiveDecoder
    function WithActiveRegistryDecoder(const ADecoder : TRegistryDecoder<Boolean>) : IBuildParentActiveState;
    function IBuildRegistryActiveDecoder.WithDecoder = WithActiveRegistryDecoder;

    // IBuildParentActiveState
    function GetBuildParentState : IBuildParentActiveState;
    property BuildParentState : IBuildParentActiveState read GetBuildParentState implements IBuildParentActiveState;
  end;
{$ENDREGION}

{$REGION 'TParentActive'}
type
  TParentActive = class(TBaseStatus<Boolean>, IBuildParentActiveState,
                                              IBuildParentActiveType,

                                              IBuildXmlParentActiveFileName,
                                              IBuildXmlParentActivePath,
                                              IBuildXmlParentActiveDecoder,

                                              IBuildIniParentActiveFileName,
                                              IBuildIniParentActiveSection,
                                              IBuildIniParentActiveKey,
                                              IBuildIniParentActiveDecoder,

                                              IBuildRegistryParentActivePath,
                                              IBuildRegistryParentActiveKey,
                                              IBuildRegistryParentActiveDecoder,

                                              IBuildShortCut)
  public
    // IBuildParentActiveState
    function WithParentActiveState(const AIsActive : Boolean) : IBuildParentActiveType;

    // IBuildParentActiveType
    function IsParentActiveXMLFile() : IBuildXmlParentActiveFileName;
    function IBuildParentActiveType.IsXMLFile = IsParentActiveXMLFile;

    function IsParentActiveINIFile() : IBuildIniParentActiveFileName;
    function IBuildParentActiveType.IsINIFile = IsParentActiveINIFile;

    function IsParentActiveRegistry() : IBuildRegistryParentActivePath;
    function IBuildParentActiveType.IsRegistry = IsParentActiveRegistry;

    // IBuildXmlParentActiveFileName
    function WithXmlParentActiveFileName(const AFileName : string) : IBuildXmlParentActivePath;
    function IBuildXmlParentActiveFileName.WithFileName = WithXmlParentActiveFileName;
    // IBuildXmlParentActivePath
    function WithParentActiveXmlPath(const APath : array of string) : IBuildXmlParentActiveDecoder;
    function IBuildXmlParentActivePath.WithPath = WithParentActiveXmlPath;
    // IBuildXmlParentActiveDecoder
    function WithParentActiveXmlDecoder(const ADecoder : TXmlDecoder<Boolean>) : IBuildShortCut;
    function IBuildXmlParentActiveDecoder.WithDecoder = WithParentActiveXmlDecoder;

    // IBuildIniParentActiveFileName
    function WithParentActiveIniFileName(const AFileName : string) : IBuildIniParentActiveSection;
    function IBuildIniParentActiveFileName.WithFileName = WithParentActiveIniFileName;
    // IBuildIniParentActiveSection
    function WithParentActiveSection(const ASection : string) : IBuildIniParentActiveKey;
    function IBuildIniParentActiveSection.WithSection = WithParentActiveSection;
    // IBuildIniParentActiveKey
    function WithParentActiveIniKey(const AKey : string) : IBuildIniParentActiveDecoder;
    function IBuildIniParentActiveKey.WithKey = WithParentActiveIniKey;
    // IBuildIniParentActiveDecoder
    function WithParentActiveIniDecoder(const ADecoder : TIniDecoder<Boolean>) : IBuildShortCut;
    function IBuildIniParentActiveDecoder.WithDecoder = WithParentActiveIniDecoder;

    // IBuildRegistryParentActivePath
    function WithParentActiveRegistryPath(const APath : string) : IBuildRegistryParentActiveKey;
    function IBuildRegistryParentActivePath.WithPath = WithParentActiveRegistryPath;
    // IBuildRegistryParentActiveKey
    function WithParentActiveRegistryKey(const AKey : string) : IBuildRegistryParentActiveDecoder;
    function IBuildRegistryParentActiveKey.WithKey = WithParentActiveRegistryKey;
    // IBuildRegistryParentActiveDecoder
    function WithParentActiveRegistryDecoder(const ADecoder : TRegistryDecoder<Boolean>) : IBuildShortCut;
    function IBuildRegistryParentActiveDecoder.WithDecoder = WithParentActiveRegistryDecoder;
  end;
{$ENDREGION}

type
  TShortCutItemBuilder = class(TInterfacedObject, IShortCutItemBuilder,
                                                  IBuildDescription,
                                                  IBuildPrimaryShortCut,
                                                  IBuildActiveState,
                                                  IBuildParentActiveState,
                                                  IBuildShortCut)
  private
    FShortCutList: IShortCutList;

    FDetail: string;
    FDescription : string;

    FShortCut : TShortCutStatus;
    FActive : TPrimaryActive;
    FParentActive : TParentActive;

    function GetOverride<T>(const AStatus: TBaseStatus<T>): T;

    function FindXmlNode(const AXmlFileRepository: IXmlFileRepository; const APath: string): INodeXml;

    function GetXmlSetting<T>(const AStatus: TBaseStatus<T>; out ASetting : T) : Boolean;
    function GetRegistrySetting<T>(const AStatus: TBaseStatus<T>; out ASetting : T) : Boolean;
    function GetIniSetting<T>(const AStatus: TBaseStatus<T>; out ASetting : T): Boolean;
  public
    constructor Create(const AShortCutList : IShortCutList);
    destructor Destroy; override;

    // IShortCutItemBuilder
    function WithDetail(const ADetail : string) : IBuildDescription;
    // IBuildDescription
    function WithDescription(const ADescription : string) : IBuildPrimaryShortCut;
    // IBuildDescription => IBuildShortCutType
    function WithShortCut(const AShortCut : TShortCut) : IBuildShortCutType;

    // IBuildPrimaryShortCut
    function GetPrimaryShortCutBuilder() : IBuildPrimaryShortCut;
    property PrimaryShortCutBuilder : IBuildPrimaryShortCut read GetPrimaryShortCutBuilder implements IBuildPrimaryShortCut;

    // IBuildActiveState
    function GetBuildActiveState : IBuildActiveState;
    property BuildActiveState : IBuildActiveState read GetBuildActiveState implements IBuildActiveState;

    // IBuildParentActiveState
    function GetBuildParentActiveState : IBuildParentActiveState;
    property BuildParentActiveState : IBuildParentActiveState read GetBuildParentActiveState implements IBuildParentActiveState;

    // IBuildShortCut
    procedure Build();
  end;

function NewShortCutItemBuilder(const AShortCutList : IShortCutList) : IShortCutItemBuilder;
begin
  Result := TShortCutItemBuilder.Create(AShortCutList);
end;

{$REGION 'TBaseStatus<T> methods'}

{ TStatus<T> }

constructor TBaseStatus<T>.Create(const Controller: IInterface);
begin
  inherited Create(Controller);

  FValue := default(T);
  FFileType := TFileType.None;
end;

function TBaseStatus<T>.CreateXmlPath(const APath: array of string): string;
var
  LString: string;
begin
  Result := '';
  for LString in APath do
    Result := Result + LString + cXML_PATH_SEPARATOR;
end;

procedure TBaseStatus<T>.Build;
begin
  (Controller as IBuildShortCut).Build;
end;
{$ENDREGION}

{$REGION 'TShortCutStatus methods'}

{ TShortCutStatus }

function TShortCutStatus.GetBuildActiveState: IBuildActiveState;
begin
  Result := (Controller as IBuildActiveState);
end;

function TShortCutStatus.IsShortCutINIFile: IBuildIniShortCutFileName;
begin
  FFileType := TFileType.INIFile;
  Result := Self;
end;

function TShortCutStatus.IsShortCutRegistry: IBuildRegistryShortCutPath;
begin
  FFileType := TFileType.Registry;
  Result := Self;
end;

function TShortCutStatus.IsShortCutXMLFile: IBuildXmlShortCutFileName;
begin
  FFileType := TFileType.XMLFile;
  Result := Self;
end;

function TShortCutStatus.WithActiveState(const AIsActive: Boolean): IBuildActiveType;
begin
  Result := GetBuildActiveState.WithActiveState(AIsActive);
end;

function TShortCutStatus.WithShortCut(const AShortCut: TShortCut): IBuildShortCutType;
begin
  FValue := AShortCut;
  Result := Self;
end;

function TShortCutStatus.WithShortCutIniDecoder(const ADecoder: TIniDecoder<TShortCut>): IBuildActiveState;
begin
  FIniDecoder := ADecoder;
  Result := Self;
end;

function TShortCutStatus.WithShortCutIniFileName(const AFileName: string): IBuildIniShortCutSection;
begin
  FFileName := AFileName;
  Result := Self;
end;

function TShortCutStatus.WithShortCutIniKey(const AKey: string): IBuildIniShortCutDecoder;
begin
  FKey := AKey;
  Result := Self;
end;

function TShortCutStatus.WithShortCutRegistryDecoder(const ADecoder: TRegistryDecoder<TShortCut>): IBuildActiveState;
begin
  FRegistryDecoder := ADecoder;
  Result := Self;
end;

function TShortCutStatus.WithShortCutRegistryKey(const AKey: string): IBuildRegistryShortCutDecoder;
begin
  FKey := AKey;
  Result := Self;
end;

function TShortCutStatus.WithShortCutRegistryPath(const APath: string): IBuildRegistryShortCutKey;
begin
  FPath := APath;
  Result := Self;
end;

function TShortCutStatus.WithShortCutSection(const ASection: string): IBuildIniShortCutKey;
begin
  FSection := ASection;
  Result := Self;
end;

function TShortCutStatus.WithShortCutXmlDecoder(const ADecoder: TXmlDecoder<TShortCut>): IBuildActiveState;
begin
  FXmlDecoder := ADecoder;
  Result := Self;
end;

function TShortCutStatus.WithShortCutXmlPath(const APath: array of string): IBuildXmlShortCutDecoder;
begin
  FPath := CreateXmlPath(APath);
  Result := Self;
end;

function TShortCutStatus.WithXmlShortCutFileName(const AFileName: string): IBuildXmlShortCutPath;
begin
  FFileName := AFileName;
  Result := Self;
end;
{$ENDREGION}

{$REGION 'TPrimaryActive methods'}
{ TPrimaryActive }

function TPrimaryActive.GetBuildParentState: IBuildParentActiveState;
begin
  Result := (Controller as IBuildParentActiveState);
end;

function TPrimaryActive.IsActiveINIFile: IBuildIniActiveFileName;
begin
  FFileType := TFileType.INIFile;
  Result := Self;
end;

function TPrimaryActive.IsActiveRegistry: IBuildRegistryActivePath;
begin
  FFileType := TFileType.Registry;
  Result := Self;
end;

function TPrimaryActive.IsActiveXMLFile: IBuildXmlActiveFileName;
begin
  FFileType := TFileType.XMLFile;
  Result := Self;
end;

function TPrimaryActive.WithActiveIniDecoder(const ADecoder: TIniDecoder<Boolean>): IBuildParentActiveState;
begin
  FIniDecoder := ADecoder;
  Result := Self;
end;

function TPrimaryActive.WithActiveIniFileName(const AFileName: string): IBuildIniActiveSection;
begin
  FFileName := AFileName;
  Result := Self;
end;

function TPrimaryActive.WithActiveIniKey(const AKey: string): IBuildIniActiveDecoder;
begin
  FKey := AKey;
  Result := Self;
end;

function TPrimaryActive.WithActiveRegistryDecoder(const ADecoder: TRegistryDecoder<Boolean>): IBuildParentActiveState;
begin
  FRegistryDecoder := ADecoder;
  Result := Self;
end;

function TPrimaryActive.WithActiveRegistryKey(const AKey: string): IBuildRegistryActiveDecoder;
begin
  FKey := AKey;
  Result := Self;
end;

function TPrimaryActive.WithActiveRegistryPath(const APath: string): IBuildRegistryActiveKey;
begin
  FPath := APath;
  Result := Self;
end;

function TPrimaryActive.WithActiveSection(const ASection: string): IBuildIniActiveKey;
begin
  FSection := ASection;
  Result := Self;
end;

function TPrimaryActive.WithActiveState(const AIsActive: Boolean): IBuildActiveType;
begin
  FValue := AIsActive;
  Result := Self;
end;

function TPrimaryActive.WithActiveXmlDecoder(const ADecoder: TXmlDecoder<Boolean>): IBuildParentActiveState;
begin
  FXmlDecoder := ADecoder;
  Result := Self;
end;

function TPrimaryActive.WithActiveXmlPath(const APath: array of string): IBuildXmlActiveDecoder;
begin
  FPath := CreateXmlPath(APath);
  Result := Self;
end;

function TPrimaryActive.WithXmlActiveFileName(const AFileName: string): IBuildXmlActivePath;
begin
  FFileName := AFileName;
  Result := Self;
end;

{$ENDREGION}

{$REGION 'TParentActive methods'}
{ TParentActive }

function TParentActive.IsParentActiveINIFile: IBuildIniParentActiveFileName;
begin
  FFileType := TFileType.INIFile;
  Result := Self;
end;

function TParentActive.IsParentActiveRegistry: IBuildRegistryParentActivePath;
begin
  FFileType := TFileType.Registry;
  Result := Self;
end;

function TParentActive.IsParentActiveXMLFile: IBuildXmlParentActiveFileName;
begin
  FFileType := TFileType.XMLFile;
  Result := Self;
end;

function TParentActive.WithParentActiveIniDecoder(const ADecoder: TIniDecoder<Boolean>): IBuildShortCut;
begin
  FIniDecoder := ADecoder;
  Result := Self;
end;

function TParentActive.WithParentActiveIniFileName(const AFileName: string): IBuildIniParentActiveSection;
begin
  FFileName := AFileName;
  Result := Self;
end;

function TParentActive.WithParentActiveIniKey(const AKey: string): IBuildIniParentActiveDecoder;
begin
  FKey := AKey;
  Result := Self;
end;

function TParentActive.WithParentActiveRegistryDecoder(const ADecoder: TRegistryDecoder<Boolean>): IBuildShortCut;
begin
  FRegistryDecoder := ADecoder;
  Result := Self;
end;

function TParentActive.WithParentActiveRegistryKey(const AKey: string): IBuildRegistryParentActiveDecoder;
begin
  FKey := AKey;
  Result := Self;
end;

function TParentActive.WithParentActiveRegistryPath(const APath: string): IBuildRegistryParentActiveKey;
begin
  FPath := APath;
  Result := Self;
end;

function TParentActive.WithParentActiveSection(const ASection: string): IBuildIniParentActiveKey;
begin
  FSection := ASection;
  Result := Self;
end;

function TParentActive.WithParentActiveState(const AIsActive: Boolean): IBuildParentActiveType;
begin
  FValue := AIsActive;
  Result := Self;
end;

function TParentActive.WithParentActiveXmlDecoder(const ADecoder: TXmlDecoder<Boolean>): IBuildShortCut;
begin
  FXmlDecoder := ADecoder;
  Result := Self;
end;

function TParentActive.WithParentActiveXmlPath(const APath: array of string): IBuildXmlParentActiveDecoder;
begin
  FPath := CreateXmlPath(APath);
  Result := Self;
end;

function TParentActive.WithXmlParentActiveFileName(const AFileName: string): IBuildXmlParentActivePath;
begin
  FFileName := AFileName;
  Result := Self;
end;

{$ENDREGION}

{ TShortCutItemBuilder }

constructor TShortCutItemBuilder.Create(const AShortCutList: IShortCutList);
begin
  inherited Create();
  FShortCutList := AShortCutList;

  FShortCut := nil;
  FActive := nil;
  FParentActive := nil;
end;

destructor TShortCutItemBuilder.Destroy;
begin
  FShortCut.Free;
  FActive.Free;
  FParentActive.Free;
  inherited;
end;

function TShortCutItemBuilder.FindXmlNode(const AXmlFileRepository: IXmlFileRepository; const APath: string): INodeXml;
var
  LIdx: Integer;
  LKey: string;
  LPath: string;
begin
  Result := nil;

  if (APath = '') then
    Exit;

  LPath := APath;

  Result := AXmlFileRepository.GetRootNode();

  while (LPath <> '') and Assigned(Result) do
  begin
    LIdx := Pos(cXML_PATH_SEPARATOR, LPath);
    if (LIdx <> 0) then
    begin
      LKey := Copy(LPath, 1, LIdx - 1);
      Delete(LPath, 1, LIdx);
    end
    else
    begin
      LKey := LPath;
      LPath := '';
    end;

    Result := Result.GetNode(LKey);
  end;
end;

function TShortCutItemBuilder.GetBuildActiveState: IBuildActiveState;
begin
  if not Assigned(FActive) then
    FActive := TPrimaryActive.Create(Self);
  Result := FActive;
end;

function TShortCutItemBuilder.GetBuildParentActiveState: IBuildParentActiveState;
begin
  if not Assigned(FParentActive) then
    FParentActive := TParentActive.Create(Self);
  Result := FParentActive;
end;

function TShortCutItemBuilder.GetIniSetting<T>(const AStatus: TBaseStatus<T>; out ASetting: T): Boolean;
var
  LIniFileRepository: IIniFileRepository;
begin
  Result := False;
  ASetting := default(T);

  if (not FShortCutList.SystemRepository.FileExists(AStatus.FileName)) then
    Exit;

  LIniFileRepository := FShortCutList.IniFileRepository();

  LIniFileRepository.OpenFile(AStatus.FileName);

  if (not LIniFileRepository.Exists(AStatus.Section, AStatus.Key)) then
    Exit;

  Result := True;
  ASetting := AStatus.FIniDecoder(LIniFileRepository, AStatus.Section, AStatus.Key);
end;

function TShortCutItemBuilder.GetPrimaryShortCutBuilder: IBuildPrimaryShortCut;
begin
  if not Assigned(FShortCut) then
    FShortCut := TShortCutStatus.Create(Self);
  Result := FShortCut;
end;

function TShortCutItemBuilder.GetRegistrySetting<T>(const AStatus: TBaseStatus<T>; out ASetting: T): Boolean;
var
  LPath: string;
  LRegistryRepository: IRegistryRepository;
  LSectionKey: string;
begin
  Result := False;
  ASetting := default(T);

  LRegistryRepository := FShortCutList.RegistryRepository();

  if not LRegistryRepository.OpenKeyReadOnly(AStatus.Path) then
    Exit;

  try
    if not LRegistryRepository.ValueExists(AStatus.Key) then
      Exit;

    ASetting := AStatus.RegistryDecoder(LRegistryRepository, AStatus.Key);
    Result := True;
  finally
    LRegistryRepository.CloseKey;
  end;
end;

function TShortCutItemBuilder.GetXmlSetting<T>(const AStatus: TBaseStatus<T>; out ASetting: T): Boolean;
var
  LIdx: Integer;
  LKey: string;
  LNodeXml: INodeXml;
  LXmlFileRepository: IXmlFileRepository;
  LSection: string;
  LSectionKey : string;
begin
  Result := False;
  ASetting := default(T);

  if (not FShortCutList.SystemRepository.FileExists(AStatus.FileName)) then
    Exit;

  LXmlFileRepository := FShortCutList.XmlFileRepository();

  LXmlFileRepository.OpenFile(AStatus.FileName);
  try
    LXmlFileRepository.Active(True);
  except
    // If any errors are raised while parsing the XML, then abort this process.
    Exit;
  end;

  try
    LNodeXml := FindXmlNode(LXmlFileRepository, AStatus.Path);

    if not Assigned(LNodeXml) then
      Exit;

    Result := True;
    ASetting := AStatus.XmlDecoder(LNodeXml);
  finally
    LXmlFileRepository.Active(False);
  end;
end;

function TShortCutItemBuilder.WithDescription(const ADescription: string): IBuildPrimaryShortCut;
begin
  FDescription := ADescription;
  Result := Self;
end;

function TShortCutItemBuilder.WithDetail(const ADetail: string): IBuildDescription;
begin
  FDetail := ADetail;
  Result := Self;
end;

function TShortCutItemBuilder.WithShortCut(const AShortCut: TShortCut): IBuildShortCutType;
begin
  Result := PrimaryShortCutBuilder.WithShortCut(AShortCut);
end;

function TShortCutItemBuilder.GetOverride<T>(const AStatus: TBaseStatus<T>): T;
var
  LGotResult: Boolean;
  LSettingValue : T;
begin
  Result := AStatus.Value;

  LGotResult := False;

  case AStatus.FFileType of
    TFileType.XMLFile : LGotResult := GetXmlSetting<T>(AStatus, LSettingValue);
    TFileType.Registry : LGotResult := GetRegistrySetting<T>(AStatus, LSettingValue);
    TFileType.INIFile : LGotResult := GetIniSetting<T>(AStatus, LSettingValue);
  end;

  if not LGotResult then
    Exit;

  Result := LSettingValue;
end;

procedure TShortCutItemBuilder.Build;
var
  LActive: Boolean;
  LParentActive: Boolean;
  LShortCut: TShortCut;
begin
  if not Assigned(FShortCut) then
    Exit;

  LShortCut := FShortCut.Value;
  LActive := True;
  LParentActive := True;

  if Assigned(FActive) and (FActive.FFileType <> TFileType.None) then
    LActive := GetOverride<Boolean>(FActive);

  if (not LActive) then
    Exit;

  if Assigned(FParentActive) and (FParentActive.FFileType <> TFileType.None) then
    LParentActive := GetOverride<Boolean>(FParentActive);

  if (not LParentActive) then
    Exit;

  if (FShortCut.FileType <> TFileType.None) then
    LShortCut := GetOverride<TShortCut>(FShortCut);

  FShortCutList.Add(NewShortCut(FDetail, LShortCut, scNone, FDescription));
end;

end.

