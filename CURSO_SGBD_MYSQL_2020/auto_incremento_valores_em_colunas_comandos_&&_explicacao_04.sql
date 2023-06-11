-- AUTO INCREMENTO DE VALORES EM COLUNAS
-- AUTO_INCREMENT
-- o auto incremento permite que um numero unico seja gerado quando um novo registro e inserido em uma tabela
-- EM MYSQL tratase da palavra chave AUTO_INCREMENT, cujo valor inicial padrão e 1, e se incremente de um em um
-- e possivel se fazer com que o auto incremnte se inicie em valor diferente
-- ex: AUTO_INCREMET = 100, SE INICIA EM 100
-- so pode ter um AUTO_INCREMENT POR TABELA

-- EX PRATICO:
USE biblioteca;
CREATE TABLE tbl_teste_incremento(id_registro smallint primary key auto_increment,
                                  nome varchar(30) not null)AUTO_INCREMENT = 15;

-- INSERINDO UM REGISTROS PARA VER O EXEMPLO EM PRATICA:
INSERT INTO tbl_teste_incremento(id_registro,nome) values(16,'Samuel'),(17,'Jonas'),(18,'Noe'),(19,'Moises'),
(20,'Davi');
INSERT INTO tbl_teste_incremento(nome) values('Enoque'),('Jose'),('Dam'),('Naftali'),('Jaco');

-- VENDO SE DEU CERTO
SELECT * FROM tbl_teste_incremento;

-- verificando em qual valor atual o auto_incremento parou
select max(id_registro) from tbl_teste_incremento;
