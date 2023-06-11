-- como usar a cláusula FETCH do PostgreSQL para recuperar uma parte das linhas retornadas por uma consulta;
-- Para estar em conformidade com o padrão SQL, o PostgreSQL suporta 
-- a FETCH cláusula para recuperar um número de linhas retornadas por uma consulta;
-- SINTAXE:
OFFSET start {ROW linha | ROWS linhas} FETCH {PRIMEIRA,PROXIMO} [CONTAGEM_LINHAS] {ROW LINHA | ROWS LINHAS} SOMENTE

-- Como a ordem das linhas armazenadas na tabela não é especificada, 
-- você sempre deve usar a FETCH cláusula com a ORDER BY cláusula para 
-- tornar consistente a ordem das linhas no conjunto de resultados retornado;

-- A FETCH cláusula(E O PADRÃO SQL) é funcionalmente equivalente à LIMIT cláusula

-- EXEMPLO 01: TRAZENDO SOMENTE UMA LINHA SO UM PRODUTO, O PRODUTO MAIS CARO
SELECT nome_produto,preco_produto FROM produto ORDER BY preco_produto DESC FETCH FIRST 1 ROW ONLY;
-- FETCH FIRST 1 ROW ONLY(BUSQUE A PRIMEIRA LINHA APENAS)

-- EXEMPLO 02: TRAZENDO SOMENTE OS PRODUTOS MAIS BARATOS SO QUE SO A PARTIR DO 3 REGISTRO
SELECT nome_produto,preco_produto FROM produto ORDER BY preco_produto ASC OFFSET 3 ROWS FETCH FIRST 3 ROW ONLY;
-- OFFSET 3 ROWS(DESLOCA 3 LINHAS ANTES DE BUSCAR)