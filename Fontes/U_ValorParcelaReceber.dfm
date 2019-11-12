object F_ValorParcelaReceber: TF_ValorParcelaReceber
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'ar Valor da Parcela do Recebimento'
  ClientHeight = 124
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 77
    Height = 13
    Caption = 'Tipo Documento'
  end
  object Label2: TLabel
    Left = 14
    Top = 53
    Width = 71
    Height = 13
    Caption = 'Valor Recebido'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 91
    Top = 8
    Width = 144
    Height = 21
    DataField = 'IDTIPODOCUMENTO'
    DataSource = DM.DS_Recebimento
    KeyField = 'IDTIPODOCUMENTO'
    ListField = 'NOMETIPODOCUMENTO'
    ListSource = DM.DS_TipoDocumento
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 91
    Top = 45
    Width = 144
    Height = 21
    DataField = 'VALORRECEBIDO'
    DataSource = DM.DS_Recebimento
    TabOrder = 1
  end
  object btn_cancelar: TButton
    Left = 8
    Top = 83
    Width = 110
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btn_cancelarClick
  end
  object btn_salvar: TButton
    Left = 125
    Top = 83
    Width = 110
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btn_salvarClick
  end
end
