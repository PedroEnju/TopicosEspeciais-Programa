object F_ContasReceber: TF_ContasReceber
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contas a Receber'
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
    Top = 38
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label3: TLabel
    Left = 101
    Top = 38
    Width = 41
    Height = 13
    Caption = 'CLIENTE'
  end
  object Label4: TLabel
    Left = 319
    Top = 38
    Width = 24
    Height = 13
    Caption = 'TIPO'
  end
  object Label5: TLabel
    Left = 362
    Top = 38
    Width = 66
    Height = 13
    Caption = 'N'#186' PARCELAS'
  end
  object Label6: TLabel
    Left = 445
    Top = 38
    Width = 62
    Height = 13
    Caption = 'DATACONTA'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 8
    Top = 89
    Width = 68
    Height = 13
    Caption = 'VALOR TOTAL'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 155
    Top = 89
    Width = 73
    Height = 13
    Caption = 'STATUSCONTA'
  end
  object DBText1: TDBText
    Left = 8
    Top = 57
    Width = 87
    Height = 17
    Alignment = taRightJustify
    DataField = 'IDCONTASRECEBER'
    DataSource = DM.DS_ContasReceber
    Enabled = False
  end
  object DBText2: TDBText
    Left = 319
    Top = 57
    Width = 24
    Height = 17
    DataField = 'TIPO'
    DataSource = DM.DS_ContasReceber
  end
  object DBText3: TDBText
    Left = 155
    Top = 108
    Width = 65
    Height = 17
    DataField = 'STATUSCONTA'
    DataSource = DM.DS_ContasReceber
  end
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
      Visible = False
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
  object DBEdit6: TDBEdit
    Left = 445
    Top = 57
    Width = 108
    Height = 21
    DataField = 'DATACONTA'
    DataSource = DM.DS_ContasReceber
    TabOrder = 1
  end
  object DBEdit7: TDBEdit
    Left = 8
    Top = 105
    Width = 134
    Height = 21
    DataField = 'VALORTOTAL'
    DataSource = DM.DS_ContasReceber
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 101
    Top = 57
    Width = 202
    Height = 21
    DataField = 'IDCLIENTE'
    DataSource = DM.DS_ContasReceber
    KeyField = 'IDCLIENTE'
    ListField = 'NOMECLIENTE'
    ListSource = DM.DS_Cliente
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 132
    Width = 594
    Height = 350
    DataSource = DM.DS_ParcelaContasReceber
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 362
    Top = 57
    Width = 66
    Height = 21
    DataField = 'QUANTIDADEPARCELA'
    DataSource = DM.DS_ContasReceber
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 512
    Top = 216
    object ReceberParcela1: TMenuItem
      Caption = 'Receber Parcela'
    end
    object RecalcularParcela1: TMenuItem
      Caption = 'Recalcular Parcela'
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
    end
  end
end
