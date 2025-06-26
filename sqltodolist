-- Lista de Exercícios III: Modelagem de Dados

-- 1.1 Lista de Tarefas
-- Desenvolva uma modelagem completa para um sistema simples de lista de tarefas com as
-- seguintes características:
-- O sistema permite que usuários criem múltiplas listas de tarefas
-- Cada tarefa possui um título, descrição, data de criação, data de vencimento e status
-- pendente, em andamento, concluída
-- As tarefas podem ser categorizadas (trabalho, pessoal, estudos, etc.)
-- Os usuários podem definir prioridades para as tarefas (baixa, média, alta)
-- O sistema deve registrar quando uma tarefa é concluída.

CREATE TABLE Usuario (
    Id INTEGER PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Lista_Tarefa (
    Id INTEGER PRIMARY KEY,
    Usuario_id INTEGER,
    Titulo VARCHAR(100),
    Descricao TEXT,
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(Id)
);

CREATE TABLE Categoria (
    Id INTEGER PRIMARY KEY,
    Categoria VARCHAR(50)
);

CREATE TABLE Prioridade (
    Id INTEGER PRIMARY KEY,
    Prioridade enum ('baixa', 'média', 'alta')
);

CREATE TABLE Tarefa (
    Id INTEGER PRIMARY KEY,
    Listas_id INTEGER,
    Titulo VARCHAR(100),
    Descricao TEXT,
    Data_criacao DATE,
    Data_vencimento DATE,
    Status enum ('Não iniciado', 'Em andamento', 'Finalizado'),
    fk_Categoria_Id INTEGER,
    fk_Prioridade_Id INTEGER,
    FOREIGN KEY (Listas_id) REFERENCES Lista_Tarefa(Id),
    FOREIGN KEY (fk_Categoria_Id) REFERENCES Categoria(Id) ON DELETE CASCADE,
    FOREIGN KEY (fk_Prioridade_Id) REFERENCES Prioridade(Id) ON DELETE CASCADE
);

Describe tarefa;
