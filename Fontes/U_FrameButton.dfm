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
    Left = 78
    Top = 3
    Width = 75
    Height = 25
    Caption = '&Editar'
    TabOrder = 1
    OnClick = btnEditarClick
  end
  object btnExcluir: TBitBtn
    Left = 228
    Top = 3
    Width = 75
    Height = 25
    Caption = 'E&xcluir'
    TabOrder = 2
    OnClick = btnExcluirClick
  end
  object btnCancelar: TBitBtn
    Left = 303
    Top = 3
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    Enabled = False
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object btnSalvar: TBitBtn
    Left = 153
    Top = 3
    Width = 75
    Height = 25
    Caption = '&Salvar'
    Enabled = False
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object btnFechar: TBitBtn
    Left = 378
    Top = 3
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 5
  end
  object btnLast: TBitBtn
    Left = 528
    Top = 3
    Width = 25
    Height = 25
    Caption = '>|'
    TabOrder = 6
  end
  object btnNext: TBitBtn
    Left = 505
    Top = 3
    Width = 25
    Height = 25
    Caption = '>'
    TabOrder = 7
  end
  object btnPrevious: TBitBtn
    Left = 482
    Top = 3
    Width = 25
    Height = 25
    Caption = '<'
    TabOrder = 8
  end
  object btnFirst: TBitBtn
    Left = 459
    Top = 3
    Width = 25
    Height = 25
    Caption = '|<'
    TabOrder = 9
  end
  object btn_pesquisar: TBitBtn
    Left = 559
    Top = 3
    Width = 34
    Height = 25
    TabOrder = 10
  end
end
