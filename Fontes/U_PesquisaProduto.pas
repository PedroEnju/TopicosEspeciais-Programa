unit U_PesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TF_PesquisaProduto = class(TForm)
    rg_pesquisa: TRadioGroup;
    edt_pesquisa: TEdit;
    btn_pesquisa: TBitBtn;
    Grid_Pesquisa: TDBGrid;
    procedure btn_pesquisaClick(Sender: TObject);
    procedure edt_pesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesquisaProduto: TF_PesquisaProduto;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_PesquisaProduto.btn_pesquisaClick(Sender: TObject);
begin
  with DM.Query_Pesquisa do
  begin
    Close;
    SQL.clear;
    begin
      case rg_pesquisa.ItemIndex of
        0:
          SQL.Add('select * from produto');
        1:
          if (edt_pesquisa.Text = '') then
          begin
            ShowMessage('Digite um c�digo');
            edt_pesquisa.SetFocus;
            Abort;
          end
          else
          begin
            SQL.Add('select * from produto where idProduto = ' +
              edt_pesquisa.Text);
          end;
        2:
          SQL.Add('select * from produto where nomeProduto like ' + #39 + '%' +
            edt_pesquisa.Text + '%' + #39);
        3:
          SQL.Add('select * from produto where statusProduto like ' + #39 +
            edt_pesquisa.Text + '%' + #39);
      end;
    end;
    Open;
  end;
  Grid_Pesquisa.SetFocus;
end;

procedure TF_PesquisaProduto.edt_pesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if rg_pesquisa.ItemIndex = 1 then
    if not(Key in ['0' .. '9', #8]) then
      Key := #0;

  if Key = #13 then
    btn_pesquisa.Click;

end;

end.
