-- as clausulas like e not like são usadas para filtragem de consultas por padrões de caracteres
-- LIKE:
-- vai determinar se uma cadeia especifica corresponde a um padrão infromado na consulta com caracteres comuns ou coringas

-- NOT LIKE: inverte a comparação verificando se a cadeia de caracteres Não corresponde ao padrão especificado.

-- pode usar metacacteres para ajudar na filtragem substituindo nas filtragens
-- '%' qualque cadeia de 0 ou mais caracteres
-- '_' sublinhado: qualque caracter unico

-- EXEMPLOS USANDO LIKE:
SELECT * FROM livro WHERE nome_livro LIKE 'F%';
-- seleciona nome dos livros onde o nome do livro começa pela letra f e tenha 0 ou mais caracteres(oque vier depois do f não importa )
SELECT * FROM livro WHERE nome_livro NOT LIKE 'S%';
-- NOT LIKE == NÃO E IGUAL A
-- seleciona tudo onde nome do livro não começa pela letra S, e o resto da string não importa se tem 0 ou mais caracteres
SELECT * FROM livro WHERE nome_livro LIKE 'i_%';
-- seleciona tudo onde nome livro começe com um caracter qualquer e o segundo caracter seja I e o resto depois so I tendo 0 ou mais carcateres não importa



