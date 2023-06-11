-- você aprenderá como selecionar dados de várias tabelas usando a cláusula PostgreSQL INNER JOIN;


-- Em um banco de dados de relacionamento, os dados são normalmente distribuídos em mais de uma tabela. Para selecionar dados completos, você geralmente precisa consultar dados de várias tabelas;
-- Neste tutorial, estamos nos concentrando em como combinar dados de várias tabelas usando a INNER JOIN cláusula;
-- SINTAXE:
SELECT tabela1.coluna1,tabela1.coluna2,tabela2.coluna1,tabela2.coluna2
FROM tabela1 
INNER JOIN tabela2 ON tabela1.coluna1 = tabela2.coluna2;

-- para juntar tabela1 com a tabela 2 tem seguir as etapas:
  -- Primeiro, especifique as colunas de ambas as tabelas para as quais deseja selecionar dados na SELECT cláusula;
  -- Em segundo lugar, especifique a tabela principal, ou seja, a tabela1 na FROM cláusula;
  -- Terceiro, especifique a segunda tabela (tabela2) na INNER JOIN cláusula e forneça uma condição de junção após a ON palavra - chave;
 
 -- COMO INNER JOIN FUNCIONA:
   -- Para cada linha da tabela1, a INNER JOIN compara o valor da coluna1 com o valor da coluna2 de cada linha da tabela2
   -- Se esses valores forem iguais, a junção interna cria uma nova linha que contém todas as colunas de ambas as tabelas e a adiciona ao conjunto de resultados;
   -- Caso esses valores não sejam iguais, a junção interna apenas os ignora e avança para a próxima linha;
   


-- EXEMPLOS DE USO DO INNER JOIN PARA JUNTAR DUAS TABELAS:

-- sempre que um cliente faz um pagamento, uma nova linha é inserida na paymenttabela;
-- Cada cliente pode ter zero ou muitos pagamentos. No entanto, cada pagamento pertence a um e apenas um cliente. A customer_idcoluna estabelece a relação entre as duas tabelas;
-- A instrução a seguir usa a INNER JOIN cláusula para selecionar dados de ambas as tabelas:

SELECT
	customer.customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	customer
INNER JOIN payment 
    ON payment.customer_id = customer.customer_id;
	
-- A consulta a seguir retorna o mesmo resultado. No entanto, ele usa aliases de tabela:
SELECT
	c.customer_id,
	first_name,
	last_name,
	email,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p 
    ON p.customer_id = c.customer_id
WHERE
    c.customer_id = 2;
	
	
-- EXEMPLO DE INNER JOIN PARA JUNTAR 3 TABELAS:
-- Para unir as três tabelas, você coloca a segunda INNER JOINcláusula após a primeira INNER JOINcláusula como a seguinte consulta:
SELECT
	c.customer_id,
	c.first_name customer_first_name,
	c.last_name customer_last_name,
	s.first_name staff_first_name,
	s.last_name staff_last_name,
	amount,
	payment_date
FROM
	customer c -- (PRIMEIRA TABELA)
INNER JOIN payment p -- (SEGUNDA TABELA) 
    ON p.customer_id = c.customer_id
INNER JOIN staff s -- (TERCEIRA TABELA)
    ON p.staff_id = s.staff_id;