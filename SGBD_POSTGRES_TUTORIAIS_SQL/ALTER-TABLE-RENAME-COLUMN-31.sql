* POSTGRESQL - RENAME COLUMN RENOMEANDO UMA COLUNA

* neste tutorial, você aprenderá como usar a RENAME COLUMNcláusula PostgreSQL na ALTER TABLEinstrução para renomear uma ou mais colunas de uma tabela.

* INTRODUÇÃO A RENAME COLUMN CLAUSULA POSTGRESQL

 - SINTAXE:
 
 ALTER TABLE nome_tabela
 RENAME COLUMN nome_coluna TO novo_nome_coluna;
 
 - para renomear varias colunas:
 
   ALTER TABLE nome_tabela
   RENAME nome_coluna_01 TO novo_nome_coluna_01;
   
   ALTER TABLE nome_tabela
   RENAME nome_coluna_01 TO novo_nome_coluna_02;
   
   ALTER TABLE nome_tabela
   RENAME nome_coluna_01 TO novo_nome_coluna_03;
   
   - Se você renomear uma coluna referenciada por outros objetos de banco de dados, como visualizações , restrições de chave estrangeira , gatilhos e  procedimentos armazenados , o PostgreSQL alterará automaticamente o nome da coluna nos objetos dependentes.
   
  * EXEMPLOS USANDO RENAME COLUMN
  
    - criando duas novas tabelas
	
	CREATE TABLE grupo_clientes (
        id serial PRIMARY KEY,
        name VARCHAR NOT NULL
    );
	
	CREATE TABLE clientes(
     id serial PRIMARY KEY,
     name VARCHAR NOT NULL,
     phone VARCHAR NOT NULL,
     email VARCHAR,
     group_id INT,
     FOREIGN KEY (group_id) REFERENCES grupo_clientes (id)
    );
	
	- criando uma visão, para demostrar o uso de uma coluna com objeto pendentes:
	  
	  CREATE VIEW dados_clientes 
      AS SELECT
             c.id,
             c.name,
             g.name customer_group
         FROM
            clientes c
         INNER JOIN grupo_clientes g 
		  ON g.id = c.group_id;

1) Usando RENAME COLUMN para renomear um exemplo de coluna

 - A instrução a seguir usa a ALTER TABLE RENAME COLUMNinstrução para renomear a email coluna da customers tabela para contact_email:
   
   ALTER TABLE customers
   RENAME COLUMN email TO contact_email;
   
2) Usando RENAME COLUMN para renomear uma coluna que tem exemplo de objetos dependentes:

   ALTER TABLE grupo_clientes
   RENAME COLUMN name TO nome_grupo;
   
   
   
   