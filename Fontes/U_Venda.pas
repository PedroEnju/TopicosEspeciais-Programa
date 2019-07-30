unit U_Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TF_Venda = class(TForm)
    Frame_Button1: TFrame_Button;
    pVenda: TPanel;
    pItVenda: TPanel;
    pResultado: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    btExcluirItem: TBitBtn;
    btAlterarItem: TBitBtn;
    btNovoitem: TBitBtn;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    btFinalizar: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn1: TBitBtn;
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
  F_Venda: TF_Venda;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_Venda.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_Venda.Cancel;
end;

procedure TF_Venda.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_Venda.Edit;
end;

procedure TF_Venda.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  Frame_Button1.btnExcluirClick(Sender);
end;

procedure TF_Venda.Frame_Button1btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TF_Venda.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_Venda.First;
end;

procedure TF_Venda.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_Venda.Last;
end;

procedure TF_Venda.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_Venda.Next;
end;

procedure TF_Venda.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_Venda.Insert;
end;

procedure TF_Venda.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_Venda.Prior;
end;

procedure TF_Venda.Frame_Button1btnSalvarClick(Sender: TObject);
begin
  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_Venda.Post;
end;

end.
