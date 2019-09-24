unit U_Compra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, U_FrameButton;

type
  TF_Compra = class(TForm)
    Frame_Button1: TFrame_Button;
    pItCompra: TPanel;
    Label8: TLabel;
    btn_excluirItem: TBitBtn;
    btn_alterarItem: TBitBtn;
    btn_novoItem: TBitBtn;
    DBGrid1: TDBGrid;
    pResultado: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    btn_finalizar: TBitBtn;
    pCompra: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBText5: TDBText;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    btn_cliente: TBitBtn;
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
    procedure btnDisable;
    procedure btnEnable;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Compra: TF_Compra;

implementation

{$R *.dfm}

uses U_DM, U_ItemCompra, U_FinalizacaoCompra;

procedure TF_Compra.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_Compra.Cancel;
  btnDisable;
end;

procedure TF_Compra.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_Compra.Edit;
  btnEnable;
end;

procedure TF_Compra.Frame_Button1btnExcluirClick(Sender: TObject);
begin
  Frame_Button1.btnExcluirClick(Sender);
  btnDisable;
end;

procedure TF_Compra.Frame_Button1btnFecharClick(Sender: TObject);
begin
  btnDisable;
  close;
end;

procedure TF_Compra.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_Compra.First;
end;

procedure TF_Compra.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_Compra.Last;
end;

procedure TF_Compra.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_Compra.Next;
end;

procedure TF_Compra.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_Compra.Insert;
  btnDisable;
end;

procedure TF_Compra.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_Compra.Prior;
end;

procedure TF_Compra.Frame_Button1btnSalvarClick(Sender: TObject);
begin
  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_Compra.Post;
  btnEnable;
end;

procedure TF_Compra.btnDisable;
begin
  btn_finalizar.Enabled := false;
  btn_novoItem.Enabled := false;
  btn_alterarItem.Enabled := false;
  btn_excluirItem.Enabled := false;
end;

procedure TF_Compra.btnEnable;
begin
  btn_finalizar.Enabled := true;
  btn_novoItem.Enabled := true;
  btn_alterarItem.Enabled := true;
  btn_excluirItem.Enabled := true;
end;

procedure TF_Compra.btn_alterarItemClick(Sender: TObject);
begin
  if (DM.TB_ItemCompra.RecordCount < 0) then
    Exit;
  DM.TB_ItemCompra.Edit;
  F_ItemCompra.ShowModal;
end;

procedure TF_Compra.btn_excluirItemClick(Sender: TObject);
begin
  if (DM.TB_CompraSTATUSCOMPRA.AsString = 'C') then
  begin
    ShowMessage('Compra já está confirmada, não pode ser excluída!');
    Abort;
  end
  else if (DM.TB_Compra.RecordCount = 0) then
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
    DM.TB_ItemCompra.Delete;
    DM.TB_Compra.Refresh;
  end;
end;

procedure TF_Compra.btn_finalizarClick(Sender: TObject);
begin
  if (DM.TB_CompraSTATUSCOMPRA.AsString = 'C') then
  begin
    ShowMessage('Compra já confirmada!');
    Abort;
  end
  else if (DM.TB_ItemCompra.RecordCount = 0) then
  begin
    MessageDlg('Adicione produtos antes de finalizar a compra!', mtInformation,
      [mbOK], 0);
    Abort;
  end;

  DM.TB_Compra.Edit;
  F_FinalizacaoCompra.ShowModal;
end;

procedure TF_Compra.btn_novoItemClick(Sender: TObject);
begin
  DM.TB_ItemCompra.Append;
  F_ItemCompra.ShowModal;
end;

end.
