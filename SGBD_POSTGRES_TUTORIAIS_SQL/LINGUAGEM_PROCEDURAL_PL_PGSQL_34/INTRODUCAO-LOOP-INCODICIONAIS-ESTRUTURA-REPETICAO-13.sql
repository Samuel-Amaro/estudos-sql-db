# ISTRUÇÃO DE LOOP PL/PGSQL

 RESUMO = neste tutorial, você aprenderá sobre a instrução de loop PL / pgSQL que executa um bloco de código repetidamente;
 
* INTRODUÇÃO A ISTRUÇÃO PL/PGSQL LOOP

 * O loop define um loop incondicional que executa um bloco de código repetidamente até ser encerrado por uma instrução exit ou return.
 
  - SINTAXE:
  
    <<label>>
	LOOP
	   afirmações
	END LOOP;
	
  - Normalmente, você usa uma ifinstrução dentro do loop para encerrá-lo com base em uma condição como esta:
  
   <<label>>
   LOOP
     afirmações;
	 IF condição THEN
	    exit;
     END IF;
	END LOOP;
	
  - É possível colocar uma instrução de loop dentro de outra instrução de loop. Quando uma loop instrução é colocada dentro de outra loop instrução, ela é chamada de loop aninhado:
  
    <<OUTER>> -> ROTULO DO LOOP EXTERNO
	LOOP
	   afirmações;
	   <<INNER>> -> ROTULO DO LOOP INTERNO
	   LOOP
	      /*...*/
	      EXIT <<INNER>>
	   END LOOP;
	END LOOP;
	
  - Quando você tem loops aninhados, você precisa usar o rótulo do loop para que possa especificá-lo na instrução exite continuepara indicar a qual loop essas instruções se referem.
  
   	
 * EXEMPLO DE ISTRUÇÃO DE LOOP PL/PGQL
 
  - exemplo que mostra como usar a loop istrução para calcular o número de sequ~encia de Fibonacci:
  
  DO $$
  DECLARE
    -- variaveis
	n INTEGER := 10;
	fib INTEGER := 0;
	quantidade INTEGER := 0;
	i INTEGER := 0;
	j INTEGER := 1;
  BEGIN
     IF(n < 1) THEN
	      fib := 0;
     END IF;
	 LOOP
	      -- loop se encerra quando
	      EXIT WHEN quantidade = n;
		  
		  quantidade := quantidade + 1;
		  SELECT j, i + j INTO i,j;
	 END LOOP;
	 fib := i;
   -- lança mensagem
   RAISE NOTICE '%',fib;
  END; $$