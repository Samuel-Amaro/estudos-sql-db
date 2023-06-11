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

* EXEMPLO DE CREATE VIEW NO PostgreSQL:

  1. customer - tabela armazena dados dos clientes;
  2. address - armazena endereços dos clientes;
  3. city - armazena dados da cidade;
  4. country - armazena dados do pais;
	   
  - obtendo dados completos dos clientes
  
  SELECT 
        tbl_cliente.customer_id AS id_cliente,
		tbl_cliente.first_name || ' ' || tbl_cliente.last_name AS "Nome Completo Cliente",
		endereco_cliente.address AS "Endereço Cliente",
		endereco_cliente.postal_code AS "Codigo Postal",
		endereco_cliente.phone AS "Telefone Cliente",
		cidade_cliente.city AS "Cidade Cliente",
		pais_cliente.country AS "Pais Cliente"
  FROM
      customer AS tbl_cliente
  INNER JOIN
            address AS endereco_cliente
  ON
    tbl_cliente.address_id = endereco_cliente.address_id
  INNER JOIN
            city AS cidade_cliente
  ON
    cidade_cliente.city_id = endereco_cliente.city_id
  INNER JOIN
          country AS pais_cliente
  ON
    pais_cliente.country_id = cidade_cliente.country_id;
 
 - a consulta acima e bastante complexa, da muito trabalho ficar,
 escrevendo grandes sql assim, para obter muitos dados, para agilizar o processo,
 e ganhar tempo , usa-se a view que vai salvar a consulta, pronta na view,
 e so vai precisar executar a view ao inves de escrever sql grande desses;
 
 - criando uma view com a consulta acima mostrada:
 
  CREATE VIEW seleciona_clientes_principais AS
    SELECT 
        tbl_cliente.customer_id AS id_cliente,
		tbl_cliente.first_name || ' ' || tbl_cliente.last_name AS "Nome Completo Cliente",
		endereco_cliente.address AS "Endereço Cliente",
		endereco_cliente.postal_code AS "Codigo Postal",
		endereco_cliente.phone AS "Telefone Cliente",
		cidade_cliente.city AS "Cidade Cliente",
		pais_cliente.country AS "Pais Cliente"
    FROM
      customer AS tbl_cliente
    INNER JOIN
            address AS endereco_cliente
    ON
      tbl_cliente.address_id = endereco_cliente.address_id
    INNER JOIN
            city AS cidade_cliente
    ON
      cidade_cliente.city_id = endereco_cliente.city_id
    INNER JOIN
          country AS pais_cliente
    ON
      pais_cliente.country_id = cidade_cliente.country_id;
  
 

  - AGORA SEMPRE QUE EU QUISER OBTER DADOS DE CLIENTES, EU NÃO VOU PRECIAR
  ESCREVER O SQL GRANDE DAQUELE DE NOVO BASTA SIMPLESMENTE EU SELECIONAR,
  A MINHA VIEW QUE VAI TER O MEU SQL SALVO COM OS DADOS DOS CLIENTES,
  ELE CRIA UMA TABELA VIRTUAL COM OS DADOS QUE O SQL QUE O VIEW SALVA:
  ISSO E A MINHA VIEW VAI TER OS DADOS COMPLETOS DOS CLIENTES,
  POR CAUSA DAQUELA CONSULTA, EU NÃO VOU PRECISAR ESCEVER A CONSULTA DE NOVO,
  BASTA SELECIONAR A VIEW E CONSULTA OS DADOS VÃO ESTAR SALVOS LA:
  
  - SELECIONANDO VIEW CRIADA ACIMA:
   
   SELECT 
         *
   FROM
       seleciona_clientes_principais;
 
 
*  ALTERAÇÃO DE VIEWS NO POSTGRESQL:

  - PARA ALTERAR A CONSULTA DE DEFINIÇÃO DE UMA VIEW, USA-SE O CREATE VIEW,
    ISTRUÇÃO COM OR REPLACE ADIÇÃO DA SEGUINTE MANEIRA:
	
	- SINTAXE:
	 
	   CREATE OR REPLACE nome_view
	   AS
	   query; -- consulta de definição da view
	   
	   - NA ALTERAÇÃO DE UMA CONSULTA DE DEFINIÇÃO DE UMA VIEW, NÃO E POSSIVEL,
	     RETIRAR COLUNAS DA VISUALIZAÇÃO. DEVE-SE GERAR AS MESMAS COLUNAS DE QUANDO A CONSULTA FOI CRIADA NA DEFINIÇÃO;
	   - MAS PODE ADICIONAR NOVAS COLUNAS AO FINAL DA LISTA DE COLUNAS, SEGUINDO OS NOMES, OS MESMOS TIPOS DE DADOS,
	    E NA MESMA ORDEM EM QUE FORAM CRIADAS;
	   - PODE-SE ANEXAR COLUNAS ADICIONAIS NO FINAL DA LISTA DE COLUNAS;
	   
	   - CRIANDO OUTRA VIEW ADICIONANDO UMA NOVA COLUNA NO FINAL DA LISTA DE COLUNAS;
	   
	     CREATE VIEW seleciona_clientes_principais_completa AS
           SELECT 
                 tbl_cliente.customer_id AS id_cliente,
				 tbl_cliente.first_name || ' ' || tbl_cliente.last_name AS "Nome Completo Cliente",
				 endereco_cliente.address AS "Endereço Cliente",
				 endereco_cliente.postal_code AS "Codigo Postal",
				 endereco_cliente.phone AS "Telefone Cliente",
				 cidade_cliente.city AS "Cidade Cliente",
				 pais_cliente.country AS "Pais Cliente",
                 tbl_cliente.email AS "Email Cliente"  
			FROM
                customer AS tbl_cliente
            INNER JOIN
                     address AS endereco_cliente
            ON
               tbl_cliente.address_id = endereco_cliente.address_id
            INNER JOIN
                  city AS cidade_cliente
            ON
               cidade_cliente.city_id = endereco_cliente.city_id
            INNER JOIN
                     country AS pais_cliente
            ON
              pais_cliente.country_id = cidade_cliente.country_id;
	   
	   - UTILIZANDO A VIEW ACIMA CRIADA:
	   
	     SELECT 
		       *
		 FROM
		     seleciona_clientes_principais_completa;
			 
* ALTERAR O NOME DE UM VIEW:

  ALTER VIEW
            nome_view 
  RENAME TO
           novo_nome_view;
		   
* PARA REMOVER(APAGAR) UMA VIEW DO PostGreSql:

 - SINTAXE:
   
    DROP VIEW [IF EXISTS] nome_view_existente;
	
	