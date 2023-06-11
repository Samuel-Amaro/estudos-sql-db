# PostgreSQL Drop View;

* neste tutorial, você aprenderá como usar a DROP VIEWinstrução PostgreSQL para remover uma ou mais visualizações do banco de dados;

* Introdução à instrução PostgreSQL DROP VIEW:
 
  - A DROP VIEW instrução remove uma visão do banco de dados. O seguinte ilustra a sintaxe da DROP VIEW instrução:
    
	DROP VIEW [IF EXISTS] nome_view
	[CASCADE | RESTRICT];
	
	1. especificar o nome da view
	2. so vai apagar uma view se ele se somente se existir IF EXISTS
	3 - a opção RESTRICT opção de regeitar remoção da visualização se huver
	algum objeto dependendo dela. A RESTRICT opção e o padrão.
	SE USAR a opção CASCADE a DROP VIEW remove automaticamente os objetos que dependem
	da visualização e todos os objetos que dependem desses objetos;
	
  - PARA PODER REMOVER VARIAS VIEW DE UMA SO VEZ:
  
    DROP VIEW [IF EXISTS] nome_view1, nome_view2, ...;
	

  - CRIANDO UMA VIEW - QUE MOSTRA OS FILMES PRINCIPAIS:
    
	1. film - armazena dados dos filmes
	2. film_category - armazena relações entre filmes e categorias;
	
	CREATE VIEW filmes_principais
	AS
	   SELECT
	         tbl_filmes.film_id AS "ID Filme", 
			 tbl_filmes.title AS "Titulo Filme",
			 tbl_filmes.release_year AS "Ano Lançamento Do Filme",
			 tbl_filmes.length AS "Duração Do Filme",
			 tbl_categoria.name AS "Categoria Filme"
	   FROM
	       film AS tbl_filmes
       INNER JOIN
	            film_category AS tbl_Categorias_filmes
	   ON
	      tbl_filmes.film_id = tbl_Categorias_filmes.film_id
	   INNER JOIN
	       category AS tbl_categoria
	   ON
	     tbl_Categorias_filmes.category_id = tbl_categoria.category_id;
		 
	- CRIANDO OUTRA VIEW BASEADA EM UMA DEFINIÇÃO(A CONSULTA) E OS DADOS
	 QUE UMA VIEW EXISTENTE JA POSSUI DEFINIDA:
	  
	  - ESSA VIEW FAZ UMA FILTRAGEM NOS FILMES PRINCIPAIS, PARA TRAZER FILMES SO DE 
	    CATEGORIA HORROR:
		
		  CREATE VIEW filmes_horror
		  AS
		    SELECT 
			      "ID Filme",
				  "Titulo Filme",
				  "Ano Lançamento Do Filme",
				  "Duração Do Filme",
			      "Categoria Filme"
			FROM
			    filmes_principais
			WHERE
			    "Categoria Filme" = 'Horror';
	
	- CRIANDO OUTRA VIEW BASEADA NA VIEW filmes_principais APLICANDO
	  UMA FILTRAGEM NA VIEW filmes_principais para selecionar os dados dessa
	  VIEW onde so tenham filmes de categoria COMEDIA:
	  
	    CREATE VIEW filmes_comedia
		  AS
		    SELECT 
			      "ID Filme",
				  "Titulo Filme",
				  "Ano Lançamento Do Filme",
				  "Duração Do Filme",
			      "Categoria Filme"
			FROM
			    filmes_principais
			WHERE
			    "Categoria Filme" = 'Comedy';
	   
  - CRIANDO UMA VIEW QUE RETORNA O NUMERO DE FILMES POR CATEGORIA:
  
    CREATE VIEW filmes_por_categoria
	AS
	  SELECT 
	        tbl_Categoria.name AS "Categoria Filme",
			COUNT(tbl_filmes.film_id) AS "Quantidade Filmes"
	  FROM
	      category AS tbl_Categoria
	  INNER JOIN
	            film_category AS tbl_categoria_filmes
	  ON
	    tbl_Categoria.category_id = tbl_categoria_filmes.category_id
	  INNER JOIN
	    film  AS tbl_filmes
	  ON
	    tbl_filmes.film_id = tbl_categoria_filmes.film_id
	  GROUP BY "Categoria Filme";
		
  - CRIANDO UMA VIEW QUE RETORNA A DURAÇÃO TOTAL DOS FILMES PARA CADA
    CATEGORIA:
	
	CREATE VIEW estatistica_duracao_filme
	AS
	SELECT 
	      tbl_categoria.name AS "Nome Categoria Filme",
		  SUM(tbl_filme.length) AS "Duracao Filme"
    FROM
	    category AS tbl_categoria
    INNER JOIN 
	         film_category AS tbl_categoria_filme
	ON
	  tbl_categoria.category_id = tbl_categoria_filme.category_id
	INNER JOIN
	    film AS tbl_filme
    ON
	   tbl_filme.film_id = tbl_categoria_filme.film_id
	GROUP BY
	       tbl_categoria.name;
		
* 1) Usando PostgreSQL DROP VIEW para eliminar uma visão

  - O exemplo a seguir usa a DROP VIEW instrução para descartar a comedy_film visualização:
  
	DROP VIEW filmes_comedia;		    
	
* 2) Usando a instrução PostgreSQL DROP VIEW para eliminar uma visão que possui objetos dependentes
  
  - A seguinte instrução usa a DROP VIEW instrução para remover a filmes_principais visualização:
  
    DROP VIEW filmes_principais;
	
	- essa istrução acima vai dar um erro, porque a view filmes_principais tem um
	  objeto dependente que e a view filmes_horror.
	  
	- para remover a view filmes_principais, eu preciso soltar, apagar, remover
	   o objeto dependente ou usar a CASCADE opção como esta:
	
	   DROP VIEW filmes_principais
	   CASCADE;
	   
	   - essa istrução elimina a filmes_principais view, bem  como seu objeto dependente
	   que é o filme_horror:
	   
	    
* 3) Usando PostgreSQL DROP VIEW para eliminar múltiplas visualizações

   DROP view estatistica_duracao_filmes, categoria_filme_estatistica;