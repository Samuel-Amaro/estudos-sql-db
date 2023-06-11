-- como usar a cláusula LIMIT do PostgreSQL para obter um subconjunto de linhas geradas por uma consulta;
-- PostgreSQL LIMITé uma cláusula opcional da SELECTinstrução que restringe o número de linhas retornadas pela consulta;
-- SINTAXE:
SELECT colunas FROM nome_tabela ORDER BY expressao LIMIT numero_linhas_Selecionar;

-- A instrução retorna numero_linhas_Selecionar linhas geradas pela consulta;

-- Caso queira pular várias linhas antes de retorná numero_linhas_Selecionar, 
-- use a OFFSET cláusula colocada após a LIMIT cláusula como a seguinte instrução:
SELECT colunas FROM nome_tabela LIMIT numero_linhas_Selecionar OFFSET numero_linhas_a_pular;
-- a istrução acima pula primeiro as linhas OFFSET e depois retorna as linhas LIMIT;

-- Como uma tabela pode armazenar linhas em uma ordem não especificada, quando você usa a LIMITcláusula,
-- você deve sempre usar a  ORDER BYcláusula para controlar a ordem das linhas;

-- EXEMPLO 01: RESTRINGINDO O NUMERO DE LINHAS QUE UM SELECT PODE TRAZER, QUERO QUE SO TRAGA 7 PRODUTOS
SELECT id_produto,nome_produto,validade_produto FROM produto ORDER BY id_produto LIMIT 7; 


-- EXEMPLO 02: QUERO QUE O SELECT TRAGA AS LINHAS A PARTIR DO REGISTRO 04
SELECT id_produto,nome_produto,validade_produto FROM produto ORDER BY id_produto LIMIT 7 OFFSET 4;

-- EXEMPLO 03: QUERO OBTER OS 4 PRIMEIROS PRODUTOS MAIS CAROS
SELECT id_produto,nome_produto,validade_produto,preco_produto FROM produto
ORDER BY preco_produto DESC LIMIT 4;








