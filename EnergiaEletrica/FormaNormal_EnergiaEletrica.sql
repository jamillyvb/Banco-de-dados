-- DROP DATABASE Fn_Energiaeletrica;
CREATE DATABASE Fn_energiaeletrica;
USE fn_energiaeletrica;

CREATE TABLE Municipio(
	Codigo INT NOT NULL,
    Nome VARCHAR(100),
    PRIMARY KEY(Codigo)
);

CREATE TABLE Pessoa(
	CPF VARCHAR(14) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    SegundoNome VARCHAR(100),
    Sobrenome VARCHAR(100) NOT NULL,
    CodigoMunicipio INT NOT NULL,
    PRIMARY KEY(CPF),
    FOREIGN KEY(CodigoMunicipio) REFERENCES Municipio(Codigo)
);

CREATE TABLE Conta(
	NumeroCliente INT NOT NULL,
    UnidadeConsumidora INT NOT NULL,
    ItemFaturamento VARCHAR(50) NOT NULL,
    CodigoCadastro INT NOT NULL,
    DataVencimento DATE NOT NULL,
    Aviso VARCHAR(255),
    ConsumoMes INT NOT NULL,
    ConsumoDia INT NOT NULL,
    ValorTotal VARCHAR(10) NOT NULL,
    LeituraAtual DATE NOT NULL,
    LeituraAnterior DATE NOT NULL,
    LeituraProxima DATE NOT NULL,
	CPF_pessoa VARCHAR(14) NOT NULL,
    PRIMARY KEY(NumeroCliente),
    FOREIGN KEY(CPF_pessoa) REFERENCES Pessoa(CPF)
);