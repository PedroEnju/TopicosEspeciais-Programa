unit U_ContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, U_FrameButton, Vcl.Menus;

type
  TF_ContasPagar = class(TForm)
    Frame_Button1: TFrame_Button;
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
    DBGrid1: TDBGrid;
    DB: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    DBText2: TDBText;
    PopupMenu1: TPopupMenu;
    ReceberParcela1: TMenuItem;
    RecalcularParcela1: TMenuItem;
    Sair1: TMenuItem;
    procedure ReceberParcela1Click(Sender: TObject);
    procedure Frame_Button1btnFecharClick(Sender: TObject);
    procedure Frame_Button1btnNovoClick(Sender: TObject);
    procedure Frame_Button1btnEditarClick(Sender: TObject);
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
    contParc: Integer;
    valorParcela: Real;
    respMsg, strValue: String;
    codVendaNovo: Integer;
    valorTotalParcela: Real;
    procedure GerarParcelas(Automatico: String);
    function PegarDiferenca(idContasPagar: String): Real;
  end;

var
  F_ContasPagar: TF_ContasPagar;

implementation

{$R *.dfm}

uses U_DM, U_Funcao, U_PagarParcela, U_ParcelaContasPagar;

procedure TF_ContasPagar.Frame_Button1btnCancelarClick(Sender: TObject);
begin
  Frame_Button1.btnCancelarClick(Sender);
  DM.TB_ContasPagar.Cancel;
end;

procedure TF_ContasPagar.Frame_Button1btnEditarClick(Sender: TObject);
begin
  Frame_Button1.btnEditarClick(Sender);
  DM.TB_ContasPagar.Edit;
end;

procedure TF_ContasPagar.Frame_Button1btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TF_ContasPagar.Frame_Button1btnFirstClick(Sender: TObject);
begin
  DM.TB_ContasPagar.First;
end;

procedure TF_ContasPagar.Frame_Button1btnLastClick(Sender: TObject);
begin
  DM.TB_ContasPagar.Last;
end;

procedure TF_ContasPagar.Frame_Button1btnNextClick(Sender: TObject);
begin
  DM.TB_ContasPagar.Next;
end;

procedure TF_ContasPagar.Frame_Button1btnNovoClick(Sender: TObject);
begin
  Frame_Button1.btnNovoClick(Sender);
  DM.TB_ContasPagar.Insert;
end;

procedure TF_ContasPagar.Frame_Button1btnPreviousClick(Sender: TObject);
begin
  DM.TB_ContasPagar.Prior;
end;

procedure TF_ContasPagar.GerarParcelas(Automatico: String);
begin // criaçao das parcelas

  while contParc <= DM.TB_ContasPagarQUANTIDADEPARCELA.AsInteger do
  begin
    With DM.TB_ParcelaContasPagar do
    begin
      Append;
      FieldByName('DataVencimento').AsDateTime := IncMonth(Date, contParc);
      FieldByName('NumeroParcela').AsInteger := contParc;
      FieldByName('ValorParcela').AsFloat := valorParcela;
      if Automatico = 'Não' then
      begin
        CriarForm(F_ParcelaContasPagar, TF_ParcelaContasPagar, '');
        AbrirDestruirForm(F_ParcelaContasPagar);
      end
      else // quando for automático
        Post;
      vlrTotalParcela := vlrTotalParcela + FieldByName('ValorParcela').AsFloat;
    end;
    if contParc <> DM.TB_ContasPagarQUANTIDADEPARCELA.AsInteger Then
      valorParcela := PegarDiferenca(DM.TB_ContasPagarIDCONTASPAGAR.AsString) /
        (DM.TB_ContasPagarQUANTIDADEPARCELA.AsFloat - contParc);
    valorParcela := ArredondaValor(valorParcela, 2);
    contParc := contParc + 1;
  end;
end;

function TF_ContasPagar.PegarDiferenca(idContasPagar: String): Real;
var
  Retorno: Real;
begin
  With DM.Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(valorParcela) FROM ParcelaContasPagar');
    SQL.Add('WHERE idContasPagar = :idContasPagar');
    ParamByName('idContasPagar').AsString := idContasPagar;
    Open;
    Result := DM.TB_ContasPagarVALORTOTAL.AsFloat - DM.Query_Calcular.Fields
      [0].AsFloat;
    Close;
  end;
end;

procedure TF_ContasPagar.Frame_Button1btnSalvarClick(Sender: TObject);
var
  respMsg: String;
begin
  if (DM.TB_ContasPagarVALORTOTAL.AsFloat <= 0) then
  begin
    ShowMessage('O Valor Total deve ser superior a 0');
    if (DBEdit6.Enabled) then
      DBEdit6.SetFocus;
    exit;
  end;

  if (DM.TB_ContasPagarQUANTIDADEPARCELA.AsInteger <= 0) then
  begin
    ShowMessage('Número de Parcelas deve ser superior a 0');
    DM.TB_ContasPagarQUANTIDADEPARCELA.AsInteger := 1;
    DBEdit4.SetFocus;
    exit;
  end;

  if (DM.TB_ContasPagarQUANTIDADEPARCELA.AsInteger * 0.01 >
    DM.TB_ContasPagarVALORTOTAL.AsFloat) then
  begin
    ShowMessage('Valor do Contas a Pagar inválido!');
    if (DBEdit6.Enabled) then
      DBEdit6.SetFocus;
    exit;
  end;

  Frame_Button1.btnSalvarClick(Sender);
  DM.TB_ContasPagar.Post;

  contParc := 1;
  valorTotalParcela := 0;
  valorParcela := DM.TB_ContasPagarVALORTOTAL.AsFloat /
    DM.TB_ContasPagarQUANTIDADEPARCELA.AsInteger;
  valorParcela := ArredondaValor(valorParcela, 2);

  if (MessageDLG('Deseja gerar as parcelas automaticamente?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
    respMsg := 'Sim'
  else
    respMsg := 'Não';

  GerarParcelas(respMsg);
  ShowMessage('Todas as parcelas foram geradas com sucesso!');

end;

procedure TF_ContasPagar.ReceberParcela1Click(Sender: TObject);
begin
  RecalcularParcelaPag;
  if DM.TB_ParcelaContasPagar.RecordCount = 0 then
    exit;
  if DM.TB_ContasPagarSTATUSCONTA.AsString = 'S' Then
  begin
    ShowMessage('Não existem parcelas a pagar');
    exit;
  end;
  if DM.TB_ParcelaContasPagarSTATUSPARCELA.AsString = 'S' Then
  begin
    ShowMessage('Parcela já paga');
    exit;
  end;
  DM.TB_ParcelaContasPagar.Edit;
  DM.TB_ParcelaContasPagarDATAVENCIMENTO.AsDateTime := Date;
  CriarForm(F_PagarParcela, TF_PagarParcela, '');
  AbrirDestruirForm(F_PagarParcela);
end;

end.
