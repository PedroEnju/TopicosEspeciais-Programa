unit U_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Data.DB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TF_Produto = class(TForm)
    Frame_Button1: TFrame_Button;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    DBComboBox1: TDBComboBox;
    procedure Frame_Button1btnNovoClick(Sender: TObject);
    procedure Frame_Button1btnEditarClick(Sender: TObject);
    procedure Frame_Button1btnSalvarClick(Sender: TObject);
    procedure Frame_Button1btnExcluirClick(Sender: TObject);
    procedure Frame_Button1btnCancelarClick(Sender: TObject);
    procedure Frame_Button1btnFecharClick(Sender: TObject);
    procedure Frame_Button1btnFirstClick(Sender: TObject);
    procedure Frame_Button1btnPreviousClick(Sender: TObject);
    procedure Frame_Button1btnNextClick(Sender: TObject);
    procedure Frame_Button1btnLastClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Produto: TF_Produto;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_Produto.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_Produto.Cancel;
end;

procedure TF_Produto.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_Produto.Edit;
end;

procedure TF_Produto.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  Frame_Button1.btnExcluirClick(Sender);
  DM.TB_Produto.Delete;
end;

procedure TF_Produto.Frame_Button1btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TF_Produto.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_Produto.First;
end;

procedure TF_Produto.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_Produto.Last;
end;

procedure TF_Produto.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_Produto.Next;
end;

procedure TF_Produto.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_Produto.Insert;
end;

procedure TF_Produto.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_Produto.Prior;
end;

procedure TF_Produto.Frame_Button1btnSalvarClick(Sender: TObject);
begin
  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_Produto.Post;
end;

end.
