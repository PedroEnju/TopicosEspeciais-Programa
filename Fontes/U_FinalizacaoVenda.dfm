object F_FinalizacaoVenda: TF_FinalizacaoVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Finaliza'#231#227'o de Venda'
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
    Left = 43
    Top = 93
    Width = 71
    Height = 13
    Caption = 'Valor Recebido'
  end
  object Label4: TLabel
    Left = 87
    Top = 136
    Width = 27
    Height = 13
    Caption = 'Troco'
  end
  object DBText1: TDBText
    Left = 120
    Top = 52
    Width = 172
    Height = 17
    DataField = 'totalVenda'
    DataSource = DM.DS_Venda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
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
  object edt_recebido: TEdit
    Left = 120
    Top = 90
    Width = 172
    Height = 21
    TabOrder = 2
    OnExit = edt_recebidoExit
    OnKeyPress = edt_recebidoKeyPress
  end
  object DBComboBox1: TDBComboBox
    Left = 120
    Top = 13
    Width = 172
    Height = 21
    DataField = 'TIPO'
    DataSource = DM.DS_Venda
    TabOrder = 3
  end
end
