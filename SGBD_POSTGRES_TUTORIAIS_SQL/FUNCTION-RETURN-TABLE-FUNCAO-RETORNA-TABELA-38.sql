# COMO DESENVOLVER UMA FUNÇÃO QUE RETORNA UMA TABELA

 RESUMO = neste tutorial, você aprenderá a desenvolver funções PostgreSQL que retornam uma tabela.
 
 - SINTAXE:
 
 CREATE OR REPLACE FUNCTION nome_função(lista_paramentros)
 RETURN TABLE (lista_colunas)
 LANGUAGE plpgsql
 AS $$
 DECLARE
   -- declaração de variaves
 BEGIN
   -- corpo
 END; $$
 
 - Em vez de retornar um único valor, esta sintaxe permite retornar uma tabela com uma lista de colunas especificada:
 
  RETURNS TABLE (lista_colunas)
  
  
 - EXEMPLO
 - A FUNÇÃO A SEGUIR RETORNA TODOS OS FILMES CUJOS TITULOS CORRESPONDEM A UM PADRÃO
   PARTIUCLAR USANDO O OPERADOR ILIKE
   
   CREATE OR REPLACE FUNCTION obter_filme(padrao VARCHAR)
   -- COLUNAS DA TABELA QUE A FUNÇAÕ VAI RETORNAR
   RETURNS TABLE (
                 film_title VARCHAR, -- titulo do filme
	             filme_release_year INT -- ano de lançamento do filme
   )
   LANGUAGE plpgsql
   AS $$
   BEGIN
        RETURN QUERY
		  -- CONSULTA QUE SELECION UM FILME DE ACORDO COM UM TITULO INFORMADO
		  -- USANDO O OPERADOR ILIKE
		       SELECT
   			         title,
					 release_year::integer -- cast de tipo varchar -> integer
                FROM
				   film
				WHERE
				   title ILIKE padrao;
	END; $$
 
 -- TESTANDO A FUNÇÃO CRIADA
 
 -- QUERO SELECIONAR FILMES QUE COMEÇEM COM AL e terminem com qualquer caracter frase ou palavra
 -- so quero filmes que começem por AL
 
 SELECT * FROM obter_filme('Al%');
 