object frmShortcutKeyAllocation: TfrmShortcutKeyAllocation
  Left = 0
  Top = 0
  Width = 474
  Height = 374
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 474
    Height = 374
    ActivePage = tsKnownAddons
    Align = alClient
    TabOrder = 0
    object tsKnownAddons: TTabSheet
      Caption = '&Known Add-ons'
    end
    object tsIdeRegisteredShortCut: TTabSheet
      Caption = '&IDE Registered ShortCuts'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
end
