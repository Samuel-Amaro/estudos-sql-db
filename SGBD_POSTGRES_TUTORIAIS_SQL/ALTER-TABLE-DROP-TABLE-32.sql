* DROP TABLE

* neste tutorial, você aprenderá como usar a instrução PostgreSQL DROP TABLE para remover tabelas existentes do banco de dados.

  - sintaxe:
  
    DROP TABLE [IF EXISTS] nome_tabela
	[CASCADE | RESTRICT];
	
	- informar nome da tabela;
	- Caso a tabela que você deseja remover seja usada em outros objetos, como visualizações ,gatilhos , funções e procedimentos armazenados , o DROP TABLE não pode remover a tabela. Nesse caso, você tem duas opções:
	  
	  - CASCADE - OPÇÃO PERMITE REMOVER A TABELA E SEUS OBJETOS DEPENDENTES;
	  - RESTRICT OPÇÃO REJEITA A REMOÇÃO SE HOUVER ALGUM OBJETO DEPENDENTE
	    DA TABELA. A RESTRICT OPÇÃO E O PADRÃO SE VOCÊ NÃO ESPECIFICAR
		EXPLICITAMENTE NA DROP TABLE;
	  
	  - REMOVER VARIAS TABELAS DE UMA VEZ:
	  
	    DROP TABLE [IF EXISTS]
		  nome_tabela_1,
		  nome_tabela_2,
		  ...
		[CASCADE | RESTRICT];

* EXEMPLOS DE DROP TABLE

1) Elimine uma tabela que não existe

     DROP TABLE author;

    - a istrução acima emite um erro porque a tabela n exsite;
	
	- para evitar o erro:
	
	  DROP TABLE IF EXISTS author;
	  
2) Elimine uma tabela que possui objetos dependentes

  - CRIANDO DUAS NOVAS TABELAS:
   
    CREATE TABLE autor (
	 author_id INT PRIMARY KEY,
	 firstname VARCHAR (50),
	 lastname VARCHAR (50)
    );
	
	CREATE TABLE paginas (
	 page_id serial PRIMARY KEY,
	 title VARCHAR (255) NOT NULL,
	 contents TEXT,
	 author_id INT NOT NULL,
	 FOREIGN KEY (author_id) 
          REFERENCES autor (author_id)
    );
    
	- apagando a tabela autor:
	
	  DROP TABLE IF EXISTS autor;
	  
	- EXISTE UMA RESTRIÇÃO NA TABELA PAGINAS QUE DEPENDE DE AUTOR,
	  ASSIM FAZ A ISTRUÇÃO ACIMA GERAR UM ERRO E NÃO EXECUTAR:
	   
	    - NESSE CASO PRECISA REMOVER TODOS OS OBJETOS DEPENDENTES ANTES
		DE DESCARTAR A tabela autor OU USAR A CASCADE opção a seguir:
		
		  DROP TABLE autor CASCADE;
		  
		  - REMOVE A TABELA AUTOR E SEUS OBJETOS DEPENDESNTES NO CASO RESTRIÇÕES;
		  
3) Eliminar várias tabelas