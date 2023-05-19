-- DROP DATABASE fnhistorico;
CREATE DATABASE fnhistorico;
USE Fnhistorico;

CREATE TABLE Disciplina(
	Codigo INT NOT NULL,
    Nome_disciplina VARCHAR(100),
    Nome_Professor VARCHAR(14),
	Sobrenome_Professor VARCHAR(14),
    Periodo INT NOT NULL,
    CH INT NOT NULL,    
	PRIMARY KEY(Codigo)
);

CREATE TABLE Professor(
	Codigo INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Sobre_nome VARCHAR(100) NOT NULL,
    Email_principal VARCHAR(200) NOT NULL,
    Lattes VARCHAR(255),
   	CodigoDisciplina INT NOT NULL,
    PRIMARY KEY(Codigo)
);

CREATE TABLE Aluno(
	Matricula_aluno INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    Curso VARCHAR(100) NOT NULL,
    Ano_Conlusao YEAR,
    Data_Nascimento DATE,
    Semestre_Aluno VARCHAR(7) NOT NULL,
	PRIMARY KEY(Matricula_aluno)
);

CREATE TABLE Historico(
	Codigo INT NOT NULL,
    Nota INT NOT NULL,
    Situacao VARCHAR(9) CHECK(Situacao IN('Aprovado', 'Reprovado')),
	MatriculaAluno INT NOT NULL,
	PRIMARY KEY(Codigo),
    FOREIGN KEY(MatriculaAluno) REFERENCES Aluno(Matricula_aluno)
);

CREATE TABLE Aluno_Disciplina(
	CodigoDisciplina INT NOT NULL,
    MatriculaAluno INT NOT NULL,
	FOREIGN KEY(MatriculaAluno) REFERENCES Aluno(Matricula_aluno),
    FOREIGN KEY(CodigoDisciplina) REFERENCES Disciplina(Codigo)
);

CREATE TABLE Historico_Disciplina(
	CodigoHistorico INT NOT NULL,
	CodigoDisciplina INT NOT NULL,
    FOREIGN KEY(CodigoDisciplina) REFERENCES Disciplina(Codigo),
    FOREIGN KEY(CodigoHistorico) REFERENCES Historico(Codigo)
);

CREATE TABLE Professor_Discip(
	CodigoDisciplina INT NOT NULL,
	CodigoProfessor INT NOT NULL,
	FOREIGN KEY(CodigoProfessor) REFERENCES Professor(Codigo),
	FOREIGN KEY(CodigoDisciplina) REFERENCES Disciplina(Codigo)
);