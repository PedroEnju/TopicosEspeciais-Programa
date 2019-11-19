object F_ParcelaContasReceber: TF_ParcelaContasReceber
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Parcela Contas a Receber'
  ClientHeight = 202
  ClientWidth = 245
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 90
    Height = 13
    Caption = 'N'#250'mero da Parcela'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 96
    Height = 13
    Caption = 'Data de Vencimento'
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 77
    Height = 13
    Caption = 'Valor da Parcela'
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 27
    Width = 231
    Height = 21
    DataField = 'NUMEROPARCELA'
    DataSource = DM.DS_ParcelaContasReceber
    Enabled = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 75
    Width = 231
    Height = 21
    DataField = 'DATAVENCIMENTO'
    DataSource = DM.DS_ParcelaContasReceber
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 123
    Width = 231
    Height = 21
    DataField = 'VALORPARCELA'
    DataSource = DM.DS_ParcelaContasReceber
    Enabled = False
    TabOrder = 2
  end
  object btn_salvar: TBitBtn
    Left = 109
    Top = 173
    Width = 130
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btn_salvarClick
  end
end
