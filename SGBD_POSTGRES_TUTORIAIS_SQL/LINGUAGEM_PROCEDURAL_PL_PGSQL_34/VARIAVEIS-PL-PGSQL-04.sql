# VARIAVEIS PL/PGSQL;

 RESUMO = neste tutorial, você aprenderá várias técnicas para declarar variáveis PL / pgSQL;
 
* INTRODUÇÃO ÁS VARIÁVEIS EM PL/PGSQL;

  - Uma variável é um nome significativo de um local de memória. Uma variável contém um valor que pode ser alterado no bloco . Uma variável está sempre associada a um determinado tipo de dados;
  
  - Antes de usar uma variável, você deve declará-la na seção de declaração do bloco PL / pgSQL:
  
   - SINTAXE DE DECLARAÇÃO DE UMA VARIAVEL:
   
    nome_variavel tipo_dado [:= expressao];
	
	- especificar o nome da variavel;
	- associar um tipo de dado especifico a variavel;
	- terceiro, opcionalmente atribua um valor padrão a uma variavel. se eu não fizer isso,
	  o valor inicial da variavel é NULL;
	  
	  - operador de atribuição := OU = para inicializar e atribuir um valor a uma variável;
	  
	 - EXEMPLO A SEGUIR ILUSTRA COMO DECLARAR E INICIALIZAR VARIÁVEIS:
	 
	 DO $$
	 DECLARE
	    -- declarando variaveis e atribuindo valores
		quantidade INTEGER := 1;
		primeiro_nome VARCHAR(50) := 'John';
		sobre_nome VARCHAR(50) := 'Doe';
		pagamento NUMERIC(11,2) := 20.5;
	 BEGIN
	    -- mostrando os valores das variaveis em uma mensagem
		RAISE NOTICE '% % % pagou R$ %',quantidade,primeiro_nome,sobre_nome,pagamento;
	 END $$;	
	 
 * COPIANDO TIPOS DE DADOS
 
   - O %type fornece o tipo de dados de uma coluna da tabela ou outra variável.
   
   - Normalmente, você usa o %type para declarar uma variável que contém um valor do banco de dados ou outra variável.
   
   - SINTAXE DE COMO DECLARAR UMA VARIAVEL COM O TIPO DE DADOS DE UMA COLUNA De uma TABELA:
    
	  nome_variavel nome_tabela.nome_coluna%type;
	 
   - SINTAXE DE COMO DECLARAR UMA VARIAVEL COM O TIPO DE DADOS DE OUTRA VARIAVEL:
   
      nome_variavel variavel%tipe;
	
   - EXEMPLO QUE USA A TECNICA DE CÓPIA DE TIPO PARA DECLARAR VARIAVEIS QUE CONTÊM
     VALORES QUE VÊM DA tabela FILM:
	 
	 DO $$
	 DECLARE 
	     -- variaveis declaradas 
	     titulo_filme film.title%type;
		 titulo_destaque titulo_filme%type;
	 BEGIN
	    -- obtem o titulo do filme de id 100, e atribui a variavel
		SELECT title FROM film INTO titulo_filme WHERE film_id = 100;
	    -- mostra o titulo do filme obtido
		RAISE NOTICE 'o titulo do filme e: %s',titulo_filme;
	 END;$$	
	 
	 - VARIAVEL TITULO_FILM TEM O MESMO TIPO DE DADOS QUE A coluna title da tabela film;
	 
     - a variavel titulo_Destaque tem o mesmo tipo de dados que o tipo de dados 
	  da variavel titulo_filme;
	  
	 - ao usar recurso de cópia de tipo tenho as seguintes vantagens:
	 
	  - eu não preciso saber o tipo da coluna ou referencia que esta fazendo referencia;
	  
	  - se o tipo de dados do nome da coluna referenciada(ou variavel) muda, você não precisa mudar a definição da função;
	  
	  