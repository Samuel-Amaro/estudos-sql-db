# SOBRECARGA DE FUNÇÃO PL/PGSQL

 RESUMO = neste tutorial, você aprenderá sobre a sobrecarga de funções no PostgreSQL.
 
* INTRODUÇÃO Á SOBRECARGA DE FUNÇÃO PL/PGSQL

 - O PostgreSQL permite que várias funções compartilhem o mesmo nome, desde que tenham argumentos diferentes;
 - Se duas ou mais funções compartilham o mesmo nome, os nomes das funções ficam sobrecarregados;
 - Quando você pode chamar uma função de sobrecarga, o PostgreSQL seleciona a melhor função candidata a ser executada com base na lista de argumentos da função.
 
 - Exemplo - função que retorna o total de dias de alugel de um cliente espcificado
 
 CREATE OR REPLACE FUNCTION obter_duracao_aluguel(id_cliente INTEGER)
 RETURNS INTEGER
 LANGUAGE plpgsql
 AS $$
 DECLARE
        -- declaração de uma variavel
		duracao_aluguel INTEGER;
 BEGIN
    -- SELECIONA O NUMERO DE DIAS DE ALUGUEL DE UM CLIENTE,
	-- INFORMADO POR PARAMENTRO, VIA SEU ID
     SELECT
	       SUM(EXTRACT(DAY FROM return_rate - rental_date))
		   INTO duracao_aluguel
	 FROM rental
	 WHERE
	      customer_id = id_cliente;
	
	-- retorna a variavel para que chamar
	RETURN duracao_aluguel;
 END;$$
		
 -- chamando a função que acabou de ser criada
 -- quero saber a duração de alguel do cliente 5
 SELECT obter_duracao_aluguel(5);
 

 -- SUPONHA QUE EU QUEIRA SABER A DURAÇÃO DO ALUGUEL DE UM CLIENTE DE UMA DATA ESPECIFICA ATÉ AGORA
 
 -- EXISTE DUAS FORMAS DE FAZER ISSO, ADD MAIS UM PARAMENTRO A FUNÇÃO obter_duracao_aluguel(),
 -- OU EU POSSO DESENVOLVER UMA NOVA FUNÇÃO COM O MESMO NOME, MAS COM DOIS PARAMENTROS
 
 CREATE OR REPLACE FUNCTION obter_duracao_aluguel(id_clienter INTEGER,da_data DATE)
 RETURNS INTEGER
 LANGUAGE plpgsql
 AS $$
 DECLARE
      -- variavel
      duracao_aluguel INTEGER;
 BEGIN
     -- obtendo a duração do aluguel com base no id_cliente
	 -- e obter a data do aluguel tambem
	 SELECT SUM(EXTRACT(DAY FROM return_date + '12:00:00' - rental_date))
	 INTO duracao_aluguel
	 FROM rental
	 WHERE customer_id = id_cliente AND rental_rate >= da_data;
  
  -- retorna a duração do aluguel em dias
  RETURN duracao_aluguel;
  END; $$

  - ESSA FUNÇAÕ ACIMA TEM O MESMO NOME DA PRIMERA, EXCETO POR TER DOIS PARÃMENTROS;
  
  - a função obter_duracao_aluguel(integer) ESTA sobrecarragada pela função
   obter_duracao_aluguel(integer,date);
   
   SELECT obter_duracao_aluguel(232,'2005-07-01');
     
 
 