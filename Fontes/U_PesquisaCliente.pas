unit U_PesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TF_PesquisaCliente = class(TForm)
    edt_pesquisa: TEdit;
    btn_pesquisa: TBitBtn;
    Grid_Pesquisa: TDBGrid;
    rg_pesquisa: TRadioGroup;
    procedure edt_pesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure btn_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesquisaCliente: TF_PesquisaCliente;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_PesquisaCliente.btn_pesquisaClick(Sender: TObject);
begin
  with DM.Query_Pesquisa do
  begin
    Close;
    SQL.clear;
    begin
      case rg_pesquisa.ItemIndex of
        0:
          SQL.Add('select * from cliente');
        1:
          if (edt_pesquisa.Text = '') then
          begin
            ShowMessage('Digite um código');
            edt_pesquisa.SetFocus;
            Abort;
          end
          else
          begin
            SQL.Add('select * from cliente where idCliente = ' +
              edt_pesquisa.Text);
          end;
        2:
          SQL.Add('select * from cliente where nomeCliente like ' + #39 +
            edt_pesquisa.Text + '%' + #39);
        3:
        SQL.Add('select cli.nomeCliente, c.nomeCidade, cli.cpf, cli.sexo, cli.email from cidade c inner join cliente cli on c.idCidade = cli.idCidade and c.nomeCidade like ' + #39 + '%' +
            edt_pesquisa.Text + '%' + #39);
        4:
          SQL.Add('select * from cliente where statusCliente like ' + #39 +
            edt_pesquisa.Text + '%' + #39);
      end;
    end;
    Open;
  end;
  Grid_Pesquisa.SetFocus;
end;

procedure TF_PesquisaCliente.edt_pesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if rg_pesquisa.ItemIndex = 1 then
    if not(Key in ['0' .. '9', #8]) then
      Key := #0;

  if Key = #13 then
    btn_pesquisa.Click;
end;

end.
