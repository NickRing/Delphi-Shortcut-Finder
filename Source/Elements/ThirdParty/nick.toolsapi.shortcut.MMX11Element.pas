unit nick.toolsapi.shortcut.MMX11Element;

interface

uses
  nick.toolsapi.shortcut.MMX10Element;

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

implementation

uses
  nick.toolsapi.shortcut.ShortCutRepository,
  nick.toolsapi.shortcut.ShortCutItemBuilder,
  Classes;

{ TMMX11Element }

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

  nick.toolsapi.shortcut.ShortCutItemBuilder.NewShortCutItemBuilder(Self)
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
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TMMX11Element);
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TMMX111Element);

end.

