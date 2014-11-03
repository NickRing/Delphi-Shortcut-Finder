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
    ActivePage = tsSearchRegisteredShortcuts
    Align = alClient
    TabOrder = 0
    object tsKnownShortcuts: TTabSheet
      Caption = '&Known Shortcuts'
    end
    object tsSearchRegisteredShortcuts: TTabSheet
      Caption = '&Search Registered Shortcuts'
      ImageIndex = 1
    end
  end
end
