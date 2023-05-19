create database fnFormula1;
use Fnformula1;

-- Aluna: Jamilly Vitorya da Silva Barbosa
-- Matrícula: 202103736
--
-- CRIAÇÃO DAS TABELAS 
--
create table Equipe(
	Codigo int not null,
    Nome varchar(200) not null,
    Ano int not null,
    primary key(Codigo)
);

create table Paises(
	ID int not null,
	SiglaPais varchar(3) not null,
	Nome varchar(200) not null,
	primary key(ID)
);

create table Circuito(
	Codigo int not null,
	primary key(Codigo)
);

create table Corrida(
	ID int not null,
	Data date not null,
    Duracao time not null,
	CodigoCircuito int not null,
    primary key(ID),
    foreign key(CodigoCircuito) references Circuito(Codigo)
);

create table Piloto(
	CPF varchar(14) unique not null,
	Nome_Piloto varchar(50) not null,
    Sobrenome_Piloto varchar(50) not null,
    Idade int not null,
    Categoria varchar(2) not null check(Categoria in('F1')),
    posicao int not null,
    ID_Corrida int not null,
	primary key(CPF),
    foreign key(ID_Corrida) references Corrida(ID)
);

create table Pertence(
	ID int not null,
    CPF_Piloto varchar(14) not null,
    Codigo_Circuito int not null,
    ID_Paises int not null,
    Codigo_Equipe int not null,
	primary key(ID),
    foreign key(CPF_Piloto) references Piloto(CPF),
    foreign key(Codigo_Circuito) references Circuito(Codigo),
    foreign key(ID_Paises) references Paises(ID),
	foreign key(Codigo_Equipe) references Equipe(Codigo)
);