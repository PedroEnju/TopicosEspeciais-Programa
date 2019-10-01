unit U_ContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TF_ContasReceber = class(TForm)
    Frame_Button1: TFrame_Button;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBText1: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    DBText2: TDBText;
    DBText3: TDBText;
    DBEdit1: TDBEdit;
    procedure Frame_Button1btnFecharClick(Sender: TObject);
    procedure Frame_Button1btnFirstClick(Sender: TObject);
    procedure Frame_Button1btnPreviousClick(Sender: TObject);
    procedure Frame_Button1btnNextClick(Sender: TObject);
    procedure Frame_Button1btnLastClick(Sender: TObject);
    procedure Frame_Button1btnNovoClick(Sender: TObject);
    procedure Frame_Button1btnEditarClick(Sender: TObject);
    procedure Frame_Button1btnSalvarClick(Sender: TObject);
    procedure Frame_Button1btnCancelarClick(Sender: TObject);
    procedure Frame_Button1btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ContasReceber: TF_ContasReceber;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_ContasReceber.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_ContasReceber.Cancel;
end;

procedure TF_ContasReceber.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_ContasReceber.Edit;
end;

procedure TF_ContasReceber.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  Frame_Button1.btnExcluirClick(Sender);
end;

procedure TF_ContasReceber.Frame_Button1btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TF_ContasReceber.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_ContasReceber.First;
end;

procedure TF_ContasReceber.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_ContasReceber.Last;
end;

procedure TF_ContasReceber.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_ContasReceber.Next;
end;

procedure TF_ContasReceber.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_ContasReceber.Insert;
end;

procedure TF_ContasReceber.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_ContasReceber.Prior;
end;

procedure TF_ContasReceber.Frame_Button1btnSalvarClick(Sender: TObject);
begin
  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_ContasReceber.Post;
end;

end.
