object F_Cliente: TF_Cliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cliente'
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
  object Label1: TLabel
    Left = 8
    Top = 30
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 97
    Height = 13
    Caption = '*NOME DO CLIENTE'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 120
    Width = 25
    Height = 13
    Caption = '*CPF'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 160
    Width = 14
    Height = 13
    Caption = 'RG'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 8
    Top = 248
    Width = 32
    Height = 13
    Caption = '*SEXO'
  end
  object Label7: TLabel
    Left = 119
    Top = 248
    Width = 38
    Height = 13
    Caption = 'STATUS'
  end
  object DBText1: TDBText
    Left = 8
    Top = 49
    Width = 100
    Height = 17
    Alignment = taRightJustify
    DataField = 'IDCLIENTE'
    DataSource = DM.DS_Cliente
  end
  object Label2: TLabel
    Left = 126
    Top = 30
    Width = 44
    Height = 13
    Caption = '*CIDADE'
  end
  object Label8: TLabel
    Left = 8
    Top = 208
    Width = 30
    Height = 13
    Caption = 'EMAIL'
    FocusControl = DBEdit1
  end
  inline Frame_Button1: TFrame_Button
    Left = 0
    Top = 0
    Width = 610
    Height = 32
    Align = alTop
    TabOrder = 0
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
    inherited btn_pesquisar: TBitBtn
      OnClick = Frame_Button1btn_pesquisarClick
    end
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 96
    Width = 576
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOMECLIENTE'
    DataSource = DM.DS_Cliente
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 136
    Width = 184
    Height = 21
    DataField = 'CPF'
    DataSource = DM.DS_Cliente
    MaxLength = 14
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 176
    Width = 264
    Height = 21
    DataField = 'RG'
    DataSource = DM.DS_Cliente
    TabOrder = 3
  end
  object btnCidade: TBitBtn
    Left = 278
    Top = 49
    Width = 17
    Height = 21
    Caption = '+'
    TabOrder = 4
    OnClick = btnCidadeClick
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 127
    Top = 49
    Width = 145
    Height = 21
    DataField = 'IDCIDADE'
    DataSource = DM.DS_Cliente
    KeyField = 'IDCIDADE'
    ListField = 'NOMECIDADE'
    ListSource = DM.DS_Cidade
    TabOrder = 5
  end
  object DBComboBox1: TDBComboBox
    Left = 8
    Top = 261
    Width = 105
    Height = 21
    DataField = 'SEXO'
    DataSource = DM.DS_Cliente
    Items.Strings = (
      'F'
      'M')
    TabOrder = 6
  end
  object DBComboBox2: TDBComboBox
    Left = 119
    Top = 261
    Width = 105
    Height = 21
    DataField = 'STATUSCLIENTE'
    DataSource = DM.DS_Cliente
    Items.Strings = (
      'A'
      'I')
    TabOrder = 7
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 288
    Width = 584
    Height = 184
    DataSource = DM.DS_Cliente
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCLIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECLIENTE'
        Title.Caption = 'Nome do Cliente'
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
        FieldName = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEXO'
        Title.Caption = 'Sexo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STATUSCLIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 221
    Width = 584
    Height = 21
    CharCase = ecLowerCase
    DataField = 'EMAIL'
    DataSource = DM.DS_Cliente
    TabOrder = 9
  end
end
