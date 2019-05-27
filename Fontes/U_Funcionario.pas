unit U_Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TF_Funcionario = class(TForm)
    Frame_Button1: TFrame_Button;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBText1: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    btnCidade: TBitBtn;
    procedure Frame_Button1btnNovoClick(Sender: TObject);
    procedure Frame_Button1btnEditarClick(Sender: TObject);
    procedure Frame_Button1btnSalvarClick(Sender: TObject);
    procedure Frame_Button1btnExcluirClick(Sender: TObject);
    procedure Frame_Button1btnCancelarClick(Sender: TObject);
    procedure Frame_Button1btnFecharClick(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
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
  F_Funcionario: TF_Funcionario;

implementation

{$R *.dfm}

uses U_DM, U_Cidade;

procedure TF_Funcionario.btnCidadeClick(Sender: TObject);
begin
  F_Cidade.ShowModal;
end;

procedure TF_Funcionario.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_Funcionario.Cancel;
end;

procedure TF_Funcionario.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_Funcionario.Edit;
end;

procedure TF_Funcionario.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  Frame_Button1.btnExcluirClick(Sender);
  DM.TB_Funcionario.Delete;
end;

procedure TF_Funcionario.Frame_Button1btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TF_Funcionario.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_Funcionario.First;
end;

procedure TF_Funcionario.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_Funcionario.Last;
end;

procedure TF_Funcionario.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_Funcionario.Next;
end;

procedure TF_Funcionario.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_Funcionario.Insert;
end;

procedure TF_Funcionario.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_Funcionario.Prior;
end;

procedure TF_Funcionario.Frame_Button1btnSalvarClick(Sender: TObject);
begin
  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_Funcionario.Post;
end;

end.
