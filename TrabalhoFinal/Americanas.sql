-- DROP DATABASE Americanas;
CREATE DATABASE IF NOT EXISTS Americanas;
USE Americanas;

CREATE TABLE MinhaCesta(
	IDCesta INT PRIMARY KEY NOT NULL,
    NomeProduto VARCHAR(255) NOT NULL,
    Quantidade INT NOT NULL, 
    ValorTotal DOUBLE NOT NULL,
    ValorProduto DOUBLE NOT NULL,
    DataEntrega DATE NOT NULL
);

CREATE TABLE Produto(
	Codigo INT PRIMARY KEY NOT NULL,
	Numeroestrela DOUBLE,
	Garantia VARCHAR(50),
	SAC VARCHAR(255) NOT NULL,
    Codigo_DescriProduto BIGINT,
    ID_Cesta INT NOT NULL,
	FOREIGN KEY (ID_Cesta) REFERENCES MinhaCesta(IDCesta)
);

CREATE TABLE DescriProduto(
	CodigoBarras BIGINT PRIMARY KEY NOT NULL,
	Tipo VARCHAR(100) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Fabricante VARCHAR(50),
	Cor VARCHAR(25),
	Marca VARCHAR(50) NOT NULL,
    Codigo_Produto INT NOT NULL,
    FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo) 
);

CREATE TABLE EnderecoEntrega(
	Codigo INT PRIMARY KEY NOT NULL,
	CEP INT NOT NULL,
	Estado VARCHAR(25) NOT NULL,
	CPF VARCHAR(14),
	RuaAvenida VARCHAR(25) NOT NULL,
	NomeCliente VARCHAR(100) NOT NULL,
	Bairro VARCHAR(50) NOT NULL,
	Numero INT NOT NULL,
	PontoReferencia VARCHAR(255) NOT NULL,
	Complemento VARCHAR(255)
);

CREATE TABLE Frete(
	IDRastreio INT PRIMARY KEY NOT NULL,
	PrazoEntrega VARCHAR(25) NOT NULL,
	Codigo_EndEntrega INT NOT NULL,
    FOREIGN KEY (Codigo_EndEntrega) REFERENCES EnderecoEntrega(Codigo) 
);

CREATE TABLE Loja(
	ID INT PRIMARY KEY NOT NULL,	
	HorarioFuncionamento TIME NOT NULL,
	DiaSemana VARCHAR(50) NOT NULL,
    Codigo_Produto INT NOT NULL,
    ID_Rastreio INT NOT NULL,
    FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo),
    FOREIGN KEY (ID_Rastreio) REFERENCES Frete(IDRastreio)
);

CREATE TABLE TelefoneLoja(
	Telefone VARCHAR(20) NOT NULL,
	ID_Loja INT NOT NULL,
	FOREIGN KEY (ID_Loja) REFERENCES Loja(ID)
);

CREATE TABLE EnderecoLoja(
	CodEndLoja INT PRIMARY KEY NOT NULL,
    RuaLoja INT NOT NULL,
    NumLoja INT NOT NULL,
    BairroLoja VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    CepLoja INT NOT NULL,
	ID_Loja INT NOT NULL,
	FOREIGN KEY (ID_Loja) REFERENCES Loja(ID)
);

CREATE TABLE Produto_Loja(
	ID INT PRIMARY KEY NOT NULL,
    Codigo_Produto INT NOT NULL,
    ID_Loja INT NOT NULL,
    FOREIGN KEY (Codigo_Produto) REFERENCES Produto(Codigo),
    FOREIGN KEY (ID_Loja) REFERENCES Loja(ID)
);

CREATE TABLE RetirarPedido(
	ID INT PRIMARY KEY NOT NULL,
	DataRetirada DATE NOT NULL,
	NomeResp VARCHAR(100) NOT NULL,
    SobrenomeResp VARCHAR(100) NOT NULL,
	CPF VARCHAR(14) NOT NULL,
	TurnoRetirada VARCHAR(1) CHECK(TurnoRetirada IN('M', 'T', 'N')) NOT NULL,
    ID_Loja INT NOT NULL,
	FOREIGN KEY (ID_Loja) REFERENCES Loja(ID)
);

CREATE TABLE Cliente(
	CPF VARCHAR(14) PRIMARY KEY NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    Email VARCHAR(50) NOT NULL,
	Senha VARCHAR(255) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    NomeSocial VARCHAR(100),
    DataNascimento DATE NOT NULL,
    Sexo VARCHAR(1) CHECK(Sexo IN('M', 'F', 'X')) NOT NULL,
    ID_cesta INT NOT NULL,
    FOREIGN KEY (ID_Cesta) REFERENCES MinhaCesta(IDCesta)
);

CREATE TABLE FecharPedido(
	IDFecharPedido INT PRIMARY KEY NOT NULL,
    Pagamento VARCHAR(100) NOT NULL,
    QTD_Produto INT NOT NULL,
    ValorTotal DOUBLE NOT NULL,
    NumCupomVale INT,
    ValorFrete DOUBLE NOT NULL,
    CPF_Cliente VARCHAR(14) NOT NULL,
	Codigo_EndEntrega INT NOT NULL,
    ID_Cesta INT NOT NULL,
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF),
    FOREIGN KEY (Codigo_EndEntrega) REFERENCES EnderecoEntrega(Codigo),
    FOREIGN KEY (ID_Cesta) REFERENCES MinhaCesta(IDCesta)
);

CREATE TABLE PagamentoPix(
	ID_pagamentoPix INT PRIMARY KEY NOT NULL,
    ValorCompra DOUBLE NOT NULL,
    CodigoQRcode INT NOT NULL,
    ID_FecharPedido INT NOT NULL,
    FOREIGN KEY (ID_FecharPedido) REFERENCES FecharPedido(IDFecharPedido)
);

CREATE TABLE PagamentoCartao(
	NumeroCartao INT PRIMARY KEY NOT NULL,
    NumeroParcelas INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    ValidadeCartao VARCHAR(5) NOT NULL,
    CodigoSeguranca INT NOT NULL,
    ValorTotal DOUBLE NOT NULL,
    ID_FecharPedido INT NOT NULL,
    FOREIGN KEY (ID_FecharPedido) REFERENCES FecharPedido(IDFecharPedido)
);

CREATE TABLE PagamentoAme(
	IDpagamentoAme INT PRIMARY KEY NOT NULL,
    ValorTotal DOUBLE NOT NULL, 
    NumeroParcela INT NOT NULL,
    CodigoQRcode VARCHAR(500) NOT NULL,
    ID_FecharPedido INT NOT NULL,
    FOREIGN KEY (ID_FecharPedido) REFERENCES FecharPedido(idFecharPedido)
);