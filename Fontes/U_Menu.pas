unit U_Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TF_Menu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cidade1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedor1: TMenuItem;
    Funcionrio1: TMenuItem;
    Produto1: TMenuItem;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ImageList1: TImageList;
    Image1: TImage;
    Consultas1: TMenuItem;
    Cidade2: TMenuItem;
    Cliente2: TMenuItem;
    Fornecedor2: TMenuItem;
    Funcionrio2: TMenuItem;
    Produto2: TMenuItem;
    Venda1: TMenuItem;
    Compra1: TMenuItem;
    Movimento1: TMenuItem;
    Compra2: TMenuItem;
    Venda2: TMenuItem;
    Financeiro1: TMenuItem;
    ContasaReceber1: TMenuItem;
    ContasaPagar1: TMenuItem;
    procedure Cidade1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Funcionrio1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure Cidade2Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure Fornecedor2Click(Sender: TObject);
    procedure Funcionrio2Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Menu: TF_Menu;

implementation

{$R *.dfm}

uses U_Cidade, U_Cliente, U_Fornecedor, U_Funcionario, U_Produto,
  U_PesquisaCidade, U_PesquisaCliente, U_PesquisaFornecedor,
  U_PesquisaFuncionario, U_PesquisaProduto, U_Venda, U_Compra, U_ContasReceber;

procedure TF_Menu.Cidade1Click(Sender: TObject);
begin
  F_Cidade.ShowModal;
end;

procedure TF_Menu.Cidade2Click(Sender: TObject);
begin
  F_PesquisaCidade.ShowModal;
end;

procedure TF_Menu.Cliente1Click(Sender: TObject);
begin
  F_Cliente.ShowModal;
end;

procedure TF_Menu.Cliente2Click(Sender: TObject);
begin
  F_PesquisaCliente.ShowModal;
end;

procedure TF_Menu.Compra1Click(Sender: TObject);
begin
  F_Compra.ShowModal;
end;

procedure TF_Menu.ContasaPagar1Click(Sender: TObject);
begin
  F_ContasPagar.ShowModal;
end;

procedure TF_Menu.ContasaReceber1Click(Sender: TObject);
begin
  F_ContasReceber.ShowModal;
end;

procedure TF_Menu.Fornecedor1Click(Sender: TObject);
begin
  F_Fornecedor.ShowModal;
end;

procedure TF_Menu.Fornecedor2Click(Sender: TObject);
begin
  F_PesquisarFornecedor.ShowModal;
end;

procedure TF_Menu.Funcionrio1Click(Sender: TObject);
begin
  F_Funcionario.ShowModal;
end;

procedure TF_Menu.Funcionrio2Click(Sender: TObject);
begin
  F_PesquisaFuncionario.ShowModal;
end;

procedure TF_Menu.Produto1Click(Sender: TObject);
begin
  F_Produto.ShowModal;
end;

procedure TF_Menu.Produto2Click(Sender: TObject);
begin
  F_PesquisaProduto.ShowModal;
end;

procedure TF_Menu.ToolButton1Click(Sender: TObject);
begin
  F_Cidade.ShowModal;
end;

procedure TF_Menu.ToolButton3Click(Sender: TObject);
begin
  F_Cliente.ShowModal;
end;

procedure TF_Menu.ToolButton5Click(Sender: TObject);
begin
  F_Fornecedor.ShowModal;
end;

procedure TF_Menu.ToolButton7Click(Sender: TObject);
begin
  F_Funcionario.ShowModal;
end;

procedure TF_Menu.ToolButton9Click(Sender: TObject);
begin
  F_Produto.ShowModal;
end;

procedure TF_Menu.Venda1Click(Sender: TObject);
begin
  F_Venda.ShowModal;
end;

end.
