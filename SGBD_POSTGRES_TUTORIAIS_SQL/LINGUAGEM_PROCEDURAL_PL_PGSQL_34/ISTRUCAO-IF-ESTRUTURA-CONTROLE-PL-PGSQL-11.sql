# ISTRUÇÃO IF

 RESUMO = neste tutorial, você aprenderá como usar as if instruções PL / pgSQL para executar um comando baseado em uma condição específica;
 
 - A if instrução determina quais instruções executar com base no resultado de uma expressão booleana;
 
 - 3 FORMAS DE IF DA PL/pgSQL:
 
  * IF THEN
  * IF THEN ELSE
  * IF THEN ELSIF
  
 1) DECLARAÇÃO IF-THEN PL/PgSQL
 
  - FORMA MAIS SIMPLES DA IF DECLARAÇÃO:
  
   IF condição THEN
      afirmações;
   END IF;
   
   - A if instrução é executada afirmações se a condição for verdadeiro.
     Se o condition avaliar para false, o controle é passado para a próxima instrução após a END if parte.
	 
   - CODIÇÃO e uma expressão BOOLEANA AVALIADA COMO VERDADEIRO OU FALSO;
   
   - AS AFIRMAÇÕES pode ser uma ou mais instruções que serão executadas se o CONDIÇÃO for verdadeiro.
       Pode ser qualquer declaração válida, até mesmo outra if declaração.
	   
   - Quando uma if instrução é colocada dentro de outra if instrução, ela é chamada de instrução if aninhada.
   
   - EXEMPLO:
   
     DO $$
	 DECLARE 
	   -- variavel declarada pelo tipo da linha da tabela film
	   filmes_selecionados film%ROWTYPE;
	   -- variavel declarada tendo o tipo de dado da coluna id da tabel film copiado
	   entrada_id_filme film.film_id%type := 0;
	 BEGIN
	   
	   -- seleciona filmes que possuim o id de entrada especificado no caso
	   -- id 0	   
	   SELECT * FROM film INTO filmes_selecionados 
	   WHERE film_id = entrada_id_filme;
	   
	   -- estrutura de controle de condição
	   -- se o filme de id 0 não for encontrado, mostra mensagem
	   -- found varivel global que esta disponivel na liguagem de procedimento
	   -- PL/pgSQL;
	   
	   IF NOT found THEN
	      RAISE NOTICE 'o filme % não foi encontrado',entrada_id_filme;
	   END IF;
	   END $$;
	   
	   
   2) ISTRUÇÃO IF-THEN-ELSE
   
     - SINTAXE:
	 
	   IF condição THEN
	      afirmações;
	   ELSE
	      afirmações-alternativas;
	   END IF;
	   
	   - A if then else instrução executa as instruções na if ramificação se for condição avaliada como verdadeira; caso contrário, ele executa as instruções no else ramo.
	   
	   - EXEMPLO:
	   
	   DO $$
	   DECLARE
	     -- VARIAVEL DECLARADA PELO TIPO DA LINHA DA TABELA FILM
	     filme_selecionado film%ROWTYPE;
		 -- VARIAVEL DECLARADA PELO TIPO DA COLUNA id COM VALOR INICIAL 100
		 id_entrada_filme film.film_id%TYPE := 100;
	   BEGIN
	      -- seleciona um filme de acordo com o valor de id da variavel
		  -- id_entrada_filme, e atribui a linha de resultado selecionada
		  -- a varivel filme_selecionado que e do tipo linha da tabela film
	      SELECT * FROM film
		  INTO filme_selecionado
		  WHERE film_id = id_entrada_filme;
		  
		  -- SE O FILME DE id_entrada_filme(100) não for encontrado mostra mensagem
		  IF NOT FOUND THEN
		     RAISE NOTICE 'Filme % não foi encontrado',id_entrada_filme;
		  -- se o filme for econtrado mostra mensagem
		  ELSE
		      -- a variavel filme_selecionado e do tipo linha, isso e e um conjunto de resultados com colunas mas de uma linha so,
			  -- com isso posso acessar os campos(colunas da linha selecionda no SELECT e atribuida a variavel)
		     RAISE NOTICE 'O FILME ENCONTRADO POSSUI O TITULO  %',filme_selecionado.title;
		  END IF;
		END $$;
		  
   3) ISTRUÇÃO PL/PGSQL IF-THEN-ELSIF
   
     - SINTAXE:
	 
	 IF condição_1 THEN
	    afirmação_1;
     ELSIF condição_2 THEN
	     afirmação_2;
	 ...
	 ELSIF condição_n THEN
	     afirmação_n;
     ELSE
	     afirmação_alternativa;
     END IF;
	 
	 - As declarações ife ifthen elseavaliam uma condição. No entanto, a if then elsifinstrução avalia várias condições;
	 
	 - Se a conditionfor verdadeiro, a instrução correspondente nessa ramificação será executada.
	 
	 - Por exemplo, se condition_1for, trueentão if then ELSifexecuta a instrução_1 e para de avaliar as outras condições.
	 
	 - Se todas as condições forem avaliadas como false, o if then elsifexecuta as instruções na elseramificação.;
	 
	 DO $$
     DECLARE
	     -- VARIAVEL DE TIPO LINHA DA TABELA FILM
         film_v film%ROWTYPE;
		 -- varivel 
         descricao varchar(100);
     BEGIN
	    -- SELECIONA O FILME DE ID 100, E ATRIBUI A LINHA DE RESULTADO SELECIONADA DA TABELA, QUE VEM COMO UM CONJUNTO DE DADOS EM FORMATO DE LINHA
		-- ATRIBUI ESSE RESULTADO A VARIAVEL
  		select * from film
  		into film_v
  		where film_id = 100;
  
    -- SE O ID DO FILME NÃO FOR ENCONTRADO
  	IF NOT FOUND THEN
    	 RAISE NOTICE 'Filme não encontrado';
  	-- SE O ID DO FILME FOR ENCONTRADO
	ELSE
	   -- A DURAÇÃO DO FILME FOR ENTRE ESSE INTERVALOR E CLASSIFICADO COMO SHORT
	   -- ATRIBUID VALOR A VARIVEL DESCRIÇÃO
       IF film_v.length > 0 AND film_v.length <= 50 THEN
		 descricao := 'Short';
	   -- A DURAÇÃO DO FILME FOR ENTRE ESSE INTERVALOR E CLASSIFICADO COMO SHORT
	   -- ATRIBUI VALOR A VARIVEL DESCRIÇÃO 
	   ELSIF film_v.length > 50 AND film_v.length < 120 THEN
		    descricao := 'Medium';
	   -- A DURAÇÃO DO FILME FOR ENTRE ESSE INTERVALOR E CLASSIFICADO COMO SHORT
	   -- ATRIBUID VALOR A VARIVEL DESCRIÇÃO
	   ELSIF film_v.length > 120 THEN
		     descricao := 'Long';
	   -- se o filme não tiver a sua duraçao em nenhum dos intervalos classificados
	   -- acima, mostra a descrição de que não existe
	   ELSE 
		   descricao := 'N/A';
	   END IF;
    
	  -- no final de tudo mostra o filme e a descrição que ele se encaixou de acordo com as estruturas de desição e controle
	  -- que ele se encaixou
	  RAISE NOTICE 'The % film is %.',
	     film_v.title,  
	     descricao;
  END IF;
  END $$;
	 
	 
	 
		  