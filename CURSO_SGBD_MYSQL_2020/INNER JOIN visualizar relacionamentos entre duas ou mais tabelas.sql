-- inner join(consulta dados em duas ou mais tabelas)
-- join: e usada para combinar dados,provenientes de duas ou mais tabelas,baseado em um relacionamento entre colunas desta tabela.

-- categorias de join:
-- inner join: retorna linhas(tuplas,ou registros) quando houver pelo menos uma correspondecia em ambas as tabelas.
-- outer join: retorna linhas mesmo quando não houver correspondecia entre uma das tabelas ou ambas as tabelas não tiverem.
-- outer / em: left join, right join,full join

-- sintaxe inner join:
SELECT colunas_selecionar FROM tabela_1 JOIN tabela_2 ON tabela_1.coluna = tabela_2.coluna;
-- obs: criterio de relacionamento das tabelas a partir de ON(basicamento chave primaria e chave estrangeira)

-- EX:
use biblioteca;
SELECT * FROM livro INNER JOIN autores ON livro.id_autor = autores.id_autor;
-- vai trazer os livros e seus respectivos autores, que estão em tabelas diferentes

SELECT livro.nome_livro,livro.isbn,autores.nome_autor FROM livro INNER JOIN autores ON livro.id_autor = autores.id_autor;
-- selecionando colunas especificas do relacionamento

-- usando nomes alternativos para as tabelas e filtragem de consulta com where e like
SELECT L.nome_livro,E.nome_editora FROM livro AS L INNER JOIN editoras AS E ON L.id_editora = E.id_editora WHERE E.nome_editora LIKE 'M%';

-- inner join com tres tabelas(tabela mais importante na clausula FROM)
SELECT * FROM livro AS L INNER JOIN autores AS A ON L.id_autor = A.id_autor INNER JOIN editoras AS E ON L.id_editora = E.id_editora;