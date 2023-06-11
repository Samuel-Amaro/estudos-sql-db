# TIPOS DE CARACTERES DO POSTGRESQL: CHAR, VARCHAR and TEXT

 * RESUMO: neste tutorial, você aprenderá sobre os tipos de
 dados de caracteres do PostgreSQL CHAR, incluindo, , 
 VARCHAR e TEXT, e aprenderá como selecionar os tipos de 
 caracteres corretos para suas tabelas.
 
 * INTRODUÇÃO AOS TIPOS DE CARACTERES POSTGRESQL
 
   - O PostgreSQL fornece três tipos de caracteres 
   principais: CHARACTER(n) ou CHAR(n), CHARACTER VARYINGING(n) ou 
   VARCHAR(n), e TEXT, onde n é um número inteiro positivo.
   
   - A TABELA A SEGUIR ILUSTRA OS TIPOS DE CARACTERES NO POSTGRESQL:
   
   
	TIPOS DE CARACTER: CHARACTER VARYING(n),VARCHAR(n);
	DESCRIÇÃO: comprimento variável com limite de comprimento;
	----------------------------------------------------
	TIPO DE CARACTER: CHARACTER(n), CHAR(n)
	DESCRIÇÃO: comprimento fixo, acolhoado em branco.
	----------------------------------------------------
	TIPO DE CARACTER: TEXT, VARCHAR
	DESCRIÇÃO: comprimento ilimitado variável.
	
   -  Ambos CHAR(n)e VARCHAR(n) podem armazenar até n 
    caracteres. Se você tentar armazenar uma string com mais 
	de n caracteres, o PostgreSQL emitirá um erro.
	
   - No entanto, uma exceção é que se os caracteres 
    excessivos forem todos espaços, o PostgreSQL 
	trunca os espaços até o comprimento máximo(n) e 
	armazena os caracteres.
	
   - Se uma string for convertida explicitamente para um 
   CHAR(n) ou VARCHAR(n), o PostgreSQL irá truncar a 
   string para n caracteres antes de inseri-la na tabela.
   
   - O TEXT tipo de dados pode armazenar uma string com 
   comprimento ilimitado.
   
   - Se você não especificar o número inteiro n para o 
   VARCHAR tipo de dados, ele se comportará como o TEXT
   tipo de dados. O desempenho do VARCHAR(sem o tamanho n) 
   e TEXT são os mesmos.
   
   - A única vantagem de especificar o especificador de 
   comprimento para o VARCHAR tipo de dados é que o 
   PostgreSQL emitirá um erro se você tentar inserir 
   uma string com mais de n caracteres na VARCHAR(n) coluna.
   
   - Ao contrário VARCHAR, O CHARACTER ou CHAR sem o 
    especificador de comprimento (n) é igual ao 
	CHARACTER(1) ou CHAR(1).
	
   - Diferente de outros sistemas de banco de dados, no 
   PostgreSQL, não há diferença de desempenho 
   entre três tipos de caracteres.
   
   - Na maioria dos casos, você deve usar TEXT ou VARCHAR.
   E você usa VARCHAR(n) quando quiser que o PostgreSQL 
   verifique o comprimento.
   
 * EXEMPLOS DE TIPO DE CARACTERE POSTGRESQL
 
 	- Vamos dar uma olhada em um exemplo para ver como o 
	CHAR, VARCHAR e TEXT tipos de dados de trabalho.
	
	- Primeiro, crie uma nova tabela chamada character_tests:
	
		CREATE TABLE teste_caracteres(
			id SERIAL PRIMARY KEY,
			x CHAR(1),
			y VARCHAR(10),
			z TEXT
		);
		
	- Em seguida, insira uma nova linha na character_tests tabela.
	
	
	  	INSERT INTO teste_caracteres(x,y,z)
		VALUES('Yes','This is a teste for varchar','This is a very long text for the');
		
	- PostgreSQL emitiu um erro.
	
	- Isso ocorre porque o tipo de dados da x coluna é 
	 char(1) e tentamos inserir uma string com três 
	 caracteres nesta coluna. Vamos consertar:

	    INSERT INTO teste_caracteres(x,y,z)
		VALUES 
		('Y',
		 'This is a teste for varchar',
		 'This is a very long text for the');
		 
	 - PostgreSQL emite um erro diferente.
		
	 - Isso ocorre porque tentamos inserir uma string 
	  com mais de 10 caracteres na coluna y que possui o 
	  varchar(10) tipo de dados.
	  
	 - A instrução a seguir insere uma 
	   nova linha na character_tests tabela com sucesso.
	
	    INSERT INTO teste_caracteres(x,y,z)
		VALUES 
		('Y',
		 'varchar(n)',
		 'This is a very long text for the');
		 
		 
	 SELECT * FROM teste_caracteres;