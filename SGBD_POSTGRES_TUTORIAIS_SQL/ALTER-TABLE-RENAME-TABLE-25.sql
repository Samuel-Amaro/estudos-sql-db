# Tabela de renomeação do PostgreSQL: um guia passo a passo;

* este tutorial mostra como renomear uma tabela usando a RENAME cláusula de tabela PostgreSQL da  ALTER TABLE instrução:

 - SINTAXE PARA RENOMEAR UMA TABELA USANDO A ISTRUÇÃO ALTER TABLE:
 
  ALTER TABLE 
             nome_tabela
  RENAME TO
           novo_nome_tabela;
  
  - primeiro especifica o nome da tabela que quero renomear;
  - em segundo da o novo nome da tabela APOS a clausula RENAME TO;
  
  - PARA EVITAR DE RENOMEAR UMA TABELA QUE NÃO EXISTE USAR A SINTAXE ABAIXO:
  
    ALTER TABLE IF EXISTS 
	                     nome_tabela
	RENAME TO 
	         novo_nome_tabela;

* Exemplos de renomeação de tabelas do PostgreSQL:

 - CRIANDO UMA NOVA TABELA PARA PODER TRABALHAR COM ELA:
 
   CREATE TABLE vendedores(
          id_vendedor SERIAL PRIMARY KEY,
	      nome VARCHAR NOT NULL
   );
	
 - PARA RENOMEAR A TABELA vendedores PARA fornecedores,
   USA-SE A ISTRUÇÃO:
   
    ALTER TABLE vendedores RENAME TO fornecedores;
	
 - Suponha que cada fornecedor ou fornecedor pertença 
  a um grupo de fornecedores. Para gerenciar esse 
  relacionamento, você precisa criar uma nova tabela
  grupo de fornecedores:
  
  CREATE TABLE grupo_fornecedores(
         id_grupo SERIAL PRIMARY KEY,
	     nome VARCHAR NOT NULL
  );
  
  - ADICIONANDO UMA NOVA COLUNA A TABELA fornecedores PORQUE AS TABELAS
    fornecedores e grupo_fornecedores estão relacionadas, essa coluna
	vai referenciar a chave primaria da tabela grupo_fornecedores,
	sendo que na tabela fornecedores vai ser chave estrangeira:
	
	ALTER TABLE fornecedores ADD COLUMN id_grupo_fornecedores INT NOT NULL;
	
	ALTER TABLE 
	           fornecedores
    ADD FOREIGN KEY 
	              (id_grupo_fornecedores) 
	REFERENCES 
	          grupo_fornecedores(id_grupo);   

  - PARA ECONOMIZAR TEMPO AO CONSULTAR DADOS COMPLETOS DO FORNECEDOR,
    VAMOS USAR UMA VIEW QUE VAI FAZER
	CONSULTA DE  DADOS DAS DUAS TABELAS USANDO O INNER JOIN PARA 
    OBTER CORRESPONDENCIAS DE AMBAS AS TABELAS:
	
	CREATE VIEW 
	           dados_fornecedores
	AS SELECT
	        F.id_vendedores,
			F.nome,
			GF.nome AS grupo_abastecimento
	FROM
	    fornecedores AS F
	INNER JOIN
	         grupo_fornecedores AS GF
	ON 
	  GF.id_grupo = F.id_vendedores;
	  
  - RENOMEANDO A TABELA grupo_fornecedores PARA grupos
  
    ALTER TABLE grupo_fornecedores RENAME TO grupos;
	
	