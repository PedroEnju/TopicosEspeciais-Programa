unit U_DM;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, IBX.IBQuery;

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
    IBQuery6: TIBQuery;
    TB_Compra: TIBQuery;
    IBQuery8: TIBQuery;
    IBQuery9: TIBQuery;
    IBQuery10: TIBQuery;
    IBQuery11: TIBQuery;
    IBQuery12: TIBQuery;
    IBQuery13: TIBQuery;
    IBQuery14: TIBQuery;
    IBQuery15: TIBQuery;
    SQL_Fornecedor: TIBUpdateSQL;
    SQL_Funcionario: TIBUpdateSQL;
    SQL_Produto: TIBUpdateSQL;
    SQL_Venda: TIBUpdateSQL;
    SQL_ItemVenda: TIBUpdateSQL;
    IBUpdateSQL6: TIBUpdateSQL;
    SQL_Compra: TIBUpdateSQL;
    IBUpdateSQL8: TIBUpdateSQL;
    IBUpdateSQL9: TIBUpdateSQL;
    IBUpdateSQL10: TIBUpdateSQL;
    IBUpdateSQL11: TIBUpdateSQL;
    IBUpdateSQL12: TIBUpdateSQL;
    IBUpdateSQL13: TIBUpdateSQL;
    IBUpdateSQL14: TIBUpdateSQL;
    IBUpdateSQL15: TIBUpdateSQL;
    Query_Pesquisa: TIBQuery;
    DS_Fornecedor: TDataSource;
    DS_Funcionario: TDataSource;
    DS_Produto: TDataSource;
    DS_Venda: TDataSource;
    DS_ItemVenda: TDataSource;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    DataSource8: TDataSource;
    DataSource9: TDataSource;
    DS_Compra: TDataSource;
    DataSource11: TDataSource;
    DataSource12: TDataSource;
    DataSource13: TDataSource;
    DataSource14: TDataSource;
    DataSource15: TDataSource;
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
    procedure TB_FornecedorNewRecord(DataSet: TDataSet);
    procedure TB_ClienteNewRecord(DataSet: TDataSet);
    procedure TB_ProdutoNewRecord(DataSet: TDataSet);
    procedure TB_CidadeNewRecord(DataSet: TDataSet);
    procedure TB_FuncionarioNewRecord(DataSet: TDataSet);
    procedure TB_VendaNewRecord(DataSet: TDataSet);
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

procedure TDM.TB_FornecedorNewRecord(DataSet: TDataSet);
begin
  TB_FornecedorSTATUSFORNECEDOR.AsString := 'A';
end;

procedure TDM.TB_FuncionarioNewRecord(DataSet: TDataSet);
begin
  TB_FornecedorSTATUSFORNECEDOR.AsString := 'A';
end;

procedure TDM.TB_ProdutoNewRecord(DataSet: TDataSet);
begin
  TB_ProdutoSTATUSPRODUTO.AsString := 'A';
end;

procedure TDM.TB_VendaNewRecord(DataSet: TDataSet);
begin
  TB_VendaDATAVENDA.AsDateTime := Date;
  TB_VendaHORAVENDA.AsDateTime := Time;
  TB_VendaTIPO.AsString := 'À VISTA';
  TB_VendaSTATUSVENDA.AsString := 'A';
end;

end.
