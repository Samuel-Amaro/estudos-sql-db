-- SELEÇÃO DE INTERVALOS EM CONSULTAS COM COMANDO (BETWEEN)
-- E UTILIZADA PARA SELEÇÃO DE INTERVALOS, TIPO APLICAR UMA FILTRAGEM PARA BUSCAR UM INTERVALO ESPECIFICO
-- SINTAXE:
SELECT colunas FROM nome_tabela WHERE coluna BETWEEN valor_1 AND valor_2;
(tanto faz se e crescente e decrecente)

-- EXEMPLOS:
SELECT nome_livro AS livro, preco_livro AS preço FROM livro WHERE preco_livro BETWEEN 40 AND 60;
-- buscar so livros com preços entre 40 a 60 reais
