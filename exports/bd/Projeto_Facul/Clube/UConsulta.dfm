object FConsulta: TFConsulta
  Left = 192
  Top = 110
  Width = 702
  Height = 626
  Caption = 'Consultas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 200
    Top = 8
    Width = 280
    Height = 24
    Caption = 'Dados dos S'#243'cio Cadastrados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 176
    Top = 176
    Width = 352
    Height = 24
    Caption = 'Dados dos Dependentes Cadastrados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 160
    Top = 368
    Width = 323
    Height = 24
    Caption = 'Dados dos Atividades Cadastrados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBG_Socio: TDBGrid
    Left = 8
    Top = 32
    Width = 673
    Height = 137
    DataSource = DM.DS_SQL1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBG_Depen: TDBGrid
    Left = 8
    Top = 208
    Width = 673
    Height = 145
    DataSource = DM.DS_SQL3
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGAti: TDBGrid
    Left = 16
    Top = 392
    Width = 665
    Height = 153
    DataSource = DM.DS_SQL2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Bt_Fec: TBitBtn
    Left = 608
    Top = 560
    Width = 73
    Height = 25
    Caption = 'Sai&r'
    TabOrder = 3
    Kind = bkClose
  end
end
