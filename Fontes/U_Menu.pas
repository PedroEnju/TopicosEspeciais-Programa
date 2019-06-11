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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Menu: TF_Menu;

implementation

{$R *.dfm}

uses U_Cidade, U_Cliente, U_Fornecedor, U_Funcionario, U_Produto;

procedure TF_Menu.Cidade1Click(Sender: TObject);
begin
  F_Cidade.ShowModal;
end;

procedure TF_Menu.Cliente1Click(Sender: TObject);
begin
  F_Cliente.ShowModal;
end;

procedure TF_Menu.Fornecedor1Click(Sender: TObject);
begin
  F_Fornecedor.ShowModal;
end;

procedure TF_Menu.Funcionrio1Click(Sender: TObject);
begin
  F_Funcionario.ShowModal;
end;

procedure TF_Menu.Produto1Click(Sender: TObject);
begin
  F_Produto.ShowModal;
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

end.
