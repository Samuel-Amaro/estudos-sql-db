# ESTRUTURA DE BLOCO PL/PGSQL

 RESUMO = * neste tutorial, você aprenderá sobre a estrutura de blocos do PL / pgSQL e como escrever e executar seu primeiro bloco PL / pgSQL;
 
* PL / pgSQL é uma linguagem estruturada em blocos, portanto, uma função PL / pgSQL ou procedimento armazenado é organizado em blocos;

 - SINTAXE DE UM BLOCO COMPLETO EM PL/pgSQL;
 
 [<<label>>]
 [DECLARE
    declarations]
  BEGIN
    afirmações;
	   ...
  END [label];
  
  - cada bloco possui duas seções: declaração e corpo;
    declaração e opcional, a seção de corpo e obrigatoria;
	um bloco e finalizada com um ponto e virgula; apos o END
	
  - um bloco pode ter uma etiqueta(label) opcional localizada no inicio e final.
   
  - seção de declaração e onde eu declaro todas as variavies usadas na seção do corpo;
    cada istrução na seção de declração e encerrada com um ponto e virgula;
	
  - a seção do corpo e onde eu coloco o codigo;
     cada seção do corpo tambem e encerrada com um ponto e virgula;
	 
* EXEMPLO DE ESTRUTURA DE BLOCO PL/pgSQL

 - exemplo que ilustra um bloco muito simples.
 
 DO $$
 <<primeiro_bloco>>
 DECLARE
   qtd_filme INTEGER := 0; -- variavel inicialmente com valor 0
 BEGIN
   -- obtem o numero de filmes, atraves da SELECT INTO  e atribui a variavel 
   SELECT COUNT(*) INTO qtd_filme FROM film;
   -- exibir mensagem usando a RAISE NOTICE
   RAISE NOTICE 'o numero de filmes e %', qtd_filme;
 END primeiro_bloco $$;
 
 - OS BLOCOS PODEM SER ANINHADOS. UM BLOCO ANINHANDO E UM BLOCO COLOCADO DENTRO DO CORPO DE OUTRO BLOCO;
 
 
 
 
	 
	 
	 
	 