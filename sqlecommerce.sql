-- 1.3 E-commerce
-- Desenvolva uma modelagem completa para um sistema de e-commerce com as seguintes
-- características:
-- • O sistema gerencia produtos, clientes, pedidos e pagamentos
-- • Produtos possuem código, nome, descrição, preço, estoque e categoria
-- • Produtos podem pertencer a múltiplas categorias organizadas hierarquicamente
-- • Clientes possuem dados pessoais, endereços de entrega e dados de pagamento
-- • Pedidos contêm data, status, valor total, método de pagamento e itens comprados
-- • Cada item de pedido possui quantidade, preço unitário e subtotal
-- • O sistema deve manter histórico de preços dos produtos
-- • O sistema deve gerenciar promoções e cupons de desconto
-- • O sistema deve controlar o estoque e gerar alertas quando produtos estão acabando
-- • Clientes podem avaliar produtos com notas e comentário

Create database ecommerce;
Use ecommerce;

CREATE TABLE PRODUTO (
    Id_produto INTEGER PRIMARY KEY,
    Nome VARCHAR(255),
    Preco_atual DECIMAL(10,2),
    Estoque_atual INTEGER,
    Descricao TEXT
);

CREATE TABLE CLIENTE (
    Id_cliente INTEGER PRIMARY KEY,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Telefone VARCHAR(20),
    Cpf VARCHAR(14)
);

CREATE TABLE PROMOCAO (
    Id_promocao INTEGER PRIMARY KEY,
    Nome VARCHAR(255),
    Descricao TEXT,
    Tipo VARCHAR(50),
    Data_inicio DATE,
    Data_fim DATE
);

CREATE TABLE HISTORICO_PRECO (
    Id_historico INTEGER PRIMARY KEY,
    Id_produto INTEGER,
    Preco DECIMAL(10,2),
    Data_inicio DATE,
    Data_fim DATE,
    FOREIGN KEY (Id_produto) REFERENCES PRODUTO(Id_produto)
);

CREATE TABLE ALERTA_ESTOQUE (
    Id_alerta INTEGER PRIMARY KEY,
    Id_produto INTEGER,
    Quantidade_minima INTEGER,
    Data_alerta DATE,
    Status ENUM('ativo', 'inativo', 'resolvido'),
    FOREIGN KEY (Id_produto) REFERENCES PRODUTO(Id_produto)
);

CREATE TABLE AVALIACAO (
    Id_avaliacao INTEGER PRIMARY KEY,
    Id_produto INTEGER,
    Id_clientes INTEGER,
    Nota ENUM('1', '2', '3', '4', '5'),
    Comentario TEXT,
    Data DATE,
    FOREIGN KEY (Id_produto) REFERENCES PRODUTO(Id_produto),
    FOREIGN KEY (Id_clientes) REFERENCES CLIENTE(Id_cliente)
);

CREATE TABLE CATEGORIA (
    Id_categoria INTEGER PRIMARY KEY,
    Nome VARCHAR(255),
    Descricao TEXT
);

CREATE TABLE PEDIDO (
    Id_pedido INTEGER PRIMARY KEY,
    Id_cliente INTEGER,
    Data_pedido DATE,
    Status ENUM('pendente', 'processando', 'enviado', 'entregue', 'cancelado'),
    Valor_total DECIMAL(10,2),
    Id_cupom INTEGER,
    FOREIGN KEY (Id_cliente) REFERENCES CLIENTE(Id_cliente),
    FOREIGN KEY (Id_cupom) REFERENCES CUPOM(Id_cupom)
);

CREATE TABLE ITEM_PEDIDO (
    Id_pedido INTEGER,
    Id_produto INTEGER,
    Quantidade INTEGER,
    Preco_unitario DECIMAL(10,2),
    Id_item INTEGER PRIMARY KEY,
    FOREIGN KEY (Id_pedido) REFERENCES PEDIDO(Id_pedido),
    FOREIGN KEY (Id_produto) REFERENCES PRODUTO(Id_produto)
);

CREATE TABLE CUPOM (
    Id_cupom INTEGER PRIMARY KEY,
    Codigo VARCHAR(20),
    Tipo VARCHAR(50),
    Valor DECIMAL(10,2),
    Data_validade DATE,
    Quantidade_uso INTEGER
);

CREATE TABLE PRODUTO_PROMOCAO_TEM (
    FK_PRODUTO_Id_produto INTEGER,
    FK_PROMOCAO_Id_promocao INTEGER,
    PRIMARY KEY (FK_PRODUTO_Id_produto, FK_PROMOCAO_Id_promocao),
    FOREIGN KEY (FK_PRODUTO_Id_produto) REFERENCES PRODUTO(Id_produto),
    FOREIGN KEY (FK_PROMOCAO_Id_promocao) REFERENCES PROMOCAO(Id_promocao)
);

CREATE TABLE PRODUTO_CATEGORIA (
    FK_PRODUTO_Id_produto INTEGER,
    FK_CATEGORIA_Id_categoria INTEGER,
    PRIMARY KEY (FK_PRODUTO_Id_produto, FK_CATEGORIA_Id_categoria),
    FOREIGN KEY (FK_PRODUTO_Id_produto) REFERENCES PRODUTO(Id_produto),
    FOREIGN KEY (FK_CATEGORIA_Id_categoria) REFERENCES CATEGORIA(Id_categoria)
);

CREATE TABLE PAGAMENTO (
    Id_pagamento INTEGER PRIMARY KEY,
    Id_pedido INTEGER,
    Data_pagamento DATE,
    Valor_pago DECIMAL(10,2),
    Status_pagamento ENUM('pendente', 'processando', 'aprovado', 'recusado', 'reembolsado'),
    FOREIGN KEY (Id_pedido) REFERENCES PEDIDO(Id_pedido)
);
