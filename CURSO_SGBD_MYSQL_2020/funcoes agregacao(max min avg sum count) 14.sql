-- FUNÇÕES DE AGREGAÇÃO NO MYSQL
-- FUNÇÕES DE AGREGAÇÃO SÃO FUNÇÕES SQL QUE PERMITEM EXECUTAR UMA OPERAÇÃO ARITMETICA NOS VALORES DE UMA COLUNA
-- EM TODOS OS REGISTROS DE UMA TABELA
-- RETORNA UM VALOR UNICO BASEADO EM UM CONJUNTO DE VALORES
-- SINTAXE BASICA:
-- FUNÇÃO(ALL | DISTINCT expressão); 
-- ALL: USA TODOS OS REGISTROS NA HORA DE FAZER A AGREGAÇÃO(E O PADRÃO)
-- DISTINCT: USA APENAS VALORES DISTINTOS, VALORES SEM REPETIÇÃO, VALORES QUE NÃO SE REPETEM

-- FUNÇÕES DE AGREGAÇÃO:
-- MIN = RETORNA O VALOR MINIMO OU MENOR VALOR EM UM CONJUNTO DE VALORES
-- MAX = RETORNA O VALOR MAXIMO
-- AVG = MEDIA ARITMETICA DE UM CONJUNTO DE VALORES INFORMADOS
-- SUM = Total(Soma) Recebe um conjunto de valores e retorna a soma total de todos esses valores
-- COUNT = contar a quantidade de itens(ex:contar a qut de registros)

-- EXEMPLOS:
SELECT COUNT(*) AS Quantidade_Autores FROM autores; -- * == tudo, todos os registros
SELECT COUNT(DISTINCT id_autor) AS qtd_livros_publicados  FROM livro; -- conta o numero de registros na tabela livro, mas sendo que na tabela livro os autores pode repetir
SELECT MIN(preco_livro) AS menor_preco FROM livro;
SELECT MAX(preco_livro) AS maior_preco FROM livro;
SELECT AVG(preco_livro) AS total_preco_livro FROM livro;