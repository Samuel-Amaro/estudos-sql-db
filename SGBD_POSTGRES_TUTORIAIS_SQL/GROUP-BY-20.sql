# você aprenderá a dividir linhas em grupos usando a GROUP BY cláusula PostgreSQL.

* Introdução à GROUP BY cláusula PostgreSQL
  
  - A GROUP BY cláusula divide as linhas retornadas da SELECT instrução em grupos;
  - Para cada grupo, você pode aplicar uma função de agregação, por exemplo,   SUM()para calcular a soma dos itens ou COUNT() obter o número de itens nos grupos;
  
  - SINTAXE:
  
  SELECT column_1,column_2 ...,funcao_agregacao(coluna_3)
  FROM nome_tabela
  GROUP BY
  coluna_1,
  coluna2,
  ...;
  
  -- selecione as colunas que deseja agrupar no caso coluna1 e coluna2 e coluna3 que vai ter função agregada;
  -- lista as colunas que deseja agrupar na GROUPY BY clausula;
  
  - A cláusula de instrução divide as linhas pelos valores das colunas especificadas na GROUP BYcláusula e calcula um valor para cada grupo;
  - É possível usar outras cláusulas da SELECT instrução com a GROUP BY cláusula;
  
  - AVALIAÇÃO DAS CLAUSULAS NAS CONSULTAS COM GROUPY BY:
  FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> DISTINCT -> ORDER BY -> LIMIT
  

* GROUP BY Exemplos de cláusula PostgreSQL

 1 - Usando PostgreSQL GROUP BY sem um exemplo de função agregada
   
    - Você pode usar a GROUP BY cláusula sem aplicar uma função agregada. A consulta a seguir obtém dados da tabela PAYMENT e agrupa o resultado por id do cliente;
	
	SELECT 
	       customer_id AS "id_cliente"
	FROM 
	    payment AS "FORMA_PAGAMENTO"
    GROUP BY 
	       customer_id;
		   
   - Nesse caso, GROUP BY funciona como a DISTINCT cláusula que remove linhas duplicadas do conjunto de resultados.
   
  2 -  Usando PostgreSQL GROUP BY com SUM() exemplo de função
     
	 - A GROUP BY cláusula é útil quando é usada em conjunto com uma função agregada.
	 
	 - Por exemplo, para selecionar o valor total que cada cliente recebeu, 
	   você usa a GROUP BY cláusula para dividir as linhas da TABELA payment(FORMA PAGAMENTO)
	   em grupos agrupados por id do cliente. 
	   Para cada grupo, você calcula os valores totais 
	   usando a SUM()função;
	   
	 - A consulta a seguir usa a GROUP BYcláusula para obter o valor total que cada cliente recebeu:
	 
	 SELECT 
	        customer_id AS "id_cliente",
	        SUM(amount) AS "TOTAL_CADA_CLIENTE"
	 FROM 
	     payment AS "FORMA_PAGAMENTO"
	 GROUP BY 
	         id_cliente;

	- A GROUP BY cláusula classifica o conjunto de resultados por id do cliente e soma o valor que pertence ao mesmo cliente. Sempre que as customer_idalterações, ele adiciona a linha ao conjunto de resultados retornado;
	
	- A instrução a seguir usa a ORDER BY cláusula com GROUP BY cláusula para classificar os grupos:
	
	SELECT 
	        customer_id AS "id_cliente",
	        SUM(amount) AS "TOTAL_CADA_CLIENTE"
	 FROM 
	     payment AS "FORMA_PAGAMENTO"
	 GROUP BY 
	         id_cliente
	 ORDER BY 
	        SUM(amount) DESC;
	 
  3) Usando a cláusula GROUP BY do PostgreSQL com a cláusula JOIN
  
    - O demonstrativo a seguir usa a GROUP BYcláusula com a INNER JOIN cláusula a obter o valor total pago por cada cliente.
	
	- Ao contrário do exemplo anterior, esta consulta une a paymenttabela à customertabela e agrupa os clientes por seus nomes:
	
	SELECT 
		   first_name || ' ' || last_name AS nome_completo, -- concatena coluna nome com coluna sobrenome 
		   SUM(amount) AS "TOTAL_CADA_CLIENTE"
    FROM
	    payment AS "FORMA_PAGAMENTO"
	INNER JOIN
	          customer AS Cliente
	USING 
	     (customer_id) -- as 2 tabelas possui a mesma coluna que vão ser referenciadas, uma PK outra FK
	GROUP BY 
	        nome_completo -- agrupa pelo nome de cada cliente
	ORDER BY
	        "TOTAL_CADA_CLIENTE" DESC; -- ORDENA PELO MAIOR TOTAL AO MENOR

   4) Usando PostgreSQL GROUP BYcom COUNT()exemplo de função
   
     - Para encontrar o número de transações de pagamento que cada equipe processou, agrupe as linhas da  payment tabela pelos valores da staff_id coluna e use a COUNT()função para obter o número de transações:
	 
	 SELECT 
	       staff_id AS id_equipe,
		   COUNT (payment_id) AS "TOTAL_PAGAMENTO_EQUIPE"
	 FROM 
	     payment AS PAGAMENTO
	 GROUP BY 
	        id_equipe;
		   
		   
     - A GROUP BYcláusula divide as linhas do pagamento em grupos e os agrupa por valor na staff_idcoluna;
	 - Para cada grupo, ele retorna o número de linhas usando a COUNT()função;
   
   5) Usando PostgreSQL GROUP BYcom colunas múltiplas
    
     -  O exemplo a seguir usa várias colunas na GROUP BY cláusula:
	 
	  SELECT 
	        customer_id AS id_pagamento, 
			staff_id AS id_equipe,
			SUM(amount) AS Montante
      FROM 
	      payment AS Pagamento
	  GROUP BY
	       id_equipe,
		   id_pagamento
	  ORDER BY
	          id_equipe;
   - Neste exemplo, a GROUP BYcláusula divide as linhas na paymenttabela pelos valores nas colunas customer_ide staff_id. Para cada grupo de (customer_id, staff_id), o SUM()calcula o valor total;
   
  6) Usando a cláusula GROUP BY do PostgreSQL com coluna de data
  
    - O payment_dateé uma coluna de carimbo de data / hora. Para agrupar pagamentos por datas, você usa a DATE()função para converter carimbos de data / hora em datas primeiro e depois agrupar pagamentos pela data de resultado:
	
	 SELECT 
	      DATE(payment_date) AS PAGAMENTO_DATA,
		  SUM(amount) AS Montante_total
	 FROM 
	     payment AS Pagamento
	 GROUP BY
	     DATE(payment_date);
		  
Neste tutorial, você aprendeu a usar a GROUP BYcláusula PostgreSQL para dividir linhas em grupos e aplicar uma função de agregação a cada grupo.

	 
			
	 
	 
	 
	 