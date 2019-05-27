object F_Produto: TF_Produto
  Left = 0
  Top = 0
  Caption = 'Produto'
  ClientHeight = 480
  ClientWidth = 600
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
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 83
    Height = 13
    Caption = 'Nome do Produto'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 120
    Width = 56
    Height = 13
    Caption = 'Quantidade'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 160
    Width = 73
    Height = 13
    Caption = 'Pre'#231'o de Custo'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 200
    Width = 75
    Height = 13
    Caption = 'Pre'#231'o de Venda'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 8
    Top = 240
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  object DBText1: TDBText
    Left = 8
    Top = 57
    Width = 87
    Height = 17
    Alignment = taRightJustify
    DataField = 'IDPRODUTO'
    DataSource = DM.DS_Produto
  end
  inline Frame_Button1: TFrame_Button
    Left = 0
    Top = 0
    Width = 600
    Height = 32
    Align = alTop
    TabOrder = 6
    ExplicitWidth = 600
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
  object DBEdit2: TDBEdit
    Left = 8
    Top = 96
    Width = 589
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOMEPRODUTO'
    DataSource = DM.DS_Produto
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 136
    Width = 134
    Height = 21
    DataField = 'QUANTIDADE'
    DataSource = DM.DS_Produto
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 176
    Width = 134
    Height = 21
    DataField = 'PRECOCUSTO'
    DataSource = DM.DS_Produto
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 216
    Width = 134
    Height = 21
    DataField = 'PRECOVENDA'
    DataSource = DM.DS_Produto
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 299
    Width = 584
    Height = 173
    DataSource = DM.DS_Produto
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDPRODUTO'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEPRODUTO'
        Title.Caption = 'Nome do Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECOCUSTO'
        Title.Caption = 'Pre'#231'o de Custo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECOVENDA'
        Title.Caption = 'Pre'#231'o de Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUSPRODUTO'
        Title.Caption = 'Status'
        Visible = True
      end>
  end
  object DBComboBox1: TDBComboBox
    Left = 8
    Top = 259
    Width = 78
    Height = 21
    DataField = 'STATUSPRODUTO'
    DataSource = DM.DS_Produto
    Items.Strings = (
      'A'
      'I')
    TabOrder = 4
  end
end
