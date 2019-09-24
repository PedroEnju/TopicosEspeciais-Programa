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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    btn_excluirItem: TBitBtn;
    btn_alterarItem: TBitBtn;
    btn_novoItem: TBitBtn;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    btn_finalizar: TBitBtn;
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
    btn_cliente: TBitBtn;
    DBText5: TDBText;
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
    procedure btn_novoItemClick(Sender: TObject);
    procedure btn_finalizarClick(Sender: TObject);
    procedure btn_alterarItemClick(Sender: TObject);
    procedure btn_excluirItemClick(Sender: TObject);
  private
    procedure btnEnable;
    procedure btnDisable;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Venda: TF_Venda;

implementation

{$R *.dfm}

uses U_DM, U_ItemVenda, U_FinalizacaoVenda;

procedure TF_Venda.btn_alterarItemClick(Sender: TObject);
begin
  if (DM.TB_ItemVenda.RecordCount < 0) then
    Exit;
  DM.TB_ItemVenda.Edit;
  F_ItemVenda.ShowModal;
end;

procedure TF_Venda.btn_excluirItemClick(Sender: TObject);
begin
  if (DM.TB_VendaSTATUSVENDA.AsString = 'C') then
  begin
    ShowMessage('Venda já está confirmada, não pode ser excluída!');
    Abort;
  end
  else if (DM.TB_Venda.RecordCount = 0) then
  begin
    Exit;
  end
  else if (MessageDlg('Deseja excluir este registro?', mtConfirmation,
    [mbYes, mbNo], 0) in [mrNone, mrCancel]) then
  begin
    Exit;
  end
  else
  begin
    DM.TB_ItemVenda.Delete;
    DM.TB_Venda.Refresh;
  end;
end;

procedure TF_Venda.btn_finalizarClick(Sender: TObject);
begin
  if (DM.TB_VendaSTATUSVENDA.AsString = 'C') then
  begin
    ShowMessage('Venda já confirmada!');
    Abort;
  end
  else if (DM.TB_ItemVenda.RecordCount = 0) then
  begin
    MessageDlg('Adicione produtos antes de finalizar a venda!', mtInformation,
      [mbOK], 0);
    Abort;
  end;

  DM.TB_Venda.Edit;
  F_FinalizacaoVenda.ShowModal;
end;

procedure TF_Venda.btnEnable;
begin
  btn_finalizar.Enabled := true;
  btn_novoItem.Enabled := true;
  btn_alterarItem.Enabled := true;
  btn_excluirItem.Enabled := true;
end;

procedure TF_Venda.btnDisable;
begin
  btn_finalizar.Enabled := false;
  btn_novoItem.Enabled := false;
  btn_alterarItem.Enabled := false;
  btn_excluirItem.Enabled := false;
end;

procedure TF_Venda.btn_novoItemClick(Sender: TObject);
begin
  DM.TB_ItemVenda.Append;
  F_ItemVenda.ShowModal;
end;

procedure TF_Venda.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_Venda.Cancel;
  btnDisable;
end;

procedure TF_Venda.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_Venda.Edit;
  btnEnable;
end;

procedure TF_Venda.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  Frame_Button1.btnExcluirClick(Sender);
  btnDisable;
end;

procedure TF_Venda.Frame_Button1btnFecharClick(Sender: TObject);
begin
  btnDisable;
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
  btnDisable;
end;

procedure TF_Venda.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_Venda.Prior;
end;

procedure TF_Venda.Frame_Button1btnSalvarClick(Sender: TObject);
begin
  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_Venda.Post;
  btnEnable;
end;

end.
