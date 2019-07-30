object DM: TDM
  OldCreateOrder = False
  Height = 565
  Width = 762
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
    Left = 104
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
    Left = 104
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
    Left = 104
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
    Left = 184
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
    Left = 264
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
    Left = 344
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
    Left = 432
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
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMVENDA')
    UpdateObject = SQL_ItemVenda
    GeneratorField.Field = 'IDITEMVENDA'
    GeneratorField.Generator = 'GEN_ITEMVENDA_ID'
    Left = 520
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
  object IBQuery6: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 264
    Top = 392
  end
  object TB_Compra: TIBQuery
    Database = DB_Principal
    Transaction = DB_Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from COMPRA')
    UpdateObject = SQL_Compra
    GeneratorField.Field = 'IDCOMPRA'
    GeneratorField.Generator = 'GEN_COMPRA_ID'
    Left = 608
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
  object IBQuery8: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 24
    Top = 392
  end
  object IBQuery9: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 104
    Top = 392
  end
  object IBQuery10: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 184
    Top = 392
  end
  object IBQuery11: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 696
    Top = 392
  end
  object IBQuery12: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 344
    Top = 392
  end
  object IBQuery13: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 432
    Top = 392
  end
  object IBQuery14: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 520
    Top = 392
  end
  object IBQuery15: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 608
    Top = 392
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
    Left = 184
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
    Left = 264
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
    Left = 344
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
    Left = 432
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
    Left = 520
    Top = 264
  end
  object IBUpdateSQL6: TIBUpdateSQL
    Left = 264
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
    Left = 608
    Top = 264
  end
  object IBUpdateSQL8: TIBUpdateSQL
    Left = 24
    Top = 448
  end
  object IBUpdateSQL9: TIBUpdateSQL
    Left = 104
    Top = 448
  end
  object IBUpdateSQL10: TIBUpdateSQL
    Left = 184
    Top = 448
  end
  object IBUpdateSQL11: TIBUpdateSQL
    Left = 696
    Top = 448
  end
  object IBUpdateSQL12: TIBUpdateSQL
    Left = 344
    Top = 448
  end
  object IBUpdateSQL13: TIBUpdateSQL
    Left = 432
    Top = 448
  end
  object IBUpdateSQL14: TIBUpdateSQL
    Left = 520
    Top = 448
  end
  object IBUpdateSQL15: TIBUpdateSQL
    Left = 608
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
    Left = 184
    Top = 320
  end
  object DS_Funcionario: TDataSource
    DataSet = TB_Funcionario
    Left = 264
    Top = 320
  end
  object DS_Produto: TDataSource
    DataSet = TB_Produto
    Left = 344
    Top = 320
  end
  object DS_Venda: TDataSource
    DataSet = TB_Venda
    Left = 432
    Top = 320
  end
  object DS_ItemVenda: TDataSource
    DataSet = TB_ItemVenda
    Left = 520
    Top = 320
  end
  object DataSource6: TDataSource
    Left = 264
    Top = 504
  end
  object DataSource7: TDataSource
    Left = 184
    Top = 504
  end
  object DataSource8: TDataSource
    Left = 104
    Top = 504
  end
  object DataSource9: TDataSource
    Left = 24
    Top = 504
  end
  object DS_Compra: TDataSource
    DataSet = TB_Compra
    Left = 608
    Top = 320
  end
  object DataSource11: TDataSource
    Left = 344
    Top = 504
  end
  object DataSource12: TDataSource
    Left = 696
    Top = 504
  end
  object DataSource13: TDataSource
    Left = 608
    Top = 504
  end
  object DataSource14: TDataSource
    Left = 520
    Top = 504
  end
  object DataSource15: TDataSource
    Left = 432
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
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMCOMPRA')
    UpdateObject = SQL_ItemCompra
    GeneratorField.Field = 'IDITEMCOMPRA'
    GeneratorField.Generator = 'GEN_ITEMCOMPRA_ID'
    Left = 696
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
    Left = 696
    Top = 264
  end
  object DS_ItemCompra: TDataSource
    DataSet = TB_ItemCompra
    Left = 696
    Top = 320
  end
end
