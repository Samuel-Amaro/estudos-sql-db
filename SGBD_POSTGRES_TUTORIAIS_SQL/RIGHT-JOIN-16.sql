* você aprenderá a usar o PostgreSQL RIGHT JOIN para selecionar dados de duas tabelas.

 - CONFIGURANDO TABELAS DE AMOSTRA

 -- DROP TABLE IF EXISTS films;
 -- DROP TABLE IF EXISTS film_reviews;

 -- criando tabela 01
 CREATE TABLE filmes(
   film_id SERIAL PRIMARY KEY,
   titulo varchar(255) NOT NULL
 );
 -- inserindo valores na tabela 01
 INSERT INTO filmes(titulo)
 VALUES('Joker'),
      ('Avengers: Endgame'),
      ('Parasite');
	  
 -- criando tabela 02
 CREATE TABLE criticas_filmes(
   critica_id SERIAL PRIMARY KEY,
   filme_id INT,
   critica VARCHAR(255) NOT NULL	
 );
 -- inserindo valores na tabela 02
 INSERT INTO criticas_filmes(filme_id,critica)
 VALUES(1, 'Excellent'),
      (1, 'Awesome'),
      (2, 'Cool'),
      (NULL, 'Beautiful');

* Um filme pode ter zero ou muitas críticas e uma crítica pertence a zero ou um filme.

* MOSTRANDO CONTEUDO DAS TABELAS CRIADAS:
SELECT * FROM filmes;

SELECT * FROM criticas_filmes;

* A instrução a seguir usa o RIGHT JOIN para selecionar dados das tabelas filmes e criticas_filmes:

 SELECT critica,titulo FROM filmes AS F
 RIGHT JOIN criticas_filmes AS CF 
 ON CF.filme_id = F.film_id; 
 
 - filmes e a tabela da esquerda e criticas_filmes tabela da direita;
 - Para cada linha da tabela da direita (criticas_filme), ele verifica 
   se o valor na film_id coluna da tabela criticas_filme  é igual ao 
   valor na film_id coluna de cada linha da tabela da esquerda (filmes).
 
 - Se eles forem iguais, o RIGHT JOIN cria uma nova linha que contém colunas de ambas as tabelas especificadas na SELECT cláusula e inclui essa nova linha no conjunto de resultados.
 - Caso contrário, o RIGHT JOIN ainda cria uma nova linha que contém colunas de ambas as tabelas e inclui essa nova linha no conjunto de resultados. No entanto, ele preenche as colunas da tabela à esquerda ( films) com NULL.

* PostgreSQL RIGHT JOIN com cláusula WHERE:
 
  - Para encontrar as linhas da tabela da direita que não possuem nenhuma linha correspondente na tabela da esquerda, você adiciona uma WHEREcláusula como esta:
  - encontrar criticas que não possuem filme associado, criticas nulas:
  
  SELECT critica,titulo FROM filmes AS F
  RIGHT JOIN criticas_filmes AS CF
  ON CF.filme_id = F.film_id 
  WHERE titulo IS NULL;
  
  

 

