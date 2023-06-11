-- você aprenderá sobre os aliases de tabela do PostgreSQL e suas aplicações políticas;
-- Os aliases de tabela atribuem temporariamente novos nomes às tabelas durante a execução de uma consulta;
-- SINTAXE ALIAS DE TABELA:

nome_tabela AS novo_nome_alias;

-- Aplicações práticas de aliases de tabela:

-- 1: Usando aliases de tabela para o nome longo da tabela para tornar as consultas mais legíveis:
-- Se você deve qualificar um nome de coluna com um nome de tabela longo, pode usar um alias de tabela para economizar digitação e tornar sua consulta mais legível:
-- em vez de usar:
um_nome_muito_longo_tabela.nome_coluna
-- pode usar:
um_nome_muito_longo_tabela AS novo_nome
-- ao referenciar tabela pode usar o ALIAS:
nome_alias.nome_coluna

-- 2) Usando aliases de tabela em cláusulas de junção
-- Normalmente, você costuma usar uma cláusula de junção para consultar dados de várias tabelas que têm o mesmo nome de coluna;
-- Se você usar o mesmo nome de coluna que vem de várias tabelas sem qualificá-las totalmente, obterá um erro:
-- Para evitar esse erro, você precisa qualificar essas colunas usando a seguinte:
-- SINTAXE:
nome_tabela.nome_coluna
-- Para tornar a consulta mais curta, você pode usar os aliases de tabela para os nomes de tabela listados em FROMe INNER JOIN cláusulas
-- exemplo:
SELECT a.a,a.fruta_a,b.b,b.fruta_b
FROM cesta_a AS a INNER JOIN cesta_b AS b
ON a.a = b.b;


