-- DISTINCT(DISTINTO)
-- SELECT DISTINCT cláusula PostgreSQL para remover linhas duplicadas de um conjunto de resultados retornado por uma 
-- consulta;
-- A DISTINCT cláusula é usada na SELECT instrução para remover linhas duplicadas de um conjunto de resultados;
--  A DISTINCT cláusula pode ser aplicada a uma ou mais colunas na lista de seleção da SELECT instrução;
-- SINTAXE:
SELECT DISTINCT coluna01 FROM nome_tabela;
-- COM VARIAS COLUNAS:
SELECT DISTINCT coluna01,coluna02 FROM nome_tabela;
-- O PostgreSQL também fornece a DISTINCT ON (expression) função de manter a “primeira” linha de cada grupo de duplicatas;
SELECT DISTINCT ON (coluna1) AS column_alias,coluna2 FROM table_name ORDER BY coluna1,coluna2;
-- É uma boa prática sempre usar a ORDER BYcláusula com o DISTINCT ON(expression) para tornar o 
-- conjunto de resultados previsível;
-- Observe que a DISTINCT ONexpressão deve corresponder à expressão mais à esquerda na ORDER BYcláusula;


-- CRIANDO UMA TABELA PARA SER USADA DE EXEMPLO
CREATE TABLE distinct_demo(
	id serial NOT NULL PRIMARY KEY,
	corFundo VARCHAR,
	corFonte VARCHAR
);

-- INSERINDO DADOS NA TABELA
INSERT INTO distinct_demo (corFundo,corFonte)
VALUES
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');
	
-- vendo se deu certo criar o banco e inserir os valores
SELECT * FROM distinct_demo;

-- CONSULTANDO VALORES DA COLUNA COR DE FUNDO E VENDO SE TEM DUPLICATAS(remove todas) E ORDENANDO AS CORES ALFABETICAMENTE
SELECT DISTINCT corFundo FROM distinct_demo ORDER BY corFundo ASC;

-- USANDO A CLAUSULA DISTINCT EM VARIAS COLUNAS vai remover uma unica duplicata de cada coluna e no final ordena as cores
-- alfabeticamente;
SELECT DISTINCT corFundo, corFonte FROM distinct_demo ORDER BY corFundo ASC, corFonte ASC;

-- USANDO UMA DISTINCT ON (EXRESSÃO OU COLUNA) PARA RESOLVER O PROBLEMA DA CONSULTA ACIMA, A CONSULTA ACIMA SO REMOVE AS
-- PRIMEIRAS DUPLICATAS DE CADA GRUPO DE VALORES, ISSO E CADA COLUNA SO VAI TER UMA DUPLICATA REMOVIDA DE CADA GRUPO DE VALORES
-- COM A CONSULTA ABAIXO CONSIGO REMOVER TODAS DUPLICATAS DE CADA GRUPO DE VALORES DE  CADA COLUNA, QUE USA A 
-- DISTINC ON(EXPRESSÃO OU COLUNA)
SELECT DISTINCT ON(corFundo)corFundo,corFonte FROM distinct_demo ORDER BY corFundo ASC, corFonte ASC;