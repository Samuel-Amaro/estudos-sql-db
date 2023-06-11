# neste tutorial, você aprenderá como usar a instrução CREATE TABLE do PostgreSQL para criar uma nova tabela;

* Sintaxe CREATE TABLE do PostgreSQL
  - Um banco de dados relacional consiste em várias tabelas relacionadas,
    Uma tabela consiste em linhas e colunas. As tabelas permitem que você 
	armazene dados estruturados como clientes, produtos, funcionários, etc.
  
  - SINTAXE:
   
    CREATE TABLE [IF NOT EXISTS] nome_tabela (
	    coluna1 tipoDado(tamanho) restricao_coluna_1,
		coluna2 tipoDado(tamanho) restricao_coluna_2,
		coluna3 tipoDado(tamanho) restricao_coluna_3,
		restricoes_da_tabela
	);
	
	- primeiro especifique o nome da tabela apos CREATE TABLE;
	- a criação de uma tabela ja exisitente resultara em erro, por isso 
	adiciona a clausula [IF NOT EXISTS]
	- terceiro, especifique uma lista de colunas da tabela separado, por virgulas,
	cada coluna consiste no nome da coluna, o tipo de dados que a coluna,
	armazena, o comprimento dos dados e a restrição da coluna, as restrições de
	coluna especificam regras que os dados armazenados na coluna devem seguir;
	- por ultimo especifique as restrições de tabela, incluindo chave primaria,
	chave estrngeira, restrições de verificação;

* RESTRIÇÕES
  - restrições de colunas:
    - NOT NULL - garante que os valores em uma coluna não possam ser NULL;
	- UNIQUE - garante os valores em uma coluna exclusiva nas linhas da mesma;
	- PRIMARY KEY - uma coluna de chave primaria identifica exclusivamente as linhas de uma tabela.
	Uma tabela pode ter uma e apenas uma chave primária. A restrição de chave primaria permite que você defina a chave primária de uma
	tabela;
	- CHECK - uma CHECK restrição garante que os dados devem satisfazer uma expressão booleana;
	- FOREIGN KEY - garante que os valores em uma coluna ou grupo de colunas de uma tabela, existam
	em uma coluna ou grupo de colunas em outra tabela. Ao contrario da chave primaria,
	uma tabela pode ter muitas chaves estrangeiras;
	
* EXEMPLOS DE CREATE TABLE:
  - criando uma tabela de exemplo que vai possuir 6 colunas,
  essa tabela armazenara dados de contas de usuarios;
  
  CREATE TABLE contas(
          id_usuario SERIAL PRIMARY KEY,
	      nome_usuario VARCHAR(50) UNIQUE NOT NULL,
	      senha VARCHAR(50) NOT NULL,
	      email VARCHAR(255) UNIQUE NOT NULL,
	      criada_em TIMESTAMP NOT NULL,
	      ultimo_login TIMESTAMP
  );
	
  - CRIANDO UMA SEGUNDA TABELA QUE VAI POSSUIR 2 COLUNAS 
  
  CREATE TABLE papeis(
          id_papel SERIAL PRIMARY KEY,
	      nome_papel VARCHAR(255) UNIQUE NOT NULL
  );
  
  - CRIANDO UMA TERCEIRA TABELA QUE VAI POSSUIR 3 COLUNAS:
  
  CREATE TABLE contas_papeis(
         id_usuario INT NOT NULL,
	     id_papel INT NOT NULL,
	     data_concessao TIMESTAMP,
	     PRIMARY KEY(id_usuario,id_papel), -- definindo a chave primaria para esta tabela(vai ser as 2 colunas)
	     FOREIGN KEY (id_papel) -- definindo a primeira chave estrangeira da tabela, essa FK faz referencia a coluna id_papel da tabela papeis;
	         REFERENCES papeis(id_papel),
         FOREIGN KEY (id_usuario) -- definindo a segunda chave estrangeira da tabela, essa FK faz referencia a coluna id_usuario da tabela contas;
	         REFERENCES contas(id_usuario)   
   );     
  