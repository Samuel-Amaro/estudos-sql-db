# CHAVE PRIMÁRIA POSTGRESQL

 RESUMO = neste tutorial, mostraremos o que é a chave primária e como gerenciar as restrições de chave primária do PostgreSQL por meio de instruções SQL.

 - Uma chave primária é uma coluna ou grupo de colunas usado para identificar uma linha exclusivamente em uma tabela;
 - Você define chaves primárias por meio de restrições de chave primária. Tecnicamente, uma restrição de chave primária é a combinação de uma restrição não nula e uma restrição UNIQUE .
 - Uma tabela pode ter uma e apenas uma chave primária. É uma boa prática adicionar uma chave primária a cada tabela. Quando você adiciona uma chave primária a uma tabela, o PostgreSQL cria 
   um índice de árvore B exclusivo na coluna ou um grupo de colunas usado para definir a chave primária;
   
* DEFINA A CHAVE PRIMARIA AO CRIAR A TABELA

 - Normalmente, adicionamos a chave primária a uma tabela quando definimos a estrutura da tabela usando a instrução CREATE TABLE.
 
 - SINTAXE:
 
   CREATE TABLE nome_tabela(
   			coluna_1 tipo_dado PRIMARY KEY,
	        coluna_2 tipo_Dado,
	        ....
   );
   
   - EXEMPLO: uma tabela de cabeçalho de pedido de compra:
   
    CREATE TABLE pedido_compra_cabecalho(
			ped_id INTEGER PRIMARY KEY,
			vendedor INTEGER,
		    descricao TEXT,
			endereco_entrega TEXT
	);
	
	- O ped_id é a chave primária da pedido_compra_cabecalho tabela, que i
	 dentifica exclusivamente o pedido de compra na pedido_compra_cabecalho
	 tabela;
	
    - No caso de a chave primária consistir em duas ou mais colunas, você define a 
	  restrição da chave primária da seguinte forma:
	  
	- SINTAX:
	
	  CREATE TABLE nome_tabela(
	  		coluna_1 tipo_Dado,
		    coluna_2 tipo_Dado,
		    ...
		    PRIMARY KEY (coluna_1, coluna_2)
	  );
	  
    - EXEMPLO: UMA TABELA CHAMADA pedido_compra_itens que tem duas chaves primarias,
	  uma chave primaria de pedido de compra, e uma chave primaria de item da linha;
	  
	  CREATE TABLE pedido_compra_itens(
	  			ped_id INTEGER,
		        item_id INTEGER,
		        produto INTEGER,
		        quantidade INTEGER,
		  		preco_liquido NUMERIC,
		        PRIMARY KEY (ped_id,item_id)
	  );
	
	- AS MANEIRAS ACIMA DE CRIAÇÃO DE CHAVE PRIMARIA, NÃO ESPECIFICA UM NOME PARA A CHAVE PRIMARIA,
	O PROPRIO SGBD ATRIBUI UM NOME PADRÃO PARA PARA A PK, PARA ATRIBUIR UM NOME PARA A PRIMARY KEY,
	PODE SEGUIR A SEQUINTE SINTAXE:
	- Por padrão, PostgreSQL usa table-name_pkey como nome padrão para a restrição de chave primária.
	
	CREATE TABLE nome_tabela(
	  		coluna_1 tipo_Dado,
		    coluna_2 tipo_Dado,
		    ...
	        CONSTRAINT nome_constraint PRIMARY KEY (coluna_1, coluna_2)
	  );
	  
* DEFINA A CHAVE PRIMÁRIA AO ALTERAR A ESTRUTURA DA TABELA EXISTENTE:

	- É raro definir uma chave primária para uma tabela existente. 
	 Caso seja necessário, você pode usar a instrução ALTER TABLE para 
	 adicionar uma restrição de chave primária.
   
   - SINTAX:
   
     ALTER TABLE nome_tabela ADD PRIMARY KEY (coluna_01,coluna_02);
	 
   - EXEMPLO: criando uma tabela chamda produtos sem definir nenhuma chave estrangeira:
   
     CREATE TABLE produtos(
	 		produto INTEGER,
		 	descricao TEXT,
		 	custo_produto NUMERIC
	 );
	
	- Suponha que você queira adicionar uma restrição de chave primária à products
	  tabela, você pode executar a seguinte instrução:
	  
	  ALTER TABLE nome_tabela ADD PRIMARY KEY (nome_coluna_que_ja_existe_na_tabela);
	  
	  ALTER TABLE produtos ADD PRIMARY KEY(produto);
	
* COMO ADICIONAR UMA CHAVE PRIMÁRIA AUTO-INCREMENTADA A UMA TABELA EXISTENTE:

  - EXEMPLO: criamos uma tabela que não possui nenhuma chave primaria:
  
    CREATE TABLE vendedor(
	     nome VARCHAR(255)
	);
	
  - ADD ALGUNS LINHAS DE REGISTRO NA TABELA VENDEDOR:
  
   INSERT INTO vendedor(nome) VALUES('Microsoft'),('IBM'),('Apple'),('Samsung');
   
  - VERIFICANDO OS REGISTROS INSERIDOS:
  
    SELECT * FROM vendedor;
	
  - Agora, se quisermos adicionar uma chave primária nomeada id
  à vendedor tabela e o campo id for auto-incrementado em um, 
  usamos a seguinte instrução:

	ALTER TABLE vendedor ADD COLUMN id_vend SERIAL PRIMARY KEY;
 
 - VERIFICANDO SE A PK FOI ADD:
 
   SELECT * FROM vendedor;
   
* REMOVER CHAVE PRIMÁRIA:

  - Para remover uma restrição de chave primária existente, 
   você também usa a ALTER TABLE instrução com a seguinte sintaxe:
   
   ALTER TABLE nome_tabela DROP CONSTRAINT nome_chave_primaria;
   
 - EXEMPLO: removendo a chave primaria da tabela, produtos:
 
   ALTER TABLE produtos DROP CONSTRAINT produtos_pkey; -- nome da costraint foi gerador PELO SGBD POSTGRES
	