object F_PesquisaCliente: TF_PesquisaCliente
  Left = 0
  Top = 0
  Caption = 'Pesquisar Cliente'
  ClientHeight = 420
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edt_pesquisa: TEdit
    Left = 95
    Top = 18
    Width = 416
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyPress = edt_pesquisaKeyPress
  end
  object btn_pesquisa: TBitBtn
    Left = 517
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = btn_pesquisaClick
  end
  object Grid_Pesquisa: TDBGrid
    Left = 8
    Top = 136
    Width = 584
    Height = 276
    DataSource = DM.DS_Pesquisa
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object rg_pesquisa: TRadioGroup
    Left = 8
    Top = 8
    Width = 81
    Height = 105
    BiDiMode = bdLeftToRight
    Caption = 'Filtro'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'C'#243'digo'
      'Nome'
      'Cidade'
      'Status')
    ParentBiDiMode = False
    TabOrder = 3
  end
end
