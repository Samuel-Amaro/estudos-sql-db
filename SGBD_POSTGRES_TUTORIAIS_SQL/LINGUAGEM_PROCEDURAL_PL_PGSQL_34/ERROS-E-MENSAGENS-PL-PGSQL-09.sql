# ERROS E MENSAGENS PL/PGSQL

  RESUMO = neste tutorial, você aprenderá como relatar mensagens e levantar erros usando a raise instrução;
          Além disso, você aprenderá como usar a assertinstrução para inserir verificações de depuração em blocos PL / pg;
		 
* MENSAGENS DE RELATÓRIO

 - para levantar uma mensagem eu uso a RAISE INTRUÇÃO;
 
 RAISE LEVEL FORMAT;
 
 - NÍVEL(LEVEL):
 
   - apos a declaração RAISE, está a LEVEL opção que especifica a gravidade do ERRO:
   
   - O POSTGRESQL FORNECE OS SEGUINTES NÍVEIS:
   
     * debug;
	 
	 * log;
	 
	 * notice;
	 
	 * info;
	 
	 * warning;
	 
	 * exception;
	 
   - se eu não especificar o level por padrão a raise istrução usara o
     exception nivel que gera um erro e interrope a transação atual;

 - FORMATO(FORMAT):
 
   - o FORMAT é uma string que especifica a mensagem. o FORMAT usa % marcadores
     de posição percentuais () que serão substituidos pelos argumentos;
     o numero de marcadores de posição deve ser igual ao número de argumentos,
	 caso cntrario ocorre erro;
	
 - EXEMPLO DE ISTRUÇÃO RAISE QUE RELATA MENSAGENS:
 
  DO $$
  BEGIN
     RAISE INFO 'Mensage de Informação %', NOW();
	 RAISE LOG 'Message de LOG %',NOW();
     RAISE DEBUG 'Message de DEBUG %',NOW();
	 RAISE WARNING 'Message de Aviso %',NOW();
	 RAISE NOTICE 'Message de Noticia %',NOW();
  END $$;
  
* ERROS DE LEVANTAMENTO:

  - para gerar um erro, eu uso o exception nível após a RAISE ISTRUÇÃO.
     Observe que a raise instrução usa o exception nível por padrão.
	
  - Além de gerar um erro, você pode adicionar mais informações usando a seguinte cláusula adicional:
  
   USING OPTION = expressão
   
  - O OPTION PODE SER:
  
   * MESSAGE: definir mensagem de erro;
   * HINT: forneça a mensagem de dica para que a causa raiz do erro seja mais facil de ser descoberta;
   * DETAIL: fornece informações detalhadas sobre o erro;
   * ERRCODE: identifique o codigo de erro que pode ser pelo nome da condição
     ou diretamente pelo SQLSTATE CÓDIGO DE CINCO CARACTERES;
	 
  - EXEMPLO QUE GERA UMA MENSAGEM DE ERRO DE E-MAIL DUPLICADA:
  
    DO $$
	DECLARE
	   email VARCHAR(255) := 'info@postgressqltutorial.com';
	BEGIN
	  -- CHECANDO O EMAIL DUPLICADO
	  -- ...
	  --- MANDANDO MENSAGEM DE EMAIL DUPLICADO PARA O USUARIO:
	  RAISE EXCEPTION 'EMAIL DUPLICADO: %',email
	  USING HINT = 'check seu email';
	END $$;
  	