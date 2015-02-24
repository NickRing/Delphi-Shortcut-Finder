unit nick.shortcut.repository.IIniFile;

interface

type
  IIniFileRepository = interface
    ['{9E29D406-7FB9-46B5-9DE9-79AFC8AC25A4}']
    procedure OpenFile(const AFileName : string);
    function Exists(const ASection : string; const AIdent : string) : Boolean;
    function ReadString(const ASection : string; const AIdent : string; const ADefault : string): string;
  end;

implementation

end.
