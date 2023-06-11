# neste tutorial, você aprenderá como usar a ADD COLUMNinstrução PostgreSQL para adicionar uma ou mais colunas a uma tabela existente;

* Introdução à instrução PostgreSQL ADD COLUMN

 - PARA ADICIONAR UMA NOVA COLUNA EM UMA TABELA EXISTENTE USA-SE 
   A SINTAXE:
 
   ALTER TABLE 
              nome_tabela
   ADD COLUMN
             nome_nova_coluna tipo_dado restricao_coluna_se_tiver;
 
   - primeiro especifique o nome da tabela no qual deseja add a nova coluna;
   - segundo especifique o nome da coluna coluna, bem logo depois seu tipo de dado,
   e restrição apos as ADD COLUMN;
   
 - Quando você adiciona uma nova coluna à tabela, o PostgreSQL a anexa no final da tabela. O PostgreSQL não tem opção para especificar a posição da nova coluna na tabela.
 
 - Para adicionar várias colunas a uma tabela existente, você usa várias ADD COLUMN cláusulas na ALTER TABLE instrução da seguinte maneira:
 
   ALTER TABLE nome_Tabela
   ADD COLUMN nome_coluna1 tipo_Dado restricao,
   ADD COLUMN nome_coluna2 tipo_Dado restricao,
   ADD COLUMN nome_coluna3 tipo_Dado restricao,
   
   ...
   
   ADD COLUMN nome_coluna_n tipo_Dado restrição;
   
   
* Exemplos de instruções PostgreSQL ADD COLUMN

 - CRIANDO UMA NOVA TABELA COM DUAS COLUNAS:
 
   CREATE TABLE clientes (
          id SERIAL PRIMARY KEY,
	      nome_cliente VARCHAR NOT NULL
   );
   
 - ADICIONANDO UMA NOVA COLUNA CHAMADA telefone A TABELA CLIENTE:
 
   ALTER TABLE clientes
   ADD COLUMN telefone VARCHAR;
   
 - ADICIONANDO MAIS DUAS COLUNAS fax e email  A TABELA CLIENTES:
 
   ALTER TABLE clientes
   ADD COLUMN fax VARCHAR,
   ADD COLUMN email VARCHAR;
   
* Adicione uma coluna com a restrição NOT NULL a uma tabela que já possui dados

 - inserindo dados na tabela cliente:
 
   INSERT INTO clientes(nome_cliente)
   VALUES
        ('Apple'),
		('Samsung'),
		('Sony');
		
 - supondo que quero adicionar a coluna nome_contato a tabela clientes:
 
  ALTER TABLE clientes
  ADD COLUMN nome_contato VARCHAR NOT NULL;
  
  - vai ocorrer um erro poque a coluna nome_contato tem uma RESTRIÇÃO
  NOT NULL. isso quando o post gre adicona a coluna na tabela, esta nova
  coluna recebe NULL, oque viola a NOT NULL RESTRIÇÃO;
  
  - COMO RESOLVER ?
  
  - 1º PRIMEIRO ADICIONE A COLUNA SEM NOT NULL:
  
    ALTER TABLE clientes
	ADD COLUMN nome_contato VARCHAR;
 
  - 2º ATUALIZAR OS VALORES NA COLUNA nome_contato:
  
    UPDATE clientes
	SET nome_contato = 'John Doe'
	WHERE id = 1;
	
	UPDATE clientes
	SET nome_contato = 'Mary Doe'
    WHERE id = 2;
	
    UPDATE clientes
	SET nome_contato = 'Lily Bush'
	WHERE id = 3;
	
  - 3º DEFINA A RESTRIÇÃO NOT NULL PARA A COLUNA nome_contato:
  
    ALTER TABLE clientes
	ALTER COLUMN nome_contato SET NOT NULL;
	
		
		
		