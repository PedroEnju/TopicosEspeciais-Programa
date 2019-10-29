unit U_ContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_FrameButton, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

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
    PopupMenu1: TPopupMenu;
    ReceberParcela1: TMenuItem;
    RecalcularParcela1: TMenuItem;
    Sair1: TMenuItem;
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
    procedure ReceberParcela1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    contParc: Integer;
    valorParcela: Real;
    respMsg, strValue: String;
    codVendaNovo: Integer;
    valorTotalParcela: Real;
    procedure GerarParcelas(Automatico: String);
    function PegarDiferenca(idContasReceber: String): Real;
  end;

var
  F_ContasReceber: TF_ContasReceber;

implementation

{$R *.dfm}

uses U_DM, U_Funcao, U_ParcelaContasReceber, U_ReceberParcela;

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

procedure TF_ContasReceber.GerarParcelas(Automatico: String);
begin // criaçao das parcelas

  while contParc <= DM.TB_ContasReceberQUANTIDADEPARCELA.AsInteger do
  begin
    With DM.TB_ParcelaContasReceber do
    begin
      Append;
      FieldByName('DataVencimento').AsDateTime := IncMonth(Date, contParc);
      FieldByName('NumeroParcela').AsInteger := contParc;
      FieldByName('ValorParcela').AsFloat := valorParcela;
      if Automatico = 'Não' then
      begin
        CriarForm(F_ParcelaContasReceber, TF_ParcelaContasReceber, '');
        AbrirDestruirForm(F_ParcelaContasReceber);
      end
      else // quando for automático
        Post;
      vlrTotalParcela := vlrTotalParcela + FieldByName('ValorParcela').AsFloat;
    end;
    if contParc <> DM.TB_ContasReceberQUANTIDADEPARCELA.AsInteger Then
      valorParcela := PegarDiferenca
        (DM.TB_ContasReceberIDCONTASRECEBER.AsString) /
        (DM.TB_ContasReceberQUANTIDADEPARCELA.AsFloat - contParc);
    valorParcela := ArredondaValor(valorParcela, 2);
    contParc := contParc + 1;
  end;
end;

function TF_ContasReceber.PegarDiferenca(idContasReceber: String): Real;
var
  Retorno: Real;
begin
  With DM.Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sum(valorParcela) from ParcelaContasReceber');
    SQL.Add('where idContasReceber = :idContasReceber');
    ParamByName('idContasReceber').AsString := idContasReceber;
    Open;
    Result := DM.TB_ContasReceberVALORTOTAL.AsFloat - DM.Query_Calcular.Fields
      [0].AsFloat;
    Close;
  end;
end;

procedure TF_ContasReceber.ReceberParcela1Click(Sender: TObject);
begin
  { if StatusCaixa=False Then
    begin
    showMessage('Caixa Fechado');
    Exit;
    end; }

  RecalcularParcelaRec;
  if DM.TB_ParcelaContasReceber.RecordCount = 0 then
    exit;
  if DM.TB_ContasReceberSTATUSCONTA.AsString = 'S' Then
  begin
    ShowMessage('Não existem parcelas a receber');
    exit;
  end;
  if DM.TB_ParcelaContasReceberSTATUSPARCELA.AsString = 'S' Then
  begin
    ShowMessage('Parcela já recebida');
    exit;
  end;
  DM.TB_ParcelaContasReceber.Edit;
  DM.TB_ParcelaContasReceberDATAVENCIMENTO.AsDateTime := Date;
  CriarForm(F_ReceberParcela, TF_ReceberParcela, '');
  AbrirDestruirForm(F_ReceberParcela);
end;

procedure TF_ContasReceber.Frame_Button1btnSalvarClick(Sender: TObject);
var
  respMsg: String;
begin

  if (DM.TB_ContasReceberVALORTOTAL.AsFloat <= 0) then
  begin
    ShowMessage('O Valor Total deve ser superior a 0');
    if (DBEdit7.Enabled) then
      DBEdit7.SetFocus;
    exit;
  end;

  if (DM.TB_ContasReceberQUANTIDADEPARCELA.AsInteger <= 0) then
  begin
    ShowMessage('Número de Parcelas deve ser superior a 0');
    DM.TB_ContasReceberQUANTIDADEPARCELA.AsInteger := 1;
    DBEdit1.SetFocus;
    exit;
  end;

  if (DM.TB_ContasReceberQUANTIDADEPARCELA.AsInteger * 0.01 >
    DM.TB_ContasReceberVALORTOTAL.AsFloat) then
  begin
    ShowMessage('Valor do Contas a Receber inválido!');
    if (DBEdit7.Enabled) then
      DBEdit7.SetFocus;
    exit;
  end;

  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_ContasReceber.Post;

  contParc := 1;
  valorTotalParcela := 0;
  valorParcela := DM.TB_ContasReceberVALORTOTAL.AsFloat /
    DM.TB_ContasReceberQUANTIDADEPARCELA.AsInteger;
  valorParcela := ArredondaValor(valorParcela, 2);

  if (MessageDLG('Deseja gerar as parcelas automaticamente?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
    respMsg := 'Sim'
  else
    respMsg := 'Não';

  GerarParcelas(respMsg);
  ShowMessage('Todas as parcelas foram geradas com sucesso!');
end;

end.
