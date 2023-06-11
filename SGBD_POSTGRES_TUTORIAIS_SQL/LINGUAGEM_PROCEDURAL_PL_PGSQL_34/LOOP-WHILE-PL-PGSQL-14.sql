# LOOP WHILE PL/PGSQL

 RESUMO = neste tutorial, você aprenderá sobre a while instrução de loop PL / pgSQL;
 
* INTRODUÇÃO AO PL/PGSQL WHILE LOOP:

 - A while instrução de loop executa um bloco de código até que uma condição seja avaliada como false;
 
 [<<LABEL>>]
 WHILE condição LOOP
     afirmações;
 END LOOP;
 
 - avalia a condição antes de executar as afirmações;
 - se a condição for verdadeira executa as afirmações. apos cada iteração
   o while loop avalia a condição novamente;
 - Dentro do corpo do while loop, você precisa alterar os valores de algumas variáveis para fazer o condição false ou null em alguns pontos. Caso contrário, você terá um loop indefinido.
 -  Como o while loop testa o condição antes de executar o statements, o while loop às vezes é chamado de loop de pré-teste;
 
* EXEMPLO DE LOOP WHILE:

 - mostra a istrução lopp para exibir um valor de um contador:
 
  DO $$
  DECLARE 
     -- variaveis
	 contador INTEGER := 0;
  BEGIN
     -- enquanto contador for menor que 5 execute o LOOP WHILE
     WHILE contador < 5 LOOP
	     -- lança mensagem a cada iteração do LOPP
		 RAISE NOTICE 'Counter %',contador;
		      contador := contador + 1;
	 END LOOP;
  END$$;
 
 