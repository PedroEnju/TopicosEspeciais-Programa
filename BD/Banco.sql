CREATE TABLE Produto (
  idProduto INTEGER  NOT NULL  ,
  NomeProduto VARCHAR(45)    ,
  Quantidade INTEGER    ,
  PrecoCusto DECIMAL(8,2)    ,
  PrecoVenda DECIMAL(8,2)    ,
  StatusProduto CHAR(1)      ,
PRIMARY KEY(idProduto));


CREATE TABLE Fornecedor (
  idFornecedor INTEGER  NOT NULL  ,
  NomeFornecedor VARCHAR(45)  NOT NULL  ,
  CNPJ INTEGER    ,
  StatusFornecedor CHAR(1)      ,
PRIMARY KEY(idFornecedor));


CREATE TABLE Funcionario (
  idFuncionario INTEGER  NOT NULL  ,
  NomeFuncionario VARCHAR(45)  NOT NULL  ,
  Salario DECIMAL(8,2)    ,
  DataAdmissao DATE      ,
PRIMARY KEY(idFuncionario));


CREATE TABLE Cliente (
  idCliente INTEGER  NOT NULL  ,
  NomeCliente VARCHAR(45)  NOT NULL  ,
  CPF INTEGER  NOT NULL  ,
  RG VARCHAR(20)    ,
  Sexo CHAR(1)    ,
  StatusCliente CHAR(1)      ,
PRIMARY KEY(idCliente));


CREATE TABLE Caixa (
  idCaixa INTEGER  NOT NULL  ,
  idFuncionario INTEGER  NOT NULL  ,
  Descricao VARCHAR(45)    ,
  DataAbertura DATE    ,
  DateFechamento DATE    ,
  ValorAbertura DECIMAL(8,2)    ,
  ValorFechamento DECIMAL(8,2)    ,
  StatusCaixa CHAR(1)      ,
PRIMARY KEY(idCaixa),
  FOREIGN KEY(idFuncionario)
    REFERENCES Funcionario(idFuncionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Venda (
  idVenda INTEGER  NOT NULL  ,
  idFuncionario INTEGER  NOT NULL  ,
  idCliente INTEGER  NOT NULL  ,
  Descricao VARCHAR(45)    ,
  DataVenda DATE    ,
  HoraVenda TIME    ,
  ValorTotal DECIMAL(8,2)    ,
  Tipo VARCHAR(20)    ,
  StatusVenda CHAR(1)      ,
PRIMARY KEY(idVenda),
  FOREIGN KEY(idFuncionario)
    REFERENCES Funcionario(idFuncionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idCliente)
    REFERENCES Cliente(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ContasReceber (
  idContasReceber INTEGER  NOT NULL  ,
  Venda_idVenda INTEGER  NOT NULL  ,
  Cliente_idCliente INTEGER  NOT NULL  ,
  Tipo CHAR(1)    ,
  QuantidadeParcela INTEGER    ,
  DataConta DATE    ,
  ValorTotal DECIMAL(8,2)    ,
  StatusConta CHAR(1)      ,
PRIMARY KEY(idContasReceber),
  FOREIGN KEY(Cliente_idCliente)
    REFERENCES Cliente(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Venda_idVenda)
    REFERENCES Venda(idVenda)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Compra (
  idCompra INTEGER  NOT NULL  ,
  idFuncionario INTEGER  NOT NULL  ,
  idFornecedor INTEGER  NOT NULL  ,
  Descricao VARCHAR(45)    ,
  DataCompra DATE    ,
  HoraCompra TIME    ,
  ValorTotal DECIMAL(8,2)    ,
  Tipo VARCHAR(20)    ,
  StatusCompra CHAR(1)      ,
PRIMARY KEY(idCompra),
  FOREIGN KEY(idFuncionario)
    REFERENCES Funcionario(idFuncionario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idFornecedor)
    REFERENCES Fornecedor(idFornecedor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ItemVenda (
  idItemVenda INTEGER  NOT NULL  ,
  idVenda INTEGER  NOT NULL  ,
  idProduto INTEGER  NOT NULL  ,
  Quantidade INTEGER    ,
  Valor DECIMAL(8,2)    ,
  Total DECIMAL(8,2)      ,
PRIMARY KEY(idItemVenda),
  FOREIGN KEY(idVenda)
    REFERENCES Venda(idVenda)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idProduto)
    REFERENCES Produto(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ItemCompra (
  idItemCompra INTEGER  NOT NULL  ,
  idProduto INTEGER  NOT NULL  ,
  idCompra INTEGER  NOT NULL  ,
  Quantidade INTEGER    ,
  Valor DECIMAL(8,2)    ,
  Total DECIMAL(8,2)      ,
PRIMARY KEY(idItemCompra),
  FOREIGN KEY(idProduto)
    REFERENCES Produto(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idCompra)
    REFERENCES Compra(idCompra)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ParcelaContasReceber (
  idParcelaContasReceber INTEGER  NOT NULL  ,
  idContasReceber INTEGER  NOT NULL  ,
  DateVencimento DATE    ,
  NumeroParcela INTEGER    ,
  Juros DECIMAL(8,2)    ,
  Desconto DECIMAL(8,2)    ,
  ValorFinal DECIMAL(8,2)    ,
  StatusParcela CHAR(1)      ,
PRIMARY KEY(idParcelaContasReceber),
  FOREIGN KEY(idContasReceber)
    REFERENCES ContasReceber(idContasReceber)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Recebimento (
  idRecebimento INTEGER  NOT NULL  ,
  idParcelaContasReceber INTEGER  NOT NULL  ,
  ValorParcela DECIMAL(8,2)    ,
  ValorPago DECIMAL(8,2)      ,
PRIMARY KEY(idRecebimento),
  FOREIGN KEY(idParcelaContasReceber)
    REFERENCES ParcelaContasReceber(idParcelaContasReceber)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ContasPagar (
  idContasPagar INTEGER  NOT NULL  ,
  idFornecedor INTEGER  NOT NULL  ,
  idCompra INTEGER  NOT NULL  ,
  Tipo CHAR(1)    ,
  QuantidadeParcela INTEGER    ,
  DataConta DATE    ,
  ValorTotal DECIMAL(8,2)    ,
  StatusConta CHAR(1)      ,
PRIMARY KEY(idContasPagar),
  FOREIGN KEY(idFornecedor)
    REFERENCES Fornecedor(idFornecedor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idCompra)
    REFERENCES Compra(idCompra)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE ParcelaContasPagar (
  idParcelaContasPagar INTEGER  NOT NULL  ,
  idContasPagar INTEGER  NOT NULL  ,
  DataVencimento DATE  NOT NULL  ,
  NumeroParcela INTEGER    ,
  ValorParcela DECIMAL(8,2)    ,
  Juros DECIMAL(8,2)    ,
  Desconto DECIMAL(8,2)    ,
  ValorFinal DECIMAL(8,2)  NOT NULL  ,
  StatusParcela CHAR(1)      ,
PRIMARY KEY(idParcelaContasPagar),
  FOREIGN KEY(idContasPagar)
    REFERENCES ContasPagar(idContasPagar)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE Pagamento (
  idPagamento INTEGER  NOT NULL  ,
  idParcelaContasPagar INTEGER  NOT NULL  ,
  ValorParcela DECIMAL(8,2)    ,
  ValorPago DECIMAL(8,2)      ,
PRIMARY KEY(idPagamento),
  FOREIGN KEY(idParcelaContasPagar)
    REFERENCES ParcelaContasPagar(idParcelaContasPagar)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE TABLE MovimentoCaixa (
  idMovimentoCaixa INTEGER  NOT NULL  ,
  Caixa_idCaixa INTEGER  NOT NULL  ,
  idRecebimento INTEGER  NOT NULL  ,
  idPagamento INTEGER  NOT NULL  ,
  Valor DECIMAL(8,2)      ,
PRIMARY KEY(idMovimentoCaixa),
  FOREIGN KEY(idPagamento)
    REFERENCES Pagamento(idPagamento)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idRecebimento)
    REFERENCES Recebimento(idRecebimento)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Caixa_idCaixa)
    REFERENCES Caixa(idCaixa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



