object PForm: TPForm
  Left = 526
  Top = 214
  Width = 614
  Height = 406
  Caption = 'Problem Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PSFitLbl: TLabel
    Left = 120
    Top = 224
    Width = 56
    Height = 13
    Caption = 'Fitness = '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ProbMemo: TMemo
    Left = 296
    Top = 32
    Width = 281
    Height = 185
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object EvalFitGrid: TStringGrid
    Left = 16
    Top = 248
    Width = 561
    Height = 73
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssHorizontal
    TabOrder = 1
    ColWidths = (
      64
      64
      64
      64
      64)
  end
  object OkBtn: TBitBtn
    Left = 192
    Top = 328
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object CancelBtn: TBitBtn
    Left = 336
    Top = 328
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object EvalBtn: TButton
    Left = 16
    Top = 216
    Width = 91
    Height = 25
    Caption = 'Evaluate'
    TabOrder = 4
    OnClick = EvalBtnClick
  end
  object ProbRadGrp: TRadioGroup
    Left = 8
    Top = 16
    Width = 137
    Height = 81
    Caption = 'Select Problem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Origin '
      'Origin Offset '
      'Rastrigin Function'
      'Schwefel Function')
    ParentFont = False
    TabOrder = 5
    OnClick = ProbRadGrpClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 104
    Width = 137
    Height = 49
    Caption = 'Number of Dimensions'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object DimSpin: TESBPosSpinEdit
      Left = 8
      Top = 20
      Width = 81
      MaxLength = 0
      Value = 20
      OnChange = DimSpinChange
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 160
    Width = 137
    Height = 49
    Caption = 'Seed Value'
    TabOrder = 7
    object SeedEdit: TESBPosSpinEdit
      Left = 8
      Top = 20
      Width = 81
      MaxLength = 0
      TabOrder = 0
    end
  end
  object DomRadGrp: TRadioGroup
    Left = 160
    Top = 16
    Width = 121
    Height = 49
    Caption = 'Domain Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Integer'
      'Real')
    ParentFont = False
    TabOrder = 8
    OnClick = DomRadGrpClick
  end
  object GroupBox3: TGroupBox
    Left = 152
    Top = 160
    Width = 121
    Height = 49
    Caption = 'Population Size'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    object PopEdit: TESBPosSpinEdit
      Left = 8
      Top = 20
      Width = 81
      MaxLength = 0
      Value = 50
      TabOrder = 0
    end
  end
end
