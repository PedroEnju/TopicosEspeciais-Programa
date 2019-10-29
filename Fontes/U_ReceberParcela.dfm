object F_ReceberParcela: TF_ReceberParcela
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Receber Parcela'
  ClientHeight = 508
  ClientWidth = 484
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
  object TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 121
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 474
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 96
      Height = 13
      Caption = 'Data de Vencimento'
      FocusControl = DBEdit1
    end
    object Label5: TLabel
      Left = 333
      Top = 8
      Width = 71
      Height = 13
      Caption = 'Valor Recebido'
      FocusControl = DBEdit2
    end
    object Label6: TLabel
      Left = 16
      Top = 61
      Width = 26
      Height = 13
      Caption = 'Multa'
      FocusControl = DBEdit3
    end
    object Label7: TLabel
      Left = 174
      Top = 61
      Width = 26
      Height = 13
      Caption = 'Juros'
      FocusControl = DBEdit4
    end
    object Label8: TLabel
      Left = 333
      Top = 61
      Width = 76
      Height = 13
      Caption = 'Valor a Receber'
      FocusControl = DBEdit5
    end
    object Label9: TLabel
      Left = 174
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Valor da Parcela'
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 24
      Width = 134
      Height = 21
      DataField = 'DATAVENCIMENTO'
      DataSource = DM.DS_ParcelaContasReceber
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 333
      Top = 24
      Width = 134
      Height = 21
      DataField = 'valorRecebido'
      DataSource = DM.DS_ParcelaContasReceber
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 77
      Width = 134
      Height = 21
      DataField = 'MULTA'
      DataSource = DM.DS_ParcelaContasReceber
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 174
      Top = 77
      Width = 134
      Height = 21
      DataField = 'JUROS'
      DataSource = DM.DS_ParcelaContasReceber
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 333
      Top = 77
      Width = 134
      Height = 21
      DataField = 'valorReceber'
      DataSource = DM.DS_ParcelaContasReceber
      Enabled = False
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 174
      Top = 24
      Width = 134
      Height = 21
      DataField = 'VALORPARCELA'
      DataSource = DM.DS_ParcelaContasReceber
      Enabled = False
      TabOrder = 5
    end
  end
  object TPanel
    Left = 0
    Top = 346
    Width = 484
    Height = 120
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 336
    ExplicitWidth = 474
    object Label1: TLabel
      Left = 15
      Top = 16
      Width = 76
      Height = 13
      Caption = 'Valor a Receber'
    end
    object Label2: TLabel
      Left = 8
      Top = 51
      Width = 83
      Height = 13
      Caption = 'Valor j'#225' Recebido'
    end
    object Label3: TLabel
      Left = 45
      Top = 86
      Width = 46
      Height = 13
      Caption = 'Diferen'#231'a'
    end
    object DBText1: TDBText
      Left = 106
      Top = 16
      Width = 65
      Height = 17
      DataField = 'valorReceber'
      DataSource = DM.DS_ParcelaContasReceber
    end
    object DBText2: TDBText
      Left = 106
      Top = 48
      Width = 65
      Height = 17
      DataField = 'valorRecebido'
      DataSource = DM.DS_ParcelaContasReceber
    end
    object DBText3: TDBText
      Left = 106
      Top = 88
      Width = 65
      Height = 17
      DataField = 'valorDiferenca'
      DataSource = DM.DS_ParcelaContasReceber
    end
  end
  object TPanel
    Left = 0
    Top = 121
    Width = 484
    Height = 225
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 474
    ExplicitHeight = 215
    object DBGrid1: TDBGrid
      Left = 8
      Top = 6
      Width = 393
      Height = 203
      DataSource = DM.DS_Recebimento
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nomeTipoDocumento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORRECEBIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUSRECEBIMENTO'
          Visible = True
        end>
    end
    object btn_novoItem: TBitBtn
      Left = 407
      Top = 6
      Width = 60
      Height = 25
      Caption = 'Novo'
      TabOrder = 1
      OnClick = btn_novoItemClick
    end
    object btn_salvarItem: TBitBtn
      Left = 407
      Top = 37
      Width = 60
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 466
    Width = 484
    Height = 42
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 456
    ExplicitWidth = 474
    object btn_salvar: TBitBtn
      Left = 392
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TBitBtn
      Left = 311
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btn_cancelarClick
    end
  end
end
