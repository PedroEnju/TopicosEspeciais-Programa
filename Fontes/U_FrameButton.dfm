object Frame_Button: TFrame_Button
  Left = 0
  Top = 0
  Width = 596
  Height = 32
  TabOrder = 0
  object btnNovo: TBitBtn
    Left = 3
    Top = 3
    Width = 75
    Height = 25
    Caption = '&Novo'
    TabOrder = 0
    OnClick = btnNovoClick
  end
  object btnEditar: TBitBtn
    Left = 86
    Top = 3
    Width = 75
    Height = 25
    Caption = '&Editar'
    TabOrder = 1
    OnClick = btnEditarClick
  end
  object btnExcluir: TBitBtn
    Left = 252
    Top = 3
    Width = 75
    Height = 25
    Caption = 'E&xcluir'
    TabOrder = 2
    OnClick = btnExcluirClick
  end
  object btnCancelar: TBitBtn
    Left = 335
    Top = 3
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    Enabled = False
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object btnSalvar: TBitBtn
    Left = 169
    Top = 3
    Width = 75
    Height = 25
    Caption = '&Salvar'
    Enabled = False
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object btnFechar: TBitBtn
    Left = 418
    Top = 3
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 5
  end
  object btnLast: TBitBtn
    Left = 568
    Top = 3
    Width = 25
    Height = 25
    Caption = '>|'
    TabOrder = 6
  end
  object btnNext: TBitBtn
    Left = 545
    Top = 3
    Width = 25
    Height = 25
    Caption = '>'
    TabOrder = 7
  end
  object btnPrevious: TBitBtn
    Left = 522
    Top = 3
    Width = 25
    Height = 25
    Caption = '<'
    TabOrder = 8
  end
  object btnFirst: TBitBtn
    Left = 499
    Top = 3
    Width = 25
    Height = 25
    Caption = '|<'
    TabOrder = 9
  end
end
