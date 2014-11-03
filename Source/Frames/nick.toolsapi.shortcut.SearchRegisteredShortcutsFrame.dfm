object frmSearchRegisteredShortcuts: TfrmSearchRegisteredShortcuts
  Left = 0
  Top = 0
  Width = 372
  Height = 377
  TabOrder = 0
  object grpAdvanceFiltering: TGroupBox
    Left = 0
    Top = 0
    Width = 372
    Height = 57
    Align = alTop
    Caption = ' Advance Filtering '
    TabOrder = 0
    object lblHotkey: TLabel
      Left = 8
      Top = 26
      Width = 41
      Height = 13
      Caption = '&Hotkey :'
      FocusControl = hkAdvance
    end
    object hkAdvance: THotKey
      Left = 61
      Top = 24
      Width = 121
      Height = 19
      HotKey = 0
      InvalidKeys = []
      Modifiers = []
      TabOrder = 0
      OnChange = hkAdvanceChange
    end
  end
  object vtShortCutModuleDetails: TVirtualStringTree
    Left = 0
    Top = 57
    Width = 372
    Height = 320
    Align = alClient
    Colors.UnfocusedColor = clMedGray
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Options = [hoAutoResize, hoColumnResize, hoDblClickResize, hoShowSortGlyphs, hoVisible, hoAutoSpring]
    TabOrder = 1
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoSpanColumns, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toReadOnly]
    OnGetText = vtShortCutModuleDetailsGetText
    Columns = <
      item
        Options = [coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coAutoSpring, coSmartResize, coAllowFocus]
        Position = 0
        Width = 81
        WideText = 'Attribute'
      end
      item
        Options = [coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coSmartResize, coAllowFocus]
        Position = 1
        Width = 287
        WideText = 'Value'
      end>
  end
end
