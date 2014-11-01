unit nick.toolsapi.shortcut.IXmlFileRepository;

interface

uses
  nick.toolsapi.shortcut.INodeXml;

type
  IXmlFileRepository = interface
    ['{1D284D2A-E1C8-4FD3-B238-E1AF594A57D4}']
    procedure OpenFile(const AFileName : string);
    procedure Active(const AActive : Boolean);
    function GetRootNode() : INodeXml;
  end;

implementation

end.
