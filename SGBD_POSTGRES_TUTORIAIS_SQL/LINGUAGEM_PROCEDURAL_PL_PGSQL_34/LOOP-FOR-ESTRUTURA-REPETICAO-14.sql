# LOOP FOR PL/PGSQL

 RESUMO = neste tutorial, você aprenderá sobre as for instruções de loop PL / pgSQL para iterar em um intervalo de inteiros ou em um conjunto de resultados de uma consulta;
 
* USANDO LOOP PARA ITERAR EM UMA INTERVALO DE INTEIROS

 - SINTAXE LOOP FOR:
 
 [<<LABEL>>]
 FOR contador_lopp IN [REVERSE] FROM.. TO[BY STEP] LOOP
     afirmações;
 END LOOP[label];
 
 - o loop for cria uma variavel inteira contador_loop, que e acessivel apenas dentro do loop.
   por padrão o for, adiciona o step ao contadr_loop, apos cada iteração. no entando eu uso a opção
   reverse, o loop for subtrai o step de contador_loop;
 - o from e to são expressões que especificam os limites iferior e superior do intervalo.
  o loop for avalia essas expressões antes de entrar no loop;
 - step que segue a by palavra-chave especifica a etapa da iteração. o padrão e 1. o for loop
  avalia esta step expressão apenas uma vez;
  
 - EXEMPLO A SGUIR USA O LOOP FOR ISTRUÇÃO PARA ITERAR CINCO NÚMEROS DE 1 A 5 e EXIBIR CADA UM DELES EM CADA ITERAÇÃO:
 
  DO $$
  BEGIN
     FOR contador IN 1..5 LOOP
	    RAISE NOTICE 'Contador: %',contador;
	 END LOOP;
  END;$$
  
 - EXEMPLO A SEGUIR ITERA MAIS DE 5 NUMEROS DE 5 A 1 E MOSTRA CADA NUMERO EM CADA ITERAÇÃO:
 
  DO $$
  BEGIN
     FOR contador IN 5..1 LOOP
	    RAISE NOTICE 'Contador: %',contador;
	 END LOOP;
  END; $$
  
 - EXEMPLO QUE USA O LOOP FOR PARA ITERAR SEIS NUMEROS DE 1 A 6. E ADICIONAR 2 AO CONTADOR APOS CADA ITERAÇÃO:
 
 DO $$
  BEGIN
     FOR contador IN 1..6 BY 2 LOOP
	    RAISE NOTICE 'Contador: %',contador;
	 END LOOP;
  END; $$
  
* USANDO PL/PGSQL PARA LOOP PARA ITERAR SOBRE UM CONJUNTO DE RESULTADOS:

 * A instrução a seguir mostra como usar a forinstrução loop para iterar em um conjunto de resultados de uma consulta:
 
  [<<LABEL>>]
  FOR target IN query LOOP
     afirmações
  END LOOP [<<label>>];
  
  - USANDO O LOOP FOR PARA EXIBIR OS TITULOS DOS 10 FILMES MAIS LONGOS:
  
   DO
   $$
   DECLARE
     f RECORD; -- tipo de varivel registro, uma linha completa de resultado de uma tabela qualquer, o tipo da linha vai ser definido quando o f receber a linha, ai vai ter o tipo definido corretmanete
	           -- por enquanto so se sabe que e um tipo de dado de linha de registro de tabela
   BEGIN
       FOR f IN (SELECT title,length 
	            FROM film 
				ORDER BY length DESC, title
				LIMIT 10) -- consulta que retorna todos registros(resultados), selecionados, da tabela, cada linha selecinada ou registro selecionado e atribuido a f, a cada iteração, isso e, a variavel f, vai a cada iteração receber um registro(resultado) da consulta;
	   LOOP
	      -- mostrando cada registro(resultado) na interação do loop FOR
	       RAISE NOTICE '%(% Minutos)',f.title,f.length;
	   END LOOP;
   END;
   $$
   
	 

 
