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
    procedure Frame_Button1btn_pesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Funcionario: TF_Funcionario;

implementation

{$R *.dfm}

uses U_DM, U_Cidade, U_PesquisaFuncionario;

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

  if (DBLookupComboBox1.Text = EmptyStr) then
  begin
    ShowMessage('Cidade é um campo obrigatório! Por favor verifique!');
    DBLookupComboBox1.SetFocus;
  end
  else if (DBEdit3.Text = EmptyStr) then
  begin
    ShowMessage
      ('Nome do Funcionário é um campo obrigatório! Por favor verifique!');
    DBEdit3.SetFocus;
  end
  else if (DBEdit4.Text = EmptyStr) then
  begin
    ShowMessage('Salário é um campo obrigatório! Por favor verifique!');
    DBEdit4.SetFocus;
  end
  else if (DBEdit5.Text = EmptyStr) then
  begin
    ShowMessage
      ('Data de Admissão é um campo obrigatório! Por favor verifique!');
    DBEdit5.SetFocus;
  end
  else
  begin
    Frame_Button1.btnSalvarClick(Sender);
    DM.TB_Funcionario.Post;
  end;

end;

procedure TF_Funcionario.Frame_Button1btn_pesquisarClick(Sender: TObject);
begin
  F_PesquisaFuncionario.ShowModal;
end;

end.
