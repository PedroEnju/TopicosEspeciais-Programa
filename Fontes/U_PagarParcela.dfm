object F_PagarParcela: TF_PagarParcela
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pagar Parcela'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 121
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 95
      Height = 13
      Caption = 'Data de Pagamento'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 174
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Valor da Parcela'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 333
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Valor Pago'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 333
      Top = 64
      Width = 64
      Height = 13
      Caption = 'Valor '#224' Pagar'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 16
      Top = 64
      Width = 26
      Height = 13
      Caption = 'Multa'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 174
      Top = 64
      Width = 26
      Height = 13
      Caption = 'Juros'
      FocusControl = DBEdit6
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 27
      Width = 134
      Height = 21
      DataField = 'DATAPAGAMENTO'
      DataSource = DM.DS_ParcelaContasPagar
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 174
      Top = 27
      Width = 134
      Height = 21
      DataField = 'VALORPARCELA'
      DataSource = DM.DS_ParcelaContasPagar
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 333
      Top = 27
      Width = 134
      Height = 21
      DataField = 'valorPago'
      DataSource = DM.DS_ParcelaContasPagar
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 333
      Top = 80
      Width = 134
      Height = 21
      DataField = 'valorPagar'
      DataSource = DM.DS_ParcelaContasPagar
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 80
      Width = 134
      Height = 21
      DataField = 'MULTA'
      DataSource = DM.DS_ParcelaContasPagar
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 174
      Top = 80
      Width = 134
      Height = 21
      DataField = 'JUROS'
      DataSource = DM.DS_ParcelaContasPagar
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 484
    Height = 225
    Align = alClient
    TabOrder = 1
    object btn_novoItem: TBitBtn
      Left = 407
      Top = 6
      Width = 60
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btn_novoItemClick
    end
    object btn_salvarItem: TBitBtn
      Left = 407
      Top = 37
      Width = 60
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 6
      Width = 393
      Height = 203
      DataSource = DM.DS_Pagamento
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nomeTipoDocumento'
          Title.Caption = 'Tipo Documento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORPAGO'
          Title.Caption = 'Valor Pago'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUSPAGAMENTO'
          Title.Caption = 'Status'
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 346
    Width = 484
    Height = 120
    Align = alBottom
    TabOrder = 2
    object Label7: TLabel
      Left = 27
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Valor '#224' Pagar'
    end
    object Label8: TLabel
      Left = 28
      Top = 51
      Width = 63
      Height = 13
      Caption = 'Valor j'#225' Pago'
    end
    object Label9: TLabel
      Left = 45
      Top = 86
      Width = 46
      Height = 13
      Caption = 'Diferen'#231'a'
    end
    object DBText3: TDBText
      Left = 106
      Top = 88
      Width = 65
      Height = 17
      DataField = 'valorDiferenca'
      DataSource = DM.DS_ParcelaContasPagar
    end
    object DBText2: TDBText
      Left = 106
      Top = 48
      Width = 65
      Height = 17
      DataField = 'valorPago'
      DataSource = DM.DS_ParcelaContasPagar
    end
    object DBText1: TDBText
      Left = 106
      Top = 16
      Width = 65
      Height = 17
      DataField = 'valorPagar'
      DataSource = DM.DS_ParcelaContasPagar
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 466
    Width = 484
    Height = 42
    Align = alBottom
    TabOrder = 3
    object btn_cancelar: TBitBtn
      Left = 311
      Top = 6
      Width = 75
      Height = 27
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btn_cancelarClick
    end
    object btn_salvar: TBitBtn
      Left = 392
      Top = 6
      Width = 75
      Height = 27
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btn_salvarClick
    end
  end
end
