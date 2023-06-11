-- você aprenderá como usar a LEFT JOINcláusula PostgreSQL para selecionar dados de várias tabelas

-- Cada linha da tabela1 pode ter zero ou muitas linhas correspondentes na tabela,
-- 2 enquanto cada linha da tabela2 tem uma e apenas uma linha correspondente na tabela1.

-- Para selecionar dados da tabela1 que podem ou não ter linhas correspondentes na tabela2, você usa a  LEFT JOIN cláusula.

-- SINTAXE:

SELECT tabela1.coluna1,tabela1.coluna2,tabela2.coluna1,tabela2.coluna2
FROM tabela1 
INNER JOIN tabela2 ON tabela1.coluna1 = tabela2.coluna2;

Para juntar a tabela1  com a tabela2  usando uma LEFT JOIN, siga estas etapas:
 * Primeiro, especifique as colunas em ambas as tabelas das quais você deseja selecionar dados na SELECT cláusula;
 * Em segundo lugar, especifique a tabela à esquerda (tabela1) na FROM cláusula;
 * Terceiro, especifique a tabela certa (tabela B) na LEFT JOIN cláusula e a condição de JOIN após a ON palavra - chave;

A LEFT JOINcláusula começa selecionando dados da tabela à esquerda.
Para cada linha da tabela da esquerda, ele compara o valor da tabela1.coluna1
coluna com o valor de cada linha da tabela2.coluna2 coluna da tabela da direita.

Se esses valores forem iguais, a cláusula de junção à esquerda(LEFT JOIN) cria uma nova linha que contém colunas que aparecem na SELECT,
cláusula e adiciona essa linha ao conjunto de resultados.

Caso esses valores não sejam iguais, a cláusula left join também cria uma nova linha que contém as colunas que aparecem na SELECT cláusula.
Além disso, ele preenche as colunas que vêm da tabela certa com NULL.


-- EXEMPLOS USANDO LEFT JOIN
-- A instrução a seguir usa a LEFT JOINcláusula para unir filmtabela com a inventorytabela:
SELECT
	film.film_id,
	title,
	inventory_id
FROM
	film
LEFT JOIN inventory 
    ON inventory.film_id = film.film_id
ORDER BY title ASC;
	
Quando uma linha da filmtabela não possui uma linha correspondente na inventorytabela, o valor da inventory_idcoluna desta linha é NULL;

-- A seguinte declaração adiciona uma WHEREcláusula para localizar os filmes que não estão no inventário:
SELECT
	film.film_id,
	film.title,
	inventory_id
FROM
	film
LEFT JOIN inventory 
   ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL
ORDER BY title;

-- Esta técnica é útil quando você deseja selecionar linhas de uma tabela que não possuem linhas correspondentes em outra tabela.
