object F_ContasPagar: TF_ContasPagar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contas a Pagar'
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
  object Label2: TLabel
    Left = 87
    Top = 38
    Width = 69
    Height = 13
    Caption = 'FORNECEDOR'
  end
  object Label3: TLabel
    Left = 288
    Top = 38
    Width = 24
    Height = 13
    Caption = 'TIPO'
  end
  object Label4: TLabel
    Left = 335
    Top = 38
    Width = 66
    Height = 13
    Caption = 'N'#186' PARCELAS'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 441
    Top = 38
    Width = 62
    Height = 13
    Caption = 'DATACONTA'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 8
    Top = 88
    Width = 68
    Height = 13
    Caption = 'VALOR TOTAL'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 148
    Top = 88
    Width = 73
    Height = 13
    Caption = 'STATUSCONTA'
  end
  object db: TDBText
    Left = 8
    Top = 57
    Width = 65
    Height = 17
    Alignment = taRightJustify
    DataField = 'IDCONTASPAGAR'
    DataSource = DM.DS_ContasPagar
  end
  object DBText1: TDBText
    Left = 288
    Top = 57
    Width = 41
    Height = 21
    DataField = 'TIPO'
    DataSource = DM.DS_ContasPagar
  end
  object DBText2: TDBText
    Left = 148
    Top = 107
    Width = 65
    Height = 17
    DataField = 'STATUSCONTA'
    DataSource = DM.DS_ContasPagar
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
      Enabled = False
      Visible = False
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
  object DBEdit4: TDBEdit
    Left = 335
    Top = 57
    Width = 100
    Height = 21
    DataField = 'QUANTIDADEPARCELA'
    DataSource = DM.DS_ContasPagar
    TabOrder = 1
  end
  object DBEdit5: TDBEdit
    Left = 441
    Top = 57
    Width = 101
    Height = 21
    DataField = 'DATACONTA'
    DataSource = DM.DS_ContasPagar
    TabOrder = 2
  end
  object DBEdit6: TDBEdit
    Left = 8
    Top = 107
    Width = 134
    Height = 21
    DataField = 'VALORTOTAL'
    DataSource = DM.DS_ContasPagar
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 144
    Width = 594
    Height = 338
    DataSource = DM.DS_ParcelaContasPagar
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMEROPARCELA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORPARCELA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAVENCIMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUSPARCELA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATARECEBIMENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUROS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MULTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORFINAL'
        Visible = True
      end>
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 87
    Top = 57
    Width = 195
    Height = 21
    DataField = 'IDFORNECEDOR'
    DataSource = DM.DS_ContasPagar
    KeyField = 'IDFORNECEDOR'
    ListField = 'NOMEFORNECEDOR'
    ListSource = DM.DS_Fornecedor
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 528
    Top = 208
    object ReceberParcela1: TMenuItem
      Caption = 'Pagar Parcela'
      OnClick = ReceberParcela1Click
    end
    object RecalcularParcela1: TMenuItem
      Caption = 'Recalcular Parcela'
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
    end
  end
end
