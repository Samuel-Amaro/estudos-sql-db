-- FILTRAR RESULTADOS DE CONSULTAS COM CLAUSULA WHERE
-- PERMITE FILTRAR,SELECIONAR ALGO SENDO APLICADO UM FILTRO PARA BUSCA
-- SINTAXE: SELECT colunas_a_selecionar FROM nome_tabela WHERE coluna = valor; 
-- where == onde, seleciona essas colunas da tabela tal onde a coluna tiver esse valor

-- exemplos
 SELECT nome_livro,data_public FROM livro WHERE id_autor = 1;
 
 SELECT nome_autor,id_autor FROM autores WHERE sobrenome_autor = 'Stanek'; -- PARA FILTRAR POR STRINGS USAMOS ' string_vai_Aqui'