inherited frmSearchRegisteredShortcuts: TfrmSearchRegisteredShortcuts
  Width = 404
  ParentFont = False
  OnResize = FrameResize
  ExplicitWidth = 404
  object vtShortCutModuleDetails: TVirtualStringTree
    Left = 0
    Top = 57
    Width = 404
    Height = 166
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
        Width = 113
        WideText = 'Attribute'
      end
      item
        Options = [coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coSmartResize, coAllowFocus]
        Position = 1
        Width = 287
        WideText = 'Value'
      end>
  end
  object pbProgressBar: TProgressBar
    Left = 0
    Top = 223
    Width = 404
    Height = 17
    Align = alBottom
    TabOrder = 2
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 57
    Align = alTop
    TabOrder = 0
    object grpAdvanceFiltering: TGroupBox
      Left = 1
      Top = 1
      Width = 196
      Height = 55
      Align = alLeft
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
        Height = 21
        HotKey = 0
        InvalidKeys = []
        Modifiers = []
        TabOrder = 0
        OnChange = hkAdvanceChange
      end
    end
    object grpExport: TGroupBox
      Left = 197
      Top = 1
      Width = 206
      Height = 55
      Align = alClient
      Caption = ' Export Known Hotkeys '
      TabOrder = 1
      object cbbExports: TComboBox
        Left = 8
        Top = 23
        Width = 108
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = ActionListChange
      end
      object btnExport: TButton
        Left = 122
        Top = 21
        Width = 75
        Height = 25
        Action = actExport
        TabOrder = 1
      end
    end
  end
  object ActionList: TActionList
    Left = 80
    Top = 136
    object actExport: TAction
      Caption = '&Export'
      OnExecute = actExportExecute
      OnUpdate = actExportUpdate
    end
  end
end
