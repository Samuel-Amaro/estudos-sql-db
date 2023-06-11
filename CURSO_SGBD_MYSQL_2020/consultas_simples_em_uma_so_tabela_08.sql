-- REALIZAR CONSULTAS SIMPLES EM MYSQL COM COMANDO(SELECT)
-- CONSULTA SIMPLES EM UMA SO TABELA
-- SINTAXE:
-- SELECT colunas_a_selecionar FROM nome_tabela;

-- exemplos
SELECT nome_autor FROM autores; 
SELECT * FROM autores; -- vai retornas todas as colunas da tabela
SELECT nome_livro FROM livro; -- retorna so a coluna que possui nome de livros

-- COMO SELECIONAR SO ALGUMAS COLUNAS DE UMA TABELA ?
-- EX:
SELECT nome_livro,isbn,data_public FROM livro; -- escolhe uma coluna, outra coluna