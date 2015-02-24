unit nick.shortcut.element.SmartInspect;

interface

implementation

uses
  nick.shortcut.repository.ShortCut,
  nick.shortcut.builder.IShortCutItem,
  nick.shortcut.builder.ShortCutItem,
  nick.shortcut.element.DLLExpertBase,
  System.SysUtils,
  Vcl.Menus,
  System.Classes,
  Winapi.Windows;

type
  TSmartInspectElement = class(TDLLExpertBaseElement)
  private
  protected
    procedure PopulateShortCuts(); override;
    function GetName() : string; override;
    function IsVersionAllowed(const AVSFixedFileInfo : TVSFixedFileInfo) : Boolean; override;
    function GetDescription() : string; override;
  public
    function IsUseable() : Boolean; override;
  end;

function TSmartInspectElement.GetDescription: string;
begin
  Result := 'SmartInspect is an advanced .NET logging, Java logging and Delphi logging tool for ' +
            'debugging and monitoring software applications.' + System.sLineBreak + System.sLineBreak +
            'It helps you identify bugs, find solutions to user-reported issues and gives you a precise ' +
            'picture of how your software performs in different environments.' + System.sLineBreak + System.sLineBreak +
            'Whether you need logging in the development phase, on production systems or at customer sites, ' +
            'SmartInspect is the perfect choice.' + System.sLineBreak + System.sLineBreak +
            'http://www.gurock.com/smartinspect/';
end;

function TSmartInspectElement.GetName: string;
begin
  Result := 'Smart Inspect IDE Plug-in';
end;

function TSmartInspectElement.IsUseable: Boolean;
begin
  Result := CheckForExpertDLL('SmartInspect');
end;

function TSmartInspectElement.IsVersionAllowed(const AVSFixedFileInfo: TVSFixedFileInfo): Boolean;
begin
  Result := (HiWord(AVSFixedFileInfo.dwFileVersionMS) = 3) and
            (LoWord(AVSFixedFileInfo.dwFileVersionMS) = 3) and
            (HiWord(AVSFixedFileInfo.dwFileVersionLS) = 7) (*and
            (LoWord(AVSFixedFileInfo.dwFileVersionLS) = 150)*);
end;

procedure TSmartInspectElement.PopulateShortCuts;
begin
  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Instrument Unit')
                                    .WithDescription('Opens a dialog and allows you to select which methods should be instrumented or uninstrumented.' +
                                                     System.sLineBreak + 'SmartInspect -> Instrument Unit...')
                                    .WithShortCut(Vcl.Menus.ShortCut(Ord('I'), [ssCtrl, ssAlt]))
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Instrument Current Method')
                                    .WithDescription('Instruments the method where your text cursor is positioned.' +
                                                     System.sLineBreak + 'SmartInspect -> Instrument Current Method')
                                    .WithShortCut(Vcl.Menus.ShortCut(Ord('N'), [ssCtrl, ssAlt]))
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Uninstrument Current Method')
                                    .WithDescription('Uninstruments the method where your text cursor is positioned.' +
                                                     System.sLineBreak + 'SmartInspect -> Uninstrument Current Method')
                                    .WithShortCut(Vcl.Menus.ShortCut(Ord('J'), [ssCtrl, ssAlt]))
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Instrument All Methods')
                                    .WithDescription('Instruments all methods and functions in the current unit.' +
                                                     System.sLineBreak + 'SmartInspect -> Instrument All Methods')
                                    .WithShortCut(Vcl.Menus.ShortCut(Ord('A'), [ssCtrl, ssAlt]))
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Uninstrument All Methods')
                                    .WithDescription('Uninstruments all methods and functions in the current unit.' +
                                                     System.sLineBreak + 'SmartInspect -> Uninstrument All Methods')
                                    .WithShortCut(Vcl.Menus.ShortCut(Ord('X'), [ssCtrl, ssAlt]))
                                    .Build;

  nick.shortcut.builder.ShortCutItem.NewShortCutItemBuilder(Self)
                                    .WithDetail('Update All Methods')
                                    .WithDescription('Updates the method names in the Enter- and LeaveMethod calls of ' +
                                                     'all instrumented methods and functions in the current unit.' +
                                                     System.sLineBreak + 'SmartInspect -> Update All Methods')
                                    .WithShortCut(Vcl.Menus.ShortCut(Ord('U'), [ssCtrl, ssAlt]))
                                    .Build;
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TSmartInspectElement);

end.

