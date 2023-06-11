# MODOS DE PARÂMETRO DE FUNÇÃO PL/PGSQL: IN,OUT,INOUT

 RESUMO = Neste tutorial, você vai aprender sobre os modos de parâmetros de funções, incluindo: in, out, e inout;
 
* INTRODUÇÃO AOS MODOS DE PARÂMETRO PL/PGSQL:

 - Os modos de parâmetro determinam o comportamento dos parâmetros.
   PL / pgSQL suporta três modos de parâmetros: in, out, e inout. 
   Um parâmetro assume o in modo por padrão se você não o especificar explicitamente;
   
 - MODO IN
 
   - função que encontra um filme por seu id e retorna o titulo do filme:
   
    -- paramentro da função INT, como não especificou o modo do paramentro ele assume por padrão o modo
	-- IN
	-- retorno da Função VARCHAR
    CREATE OR REPLACE FUNCTION encontrar_filme_por_id(id_filme INT)
	RETURN VARCHAR
	LANGUAGE plpgsql
	AS $$
	DECLARE
	     -- variavel de tipo coluna, pega o tipo de dado da coluna
		 titulo_filme film.title%TYPE
    BEGIN
	    -- econtra o filme por id, e atribui o resultado encontrado,
		-- pela consulta na variavel
		SELECT title INTO titulo_filme
		FROM film WHERE film_id = id_filme;
    
	-- se o id do filme não for encontrado
	IF NOT found THEN
	   RAISE NOTICE 'Filme de id % não foi encontrado',id_filme;
	END IF;
	 -- retorna o titulo do filme encontrado, de acordo com o id informado
	 RETURN title;
	 END; $$
		
 - MODO OUT
 
   - Os out parâmetros são definidos como parte da lista de argumentos e são retornados como parte do resultado.
   - Os outparâmetros são muito úteis em funções que precisam retornar vários valores.
   - SINTAXE:
   
     OUT nome_parametro TIPO 
	 
   - exemplo de função que possui tres paramentros DE MODO OUT
   
     CREATE OR REPLACE FUNCTION obter_estatisticas_filmes(OUT tamanho_minimo INT
											   ,OUT tamanho_maximo INT,
											    OUT media_tamanho numeric)
	 LANGUAGE plpgsql
	 AS
	 $$
	 BEGIN
	    SELECT 
		      MIN(length),
			  MAX(lengtH),
			  AVG(length)::NUMERIC(5,1) -- cast de typo de dado da coluna
		INTO 
		    -- os reultados de cada coluna que o select traz vai ser atribuido aos paramentros da função;
		    -- parametros da função vão receber os resultados das colunas;
			-- atribuir os resultados para os correspondetes OUT paramentros definidos;
			-- paramentro 1 da função recebe resultado da coluna 1 do select istrução;
			-- .
			-- .
			-- .
		    tamanho_minimo,
			tamanho_maximo,
			media_tamanho
		FROM film;
	 END;$$
	 
	 - CHAMANDO FUNÇÃO
	 - A SAIDA DA FUNÇÃO E UM REGISTRO
	 - PARA SEPARA A SAIDA NO CASO O REGISTRO EM COLUNAS, PARA MELHOR VISUALIZAÇÃO, EU USO A SEGUINTE ISTRUÇÃO:
	  
	   SELECT * FROM obter_estatisticas_filmes();
	   
  - MODO INOUT
  
    - O MODO INOUT é a combinação IN e OUT modos;
	- Isso significa que o chamador pode passar um argumento para uma função. A função altera o argumento e retorna o valor atualizado.
	 
	 - exemplo
	 
	 CREATE OR REPLACE FUNCTION troca(INOUT x INT,INOUT y INT)
	 LANGUAGE plpgsql
	 AS $$
	 BEGIN
	 -- SELECIONA os parametros x e y, e atribui os seus valores,
	 -- aos paramentros da função trocando a ordem dos parametros na atribuição;
	     SELECT x,y INTO y,x;
	 END;$$;
	 
  
  - O PARAMETRO NO MODO IN se quiser passar um valor para a função;
  - USE O PARAMENTRO NO MODO OUT se quiser retornar um valor de uma função;
  - USE O PARAMENTRO NO MODO INOUT quando quiser, passar um valor inicial, atualizar o valor na função e retornar o valor ATUALIZADO;
  