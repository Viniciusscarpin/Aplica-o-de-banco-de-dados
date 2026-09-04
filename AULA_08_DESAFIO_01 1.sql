
-- ENCONTRO 08
-- DESAFIO 01 - PADARIA

-- ACESSANDO O BD
USE DB_T04703_VINICIUS_SCARPIN

-- ELIMINANDO TABELAS CASO JA EXISTAM
DROP TABLE IF EXISTS TB_FORNECEDOR;
DROP TABLE IF EXISTS TB_PRODUTOS;
DROP TABLE IF EXISTS TB_VENDAS;

-- ESTRUTURA FORNECEDOR
CREATE TABLE TB_FORNECEDOR (
	id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

-- INSERINDO REGISTROS NA TABELA DE FORNECEDORES
INSERT INTO TB_FORNECEDOR (nome, telefone)
VALUES ('PANIFICADORA SÃO JOSE', '(11) 96666-3333'),
	   ('DONA BENTA', '(13) 98888-7777'),
       ('PADARIA SÃO CRISTOVAO', '(21) 98765-4321');

-- ESTRUTURA PRODUTOS
CREATE TABLE TB_PRODUTOS (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(8,2)
);

-- INSERINDO REGISTROS NA TABELA DE PRODUTOS
INSERT INTO TB_PRODUTOS (nome, preco)
VALUES ('Bolo de Fuba', '12.00'),
	  ('Bolo de Chocolate', '15.00'),
      ('Bolo de Cenoura', '18.00'),
      ('Pão Frances', '0.80'),
      ('Lingua de Sogra', '14.00'),
      ('Sonho', '6.00');

-- ESTRUTURA VENDAS
CREATE TABLE TB_VENDAS (
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_produto_vendas INT NOT NULL,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_produto_vendas) REFERENCES TB_PRODUTOS(id_produto)
);

INSERT INTO TB_VENDAS (id_produto_vendas, quantidade, data_venda)
VALUES (1, 10, '2026-09-01'),
       (1, 15, '2026-09-01'),
       (2, 7, '2026-08-30'),
       (2, 18, '2026-08-29'),
       (2, 5, '2026-08-28'),
       (3, 45, '2026-08-28'),
       (4, 2, '2026-08-17'),
       (5, 1, '2026-08-16'),
       (6, 15, '2026-08-15');

-- CONSULTAS SQL 
-- PARA RESPONDER AS QUESTOES DE NEGOCIO

-- CONSULTA 01
SELECT nome, preco FROM TB_PRODUTOS
ORDER BY preco ASC;

-- CONSULTA 02 
SELECT id_produto_vendas AS produto_id, 
       sum(quantidade) as total 
  FROM TB_VENDAS
GROUP BY id_produto_vendas;

-- CONSULTA 03
SELECT id_produto_vendas AS produto_id, 
       sum(quantidade) as total 
  FROM TB_VENDAS
WHERE id_produto_vendas = 1
GROUP BY id_produto_vendas;


-- CONSULTA 04
SELECT id_produto_vendas AS produto_id, 
       sum(quantidade) as total 
  FROM TB_VENDAS
WHERE id_produto_vendas = 2
GROUP BY id_produto_vendas;

-- CONSULTA 05
SELECT id_produto_vendas, quantidade, data_venda FROM TB_VENDAS
WHERE data_venda = '2026-09-01';