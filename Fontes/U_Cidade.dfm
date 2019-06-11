object F_Cidade: TF_Cidade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cidade'
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
    Left = 8
    Top = 80
    Width = 87
    Height = 13
    Caption = 'NOME DA CIDADE'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 120
    Width = 38
    Height = 13
    Caption = 'STATUS'
  end
  object DBText1: TDBText
    Left = 8
    Top = 57
    Width = 65
    Height = 17
    Alignment = taRightJustify
    DataField = 'IDCIDADE'
    DataSource = DM.DS_Cidade
  end
  inline Frame_Button1: TFrame_Button
    Left = 0
    Top = 0
    Width = 610
    Height = 34
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 600
    ExplicitHeight = 34
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
  object DBEdit2: TDBEdit
    Left = 8
    Top = 96
    Width = 589
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOMECIDADE'
    DataSource = DM.DS_Cidade
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 176
    Width = 584
    Height = 296
    DataSource = DM.DS_Cidade
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECIDADE'
        Title.Caption = 'Nome da Cidade'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STATUSCIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Visible = True
      end>
  end
  object DBComboBox1: TDBComboBox
    Left = 8
    Top = 139
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    DataField = 'STATUSCIDADE'
    DataSource = DM.DS_Cidade
    Items.Strings = (
      'A'
      'I')
    TabOrder = 1
  end
end
