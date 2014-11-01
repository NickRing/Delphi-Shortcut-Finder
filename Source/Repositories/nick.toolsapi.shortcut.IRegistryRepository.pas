unit nick.toolsapi.shortcut.IRegistryRepository;

interface

type
  IRegistryRepository = interface
    ['{814ACE4F-CCEA-47A0-A4BA-FB30EF655251}']
    procedure CloseKey;
    function OpenKeyReadOnly(const AKey: String): Boolean;
    function ReadString(const Name: string): string;
    function ValueExists(const ASection : string) : Boolean;
    function ReadBool(const ASection : string) : Boolean;
    function ReadInteger(const ASection : string) : Integer;
    function GetDataSize(const ASection : string) : Integer;
    function ReadBinaryData(const AKeyName: string; var ABuffer; ABufferSize: Integer): Integer;
  end;

implementation

end.
