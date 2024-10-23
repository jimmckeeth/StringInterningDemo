object StringInternForm: TStringInternForm
  Left = 0
  Top = 0
  Caption = 'Interning with StringPool Demo'
  ClientHeight = 576
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    516
    576)
  TextHeight = 15
  object lbl1: TLabel
    Left = 16
    Top = 400
    Width = 51
    Height = 15
    Caption = 'Variations'
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 217
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      516
      217)
    object grd1: TStringGrid
      Left = 11
      Top = 103
      Width = 500
      Height = 105
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      DefaultColWidth = 80
      DoubleBuffered = True
      Enabled = False
      FixedCols = 0
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goAlwaysShowEditor]
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 0
    end
    object RelativePanel1: TRelativePanel
      Left = 0
      Top = 0
      Width = 516
      Height = 105
      ControlCollection = <
        item
          Control = ProgressBar1
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = True
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = False
        end
        item
          Control = ProgressBar2
          AlignBottomWithPanel = False
          AlignHorizontalCenterWith = ProgressBar1
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = False
          Below = ProgressBar1
        end
        item
          Control = ProgressBar3
          AlignBottomWithPanel = False
          AlignHorizontalCenterWith = ProgressBar1
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = False
          Below = ProgressBar2
        end
        item
          Control = ProgressBar4
          AlignBottomWithPanel = False
          AlignHorizontalCenterWith = ProgressBar1
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWithPanel = False
          Below = ProgressBar3
        end
        item
          Control = txt1
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWith = ProgressBar1
          AlignVerticalCenterWithPanel = False
          LeftOf = ProgressBar1
        end
        item
          Control = txt2
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWith = ProgressBar2
          AlignVerticalCenterWithPanel = False
          LeftOf = ProgressBar2
        end
        item
          Control = txt3
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWith = ProgressBar3
          AlignVerticalCenterWithPanel = False
          LeftOf = ProgressBar3
        end
        item
          Control = txt4
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = False
          AlignRightWithPanel = False
          AlignTopWithPanel = False
          AlignVerticalCenterWith = ProgressBar4
          AlignVerticalCenterWithPanel = False
          LeftOf = ProgressBar4
        end>
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        516
        105)
      object ProgressBar1: TProgressBar
        AlignWithMargins = True
        Left = 63
        Top = 10
        Width = 450
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Max = 1000000000
        TabOrder = 0
      end
      object ProgressBar2: TProgressBar
        AlignWithMargins = True
        Left = 63
        Top = 33
        Width = 450
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Max = 1000000000
        State = pbsPaused
        TabOrder = 1
      end
      object ProgressBar3: TProgressBar
        AlignWithMargins = True
        Left = 63
        Top = 56
        Width = 450
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Max = 1000000000
        TabOrder = 2
      end
      object ProgressBar4: TProgressBar
        AlignWithMargins = True
        Left = 63
        Top = 79
        Width = 450
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Max = 1000000000
        State = pbsPaused
        TabOrder = 3
      end
      object txt1: TStaticText
        Left = 13
        Top = 9
        Width = 47
        Height = 19
        Anchors = []
        Caption = 'FastMM'
        Color = clBlack
        ParentColor = False
        TabOrder = 4
      end
      object txt2: TStaticText
        Left = 31
        Top = 32
        Width = 29
        Height = 19
        Anchors = []
        Caption = 'Peak'
        Color = clBlack
        ParentColor = False
        TabOrder = 5
      end
      object txt3: TStaticText
        Left = 11
        Top = 55
        Width = 49
        Height = 19
        Anchors = []
        Caption = 'Working'
        Color = clBlack
        ParentColor = False
        TabOrder = 6
      end
      object txt4: TStaticText
        Left = 31
        Top = 78
        Width = 29
        Height = 19
        Anchors = []
        Caption = 'Peak'
        Color = clBlack
        ParentColor = False
        TabOrder = 7
      end
    end
  end
  object btnGrow: TButton
    Left = 8
    Top = 263
    Width = 75
    Height = 35
    Caption = 'Grow'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnGrowClick
  end
  object btnIntern: TButton
    Left = 8
    Top = 304
    Width = 75
    Height = 35
    Caption = 'Intern'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnInternClick
  end
  object btnClear: TButton
    Left = 8
    Top = 345
    Width = 75
    Height = 35
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnClearClick
  end
  object lbxLog: TListBox
    Left = 96
    Top = 223
    Width = 412
    Height = 345
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 4
  end
  object SpinEdit1: TSpinEdit
    Left = 8
    Top = 421
    Width = 75
    Height = 24
    MaxValue = 100
    MinValue = 0
    TabOrder = 5
    Value = 10
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 200
    Top = 168
  end
end
