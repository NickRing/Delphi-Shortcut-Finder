unit nick.shortcut.builder.IShortCutItem;

interface

uses
  nick.shortcut.repository.IRegistry,
  nick.shortcut.repository.IIniFile,
  nick.shortcut.repository.ISystem,
  nick.shortcut.other.INodeXml;

type
  TRegistryDecoder<T> = reference to function (const ARegistryRepository : IRegistryRepository; const ASectionKey : string): T;
  TIniDecoder<T> = reference to function (const AIniFileRepository : IIniFileRepository; const ASectionKey : string; const AKey : string): T;
  TXmlDecoder<T> = reference to function (const ANodeXml : INodeXml): T;

  IBuildShortCut = interface
    ['{D93C7005-60B9-428E-84FF-A93534708841}']
    procedure Build();
  end;

  {$REGION 'Parent Active interfaces'}
  IBuildRegistryParentActiveDecoder = interface
    ['{4AF7C436-9DB3-4FCF-A309-6AA04C6893B1}']
    function WithDecoder(const ADecoder : TRegistryDecoder<Boolean>) : IBuildShortCut;
  end;

  IBuildRegistryParentActiveKey = interface
    ['{D93550DB-A20B-4247-ACB0-416D76FA1430}']
    function WithKey(const AKey : string) : IBuildRegistryParentActiveDecoder;
  end;

  IBuildRegistryParentActivePath = interface
    ['{F9362C10-3D8E-4986-8EDC-CEC70A792EBA}']
    function WithPath(const APath : string) : IBuildRegistryParentActiveKey;
  end;

  IBuildIniParentActiveDecoder = interface
    ['{F3A4872D-63FA-4BC8-B322-C321725C9B50}']
    function WithDecoder(const ADecoder : TIniDecoder<Boolean>) : IBuildShortCut;
  end;

  IBuildIniParentActiveKey = interface
    ['{7ED9E5C3-C8E1-4251-959E-84B2B3FD8303}']
    function WithKey(const AKey : string) : IBuildIniParentActiveDecoder;
  end;

  IBuildIniParentActiveSection = interface
    ['{F7F88169-4BA0-4515-8F36-FDCFC7327597}']
    function WithSection(const ASection : string) : IBuildIniParentActiveKey;
  end;

  IBuildIniParentActiveFileName = interface
    ['{AC2C165B-D812-4CA3-986D-088B9C74ADAD}']
    function WithFileName(const AFileName : string) : IBuildIniParentActiveSection;
  end;

  IBuildXmlParentActiveDecoder = interface
    ['{2AB1723F-2038-40BB-B670-A7DE43F6B567}']
    function WithDecoder(const ADecoder : TXmlDecoder<Boolean>) : IBuildShortCut;
  end;

  IBuildXmlParentActivePath = interface
    ['{49EBA339-55CD-4163-A569-84303C4CFF2B}']
    function WithPath(const APath : array of string) : IBuildXmlParentActiveDecoder;
  end;

  IBuildXmlParentActiveFileName = interface
    ['{53669F9D-307C-4667-B5B0-101B1B885F3B}']
    function WithFileName(const AFileName : string) : IBuildXmlParentActivePath;
  end;

  IBuildParentActiveType = interface
    ['{A33DA2F8-B20C-4DF1-9681-D981BCF1ECB7}']
    function IsXMLFile() : IBuildXmlParentActiveFileName;
    function IsINIFile() : IBuildIniParentActiveFileName;
    function IsRegistry() : IBuildRegistryParentActivePath;
  end;

  IBuildParentActiveState = interface(IBuildShortCut)
    ['{EBEC5B82-E0BA-49E4-8F5F-B87FE6B301CF}']
    function WithParentActiveState(const AIsActive : Boolean) : IBuildParentActiveType;
    //procedure Build();
  end;
  {$ENDREGION}

  {$REGION 'Primary Active interfaces'}
  IBuildRegistryActiveDecoder = interface
    ['{4AF7C436-9DB3-4FCF-A309-6AA04C6893B1}']
    function WithDecoder(const ADecoder : TRegistryDecoder<Boolean>) : IBuildParentActiveState;
  end;

  IBuildRegistryActiveKey = interface
    ['{D93550DB-A20B-4247-ACB0-416D76FA1430}']
    function WithKey(const AKey : string) : IBuildRegistryActiveDecoder;
  end;

  IBuildRegistryActivePath = interface
    ['{F9362C10-3D8E-4986-8EDC-CEC70A792EBA}']
    function WithPath(const APath : string) : IBuildRegistryActiveKey;
  end;

  IBuildIniActiveDecoder = interface
    ['{F3A4872D-63FA-4BC8-B322-C321725C9B50}']
    function WithDecoder(const ADecoder : TIniDecoder<Boolean>) : IBuildParentActiveState;
  end;

  IBuildIniActiveKey = interface
    ['{7ED9E5C3-C8E1-4251-959E-84B2B3FD8303}']
    function WithKey(const AKey : string) : IBuildIniActiveDecoder;
  end;

  IBuildIniActiveSection = interface
    ['{F7F88169-4BA0-4515-8F36-FDCFC7327597}']
    function WithSection(const ASection : string) : IBuildIniActiveKey;
  end;

  IBuildIniActiveFileName = interface
    ['{AC2C165B-D812-4CA3-986D-088B9C74ADAD}']
    function WithFileName(const AFileName : string) : IBuildIniActiveSection;
  end;

  IBuildXmlActiveDecoder = interface
    ['{2AB1723F-2038-40BB-B670-A7DE43F6B567}']
    function WithDecoder(const ADecoder : TXmlDecoder<Boolean>) : IBuildParentActiveState;
  end;

  IBuildXmlActivePath = interface
    ['{49EBA339-55CD-4163-A569-84303C4CFF2B}']
    function WithPath(const APath : array of string) : IBuildXmlActiveDecoder;
  end;

  IBuildXmlActiveFileName = interface
    ['{53669F9D-307C-4667-B5B0-101B1B885F3B}']
    function WithFileName(const AFileName : string) : IBuildXmlActivePath;
  end;

  IBuildActiveType = interface
    ['{A33DA2F8-B20C-4DF1-9681-D981BCF1ECB7}']
    function IsXMLFile() : IBuildXmlActiveFileName;
    function IsINIFile() : IBuildIniActiveFileName;
    function IsRegistry() : IBuildRegistryActivePath;
  end;

  IBuildActiveState = interface(IBuildShortCut)
    ['{EBEC5B82-E0BA-49E4-8F5F-B87FE6B301CF}']
    function WithActiveState(const AIsActive : Boolean) : IBuildActiveType;
    //procedure Build();
  end;
  {$ENDREGION}

  {$REGION 'Primary ShortCut interfaces'}
  IBuildRegistryShortCutDecoder = interface
    ['{D6EAFA7E-D225-4692-ACA1-78D2F52F0046}']
    function WithDecoder(const ADecoder : TRegistryDecoder<TShortCut>) : IBuildActiveState;
  end;

  IBuildRegistryShortCutKey = interface
    ['{8EFE25F5-2F17-4B93-8C11-70165D249F95}']
    function WithKey(const AKey : string) : IBuildRegistryShortCutDecoder;
  end;

  IBuildRegistryShortCutPath = interface
    ['{6098974E-F54C-49E1-BC18-C744CEFB66E4}']
    function WithPath(const APath : string) : IBuildRegistryShortCutKey;
  end;

  IBuildIniShortCutDecoder = interface
    ['{642EC77C-DE5D-45CD-AACE-1CE0B51E2C41}']
    function WithDecoder(const ADecoder : TIniDecoder<TShortCut>) : IBuildActiveState;
  end;

  IBuildIniShortCutKey = interface
    ['{4465342A-D5FE-4C4C-8CB1-5E246F96BB8D}']
    function WithKey(const AKey : string) : IBuildIniShortCutDecoder;
  end;

  IBuildIniShortCutSection = interface
    ['{64057F37-7315-4466-920A-468C68387543}']
    function WithSection(const ASection : string) : IBuildIniShortCutKey;
  end;

  IBuildIniShortCutFileName = interface
    ['{1B5C8560-CAF9-4548-A99B-AEA2BA938157}']
    function WithFileName(const AFileName : string) : IBuildIniShortCutSection;
  end;

  IBuildXmlShortCutDecoder = interface
    ['{6170A81B-AC4B-4DE5-92C2-45B3AB3CACE9}']
    function WithDecoder(const ADecoder : TXmlDecoder<TShortCut>) : IBuildActiveState;
  end;

  IBuildXmlShortCutPath = interface
    ['{CBBB64F5-BB47-4029-8CF4-981490712810}']
    function WithPath(const APath : array of string) : IBuildXmlShortCutDecoder;
  end;

  IBuildXmlShortCutFileName = interface
    ['{A08EBF17-A742-4DD5-8305-92D22C109592}']
    function WithFileName(const AFileName : string) : IBuildXmlShortCutPath;
  end;

  IBuildShortCutType = interface(IBuildActiveState)
    ['{D68F6F0A-9EFA-4D29-A92A-450B53B85169}']
    function IsXMLFile() : IBuildXmlShortCutFileName;
    function IsINIFile() : IBuildIniShortCutFileName;
    function IsRegistry() : IBuildRegistryShortCutPath;
    //function WithActiveState(const AIsActive : Boolean) : IBuildActiveType;
    //procedure Build();
  end;

  IBuildPrimaryShortCut = interface
    ['{66B6B127-FD34-4673-84A5-AB969A0D78E0}']
    function WithShortCut(const AShortCut : TShortCut) : IBuildShortCutType;
  end;
  {$ENDREGION}

  IBuildDescription = interface(IBuildPrimaryShortCut)
    ['{C499EEB7-4A6E-4C75-88A7-D1502F8B94BC}']
    function WithDescription(const ADescription : string) : IBuildPrimaryShortCut;
    //function WithShortCut(const AShortCut : TShortCut) : IBuildShortCutType;
  end;

  IShortCutItemBuilder = interface
    ['{17697B34-C191-41D0-BA78-23B2ECEF69F8}']
    function WithDetail(const ADetail : string) : IBuildDescription;
  end;

implementation

end.
