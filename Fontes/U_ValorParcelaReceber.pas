unit U_ValorParcelaReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TF_ValorParcelaReceber = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    btn_cancelar: TButton;
    btn_salvar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ValorParcelaReceber: TF_ValorParcelaReceber;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_ValorParcelaReceber.btn_cancelarClick(Sender: TObject);
begin
  DM.TB_Recebimento.Close;
  Close;
end;

procedure TF_ValorParcelaReceber.btn_salvarClick(Sender: TObject);
var
  valor: Real;
begin
  if DM.TB_RecebimentoVALORRECEBIDO.AsFloat <= 0 Then
  begin
    ShowMessage('Valor deve ser superior a zero');
    DBEdit1.SetFocus;
    Exit;
  end;

  if DM.TB_RecebimentoIDTIPODOCUMENTO.AsString = '' Then
  begin
    ShowMessage('Escolha o tipo de documento');
    DBLookupComboBox1.SetFocus;
    Exit;
  end;

  if DM.TB_RecebimentoVALORRECEBIDO.AsFloat >
    DM.TB_ParcelaContasRecebervalorreceber.AsFloat Then
  begin
    ShowMessage('Valor a receber não deve ser maior que o valor da parcela');
    DBEdit1.SetFocus;
    Exit;
  end;
  DM.TB_Recebimento.Post;
  Close;
end;

procedure TF_ValorParcelaReceber.FormShow(Sender: TObject);
begin
  With DM.TB_Recebimento do
  begin
    if Active = False then
      Open;
    Append;
    FieldByName('ValorRecebido').AsFloat :=
      DM.TB_ParcelaContasRecebervalorreceber.AsFloat -
      DM.TB_ParcelaContasRecebervalorrecebido.AsFloat;
    FieldByName('DATARECEBIMENTO').AsDateTime := Date;

  end;
end;

end.
