USE DB_T04703_VINICIUS_SCARPIN;

-- ENCONTRO 18 -- DESAFIO - 01
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

-- Departamentos
INSERT INTO departamentos (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Marketing'),
(5, 'Inovação'); -- sem funcionários

-- Funcionários
INSERT INTO funcionarios (id_funcionario, nome_funcionario, id_departamento) VALUES
(1, 'Ana', 1),
(2, 'Bruno', 1),
(3, 'Carlos', 2),
(4, 'Daniela', 3),
(5, 'Eduardo', 3),
(6, 'Fernanda', 4);


-- Consulta inicial
SELECT * FROM departamentos;
SELECT * FROM funcionarios;

-- Desafio 01
SELECT dep.nome_departamento AS Departamento,
       func.nome_funcionario AS Funcionário
FROM departamentos dep
LEFT JOIN funcionarios func
ON dep.id_departamento = func.id_departamento;

-- Desafio 02
-- CRIANDO A TABELA FUNCIONARIOS
CREATE TABLE tb_funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2)
);

-- CRIANDO A TABELA FAIXA
CREATE TABLE tb_faixa_salarial (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);


-- Funcionários
INSERT INTO tb_funcionarios (id_funcionario, nome_funcionario, salario) VALUES
(1, 'Ana', 1800.00),
(2, 'Bruno', 2500.00),
(3, 'Carlos', 3200.00),
(4, 'Daniela', 4500.00),
(5, 'Eduardo', 5200.00),
(6, 'Fernanda', 7000.00);

-- Faixas salariais
INSERT INTO tb_faixa_salarial (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999);

-- Desafio 02
SELECT func.nome_funcionario AS Funcionário,
	   faixa.nivel AS Nível
FROM tb_funcionarios AS func
INNER JOIN tb_faixa_salarial AS faixa
ON func.salario BETWEEN faixa.salario_min AND faixa.salario_max;

-- Desafio 03
-- ELIMANDO TABELAS COASO JA EXISTAM
DROP TABLE IF EXISTS tb_departamentos;
DROP TABLE IF EXISTS tb_funcionarios;
DROP TABLE IF EXISTS tb_faixa_salarial;

-- CRIANDO A TABELA DEPART
CREATE TABLE tb_departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

-- CRIANDO A TABELA FUNCIONARIO
CREATE TABLE tb_funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES tb_departamentos(id_departamento)
);

-- CRIANDO A TABELA FAIXA SALARIAL
CREATE TABLE tb_faixa_salarial (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);

-- Departamentos
INSERT INTO tb_departamentos (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Vendas'),
(5, 'Inovação');

-- Funcionários
INSERT INTO tb_funcionarios (id_funcionario, nome_funcionario, salario, id_departamento) VALUES
(1, 'Ana', 1800.00, 1),
(2, 'Bruno', 2500.00, 4), -- Vendas (Pleno)
(3, 'Carlos', 3200.00, 2),
(4, 'Daniela', 4500.00, 4), -- Vendas (Pleno)
(5, 'Eduardo', 5200.00, 3),
(6, 'Fernanda', 7000.00, 4);

-- Faixas salariais
INSERT INTO tb_faixa_salarial (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999); 

-- Consulta Inicial
SELECT * FROM tb_departamentos;
SELECT * FROM tb_funcionarios;
SELECT * FROM tb_faixa_salarial;

-- Desafio 03 
SELECT func.nome_funcionario AS Funcionário,
	   func.salario AS Salário,
       dep.nome_departamento AS Departamento,
       faixa.nivel AS Nível
FROM tb_funcionarios func
JOIN tb_departamentos dep
ON dep.id_departamento = func.id_departamento
JOIN tb_faixa_salarial faixa
ON func.salario BETWEEN faixa.salario_min AND faixa.salario_max
WHERE dep.nome_departamento = 'Vendas' AND faixa.nivel = 'Pleno';

