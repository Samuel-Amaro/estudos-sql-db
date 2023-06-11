* DROP COLUMN: COMO REMOVER UMA OU MAIS COLUNAS DE UMA TABELA

* este tutorial mostra como usar a DROP COLUMN cláusula PostgreSQL na ALTER TABLEinstrução para remover uma ou mais colunas de uma tabela;

* Introdução à cláusula DROP COLUMN do PostgreSQL

 - SINTAXE:
 
  ALTER TABLE nome_tabela
  DROP COLUMN nome_coluna;
  
 - Quando você remove uma coluna de uma tabela, o PostgreSQL remove automaticamente todos os índices e restrições que envolvem a coluna eliminada.
 - Se a coluna que você deseja remover for usada em outros objetos de banco de dados, como visualizações , gatilhos , procedimentos armazenados , etc., você não pode descartar a coluna porque outros objetos dependem dela. 
 - Nesse caso, você precisa adicionar a CASCADEopção à DROP COLUMNcláusula para eliminar a coluna e todos os seus objetos dependentes:
 
 ALTER TABLE nome_tabela
 DROP COLUMN nome_coluna CASCADE;
 
 - Se você quiser eliminar várias colunas de uma tabela em um único comando, use várias DROP COLUMNcláusulas como esta:
 
 ALTER TABLE nome_tabela
 DROP COLUMN nome_coluna_1,
 DROP COLUMN nome_coluna_2,
 ...;
 
* EXEMPLOS DE DROP COLUMN:

 - configurando 3 tabelas para poder trabalhar com A DROP COLUMN:
 
 - cada livro tem apenas uma editora e cada editora pode publica muitos livros.
 - cada livro e atributido a uma categoria e cada categoria pode ter muito livros;
 
  CREATE TABLE publicacao(
    publisher_id serial PRIMARY KEY,
    name VARCHAR NOT NULL
  );

  CREATE TABLE categoria (
    category_id serial PRIMARY KEY,
    name VARCHAR NOT NULL
  );

  CREATE TABLE livros (
    book_id serial PRIMARY KEY,
    title VARCHAR NOT NULL,
    isbn VARCHAR NOT NULL,
    published_date DATE NOT NULL,
    description VARCHAR,
    category_id INT NOT NULL,
    publisher_id INT NOT NULL,
    FOREIGN KEY (publisher_id) 
       REFERENCES publicacao (publisher_id),
    FOREIGN KEY (category_id) 
       REFERENCES categoria (category_id)
  );
  
  - criando uma view para ter uma consulta ja salva com dados:
  CREATE VIEW informacoes_livros 
  AS SELECT
    book_id AS "ID LIVRO",
    title AS "TITULO LIVRO",
    isbn AS "ISBN LIVRO",
    published_date AS "DATA PUBLICAÇÃO",
    name AS "Nome"
  FROM
    livros b
  INNER JOIN publicacao 
     USING(publisher_id)
  ORDER BY title;
  
 - usando a view:
 SELECT * FROM informacoes_livros;
  
 - REMOVENDO A COLUNA category_id(id_Da_categoria) da tabela livro:
 
  ALTER TABLE livros
  DROP COLUMN category_id;
  
 - removendo a coluna publisher_id(id publicação) da tabela livro:
 
   ALTER TABLE livros
   DROP COLUMN publisher_id;
   
 - a view criada acima usa essa coluna publisher_id para sua consulta de definição,
   assim ela possui um objeto dependente dela, da coluna, assim para se apgar essa coluna,
   e so usando a CLAUSULA CASCADE:
   
   ALTER TABLE livros
   DROP COLUMN publisher_id CASCADE;
   
   - removendo varias colunas:
   
   ALTER TABLE livros
    DROP COLUMN isbn,
	DROP COLUMN description;
	

   
  