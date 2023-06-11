# TRUNCATE TABLE

* neste tutorial, você aprenderá como usar a TRUNCATE TABLEinstrução PostgreSQL para excluir rapidamente todos os dados de tabelas grandes.

* Para remover todos os dados de uma tabela, você usa a DELETEinstrução. No entanto, quando você usa a DELETEinstrução para excluir todos os dados de uma tabela que possui muitos dados, ela não é eficiente. Nesse caso, você precisa usar a TRUNCATE TABLEinstrução:

 TRUNCATE TABLE nome_tabela;
 
* REMOVENDO TODOS OS DADOS DE UMA TABELA:

 - SINTEXE:
   
   TRUNCATE TABLE nome_tabela_a_Remover;

 - REMOVENDO TODOS OS DADOS DA TABELA INVOICES:
 
   TRUNCATE TABLE invoices;
   
* REMOVER TODOS OS DADOS DE VARIAS TABELAS:

 - SINTAXE:
   
   TRUNCATE TABLE 
     nome_tabela_1,
	 nome_tabela_2,
	 ...
	 ;
	 
	 - removendo todos os dados da tabela invoices e das custorers:
	 
	  TRUNCATE TABLE invoices,customers;
	  
	
* REMOVENDO TODOS OS DADOS DE UMA TABELA QUE TENHA REFERENCIAS DE CHAVE ESTRANGEIRA:

 - Na prática, a tabela que você deseja truncar geralmente contém  referências de chave estrangeira de outras tabelas que não estão listadas na  TRUNCATE TABLEinstrução.
 
 - Por padrão, a  TRUNCATE TABLEinstrução não remove nenhum dado da tabela que tenha referências de chave estrangeira.
 
 - Para remover dados de uma tabela e outras tabelas que têm referência de chave estrangeira à tabela, você usa a CASCADE opção na TRUNCATE TABLE instrução a seguir:
 
   TRUNCATE TABLE nome_tabela
   CASCADE;
   
 - Por padrão, a TRUNCATE TABLEinstrução usa a RESTRICTopção que evita que você trunque a tabela que possui referências de restrição de chave estrangeira.
 
 - Use a TRUNCATE TABLEinstrução para excluir todos os dados de uma grande tabela.
 
 - Use a CASCADEopção de truncar uma tabela e outras tabelas que fazem referência à tabela por meio de restrição de chave estrangeira.
 
 
   
 