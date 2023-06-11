-- VIEWS ou EXIBIÇÃO
-- UMA EXIBIÇÃO(VISÃO) É UMA TABELA VIRTUAL BASEADA NO CONJUNTO DE RESULTADOS DE UMA CONSULTA SQL.
-- EXECUTA UMA CONSULTA SQL, E O RESULTADO DESSA CONSULTA PODE SER USADO PARA CRIAÇÃO DE UMA TABELA VIRTUAL.
-- UMA TABELA NA MEMORIA DO COMPUTADOR, QUE POR VEZ PODE SER USADO PARA OUTRAS CONSULTAS.
-- CONTEM LINHAS E COLUNAS COMO UMA TABELA REAL, E PODE RECEBER COMANDOS COMO DECLARAÇÕES JOIN,
-- WHERE E FUNÇÕES COMO UMA TABELA NORMAL.
-- MOSTRA SEMPRE RESULTADOS DE DADOS ATUALIZADOS, POIS O MOTOR DO BANCO DE DADOS RECRIA OS DADOS
-- TODA VEZ QUE UM USUARIO CONSULTA A VISÃO.

-- COMO CRIAR VISÃO ? VIEWS ou EXIBIÇÃO ou VISÃO
CREATE VIEW nome_view AS consulta_sql;

-- EXEMPLO:
CREATE VIEW vw_livros_autores AS
SELECT L.nome_livro AS Livro,A.nome_autor AS Autor 
FROM livro AS L INNER JOIN autores AS A 
ON L.id_autor = A.id_autor;

-- COMO UTILIZAR A VIEW CRIADA ?
-- A VIEW criada vai ficar como um banco de dados virtual, ja com resutados prontos e colunas ja selecionadas.
-- e encima desse resultado eu posso ainda aplicar mais restrições e elaborar uma melhor consulta, no caso ja estou mandado trazer todos os livros em 
-- ordem alfabetica.
-- pode ver que as colunas selecionadas no select são os alias usados na view e o from especifica a view criada.
SELECT Livro,Autor FROM vw_livros_autores ORDER BY Livro ASC;


-- COMO ALTERAR UMA VISÃO JA CRIADA ?
ALTER VIEW nome_visão_Existente AS nova_consulta_sql_modificada;

-- EXEMPLO, ALTERANDO A VIEW CRIADA ACIMA, ADICIONADO UMA NOVA COLUNA NA VISÃO 
ALTER VIEW vw_livros_autores AS
SELECT L.nome_livro AS Livro,A.nome_autor AS Autor,
L.preco_livro AS Preço 
FROM livro AS L INNER JOIN autores AS A 
ON L.id_autor = A.id_autor;


-- USANDO A VIEW JA MODIFICADA(ALTERADA), ja mando usar todas as colunas logo,E MANDANDO OREDENAR POR VALOR, do menor valor para o maior
SELECT * FROM vw_livros_autores ORDER BY Preço ASC;


-- como excluir um visão ?
DROP VIEW nome_visão_a_ser_excluida;


