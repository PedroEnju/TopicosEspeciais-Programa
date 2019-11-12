object DM: TDM
  OldCreateOrder = False
  Height = 570
  Width = 908
  object DB_Principal: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Documentos\Topicos Especiais\Aula-1103\BD\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ASCII')
    LoginPrompt = False
    DefaultTransaction = DB_Transaction
    ServerType = 'IBServer'
    Left = 32
    Top = 24
  end
  object DB_Transaction: TIBTransaction
    Active = True
    DefaultDatabase = DB_Principal
    Left = 704
    Top = 8
  end
  object TB_Cidade: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    OnNewRecord = TB_CidadeNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CIDADE'
      'order by NOMECIDADE')
    UpdateObject = SQL_Cidade
    GeneratorField.Field = 'IDCIDADE'
    GeneratorField.Generator = 'GEN_CIDADE_ID'
    Left = 24
    Top = 208
    object TB_CidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = '"CIDADE"."IDCIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_CidadeNOMECIDADE: TIBStringField
      FieldName = 'NOMECIDADE'
      Origin = '"CIDADE"."NOMECIDADE"'
      Size = 45
    end
    object TB_CidadeSTATUSCIDADE: TIBStringField
      FieldName = 'STATUSCIDADE'
      Origin = '"CIDADE"."STATUSCIDADE"'
      FixedChar = True
      Size = 1
    end
  end
  object SQL_Cidade: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDCIDADE,'
      '  NOMECIDADE,'
      '  STATUSCIDADE'
      'from CIDADE '
      'where'
      '  IDCIDADE = :IDCIDADE')
    ModifySQL.Strings = (
      'update CIDADE'
      'set'
      '  IDCIDADE = :IDCIDADE,'
      '  NOMECIDADE = :NOMECIDADE,'
      '  STATUSCIDADE = :STATUSCIDADE'
      'where'
      '  IDCIDADE = :OLD_IDCIDADE')
    InsertSQL.Strings = (
      'insert into CIDADE'
      '  (IDCIDADE, NOMECIDADE, STATUSCIDADE)'
      'values'
      '  (:IDCIDADE, :NOMECIDADE, :STATUSCIDADE)')
    DeleteSQL.Strings = (
      'delete from CIDADE'
      'where'
      '  IDCIDADE = :OLD_IDCIDADE')
    Left = 24
    Top = 264
  end
  object DS_Cidade: TDataSource
    DataSet = TB_Cidade
    Left = 24
    Top = 320
  end
  object SQL_Cliente: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDCLIENTE,'
      '  IDCIDADE,'
      '  NOMECLIENTE,'
      '  CPF,'
      '  RG,'
      '  SEXO,'
      '  EMAIL,'
      '  STATUSCLIENTE'
      'from CLIENTE '
      'where'
      '  IDCLIENTE = :IDCLIENTE')
    ModifySQL.Strings = (
      'update CLIENTE'
      'set'
      '  IDCLIENTE = :IDCLIENTE,'
      '  IDCIDADE = :IDCIDADE,'
      '  NOMECLIENTE = :NOMECLIENTE,'
      '  CPF = :CPF,'
      '  RG = :RG,'
      '  SEXO = :SEXO,'
      '  EMAIL = :EMAIL,'
      '  STATUSCLIENTE = :STATUSCLIENTE'
      'where'
      '  IDCLIENTE = :OLD_IDCLIENTE')
    InsertSQL.Strings = (
      'insert into CLIENTE'
      
        '  (IDCLIENTE, IDCIDADE, NOMECLIENTE, CPF, RG, SEXO, EMAIL, STATU' +
        'SCLIENTE)'
      'values'
      
        '  (:IDCLIENTE, :IDCIDADE, :NOMECLIENTE, :CPF, :RG, :SEXO, :EMAIL' +
        ', :STATUSCLIENTE)')
    DeleteSQL.Strings = (
      'delete from CLIENTE'
      'where'
      '  IDCLIENTE = :OLD_IDCLIENTE')
    Left = 144
    Top = 264
  end
  object TB_Cliente: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    OnNewRecord = TB_ClienteNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CLIENTE')
    UpdateObject = SQL_Cliente
    GeneratorField.Field = 'IDCLIENTE'
    GeneratorField.Generator = 'GEN_CLIENTE_ID'
    Left = 144
    Top = 208
    object TB_ClienteIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Origin = '"CLIENTE"."IDCLIENTE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_ClienteIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = '"CLIENTE"."IDCIDADE"'
    end
    object TB_ClienteNOMECLIENTE: TIBStringField
      FieldName = 'NOMECLIENTE'
      Origin = '"CLIENTE"."NOMECLIENTE"'
      Required = True
      Size = 45
    end
    object TB_ClienteCPF: TIBStringField
      FieldName = 'CPF'
      Origin = '"CLIENTE"."CPF"'
      Required = True
      EditMask = '000\.000\.000\-00;1;_'
      Size = 14
    end
    object TB_ClienteRG: TIBStringField
      FieldName = 'RG'
      Origin = '"CLIENTE"."RG"'
    end
    object TB_ClienteSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = '"CLIENTE"."SEXO"'
      FixedChar = True
      Size = 1
    end
    object TB_ClienteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"CLIENTE"."EMAIL"'
      Size = 45
    end
    object TB_ClienteSTATUSCLIENTE: TIBStringField
      FieldName = 'STATUSCLIENTE'
      Origin = '"CLIENTE"."STATUSCLIENTE"'
      FixedChar = True
      Size = 1
    end
    object TB_Clientenomecidade: TStringField
      FieldKind = fkLookup
      FieldName = 'nomecidade'
      LookupDataSet = TB_Cidade
      LookupKeyFields = 'IDCIDADE'
      LookupResultField = 'NOMECIDADE'
      KeyFields = 'IDCIDADE'
      Size = 45
      Lookup = True
    end
  end
  object DS_Cliente: TDataSource
    DataSet = TB_Cliente
    Left = 144
    Top = 320
  end
  object TB_Fornecedor: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    OnNewRecord = TB_FornecedorNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from FORNECEDOR')
    UpdateObject = SQL_Fornecedor
    GeneratorField.Field = 'IDFORNECEDOR'
    GeneratorField.Generator = 'GEN_FORNECEDOR_ID'
    Left = 232
    Top = 208
    object TB_FornecedorIDFORNECEDOR: TIntegerField
      FieldName = 'IDFORNECEDOR'
      Origin = '"FORNECEDOR"."IDFORNECEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_FornecedorIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = '"FORNECEDOR"."IDCIDADE"'
      Required = True
    end
    object TB_FornecedorNOMEFORNECEDOR: TIBStringField
      FieldName = 'NOMEFORNECEDOR'
      Origin = '"FORNECEDOR"."NOMEFORNECEDOR"'
      Required = True
      Size = 45
    end
    object TB_FornecedorCNPJ: TIntegerField
      FieldName = 'CNPJ'
      Origin = '"FORNECEDOR"."CNPJ"'
    end
    object TB_FornecedorSTATUSFORNECEDOR: TIBStringField
      FieldName = 'STATUSFORNECEDOR'
      Origin = '"FORNECEDOR"."STATUSFORNECEDOR"'
      FixedChar = True
      Size = 1
    end
    object TB_Fornecedornomecidade: TStringField
      FieldKind = fkLookup
      FieldName = 'nomecidade'
      LookupDataSet = TB_Cidade
      LookupKeyFields = 'IDCIDADE'
      LookupResultField = 'NOMECIDADE'
      KeyFields = 'IDCIDADE'
      Size = 45
      Lookup = True
    end
  end
  object TB_Funcionario: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    OnNewRecord = TB_FuncionarioNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from FUNCIONARIO')
    UpdateObject = SQL_Funcionario
    GeneratorField.Field = 'IDFUNCIONARIO'
    GeneratorField.Generator = 'GEN_FUNCIONARIO_ID'
    Left = 320
    Top = 208
    object TB_FuncionarioIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Origin = '"FUNCIONARIO"."IDFUNCIONARIO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_FuncionarioIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = '"FUNCIONARIO"."IDCIDADE"'
      Required = True
    end
    object TB_FuncionarioNOMEFUNCIONARIO: TIBStringField
      FieldName = 'NOMEFUNCIONARIO'
      Origin = '"FUNCIONARIO"."NOMEFUNCIONARIO"'
      Required = True
      Size = 45
    end
    object TB_FuncionarioSALARIO: TIBBCDField
      FieldName = 'SALARIO'
      Origin = '"FUNCIONARIO"."SALARIO"'
      currency = True
      Precision = 9
      Size = 2
    end
    object TB_FuncionarioDATAADMISSAO: TDateField
      FieldName = 'DATAADMISSAO'
      Origin = '"FUNCIONARIO"."DATAADMISSAO"'
      EditMask = '!99/99/00;1;_'
    end
    object TB_Funcionarionomecidade: TStringField
      FieldKind = fkLookup
      FieldName = 'nomecidade'
      LookupDataSet = TB_Cidade
      LookupKeyFields = 'IDCIDADE'
      LookupResultField = 'NOMECIDADE'
      KeyFields = 'IDCIDADE'
      Size = 45
      Lookup = True
    end
  end
  object TB_Produto: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    OnNewRecord = TB_ProdutoNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PRODUTO')
    UpdateObject = SQL_Produto
    GeneratorField.Field = 'IDPRODUTO'
    GeneratorField.Generator = 'GEN_PRODUTO_ID'
    Left = 448
    Top = 208
    object TB_ProdutoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Origin = '"PRODUTO"."IDPRODUTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_ProdutoNOMEPRODUTO: TIBStringField
      FieldName = 'NOMEPRODUTO'
      Origin = '"PRODUTO"."NOMEPRODUTO"'
      Size = 45
    end
    object TB_ProdutoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = '"PRODUTO"."QUANTIDADE"'
    end
    object TB_ProdutoPRECOCUSTO: TIBBCDField
      FieldName = 'PRECOCUSTO'
      Origin = '"PRODUTO"."PRECOCUSTO"'
      currency = True
      Precision = 9
      Size = 2
    end
    object TB_ProdutoPRECOVENDA: TIBBCDField
      FieldName = 'PRECOVENDA'
      Origin = '"PRODUTO"."PRECOVENDA"'
      currency = True
      Precision = 9
      Size = 2
    end
    object TB_ProdutoSTATUSPRODUTO: TIBStringField
      FieldName = 'STATUSPRODUTO'
      Origin = '"PRODUTO"."STATUSPRODUTO"'
      FixedChar = True
      Size = 1
    end
  end
  object TB_Venda: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    AfterScroll = TB_VendaAfterScroll
    OnCalcFields = TB_VendaCalcFields
    OnNewRecord = TB_VendaNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from VENDA')
    UpdateObject = SQL_Venda
    GeneratorField.Field = 'IDVENDA'
    GeneratorField.Generator = 'GEN_VENDA_ID'
    Left = 592
    Top = 208
    object TB_VendaIDVENDA: TIntegerField
      FieldName = 'IDVENDA'
      Origin = '"VENDA"."IDVENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_VendaIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Origin = '"VENDA"."IDFUNCIONARIO"'
      Required = True
    end
    object TB_VendaIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Origin = '"VENDA"."IDCLIENTE"'
      Required = True
    end
    object TB_VendaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"VENDA"."DESCRICAO"'
      Size = 45
    end
    object TB_VendaDATAVENDA: TDateField
      FieldName = 'DATAVENDA'
      Origin = '"VENDA"."DATAVENDA"'
    end
    object TB_VendaHORAVENDA: TTimeField
      FieldName = 'HORAVENDA'
      Origin = '"VENDA"."HORAVENDA"'
    end
    object TB_VendaVALORTOTAL: TIBBCDField
      FieldName = 'VALORTOTAL'
      Origin = '"VENDA"."VALORTOTAL"'
      Precision = 9
      Size = 2
    end
    object TB_VendaTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"VENDA"."TIPO"'
    end
    object TB_VendaSTATUSVENDA: TIBStringField
      FieldName = 'STATUSVENDA'
      Origin = '"VENDA"."STATUSVENDA"'
      FixedChar = True
      Size = 1
    end
    object TB_VendatotalVenda: TFloatField
      FieldKind = fkCalculated
      FieldName = 'totalVenda'
      Calculated = True
    end
    object TB_VendaqtdProduto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'qtdProduto'
      Calculated = True
    end
    object TB_VendaqtdItemVenda: TFloatField
      FieldKind = fkCalculated
      FieldName = 'qtdItemVenda'
      Calculated = True
    end
  end
  object TB_ItemVenda: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    OnNewRecord = TB_ItemVendaNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMVENDA')
    UpdateObject = SQL_ItemVenda
    GeneratorField.Field = 'IDITEMVENDA'
    GeneratorField.Generator = 'GEN_ITEMVENDA_ID'
    Left = 672
    Top = 208
    object TB_ItemVendaIDITEMVENDA: TIntegerField
      FieldName = 'IDITEMVENDA'
      Origin = '"ITEMVENDA"."IDITEMVENDA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_ItemVendaIDVENDA: TIntegerField
      FieldName = 'IDVENDA'
      Origin = '"ITEMVENDA"."IDVENDA"'
      Required = True
    end
    object TB_ItemVendaIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Origin = '"ITEMVENDA"."IDPRODUTO"'
      Required = True
    end
    object TB_ItemVendaQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = '"ITEMVENDA"."QUANTIDADE"'
    end
    object TB_ItemVendaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"ITEMVENDA"."VALOR"'
      Precision = 9
      Size = 2
    end
    object TB_ItemVendaTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Origin = '"ITEMVENDA"."TOTAL"'
      Precision = 9
      Size = 2
    end
  end
  object TB_ContasPagar: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CONTASPAGAR')
    UpdateObject = SQL_ContasPagar
    GeneratorField.Field = 'IDCONTASPAGAR'
    GeneratorField.Generator = 'GEN_CONTASPAGAR_ID'
    Left = 392
    Top = 392
    object TB_ContasPagarIDCONTASPAGAR: TIntegerField
      FieldName = 'IDCONTASPAGAR'
      Origin = '"CONTASPAGAR"."IDCONTASPAGAR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_ContasPagarIDFORNECEDOR: TIntegerField
      FieldName = 'IDFORNECEDOR'
      Origin = '"CONTASPAGAR"."IDFORNECEDOR"'
    end
    object TB_ContasPagarIDCOMPRA: TIntegerField
      FieldName = 'IDCOMPRA'
      Origin = '"CONTASPAGAR"."IDCOMPRA"'
    end
    object TB_ContasPagarTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"CONTASPAGAR"."TIPO"'
      FixedChar = True
      Size = 1
    end
    object TB_ContasPagarQUANTIDADEPARCELA: TIntegerField
      FieldName = 'QUANTIDADEPARCELA'
      Origin = '"CONTASPAGAR"."QUANTIDADEPARCELA"'
    end
    object TB_ContasPagarDATACONTA: TDateField
      FieldName = 'DATACONTA'
      Origin = '"CONTASPAGAR"."DATACONTA"'
    end
    object TB_ContasPagarVALORTOTAL: TIBBCDField
      FieldName = 'VALORTOTAL'
      Origin = '"CONTASPAGAR"."VALORTOTAL"'
      Precision = 9
      Size = 2
    end
    object TB_ContasPagarSTATUSCONTA: TIBStringField
      FieldName = 'STATUSCONTA'
      Origin = '"CONTASPAGAR"."STATUSCONTA"'
      FixedChar = True
      Size = 1
    end
  end
  object TB_Compra: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    AfterScroll = TB_CompraAfterScroll
    OnCalcFields = TB_CompraCalcFields
    OnNewRecord = TB_CompraNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from COMPRA')
    UpdateObject = SQL_Compra
    GeneratorField.Field = 'IDCOMPRA'
    GeneratorField.Generator = 'GEN_COMPRA_ID'
    Left = 752
    Top = 208
    object TB_CompraIDCOMPRA: TIntegerField
      FieldName = 'IDCOMPRA'
      Origin = '"COMPRA"."IDCOMPRA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_CompraIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Origin = '"COMPRA"."IDFUNCIONARIO"'
      Required = True
    end
    object TB_CompraIDFORNECEDOR: TIntegerField
      FieldName = 'IDFORNECEDOR'
      Origin = '"COMPRA"."IDFORNECEDOR"'
      Required = True
    end
    object TB_CompraDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"COMPRA"."DESCRICAO"'
      Size = 45
    end
    object TB_CompraDATACOMPRA: TDateField
      FieldName = 'DATACOMPRA'
      Origin = '"COMPRA"."DATACOMPRA"'
    end
    object TB_CompraHORACOMPRA: TTimeField
      FieldName = 'HORACOMPRA'
      Origin = '"COMPRA"."HORACOMPRA"'
    end
    object TB_CompraTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"COMPRA"."TIPO"'
    end
    object TB_CompraSTATUSCOMPRA: TIBStringField
      FieldName = 'STATUSCOMPRA'
      Origin = '"COMPRA"."STATUSCOMPRA"'
      FixedChar = True
      Size = 1
    end
    object TB_CompratotalCompra: TFloatField
      FieldKind = fkCalculated
      FieldName = 'totalCompra'
      Calculated = True
    end
    object TB_CompraqtdProduto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'qtdProduto'
      Calculated = True
    end
    object TB_CompraqtdItemCompra: TFloatField
      FieldKind = fkCalculated
      FieldName = 'qtdItemCompra'
      Calculated = True
    end
  end
  object TB_ContasReceber: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    AfterScroll = TB_ContasReceberAfterScroll
    OnNewRecord = TB_ContasReceberNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CONTASRECEBER')
    UpdateObject = SQL_ContasReceber
    GeneratorField.Field = 'IDCONTASRECEBER'
    GeneratorField.Generator = 'GEN_CONTASRECEBER_ID'
    Left = 48
    Top = 392
    object TB_ContasReceberIDCONTASRECEBER: TIntegerField
      FieldName = 'IDCONTASRECEBER'
      Origin = '"CONTASRECEBER"."IDCONTASRECEBER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_ContasReceberIDVENDA: TIntegerField
      FieldName = 'IDVENDA'
      Origin = '"CONTASRECEBER"."IDVENDA"'
    end
    object TB_ContasReceberIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Origin = '"CONTASRECEBER"."IDCLIENTE"'
    end
    object TB_ContasReceberTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"CONTASRECEBER"."TIPO"'
      FixedChar = True
      Size = 1
    end
    object TB_ContasReceberQUANTIDADEPARCELA: TIntegerField
      FieldName = 'QUANTIDADEPARCELA'
      Origin = '"CONTASRECEBER"."QUANTIDADEPARCELA"'
    end
    object TB_ContasReceberDATACONTA: TDateField
      FieldName = 'DATACONTA'
      Origin = '"CONTASRECEBER"."DATACONTA"'
    end
    object TB_ContasReceberVALORTOTAL: TIBBCDField
      FieldName = 'VALORTOTAL'
      Origin = '"CONTASRECEBER"."VALORTOTAL"'
      Precision = 9
      Size = 2
    end
    object TB_ContasReceberSTATUSCONTA: TIBStringField
      FieldName = 'STATUSCONTA'
      Origin = '"CONTASRECEBER"."STATUSCONTA"'
      FixedChar = True
      Size = 1
    end
    object TB_ContasRecebernomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeCliente'
      LookupDataSet = TB_Cliente
      LookupKeyFields = 'IDCLIENTE'
      LookupResultField = 'NOMECLIENTE'
      KeyFields = 'IDCLIENTE'
      Lookup = True
    end
  end
  object TB_ParcelaContasReceber: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    OnCalcFields = TB_ParcelaContasReceberCalcFields
    OnNewRecord = TB_ParcelaContasReceberNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PARCELACONTASRECEBER')
    UpdateObject = SQL_ParcelaContasReceber
    GeneratorField.Field = 'IDPARCELACONTASRECEBER'
    GeneratorField.Generator = 'GEN_PARCELACONTASRECEBER_ID'
    Left = 176
    Top = 392
    object TB_ParcelaContasReceberIDPARCELACONTASRECEBER: TIntegerField
      FieldName = 'IDPARCELACONTASRECEBER'
      Origin = '"PARCELACONTASRECEBER"."IDPARCELACONTASRECEBER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_ParcelaContasReceberIDCONTASRECEBER: TIntegerField
      FieldName = 'IDCONTASRECEBER'
      Origin = '"PARCELACONTASRECEBER"."IDCONTASRECEBER"'
      Required = True
    end
    object TB_ParcelaContasReceberDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
      Origin = '"PARCELACONTASRECEBER"."DATAVENCIMENTO"'
    end
    object TB_ParcelaContasReceberDATARECEBIMENTO: TDateField
      FieldName = 'DATARECEBIMENTO'
      Origin = '"PARCELACONTASRECEBER"."DATARECEBIMENTO"'
    end
    object TB_ParcelaContasReceberNUMEROPARCELA: TIntegerField
      FieldName = 'NUMEROPARCELA'
      Origin = '"PARCELACONTASRECEBER"."NUMEROPARCELA"'
    end
    object TB_ParcelaContasReceberVALORPARCELA: TIBBCDField
      FieldName = 'VALORPARCELA'
      Origin = '"PARCELACONTASRECEBER"."VALORPARCELA"'
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasReceberJUROS: TIBBCDField
      FieldName = 'JUROS'
      Origin = '"PARCELACONTASRECEBER"."JUROS"'
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasReceberDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"PARCELACONTASRECEBER"."DESCONTO"'
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasReceberMULTA: TIBBCDField
      FieldName = 'MULTA'
      Origin = '"PARCELACONTASRECEBER"."MULTA"'
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasReceberVALORFINAL: TIBBCDField
      FieldName = 'VALORFINAL'
      Origin = '"PARCELACONTASRECEBER"."VALORFINAL"'
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasReceberSTATUSPARCELA: TIBStringField
      FieldName = 'STATUSPARCELA'
      Origin = '"PARCELACONTASRECEBER"."STATUSPARCELA"'
      FixedChar = True
      Size = 1
    end
    object TB_ParcelaContasRecebervalorReceber: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valorReceber'
      Calculated = True
    end
    object TB_ParcelaContasRecebervalorDiferenca: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valorDiferenca'
      Calculated = True
    end
    object TB_ParcelaContasReceberdiasVencidos: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'diasVencidos'
      Calculated = True
    end
    object TB_ParcelaContasRecebervalorRecebido: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valorRecebido'
      Calculated = True
    end
  end
  object TB_Recebimento: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    OnNewRecord = TB_RecebimentoNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from RECEBIMENTO')
    UpdateObject = SQL_Recebimento
    GeneratorField.Field = 'IDRECEBIMENTO'
    GeneratorField.Generator = 'GEN_RECEBIMENTO_ID'
    Left = 296
    Top = 392
    object TB_RecebimentoIDRECEBIMENTO: TIntegerField
      FieldName = 'IDRECEBIMENTO'
      Origin = '"RECEBIMENTO"."IDRECEBIMENTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_RecebimentoIDTIPODOCUMENTO: TIntegerField
      FieldName = 'IDTIPODOCUMENTO'
      Origin = '"RECEBIMENTO"."IDTIPODOCUMENTO"'
    end
    object TB_RecebimentoIDPARCELACONTASRECEBER: TIntegerField
      FieldName = 'IDPARCELACONTASRECEBER'
      Origin = '"RECEBIMENTO"."IDPARCELACONTASRECEBER"'
      Required = True
    end
    object TB_RecebimentoDATARECEBIMENTO: TDateField
      FieldName = 'DATARECEBIMENTO'
      Origin = '"RECEBIMENTO"."DATARECEBIMENTO"'
    end
    object TB_RecebimentoHORARECEBIMENTO: TTimeField
      FieldName = 'HORARECEBIMENTO'
      Origin = '"RECEBIMENTO"."HORARECEBIMENTO"'
    end
    object TB_RecebimentoVALORRECEBIDO: TIBBCDField
      FieldName = 'VALORRECEBIDO'
      Origin = '"RECEBIMENTO"."VALORRECEBIDO"'
      Precision = 9
      Size = 2
    end
    object TB_RecebimentoSTATUSRECEBIMENTO: TIBStringField
      FieldName = 'STATUSRECEBIMENTO'
      Origin = '"RECEBIMENTO"."STATUSRECEBIMENTO"'
      FixedChar = True
      Size = 1
    end
    object TB_RecebimentonomeTipoDocumento: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldKind = fkLookup
      FieldName = 'nomeTipoDocumento'
      LookupDataSet = TB_TipoDocumento
      LookupKeyFields = 'IDTIPODOCUMENTO'
      LookupResultField = 'NOMETIPODOCUMENTO'
      KeyFields = 'IDTIPODOCUMENTO'
      Lookup = True
    end
  end
  object TB_TipoDocumento: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from TIPODOCUMENTO')
    UpdateObject = SQL_TipoDocumento
    Left = 840
    Top = 392
  end
  object TB_ParcelaContasPagar: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PARCELACONTASPAGAR')
    UpdateObject = SQL_ParcelaContasPagar
    GeneratorField.Field = 'IDPARCELACONTASPAGAR'
    GeneratorField.Generator = 'GEN_PARCELACONTASRECEBER_ID'
    Left = 504
    Top = 392
    object TB_ParcelaContasPagarIDPARCELACONTASPAGAR: TIntegerField
      FieldName = 'IDPARCELACONTASPAGAR'
      Origin = '"PARCELACONTASPAGAR"."IDPARCELACONTASPAGAR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_ParcelaContasPagarIDCONTASPAGAR: TIntegerField
      FieldName = 'IDCONTASPAGAR'
      Origin = '"PARCELACONTASPAGAR"."IDCONTASPAGAR"'
      Required = True
    end
    object TB_ParcelaContasPagarDATAVENCIMENTO: TDateField
      FieldName = 'DATAVENCIMENTO'
      Origin = '"PARCELACONTASPAGAR"."DATAVENCIMENTO"'
      Required = True
    end
    object TB_ParcelaContasPagarDATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
      Origin = '"PARCELACONTASPAGAR"."DATAPAGAMENTO"'
    end
    object TB_ParcelaContasPagarNUMEROPARCELA: TIntegerField
      FieldName = 'NUMEROPARCELA'
      Origin = '"PARCELACONTASPAGAR"."NUMEROPARCELA"'
    end
    object TB_ParcelaContasPagarVALORPARCELA: TIBBCDField
      FieldName = 'VALORPARCELA'
      Origin = '"PARCELACONTASPAGAR"."VALORPARCELA"'
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasPagarJUROS: TIBBCDField
      FieldName = 'JUROS'
      Origin = '"PARCELACONTASPAGAR"."JUROS"'
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasPagarDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"PARCELACONTASPAGAR"."DESCONTO"'
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasPagarMULTA: TIBBCDField
      FieldName = 'MULTA'
      Origin = '"PARCELACONTASPAGAR"."MULTA"'
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasPagarVALORFINAL: TIBBCDField
      FieldName = 'VALORFINAL'
      Origin = '"PARCELACONTASPAGAR"."VALORFINAL"'
      Required = True
      Precision = 9
      Size = 2
    end
    object TB_ParcelaContasPagarSTATUSPARCELA: TIBStringField
      FieldName = 'STATUSPARCELA'
      Origin = '"PARCELACONTASPAGAR"."STATUSPARCELA"'
      FixedChar = True
      Size = 1
    end
    object TB_ParcelaContasPagarvalorPagar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valorPagar'
      Calculated = True
    end
    object TB_ParcelaContasPagarvalorPago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valorPago'
      Calculated = True
    end
    object TB_ParcelaContasPagarvalorDiferenca: TFloatField
      FieldKind = fkCalculated
      FieldName = 'valorDiferenca'
      Calculated = True
    end
  end
  object TB_Pagamento: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PAGAMENTO')
    UpdateObject = SQL_Pagamento
    GeneratorField.Field = 'IDPAGAMENTO'
    GeneratorField.Generator = 'GEN_PAGAMENTO_ID'
    Left = 608
    Top = 392
    object TB_PagamentoIDPAGAMENTO: TIntegerField
      FieldName = 'IDPAGAMENTO'
      Origin = '"PAGAMENTO"."IDPAGAMENTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_PagamentoIDPARCELACONTASPAGAR: TIntegerField
      FieldName = 'IDPARCELACONTASPAGAR'
      Origin = '"PAGAMENTO"."IDPARCELACONTASPAGAR"'
      Required = True
    end
    object TB_PagamentoIDTIPODOCUMENTO: TIntegerField
      FieldName = 'IDTIPODOCUMENTO'
      Origin = '"PAGAMENTO"."IDTIPODOCUMENTO"'
    end
    object TB_PagamentoDATAPAGAMENTO: TDateField
      FieldName = 'DATAPAGAMENTO'
      Origin = '"PAGAMENTO"."DATAPAGAMENTO"'
    end
    object TB_PagamentoHORAPAGAMENTO: TTimeField
      FieldName = 'HORAPAGAMENTO'
      Origin = '"PAGAMENTO"."HORAPAGAMENTO"'
    end
    object TB_PagamentoVALORPAGO: TIBBCDField
      FieldName = 'VALORPAGO'
      Origin = '"PAGAMENTO"."VALORPAGO"'
      Precision = 9
      Size = 2
    end
    object TB_PagamentoSTATUSPAGAMENTO: TIBStringField
      FieldName = 'STATUSPAGAMENTO'
      Origin = '"PAGAMENTO"."STATUSPAGAMENTO"'
      FixedChar = True
      Size = 1
    end
    object TB_PagamentonomeTipoDocumento: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeTipoDocumento'
      LookupDataSet = TB_TipoDocumento
      LookupKeyFields = 'IDTIPODOCUMENTO'
      LookupResultField = 'NOMETIPODOCUMENTO'
      KeyFields = 'IDTIPODOCUMENTO'
      Lookup = True
    end
  end
  object TB_MovimentoCaixa: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from MOVIMENTOCAIXA')
    UpdateObject = SQL_MovimentoCaixa
    GeneratorField.Field = 'IDMOVIMENTOCAIXA'
    GeneratorField.Generator = 'GEN_MOVIMENTOCAIXA_ID'
    Left = 704
    Top = 392
    object TB_MovimentoCaixaIDMOVIMENTOCAIXA: TIntegerField
      FieldName = 'IDMOVIMENTOCAIXA'
      Origin = '"MOVIMENTOCAIXA"."IDMOVIMENTOCAIXA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_MovimentoCaixaCAIXA_IDCAIXA: TIntegerField
      FieldName = 'CAIXA_IDCAIXA'
      Origin = '"MOVIMENTOCAIXA"."CAIXA_IDCAIXA"'
      Required = True
    end
    object TB_MovimentoCaixaIDRECEBIMENTO: TIntegerField
      FieldName = 'IDRECEBIMENTO'
      Origin = '"MOVIMENTOCAIXA"."IDRECEBIMENTO"'
    end
    object TB_MovimentoCaixaIDPAGAMENTO: TIntegerField
      FieldName = 'IDPAGAMENTO'
      Origin = '"MOVIMENTOCAIXA"."IDPAGAMENTO"'
    end
    object TB_MovimentoCaixaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"MOVIMENTOCAIXA"."VALOR"'
      Precision = 9
      Size = 2
    end
  end
  object SQL_Fornecedor: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDFORNECEDOR,'
      '  IDCIDADE,'
      '  NOMEFORNECEDOR,'
      '  CNPJ,'
      '  STATUSFORNECEDOR'
      'from FORNECEDOR '
      'where'
      '  IDFORNECEDOR = :IDFORNECEDOR')
    ModifySQL.Strings = (
      'update FORNECEDOR'
      'set'
      '  IDFORNECEDOR = :IDFORNECEDOR,'
      '  IDCIDADE = :IDCIDADE,'
      '  NOMEFORNECEDOR = :NOMEFORNECEDOR,'
      '  CNPJ = :CNPJ,'
      '  STATUSFORNECEDOR = :STATUSFORNECEDOR'
      'where'
      '  IDFORNECEDOR = :OLD_IDFORNECEDOR')
    InsertSQL.Strings = (
      'insert into FORNECEDOR'
      
        '  (IDFORNECEDOR, IDCIDADE, NOMEFORNECEDOR, CNPJ, STATUSFORNECEDO' +
        'R)'
      'values'
      
        '  (:IDFORNECEDOR, :IDCIDADE, :NOMEFORNECEDOR, :CNPJ, :STATUSFORN' +
        'ECEDOR)')
    DeleteSQL.Strings = (
      'delete from FORNECEDOR'
      'where'
      '  IDFORNECEDOR = :OLD_IDFORNECEDOR')
    Left = 232
    Top = 264
  end
  object SQL_Funcionario: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDFUNCIONARIO,'
      '  IDCIDADE,'
      '  NOMEFUNCIONARIO,'
      '  SALARIO,'
      '  DATAADMISSAO'
      'from FUNCIONARIO '
      'where'
      '  IDFUNCIONARIO = :IDFUNCIONARIO')
    ModifySQL.Strings = (
      'update FUNCIONARIO'
      'set'
      '  IDFUNCIONARIO = :IDFUNCIONARIO,'
      '  IDCIDADE = :IDCIDADE,'
      '  NOMEFUNCIONARIO = :NOMEFUNCIONARIO,'
      '  SALARIO = :SALARIO,'
      '  DATAADMISSAO = :DATAADMISSAO'
      'where'
      '  IDFUNCIONARIO = :OLD_IDFUNCIONARIO')
    InsertSQL.Strings = (
      'insert into FUNCIONARIO'
      
        '  (IDFUNCIONARIO, IDCIDADE, NOMEFUNCIONARIO, SALARIO, DATAADMISS' +
        'AO)'
      'values'
      
        '  (:IDFUNCIONARIO, :IDCIDADE, :NOMEFUNCIONARIO, :SALARIO, :DATAA' +
        'DMISSAO)')
    DeleteSQL.Strings = (
      'delete from FUNCIONARIO'
      'where'
      '  IDFUNCIONARIO = :OLD_IDFUNCIONARIO')
    Left = 320
    Top = 264
  end
  object SQL_Produto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDPRODUTO,'
      '  NOMEPRODUTO,'
      '  QUANTIDADE,'
      '  PRECOCUSTO,'
      '  PRECOVENDA,'
      '  STATUSPRODUTO'
      'from PRODUTO '
      'where'
      '  IDPRODUTO = :IDPRODUTO')
    ModifySQL.Strings = (
      'update PRODUTO'
      'set'
      '  IDPRODUTO = :IDPRODUTO,'
      '  NOMEPRODUTO = :NOMEPRODUTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  PRECOCUSTO = :PRECOCUSTO,'
      '  PRECOVENDA = :PRECOVENDA,'
      '  STATUSPRODUTO = :STATUSPRODUTO'
      'where'
      '  IDPRODUTO = :OLD_IDPRODUTO')
    InsertSQL.Strings = (
      'insert into PRODUTO'
      
        '  (IDPRODUTO, NOMEPRODUTO, QUANTIDADE, PRECOCUSTO, PRECOVENDA, S' +
        'TATUSPRODUTO)'
      'values'
      
        '  (:IDPRODUTO, :NOMEPRODUTO, :QUANTIDADE, :PRECOCUSTO, :PRECOVEN' +
        'DA, :STATUSPRODUTO)')
    DeleteSQL.Strings = (
      'delete from PRODUTO'
      'where'
      '  IDPRODUTO = :OLD_IDPRODUTO')
    Left = 448
    Top = 264
  end
  object SQL_Venda: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDVENDA,'
      '  IDFUNCIONARIO,'
      '  IDCLIENTE,'
      '  DESCRICAO,'
      '  DATAVENDA,'
      '  HORAVENDA,'
      '  VALORTOTAL,'
      '  TIPO,'
      '  STATUSVENDA'
      'from VENDA '
      'where'
      '  IDVENDA = :IDVENDA')
    ModifySQL.Strings = (
      'update VENDA'
      'set'
      '  IDVENDA = :IDVENDA,'
      '  IDFUNCIONARIO = :IDFUNCIONARIO,'
      '  IDCLIENTE = :IDCLIENTE,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATAVENDA = :DATAVENDA,'
      '  HORAVENDA = :HORAVENDA,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  TIPO = :TIPO,'
      '  STATUSVENDA = :STATUSVENDA'
      'where'
      '  IDVENDA = :OLD_IDVENDA')
    InsertSQL.Strings = (
      'insert into VENDA'
      
        '  (IDVENDA, IDFUNCIONARIO, IDCLIENTE, DESCRICAO, DATAVENDA, HORA' +
        'VENDA, '
      '   VALORTOTAL, TIPO, STATUSVENDA)'
      'values'
      
        '  (:IDVENDA, :IDFUNCIONARIO, :IDCLIENTE, :DESCRICAO, :DATAVENDA,' +
        ' :HORAVENDA, '
      '   :VALORTOTAL, :TIPO, :STATUSVENDA)')
    DeleteSQL.Strings = (
      'delete from VENDA'
      'where'
      '  IDVENDA = :OLD_IDVENDA')
    Left = 592
    Top = 264
  end
  object SQL_ItemVenda: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDITEMVENDA,'
      '  IDVENDA,'
      '  IDPRODUTO,'
      '  QUANTIDADE,'
      '  VALOR,'
      '  TOTAL'
      'from ITEMVENDA '
      'where'
      '  IDITEMVENDA = :IDITEMVENDA')
    ModifySQL.Strings = (
      'update ITEMVENDA'
      'set'
      '  IDITEMVENDA = :IDITEMVENDA,'
      '  IDVENDA = :IDVENDA,'
      '  IDPRODUTO = :IDPRODUTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VALOR = :VALOR,'
      '  TOTAL = :TOTAL'
      'where'
      '  IDITEMVENDA = :OLD_IDITEMVENDA')
    InsertSQL.Strings = (
      'insert into ITEMVENDA'
      '  (IDITEMVENDA, IDVENDA, IDPRODUTO, QUANTIDADE, VALOR, TOTAL)'
      'values'
      
        '  (:IDITEMVENDA, :IDVENDA, :IDPRODUTO, :QUANTIDADE, :VALOR, :TOT' +
        'AL)')
    DeleteSQL.Strings = (
      'delete from ITEMVENDA'
      'where'
      '  IDITEMVENDA = :OLD_IDITEMVENDA')
    Left = 672
    Top = 264
  end
  object SQL_ContasPagar: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDCONTASPAGAR,'
      '  IDFORNECEDOR,'
      '  IDCOMPRA,'
      '  TIPO,'
      '  QUANTIDADEPARCELA,'
      '  DATACONTA,'
      '  VALORTOTAL,'
      '  STATUSCONTA'
      'from CONTASPAGAR '
      'where'
      '  IDCONTASPAGAR = :IDCONTASPAGAR')
    ModifySQL.Strings = (
      'update CONTASPAGAR'
      'set'
      '  IDCONTASPAGAR = :IDCONTASPAGAR,'
      '  IDFORNECEDOR = :IDFORNECEDOR,'
      '  IDCOMPRA = :IDCOMPRA,'
      '  TIPO = :TIPO,'
      '  QUANTIDADEPARCELA = :QUANTIDADEPARCELA,'
      '  DATACONTA = :DATACONTA,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  STATUSCONTA = :STATUSCONTA'
      'where'
      '  IDCONTASPAGAR = :OLD_IDCONTASPAGAR')
    InsertSQL.Strings = (
      'insert into CONTASPAGAR'
      
        '  (IDCONTASPAGAR, IDFORNECEDOR, IDCOMPRA, TIPO, QUANTIDADEPARCEL' +
        'A, DATACONTA, '
      '   VALORTOTAL, STATUSCONTA)'
      'values'
      
        '  (:IDCONTASPAGAR, :IDFORNECEDOR, :IDCOMPRA, :TIPO, :QUANTIDADEP' +
        'ARCELA, '
      '   :DATACONTA, :VALORTOTAL, :STATUSCONTA)')
    DeleteSQL.Strings = (
      'delete from CONTASPAGAR'
      'where'
      '  IDCONTASPAGAR = :OLD_IDCONTASPAGAR')
    Left = 392
    Top = 448
  end
  object SQL_Compra: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDCOMPRA,'
      '  IDFUNCIONARIO,'
      '  IDFORNECEDOR,'
      '  DESCRICAO,'
      '  DATACOMPRA,'
      '  HORACOMPRA,'
      '  VALORTOTAL,'
      '  TIPO,'
      '  STATUSCOMPRA'
      'from COMPRA '
      'where'
      '  IDCOMPRA = :IDCOMPRA')
    ModifySQL.Strings = (
      'update COMPRA'
      'set'
      '  IDCOMPRA = :IDCOMPRA,'
      '  IDFUNCIONARIO = :IDFUNCIONARIO,'
      '  IDFORNECEDOR = :IDFORNECEDOR,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATACOMPRA = :DATACOMPRA,'
      '  HORACOMPRA = :HORACOMPRA,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  TIPO = :TIPO,'
      '  STATUSCOMPRA = :STATUSCOMPRA'
      'where'
      '  IDCOMPRA = :OLD_IDCOMPRA')
    InsertSQL.Strings = (
      'insert into COMPRA'
      
        '  (IDCOMPRA, IDFUNCIONARIO, IDFORNECEDOR, DESCRICAO, DATACOMPRA,' +
        ' HORACOMPRA, '
      '   VALORTOTAL, TIPO, STATUSCOMPRA)'
      'values'
      
        '  (:IDCOMPRA, :IDFUNCIONARIO, :IDFORNECEDOR, :DESCRICAO, :DATACO' +
        'MPRA, :HORACOMPRA, '
      '   :VALORTOTAL, :TIPO, :STATUSCOMPRA)')
    DeleteSQL.Strings = (
      'delete from COMPRA'
      'where'
      '  IDCOMPRA = :OLD_IDCOMPRA')
    Left = 752
    Top = 264
  end
  object SQL_ContasReceber: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDCONTASRECEBER,'
      '  IDVENDA,'
      '  IDCLIENTE,'
      '  TIPO,'
      '  QUANTIDADEPARCELA,'
      '  DATACONTA,'
      '  VALORTOTAL,'
      '  STATUSCONTA'
      'from CONTASRECEBER '
      'where'
      '  IDCONTASRECEBER = :IDCONTASRECEBER')
    ModifySQL.Strings = (
      'update CONTASRECEBER'
      'set'
      '  IDCONTASRECEBER = :IDCONTASRECEBER,'
      '  IDVENDA = :IDVENDA,'
      '  IDCLIENTE = :IDCLIENTE,'
      '  TIPO = :TIPO,'
      '  QUANTIDADEPARCELA = :QUANTIDADEPARCELA,'
      '  DATACONTA = :DATACONTA,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  STATUSCONTA = :STATUSCONTA'
      'where'
      '  IDCONTASRECEBER = :OLD_IDCONTASRECEBER')
    InsertSQL.Strings = (
      'insert into CONTASRECEBER'
      
        '  (IDCONTASRECEBER, IDVENDA, IDCLIENTE, TIPO, QUANTIDADEPARCELA,' +
        ' DATACONTA, '
      '   VALORTOTAL, STATUSCONTA)'
      'values'
      
        '  (:IDCONTASRECEBER, :IDVENDA, :IDCLIENTE, :TIPO, :QUANTIDADEPAR' +
        'CELA, :DATACONTA, '
      '   :VALORTOTAL, :STATUSCONTA)')
    DeleteSQL.Strings = (
      'delete from CONTASRECEBER'
      'where'
      '  IDCONTASRECEBER = :OLD_IDCONTASRECEBER')
    Left = 48
    Top = 448
  end
  object SQL_ParcelaContasReceber: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDPARCELACONTASRECEBER,'
      '  IDCONTASRECEBER,'
      '  DATAVENCIMENTO,'
      '  DATARECEBIMENTO,'
      '  NUMEROPARCELA,'
      '  VALORPARCELA,'
      '  JUROS,'
      '  DESCONTO,'
      '  MULTA,'
      '  VALORFINAL,'
      '  STATUSPARCELA'
      'from PARCELACONTASRECEBER '
      'where'
      '  IDPARCELACONTASRECEBER = :IDPARCELACONTASRECEBER')
    ModifySQL.Strings = (
      'update PARCELACONTASRECEBER'
      'set'
      '  IDPARCELACONTASRECEBER = :IDPARCELACONTASRECEBER,'
      '  IDCONTASRECEBER = :IDCONTASRECEBER,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO,'
      '  NUMEROPARCELA = :NUMEROPARCELA,'
      '  VALORPARCELA = :VALORPARCELA,'
      '  JUROS = :JUROS,'
      '  DESCONTO = :DESCONTO,'
      '  MULTA = :MULTA,'
      '  VALORFINAL = :VALORFINAL,'
      '  STATUSPARCELA = :STATUSPARCELA'
      'where'
      '  IDPARCELACONTASRECEBER = :OLD_IDPARCELACONTASRECEBER')
    InsertSQL.Strings = (
      'insert into PARCELACONTASRECEBER'
      
        '  (IDPARCELACONTASRECEBER, IDCONTASRECEBER, DATAVENCIMENTO, DATA' +
        'RECEBIMENTO, '
      
        '   NUMEROPARCELA, VALORPARCELA, JUROS, DESCONTO, MULTA, VALORFIN' +
        'AL, STATUSPARCELA)'
      'values'
      
        '  (:IDPARCELACONTASRECEBER, :IDCONTASRECEBER, :DATAVENCIMENTO, :' +
        'DATARECEBIMENTO, '
      
        '   :NUMEROPARCELA, :VALORPARCELA, :JUROS, :DESCONTO, :MULTA, :VA' +
        'LORFINAL, '
      '   :STATUSPARCELA)')
    DeleteSQL.Strings = (
      'delete from PARCELACONTASRECEBER'
      'where'
      '  IDPARCELACONTASRECEBER = :OLD_IDPARCELACONTASRECEBER')
    Left = 176
    Top = 448
  end
  object SQL_Recebimento: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDRECEBIMENTO,'
      '  IDPARCELACONTASRECEBER,'
      '  DATARECEBIMENTO,'
      '  HORARECEBIMENTO,'
      '  VALORRECEBIDO'
      'from RECEBIMENTO '
      'where'
      '  IDRECEBIMENTO = :IDRECEBIMENTO')
    ModifySQL.Strings = (
      'update RECEBIMENTO'
      'set'
      '  IDRECEBIMENTO = :IDRECEBIMENTO,'
      '  IDPARCELACONTASRECEBER = :IDPARCELACONTASRECEBER,'
      '  DATARECEBIMENTO = :DATARECEBIMENTO,'
      '  HORARECEBIMENTO = :HORARECEBIMENTO,'
      '  VALORRECEBIDO = :VALORRECEBIDO'
      'where'
      '  IDRECEBIMENTO = :OLD_IDRECEBIMENTO')
    InsertSQL.Strings = (
      'insert into RECEBIMENTO'
      
        '  (IDRECEBIMENTO, IDPARCELACONTASRECEBER, DATARECEBIMENTO, HORAR' +
        'ECEBIMENTO, '
      '   VALORRECEBIDO)'
      'values'
      
        '  (:IDRECEBIMENTO, :IDPARCELACONTASRECEBER, :DATARECEBIMENTO, :H' +
        'ORARECEBIMENTO, '
      '   :VALORRECEBIDO)')
    DeleteSQL.Strings = (
      'delete from RECEBIMENTO'
      'where'
      '  IDRECEBIMENTO = :OLD_IDRECEBIMENTO')
    Left = 296
    Top = 448
  end
  object SQL_TipoDocumento: TIBUpdateSQL
    Left = 840
    Top = 448
  end
  object SQL_ParcelaContasPagar: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDPARCELACONTASPAGAR,'
      '  IDCONTASPAGAR,'
      '  DATAVENCIMENTO,'
      '  NUMEROPARCELA,'
      '  VALORPARCELA,'
      '  JUROS,'
      '  DESCONTO,'
      '  VALORFINAL,'
      '  STATUSPARCELA'
      'from PARCELACONTASPAGAR '
      'where'
      '  IDPARCELACONTASPAGAR = :IDPARCELACONTASPAGAR')
    ModifySQL.Strings = (
      'update PARCELACONTASPAGAR'
      'set'
      '  IDPARCELACONTASPAGAR = :IDPARCELACONTASPAGAR,'
      '  IDCONTASPAGAR = :IDCONTASPAGAR,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  NUMEROPARCELA = :NUMEROPARCELA,'
      '  VALORPARCELA = :VALORPARCELA,'
      '  JUROS = :JUROS,'
      '  DESCONTO = :DESCONTO,'
      '  VALORFINAL = :VALORFINAL,'
      '  STATUSPARCELA = :STATUSPARCELA'
      'where'
      '  IDPARCELACONTASPAGAR = :OLD_IDPARCELACONTASPAGAR')
    InsertSQL.Strings = (
      'insert into PARCELACONTASPAGAR'
      
        '  (IDPARCELACONTASPAGAR, IDCONTASPAGAR, DATAVENCIMENTO, NUMEROPA' +
        'RCELA, '
      '   VALORPARCELA, JUROS, DESCONTO, VALORFINAL, STATUSPARCELA)'
      'values'
      
        '  (:IDPARCELACONTASPAGAR, :IDCONTASPAGAR, :DATAVENCIMENTO, :NUME' +
        'ROPARCELA, '
      
        '   :VALORPARCELA, :JUROS, :DESCONTO, :VALORFINAL, :STATUSPARCELA' +
        ')')
    DeleteSQL.Strings = (
      'delete from PARCELACONTASPAGAR'
      'where'
      '  IDPARCELACONTASPAGAR = :OLD_IDPARCELACONTASPAGAR')
    Left = 504
    Top = 448
  end
  object SQL_Pagamento: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDPAGAMENTO,'
      '  IDPARCELACONTASPAGAR,'
      '  VALORPARCELA,'
      '  VALORPAGO'
      'from PAGAMENTO '
      'where'
      '  IDPAGAMENTO = :IDPAGAMENTO')
    ModifySQL.Strings = (
      'update PAGAMENTO'
      'set'
      '  IDPAGAMENTO = :IDPAGAMENTO,'
      '  IDPARCELACONTASPAGAR = :IDPARCELACONTASPAGAR,'
      '  VALORPARCELA = :VALORPARCELA,'
      '  VALORPAGO = :VALORPAGO'
      'where'
      '  IDPAGAMENTO = :OLD_IDPAGAMENTO')
    InsertSQL.Strings = (
      'insert into PAGAMENTO'
      '  (IDPAGAMENTO, IDPARCELACONTASPAGAR, VALORPARCELA, VALORPAGO)'
      'values'
      
        '  (:IDPAGAMENTO, :IDPARCELACONTASPAGAR, :VALORPARCELA, :VALORPAG' +
        'O)')
    DeleteSQL.Strings = (
      'delete from PAGAMENTO'
      'where'
      '  IDPAGAMENTO = :OLD_IDPAGAMENTO')
    Left = 608
    Top = 448
  end
  object SQL_MovimentoCaixa: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDMOVIMENTOCAIXA,'
      '  CAIXA_IDCAIXA,'
      '  IDRECEBIMENTO,'
      '  IDPAGAMENTO,'
      '  VALOR'
      'from MOVIMENTOCAIXA '
      'where'
      '  IDMOVIMENTOCAIXA = :IDMOVIMENTOCAIXA')
    ModifySQL.Strings = (
      'update MOVIMENTOCAIXA'
      'set'
      '  IDMOVIMENTOCAIXA = :IDMOVIMENTOCAIXA,'
      '  CAIXA_IDCAIXA = :CAIXA_IDCAIXA,'
      '  IDRECEBIMENTO = :IDRECEBIMENTO,'
      '  IDPAGAMENTO = :IDPAGAMENTO,'
      '  VALOR = :VALOR'
      'where'
      '  IDMOVIMENTOCAIXA = :OLD_IDMOVIMENTOCAIXA')
    InsertSQL.Strings = (
      'insert into MOVIMENTOCAIXA'
      
        '  (IDMOVIMENTOCAIXA, CAIXA_IDCAIXA, IDRECEBIMENTO, IDPAGAMENTO, ' +
        'VALOR)'
      'values'
      
        '  (:IDMOVIMENTOCAIXA, :CAIXA_IDCAIXA, :IDRECEBIMENTO, :IDPAGAMEN' +
        'TO, :VALOR)')
    DeleteSQL.Strings = (
      'delete from MOVIMENTOCAIXA'
      'where'
      '  IDMOVIMENTOCAIXA = :OLD_IDMOVIMENTOCAIXA')
    Left = 704
    Top = 448
  end
  object Query_Pesquisa: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 344
    Top = 32
  end
  object DS_Fornecedor: TDataSource
    DataSet = TB_Fornecedor
    Left = 232
    Top = 320
  end
  object DS_Funcionario: TDataSource
    DataSet = TB_Funcionario
    Left = 320
    Top = 320
  end
  object DS_Produto: TDataSource
    DataSet = TB_Produto
    Left = 448
    Top = 320
  end
  object DS_Venda: TDataSource
    DataSet = TB_Venda
    Left = 592
    Top = 320
  end
  object DS_ItemVenda: TDataSource
    DataSet = TB_ItemVenda
    Left = 672
    Top = 320
  end
  object DS_ContasPagar: TDataSource
    DataSet = TB_ContasPagar
    Left = 392
    Top = 504
  end
  object DS_Recebimento: TDataSource
    DataSet = TB_Recebimento
    Left = 296
    Top = 504
  end
  object DS_ParcelaContasReceber: TDataSource
    DataSet = TB_ParcelaContasReceber
    Left = 176
    Top = 504
  end
  object DS_ContasReceber: TDataSource
    DataSet = TB_ContasReceber
    Left = 48
    Top = 504
  end
  object DS_Compra: TDataSource
    DataSet = TB_Compra
    Left = 752
    Top = 320
  end
  object DS_ParcelaContasPagar: TDataSource
    DataSet = TB_ParcelaContasPagar
    Left = 504
    Top = 504
  end
  object DS_TipoDocumento: TDataSource
    DataSet = TB_TipoDocumento
    Left = 840
    Top = 504
  end
  object DS_MovimentoCaixa: TDataSource
    DataSet = TB_MovimentoCaixa
    Left = 704
    Top = 504
  end
  object DS_Pagamento: TDataSource
    DataSet = TB_Pagamento
    Left = 608
    Top = 504
  end
  object DS_Pesquisa: TDataSource
    DataSet = Query_Pesquisa
    Left = 344
    Top = 104
  end
  object TB_ItemCompra: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    OnNewRecord = TB_ItemCompraNewRecord
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMCOMPRA')
    UpdateObject = SQL_ItemCompra
    GeneratorField.Field = 'IDITEMCOMPRA'
    GeneratorField.Generator = 'GEN_ITEMCOMPRA_ID'
    Left = 840
    Top = 208
    object TB_ItemCompraIDITEMCOMPRA: TIntegerField
      FieldName = 'IDITEMCOMPRA'
      Origin = '"ITEMCOMPRA"."IDITEMCOMPRA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TB_ItemCompraIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Origin = '"ITEMCOMPRA"."IDPRODUTO"'
      Required = True
    end
    object TB_ItemCompraIDCOMPRA: TIntegerField
      FieldName = 'IDCOMPRA'
      Origin = '"ITEMCOMPRA"."IDCOMPRA"'
      Required = True
    end
    object TB_ItemCompraQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = '"ITEMCOMPRA"."QUANTIDADE"'
    end
    object TB_ItemCompraVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"ITEMCOMPRA"."VALOR"'
      Precision = 9
      Size = 2
    end
    object TB_ItemCompraTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Origin = '"ITEMCOMPRA"."TOTAL"'
      Precision = 9
      Size = 2
    end
  end
  object SQL_ItemCompra: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IDITEMCOMPRA,'
      '  IDPRODUTO,'
      '  IDCOMPRA,'
      '  QUANTIDADE,'
      '  VALOR,'
      '  TOTAL'
      'from ITEMCOMPRA '
      'where'
      '  IDITEMCOMPRA = :IDITEMCOMPRA')
    ModifySQL.Strings = (
      'update ITEMCOMPRA'
      'set'
      '  IDITEMCOMPRA = :IDITEMCOMPRA,'
      '  IDPRODUTO = :IDPRODUTO,'
      '  IDCOMPRA = :IDCOMPRA,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VALOR = :VALOR,'
      '  TOTAL = :TOTAL'
      'where'
      '  IDITEMCOMPRA = :OLD_IDITEMCOMPRA')
    InsertSQL.Strings = (
      'insert into ITEMCOMPRA'
      '  (IDITEMCOMPRA, IDPRODUTO, IDCOMPRA, QUANTIDADE, VALOR, TOTAL)'
      'values'
      
        '  (:IDITEMCOMPRA, :IDPRODUTO, :IDCOMPRA, :QUANTIDADE, :VALOR, :T' +
        'OTAL)')
    DeleteSQL.Strings = (
      'delete from ITEMCOMPRA'
      'where'
      '  IDITEMCOMPRA = :OLD_IDITEMCOMPRA')
    Left = 840
    Top = 264
  end
  object DS_ItemCompra: TDataSource
    DataSet = TB_ItemCompra
    Left = 840
    Top = 320
  end
  object Query_Calcular: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 432
    Top = 32
  end
end
