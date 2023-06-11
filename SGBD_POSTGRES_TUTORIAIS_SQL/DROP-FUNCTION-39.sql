# DROP FUNCTION - APAGAR UMA FUNÇÃO CRIADA

 RESUMO = neste tutorial, você aprenderá como usar a drop functioninstrução PostgreSQL para remover uma função.
 
* INTRODUÇÃO Á DECLARAÇÃO DA FUNÇÃO DROP:

 - PARA REMOVER UMA FUNÇÃO DEFINIDA PELO USUARIO, EU USO A DROP FUNCTION
 - SINTAXE:
 DROP FUNCTION [IF EXISTS] nome_função(lista_Argumentos)
 [CASCADE | RESTRICT]
 
 - PARA ELIMINAR A FUNÇÃO E SEUS OBEJTOS DEPENDETENS, EU PRECISO ESPECIFICAR A CASCADE OPÇÃO;
 - REMOVERA RECURSIVAMENTE A FUNÇÃO E SEUS OBEJTOS DEPENDENTES E OS OBJETOS QUE DEPENDEM DESSES OBJETOS;
 - POR PADRÃO A DROP FUNCTION USA A RESTRICT OPÇÃO QUE REJEITA A REMOÇÃO DE UMA FUÇÃO QUANDO ELA POSSUI OBJETOS DEPENDETES;
 
 - EXEMPLOS DE FUNÇAÕ DROP
 
 - CRIANDO UMA FUNÇÃO QUE RETORNA UM CONJUNTO DE FILMES
 
 CREATE OR REPLACE FUNCTION obter_filme_atores()
 RETURNS SETOF record -- record tipo de dado de uma linha, um tipo registro, que recebe uma linha completa de dados, de uma tabela
 AS $$
 DECLARE
      -- varivel
	  -- tipo de dado que e uma conjunto de resultados, e um tipo de dado de uma linha de uma tabela, que armazena, um unico registro com varios dados de colunas
	  rec RECORD;
 begin
   for rec in select 
			film_id, 
			title, 
            (first_name || ' ' || last_name)::varchar
		from film
		inner join film_actor using(film_id)
		inner join actor using (actor_id)
		order by title
	loop
        return next rec;
	end loop;
	
	return;
 end;
 $$ 
 language plpgsql;
 
 
 - A instrução a seguir define uma função com o mesmo nome get_film_actors. No entanto, ele aceita um id de filme como argumento:
 
 create or replace function get_film_actors(p_fiml_id int)
	returns setof record
as $$
declare
   rec record;
begin
   for rec in select 
			film_id, 
			title, 
            (first_name || ' ' || last_name)::varchar
		from film
		inner join film_actor using(film_id)
		inner join actor using (actor_id)
		where film_id = p_fiml_id
		order by title
	loop
        return next rec;
	end loop;
	
	return;
end;
$$ 
language plpgsql;

- TENTANDO APAGAR A FUNCTION CRIADA:

 DROP FUNCTION obter_filmes_atores();
 
 - eliminado a outra FUNCTION
 DROP FUNCTION get_film_actors(); 
 