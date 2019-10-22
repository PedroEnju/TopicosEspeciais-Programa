unit U_ParcelaContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls;

type
  TF_ParcelaContasReceber = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    btn_salvar: TBitBtn;
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    valorTotalParcela: Real;
  end;

var
  F_ParcelaContasReceber: TF_ParcelaContasReceber;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_ParcelaContasReceber.btn_salvarClick(Sender: TObject);
var
  valorDiff: Real;
begin
  With DM.TB_ParcelaContasReceber do
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
    valorDiff := valorTotalParcela + DM.TB_ParcelaContasReceberVALORPARCELA.
      AsFloat + (0.01 * (DM.TB_ContasReceberQUANTIDADEPARCELA.AsInteger -
      DM.TB_ParcelaContasReceberNUMEROPARCELA.AsInteger));
    // valorDiff := Arredondavalor(vlrDif,2);
    if valorDiff > DM.TB_ContasReceberVALORTOTAL.AsFloat then
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
