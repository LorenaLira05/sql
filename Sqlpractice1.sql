//ENG: Sql database exercise for college
//PT: Exercício de sql para faculdade

-- Questão 1
-- (a) Banco de dados é uma coleção de dados operacionais usados pelos sistemas de aplicação de uma organização.
-- (b) É o software responável pelo gerenciameto dos dados no banco de dados. Tem por função fazer o controle de recuperação de falhas, segurança e integridade dos dados.
-- (c) O modelo relacional possui alguns atributos que favorecem a organização, por fdacilitar o acesso aos dados de maneita estruturada e automatizada.
-- (d) A chave primaria identifica cada resgistro de uma tabela, já a chave estrangeira relaciona tabelas.
-- (e) conjunto de regras que garante a consistência e validade dos relacionamentos entre tabelas de um banco de dados.
 
-- Questão 2
-- No banco de dados relacional, os dados são guardados em forma de linhas e tabelas, já o banco de dados NoSQL não usa tabelas para armazenar dados, são mais flexíveis e úteis para dados com requisitos variáveis.
 
-- Questão 3 
create table contatos (
-- vou criar um id para ser minha chave primária e mais tarde poder relacionar a tabela contatos com outra tabela.
id int primary key auto_increment not null,
nome varchar (50),
apelido varchar (30),
relação varchar (30),
status_contato enum ('ativo','desativo'),
frequencia enum ('diário', 'semanal', 'anual', 'raramente'), 
telefone int,
data_ultimaconversa date
);
 
insert into contatos (id, nome, apelido, relação, status_contato, frequencia, telefone, data_ultimaconversa) 
values (1, 'Mauriceia Maria', 'mainha', 'mãe', 'ativo', 'diario', 999736346, '2025-03-18'),
(2, 'Edson Silva', 'painho', 'pai', 'ativo', 'diario', 997486384, '2025-03-18'),
(3, 'Olga silva', 'olguinha', 'prima', 'desativo', 'semanal', 992374982 , '2025-03-05'),
(4, 'Josineide Lira', 'tia neide', 'tia', 'ativo', 'semanal', 947903475, '2025-03-07'),
(5, 'Francisco Leite', 'quichinho', 'amigo', 'ativo', 'diario', 937465162, '2025-03-18'),
(6, 'Violet', 'kanghyemin', 'amiga', 'ativo', 'semanal', 999257646, '2025-03-10'),
(7, 'Ana Maria', 'ana', 'colega', 'desativo', 'raramente', 999736259, '2025-01-10');

create table redes (
id int primary key auto_increment not null,
whatsapp int,
instagram varchar(30),
twitter varchar (30),
facebook varchar (40),
email varchar (200),
id_contatos int,
FOREIGN KEY (id_contatos) references contatos(id)
);
select * from contatos;

insert into redes (whatsapp, instagram, twitter, facebook, email, id_contatos) 
values (98514375, '@mami89',null, 'Mauriceia silva', 'mauriceia1995@gmail.com', 1),
(812496375, '@edson61',null, 'Edson silva', 'eedsonsilva1961@gmail.com', 2),
(999874125, '@olgali2006','@olgali', 'Olga lira', 'olgaliticia@gmail.com', 3),
(998562347, null, null, 'Neide Lira', 'josineidelira19.com', 4),
(998563224, '@franciscoleite9',null, 'Francisco Leite', 'franciscochico@gmail.com', 5);

select * from redes;
 -- Depois de observar mais a fundo a estrutura das tabelas, decidi acrecentar outros aspectos importantes. 
 
 alter table contatos modify column nome varchar (30) not null;
 alter table contatos modify column telefone int not null;
 alter table contatos add column país varchar (20) default ('Brasil');

-- Vou fazer uma busca com JOIN para verificar minha chave estrangeira
select apelido, status_contato, email
from contatos
join redes on redes.id_contatos = contatos.id;
-- Tive o output esperado! :)
 
 -- Questão 4
-- (a) Atividade
-- (b) Contatos e Redes
-- (c) Na tabela contatos as colunas são: id, nome, apelido, relação, status_contato, frequencia, 
-- telefone, data_ultimaconversa e país. Já na tabela redes, as colunas foram: id, whatsapp, instagram, twitter, facebook, email e contatos_id. 
-- (d) int, varchar, enum e date. 
-- (e) Sim, foi usado not null para os ID´s das duas tabelas e para as colunas nome e telefone da tabela contatos. Nas colunas status_contato e frequencia da tabela contatos foi usado enum, 
-- além disso as tabelas possuem id como PK. Chaves estrangeiras (FK): id_contatos, garantindo que apenas os valores listados ao definir a coluna podem aparecer em cada linha. 
-- (f) contatos.id (identificador principal dos contatos) e redes.id (identificador único da tabela secundária).

-- Questão 5
-- vou criar a minha própria tabela itens_magicos para poder testar os comandos.
create table itens_magicos (
id int auto_increment primary key,
nome varchar (100) not null,
raridade varchar (50),
poder int not null
);

-- Letra (a)
alter table itens_magicos add column nivel_minimo int;
-- Percebi que o nivel_minimo não pode ser nulo, por isso vou modificar o dado da minha coluna.
alter table itens_magicos modify column nivel_minimo int not null;
desc itens_magicos;

-- Letra (b)
alter table itens_magicos modify column poder decimal (5, 2);

-- Letra (c)
alter table itens_magicos change column raridade categoria varchar (50);

-- Letra (d)
alter table itens_magicos drop nome;

-- Letra (f)
create table encantamentos (
id int primary key auto_increment not null,
item_id int,
 FOREIGN KEY (item_id) references itens_magicos(id),
 descrição varchar (255),
 custo_mana int
);
describe encantamentos;

-- Vou fazer uma busca com JOIN para verificar minha chave estrangeira.
select categoria, itens_magicos.id, descrição
from encantamentos
join itens_magicos on itens_magicos.id = encantamentos.item_id;
-- Tive o output esperado! :)

