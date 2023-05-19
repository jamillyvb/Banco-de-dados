-- DROP DATABASE ClinicaMedica;
CREATE DATABASE ClinicaMedica;
USE clinicamedica;

-- Aluna: Jamilly Vitorya da Silva Barbosa
-- Matrícula: 202103736
--
-- CRIAÇÃO DAS TABELAS 
--
CREATE TABLE Medico(
	CRM VARCHAR(12) NOT NULL,
	Primeiro_Nome VARCHAR(50) NOT NULL,
    Segundo_Nome VARCHAR(50),
    Sobrenome VARCHAR(50) NOT NULL,
    Especialidades VARCHAR(255),
    PRIMARY KEY(CRM)
);

CREATE TABLE Especialidades_Medico(
	Codigo_Especialidade_Medico INT NOT NULL,
    Titulo_Especialidade VARCHAR(255),
    CRM_Medico VARCHAR(12) NOT NULL,
    PRIMARY KEY(Codigo_Especialidade_Medico),
    FOREIGN KEY(CRM_Medico) REFERENCES Medico(CRM)
);

CREATE TABLE Paciente(
	CPF VARCHAR(14) NOT NULL,
    Primeiro_Nome VARCHAR(50) NOT NULL,
    Segundo_Nome VARCHAR(50),
    Sobrenome VARCHAR(50) NOT NULL,
    Idade INT,
    Sexo CHAR(1) CHECK(Sexo IN('F', 'M')),
    PRIMARY KEY(CPF)
);

CREATE TABLE Endereco_Paciente(
	Codigo INT NOT NULL,
    Rua INT NOT NULL,
    Numero INT,
	Bairro VARCHAR(50) NOT NULL,
    CEP INT(10) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    CPF_Paciente VARCHAR(14) NOT NULL,
    PRIMARY KEY(Codigo),
    FOREIGN KEY(CPF_Paciente) REFERENCES Paciente(CPF)
);

CREATE TABLE Consulta(
	ID INT NOT NULL,
    DATA DATE NOT NULL,
    VALOR VARCHAR(255),
    CPF_Paciente VARCHAR(14) NOT NULL,
    CRM_Medico VARCHAR(12) NOT NULL,
    PRIMARY KEY(ID),
	FOREIGN KEY(CRM_Medico) REFERENCES Medico(CRM),
	FOREIGN KEY(CPF_Paciente) REFERENCES Paciente(CPF)
);