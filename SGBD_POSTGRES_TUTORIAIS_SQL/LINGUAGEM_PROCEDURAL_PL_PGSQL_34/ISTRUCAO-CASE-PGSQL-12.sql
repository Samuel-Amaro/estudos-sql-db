# ISTRUÇÃO (CASE) PGSQL

 RESUMO = neste tutorial, você aprenderá sobre o PL / pgSQL caseque executa instruções com base em uma determinada condição;
 
 * Além da instrução if , o PostgreSQL fornece caseinstruções que permitem a execução de um bloco de código baseado em uma condição;
 
 * A caseinstrução seleciona uma whenseção a ser executada em uma lista de whenseções com base em uma condição;
 
 * Observe que você não deve confundir a case declaração e a expressão case . A caseexpressão é avaliada como um valor enquanto a caseinstrução seleciona uma seção para executar com base na condição;
 
 1) DECLARAÇÃO DE CASE SIMPLES
 
  - SINTAXE DA ISTRUÇÃO CASE SIMPLES:
  
   CASE busca_expressão
        WHEN expressão_1 [,expressão_2,...] THEN
		     afirmações_da_when
		[...]
		[ELSE
		   afirmações_do_else]
   END CASE;
 
   - busca_expressão(e uma expressão que avalia um resultado);
   - a CASE istrução compara o resultado de busca_expressão com o expression em cada when ramificação usando o operador igual(=);
   - se a CASE encontrar uma correspondencia, ela executara a seção when correspondente, e para de comparar o resultado da busca_Expressão com as expressões restantes;
   - se a CASE não encontrar nenhuma correspondencia, ela executara a ELSE seção;
   - COMO A ELSE E OPCIONAL. SE CASO A ELSE NÃO EXISTIR ELE LAMÇARA A ISTRUÇÃO CASE GERARÁ case_not_found exceção;
   
   
   - EXEMPLO DE UMA DECLARAÇÃO SIMPLES DE CASE:
   
    DO $$
	DECLARE 
	  -- variaveis declaradas
	  taxa film.rental_rate%type; -- variavel tem seu tipo de dado baseado no tipo dos valores da coluna informada
	  segmento_preco VARCHAR(50);
	
	BEGIN
	   -- OBTENDO A TAXA DE ALUGUEL, do REGISTRO DE ID 100, e add, o resultado
	   -- do SELECT em uma variavel
	   SELECT rental_rate INTO taxa FROM film WHERE film_id = 100;
	   
	   -- atribuindo um segmento de preço, de acorco com o valor da taxa informada
	   IF found THEN
		    CASE taxa
			   WHEN 0.99 THEN
			      segmento_preco = 'Em Massa';
			   WHEN 2.99 THEN
			      segmento_preco = 'Convencional';
			   WHEN 4.99 THEN
			      segmento_preco = 'Alta Qualidade';
			   ELSE
			      segmento_preco = 'Não Especificado Segmento';
			   END CASE;
			   -- lançando uma mensagem de noticia
			   RAISE NOTICE 'O Segmento Preco Atribuido: %',segmento_preco;
       END IF;
	 END; $$
	 

 2) DECLARAÇÃO DE ISTRUÇÃO CASE PESQUISADA:
 
   - SINTAXE:
   
    CASE 
	    WHEN expressao_booleana_1 THEN
		    afirmações
		[WHEN expressao_boleana_2 THEN
		    afirmações
		    ...]
		[ELSE
		     afirmações]
	    END CASE;
		
		- A CASE ISTRUÇÃO avalia as expressões booleanas, ate encontrar uma expressão que avalie com TRUE;
		- depois de encontrar expressão avaliada como true a CASE executa WHEN seção correspondente e para imediatamente de pesquisar as expressões restantes;
		- se nenhuma istrução for avaliada como verdadeira executara a else seção;
		- se não houver else levantara a exceção CASE_NOT_FOUND;
		
		- EXEMPLO DE USO DA ISTRUÇÃO CASE SIMPLES:
		
		DO $$
		DECLARE
		   -- variaveis declaradas
		   pagamento_total NUMERIC;
		   nivel_servico VARCHAR(25);
		BEGIN
		   -- seleciona o pagamento total do cliente de id 100,
		   -- e atribui o resultado dessa consulta a variavel,
		   -- pagamento total
		   SELECT SUM(amount) INTO pagamento_total
		   FROM Payment
		   WHERE customer_id = 100;
		
		   -- atribuindo o nivel de servico de acordo com o pagamento
		   -- total, com o valor que possui na variavel
		   IF found THEN
		      CASE
			      WHEN pagamento_total > 200 THEN
				       nivel_servico = 'Platinio';
				  WHEN pagamento_total > 100 THEN
				       nivel_servico = 'Ouro';
				  ELSE
				     nivel_servico = 'Silver';
		   END CASE;
		        -- lança uma mesagem para usuario do tipo noticia
				RAISE NOTICE 'Nivel Serviço: %',nivel_servico;
		   ELSE
		       -- lança uma mensagem de tipo noticia
		       raise notice 'Cliente Não Existe';
		   END IF;
	  END; $$
				