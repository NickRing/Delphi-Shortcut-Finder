unit nick.shortcut.element.MMX11;

interface

implementation

uses
  nick.shortcut.repository.ShortCut,
  nick.shortcut.builder.ShortCutItem,
  nick.shortcut.element.MMX10,
  System.Classes;

type
  TMMX11Element = class(TMMX10Element)
  protected
    function GetMmxHighVersion() : Integer; override;
  end;

type
  TMMX111Element = class(TMMX11Element)
  protected
    function GetMmxLowVersion() : Integer; override;
    procedure GetShortCuts(const ARegistryKey: string); override;
  end;

function TMMX11Element.GetMmxHighVersion: Integer;
begin
  Result := 11;
end;

{ TMMX111Element }

function TMMX111Element.GetMmxLowVersion: Integer;
begin
  Result := 1;
end;

procedure TMMX111Element.GetShortCuts(const ARegistryKey: string);
begin
  inherited;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Reverse Lines')
                                    .WithDescription('MMX -> Text Tools -> Reverse Lines')
                                    .WithShortCut(scNone)
                                    .IsRegistry()
                                    .WithPath(ARegistryKey)
                                    .WithKey('MMXReverseLinesAction')
                                    .WithDecoder(ShortCutDecoder)
                                    .WithActiveState(True)
                                    .IsRegistry()
                                    .WithPath(ARegistryKey)
                                    .WithKey('Enabled')
                                    .WithDecoder(EnabledDecoder)
                                    .Build();

end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TMMX11Element);
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TMMX111Element);

end.

