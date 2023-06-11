# CONTINUE PL/PGSQL

 RESUMO = neste tutorial, você aprenderá como usar a continueinstrução PL / pgSQL para controlar o loop.
 
* INTRODUÇÃO AO PL/PGSQL ISTRUÇÃO CONTINUE:

 - A continue instrução pula prematuramente a iteração atual do loop e pula para a próxima. A continue instrução pode ser usada em todos os tipos de loops, incluindo loops incondicionais, loops while e loops for .
  
  - SINTAXE:
    
	 CONTINUE [label_loop] [WHEN condition]

    - label_loop e WHEN CONDITION são opcionais;
	
  - O loop_labelé o rótulo do loop que você deseja ignorar a iteração atual. Se você omitir o loop_label, a continue instrução pula a iteração atual do loop. Se você especificar um rótulo de loop, a instrução continue ignora a iteração atual desse loop.
  - O condition é uma expressão booleana que especifica a condição para pular a iteração atual do loop. Se condition for true, o continue irá ignorar a iteração do loop atual.
  
 * EXEMPLO DE ISTRUÇÃO PL/PGSQL CONTINUE:
 
  - EXEMPLO QUE IMPRIME NUMEROS IMPARES DE 1 A 10:
  
   DO 
   $$
   DECLARE
      -- variavel
      contador INT = 0;
   BEGIN
       LOOP
	      contador = contador + 1;
		  -- se o contador for maio que 10 sai do loop
		  EXIT WHEN contador > 10;
		  -- pula a iteração atual se o contador for um numero par
		  CONTINUE WHEN MOD(contador,2) = 0; -- mod(contador,2) retorna o resto da divisão de contador / 2
		  -- mostra o numero impar da iteração
		  RAISE NOTICE '%',counter;
	    END LOOP;
   END;
   $$