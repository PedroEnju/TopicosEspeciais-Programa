object F_Fornecedor: TF_Fornecedor
  Left = 0
  Top = 0
  Caption = 'Fornecedor'
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
    Top = 48
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 124
    Top = 50
    Width = 39
    Height = 13
    Caption = '*Cidade'
  end
  object Label3: TLabel
    Left = 8
    Top = 101
    Width = 100
    Height = 13
    Caption = 'Nome do Fornecedor'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 144
    Width = 25
    Height = 13
    Caption = 'CNPJ'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 187
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  object DBText1: TDBText
    Left = 8
    Top = 67
    Width = 100
    Height = 17
    Alignment = taRightJustify
    DataField = 'IDFORNECEDOR'
    DataSource = DM.DS_Fornecedor
  end
  inline Frame_Button1: TFrame_Button
    Left = 0
    Top = 0
    Width = 600
    Height = 32
    Align = alTop
    TabOrder = 5
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
  object DBEdit3: TDBEdit
    Left = 8
    Top = 120
    Width = 584
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOMEFORNECEDOR'
    DataSource = DM.DS_Fornecedor
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 160
    Width = 134
    Height = 21
    DataField = 'CNPJ'
    DataSource = DM.DS_Fornecedor
    TabOrder = 2
  end
  object DBComboBox1: TDBComboBox
    Left = 8
    Top = 203
    Width = 113
    Height = 21
    DataField = 'STATUSFORNECEDOR'
    DataSource = DM.DS_Fornecedor
    Items.Strings = (
      'A'
      'I')
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 124
    Top = 63
    Width = 175
    Height = 21
    DataField = 'IDCIDADE'
    DataSource = DM.DS_Fornecedor
    KeyField = 'IDCIDADE'
    ListField = 'NOMECIDADE'
    ListSource = DM.DS_Cidade
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 240
    Width = 584
    Height = 232
    DataSource = DM.DS_Fornecedor
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDFORNECEDOR'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEFORNECEDOR'
        Title.Caption = 'Nome do Fornecedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomecidade'
        Title.Caption = 'Cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUSFORNECEDOR'
        Title.Caption = 'Status'
        Visible = True
      end>
  end
  object btnCidade: TBitBtn
    Left = 305
    Top = 63
    Width = 17
    Height = 21
    Caption = '+'
    TabOrder = 6
    OnClick = btnCidadeClick
  end
end
