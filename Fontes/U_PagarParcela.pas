unit U_PagarParcela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TF_PagarParcela = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btn_cancelar: TBitBtn;
    btn_salvar: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    btn_novoItem: TBitBtn;
    btn_salvarItem: TBitBtn;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBText3: TDBText;
    DBText2: TDBText;
    DBText1: TDBText;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_novoItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarGrid;
  end;

var
  F_PagarParcela: TF_PagarParcela;

implementation

{$R *.dfm}

uses U_DM, U_Funcao, U_ValorParcelaPagar;

procedure TF_PagarParcela.AtualizarGrid;
begin
  With DM.TB_Pagamento do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM pagamento');
    // SQL.Add('Where Status = :Status');
    // ParamByName('Status').AsString := 'Não';
    Open;
  end;
  DM.TB_ContasPagar.Refresh;
end;

procedure TF_PagarParcela.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TF_PagarParcela.btn_novoItemClick(Sender: TObject);
begin
  CriarForm(F_ValorParcelaPagar, TF_ValorParcelaPagar, '');
  AbrirDestruirForm(F_ValorParcelaPagar);
  AtualizarGrid;
end;

procedure TF_PagarParcela.btn_salvarClick(Sender: TObject);
var
  Historico: String;
begin
  if DM.TB_Pagamento.RecordCount = 0 Then
  begin
    ShowMessage('É necessário ao menos um documento para continuar');
    btn_salvar.SetFocus;
    Exit;
  end;
  With DM.TB_ParcelaContasPagar do
  begin
    Edit;
    FieldByName('DataPagamento').AsDateTime := Date;
    if ArredondaValor(DM.TB_ParcelaContasPagarvalorDiferenca.AsFloat,
      2) = 0 Then
      FieldByName('StatusParcela').AsString := 'S'
    else if MessageDlg('A uma diferença entre os valores, clique em sim' +
      ' para deixar a parcela como Parcial' + #13 + ' ou clique em não' +
      ' para quitar a parcela', mtConfirmation, [mbYes, mbNo], 0)
      in [mrCancel, mrNo] then
      FieldByName('StatusParcela').AsString := 'S'
    else
      FieldByName('StatusParcela').AsString := 'P';
    Post;
  end;

  With DM.TB_Pagamento do
  begin
    First;
    While not EOF do
    begin
      Edit;
      FieldByName('StatusPagamento').AsString := 's';
      Post;
      if DM.TB_ParcelaContasPagarvalorDiferenca.AsFloat = 0 Then
        Historico := 'Pagamento total da parcela ao cliente: ' +
          DM.TB_ContasPagarnomefornecedor.AsString
      else
        Historico := 'Pagamento parcial da parcela ao cliente: ' +
          DM.TB_ContasPagarnomefornecedor.AsString;
      InserirMovimentoCaixa(Historico, DM.TB_PagamentoIDPAGAMENTO.AsInteger, 0,
        DM.TB_PagamentoVALORPAGO.AsFloat, 0, FieldByName('NomeTipoDocumento')
        .AsString);
      Next;
    end;
  end;
  With DM.Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ParcelaContasPagar');
    SQL.Add('WHERE idContasPagar = :idContasPagar');
    SQL.Add('AND StatusParcela <> :StatusParcela');
    ParamByName('idContasPagar').AsInteger :=
      DM.TB_ContasPagarIDCONTASPAGAR.AsInteger;
    ParamByName('StatusParcela').AsString := 'S';
    Open;
    if IsEmpty Then
      With DM.TB_ContasPagar do
      begin
        Edit;
        FieldByName('StatusConta').AsString := 'S';
        Post;
      end;

  end;
  Close;
end;

procedure TF_PagarParcela.FormShow(Sender: TObject);
begin
  AtualizarGrid;
end;

end.
