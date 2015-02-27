unit nick.shortcut.element.OSRegisteredHotKeys;

interface

implementation

uses
  nick.shortcut.core.ShortCutItem,
  nick.shortcut.repository.ShortCut,
  nick.shortcut.core.ShortCutList,
  nick.shortcut.repository.ISystem,
  nick.shortcut.other.VirtualKeys,
  {$IFDEF VER220}
  Windows,
  Menus,
  Classes,
  SysUtils,
  Consts;
  {$ELSE}
  Winapi.Windows,
  Vcl.Menus,
  System.Classes,
  System.SysUtils,
  Vcl.Consts;
  {$ENDIF}

type
  TOSRegisteredHotKeysElement = class(TShortCutList)
  private
  protected
    procedure PopulateShortCuts(); override;
    function GetName() : string; override;
  public
    function IsUseable() : Boolean; override;
  end;

function TOSRegisteredHotKeysElement.GetName: string;
begin
  Result := 'OS Registered Hot Keys';
end;

function TOSRegisteredHotKeysElement.IsUseable: Boolean;
begin
  Result := True;
end;

procedure TOSRegisteredHotKeysElement.PopulateShortCuts;
var
  LAtom: Atom;
  LModifier: Integer;
  LShiftState: TShiftState;
  LShortCut: TShortcut;
  LShortCutText: string;
  LSystemRepository: ISystemRepository;
  LVirtualKeyDetail: TVirtualKeyDetail;
begin
  LSystemRepository := RepositoryFactory().SystemRepository;

  LAtom := LSystemRepository.GlobalAddAtom(GetName());
  try
    for LVirtualKeyDetail in TVirtualKeys do
    begin
      if ((LVirtualKeyDetail.CheckedBy * [TCheck.Elements]) = []) then
        Continue;

      for LModifier in TModifterCheckingOrder do
      begin
        if (LSystemRepository.IsHotKeyRegisteredByTheOperatingSystem(0, LAtom, LModifier, LVirtualKeyDetail.Value)) then
        begin
          LShiftState := LSystemRepository.ModifiersToShiftState(LModifier);

          {$IFDEF VER220}
          LShortCut := Menus.ShortCut(LVirtualKeyDetail.Value, LShiftState);
          {$ELSE}
          LShortCut := Vcl.Menus.ShortCut(LVirtualKeyDetail.Value, LShiftState);
          {$ENDIF}
          LShortCutText := ShortCutToText(LShortCut);
          if (trim(LShortCutText) = EmptyStr) then
          begin
            if ((LModifier and MOD_SHIFT) <> 0) then
              LShortCutText := LShortCutText + SmkcShift;
            if ((LModifier and MOD_CONTROL) <> 0) then
              LShortCutText := LShortCutText + SmkcCtrl;
            if ((LModifier and MOD_ALT) <> 0) then
              LShortCutText := LShortCutText + SmkcAlt;

            LShortCutText := LShortCutText + LVirtualKeyDetail.ConstantName;
          end;

          Add(NewShortCut(LShortCutText, LShortCut, scNone, LVirtualKeyDetail.Description));
        end;
      end;
    end;
  finally
    LSystemRepository.GlobalDeleteAtom(LAtom);
  end;
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TOSRegisteredHotKeysElement);

end.

