inherited frmShortcutKeyAllocation: TfrmShortcutKeyAllocation
  Width = 435
  Height = 323
  ParentFont = False
  ParentShowHint = False
  ShowHint = True
  ExplicitWidth = 435
  ExplicitHeight = 323
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 435
    Height = 323
    ActivePage = tsSearchRegisteredShortcuts
    Align = alClient
    TabOrder = 0
    object tsKnownShortcuts: TTabSheet
      Caption = '&Known Shortcuts'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsSearchRegisteredShortcuts: TTabSheet
      Caption = '&Search Registered Shortcuts'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
end
