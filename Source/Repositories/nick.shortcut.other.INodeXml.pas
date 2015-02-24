unit nick.shortcut.other.INodeXml;

interface

type
  INodeXml = interface
    ['{DA034CE9-923D-4C77-969A-558D749A3A98}']
    function GetNode(const ANodeName : string) : INodeXml;
    function FindAttribute(const AAttributeName : string) : INodeXml;
    function NodeValue : string;
    function ChildNodesCount() : Integer;
    function ChildNode(const AIndex : Integer) : INodeXml;
  end;

implementation

end.
