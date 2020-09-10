object FPrincipal: TFPrincipal
  Left = 192
  Top = 114
  Width = 696
  Height = 480
  Caption = 'Menu Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MM_Principal
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 407
    Width = 688
    Height = 19
    Panels = <
      item
        Width = 700
      end
      item
        Alignment = taRightJustify
        Width = 150
      end
      item
        Alignment = taRightJustify
        Width = 150
      end>
  end
  object MM_Principal: TMainMenu
    Left = 8
    Top = 8
    object Cadastro1: TMenuItem
      Caption = 'C&adastro'
      object Socio1: TMenuItem
        Caption = '&S'#243'cio'
        OnClick = Socio1Click
      end
      object Dependente1: TMenuItem
        Caption = '&Dependente'
        OnClick = Dependente1Click
      end
      object Atividade2: TMenuItem
        Caption = '&Atividade'
        OnClick = Atividade2Click
      end
    end
    object Consulta1: TMenuItem
      Caption = '&Consulta'
      OnClick = Consulta1Click
    end
    object Sair1: TMenuItem
      Caption = 'Sai&r'
      OnClick = Sair1Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 48
    Top = 8
  end
  object XPManifest1: TXPManifest
    Left = 88
    Top = 8
  end
end
