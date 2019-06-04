unit U_Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TF_Cliente = class(TForm)
    Frame_Button1: TFrame_Button;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    btnCidade: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBGrid1: TDBGrid;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    procedure Frame_Button1btnNovoClick(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
    procedure Frame_Button1btnFecharClick(Sender: TObject);
    procedure Frame_Button1btnEditarClick(Sender: TObject);
    procedure Frame_Button1btnExcluirClick(Sender: TObject);
    procedure Frame_Button1btnSalvarClick(Sender: TObject);
    procedure Frame_Button1btnCancelarClick(Sender: TObject);
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
  F_Cliente: TF_Cliente;

implementation

{$R *.dfm}

uses U_DM, U_Cidade;

procedure TF_Cliente.btnCidadeClick(Sender: TObject);
begin
  F_Cidade.ShowModal;
end;

procedure TF_Cliente.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_Cliente.Cancel;
end;

procedure TF_Cliente.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_Cliente.Edit;
end;

procedure TF_Cliente.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  if DM.TB_Cliente.RecordCount = 0 then
    ShowMessage('Tabela vazia!')
  else if MessageDLG('Tem certeza que deseja remover: ' + #13 +
    DM.TB_ClienteNOMECLIENTE.AsString + ' ?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes then
  begin
    Frame_Button1.btnExcluirClick(Sender);
    DM.TB_Cliente.Delete;
  end;
end;

procedure TF_Cliente.Frame_Button1btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TF_Cliente.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_Cliente.First;
end;

procedure TF_Cliente.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_Cliente.Last;
end;

procedure TF_Cliente.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_Cliente.Next;
end;

procedure TF_Cliente.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_Cliente.Insert;
end;

procedure TF_Cliente.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_Cliente.Prior;
end;

procedure TF_Cliente.Frame_Button1btnSalvarClick(Sender: TObject);
begin
  if (DBEdit3.Text = '') then
  begin
    ShowMessage('Nome do Cliente não pode ser em branco!');
    DBEdit3.SetFocus;
  end
  else if (DBLookupComboBox1.Text = '') then
  begin
    ShowMessage('Cidade não pode ser em branco!');
    DBLookupComboBox1.SetFocus;
  end
  else if (DBEdit4.Text = '') then
  begin
    ShowMessage('CPF não pode ser em branco!');
    DBEdit4.SetFocus;
  end
  else if (DBComboBox1.Text = '') then
  begin
    ShowMessage('Sexo não pode ser em branco!');
    DBComboBox1.SetFocus;
  end
  else
  begin
    Frame_Button1.btnSalvarClick(Sender);
    DM.TB_Cliente.Post;
  end;
end;

end.
