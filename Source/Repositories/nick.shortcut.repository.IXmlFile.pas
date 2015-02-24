unit nick.shortcut.repository.IXmlFile;

interface

uses
  nick.shortcut.other.INodeXml;

type
  IXmlFileRepository = interface
    ['{1D284D2A-E1C8-4FD3-B238-E1AF594A57D4}']
    procedure OpenFile(const AFileName : string);
    procedure Active(const AActive : Boolean);
    function GetRootNode() : INodeXml;
  end;

implementation

end.
