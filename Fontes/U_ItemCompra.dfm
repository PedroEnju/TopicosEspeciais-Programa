object F_ItemCompra: TF_ItemCompra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Item Compra'
  ClientHeight = 220
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText
    Left = 65
    Top = 120
    Width = 225
    Height = 19
    DataField = 'TOTAL'
    DataSource = DM.DS_ItemCompra
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 42
    Top = 160
    Width = 96
    Height = 17
    DataField = 'PRECOCUSTO'
    DataSource = DM.DS_Produto
  end
  object Label1: TLabel
    Left = 8
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
    Left = 8
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
    Left = 8
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
  object Label6: TLabel
    Left = 8
    Top = 160
    Width = 28
    Height = 13
    Caption = 'Custo'
  end
  object btn_cancelar: TBitBtn
    Left = 8
    Top = 187
    Width = 130
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 0
    OnClick = btn_cancelarClick
  end
  object btn_inserir: TBitBtn
    Left = 160
    Top = 187
    Width = 130
    Height = 25
    Caption = 'Inserir'
    TabOrder = 1
    OnClick = btn_inserirClick
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 29
    Width = 134
    Height = 21
    DataField = 'IDITEMCOMPRA'
    DataSource = DM.DS_ItemCompra
    Enabled = False
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 156
    Top = 77
    Width = 134
    Height = 21
    DataField = 'VALOR'
    DataSource = DM.DS_ItemCompra
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 77
    Width = 134
    Height = 21
    DataField = 'QUANTIDADE'
    DataSource = DM.DS_ItemCompra
    TabOrder = 4
    OnExit = DBEdit3Exit
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 156
    Top = 29
    Width = 134
    Height = 21
    DataField = 'IDPRODUTO'
    DataSource = DM.DS_ItemCompra
    KeyField = 'IDPRODUTO'
    ListField = 'NOMEPRODUTO'
    ListSource = DM.DS_Produto
    TabOrder = 5
    OnExit = DBLookupComboBox1Exit
  end
end
