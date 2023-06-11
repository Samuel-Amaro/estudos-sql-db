-- RESTRIÇÃO POSTGRESQL CHECK

--  * RESUMO:  
--	   neste tutorial, você aprenderá sobre as CHECK restrições do 
--     PostgreSQL e como usá-las para restringir valores em colunas de uma 
--     tabela com base em uma expressão booleana.

--     Uma CHECK restrição é um tipo de restrição que permite especificar se 
--     os valores em uma coluna devem atender a um requisito específico.

-- 	   A CHECK restrição usa uma expressão booleana para avaliar os 
--     valores antes de serem inseridos ou atualizados na coluna.

--    Se os valores passarem na verificação, o PostgreSQL irá inserir ou 
--    atualizar esses valores na coluna. Caso contrário, o PostgreSQL 
--    rejeitará as alterações e emitirá um erro de violação de restrição.

--  * DEFINIR A RESTRIÇÃO POSTGRESQL CHECK PARA NOVAS TABELAS

	-- Normalmente, você usa a CHECK restrição no momento de criar a 
	-- tabela usando a CREATE TABLE instrução.
	
	-- A declaração a seguir define uma employees tabela.
	
CREATE TABLE funcionarios(
		id SERIAL PRIMARY KEY,
		primeiro_nome VARCHAR(50),
		segundo_nome VARCHAR(50),
		data_nascimento DATE CHECK (data_nascimento > '1900-01-01'),
		data_adesao DATE CHECK (data_adesao > data_nascimento),
		salario NUMERIC CHECK (salario > 0)
);

  * A FUNCIONARIO tabela tem três CHECK restrições:
  
  	- Primeiro, a data de nascimento ( birth_date) do funcionário 
	  deve ser maior que 01/01/1900. Se você tentar 
	  inserir uma data de nascimento antes 01/01/1900, 
	  receberá uma mensagem de erro.
	- 
	- Em segundo lugar, a data associada ( joined_date) deve ser 
	  maior que a data de nascimento ( birth_date). Esta 
	  verificação impedirá a atualização de datas inválidas 
	  em termos de seus significados semânticos.
    - 
	- Terceiro, o salário deve ser maior que zero, o que é óbvio.
	
 * Vamos tentar inserir uma nova linha na employees(FUNCIONARIO) tabela:
 
 
 	INSERT INTO funcionarios(primeiro_nome,segundo_nome,data_nascimento,data_adesao,salario)
 	VALUES ('John', 'Doe', '1972-01-01', '2015-07-01', - 100000);
 
 * A declaração tentou inserir um salário negativo na salarycoluna. 
 NO entanto, o PostgreSQL retornou a seguinte mensagem de erro:
 
 	- A inserção falhou devido à CHECK restrição na salary 
	 coluna que aceita apenas valores positivos.
    -
	- Por padrão, o PostgreSQL dá à CHECK restrição um nome usando o 
	  seguinte padrão:
	  
	  {table}_{column}_check
	  
	- Por exemplo, a restrição na coluna de salário tem o seguinte nome de restrição:
	
		funcionarios_salario_check
		
    - No entanto, se quiser atribuir um CHECK nome específico a uma 
		restrição, você pode especificá-lo após a CONSTRAINT expressão 
		da seguinte maneira:
		
		nome_coluna tipo_dado CONSTRAINT nome_constraint CHECK(...);
		
	- Veja o seguinte exemplo:
	
		salario NUMERIC CONSTRAINT salario_positivo CHECK(salario > 0);
		
 * DEFINIR RESTRIÇÕES POSTGRESQL CHECK PARA TABELAS EXISTENTES
 
 	- Para adicionar CHECK restrições às tabelas existentes, 
		você usa a ALTER TABLE instrução. Suponha que você tenha uma 
		tabela existente no banco de dados chamada  prices_list:
		
	CREATE TABLE lista_precos(
		id SERIAL PRIMARY KEY,
		id_produto INT NOT NULL,
		preco NUMERIC NOT NULL,
		desconto NUMERIC NOT NULL,
		valido_a_partir_de DATE NOT NULL,
		valido_para DATE NOT NULL
	);
 	
	
  - Agora, você pode usar a ALTER TABLE instrução para adicionar as CHECK 
   restrições à prices_list tabela. O preço e o desconto devem ser 
   maiores que zero e o desconto é menor que o preço. 
   Observe que usamos uma expressão booleana que contém os  AND
   operadores.
   
   	ALTER TABLE lista_precos ADD CONSTRAINT check_preco_desconto
	CHECK (
		preco > 0 AND desconto >= 0 AND preco > desconto
	);

  - A data válida até ( valid_to) deve ser maior ou igual à data válida desde ( valid_from).
	  
	  
	  ALTER TABLE lista_precos ADD CONSTRAINT check_intervalo_validades
	  CHECK (valido_a_partir_de >= valido_para);
	  
  - As CHECKrestrições são muito úteis para colocar lógica adicional 
  	para restringir valores que as colunas podem aceitar na camada de 
	banco de dados. Usando a CHECK restrição, você pode garantir 
	que os dados sejam atualizados no banco de dados corretamente.
