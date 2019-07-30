object F_Venda: TF_Venda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Venda'
  ClientHeight = 552
  ClientWidth = 670
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
    Width = 670
    Height = 32
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 660
  end
  object pVenda: TPanel
    Left = 0
    Top = 32
    Width = 670
    Height = 153
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 660
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 85
      Height = 13
      Caption = 'N'#250'mero da Venda'
      FocusControl = DBEdit1
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
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 4
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 4
      Top = 104
      Width = 60
      Height = 13
      Caption = 'DATAVENDA'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 144
      Top = 104
      Width = 62
      Height = 13
      Caption = 'HORAVENDA'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 289
      Top = 104
      Width = 24
      Height = 13
      Caption = 'TIPO'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'IDVENDA'
      DataSource = DM.DS_Venda
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 4
      Top = 80
      Width = 589
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = DM.DS_Venda
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 4
      Top = 120
      Width = 134
      Height = 21
      DataField = 'DATAVENDA'
      DataSource = DM.DS_Venda
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 144
      Top = 120
      Width = 134
      Height = 21
      DataField = 'HORAVENDA'
      DataSource = DM.DS_Venda
      TabOrder = 3
    end
    object DBComboBox1: TDBComboBox
      Left = 284
      Top = 120
      Width = 145
      Height = 21
      DataField = 'TIPO'
      DataSource = DM.DS_Venda
      Items.Strings = (
        #192' Vista'
        #192' Prazo')
      TabOrder = 4
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 148
      Top = 27
      Width = 145
      Height = 21
      DataField = 'IDFUNCIONARIO'
      DataSource = DM.DS_Venda
      TabOrder = 5
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 299
      Top = 27
      Width = 145
      Height = 21
      DataField = 'IDCLIENTE'
      DataSource = DM.DS_Venda
      TabOrder = 6
    end
    object BitBtn1: TBitBtn
      Left = 456
      Top = 24
      Width = 28
      Height = 25
      TabOrder = 7
    end
  end
  object pItVenda: TPanel
    Left = 0
    Top = 185
    Width = 670
    Height = 297
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 660
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
    object btExcluirItem: TBitBtn
      Left = 518
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Excluir Item'
      TabOrder = 0
    end
    object btAlterarItem: TBitBtn
      Left = 437
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Alterar Item'
      TabOrder = 1
    end
    object btNovoitem: TBitBtn
      Left = 356
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Novo Item'
      TabOrder = 2
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 37
      Width = 596
      Height = 217
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
    Top = 490
    Width = 670
    Height = 62
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 480
    ExplicitWidth = 660
    object Label9: TLabel
      Left = 199
      Top = 8
      Width = 123
      Height = 19
      Caption = 'STATUSVENDA'
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
      Left = 238
      Top = 33
      Width = 65
      Height = 17
      DataSource = DM.DS_Venda
    end
    object DBText2: TDBText
      Left = 540
      Top = 11
      Width = 65
      Height = 17
      DataSource = DM.DS_Venda
    end
    object DBText3: TDBText
      Left = 540
      Top = 24
      Width = 65
      Height = 17
      DataSource = DM.DS_Venda
    end
    object DBText4: TDBText
      Left = 540
      Top = 39
      Width = 65
      Height = 17
      DataSource = DM.DS_Venda
    end
    object btFinalizar: TBitBtn
      Left = 8
      Top = 0
      Width = 185
      Height = 57
      Caption = 'Finalizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
end
