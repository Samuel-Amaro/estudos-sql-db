# RESTRIÇÃO POSTGRESQL NOTNULL

 RESUMO: neste tutorial, você aprenderá sobre a restrição não nula do 
 PostgreSQL para garantir que os valores de uma coluna não sejam nulos.
 
 
 * INTRODUÇÃO AO NULL
 
 	- Na teoria do banco de dados, NULL representa desconhecido ou falta de
	informações. NULL não é o mesmo que uma string vazia ou o número zero.
	
	- Suponha que você precise inserir um endereço de e-mail de um contato 
	  em uma tabela. Você pode solicitar o endereço de e-mail dele. 
	  No entanto, se você não sabe se o contato tem um endereço de e-mail 
	  ou não, pode inserir NULL na coluna de endereço de e-mail. 
	  Nesse caso, NULL indica que o endereço de e-mail não é conhecido no 
	  momento da gravação.
	  
	- NULL é muito especial. Não é igual a nada, nem a si mesmo. 
	  A expressão NULL = NULL retorna NULL porque faz sentido 
	  que dois valores desconhecidos não sejam iguais.
	
	- Para verificar se um valor é NULL ou não, você usa o IS NULL 
	  operador booleano. Por exemplo, a expressão a seguir retorna 
	  true se o valor no endereço de e-mail for NULL.
	  
	  	email_address IS NULL;
	
	- O IS NOT NULL operador nega o resultado do IS NULL operador.
	
 * RESTRIÇÃO POSTGRESQL NOT NULL
 
 	- Para controlar se uma coluna pode aceitar NULL, você usa 
	  a NOT NULL restrição:
	  
	  CREATE TABLE nome_tabela(
	  		...
		  	nome_Coluna tipo_dado NOT NULL;
		    ...
	  );
	  
	- Se uma coluna tiver uma NOT NULL restrição, qualquer tentativa de 
	 inserir ou atualizar NULL na coluna resultará em erro.
	 
 * DECLARAÇÃO DE COLUNAS NOT NULL
 
 	- A CREATE TABLE instrução a seguir cria um novo nome de tabela 
	 invoices(facturas) com as restrições não nulas.
	  
	  CREATE TABLE facturas(
	  		id SERIAL PRIMARY KEY,
		  	id_produto INT NOT NULL,
		  	quantidade NUMERIC NOT NULL CHECK(quatidade > 0)
		  	preco_liquido NUMERIC CHECK(preco_liquido > 0)
	  );
	  
	- Este exemplo usa as NOT NULL palavras - chave que seguem o tipo 
	  de dados das colunas id_produto e quantidade para declarar 
	  as NOT NULL restrições.
	  
	- Note-se que uma coluna pode ter várias restrições, 
	 como NOT NULL,CHECK,UNIQUE,FOREIGN KEY apareceu ao lado do outro. 
	 A ordem das restrições não é importante. O PostgreSQL pode 
	 verificar a restrição na lista em qualquer ordem.
	 
	- Se você usar em NULL vez de NOT NULL, a coluna aceitará NULL 
	 valores não-nulos e não-nulos. Se você não especificar 
	 explicitamente NULL ou NOT NULL, ele aceitará NULL por padrão.
	 
  * ADICIONANDO A RESTRIÇÃO NOT NULL ÁS COLUNAS EXISTENTES
  
  	- Para adicionar a NOT NULL restrição a uma coluna de uma tabela 
	 existente, você usa a seguinte forma da ALTER TABLE instrução:
	 
	 	ALTER TABLE nome_tabela ALTER COLUMN nome_coluna SET NOT NULL;
	 
	-  Para adicionar a restrição set Multiple NOT NULL a várias colunas, 
	   você usa a seguinte sintaxe:
	   
	   ALTER TABLE nome_tabela 
	   ALTER COLUMN nome_coluna_1 SET NOTNULL,
	   ALTER COLUMN nome_coluna_2 SET NOTNULL,
	   ...;
	   
	- Vamos dar uma olhada no exemplo a seguir.
	
	- Primeiro, crie uma nova tabela chamada ordens de produção(production_orders):
		
		
		CREATE TABLE ordens_producao(
				id SERIAL PRIMARY KEY,
				descricao VARCHAR(40) NOT NULL,
				id_material VARCHAR(16),
				quantidade NUMERIC,
				data_inicial DATE,
				data_final DATE
		);
		
	 - Em seguida, insira uma nova linha na production_orders tabela:
	 
	 	INSERT INTO ordens_producao(descricao) VALUES('Make for Infosys inc.');
		
	 -  Em seguida, para certificar-se de que o quantidade campo não é nulo, 
	    você pode adicionar a restrição não nula à quantidade 
		coluna. No entanto, a coluna já contém dados. Se você tentar 
		adicionar a restrição não nula, o PostgreSQL emitirá um erro.
		
	 - Para adicionar a NOT NULL restrição a uma coluna que já contém NULL,
	  você precisa primeiro atualizar NULL para não NULL, assim:
	  
	  	UPDATE ordens_producao SET quantidade = 1;
		
	 - Os valores da quantidade coluna são atualizados para um. 
	  Agora, você pode adicionar a NOT NULL restrição à quantidade coluna:
	  
	  -- adiciona a CONSTRAINT NOT NULL a coluna ja existente quantidades
	  
	  ALTER TABLE ordens_producao
	  ALTER COLUMN quantidade
	  SET NOT NULL;
	  
	 - Depois disso, você pode atualizar as restrições de não-nulo para 
	  id_material, data_inicial e data_final colunas:
	  
	  	UPDATE ordens_producao
		SET id_material = 'ABC', data_inicial = '2015-09-01', 
		data_final = '2015-09-01';
		
	 - Adicione restrições não nulas a várias colunas:
	 
	 	ALTER TABLE ordens_producao
		ALTER COLUMN id_material SET NOT NULL,
		ALTER COLUMN data_inicial SET NOT NULL,
		ALTER COLUMN data_final SET NOT NULL;
		
	 - Finalmente, tente atualizar os valores na quantidade coluna para NULL:
	 
	 	UPDATE ordens_producao SET quantidade = NULL;
		
	 - PostgreSQL emitiu uma mensagem de erro:
	 
   * O CASO ESPECIAL DA RESTRIÇÃO NOT NULL
   
   	 - Além da NOT NULL restrição, você pode usar uma restrição CHECK 
	   para forçar uma coluna a aceitar valores não NULL. 
	   A NOT NULL restrição é equivalente à seguinte CHECK restrição:
	   
	   	CHECK(column IS NOT NULL);
		
	 - Isso é útil porque às vezes você pode querer uma das colunas a ou b 
	  não ser nula, mas não as duas.
	  
	 - Por exemplo, você pode desejar que uma das colunas username ou email
	  das tabelas do usuário não seja nula ou vazia. Nesse caso, você pode
	  usar a CHECK restrição da seguinte maneira:
	  
	  	CREATE TABLE usuario(
			id SERIAL PRIMARY KEY,
			nome_usuario VARCHAR(50),
			senha VARCHAR(50),
			email VARCHAR(50),
			CONSTRAINT nome_usuario_email_notnull CHECK (
				NOT(
					(nome_usuario IS NULL OR nome_usuario = '')
					AND
					(email IS NULL OR email = '')
				)
			)
		);
		
	 - A seguinte declaração funciona.
	 
	 	INSERT INTO usuario(nome_usuario,email)
		VALUES ('user1',NULL),(NULL,'email1@exemple.com'),
		('user2','email2@exemple.com'),
		('user3','')
		
	 - No entanto, a seguinte declaração não funcionará porque viola a CHECK restrição:
		
	  
	  	INSERT INTO usuario(nome_usuario, email)
		VALUES (NULL,NULL),(NULL,''),('',NULL),('','');
	  
		
	
	 
 