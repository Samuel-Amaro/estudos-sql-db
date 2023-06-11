# UM OLHADA EM VÁRIOS TIPOS DE DADOS INTEIROS DO POSTGRESQL

  * RESUMO: este tutorial apresenta vários tipos inteiros do POSTGRESQL SMALLINT,
  INCLUINDO INTEGER and BIGINT.
  
  * INTRODUÇÃO AOS TIPOS INTEIROS DO POSTGRESQL
  
    - A TABELA A SEGUIR ILUSTRA A ESPECIFICAÇÃO DE CADA TIPO DE NUMERO INTEIRO:
	
		NOME: SMALLINT;
		TAMANHO DE ARMAZENAMENTO: 2 bytes;
		MIN: -32.768;
		MAX: + 32.767;
		----------------------------------
		NOME: INTEGER;
		TAMANHO DE ARMAZENAMENTO: 4 BYTES;
		MIN: -2.147.483.648;
		MAX: +2.147.438.647;
		----------------------------------
		NOME: BIGINT;
		TAMANHO DE ARMAZENAMENTO: 8 BYTES;
		MIN: -9.223.372.036.854.775.808;
		MAX: +9.223.372.036.854.775.807;
		-----------------------------------
		
     - Se você tentar armazenar um valor fora da faixa permitida, o PostgreSQL emitirá um erro.
  
     - Ao contrário do inteiro MySQL , o PostgreSQL não fornece tipos inteiros sem sinal.
	 
   * SMALLINT(PEQUENO)
   
   		- O SMALLINT requer o tamanho de armazenamento de
		2 bytes que pode armazenar qualquer número inteiro
		que esteja no intervalo de (-32.767, 32.767).
		
		- Você pode usar o SMALLINT tipo para armazenar 
		algo como a idade das pessoas, o número de páginas 
		de um livro, etc.
		
		- A seguinte instrução cria uma tabela chamada books:
		
			CREATE TABLE books(
				id_book SERIAL PRIMARY KEY,
				title VARCHAR(255) NOT NULL,
				pages SMALLINT NOT NULL CHECK (pages > 0)
			);
			
		- Neste exemplo, a pages coluna é uma SMALLINT coluna.
		 Como o número de páginas de um livro deve ser positivo,
		 adicionamos uma CHECK restrição para fazer cumprir 
		 essa regra.
		 
	* (INTEIRO) INTEGER
	
		- O INTEGER é a escolha mais comum entre os tipos 
		 de inteiros porque oferece o melhor equilíbrio 
		 entre tamanho de armazenamento, intervalo 
		 e desempenho.
		 
		- O INTEGER tipo requer um tamanho de armazenamento
		 de 4 bytes que pode armazenar números no 
		 intervalo de (-2.147.483.648, 2.147.483.647).
		 
		- Você pode usar o INTEGER tipo para uma coluna
		que armazena números inteiros bastante grandes, 
		como a população de uma cidade ou mesmo país, 
		como o exemplo a seguir:
		
			CREATE TABLE cities(
				id_cidade SERIAL PRIMARY KEY,
				nome_cidade VARCHAR(255) NOT NULL,
				populacao INT NOT NULL CHECK (populacao >= 0)
			);
			
	     - Observe que INT é o sinônimo de INTEGER.
	
	* BIGINT
	
		- Caso queira armazenar os números inteiros que estão fora 
		 do intervalo do INTEGER tipo, você pode usar o BIGINT tipo.
		 
		- O BIGINT tipo requer um tamanho de armazenamento
		de 8 bytes que pode armazenar qualquer número no 
		intervalo de (-9.223.372.036.854.775.808,
		+ 9.223.372.036.854.775.807).
		
		- Usar o BIGINT tipo não só consome muito 
		armazenamento, mas também diminui o desempenho 
		do banco de dados; portanto, você deve ter um 
		bom motivo para usá-lo.
		