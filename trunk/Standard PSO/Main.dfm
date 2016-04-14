object PSOForm: TPSOForm
  Left = 503
  Top = 102
  Width = 1051
  Height = 724
  Caption = 'Particle Swarm Optimisation'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = PSOMen
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BestFitLbl2: TLabel
    Left = 14
    Top = 585
    Width = 90
    Height = 16
    Caption = 'Best Fitness:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ProbLbl: TLabel
    Left = 207
    Top = 26
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RunCtrl: TPageControl
    Left = 8
    Top = 32
    Width = 321
    Height = 337
    ActivePage = SinglePage
    TabOrder = 1
    OnChange = RunCtrlChange
    object SinglePage: TTabSheet
      Caption = 'Single Run'
      object Label12: TLabel
        Left = 162
        Top = 131
        Width = 25
        Height = 13
        Caption = 'N = '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 170
        Top = 175
        Width = 8
        Height = 13
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 170
        Top = 219
        Width = 8
        Height = 13
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 164
        Top = 264
        Width = 21
        Height = 13
        Caption = 'N ='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object InitSwarmBtn: TButton
        Left = 16
        Top = 32
        Width = 137
        Height = 25
        Caption = '(Re)-Initialise Swarm'
        Enabled = False
        TabOrder = 0
        OnClick = InitSwarmBtnClick
      end
      object OneIterBtn: TButton
        Left = 16
        Top = 77
        Width = 137
        Height = 25
        Caption = 'Do one Iteration'
        Enabled = False
        TabOrder = 1
        OnClick = OneIterBtnClick
      end
      object NIterBtn: TButton
        Left = 16
        Top = 122
        Width = 137
        Height = 25
        Caption = 'Do another N Iterations'
        Enabled = False
        TabOrder = 2
        OnClick = NIterBtnClick
      end
      object IterStpBtn: TButton
        Left = 16
        Top = 168
        Width = 137
        Height = 25
        Caption = 'Do until Iterations'
        Enabled = False
        TabOrder = 3
        OnClick = IterStpBtnClick
      end
      object IterGrp: TGroupBox
        Left = 168
        Top = 8
        Width = 137
        Height = 49
        Caption = 'Iteration Number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object IterLbl: TLabel
          Left = 16
          Top = 15
          Width = 12
          Height = 24
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object ThresBtn: TButton
        Left = 16
        Top = 213
        Width = 137
        Height = 25
        Caption = 'Do until below Threshold'
        Enabled = False
        TabOrder = 5
        OnClick = ThresBtnClick
      end
      object NIterEdit: TESBPosSpinEdit
        Left = 193
        Top = 129
        Max = 100000
        MaxLength = 0
        Step = 500
        Value = 1000
        Enabled = False
        TabOrder = 6
      end
      object IterStpEdit: TESBPosSpinEdit
        Left = 192
        Top = 174
        Max = 1000000
        MaxLength = 0
        Step = 500
        Value = 10000
        Enabled = False
        TabOrder = 7
      end
      object ThresEdit: TESBFloatSpinEdit
        Left = 193
        Top = 220
        Max = 100.000000000000000000
        MaxLength = 0
        PageStep = 10.000000000000000000
        Step = 0.100000000000000000
        Value = 0.100000000000000000
        Enabled = False
        TabOrder = 8
      end
      object GroupBox9: TGroupBox
        Left = 168
        Top = 64
        Width = 137
        Height = 49
        Caption = 'Iterations from change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object ChangeLbl: TLabel
          Left = 16
          Top = 13
          Width = 12
          Height = 24
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object ChangeBtn: TButton
        Left = 16
        Top = 259
        Width = 137
        Height = 25
        Caption = 'N Iterations without Change '
        Enabled = False
        TabOrder = 10
        OnClick = ChangeBtnClick
      end
      object ChangeEdit: TESBPosSpinEdit
        Left = 193
        Top = 261
        Interval = 250
        Max = 1000000
        MaxLength = 0
        Value = 250
        Enabled = False
        TabOrder = 11
      end
    end
    object BatchSetPage: TTabSheet
      Caption = 'Batch'
      ImageIndex = 1
      object Label22: TLabel
        Left = 72
        Top = 251
        Width = 89
        Height = 13
        Caption = 'Batch Number: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BProgLbl: TLabel
        Left = 163
        Top = 251
        Width = 52
        Height = 13
        Caption = 'BProgLbl'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 297
        Height = 153
        Caption = 'Batch Run Parameters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label19: TLabel
          Left = 20
          Top = 19
          Width = 72
          Height = 13
          Caption = 'Number of runs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object GroupBox5: TGroupBox
          Left = 8
          Top = 40
          Width = 281
          Height = 97
          Caption = 'Stop Conditions'
          TabOrder = 0
          object BIterBox: TCheckBox
            Left = 9
            Top = 19
            Width = 88
            Height = 17
            Caption = 'After iterations'
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            State = cbChecked
            TabOrder = 0
            OnClick = BIterBoxClick
          end
          object BThresBox: TCheckBox
            Left = 9
            Top = 45
            Width = 169
            Height = 17
            Caption = 'Global Best below'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = BThresBoxClick
          end
          object BIterEdit: TESBPosSpinEdit
            Left = 176
            Top = 16
            Max = 100000
            MaxLength = 0
            Value = 10000
            OnAfterDownClick = EvalBtnClick
            TabOrder = 2
          end
          object BThresEdit: TESBFloatSpinEdit
            Left = 176
            Top = 41
            Max = 100.000000000000000000
            MaxLength = 0
            PageStep = 10.000000000000000000
            Step = 1.000000000000000000
            Value = 0.100000000000000000
            Enabled = False
            TabOrder = 3
          end
          object BChangeBox: TCheckBox
            Left = 9
            Top = 72
            Width = 264
            Height = 17
            Caption = 'Global Best unchanged for '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = BChangeBoxClick
          end
          object BChangeEdit: TESBPosSpinEdit
            Left = 175
            Top = 68
            Max = 1000
            MaxLength = 0
            Step = 100
            Value = 1000
            Enabled = False
            TabOrder = 5
          end
        end
        object BRunEdit: TESBPosSpinEdit
          Left = 120
          Top = 16
          MaxLength = 0
          Step = 500
          Value = 100
          TabOrder = 1
        end
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 160
        Width = 297
        Height = 65
        Caption = 'Batch Output File'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label20: TLabel
          Left = 8
          Top = 16
          Width = 158
          Height = 13
          Caption = 'File name to save batch results to'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BSaveEdit: TEdit
          Left = 8
          Top = 32
          Width = 281
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'Batch.txt'
        end
      end
      object BRunBtn: TButton
        Left = 32
        Top = 264
        Width = 97
        Height = 25
        Caption = 'Run Batch'
        Enabled = False
        TabOrder = 2
        OnClick = BRunBtnClick
      end
      object BStopBtn: TBitBtn
        Left = 176
        Top = 264
        Width = 81
        Height = 25
        Caption = 'STOP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BStopBtnClick
        Kind = bkAbort
      end
      object BProgBar: TProgressBar
        Left = 8
        Top = 232
        Width = 289
        Height = 16
        TabOrder = 4
      end
    end
  end
  object PSOCtrl: TPageControl
    Left = 328
    Top = 0
    Width = 713
    Height = 609
    ActivePage = ParamPage
    TabOrder = 0
    OnChange = PSOCtrlChange
    object ParamPage: TTabSheet
      Caption = 'Parameter Viewer'
      ImageIndex = 4
      object PartParamBox: TGroupBox
        Left = 72
        Top = 16
        Width = 273
        Height = 145
        Caption = 'Particle Parameters'
        TabOrder = 0
        object Label1: TLabel
          Left = 12
          Top = 20
          Width = 61
          Height = 13
          Caption = 'Momentum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 12
          Top = 52
          Width = 79
          Height = 13
          Caption = 'Personal Best'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 12
          Top = 84
          Width = 66
          Height = 13
          Caption = 'Global Best'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 12
          Top = 116
          Width = 61
          Height = 13
          Caption = 'Local Best'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MomEdit: TESBFloatSpinEdit
          Left = 104
          Top = 16
          Max = 1.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 0.100000000000000000
          Value = 0.900000000000000000
          OnChange = MomEditChange
          TabOrder = 0
        end
        object PBestEdit: TESBFloatSpinEdit
          Left = 104
          Top = 49
          Max = 10.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 0.100000000000000000
          Value = 1.000000000000000000
          OnChange = PBestEditChange
          TabOrder = 1
        end
        object GBestEdit: TESBFloatSpinEdit
          Left = 104
          Top = 82
          Max = 10.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 0.100000000000000000
          Value = 1.000000000000000000
          OnChange = GBestEditChange
          TabOrder = 2
        end
        object LBestEdit: TESBFloatSpinEdit
          Left = 104
          Top = 112
          Max = 10.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 0.100000000000000000
          Value = 1.000000000000000000
          OnChange = LBestEditChange
          Enabled = False
          TabOrder = 3
        end
      end
      object InitStartBox: TGroupBox
        Left = 360
        Top = 16
        Width = 273
        Height = 145
        Caption = 'Initial Starting Conditions'
        TabOrder = 1
        object Label15: TLabel
          Left = 8
          Top = 83
          Width = 136
          Height = 13
          Caption = 'Maximum Initial Position'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 8
          Top = 115
          Width = 136
          Height = 13
          Caption = 'Maximum Initial Velocity'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 6
          Top = 18
          Width = 133
          Height = 13
          Caption = 'Minimum Initial Position'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 6
          Top = 50
          Width = 133
          Height = 13
          Caption = 'Minimum Initial Velocity'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PMinEdit: TESBFloatSpinEdit
          Left = 152
          Top = 16
          Max = 100.000000000000000000
          Min = -5000.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 1.000000000000000000
          Value = -50.000000000000000000
          Enabled = False
          TabOrder = 0
        end
        object VMinEdit: TESBFloatSpinEdit
          Left = 152
          Top = 48
          Max = 100.000000000000000000
          Min = -100.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 1.000000000000000000
          Value = -20.000000000000000000
          Enabled = False
          TabOrder = 1
        end
        object PMaxEdit: TESBFloatSpinEdit
          Left = 152
          Top = 80
          Max = 100.000000000000000000
          Min = -5000.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 1.000000000000000000
          Value = 50.000000000000000000
          Enabled = False
          TabOrder = 2
        end
        object VMaxEdit: TESBFloatSpinEdit
          Left = 152
          Top = 112
          Max = 100.000000000000000000
          Min = -100.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 1.000000000000000000
          Value = 20.000000000000000000
          Enabled = False
          TabOrder = 3
        end
      end
      object GroupBox8: TGroupBox
        Left = 72
        Top = 264
        Width = 273
        Height = 97
        Caption = 'Storage Length'
        TabOrder = 2
        object Label25: TLabel
          Left = 8
          Top = 32
          Width = 88
          Height = 13
          Caption = 'Particle Fitness'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 8
          Top = 64
          Width = 84
          Height = 13
          Caption = 'Particle Speed'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object FitLenEdit: TESBPosSpinEdit
          Left = 112
          Top = 26
          MaxLength = 0
          Value = 20
          TabOrder = 0
        end
        object SpeedLenEdit: TESBPosSpinEdit
          Left = 111
          Top = 62
          MaxLength = 0
          Value = 20
          TabOrder = 1
        end
      end
      object LbestGrpBox: TGroupBox
        Left = 72
        Top = 168
        Width = 273
        Height = 89
        Caption = 'Local Best Parameters'
        TabOrder = 3
        object Label28: TLabel
          Left = 4
          Top = 20
          Width = 50
          Height = 13
          Caption = 'Use Fittest'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 15
          Top = 57
          Width = 30
          Height = 13
          Caption = 'Within'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 132
          Top = 20
          Width = 40
          Height = 13
          Caption = 'Particles'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 133
          Top = 58
          Width = 42
          Height = 13
          Caption = 'Distance'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBNumEdit: TESBPosSpinEdit
          Left = 62
          Top = 18
          Width = 63
          Min = 1
          MaxLength = 0
          Value = 10
          Enabled = False
          TabOrder = 0
        end
        object LBTypeRadGrp: TRadioGroup
          Left = 184
          Top = 10
          Width = 65
          Height = 71
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'Closest'
            'Index'
            'Radial')
          TabOrder = 1
          OnClick = LBTypeRadGrpClick
        end
        object LBDistEdit: TESBFloatSpinEdit
          Left = 60
          Top = 56
          Width = 65
          Max = 100.000000000000000000
          MaxLength = 0
          PageStep = 10.000000000000000000
          Step = 1.000000000000000000
          Value = 1.000000000000000000
          Enabled = False
          TabOrder = 2
        end
      end
      object VelUpRadGrp: TRadioGroup
        Left = 360
        Top = 168
        Width = 273
        Height = 121
        Caption = 'Velocity Update Type'
        ItemIndex = 0
        Items.Strings = (
          'Global Best and Personal Best'
          'Global Best and Local Best (current position)'
          'Global Best and Local Best (pBest position)'
          'Personal Best and Local Best (current position)'
          'Personal Best and Local Best (pBest position)')
        TabOrder = 4
        OnClick = VelUpRadGrpClick
      end
    end
    object SwarmPage: TTabSheet
      Caption = 'Swarm Viewer'
      object Label6: TLabel
        Left = 184
        Top = 552
        Width = 72
        Height = 13
        Caption = 'Particle Size'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 440
        Top = 552
        Width = 20
        Height = 13
        Caption = 'Max'
      end
      object Label8: TLabel
        Left = 264
        Top = 552
        Width = 17
        Height = 13
        Caption = 'Min'
      end
      object Label9: TLabel
        Left = 16
        Top = 16
        Width = 29
        Height = 13
        Caption = 'Y-Axis'
      end
      object Label10: TLabel
        Left = 520
        Top = 552
        Width = 29
        Height = 13
        Caption = 'X-Axis'
      end
      object SwarmChart: TChart
        Left = 80
        Top = 8
        Width = 537
        Height = 529
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Swarm Chart')
        Legend.Visible = False
        View3D = False
        TabOrder = 0
        object SSwarm: TBubbleSeries
          Marks.ArrowLength = 0
          Marks.Frame.Visible = False
          Marks.Transparent = True
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Swarm'
          Pointer.HorizSize = 52
          Pointer.InflateMargins = False
          Pointer.Style = psCircle
          Pointer.VertSize = 52
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          RadiusValues.DateTime = False
          RadiusValues.Name = 'Radius'
          RadiusValues.Multiplier = 1.000000000000000000
          RadiusValues.Order = loNone
        end
      end
      object SVPartSizeBar: TTrackBar
        Left = 288
        Top = 544
        Width = 150
        Height = 25
        Enabled = False
        Max = 100
        Position = 10
        TabOrder = 1
        TickStyle = tsNone
        OnChange = SVPartSizeBarChange
      end
      object SVPlotSwarmBox: TCheckBox
        Left = 24
        Top = 552
        Width = 97
        Height = 17
        Caption = 'Plot Swarm?'
        TabOrder = 2
      end
      object SVYEdit: TESBPosSpinEdit
        Left = 16
        Top = 32
        Width = 41
        MaxLength = 0
        Value = 1
        OnChange = SVYEditChange
        Enabled = False
        TabOrder = 3
      end
      object SVXEdit: TESBPosSpinEdit
        Left = 558
        Top = 547
        Width = 47
        MaxLength = 0
        OnChange = SVXEditChange
        Enabled = False
        TabOrder = 4
      end
    end
    object ProgressPage: TTabSheet
      Caption = 'Progress Viewer'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 16
        Width = 185
        Height = 561
        TabOrder = 0
        object Label5: TLabel
          Left = 8
          Top = 16
          Width = 89
          Height = 13
          Caption = 'Global Fitness: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BestFitLbl: TLabel
          Left = 96
          Top = 16
          Width = 46
          Height = 13
          Caption = 'BestFitLbl'
        end
        object BestFitGrid: TStringGrid
          Left = 16
          Top = 40
          Width = 161
          Height = 513
          ColCount = 2
          TabOrder = 0
          RowHeights = (
            24
            24
            24
            24
            24)
        end
      end
      object GroupBox3: TGroupBox
        Left = 192
        Top = 16
        Width = 513
        Height = 561
        TabOrder = 1
        object AvFitChart: TChart
          Left = 16
          Top = 16
          Width = 489
          Height = 281
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            'Average Swarm Fitness')
          Legend.Alignment = laBottom
          View3D = False
          TabOrder = 0
          object SSwarmFit: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            Title = 'Current Fitness'
            LinePen.Color = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object SSwarmPBFit: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clGreen
            Title = 'P Best Fitness'
            LinePen.Color = clGreen
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
        object AvSpeedChart: TChart
          Left = 16
          Top = 304
          Width = 489
          Height = 249
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            'Average Swarm Speed')
          Legend.Alignment = laBottom
          Legend.Visible = False
          View3D = False
          TabOrder = 1
          object SSwarmSpeed: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            Title = 'Average Speed'
            LinePen.Color = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
    end
    object FitnessPage: TTabSheet
      Caption = 'Fitness Viewer'
      ImageIndex = 2
      object FitImg: TImage
        Left = 224
        Top = 64
        Width = 450
        Height = 450
      end
      object Label23: TLabel
        Left = 114
        Top = 58
        Width = 28
        Height = 13
        Caption = 'Y-axis'
      end
      object Label24: TLabel
        Left = 531
        Top = 532
        Width = 28
        Height = 13
        Caption = 'X-axis'
      end
      object PlotFitBtn: TButton
        Left = 304
        Top = 536
        Width = 75
        Height = 25
        Caption = 'Plot Fitness'
        TabOrder = 0
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 80
        Width = 177
        Height = 489
        Caption = 'Evaluate Fitness'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object FitEvalLbl: TLabel
          Left = 6
          Top = 37
          Width = 49
          Height = 13
          Caption = 'Fitness :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EvalBtn: TButton
          Left = 40
          Top = 64
          Width = 75
          Height = 25
          Caption = 'Evaluate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = EvalBtnClick
        end
        object EvalFitGrid: TStringGrid
          Left = 8
          Top = 96
          Width = 161
          Height = 385
          ColCount = 2
          RowCount = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          ParentFont = False
          TabOrder = 1
          RowHeights = (
            24
            24
            24
            24
            24
            24
            24
            24
            24
            24)
        end
      end
      object FVYEdit: TESBPosSpinEdit
        Left = 160
        Top = 56
        Width = 49
        MaxLength = 0
        TabOrder = 2
      end
      object FVXEdit: TESBPosSpinEdit
        Left = 576
        Top = 528
        Width = 49
        MaxLength = 0
        TabOrder = 3
      end
    end
    object ParticlePage: TTabSheet
      Caption = 'Particle Viewer'
      ImageIndex = 3
      object Label11: TLabel
        Left = 8
        Top = 32
        Width = 95
        Height = 13
        Caption = 'Particle Number:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PartGrid: TStringGrid
        Left = 0
        Top = 88
        Width = 161
        Height = 65
        ColCount = 2
        RowCount = 2
        FixedRows = 0
        TabOrder = 0
      end
      object PartPosGrid: TStringGrid
        Left = 16
        Top = 416
        Width = 673
        Height = 153
        ColCount = 10
        TabOrder = 1
        RowHeights = (
          24
          24
          24
          24
          24)
      end
      object IndivFitChart: TChart
        Left = 216
        Top = 16
        Width = 465
        Height = 185
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Individual Fitness')
        Legend.Visible = False
        View3D = False
        TabOrder = 2
        object SIndivFit: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Individual Fitness'
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object PartNumViewEdit: TESBPosSpinEdit
        Left = 120
        Top = 32
        Width = 63
        MaxLength = 0
        OnChange = PartNumViewEditChange
        Enabled = False
        TabOrder = 3
      end
      object IndivSpeedChart: TChart
        Left = 216
        Top = 216
        Width = 465
        Height = 185
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Individual Speed')
        Legend.Visible = False
        View3D = False
        TabOrder = 4
        object SIndivSpeed: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'IndividualSpeed'
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object BatchViewPage: TTabSheet
      Caption = 'Batch Performance'
      ImageIndex = 5
      object BFitChart: TChart
        Left = 8
        Top = 32
        Width = 697
        Height = 257
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Best Fitness in each run')
        Legend.Visible = False
        View3D = False
        TabOrder = 0
        object SBatFit: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Batch Fitness'
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object BRunChart: TChart
        Left = 8
        Top = 296
        Width = 697
        Height = 273
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Average Iterations til termination')
        Legend.Visible = False
        View3D = False
        TabOrder = 1
        object SBatRun: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Batch Iterations'
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object PlotBatch: TCheckBox
        Left = 32
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Plot Charts'
        TabOrder = 2
      end
    end
  end
  object BestFitChart: TChart
    Left = 8
    Top = 376
    Width = 305
    Height = 201
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Global Fitness History')
    Legend.Visible = False
    View3D = False
    TabOrder = 2
    object SBestFit: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Best Fitness'
      LinePen.Color = clRed
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object StopFlagBtn: TBitBtn
    Left = 224
    Top = 0
    Width = 89
    Height = 25
    Caption = 'Stop!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = StopFlagBtnClick
    Kind = bkCancel
  end
  object GroupBox10: TGroupBox
    Left = 24
    Top = 608
    Width = 185
    Height = 65
    Caption = 'Jiggle Settings'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object JigBtn: TButton
      Left = 8
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Jiggle'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = JigBtnClick
    end
    object JigEdit: TESBFloatSpinEdit
      Left = 90
      Top = 20
      Max = 100.000000000000000000
      MaxLength = 0
      PageStep = 10.000000000000000000
      Step = 1.000000000000000000
      Value = 0.500000000000000000
      TabOrder = 1
    end
  end
  object PSOMen: TMainMenu
    Left = 288
    Top = 576
    object FMenu: TMenuItem
      Caption = 'Function...'
      OnClick = FMenuClick
    end
    object AMenu: TMenuItem
      Caption = 'About...'
    end
    object ExitMenu: TMenuItem
      Caption = 'Exit'
    end
  end
  object NormalTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = NormalTimerTimer
    Left = 256
    Top = 576
  end
end
