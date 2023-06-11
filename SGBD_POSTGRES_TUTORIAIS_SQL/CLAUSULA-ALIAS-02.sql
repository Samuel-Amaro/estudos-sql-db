-- alias de coluna do PostgreSQL e como usar alias de coluna para atribuir nomes temporários a colunas em consultas.
-- O alias da coluna existe temporariamente durante a execução da consulta.
-- Um alias de coluna permite atribuir um SELECTnome temporário a uma coluna ou 
-- expressão na lista de seleção de uma instrução.
-- ALIAS(APELIDO) 
-- SINTAXE:
SELECT nome_coluna AS alias_nome FROM nome_tabela;
SELECT expressao AS alias_nome FROM nome_tabela;
-- o o bjetivo do alias e torna a saida de consultas os titulos mais significativos.


-- EXEMPLO 01 atribuindo um ALIAS A UMA COLUNA
SELECT preco_produto AS Preços FROM produto;

-- EXEMPLO 02 ATRIBUINDO UM ALIAS QUE CONTENHA ESPAÇÕES
SELECT validade_produto AS "Vencimento Produto" FROM produto;
