
-- ENCONTRO 08
-- DESAFIO 02 - ESCOLA

-- ACESSANDO O BD
USE DB_T04703_VINICIUS_SCARPIN

-- ELIMINANDO TABELAS CASO JA EXISTAM
DROP TABLE IF EXISTS TB_ALUNO;
DROP TABLE IF EXISTS TB_PROFESSOR;
DROP TABLE IF EXISTS TB_COMENTARIOS;

-- ESTRUTURA ALUNO
CREATE TABLE TB_ALUNO (
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    curso VARCHAR(100)
);

-- INSERINDO DADOS NA TABELA DE ALUNOS
INSERT INTO TB_ALUNO (nome, sobrenome, curso)
VALUES ('Cezar', 'Silva', 'Matematica'),
       ('Luiza', 'Oliveira', 'Ciências de Dados'),
       ('Matheus', 'Costa', 'Economia'),
       ('Paulo', 'Rodrigues', 'Contabilidade'),
       ('Magali', 'Santos', 'Engenharia Eletrica');

-- CONSULTA INICIAL A TABELA 
SELECT * FROM TB_ALUNO;


-- ESTRUTURA PROFESSOR
CREATE TABLE TB_PROFESSOR (
	id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR(100),
    curso VARCHAR(100)
);

-- INSERINDO REGISTROS NA TABELA PROFESSOR
INSERT INTO TB_PROFESSOR (nome_professor, curso)
VALUES ('Claudio', 'Matematica'),
       ('Maria', 'Engenharia Eletrica'),
       ('Joao', 'Economia'),
       ('Miguel', 'Contabilidade'),
       ('Victor', 'Ciências de Dados');

-- CONSULTA INICIAL A TABELA DE PROFESSOR
SELECT * FROM TB_PROFESSOR;

-- ESTRUTURA COMENTARIO
CREATE TABLE TB_COMENTARIO (
	id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno_comentario INT NOT NULL,
    id_professor_comentario INT NOT NULL,
    comentario TEXT,
    nota_professor DECIMAL(3,1),
    FOREIGN KEY (id_aluno_comentario) REFERENCES TB_ALUNO(id_aluno),
    FOREIGN KEY (id_professor_comentario) REFERENCES TB_PROFESSOR(id_professor)
);

-- INSERIR REGISTROS NA TABELA DE COMENTARIOS
INSERT INTO TB_COMENTARIO (id_aluno_comentario, id_professor_comentario,
						   comentario, nota_professor)
VALUES (1, 2, 'Professor me ajudou com aula duvidas da aula', '9.5'),
       (2, 1, 'Não conseguir entender o conteudo', '5.5'),
       (3, 3, 'Tudo certo', '9.0'),
       (4, 5, 'Não respondeu meu e-mail', '3.0'),
       (1, 1, 'Sem comentarios', '7.5'),
       (5, 4, '.', '6.3');

-- CONSULTA INICIAL A TABELA DE COMENTARIOS
SELECT * FROM TB_COMENTARIO;

-- CONSULTAS SQL 
-- PARA RESPONDER AS QUESTOES DE NEGOCIO

-- CONSULTA 01
SELECT nome, curso FROM TB_ALUNO
ORDER BY nome ASC;

-- CONSULTA 02 
SELECT nome_professor AS professor, curso
  FROM TB_PROFESSOR
ORDER BY nome_professor ASC;

-- CONSULTA 03
SELECT id_comentario,
       comentario,
       nota_professor
 FROM TB_COMENTARIO
WHERE nota_professor < 6.0
ORDER BY nota_professor ASC;

-- CONSULTA 04
SELECT id_comentario,
       comentario,
       nota_professor
 FROM TB_COMENTARIO
WHERE nota_professor > 6.0
ORDER BY nota_professor ASC;