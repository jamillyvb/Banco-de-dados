CREATE DATABASE corrida;
USE Corrida;

-- Aluna: Jamilly Vitorya da Silva Barbosa
-- Matrícula: 202103736
--
-- CRIAÇÃO DAS TABELAS 
--
CREATE TABLE Equipe(
	CodigoEquipe int PRIMARY KEY, 
    NomeEquipe varchar(255), 
    AnoEquipe year
);

CREATE TABLE Circuito(
	CodigoCircuito int PRIMARY KEY
);

CREATE TABLE Piloto(
	IDPiloto int NOT NULL AUTO_INCREMENT,
	CpfPiloto varchar(255), 
    NomePiloto varchar(255) NOT NULL, 
    IdadePiloto int NOT NULL, 
    CategoriaPiloto varchar(255),
    PRIMARY KEY (IDPiloto)
);

CREATE TABLE Vencedores(
	IDVenc int NOT NULL,
    IDPiloto int NOT NULL AUTO_INCREMENT,
    NomeVencedor varchar(255) NOT NULL,
    PRIMARY KEY (IDVenc),
    FOREIGN KEY (IDPiloto)
    REFERENCES Piloto(IDPiloto)
);

CREATE TABLE Corrida(
	IDCorrida int NOT NULL AUTO_INCREMENT,
	DataCorrida varchar(255) NOT NULL, 
    DuracaoCorrida varchar(255) NOT NULL,
    PRIMARY KEY (IDCorrida)
);

CREATE TABLE Paises(
	Sigla_pais varchar(255) PRIMARY KEY, 
    NomePais varchar(255) NOT NULL
);

CREATE TABLE Participa(
	Posicao varchar(255)
);

-- INSERIR DADOS
INSERT INTO Equipe(CodigoEquipe, NomeEquipe, AnoEquipe) VALUES 
('123456', 'Monster', '1999'),
('193333', 'Fogo', '2003'),
('129027', 'Vento', '2007');

INSERT INTO Circuito(CodigoCircuito) VALUES
('888'),
('999'),
('444');

INSERT INTO Piloto(CpfPiloto, NomePiloto, IdadePiloto, CategoriaPiloto) VALUES
('00000000000', 'Marquinhos Jubilado', '19', 'C1'),
('123456789111', 'Carlos pé de Pimenta', '28', 'C2'),
('898989222000', 'Creuza dos Reis', '22', 'C3');

INSERT INTO Corrida(DataCorrida, DuracaoCorrida) VALUES
('12/02/2023', '2:20:30'),
('01/03/2024', '2:30:10'),
('12/12/2025', '1:20:04');

INSERT INTO Paises(Sigla_pais, NomePais) VALUES
('BR', 'Brasil'),
('DE', 'Alemanha'),
('CA', 'Canadá');

INSERT INTO Vencedores(IDVenc, NomeVencedor) VALUES
(3, 'Marquinhos Jubilado'),
(2, 'Carlos pé de Pimenta'),
(1, 'Creuza dos Reis');

-- APRESENTAR DADOS
SELECT * FROM Equipe;
SELECT * FROM Circuito;
SELECT * FROM Piloto;
SELECT * FROM Corrida;
SELECT * FROM Paises;
SELECT * FROM Vencedores;