unit U_FinalizacaoCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
  TF_FinalizacaoCompra = class(TForm)
    btn_cancelar: TBitBtn;
    btn_salvar: TBitBtn;
    DBComboBox1: TDBComboBox;
    DBText1: TDBText;
    edt_pago: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lb_troco: TLabel;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure edt_pagoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_pagoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_FinalizacaoCompra: TF_FinalizacaoCompra;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_FinalizacaoCompra.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TF_FinalizacaoCompra.btn_salvarClick(Sender: TObject);
begin
  if ((edt_pago.Text = '') or (StrToFloat(edt_pago.Text) = 0)) then
  begin
    ShowMessage('Informe o valor Recebido!');
    edt_pago.SetFocus;
    Abort;
  end
  else if (DM.TB_CompraSTATUSCOMPRA.AsString = 'N') then
  begin
    With DM.TB_ItemCompra do
    begin
      First;
      while not Eof do
      begin
        DM.TB_Produto.Locate('IDPRODUTO',
          DM.TB_ItemCompraIDPRODUTO.AsInteger, []);
        if (DM.TB_ItemCompraQUANTIDADE.AsFloat <= 0) then
        begin
          MessageDLG('Produto com quantidade incorreta!' + #13 +
            DM.TB_ProdutoNOMEPRODUTO.AsString, mtInformation, [mbOK], 0);
          Abort;
        end
        else if (StrToFloat(edt_pago.Text) < DM.TB_ProdutoPRECOCUSTO.AsFloat)
        then
        begin
          ShowMessage('Valor Pago está incorreto!');
          edt_pago.SetFocus;
          Abort;
        end;
        Next;
      end;
    end;
  end;

  With DM.TB_ItemCompra do
  begin
    First;
    while not Eof do
    begin
      DM.TB_Produto.Locate('IDPRODUTO',
        DM.TB_ItemCompraIDPRODUTO.AsInteger, []);
      DM.TB_Produto.Edit;
      DM.TB_ProdutoQUANTIDADE.AsFloat := DM.TB_ProdutoQUANTIDADE.AsFloat +
        FieldByName('QUANTIDADE').AsFloat;
      DM.TB_Produto.Post;

      Next;
    end;
  end;

  DM.TB_Produto.Refresh;
  DM.TB_Compra.Edit;
  DM.TB_CompraSTATUSCOMPRA.AsString := 'C';
  DM.TB_Compra.Post;
  Close;
end;

procedure TF_FinalizacaoCompra.edt_pagoExit(Sender: TObject);
begin
  if StrToFloat(edt_pago.Text) >= StrToFloat(DBText1.Caption) then
  begin
    lb_troco.Caption := FloatToStr(StrToFloat(edt_pago.Text) -
      (StrToFloat(DBText1.Caption)));
  end
  else
    ShowMessage
      ('O valor recebido não pode ser menor que o valor total da compra.');
end;

procedure TF_FinalizacaoCompra.edt_pagoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #13, #8, #44, #46, #45]) then
    Key := #0;
  if Key = #46 then
    Key := #44;
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TF_FinalizacaoCompra.FormShow(Sender: TObject);
begin
  edt_pago.Text := '';
  lb_troco.Caption := '0';
end;

end.
