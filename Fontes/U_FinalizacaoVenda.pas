unit U_FinalizacaoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
  TF_FinalizacaoVenda = class(TForm)
    btn_cancelar: TBitBtn;
    btn_salvar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    edt_recebido: TEdit;
    DBComboBox1: TDBComboBox;
    lb_troco: TLabel;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure edt_recebidoExit(Sender: TObject);
    procedure edt_recebidoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_FinalizacaoVenda: TF_FinalizacaoVenda;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_FinalizacaoVenda.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TF_FinalizacaoVenda.btn_salvarClick(Sender: TObject);
begin
  if ((edt_recebido.Text = '') or (StrToFloat(edt_recebido.Text) = 0)) then
  begin
    ShowMessage('Informe o valor Recebido!');
    edt_recebido.SetFocus;
    Abort;
  end
  else if (DM.TB_VendaSTATUSVENDA.AsString = 'N') then
  begin
    With DM.TB_ItemVenda do
    begin
      First;
      while not Eof do
      begin
        DM.TB_Produto.Locate('IDPRODUTO',
          DM.TB_ItemVendaIDPRODUTO.AsInteger, []);
        if (DM.TB_ProdutoQUANTIDADE.AsFloat - DM.TB_ItemVendaQUANTIDADE.AsFloat
          <= 0) then
        begin
          MessageDLG('Não há estoque suficiente para o produto' + #13 +
            DM.TB_ProdutoNOMEPRODUTO.AsString, mtInformation, [mbOK], 0);
          Abort;
        end;
        Next;
      end;
    end;
  end;

  With DM.TB_ItemVenda do
  begin
    First;
    while not Eof do
    begin
      DM.TB_Produto.Locate('IDPRODUTO', DM.TB_ItemVendaIDPRODUTO.AsInteger, []);
      DM.TB_Produto.Edit;
      DM.TB_ProdutoQUANTIDADE.AsFloat := DM.TB_ProdutoQUANTIDADE.AsFloat -
        FieldByName('QUANTIDADE').AsFloat;

      DM.TB_Produto.Post;

      Next;
    end;
  end;

  DM.TB_Produto.Refresh;
  DM.TB_Venda.Edit;
  DM.TB_VendaSTATUSVENDA.AsString := 'C';
  DM.TB_Venda.Post;
  Close;
end;

procedure TF_FinalizacaoVenda.edt_recebidoExit(Sender: TObject);
begin
  if StrToFloat(edt_recebido.Text) >= StrToFloat(DBText1.Caption) then
  begin
    lb_troco.Caption := FloatToStr(StrToFloat(edt_recebido.Text) -
      (StrToFloat(DBText1.Caption)));
  end
  else
    ShowMessage
      ('O valor recebido não pode ser menor que o valor total da venda.');
end;

procedure TF_FinalizacaoVenda.edt_recebidoKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TF_FinalizacaoVenda.FormShow(Sender: TObject);
begin
  edt_recebido.Text := '';
  lb_troco.Caption := '0';
end;

end.
