object F_Compra: TF_Compra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Compra'
  ClientHeight = 490
  ClientWidth = 610
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
  inline Frame_Button1: TFrame_Button
    Left = 0
    Top = 0
    Width = 610
    Height = 32
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 610
    inherited btnNovo: TBitBtn
      OnClick = Frame_Button1btnNovoClick
    end
    inherited btnEditar: TBitBtn
      OnClick = Frame_Button1btnEditarClick
    end
    inherited btnExcluir: TBitBtn
      OnClick = Frame_Button1btnExcluirClick
    end
    inherited btnCancelar: TBitBtn
      OnClick = Frame_Button1btnCancelarClick
    end
    inherited btnSalvar: TBitBtn
      OnClick = Frame_Button1btnSalvarClick
    end
    inherited btnFechar: TBitBtn
      OnClick = Frame_Button1btnFecharClick
    end
    inherited btnLast: TBitBtn
      OnClick = Frame_Button1btnLastClick
    end
    inherited btnNext: TBitBtn
      OnClick = Frame_Button1btnNextClick
    end
    inherited btnPrevious: TBitBtn
      OnClick = Frame_Button1btnPreviousClick
    end
    inherited btnFirst: TBitBtn
      OnClick = Frame_Button1btnFirstClick
    end
  end
  object pItCompra: TPanel
    Left = 0
    Top = 185
    Width = 610
    Height = 245
    Align = alTop
    TabOrder = 1
    object Label8: TLabel
      Left = 16
      Top = 8
      Width = 319
      Height = 23
      Caption = '------- Entrada de Produtos -------'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_excluirItem: TBitBtn
      Left = 518
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Excluir Item'
      Enabled = False
      TabOrder = 0
      OnClick = btn_excluirItemClick
    end
    object btn_alterarItem: TBitBtn
      Left = 437
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Alterar Item'
      Enabled = False
      TabOrder = 1
      OnClick = btn_alterarItemClick
    end
    object btn_novoItem: TBitBtn
      Left = 356
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Novo Item'
      Enabled = False
      TabOrder = 2
      OnClick = btn_novoItemClick
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 39
      Width = 596
      Height = 186
      DataSource = DM.DS_ItemCompra
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pResultado: TPanel
    Left = 0
    Top = 428
    Width = 610
    Height = 62
    Align = alBottom
    TabOrder = 2
    object Label9: TLabel
      Left = 167
      Top = 8
      Width = 172
      Height = 19
      Caption = 'STATUS DA COMPRA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 437
      Top = 24
      Width = 97
      Height = 16
      Caption = 'Total da Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 377
      Top = 10
      Width = 157
      Height = 16
      Caption = 'Quantidade de Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 337
      Top = 38
      Width = 197
      Height = 16
      Caption = 'Quantidade de Itens da Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 206
      Top = 33
      Width = 65
      Height = 17
      DataField = 'STATUSCOMPRA'
      DataSource = DM.DS_Compra
    end
    object DBText2: TDBText
      Left = 540
      Top = 11
      Width = 65
      Height = 17
      DataField = 'qtdProduto'
      DataSource = DM.DS_Compra
    end
    object DBText3: TDBText
      Left = 540
      Top = 24
      Width = 65
      Height = 17
      DataField = 'totalCompra'
      DataSource = DM.DS_Compra
    end
    object DBText4: TDBText
      Left = 540
      Top = 39
      Width = 65
      Height = 17
      DataField = 'qtdItemCompra'
      DataSource = DM.DS_Compra
    end
    object btn_finalizar: TBitBtn
      Left = 8
      Top = 8
      Width = 153
      Height = 49
      Caption = 'Finalizar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btn_finalizarClick
    end
  end
  object pCompra: TPanel
    Left = 0
    Top = 32
    Width = 610
    Height = 153
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 92
      Height = 13
      Caption = 'N'#250'mero da Compra'
    end
    object Label2: TLabel
      Left = 148
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Funcion'#225'rio'
    end
    object Label3: TLabel
      Left = 299
      Top = 9
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object Label4: TLabel
      Left = 8
      Top = 51
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 8
      Top = 96
      Width = 78
      Height = 13
      Caption = 'Data da Compra'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 148
      Top = 96
      Width = 78
      Height = 13
      Caption = 'Hora da Compra'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 288
      Top = 94
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object DBText5: TDBText
      Left = 8
      Top = 28
      Width = 134
      Height = 17
      Alignment = taRightJustify
      DataField = 'IDCOMPRA'
      DataSource = DM.DS_Compra
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 67
      Width = 585
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = DM.DS_Venda
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 112
      Width = 134
      Height = 21
      DataField = 'DATACOMPRA'
      DataSource = DM.DS_Compra
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 148
      Top = 112
      Width = 134
      Height = 21
      DataField = 'HORACOMPRA'
      DataSource = DM.DS_Compra
      TabOrder = 2
    end
    object DBComboBox1: TDBComboBox
      Left = 288
      Top = 112
      Width = 145
      Height = 21
      DataField = 'TIPO'
      DataSource = DM.DS_Venda
      Items.Strings = (
        #192' Vista'
        #192' Prazo')
      TabOrder = 3
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 148
      Top = 24
      Width = 145
      Height = 21
      DataField = 'IDFUNCIONARIO'
      DataSource = DM.DS_Compra
      KeyField = 'IDFUNCIONARIO'
      ListField = 'NOMEFUNCIONARIO'
      ListSource = DM.DS_Funcionario
      TabOrder = 4
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 299
      Top = 24
      Width = 145
      Height = 21
      DataField = 'IDFORNECEDOR'
      DataSource = DM.DS_Compra
      KeyField = 'IDFORNECEDOR'
      ListField = 'NOMEFORNECEDOR'
      ListSource = DM.DS_Fornecedor
      TabOrder = 5
    end
    object btn_cliente: TBitBtn
      Left = 449
      Top = 24
      Width = 25
      Height = 21
      TabOrder = 6
    end
  end
end
