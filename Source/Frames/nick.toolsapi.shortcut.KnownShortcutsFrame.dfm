object frmKnownShortcuts: TfrmKnownShortcuts
  Left = 0
  Top = 0
  Width = 415
  Height = 437
  TabOrder = 0
  object splDescription: TSplitter
    Left = 0
    Top = 351
    Width = 415
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = -51
    ExplicitTop = 260
    ExplicitWidth = 466
  end
  object grpFiltering: TGroupBox
    Left = 0
    Top = 0
    Width = 415
    Height = 145
    Align = alTop
    Caption = ' Filtering : '
    TabOrder = 0
    DesignSize = (
      415
      145)
    object lblPrimary: TLabel
      Left = 8
      Top = 25
      Width = 43
      Height = 13
      Caption = '&Primary :'
      FocusControl = hkPrimary
    end
    object lblSecondary: TLabel
      Left = 8
      Top = 49
      Width = 58
      Height = 13
      Caption = '&Secondary :'
      FocusControl = hkSecondary
    end
    object lbDescription: TLabel
      Left = 8
      Top = 75
      Width = 60
      Height = 13
      Caption = '&Description :'
      FocusControl = edtDesc
    end
    object chkConficts: TCheckBox
      Left = 8
      Top = 115
      Width = 217
      Height = 17
      Alignment = taLeftJustify
      Caption = '&Filter out non-conflicting options'
      TabOrder = 6
      OnClick = chkConfictsClick
    end
    object hkPrimary: THotKey
      Left = 75
      Top = 23
      Width = 150
      Height = 19
      HotKey = 0
      InvalidKeys = []
      Modifiers = []
      TabOrder = 1
      OnChange = hkPrimaryChange
    end
    object hkSecondary: THotKey
      Left = 75
      Top = 48
      Width = 150
      Height = 19
      HotKey = 0
      InvalidKeys = []
      Modifiers = []
      TabOrder = 2
      OnChange = hkSecondaryChange
    end
    object edtDesc: TEdit
      Left = 75
      Top = 72
      Width = 382
      Height = 21
      TabOrder = 3
      OnChange = edtDescChange
    end
    object btnRescan: TButton
      Left = 516
      Top = 20
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Rescan'
      TabOrder = 0
    end
    object chkRegExp: TCheckBox
      Left = 75
      Top = 96
      Width = 113
      Height = 17
      Caption = 'Regular e&xpression'
      TabOrder = 4
      OnClick = chkRegExpClick
    end
    object chkCaseSensitive: TCheckBox
      Left = 212
      Top = 96
      Width = 97
      Height = 17
      Caption = '&Case sensitive'
      TabOrder = 5
      OnClick = chkCaseSensitiveClick
    end
  end
  object vtAssignments: TVirtualStringTree
    Left = 0
    Top = 145
    Width = 415
    Height = 206
    Align = alClient
    BorderWidth = 1
    Colors.UnfocusedColor = clMedGray
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Options = [hoAutoResize, hoColumnResize, hoDblClickResize, hoShowSortGlyphs, hoVisible, hoAutoSpring]
    HintMode = hmHint
    NodeDataSize = 0
    TabOrder = 1
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoSpanColumns, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toReadOnly]
    OnChange = vtAssignmentsChange
    OnGetText = vtAssignmentsGetText
    OnGetHint = vtAssignmentsGetHint
    Columns = <
      item
        Options = [coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coAutoSpring, coSmartResize, coAllowFocus]
        Position = 0
        Width = 10
        WideText = 'Details'
      end
      item
        Options = [coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coSmartResize, coAllowFocus]
        Position = 1
        Width = 150
        WideText = 'Primary'
      end
      item
        Options = [coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coSmartResize, coAllowFocus]
        Position = 2
        Width = 150
        WideText = 'Secondary'
      end
      item
        Options = [coEnabled, coParentBidiMode, coParentColor, coResizable, coVisible, coSmartResize, coAllowFocus]
        Position = 3
        Width = 180
        WideText = 'Description'
      end>
  end
  object mmoExtraInfo: TRichEdit
    Left = 0
    Top = 354
    Width = 415
    Height = 83
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    Zoom = 100
  end
end
