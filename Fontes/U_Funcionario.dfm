object F_Funcionario: TF_Funcionario
  Left = 0
  Top = 0
  Caption = 'Funcion'#225'rio'
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
    Left = 128
    Top = 44
    Width = 39
    Height = 13
    Caption = '*Cidade'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 100
    Height = 13
    Caption = 'Nome do Funcion'#225'rio'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 136
    Width = 32
    Height = 13
    Caption = 'Sal'#225'rio'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 176
    Width = 86
    Height = 13
    Caption = 'Data de Admiss'#227'o'
    FocusControl = DBEdit5
  end
  object DBText1: TDBText
    Left = 8
    Top = 57
    Width = 100
    Height = 17
    Alignment = taRightJustify
    DataField = 'IDFUNCIONARIO'
    DataSource = DM.DS_Funcionario
  end
  inline Frame_Button1: TFrame_Button
    Left = 0
    Top = 0
    Width = 600
    Height = 33
    Align = alTop
    TabOrder = 5
    ExplicitWidth = 600
    ExplicitHeight = 33
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
    Top = 112
    Width = 589
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOMEFUNCIONARIO'
    DataSource = DM.DS_Funcionario
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 152
    Width = 134
    Height = 21
    DataField = 'SALARIO'
    DataSource = DM.DS_Funcionario
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 192
    Width = 134
    Height = 21
    DataField = 'DATAADMISSAO'
    DataSource = DM.DS_Funcionario
    MaxLength = 8
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 128
    Top = 57
    Width = 175
    Height = 21
    DataField = 'IDCIDADE'
    DataSource = DM.DS_Funcionario
    KeyField = 'IDCIDADE'
    ListField = 'NOMECIDADE'
    ListSource = DM.DS_Cidade
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 248
    Width = 584
    Height = 224
    DataSource = DM.DS_Funcionario
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDFUNCIONARIO'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEFUNCIONARIO'
        Title.Caption = 'Nome do Funcion'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALARIO'
        Title.Caption = 'Sal'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAADMISSAO'
        Title.Caption = 'Data de Admiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomecidade'
        Title.Caption = 'Cidade'
        Visible = True
      end>
  end
  object btnCidade: TBitBtn
    Left = 309
    Top = 57
    Width = 17
    Height = 21
    Caption = '+'
    TabOrder = 6
    OnClick = btnCidadeClick
  end
end
