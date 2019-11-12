unit U_ReceberParcela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TF_ReceberParcela = class(TForm)
    btn_salvar: TBitBtn;
    Panel4: TPanel;
    btn_cancelar: TBitBtn;
    DBGrid1: TDBGrid;
    btn_novoItem: TBitBtn;
    btn_salvarItem: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure btn_novoItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarGrid;
  end;

var
  F_ReceberParcela: TF_ReceberParcela;

implementation

{$R *.dfm}

uses U_DM, U_Funcao, U_ValorParcelaReceber;

procedure TF_ReceberParcela.AtualizarGrid;
begin
  With DM.TB_Recebimento do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM recebimento');
    // SQL.Add('Where Status = :Status');
    // ParamByName('Status').AsString := 'Não';
    Open;
  end;
  DM.TB_ContasReceber.Refresh;
end;

procedure TF_ReceberParcela.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TF_ReceberParcela.btn_novoItemClick(Sender: TObject);
begin
  CriarForm(F_ValorParcelaReceber, TF_ValorParcelaReceber, '');
  AbrirDestruirForm(F_ValorParcelaReceber);
  AtualizarGrid;
end;

procedure TF_ReceberParcela.btn_salvarClick(Sender: TObject);
var
  Historico: String;
begin
  if DM.TB_Recebimento.RecordCount = 0 Then
  begin
    ShowMessage('É necessário ao menos um documento para continuar');
    btn_salvar.SetFocus;
    Exit;
  end;
  With DM.TB_ParcelaContasReceber do
  begin
    Edit;
    FieldByName('DataRecebimento').AsDateTime := Date;
    if ArredondaValor(DM.TB_ParcelaContasRecebervalorDiferenca.AsFloat,
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

  With DM.TB_Recebimento do
  begin
    First;
    While not EOF do
    begin
      Edit;
      FieldByName('StatusRecebimento').AsString := 's';
      Post;
      if DM.TB_ParcelaContasRecebervalorDiferenca.AsFloat = 0 Then
        Historico := 'Recebimento total da parcela ao cliente: ' +
          DM.TB_ContasRecebernomecliente.AsString
      else
        Historico := 'Recebimento parcial da parcela ao cliente: ' +
          DM.TB_ContasRecebernomecliente.AsString;
      InserirMovimentoCaixa(Historico, DM.TB_RecebimentoIDRECEBIMENTO.AsInteger,
        0, DM.TB_RecebimentoVALORRECEBIDO.AsFloat, 0,
        FieldByName('NomeTipoDocumento').AsString);
      Next;
    end;
  end;
  With DM.Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ParcelaContasReceber');
    SQL.Add('WHERE idContasReceber = :idContasReceber');
    SQL.Add('AND StatusParcela <> :StatusParcela');
    ParamByName('idContasReceber').AsInteger :=
      DM.TB_ContasReceberIDCONTASRECEBER.AsInteger;
    ParamByName('StatusParcela').AsString := 'S';
    Open;
    if IsEmpty Then
      With DM.TB_ContasReceber do
      begin
        Edit;
        FieldByName('StatusConta').AsString := 'S';
        Post;
      end;

  end;
  Close;
end;

procedure TF_ReceberParcela.FormShow(Sender: TObject);
begin
  AtualizarGrid;
end;

end.
