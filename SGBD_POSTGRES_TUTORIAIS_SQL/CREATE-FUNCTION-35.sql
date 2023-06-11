# DECLARAÇÃO DA CREATE FUNCTION(CRIAR FUNÇÃO) PostGreSql

  RESUMO = neste tutorial, você aprenderá como usar a CREATE FUNCTION instrução PostgreSQL para desenvolver funções definidas pelo usuário.
  
  * INTRODUÇÃO Á ISTRUÇÃO CREATE FUNCTION
  
    - A create function instrução permite que você defina uma nova função definida pelo usuário.
	
	- SINTAXE:
	
	 CREATE [OR REPLACE] FUNCTION nome_função(lista_parametros)
	    RETURN tipo_retorno
		LANGUAGE plpgsql
	 AS
	 $$
	 DECLARE
	   -- declaração de variaveis
	 BEGIN
	  -- logica
	 END;
	 $$
	 
	 - primeiro especifique o nome da função;
	 - especifique a lista de parametros da função, uma função pode ter zero ou muitos parâmetros;
	 - especificar o tipo de dados do valor retornado;
	 - usar o language plpgsql para especificar a linguagem procedural da função;
	 - colocar um bloco na costante da string citada em dólares;
	 
  * EXEMPLOS DE ISTRUÇÕES DA FUNÇÃO POSTGRESQL CREATE:
  
   - criar uma função que conta os filmes cuja duração entre os parametros :
   
   
   CREATE FUNCTION obter_contagem_filmes(de INT, para INT)
   RETURNS INT
   LANGUAGE plpgsql
   AS
   $$
   DECLARE
       -- variavel 
	   contador_filmes INTEGER;
	   
   BEGIN
   
      -- consulta que busca filmes que possua sua duração
	  -- dentro do intervalo especificado, o resultado da consulta,
	  -- e atribuido a variavel;
      SELECT COUNT(*) INTO contador_filmes
	  FROM film
	  WHERE length BETWEEN de AND para;
	  
   RETURN contador_filmes;
   END;
   $$;
   
   -- dois parametros na função de tipo inteiros;
   -- função retorna a varivel do tipo INTEIRO;
   
   
   * COMO CHAMAR A FUNÇÃO CRIADA:
   
      1) USANDO NOTAÇÃO POSICIONAL
	  
	     - Para chamar uma função usando a notação posicional, você precisa especificar os argumentos na mesma ordem dos parâmetros. Por exemplo:
		 
		 SELECT obter_contagem_filmes(40,90);
		 
		 - Você chama uma função usando a notação posicional quando a função tem poucos parâmetros;
		 
	  2) USANDO NOTAÇÃO NOMEADA:
	  
	     - Se a função tiver muitos parâmetros, você deve chamá-la usando a notação nomeada, pois isso tornará a chamada da função mais óbvia.
		 
		 SELECT obter_contagem_filmes(
		     de => 40, -- primeiro paramentro recebe como argumento o valor 40
			 para => 90 -- segundo paramentro recebe como argumento o valor 90			 
		 );
		 
		 -- usa o => para serapar o nome do argumento e seu valor;
		 
	  
	    
	   