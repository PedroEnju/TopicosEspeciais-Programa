object F_FinalizacaoCompra: TF_FinalizacaoCompra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Finaliza'#231#227'o da Compra'
  ClientHeight = 230
  ClientWidth = 305
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
  object DBText1: TDBText
    Left = 120
    Top = 52
    Width = 172
    Height = 17
    DataField = 'totalCompra'
    DataSource = DM.DS_Compra
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 70
    Top = 16
    Width = 44
    Height = 13
    Caption = 'Condi'#231#227'o'
  end
  object Label2: TLabel
    Left = 90
    Top = 52
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object Label3: TLabel
    Left = 63
    Top = 93
    Width = 51
    Height = 13
    Caption = 'Valor Pago'
  end
  object Label4: TLabel
    Left = 87
    Top = 136
    Width = 27
    Height = 13
    Caption = 'Troco'
  end
  object lb_troco: TLabel
    Left = 120
    Top = 136
    Width = 3
    Height = 13
  end
  object btn_cancelar: TBitBtn
    Left = 8
    Top = 197
    Width = 130
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 0
    OnClick = btn_cancelarClick
  end
  object btn_salvar: TBitBtn
    Left = 162
    Top = 197
    Width = 130
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btn_salvarClick
  end
  object DBComboBox1: TDBComboBox
    Left = 120
    Top = 13
    Width = 172
    Height = 21
    DataField = 'TIPO'
    DataSource = DM.DS_Compra
    TabOrder = 2
  end
  object edt_pago: TEdit
    Left = 120
    Top = 90
    Width = 172
    Height = 21
    TabOrder = 3
    OnExit = edt_pagoExit
    OnKeyPress = edt_pagoKeyPress
  end
end
