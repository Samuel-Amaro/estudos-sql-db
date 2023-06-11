# DECLARAÇÃO DE EXIT(SAIDA)

 RESUMO = neste tutorial, você aprenderá sobre a instrução de saída e como usá-la para encerrar um loop ou um bloco.
 
* INTRODUÇÃO A ISTRUÇÃO DE EXIT DA PL/PGSQL

 * A exit instrução permite que você termine um loop incluindo um loop incondicional , um loop while e um loop for .
 
 - SINTAXE:
 
   EXIT [label] [WHEN expressão_booleana]
   
   - o label e o rotulo do loop atual onde a exit esta ou o rotulo do loop externo;
   - dependendo do rotulo a, exit istrução encerrara o loop correspondente. se eu não usar o rotulo, a exit encerra o loop atual;
   - a WHEN expressão_boleana e usada para especificar uma condição que termina um loop.
     a exit so encerrar o loop se for expressão_boleana avaliado como True;
	 
   - EXEMPLO DE DECLARAÇÕES:
   
     EXIT WHEN contador > 10;
	 
	 IF contador > 10 THEN
	   EXIT;
	 END IF;
	 
	 - Além de encerrar um loop, você pode usar a exit instrução para encerrar um bloco especificado pelas begin...end palavras - chave. Nesse caso, o controle é passado para a instrução após a end palavra - chave do bloco atual:
	 
	 <<label_bloco>>
	 BEGIN
	     -- algum codigo
		 EXIT [label_bloco] [WHEN condição];
		 -- algum pouco mais de codigo
	 END block_label;
	 
* EXEMPLOS DE EXIT(SAIDA):

 1) USANDO A ISTRUÇÃO DE SAIDA PL/PGSQL PARA ENCERRAR UM LOOP INCONDICIONAL:
 
   DO 
   $$
   DECLARE 
     -- variveis
	 i INT = 0;
	 j INT = 0;
   BEGIN
      <<loop_externo>>
	  LOOP
	     i = i + 1;
		 -- para encerrar o loop externo
		 EXIT WHEN i > 3;
		 j = 0;
		 <<loop_interno>>
		 LOOP
		     j = j + 1;
			 -- para encerrar loop interno
			 EXIT WHEN j> 3;
			 -- lança mensagem usuario
			 RAISE NOTICE '(i,j): (%,%)',i,j;
		END LOOP loop_interno;
	END LOOP loop_externo;
  END;
  $$
  
  2) COLOCAR O ROTULO DO LOOP EXTERNO NA SEGUNDA ISTRUÇÃO EXIT:
  
  DO 
   $$
   DECLARE 
     -- variveis
	 i INT = 0;
	 j INT = 0;
   BEGIN
      <<loop_externo>>
	  LOOP
	     i = i + 1;
		 -- para encerrar o loop externo
		 EXIT WHEN i > 3;
		 j = 0;
		 <<loop_interno>>
		 LOOP
		     j = j + 1;
			 -- para encerrar loop externo
			 EXIT loop_externo WHEN j> 3;
			 -- lança mensagem usuario
			 RAISE NOTICE '(i,j): (%,%)',i,j;
		END LOOP loop_interno;
	END LOOP loop_externo;
  END;
  $$
  
  2) USANDO ISTRUÇÃO EXIT PARA SAIR DE UM BLOCO, ENCERRAR UM BLOCO:
  
  DO
  $$
  BEGIN
     <<bloco_simples>>
	 BEGIN
	     EXIT bloco_simples;
		 -- para fins de demostração
		 RAISE NOTICE '%','inacessivel!';
	 END;
	    RAISE NOTICE '%', 'Fim do Bloco';
  END;
  $$
   