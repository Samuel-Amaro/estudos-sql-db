# RESTRIÇÃO POSTGRESQL UNIQUE(UNICA)

 * RESUMO:
 
 	- neste tutorial, você aprenderá sobre a UNIQUE restrição 
 	  do PostgreSQL para garantir que os valores armazenados em uma 
      coluna ou grupo de colunas sejam únicos nas linhas de uma tabela.
	  
	- Às vezes, você deseja garantir que os valores armazenados em uma 
		coluna ou grupo de colunas sejam exclusivos em toda a tabela, 
		como endereços de e-mail ou nomes de usuário.
		
	- O PostgreSQL fornece a você a UNIQUE restrição que mantém a 
		exclusividade dos dados corretamente.
		
	- Quando uma UNIQUE restrição está em vigor, toda vez que você 
	  insere uma nova linha , ela verifica se o valor já está na tabela. 
	  Ele rejeita a alteração e emite um erro se o valor já existir. 
	  O mesmo processo é realizado para atualizar os dados existentes.
	  
	- Ao adicionar uma UNIQUE restrição a uma coluna ou grupo de 
	 colunas, o PostgreSQL criará automaticamente um índice único 
	 na coluna ou grupo de colunas.
	 
 * UNIQUE EXEMPLO DE RESTRIÇÃO POSTGRESQL
 
 	- A instrução a seguir cria uma nova tabela nomeada person com 
	  uma UNIQUE restrição para a email coluna.
	  
	CREATE TABLE pessoa(
		id SERIAL PRIMARY KEY,
		primeiro_nome VARCHAR(50),
		segundo_nome VARCHAR(50),
		email VARCHAR(50) UNIQUE
	);
	
  - Observe que a UNIQUE restrição acima pode ser reescrita como uma 
   restrição de tabela, conforme mostrado na seguinte consulta:
   
   CREATE TABLE pessoa(
		id SERIAL PRIMARY KEY,
		primeiro_nome VARCHAR(50),
		segundo_nome VARCHAR(50),
		email VARCHAR(50),
	   	UNIQUE(email)
	);
	
 - Primeiro, insira uma nova linha na person tabela usando a INSERT instrução:
	
	INSERT INTO pessoa(primeiro_nome,segundo_nome,email) 
	VALUES('john','doe','j.doe@postgresqltutorial.com');
	
 - Em segundo lugar, insira outra linha com e-mail duplicado.
	
	INSERT INTO pessoa(primeiro_nome,segundo_nome,email) 
	VALUES('jack','doe','j.doe@postgresqltutorial.com');	
	
 - PostgreSQL emitiu uma mensagem de erro.
 
* CRIAÇÃO DE UMA UNIQUE RESTRIÇÃO EM VÁRIAS COLUNAS

	- O PostgreSQL permite que você crie uma UNIQU Erestrição para um grupo de colunas usando a 
	seguinte sintaxe:
	
		CREATE TABLE tabela(
			c1 tipo_dado,
			c2 tipo_dado,
			c3 tipo_dado,
			UNIQUE(C2,c3)
		);
	
	- A combinação de valores nas colunas c2 e c3 será única em toda a 
	tabela. O valor da coluna c2 ou c3 não precisa ser exclusivo.
	
 * ADICIONANDO UMA RESTRIÇÃO ÚNICA USANDO UM INDICE UNICO:
 
 	- Às vezes, você pode querer adicionar uma restrição exclusiva a uma 
		coluna ou grupo de colunas existente. 
		Vamos dar uma olhada no exemplo a seguir.
		
	- Primeiro, suponha que você tenha uma tabela chamada equipment:
	
		CREATE TABLE equipamento(
			id SERIAL PRIMARY KEY,
			name VARCHAR(50) NOT NULL,
			id_equip VARCHAR(16) NOT NULL
		);
		
	- Em segundo lugar, crie um índice exclusivo com base na equip_id coluna.
	
		CREATE UNIQUE INDEX CONCURRENTLY equipamento_id_equip
		ON equipamento(id_equip);
		
	- Terceiro, adicione uma restrição exclusiva à equipment tabela 
	 usando o equipment_equip_id índice.
	 
	 	ALTER TABLE equipamento
		ADD CONSTRAINT unico_id_equip
		UNIQUE USING INDEX equipamento_id_equip;
	
	- Observe que a ALTER TABLE instrução adquire um bloqueio exclusivo 
	 na mesa. Se você tiver transações pendentes , ele aguardará a 
	 conclusão de todas as transações antes de alterar a tabela. 
	 Portanto, você deve verificar a  pg_stat_activity 
	 tabela para ver as transações pendentes atuais que estão 
	 em andamento usando a seguinte consulta:
	 
SELECT
	datid,
	datname,
    usename,
	state
FROM
	pg_stat_activity;

	- Você deve olhar o resultado para encontrar a state coluna com o valor 
	 idle in transaction. Essas são as transações que estão 
	  pendentes para serem concluídas.
	  
	  