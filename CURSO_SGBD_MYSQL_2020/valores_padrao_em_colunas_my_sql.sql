-- MY SQL - DEFAULT - VALORES PADRÃO EM COLUNAS
-- USANDO VALOR PADRÃO
-- UMA COLUNA DA TABELA SEMPRE VAI RECEBER UM MESMO VALOR(NÃO ESTOU FALANDO DE SEU DOMINIO), MAS DE VALOR!
-- INDEPENDENTE DO REGISTRO SEMPRE AQUELA COLUNA VAI TER O MESMO VALOR PARA DIFERENTES REGISTROS.
-- EXEMPLO: existe uma coluna estado, para essa coluna estado so vai ter o valor São paulo, para todos os registros.

-- COMO CRIAR O PADRÃO:
-- ao criar estar criando o DDL: DEFALUT 'valor_padrão';
-- ao ja ter um tabela criada: ALTER TABLE nome_tabela MODIFY COLUMN nome_coluna tipo_de_Dado_coluna DEFAULT 'valor_padrão';

-- EXEMPLO:
-- use biblioteca;
-- vou adicionar na tabela autores um valor padrão na coluna sobrenome autor: da silva.
-- isso e todo autor inserido sem sobrenome vai ter por padrão o valor no sobrenome da silva.
ALTER TABLE autores MODIFY COLUMN sobrenome_autor varchar(60) DEFAULT 'Da Silva';

-- inserindo um autor sem sobrenome
INSERT INTO autores(id_autor,nome_autor) VALUES(11,'Florentina');

-- inserir um autor com sobrenome
INSERT INTO autores(id_autor,nome_autor,sobrenome_autor) VALUES(12,'Margarida','Ramos Oliveira Barros');
-- vendo se deu certo
SELECT * FROM autores;

-- DESAPLICAR O VALOR PADRÃO APLICADO EM UMA COLUNA:
ALTER TABLE autores MODIFY COLUMN sobrenome_autor varchar(60);

-- testando, se deu certo, com uma inserção.
INSERT INTO autores(id_autor,nome_autor) VALUES(14,'Poll Markanytei');

-- vendo se deu certo
SELECT * FROM autores;