* DECLARAÇÃO ASSERT

 RESUMO = neste tutorial, você aprenderá sobre a instrução assert do PostgreSQL e como usá-la para fins de depuração;
 
* INTRODUÇÃO Á ASSERT DECLARAÇÃO:

 - A assertdeclaração é um atalho útil para inserir verificações de depuração no código PL / pgSQL:
 
 - SINTAXE DA ISTRUÇÃO ASSERT:
 
  ASSERT condição[,MESSAGE];
  
  - 1) CONDIÇÃO:
      
	  - condição e uma expressão booleana que deve sempre retornar true;
	  
	  - Se for condição avaliado como true, a assert instrução não fará nada.
	  
	  - Caso o valor condição seja false ou null, o PostgreSQL levanta uma assert_failure exceção.
	  
  - 2) MENSAGEM
  
      - A MENSAGEM E OPCIONAL
	  
	  - Se você não passar o message, o PostgreSQL usa a assertion failedmensagem “ ” por padrão. Caso passe o messagepara o assertdemonstrativo, ele o utilizará para substituir a mensagem padrão;
	  
	  - Observe que você deve usar a assertinstrução apenas para detectar bugs, não para relatar;
	  
* EXEMPLO DE DECLARAÇÃO DE DECLARAÇÃO DO POSTGRESQL:

  - EXEMPLO QUE USA A ASSERT ISTRUÇÃO PARA VERIFICAR SE A TABELA film CONTEM DADOS:
  
   DO $$
   DECLARE
     -- VARIAVEL QUE ARMAZENA QUANTIDADE DE FILMES
     contagem_filmes INTEGER;
   BEGIN
       -- seleciona a quatidade de filmes da tabela, e armazena na variavel
       SELECT COUNT(*)
	   INTO contagem_filmes
	   FROM film;
	   
	   -- verificando se a quatidade de filmes na tabela e maior que 0
	   -- onde > 0 e porque a tabela possui filmes(dados)
	   ASSERT contagem_filmes > 0, 'Nenhum filme Encontrado, Check sua tabela film';
	   END $$;
	  
   - EXEMPLO A SEGUIR EMITE UM ERRO PORQUE O NUMERO DE FILMES NA TABELA E MENOR QUE 1000;
   
     DO $$
     DECLARE
        -- VARIAVEL QUE ARMAZENA QUANTIDADE DE FILMES
        contagem_filmes INTEGER;
     BEGIN
       -- seleciona a quatidade de filmes da tabela, e armazena na variavel
       SELECT COUNT(*)
	   INTO contagem_filmes
	   FROM film;
	   
	  -- verificando se a quatidade de filmes na tabela e maior que 1000
	  -- onde > 1000 e porque PRECISO DE MAIS DE 1000 FILMES
	  ASSERT contagem_filmes > 1000, 'SUA TABELA NÃO POSSUI 1000 FILMES';
	  END $$;
   