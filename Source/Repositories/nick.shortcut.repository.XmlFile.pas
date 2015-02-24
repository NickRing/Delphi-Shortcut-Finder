unit nick.shortcut.repository.XmlFile;

interface

uses
  nick.shortcut.repository.IXmlFile,
  nick.shortcut.other.INodeXml,
  XMLIntf;

type
  TXmlFileRepository = class(TInterfacedObject, IXmlFileRepository)
  private
    FXMLDocument : IXMLDocument;
  public
    procedure OpenFile(const AFileName : string);
    procedure Active(const AActive : Boolean);
    function GetRootNode() : INodeXml;
  end;

implementation

uses
  XMLDoc,
  System.SysUtils;

type
  TNodeXml = class(TInterfacedObject, INodeXml)
  private
    FXmlNode : IXMLNode;
  public
    constructor Create(const AXmlNode : IXMLNode);

    function GetNode(const ANodeName : string) : INodeXml;
    function FindAttribute(const AAttributeName : string) : INodeXml;
    function NodeValue : string;
    function ChildNodesCount() : Integer;
    function ChildNode(const AIndex : Integer) : INodeXml;
  end;

{ TXmlFileRepository }

procedure TXmlFileRepository.Active(const AActive: Boolean);
begin
  if Assigned(FXMLDocument) then
    FXMLDocument.Active := AActive;
end;

function TXmlFileRepository.GetRootNode: INodeXml;
begin
  Result := nil;

  if Assigned(FXMLDocument) and
     Assigned(FXMLDocument.Node) then
  begin
    Result := TNodeXml.Create(FXMLDocument.Node);
  end;
end;

procedure TXmlFileRepository.OpenFile(const AFileName: string);
begin
  if (not Assigned(FXMLDocument)) or
     (not AnsiSameText(AFileName, FXMLDocument.FileName)) then
  begin
    FXMLDocument := XMLDoc.LoadXMLDocument(AFileName);
  end;
end;

{ TNodeXml }

constructor TNodeXml.Create(const AXmlNode: IXMLNode);
begin
  inherited Create();
  FXmlNode := AXmlNode;
end;

function TNodeXml.ChildNode(const AIndex: Integer): INodeXml;
begin
  Result := nil;
  if not Assigned(FXmlNode) then
    Exit;

  Result := TNodeXml.Create(FXmlNode.ChildNodes.Nodes[AIndex]);
end;

function TNodeXml.ChildNodesCount: Integer;
begin
  Result := 0;
  if not Assigned(FXmlNode) then
    Exit;

  Result := FXmlNode.ChildNodes.Count;
end;

function TNodeXml.FindAttribute(const AAttributeName: string): INodeXml;
var
  LNode: IXMLNode;
begin
  Result := nil;
  if not Assigned(FXmlNode) then
    Exit;

  LNode := FXmlNode.AttributeNodes.FindNode(AAttributeName);

  if not Assigned(LNode) then
    Exit;

  Result := TNodeXml.Create(LNode);
end;

function TNodeXml.GetNode(const ANodeName: string): INodeXml;
var
  LNode: IXMLNode;
begin
  Result := nil;
  if not Assigned(FXmlNode) then
    Exit;

  LNode := FXmlNode.ChildNodes.Nodes[ANodeName];

  if not Assigned(LNode) then
    Exit;

  Result := TNodeXml.Create(LNode);
end;

function TNodeXml.NodeValue: string;
begin
  Result := '';
  if not Assigned(FXmlNode) then
    Exit;

  Result := FXmlNode.NodeValue;
end;

end.

