# neste tutorial, você aprenderá como usar o operador PostgreSQL UNION para combinar conjuntos de resultados de várias consultas em um único conjunto de resultados

 * Introdução ao operador UNION do PostgreSQL:
 
  - O UNION operador combina conjuntos de resultados de duas ou mais SELECT instruções em um único conjunto de resultados.
  
  - SINTAXE: O seguinte ilustra a sintaxe do UNION operador que combina conjuntos de resultados de duas consultas:
  
  SELECT select_list_1_colunas
  FROM nome_tabela_1
  UNION
  SELECT select_list_2_colunas
  FROM nome_tabela_2;
  
  - Para combinar os conjuntos de resultados de duas consultas usando o UNION operador, as consultas devem estar em conformidade com as seguintes regras:
    1 .  O número e a ordem das colunas na lista de seleção de ambas as consultas devem ser iguais.
	2 .  Os tipos de dados devem ser compatíveis.
  - O UNION operador remove todas as linhas duplicadas do conjunto de dados combinado. Para reter as linhas duplicadas, use o UNION ALL.
  
* PostgreSQL UNION com cláusula ORDER BY:
  - Para classificar linhas no conjunto de resultados final, você usa a ORDER BYcláusula na segunda consulta.
  - Na prática, você costuma usar o UNIONoperador para combinar dados de tabelas semelhantes, que não são perfeitamente normalizadas;
  
* Configurando tabelas de amostra:
  - CRIANDO DUAS TABELAS DE AMOSTRA PARA PODER TRABALHAR COM ELAS;
  
 
  CREATE TABLE filmes_melhor_classificacao(
              titulo VARCHAR NOT NULL,
	          ano_lancamento SMALLINT
  );
  
 CREATE TABLE filmes_mais_populares(
             titulo VARCHAR NOT NULL,
	         ano_lancamento SMALLINT
 );
 
 INSERT INTO 
   filmes_melhor_classificacao(titulo,ano_lancamento)
 VALUES
   ('The Shawshank Redemption',1994),
   ('The Godfather',1972),
   ('12 Angry Men',1957);
   
 INSERT INTO
   filmes_mais_populares(titulo,ano_lancamento)
 VALUES
    ('An American Pickle',2020),
    ('The Godfather',1972),
    ('Greyhound',2020);
   
 - MOSTRANDO OS DADOS DAS TABELAS:
 SELECT * FROM filmes_melhor_classificacao;
 
 SELECT * FROM filmes_mais_populares;
 
 
* EXEMPLOS DE POST GRES SQL UNION:
 
  - EXEMPLO 01: EXEMPLO SIMPLES DE POSTGRE SQL UNION: A ISTRUÇÃO A SEGUIR
  USA O UNION OPERADOR PARA COMBINAR DADOS DE AMBAS AS TABELAS:
  
  SELECT * FROM filmes_melhor_classificacao
  UNION
  SELECT * FROM filmes_mais_populares;

  - EXEMPLO 02: EXEMPLO UNION ALL DO POSTGRESQL: A ISTRUÇÃO A SEGUIR USA O UNION ALL OPERADOR PARA COMBINAR
  CONJUNTOS DE RESULTADOS DAS TABELAS filmes_melhor_classificacao e filmes_mais_populares:
  
  SELECT * FROM filmes_melhor_classificacao
  UNION ALL 
  SELECT * FROM filmes_mais_populares;
  
  Neste exemplo, a linha duplicada é retida no conjunto de resultados.
  
  - EXEMPLO 03: POSTGRESQL UNION ALL COM EXEMPLO DE CLAUSULA ORDER BY: Para classficar,
  o resultado pelo UNION operador, você coloca a ORDER by Clausula final da ultima consulta assim:
  
  SELECT * FROM filmes_melhor_classificacao
  UNION ALL
  SELECT * FROM filmes_mais_populares
  ORDER BY titulo;
  
  - Se você colocar a ORDER BYcláusula no final de cada consulta, o conjunto de resultados combinado não será classificado como você esperava;
  - Porque quando o UNIONoperador combina os conjuntos de resultados classificados de cada consulta, ele não garante a ordem das linhas no conjunto de resultados final;
  
  

