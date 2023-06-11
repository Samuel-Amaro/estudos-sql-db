-- REALIZAR CONSULTAS COM ORDENAÇÃO COM O COMANDO (ORDER BY)
-- A PALAVRA CHAVE ORDER BY E USADA PARA ORDENAR O CONJUNTO-RESULTADO DE REGISTROS
-- ASC - ORDEM ASCENDENTE
-- DESC - ORDEM DESCENDENTE(INVERSA)

-- COMO ORDENAR UMA CONSULTA, COLOCAR EM ORDEM ALFABETICA, DO MAIO VALOR PARA O MENOR, MENOR PARA O MAIOR, ETC...
SELECT * FROM livro ORDER BY nome_livro ASC; -- retorna todas as colunas da tabela, porem a coluna nome_livro vai vim com seus registros em ordem alfabetica
SELECT * FROM livro ORDER BY nome_livro DESC; -- em ordem inverssa

-- SINTAXE:
SELECT colunas_a_selecionar FROM nome_tabela ORDER BY colunas_a_ordenar;

-- EXEMPLOS:
SELECT nome_livro,isbn,preco_livro,data_public,id_livro FROM livro ORDER BY id_livro;

-- quando ordena em ordem ascendente não a necessidade de usar o ASC No final so quando usa o DESC QUE PRECISA colocar;