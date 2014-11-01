unit nick.toolsapi.shortcut.PackageExpertBaseElement;

interface

uses
  nick.toolsapi.shortcut.ShortCutList;

type
  TPackageExpertBaseElement = class abstract(TShortCutList)
  protected
    function IsPackageLoaded(const APackageName : string) : Boolean;
  end;

implementation

{ TPackageExpertBaseElement }

function TPackageExpertBaseElement.IsPackageLoaded(const APackageName: string): Boolean;
begin
  Result := RepositoryFactory().ToolsApiRepository().IsPackageLoaded(APackageName);
end;

end.
