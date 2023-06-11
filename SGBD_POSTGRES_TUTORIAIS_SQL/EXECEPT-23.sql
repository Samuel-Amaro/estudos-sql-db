# neste tutorial, você aprenderá como usar o EXCEPToperador PostgreSQL para retornar as linhas da primeira consulta que não aparecem na saída da segunda consulta;

* Introdução ao operador EXCEPT do PostgreSQL 
  - Como os operadores UNION e INTERSECT , o EXCEPToperador retorna linhas comparando os conjuntos de resultados de duas ou mais consultas
  - O EXCEPT operador retorna linhas distintas da primeira consulta (esquerda) que não estão na saída da segunda consulta (direita);
  
  - SINTAXE:
    
	SELECT 
	      seleciona_lista_colunas
	FROM 
	    nome_tabela_a
    EXCEPT 
	SELECT 
	     seleciona_lista_colunas
    FROM 
	    nome_tabela_b;
		
   - As consultas que envolvem a EXCEPT necessidade de seguir estas regras:
     1 - O número de colunas e suas ordens devem ser iguais nas duas consultas;
	 2 - Os tipos de dados das respectivas colunas devem ser compatíveis;

* Exemplos de operadores PostgreSQL EXCEPT

 - A declaração a seguir usa o EXCEPToperador para encontrar os filmes de melhor classificação que não são populares:
 
  SELECT 
        *
  FROM 
      filmes_melhor_classificacao
  EXCEPT 
  SELECT 
         *
  FROM 
      filmes_mais_populares;
	  
Use o EXCEPToperador PostgreSQL para obter as linhas da primeira consulta que não aparecem no conjunto de resultados da segunda consulta.

 
	 
   