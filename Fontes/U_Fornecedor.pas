unit U_Fornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TF_Fornecedor = class(TForm)
    Frame_Button1: TFrame_Button;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBComboBox1: TDBComboBox;
    DBText1: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    btnCidade: TBitBtn;
    procedure Frame_Button1btnNovoClick(Sender: TObject);
    procedure Frame_Button1btnCancelarClick(Sender: TObject);
    procedure Frame_Button1btnFecharClick(Sender: TObject);
    procedure Frame_Button1btnEditarClick(Sender: TObject);
    procedure Frame_Button1btnSalvarClick(Sender: TObject);
    procedure Frame_Button1btnExcluirClick(Sender: TObject);
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
  F_Fornecedor: TF_Fornecedor;

implementation

{$R *.dfm}

uses U_DM, U_Cidade;

procedure TF_Fornecedor.btnCidadeClick(Sender: TObject);
begin
  F_Cidade.ShowModal;
end;

procedure TF_Fornecedor.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_Fornecedor.Cancel;
end;

procedure TF_Fornecedor.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_Fornecedor.Edit;
end;

procedure TF_Fornecedor.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  Frame_Button1.btnExcluirClick(Sender);
  DM.TB_Fornecedor.Delete;
end;

procedure TF_Fornecedor.Frame_Button1btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TF_Fornecedor.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_Fornecedor.First;
end;

procedure TF_Fornecedor.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_Fornecedor.Last;
end;

procedure TF_Fornecedor.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_Fornecedor.Next;
end;

procedure TF_Fornecedor.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_Fornecedor.Insert;
end;

procedure TF_Fornecedor.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_Fornecedor.Prior;
end;

procedure TF_Fornecedor.Frame_Button1btnSalvarClick(Sender: TObject);
begin
  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_Fornecedor.Post;
end;

end.
