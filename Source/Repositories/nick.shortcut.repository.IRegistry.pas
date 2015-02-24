unit nick.shortcut.repository.IRegistry;

interface

type
  IRegistryRepository = interface
    ['{814ACE4F-CCEA-47A0-A4BA-FB30EF655251}']
    procedure CloseKey;
    function OpenKeyReadOnly(const AKey: String): Boolean;
    function OpenKey(const AKey: String; const ACanCreate : Boolean): Boolean;
    procedure SetAccess(const AAccess : LongWord);

    function ValueExists(const ASection : string) : Boolean;
    function GetDataSize(const ASection : string) : Integer;

    function ReadString(const Name: string): string;
    function ReadBool(const ASection : string) : Boolean;
    function ReadInteger(const ASection : string) : Integer; overload;
    function ReadInteger(const ASection : string; const ADefault : Integer) : Integer; overload;
    function ReadBinaryData(const AKeyName: string; var ABuffer; ABufferSize: Integer): Integer;

    procedure WriteInteger(const ASection : string; const AValue : Integer);
  end;

implementation

end.
