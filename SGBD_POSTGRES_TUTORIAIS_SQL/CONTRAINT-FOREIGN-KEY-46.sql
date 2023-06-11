# CHAVE ESTRANGEIRA POSTGRESQL - FOREIGN-KEY

 * RESUMO = neste tutorial, você aprenderá sobre chave estrangeira PostgreSQL e 
  como adicionar chaves estrangeiras a tabelas usando restrições de chave estrangeira.

 * INTRODUÇÃO Á RESTRIÇÃO DE CHAVE ESTRANGEIRA POSTGRESQL
 
 	 - Uma chave estrangeira é uma coluna ou grupo de colunas em uma tabela que faz referência à chave primária de outra tabela.
	 - A tabela que contém a chave estrangeira é chamada de tabela de referência ou tabela filha. E a tabela referenciada pela chave estrangeira é chamada de tabela referenciada ou tabela pai.
	 - Uma tabela pode ter várias chaves estrangeiras, dependendo de seus relacionamentos com outras tabelas.
	 - Uma tabela pode ter várias chaves estrangeiras, dependendo de seus relacionamentos com outras tabelas.
	 - Uma restrição de chave estrangeira indica que os valores em uma coluna ou grupo de colunas na tabela filho são iguais aos valores em uma coluna ou grupo de colunas da tabela pai.
	 
 * SINTAXE DE RESTRIÇÃO DE CHAVE ESTRANGEIRA POSTGRESQL
 
  - O seguinte ilustra uma sintaxe de restrição de chave estrangeira:
  
   [CONSTRAINT nome_fk]
   	 FOREIGN KEY(nome_coluna_fk)
	 REFERENCES nome_tabela_referencia_parente(nome_colunas_tabela_parente)
	 [ON DELETE acao_excluir]
	 [ON UPDATE acao_atualizar]
	 
  - NESTA SINTAXE ACIMA:
  
   - Primeiro, especifique o nome da restrição de chave estrangeira após a CONSTRAINT palavra - chave. A CONSTRAINTcláusula é opcional. Se você omiti-lo, o PostgreSQL atribuirá um nome gerado automaticamente.
   - Segundo, especifique uma ou mais colunas de chave estrangeira entre parênteses após as FOREIGN KEY palavras - chave.
   - Terceiro, especifique a tabela-pai e as colunas-chave-pai referenciadas pelas colunas-chave estrangeiras na REFERENCES cláusula.
   - Por fim, especifique as ações de exclusão e atualização nas cláusulas ON DELETE e ON UPDATE.
   
 - As ações de exclusão e atualização determinam os comportamentos quando a chave primária na tabela pai é excluída e atualizada. 
 Como a chave primária raramente é atualizada, o ON UPDATE action não é usado com frequência na prática. Vamos nos concentrar na ON DELETE ação.
 
 - PostgreSQL suporta as seguintes ações:
 
  SET NULL
  
  CONJUNTO PADRÃO - SET DEFAULT
  
  RESTRINGIR - RESTRICT
  
  NENHUMA AÇÃO - NO ACTION
  
  CASCATA - CASCADE
  
 * EXEMPLOS DE RESTRIÇÃO DE CHAVE ESTRANGEIRA POSTGRESQL
 
  - As seguintes instruções criam as tabelas customers(CLIENTES) e contacts(CONTATOS):
  
   -- cria a tabela cliente
   CREATE TABLE clientes_exemplo_fk(
   		id_cliente INT GENERATED ALWAYS AS IDENTITY,
	   	nome_cliente VARCHAR(255) NOT NULL,
	    PRIMARY KEY(id_cliente)
   ); 
   
   -- cria a tabela contatos
   CREATE TABLE contatos_exemplo_fk(
   		 id_contato INT GENERATED ALWAYS AS IDENTITY,
	   	 -- coluna que sera a fk
	     id_cliente INT,
	   	 nome_contato VARCHAR(255) NOT NULL,
	   	 telefone VARCHAR(15),
	   	 email VARCHAR(100),
	   	 PRIMARY KEY(id_contato),
	     -- criando a fk 
	   	 CONSTRAINT fk_clientes FOREIGN KEY(id_cliente) REFERENCES clientes_exemplo_fk(id_cliente)
   );
   
   - neste exemplo a tabela cliente e a tabela pai e a tabela contatos e a tabela filho
   
   - Cada cliente tem zero ou muitos contatos e cada contato pertence a zero ou um cliente.
   
   - A id_cliente coluna na contatos tabela é a coluna de chave estrangeira que faz referência à coluna de 
    chave primária com o mesmo nome na clientes tabela.
	
   - Como a restrição de chave estrangeira não tem a ação ON DELETE e ON UPDATE, o padrão é NO ACTION.
   
   - inserindo dados na tabela:
   
    INSERT INTO clientes_exemplo_fk(nome_cliente)
	VALUES('BlueBird Inc'), ('Dolphin LLC');	
 
 	INSERT INTO contatos_exemplo_fk(id_cliente,nome_contato,telefone,email)
    VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
	  
   - A seguinte declaração exclui o ID do cliente 1 da clientes tabela:
   
     DELETE FROM clientes_exemplo_fk
	 WHERE id_cliente = 1;
	 
   - Por causa do ON DELETE NO ACTION, o PostgreSQL emite uma 
    violação de restrição porque as linhas de 
	 referência do ID do cliente 1 ainda existem na 
	 contatos tabela.
    
 * SET NULL
 
   - O SET NULL define automaticamente NULL para as colunas de chave estrangeira nas linhas de referência da tabela filho quando as linhas referenciadas na tabela pai são excluídas.
   
   - As instruções a seguir eliminam as tabelas de amostra e 
    as recriam com a chave estrangeira que usa a SET NULL 
	ação na ON DELETE cláusula:

    -- apaga as tabelas
	DROP TABLE IF EXISTS contatos_exemplo_fk;
    DROP TABLE IF EXISTS clientes_exemplo_fk;

	-- recriando as tabelas
	
	-- cria a tabela cliente
   CREATE TABLE customers(
   		id_cliente INT GENERATED ALWAYS AS IDENTITY,
	   	nome_cliente VARCHAR(255) NOT NULL,
	    PRIMARY KEY(id_cliente)
   ); 
   
   -- cria a tabela contatos
   CREATE TABLE contacts(
   		 id_contato INT GENERATED ALWAYS AS IDENTITY,
	   	 -- coluna que sera a fk
	     id_cliente INT,
	   	 nome_contato VARCHAR(255) NOT NULL,
	   	 telefone VARCHAR(15),
	   	 email VARCHAR(100),
	   	 PRIMARY KEY(id_contato),
	     -- criando a fk 
	   	 CONSTRAINT fk_clientes FOREIGN KEY(id_cliente) REFERENCES customers(id_cliente)
	     ON DELETE SET NULL
   );
   
   -- inseri dados de clientes
   INSERT INTO customers(nome_cliente)
   VALUES('BlueBird Inc'),('Dolphin LLC');
   
   INSERT INTO contacts(id_cliente,nome_contato,telefone,email)
   VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
   (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
   (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
   
   - PARA VER COMO SET NULL funciona, vamos excluir o cliente com id 1 da tabela cliente:
   
    DELETE FROM customers
	WHERE id_cliente = 1;
   
   
   - Por causa da ON DELETE SET NULL ação, as linhas de 
    referência na contacts tabela foram definidas como NULL. 
	 A declaração a seguir exibe os dados da contacts tabela:
	 
	 SELECT * FROM contacts; 
	 
   - Como pode ser visto claramente na saída, as linhas que têm id_cliente 1 agora têm os id_cliente conjuntos de NULL
   
 
 * CASCATA - CASCADE
 
  - O ON DELETE CASCADE exclui automaticamente todas as linhas 
   de referência na tabela filho quando as linhas referenciadas 
   na tabela pai são excluídas. Na prática, ON DELETE CASCADE
   é a opção mais comumente usada.
   
 - As instruções a seguir recriam as tabelas de amostra. No entanto, a ação de exclusão das fk_customer mudanças para CASCADE:
 
   -- apaga as tabelas
	DROP TABLE IF EXISTS contacts;
    DROP TABLE IF EXISTS customers;

	-- recriando as tabelas
	
	-- cria a tabela cliente
   CREATE TABLE customers(
   		id_cliente INT GENERATED ALWAYS AS IDENTITY,
	   	nome_cliente VARCHAR(255) NOT NULL,
	    PRIMARY KEY(id_cliente)
   ); 
   
   -- cria a tabela contatos
   CREATE TABLE contacts(
   		 id_contato INT GENERATED ALWAYS AS IDENTITY,
	   	 -- coluna que sera a fk
	     id_cliente INT,
	   	 nome_contato VARCHAR(255) NOT NULL,
	   	 telefone VARCHAR(15),
	   	 email VARCHAR(100),
	   	 PRIMARY KEY(id_contato),
	     -- criando a fk 
	   	 CONSTRAINT fk_clientes FOREIGN KEY(id_cliente) REFERENCES customers(id_cliente)
	     ON DELETE CASCADE
   );
   
   -- inseri dados de clientes
   INSERT INTO customers(nome_cliente)
   VALUES('BlueBird Inc'),('Dolphin LLC');
   
   INSERT INTO contacts(id_cliente,nome_contato,telefone,email)
   VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
   (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
   (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
   
   - a seguinte declaração exclui o ID do cliente 1:
   
    DELETE FROM customers
	WHERE id_cliente = 1;
   
   - Por causa da ON DELETE CASCADE ação, todas as linhas de 
    referência na contacts tabela são excluídas automaticamente:
   
   		SELECT * FROM contacts;
   

 * CONJUNTO PADRÃO - SET DEFAULT
 
  	- O ON DELETE SET DEFAULT define o valor padrão para a coluna de chave estrangeira das linhas de referência na tabela 
	  filho quando as linhas referenciadas 
	  da tabela pai são excluídas:
	 
 * ADICIONAR UM RESTRIÇÃO DE CHAVE ESTRANGEIRA A UMA TABELA EXISTENTE:
 
  - Para adicionar uma restrição de chave estrangeira à tabela existente, use a seguinte forma da instrução ALTER TABLE :
  
  	ALTER TABLE nome_tabela_filha
	ADD CONSTRAINT nome_constraint
	FOREIGN KEY (fk_colunas)
	REFERENCES tabela_parente (coluna_chave_parente);
	
  - Ao adicionar uma restrição de chave estrangeira com ON DELETE CASCADEopção a uma tabela existente, você precisa seguir estas etapas:
  
   - Primeiro, elimine as restrições de chave estrangeira existentes:
   
     ALTER TABLE tabela_filho
	 DROP CONSTRAINT nome_constraint_fk;
	 
   - Primeiro, adicione uma nova restrição de chave estrangeira com   ON DELETE CASCADE ação:
   
     ALTER TABLE nome_tabela_filha
	ADD CONSTRAINT nome_constraint
	FOREIGN KEY (fk_colunas)
	REFERENCES tabela_parente (coluna_chave_parente)
	ON DELETE CASCADE;
	
  

   
   
   
   
   