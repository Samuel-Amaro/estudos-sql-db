# PostgreSQL Views;

 - Uma visão é chamada de consulta, que fornece outra maneira 
   de apresentar dados nas tabelas do banco de dados. 
   Uma visão é definida com base em uma ou mais tabelas, 
   conhecidas como tabelas base. Quando você cria 
   uma visualização , basicamente cria uma consulta e 
   atribui um nome a ela, portanto, uma visualização é 
   útil para agrupar uma consulta complexa comumente usada.

 - Observe que as visualizações regulares não armazenam nenhum dado;
 
 - Uma visão é um objeto de banco de dados de uma consulta armazenada. 
   Uma visão pode ser acessada como uma tabela virtual no PostgreSQL.
   Em outras palavras, uma visão PostgreSQL é uma tabela lógica que representa os dados de
   uma ou mais tabelas subjacentes por meio de uma instrução SELECT;
   
 - Uma visualização pode ser muito útil em alguns casos, como:
  
   * Uma visão ajuda a simplificar a complexidade de uma consulta porque você pode consultar uma visão, 
      que se baseia em uma consulta complexa, usando uma SELECTinstrução simples;
	  
   * Como uma tabela, você pode conceder permissão aos usuários por meio de uma exibição que contém dados específicos que os usuários estão autorizados a ver;
   
  
* CRIAÇÃO DE VIEWS NO PostgreSQL

  - PARA CRIAR UM VIEW usa-se a CREATE VIEW DECLARAÇÃO:
    
  - SINTAXE:
  
    CREATE VIEW nome_view AS query;
	
     1 - coloca o nome da view;
	 2 - depois em seguida coloca uma consulta apos a palavra AS
	   uma consulta pode ser um select simples ou uma select istrução complexa com join;
	   
	   
   
 