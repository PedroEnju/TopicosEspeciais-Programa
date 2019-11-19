unit U_ParcelaContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls;

type
  TF_ParcelaContasPagar = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    btn_salvar: TBitBtn;
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    valorTotalParcela: Real;
  end;

var
  F_ParcelaContasPagar: TF_ParcelaContasPagar;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_ParcelaContasPagar.btn_salvarClick(Sender: TObject);
var
  valorDiff: Real;
begin
  With DM.TB_ParcelaContasPagar do
  begin
    if FieldByName('DataVencimento').AsDateTime < Date Then
    begin
      ShowMessage('Data de vencimento não deve ser menor que a data atual');
      DBEdit2.SetFocus;
      Exit;
    end;
    if FieldByName('ValorParcela').AsFloat <= 0 Then
    begin
      ShowMessage('Valor da parcela não deve ser menor/igual a Zero');
      DBEdit3.SetFocus;
      Exit;
    end;
    valorDiff := valorTotalParcela + DM.TB_ParcelaContasPagarVALORPARCELA.
      AsFloat + (0.01 * (DM.TB_ContasPagarQUANTIDADEPARCELA.AsInteger -
      DM.TB_ParcelaContasPagarNUMEROPARCELA.AsInteger));
    // valorDiff := Arredondavalor(vlrDif,2);
    if valorDiff > DM.TB_ContasPagarVALORTOTAL.AsFloat then
    begin
      ShowMessage('Valor Incorreto');
      DBEdit3.SetFocus;
      Exit;
    end;
    Post;
  end;

  Close;
end;

end.
