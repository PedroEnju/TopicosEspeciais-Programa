object F_ItemVenda: TF_ItemVenda
  Left = 0
  Top = 0
  Caption = 'Item Venda'
  ClientHeight = 187
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 22
    Height = 13
    Caption = 'Item'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 156
    Top = 13
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object Label3: TLabel
    Left = 16
    Top = 61
    Width = 56
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'Quantidade'
    FocusControl = DBEdit3
    ParentBiDiMode = False
  end
  object Label4: TLabel
    Left = 156
    Top = 61
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 16
    Top = 120
    Width = 43
    Height = 19
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 65
    Top = 120
    Width = 225
    Height = 19
    DataField = 'TOTAL'
    DataSource = DM.DS_ItemVenda
  end
  object DBText2: TDBText
    Left = 156
    Top = 80
    Width = 134
    Height = 17
    DataField = 'VALOR'
    DataSource = DM.DS_ItemVenda
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 29
    Width = 134
    Height = 21
    DataField = 'IDITEMVENDA'
    DataSource = DM.DS_ItemVenda
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 77
    Width = 134
    Height = 21
    DataField = 'QUANTIDADE'
    DataSource = DM.DS_ItemVenda
    TabOrder = 1
    OnExit = DBEdit3Exit
  end
  object btn_inserir: TBitBtn
    Left = 160
    Top = 156
    Width = 130
    Height = 25
    Caption = 'Inserir'
    TabOrder = 2
  end
  object btn_cancelar: TBitBtn
    Left = 16
    Top = 156
    Width = 130
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 156
    Top = 29
    Width = 134
    Height = 21
    DataField = 'IDPRODUTO'
    DataSource = DM.DS_ItemVenda
    KeyField = 'IDPRODUTO'
    ListField = 'NOMEPRODUTO'
    ListSource = DM.DS_Produto
    TabOrder = 4
    OnExit = DBLookupComboBox1Exit
  end
end
