# neste tutorial, você aprenderá como usar o INTERSECT operador PostgreSQL para combinar conjuntos de resultados de duas ou mais consultas;

* Introdução ao operador INTERSECT do PostgreSQL
 
  - Como os operadores UNION e EXCEPT , o INTERSECT operador PostgreSQL combina conjuntos de resultados de duas ou mais instruções SELECT em um único conjunto de resultados;
  - O INTERSECT operador retorna todas as linhas disponíveis em ambos os conjuntos de resultados.
  
  - SINTAXE:
  
  SELECT 
        select_lista_colunas
  FROM 
      nome_tabela_A
  INTERSECT 
      SELECT 
	       select_lista_colunas
	  FROM 
	     nome_tabela_B;
 - Para usar o INTERSECT operador, as colunas que aparecem nas SELECT instruções devem seguir as seguintes regras:
   
   1 . O número de colunas e sua ordem nas SELECT cláusulas devem ser iguais. 
   2 . Os tipos de dados das colunas devem ser compatíveis.
   
* PostgreSQL INTERSECT com cláusula ORDER BY

  - Se você deseja classificar o conjunto de resultados retornado pelo INTERSECT operador, coloque o ORDER BY na consulta final na lista de consultas assim:
  
   SELECT
        seleciona_lista_colunas
   FROM 
      nome_tabela_a
   INTERSECT
   SELECT
         seleciona_listas_colunas
   FROM 
       nome_tabela_b
   ORDER BY
        expressao_ordenacao;
		
* Exemplos de operador PostgreSQL INTERSECT

 - Para obter filmes populares que também são filmes bem avaliados, você usa a INTERSECToperadora da seguinte maneira:
 
  SELECT 
        *
  FROM 
       filmes_mais_populares
  INTERSECT
  SELECT 
        *
  FROM 
      filmes_melhor_classificacao;

 - O conjunto de resultados retorna um filme que aparece em ambas as tabelas;
 
 - Neste tutorial, você aprendeu como usar o INTERSECToperador PostgreSQL para combinar conjuntos de resultados retornados por várias consultas;
 
