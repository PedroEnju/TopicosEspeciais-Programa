unit U_PesquisaFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TF_PesquisarFornecedor = class(TForm)
    btn_pesquisa: TBitBtn;
    edt_pesquisa: TEdit;
    rg_pesquisa: TRadioGroup;
    Grid_Pesquisa: TDBGrid;
    procedure btn_pesquisaClick(Sender: TObject);
    procedure edt_pesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesquisarFornecedor: TF_PesquisarFornecedor;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_PesquisarFornecedor.btn_pesquisaClick(Sender: TObject);
begin
  with DM.Query_Pesquisa do
  begin
    Close;
    SQL.clear;
    begin
      case rg_pesquisa.ItemIndex of
        0:
          SQL.Add('select * from fornecedor');
        1:
          if (edt_pesquisa.Text = '') then
          begin
            ShowMessage('Digite um código');
            edt_pesquisa.SetFocus;
            Abort;
          end
          else
          begin
            SQL.Add('select * from fornecedor where idFornecedor = ' +
              edt_pesquisa.Text);
          end;
        2:
          SQL.Add('select * from fornecedor where nomeFornecedor like ' + #39 +
            '%' + edt_pesquisa.Text + '%' + #39);
        3:
          SQL.Add('select * from fornecedor where statusFornecedor like ' + #39
            + edt_pesquisa.Text + '%' + #39);
      end;
    end;
    Open;
  end;
  Grid_Pesquisa.SetFocus;
end;

procedure TF_PesquisarFornecedor.edt_pesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if rg_pesquisa.ItemIndex = 1 then
    if not(Key in ['0' .. '9', #8]) then
      Key := #0;

  if Key = #13 then
    btn_pesquisa.Click;
end;

end.
