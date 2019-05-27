unit U_Cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TF_Cidade = class(TForm)
    Frame_Button1: TFrame_Button;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    DBComboBox1: TDBComboBox;
    procedure Frame_Button1btnFecharClick(Sender: TObject);
    procedure Frame_Button1btnFirstClick(Sender: TObject);
    procedure Frame_Button1btnPreviousClick(Sender: TObject);
    procedure Frame_Button1btnNextClick(Sender: TObject);
    procedure Frame_Button1btnLastClick(Sender: TObject);
    procedure Frame_Button1btnNovoClick(Sender: TObject);
    procedure Frame_Button1btnEditarClick(Sender: TObject);
    procedure Frame_Button1btnSalvarClick(Sender: TObject);
    procedure Frame_Button1btnExcluirClick(Sender: TObject);
    procedure Frame_Button1btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cidade: TF_Cidade;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_Cidade.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_Cidade.Cancel;
end;

procedure TF_Cidade.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_Cidade.Edit;
end;

procedure TF_Cidade.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  Frame_Button1.btnExcluirClick(Sender);
  DM.TB_Cidade.Delete;
end;

procedure TF_Cidade.Frame_Button1btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Cidade.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_Cidade.First;
end;

procedure TF_Cidade.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_Cidade.Last;
end;

procedure TF_Cidade.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_Cidade.Next;
end;

procedure TF_Cidade.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_Cidade.Insert;
end;

procedure TF_Cidade.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_Cidade.Prior;
end;

procedure TF_Cidade.Frame_Button1btnSalvarClick(Sender: TObject);
begin
  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_Cidade.Post;
end;

end.
