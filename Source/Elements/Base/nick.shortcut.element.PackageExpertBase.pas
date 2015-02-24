unit nick.shortcut.element.PackageExpertBase;

interface

uses
  nick.shortcut.core.ShortCutList;

type
  TPackageExpertBaseElement = class abstract(TShortCutList)
  protected
    function IsPackageLoaded(const APackageName : string) : Boolean;
  end;

implementation

function TPackageExpertBaseElement.IsPackageLoaded(const APackageName: string): Boolean;
begin
  Result := RepositoryFactory().ToolsApiRepository().IsPackageLoaded(APackageName);
end;

end.
