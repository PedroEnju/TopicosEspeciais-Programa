unit U_DM;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, IBX.IBQuery, DateUtils;

type
  TDM = class(TDataModule)
    DB_Principal: TIBDatabase;
    DB_Transaction: TIBTransaction;
    TB_Cidade: TIBQuery;
    SQL_Cidade: TIBUpdateSQL;
    DS_Cidade: TDataSource;
    TB_CidadeIDCIDADE: TIntegerField;
    TB_CidadeNOMECIDADE: TIBStringField;
    TB_CidadeSTATUSCIDADE: TIBStringField;
    SQL_Cliente: TIBUpdateSQL;
    TB_Cliente: TIBQuery;
    DS_Cliente: TDataSource;
    TB_ClienteIDCLIENTE: TIntegerField;
    TB_ClienteIDCIDADE: TIntegerField;
    TB_ClienteNOMECLIENTE: TIBStringField;
    TB_ClienteCPF: TIBStringField;
    TB_ClienteRG: TIBStringField;
    TB_ClienteSEXO: TIBStringField;
    TB_ClienteSTATUSCLIENTE: TIBStringField;
    TB_Clientenomecidade: TStringField;
    TB_ClienteEMAIL: TIBStringField;
    TB_Fornecedor: TIBQuery;
    TB_Funcionario: TIBQuery;
    TB_Produto: TIBQuery;
    TB_Venda: TIBQuery;
    TB_ItemVenda: TIBQuery;
    TB_ContasPagar: TIBQuery;
    TB_Compra: TIBQuery;
    TB_ContasReceber: TIBQuery;
    TB_ParcelaContasReceber: TIBQuery;
    TB_Recebimento: TIBQuery;
    TB_TipoDocumento: TIBQuery;
    TB_ParcelaContasPagar: TIBQuery;
    TB_Pagamento: TIBQuery;
    TB_MovimentoCaixa: TIBQuery;
    SQL_Fornecedor: TIBUpdateSQL;
    SQL_Funcionario: TIBUpdateSQL;
    SQL_Produto: TIBUpdateSQL;
    SQL_Venda: TIBUpdateSQL;
    SQL_ItemVenda: TIBUpdateSQL;
    SQL_ContasPagar: TIBUpdateSQL;
    SQL_Compra: TIBUpdateSQL;
    SQL_ContasReceber: TIBUpdateSQL;
    SQL_ParcelaContasReceber: TIBUpdateSQL;
    SQL_Recebimento: TIBUpdateSQL;
    SQL_TipoDocumento: TIBUpdateSQL;
    SQL_ParcelaContasPagar: TIBUpdateSQL;
    SQL_Pagamento: TIBUpdateSQL;
    SQL_MovimentoCaixa: TIBUpdateSQL;
    Query_Pesquisa: TIBQuery;
    DS_Fornecedor: TDataSource;
    DS_Funcionario: TDataSource;
    DS_Produto: TDataSource;
    DS_Venda: TDataSource;
    DS_ItemVenda: TDataSource;
    DS_ContasPagar: TDataSource;
    DS_Recebimento: TDataSource;
    DS_ParcelaContasReceber: TDataSource;
    DS_ContasReceber: TDataSource;
    DS_Compra: TDataSource;
    DS_ParcelaContasPagar: TDataSource;
    DS_TipoDocumento: TDataSource;
    DS_MovimentoCaixa: TDataSource;
    DS_Pagamento: TDataSource;
    DS_Pesquisa: TDataSource;
    TB_ItemCompra: TIBQuery;
    SQL_ItemCompra: TIBUpdateSQL;
    DS_ItemCompra: TDataSource;
    TB_FornecedorIDFORNECEDOR: TIntegerField;
    TB_FornecedorIDCIDADE: TIntegerField;
    TB_FornecedorNOMEFORNECEDOR: TIBStringField;
    TB_FornecedorCNPJ: TIntegerField;
    TB_FornecedorSTATUSFORNECEDOR: TIBStringField;
    TB_FuncionarioIDFUNCIONARIO: TIntegerField;
    TB_FuncionarioIDCIDADE: TIntegerField;
    TB_FuncionarioNOMEFUNCIONARIO: TIBStringField;
    TB_FuncionarioSALARIO: TIBBCDField;
    TB_FuncionarioDATAADMISSAO: TDateField;
    TB_Fornecedornomecidade: TStringField;
    TB_Funcionarionomecidade: TStringField;
    TB_ProdutoIDPRODUTO: TIntegerField;
    TB_ProdutoNOMEPRODUTO: TIBStringField;
    TB_ProdutoQUANTIDADE: TIntegerField;
    TB_ProdutoPRECOCUSTO: TIBBCDField;
    TB_ProdutoPRECOVENDA: TIBBCDField;
    TB_ProdutoSTATUSPRODUTO: TIBStringField;
    TB_VendaIDVENDA: TIntegerField;
    TB_VendaIDFUNCIONARIO: TIntegerField;
    TB_VendaIDCLIENTE: TIntegerField;
    TB_VendaDESCRICAO: TIBStringField;
    TB_VendaDATAVENDA: TDateField;
    TB_VendaHORAVENDA: TTimeField;
    TB_VendaVALORTOTAL: TIBBCDField;
    TB_VendaTIPO: TIBStringField;
    TB_VendaSTATUSVENDA: TIBStringField;
    TB_VendatotalVenda: TFloatField;
    TB_VendaqtdProduto: TIntegerField;
    TB_CompraIDCOMPRA: TIntegerField;
    TB_CompraIDFUNCIONARIO: TIntegerField;
    TB_CompraIDFORNECEDOR: TIntegerField;
    TB_CompraDESCRICAO: TIBStringField;
    TB_CompraDATACOMPRA: TDateField;
    TB_CompraHORACOMPRA: TTimeField;
    TB_CompraTIPO: TIBStringField;
    TB_CompraSTATUSCOMPRA: TIBStringField;
    TB_ItemVendaIDITEMVENDA: TIntegerField;
    TB_ItemVendaIDVENDA: TIntegerField;
    TB_ItemVendaIDPRODUTO: TIntegerField;
    TB_ItemVendaQUANTIDADE: TIntegerField;
    TB_ItemVendaVALOR: TIBBCDField;
    TB_ItemVendaTOTAL: TIBBCDField;
    TB_ItemCompraIDITEMCOMPRA: TIntegerField;
    TB_ItemCompraIDPRODUTO: TIntegerField;
    TB_ItemCompraIDCOMPRA: TIntegerField;
    TB_ItemCompraQUANTIDADE: TIntegerField;
    TB_ItemCompraVALOR: TIBBCDField;
    TB_ItemCompraTOTAL: TIBBCDField;
    TB_CompratotalCompra: TFloatField;
    TB_CompraqtdProduto: TIntegerField;
    TB_CompraqtdItemCompra: TFloatField;
    TB_VendaqtdItemVenda: TFloatField;
    Query_Calcular: TIBQuery;
    TB_ContasReceberIDCONTASRECEBER: TIntegerField;
    TB_ContasReceberIDVENDA: TIntegerField;
    TB_ContasReceberIDCLIENTE: TIntegerField;
    TB_ContasReceberTIPO: TIBStringField;
    TB_ContasReceberQUANTIDADEPARCELA: TIntegerField;
    TB_ContasReceberDATACONTA: TDateField;
    TB_ContasReceberVALORTOTAL: TIBBCDField;
    TB_ContasReceberSTATUSCONTA: TIBStringField;
    TB_ParcelaContasReceberIDPARCELACONTASRECEBER: TIntegerField;
    TB_ParcelaContasReceberIDCONTASRECEBER: TIntegerField;
    TB_ParcelaContasReceberDATAVENCIMENTO: TDateField;
    TB_ParcelaContasReceberDATARECEBIMENTO: TDateField;
    TB_ParcelaContasReceberNUMEROPARCELA: TIntegerField;
    TB_ParcelaContasReceberVALORPARCELA: TIBBCDField;
    TB_ParcelaContasReceberJUROS: TIBBCDField;
    TB_ParcelaContasReceberDESCONTO: TIBBCDField;
    TB_ParcelaContasReceberMULTA: TIBBCDField;
    TB_ParcelaContasReceberVALORFINAL: TIBBCDField;
    TB_ParcelaContasReceberSTATUSPARCELA: TIBStringField;
    TB_RecebimentoIDRECEBIMENTO: TIntegerField;
    TB_RecebimentoIDPARCELACONTASRECEBER: TIntegerField;
    TB_RecebimentoDATARECEBIMENTO: TDateField;
    TB_RecebimentoHORARECEBIMENTO: TTimeField;
    TB_RecebimentoVALORRECEBIDO: TIBBCDField;
    TB_ContasPagarIDCONTASPAGAR: TIntegerField;
    TB_ContasPagarIDFORNECEDOR: TIntegerField;
    TB_ContasPagarIDCOMPRA: TIntegerField;
    TB_ContasPagarTIPO: TIBStringField;
    TB_ContasPagarQUANTIDADEPARCELA: TIntegerField;
    TB_ContasPagarDATACONTA: TDateField;
    TB_ContasPagarVALORTOTAL: TIBBCDField;
    TB_ContasPagarSTATUSCONTA: TIBStringField;
    TB_PagamentoIDPAGAMENTO: TIntegerField;
    TB_PagamentoIDPARCELACONTASPAGAR: TIntegerField;
    TB_PagamentoVALORPARCELA: TIBBCDField;
    TB_PagamentoVALORPAGO: TIBBCDField;
    TB_MovimentoCaixaIDMOVIMENTOCAIXA: TIntegerField;
    TB_MovimentoCaixaCAIXA_IDCAIXA: TIntegerField;
    TB_MovimentoCaixaIDRECEBIMENTO: TIntegerField;
    TB_MovimentoCaixaIDPAGAMENTO: TIntegerField;
    TB_MovimentoCaixaVALOR: TIBBCDField;
    TB_ParcelaContasRecebervalorReceber: TFloatField;
    TB_ParcelaContasRecebervalorDiferenca: TFloatField;
    TB_ParcelaContasReceberdiasVencidos: TIntegerField;
    TB_ParcelaContasRecebervalorRecebido: TFloatField;
    TB_ContasRecebernomeCliente: TStringField;
    TB_RecebimentoIDTIPODOCUMENTO: TIntegerField;
    TB_RecebimentonomeTipoDocumento: TStringField;
    TB_RecebimentoSTATUSRECEBIMENTO: TIBStringField;
    procedure TB_FornecedorNewRecord(DataSet: TDataSet);
    procedure TB_ClienteNewRecord(DataSet: TDataSet);
    procedure TB_ProdutoNewRecord(DataSet: TDataSet);
    procedure TB_CidadeNewRecord(DataSet: TDataSet);
    procedure TB_FuncionarioNewRecord(DataSet: TDataSet);
    procedure TB_VendaNewRecord(DataSet: TDataSet);
    procedure TB_ItemVendaNewRecord(DataSet: TDataSet);
    procedure TB_ItemCompraNewRecord(DataSet: TDataSet);
    procedure TB_VendaAfterScroll(DataSet: TDataSet);
    procedure TB_VendaCalcFields(DataSet: TDataSet);
    procedure TB_CompraAfterScroll(DataSet: TDataSet);
    procedure TB_CompraCalcFields(DataSet: TDataSet);
    procedure TB_CompraNewRecord(DataSet: TDataSet);
    procedure TB_ContasReceberAfterScroll(DataSet: TDataSet);
    procedure TB_ContasReceberNewRecord(DataSet: TDataSet);
    procedure TB_ParcelaContasReceberNewRecord(DataSet: TDataSet);
    procedure TB_RecebimentoNewRecord(DataSet: TDataSet);
    procedure TB_ParcelaContasReceberCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDM.TB_CidadeNewRecord(DataSet: TDataSet);
begin
  TB_CidadeSTATUSCIDADE.AsString := 'A';
end;

procedure TDM.TB_ClienteNewRecord(DataSet: TDataSet);
begin
  TB_ClienteSTATUSCLIENTE.AsString := 'A';
  TB_ClienteSEXO.AsString := 'M';
end;

procedure TDM.TB_CompraAfterScroll(DataSet: TDataSet);
begin
  with TB_ItemCompra do
  begin
    if (TB_CompraIDCOMPRA.AsString.IsEmpty) then
      exit;

    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM itemcompra');
    SQL.Add('WHERE idCompra = :idCompra');
    ParamByName('idCompra').AsInteger := TB_CompraIDCOMPRA.AsInteger;
    Open;

  end;
end;

procedure TDM.TB_CompraCalcFields(DataSet: TDataSet);
begin
  if (TB_CompraIDCOMPRA.AsString = EmptyStr) then
    exit;

  with Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(quantidade * valor), SUM(quantidade), COUNT(quantidade) FROM ItemCompra');
    SQL.Add('WHERE idCompra = :idCompra');
    ParamByName('idCompra').AsInteger := TB_CompraIDCOMPRA.AsInteger;
    Open;
    TB_CompratotalCompra.AsFloat := Fields[0].AsFloat;
    TB_CompraqtdProduto.AsFloat := Fields[1].AsFloat;
    TB_CompraqtdItemCompra.AsFloat := Fields[2].AsFloat;
    Close;
  end;
end;

procedure TDM.TB_CompraNewRecord(DataSet: TDataSet);
begin
  TB_CompraDATACOMPRA.AsDateTime := Date;
  TB_CompraHORACOMPRA.AsDateTime := Time;
  TB_CompraTIPO.AsString := 'À VISTA';
  TB_CompraSTATUSCOMPRA.AsString := 'A';
end;

procedure TDM.TB_ContasReceberAfterScroll(DataSet: TDataSet);
begin
  With TB_ParcelaContasReceber do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ParcelaContasReceber');
    SQL.Add('WHERE idContasReceber = :idContasReceber');
    SQL.Add('ORDER BY idParcelaContasReceber');
    ParamByName('idContasReceber').AsInteger :=
      TB_ContasReceberIDCONTASRECEBER.AsInteger;
    Open;
  end;
end;

procedure TDM.TB_ContasReceberNewRecord(DataSet: TDataSet);
begin
  With DataSet do
  begin
    FieldByName('QUANTIDADEPARCELA').AsInteger := 1;
    FieldByName('DATACONTA').AsDateTime := Date;
    FieldByName('TIPO').AsString := 'M';
    FieldByName('STATUSCONTA').AsString := 'N';
    FieldByName('VALORTOTAL').AsFloat := 0;
  end;
end;

procedure TDM.TB_FornecedorNewRecord(DataSet: TDataSet);
begin
  TB_FornecedorSTATUSFORNECEDOR.AsString := 'A';
end;

procedure TDM.TB_FuncionarioNewRecord(DataSet: TDataSet);
begin
  TB_FornecedorSTATUSFORNECEDOR.AsString := 'A';
end;

procedure TDM.TB_ItemCompraNewRecord(DataSet: TDataSet);
begin
  TB_ItemCompraIDCOMPRA.AsInteger := TB_CompraIDCOMPRA.AsInteger;
end;

procedure TDM.TB_ItemVendaNewRecord(DataSet: TDataSet);
begin
  TB_ItemVendaIDVENDA.AsInteger := TB_VendaIDVENDA.AsInteger;
  TB_ItemVendaQUANTIDADE.AsInteger := 1;
end;

procedure TDM.TB_ParcelaContasReceberCalcFields(DataSet: TDataSet);
begin
  With Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(ValorRecebido) FROM recebimento');
    SQL.Add('WHERE idParcelaContasReceber = :idParcelaContasReceber');
    ParamByName('idParcelaContasReceber').AsInteger :=
      TB_ParcelaContasReceberIDPARCELACONTASRECEBER.AsInteger;
    Open;
    TB_ParcelaContasRecebervalorRecebido.AsFloat :=

      Fields[0].AsFloat;
    Close;
  end;

  TB_ParcelaContasRecebervalorReceber.AsFloat :=
    TB_ParcelaContasReceberVALORPARCELA.AsFloat +
    TB_ParcelaContasReceberMULTA.AsFloat + TB_ParcelaContasReceberJUROS.AsFloat;

  TB_ParcelaContasRecebervalorDiferenca.AsFloat :=
    TB_ParcelaContasRecebervalorReceber.AsFloat -
    TB_ParcelaContasRecebervalorRecebido.AsFloat;

  if TB_ParcelaContasReceberDATAVENCIMENTO.AsDateTime < Date Then
    TB_ParcelaContasReceberdiasVencidos.AsInteger :=
      DaysBetween(Date, TB_ParcelaContasReceberDATAVENCIMENTO.AsDateTime)
  else
    TB_ParcelaContasReceberdiasVencidos.AsInteger := 0;
end;

procedure TDM.TB_ParcelaContasReceberNewRecord(DataSet: TDataSet);
begin
  TB_ParcelaContasReceberIDCONTASRECEBER.AsInteger :=
    TB_ContasReceberIDCONTASRECEBER.AsInteger;
  TB_ParcelaContasReceberVALORPARCELA.AsFloat := 0;
  TB_ParcelaContasRecebervalorRecebido.AsFloat := 0;
  TB_ParcelaContasReceberSTATUSPARCELA.AsString := 'N';
end;

procedure TDM.TB_ProdutoNewRecord(DataSet: TDataSet);
begin
  TB_ProdutoSTATUSPRODUTO.AsString := 'A';
end;

procedure TDM.TB_RecebimentoNewRecord(DataSet: TDataSet);
begin
  TB_RecebimentoIDPARCELACONTASRECEBER.AsInteger :=
    TB_ParcelaContasReceberIDPARCELACONTASRECEBER.AsInteger;
  TB_RecebimentoDATARECEBIMENTO.AsDateTime := Date;
  TB_RecebimentoSTATUSRECEBIMENTO.AsString := 'N';
end;

procedure TDM.TB_VendaAfterScroll(DataSet: TDataSet);
begin
  with TB_ItemVenda do
  begin
    if (TB_VendaIDVENDA.AsString.IsEmpty) then
      exit;

    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM itemvenda');
    SQL.Add('WHERE idVenda = :idVenda');
    ParamByName('idVenda').AsInteger := TB_VendaIDVENDA.AsInteger;
    Open;

  end;
end;

procedure TDM.TB_VendaCalcFields(DataSet: TDataSet);
begin
  if (TB_VendaIDVENDA.AsString = EmptyStr) then
    exit;

  with Query_Calcular do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(quantidade * valor), SUM(quantidade), COUNT(quantidade) FROM ItemVenda');
    SQL.Add('WHERE idVenda = :idVenda');
    ParamByName('idVenda').AsInteger := TB_VendaIDVENDA.AsInteger;
    Open;
    TB_VendatotalVenda.AsFloat := Fields[0].AsFloat;
    TB_VendaqtdProduto.AsFloat := Fields[1].AsFloat;
    TB_VendaqtdItemVenda.AsFloat := Fields[2].AsFloat;
    Close;
  end;

end;

procedure TDM.TB_VendaNewRecord(DataSet: TDataSet);
begin
  TB_VendaDATAVENDA.AsDateTime := Date;
  TB_VendaHORAVENDA.AsDateTime := Time;
  TB_VendaTIPO.AsString := 'À VISTA';
  TB_VendaSTATUSVENDA.AsString := 'A';
end;

end.
