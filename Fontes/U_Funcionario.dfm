object F_Funcionario: TF_Funcionario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Funcion'#225'rio'
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
    Top = 40
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 128
    Top = 44
    Width = 44
    Height = 13
    Caption = '*CIDADE'
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 122
    Height = 13
    Caption = 'NOME DO FUNCION'#193'RIO'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 136
    Width = 44
    Height = 13
    Caption = 'SAL'#193'RIO'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 176
    Width = 92
    Height = 13
    Caption = 'DATA DE AMISS'#195'O'
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
    Width = 173
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
        Title.Alignment = taCenter
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
    TabOrder = 5
    OnClick = btnCidadeClick
  end
  inline Frame_Button1: TFrame_Button
    Left = 7
    Top = 0
    Width = 596
    Height = 32
    TabOrder = 6
    ExplicitLeft = 7
    inherited btnNovo: TBitBtn
      OnClick = Frame_Button1btnNovoClick
    end
    inherited btnSalvar: TBitBtn
      OnClick = Frame_Button1btnSalvarClick
    end
    inherited btnFechar: TBitBtn
      OnClick = Frame_Button1btnFecharClick
    end
  end
end
