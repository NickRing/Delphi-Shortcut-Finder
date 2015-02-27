unit nick.shortcut.other.IFileVersionInformation;

interface

uses
  {$IFDEF VER220}
  Windows;
  {$ELSE}
  Winapi.Windows;
  {$ENDIF}

{$SCOPEDENUMS ON}
type
  TVersionInformation = (Error, Author, Comments, CompanyName,
                         FileDescription, FileVersion, InternalName,
                         LegalCopyright, LegalTrademarks, OriginalFilename,
                         PrivateBuild, ProductName, ProductVersion,
                         SpecialBuild);
{$SCOPEDENUMS OFF}

type
  IFileVersionInformation = interface
    ['{81FDD704-30EC-4A72-A4A0-CCECCA04E946}']
    function GetFileVersion : TVSFixedFileInfo;
    function GetCount: Cardinal;
    function GetFieldName(const AIndex: Integer): string;
    function GetFieldValue(const AIndex: Integer): string;
    function GetFieldString(const AIndex: TVersionInformation): string;

    function HasErrored : Boolean;

    property Count : Cardinal read GetCount;
    property FieldName [const AIndex : Integer] : string read GetFieldName;
    property FieldValue [const AIndex : Integer] : string read GetFieldValue;
    property FieldString [const AIndex : TVersionInformation] : string read GetFieldString;
  end;

implementation

end.
