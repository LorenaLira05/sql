-- 1.2 Biblioteca
-- Desenvolva uma modelagem completa para um sistema de biblioteca com as seguintes características:
-- A biblioteca possui livros, revistas e materiais audiovisuais
-- Cada item possui um código único, título, ano de publicação e localização na estante
-- Livros possuem ISBN, autor(es), editora e número de páginas
-- Revistas possuem ISSN, periodicidade e edição
-- Materiais audiovisuais possuem tipo (DVD, CD, etc.), duração e diretor/artista
-- Modelagem de Dados Banco de Dados
-- Usuários podem emprestar itens por um período determinado
-- O sistema deve controlar datas de empréstimo, devolução prevista e devolução efetiva
-- Usuários atrasados na devolução recebem multas
-- O sistema deve permitir reservas de itens que estão emprestados

Create database Biblioteca;
use Biblioteca;

CREATE TABLE Item (
    id_item INTEGER PRIMARY KEY,
    Localizador VARCHAR(255),
    Titulo VARCHAR(255),
    Ano_publicacao DATE
);

CREATE TABLE Livros (
    Id_item INTEGER PRIMARY KEY,
    Titulo VARCHAR(255),
    ISBN VARCHAR(255),
    Editora VARCHAR(255),
    Autor_a VARCHAR(255),
    Num_paginas INTEGER,
    FOREIGN KEY (Id_item) REFERENCES Item(id_item)
);

CREATE TABLE Revistas (
    Id_item INTEGER PRIMARY KEY,
    ISSN VARCHAR(255),
    Periodicidade VARCHAR(255),
    Edicao VARCHAR(255),
    FOREIGN KEY (Id_item) REFERENCES Item(id_item)
);

CREATE TABLE Audiovisual (
    Id_item INTEGER PRIMARY KEY,
    Tipo VARCHAR(255),
    Duracao DECIMAL(10,2),
    Diretor_artista VARCHAR(255),
    FOREIGN KEY (Id_item) REFERENCES Item(id_item)
);

CREATE TABLE Emprestimo (
    Id INTEGER PRIMARY KEY,
    Usuario_id INTEGER,
    Id_item INTEGER,
    Data_emprestimo DATE,
    Data_devolucao_estimada DATE,
    Data_devolucao_real DATE,
    FOREIGN KEY (Usuario_id) REFERENCES Cliente(Id),
    FOREIGN KEY (Id_item) REFERENCES Item(id_item)
);

CREATE TABLE Multas (
    Usuario_id INTEGER,
    Emprestimo_id INTEGER,
    Valor DECIMAL,
    Paga BOOLEAN,
    FOREIGN KEY (Emprestimo_id) REFERENCES Emprestimo(Id),
    FOREIGN KEY (Usuario_id) REFERENCES Emprestimo(Id)
);

CREATE TABLE Cliente (
    Id INTEGER PRIMARY KEY,
    Nome VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Reservas (
    Data_reserva DATE,
    Status ENUM('ativo', 'cancelado', 'completo'),
    Id INTEGER PRIMARY KEY,
    Usuario_id INTEGER,
    Id_item INTEGER,
    FOREIGN KEY (Id_item) REFERENCES Item(id_item),
    FOREIGN KEY (Usuario_id) REFERENCES Cliente(Id)
);
