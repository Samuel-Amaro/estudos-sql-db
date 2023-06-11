-- POR NOMES ALTERNATIVOS PARA COLUNAS E TABELAS(QUANDO UMA COLUNA OU TABELA E RETORNADA) UM NOME MOMENTANEO
-- SINTAXE: SELECT colunas AS novo_nome_momentaneo FROM nome_tabela AS novo_nome_momentaneo;
-- EXEMPLO:

SELECT nome_livro AS livro FROM livro;

-- quando eu quero selecionar mais de um coluna
SELECT nome_livro AS livro,preco_livro AS preço FROM livro;
