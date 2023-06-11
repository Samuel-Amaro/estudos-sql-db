# TIPO DE DADOS BOOLEANO POSTGRESQL COM EXEMPLOS PRÁTICOS

  * RESUMO: neste tutorial, você aprenderá sobre o tipo de dados 
  	Booleano PostgreSQL e como usá-lo no projeto 
	de tabelas de banco de dados.
	
	
  * INTRODUCAO AO TIPO BOOLEANO POSTGRESQL
  
    - PostgreSQL suporta um único booleano tipo de dados : 
	 BOOLEAN que pode ter três valores: true, false e NULL.
	 
	- O PostgreSQL usa um byte para armazenar um valor booleano no 
	 banco de dados. O BOOLEAN pode ser abreviado como BOOL.
	 
	- Em SQL padrão, um valor booleano pode ser TRUE, FALSE 
	ou NULL. No entanto, o PostgreSQL é bastante 
	flexível ao lidar com valores TRUE e FALSE.
	
	- A tabela a seguir mostra os valores literais válidos para 
	TRUE e FALSE no PostgreSQL.
	
	VERDADEIRO				FALSO
	
	verdadeiro				falso
	't'						'f'
	'verdadeiro'			'falso'
	'você'					'n'
	'sim'					'não'
	'1'						'0'
	
	- Observe que o espaço em branco à esquerda ou à direita não 
	importa e todos os valores constantes, exceto true
	e false devem ser colocados entre aspas simples.
	
  * EXEMPLOS BOOLEANOS DO POSTGRESQL
  
  
  	- Vamos dar uma olhada em alguns exemplos de uso do tipo de 
	 dados Booleano PostgreSQL.
	 
	- Primeiro, crie uma nova tabela stock_availability para 
	registrar quais produtos estão disponíveis.
	
		CREATE TABLE disponibilidade_de_estoque(
			id_produto INT PRIMARY KEY,
			avaliacao BOOLEAN NOT NULL
		);
	
	
	- Em segundo lugar, insira alguns dados de amostra na  
	stock_availability tabela. Usamos vários valores 
	literais para os valores booleanos.
	
	
		INSERT INTO disponibilidade_de_estoque(id_produto,avaliacao)
		VALUES (100,TRUE), (200, FALSE), (300,'t'),(400,'1'),
		(500,'y'),(600,'yes'),(700,'no'),(800,'0');
		
		
    - Terceiro, use a seguinte declaração para verificar a 
	 disponibilidade dos produtos:
	 
	 	SELECT * FROM 
		disponibilidade_de_estoque 
		WHERE avaliacao = 'yes';
		
	- Você pode sugerir o valor verdadeiro usando a coluna 
	 Booleana sem qualquer operador. Por exemplo, 
	 a consulta a seguir retorna todos os 
	 produtos que estão disponíveis:
	 
	 
	 	SELECT * FROM disponibilidade_de_estoque
		WHERE avaliacao;
		
	- Da mesma forma, se você deseja procurar false valores
	 , compare o valor da coluna Booleana com quaisquer 
	 constantes Booleanas válidas.
	 
	 
	- A consulta a seguir retorna os produtos que não estão disponíveis.
	
	
		SELECT * FROM disponibilidade_de_estoque
		WHERE avaliacao = 'no';
		
	- Ou você pode usar o NOT operador para verificar se os valores na coluna booleana são falsos, como este:
		
		SELECT * FROM disponibilidade_de_estoque
		WHERE NOT avaliacao;
		
 * DEFINA UM VALOR PADRÃO PARA A COLUNA BOOLEAN
 
 	- Para definir um valor padrão para uma coluna booleana existente, você usa a SET DEFAULT cláusula na instrução ALTER TABLE .
	
	- Por exemplo, a seguinte ALTER TABLE instrução define o valor padrão para a available coluna na stock_availability tabela:
	
	
		ALTER TABLE disponibilidade_de_estoque
		ALTER COLUMN avaliacao
		SET DEFAULT FALSE;
		
	- Se você inserir uma linha sem especificar o valor da available coluna, o PostgreSQL usa FALSE:
	
	
		INSERT INTO disponibilidade_de_estoque(id_produto)
		VALUES (900);
		
		SELECT * FROM
		disponibilidade_de_estoque 
		WHERE id_produto = 900;
		
	- Da mesma forma, se você deseja definir um valor padrão para uma coluna 
	 booleana ao criar uma tabela , use a DEFAULT restrição 
	 na definição da coluna da seguinte maneira:
	 
	 	CREATE TABLE demostracao_boolean(
	 		...
			is_ok BOOL DEFAULT 't'; 
	 	);
		
	
	 
	 
	