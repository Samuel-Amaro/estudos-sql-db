# você aprenderá a usar a cláusula HAVING do PostgreSQL para especificar uma condição de pesquisa para um grupo ou agregado;

* Introdução à cláusula HAVING do PostgreSQL

 - A HAVING cláusula especifica uma condição de pesquisa para um grupo ou agregado
   A HAVINGcláusula é freqüentemente usada com a GROUP BY cláusula para filtrar 
   grupos ou agregados com base em uma condição especificada;

 - SINTAXE HAVING:
  
   SELECT 
        coluna_1,
		fucao_agregacao (coluna_2)
   FROM 
       nome_tabela
   GROUP BY
          coluna_1
   HAVING 
         condica;
		 
  - Nessa sintaxe, a cláusula group by retorna linhas 
   agrupadas por column1. A HAVING cláusula especifica 
   uma condição para filtrar os grupos;
   
  -  É possível adicionar outras cláusulas da SELECT declaração como JOIN, LIMIT, FETCH etc.
  
  - Visto que a HAVING cláusula é avaliada antes da SELECT cláusula, você não pode usar aliases de coluna na HAVING cláusula. Porque no momento da avaliação da HAVING cláusula, os aliases de coluna especificados na SELECT cláusula não estão disponíveis.
  
* HAVING x WHERE

  - A WHERE cláusula permite filtrar linhas com base em uma condição especificada;
  - No entanto, a HAVING cláusula permite filtrar grupos de linhas de acordo com uma condição especificada.
  
  - Em outras palavras, a WHERE cláusula é aplicada a linhas enquanto a HAVING cláusula é aplicada a grupos de linhas.
  
*  Exemplos de cláusula HAVING do PostgreSQL
 
  1) Usando a cláusula HAVING do PostgreSQL com exemplo de função SUM
  
   - A consulta a seguir usa a GROUP BYcláusula com a SUM()função de encontrar o valor total de cada cliente:
   
     SELECT 
	      customer_id AS id_cliente,
		  SUM(amount) AS TOTAL_MONTANTE_CLIENTE
	 FROM 
	     payment AS Pagamento
	 GROUP BY
	        id_cliente;
  
  - A declaração a seguir adiciona a HAVING cláusula para selecionar os únicos clientes que estão gastando mais do que 200:
  
    SELECT 
	      customer_id AS id_cliente,
		  SUM(amount) AS TOTAL_MONTANTE_CLIENTE
	 FROM 
	     payment AS Pagamento
	 GROUP BY
	        id_cliente
	 HAVING 
	       SUM(amount) > 200;

 2) Cláusula PostgreSQL HAVING com exemplo COUNT
 
   - A consulta a seguir usa a GROUP BY cláusula para encontrar o número de clientes por loja:
   
    SELECT 
	      store_id AS id_loja,
		  COUNT (customer_id) AS QTD_TOTAL_CLIENTE
	FROM 
	    customer AS CLIENTE
	GROUP BY
	       id_loja;
		   
  - A instrução a seguir adiciona a HAVING cláusula para selecionar a loja que possui mais de 300 clientes:
   
   SELECT 
	      store_id AS id_loja,
		  COUNT (customer_id) AS QTD_TOTAL_CLIENTE
	FROM 
	    customer AS CLIENTE
	GROUP BY
	       id_loja
	HAVING
	     COUNT (customer_id) > 300;

A HAVING cláusula especifica uma condição de pesquisa para um grupo ou uma FUNÇÃO agregada retornada pela GROUP BY cláusula.
	
		  