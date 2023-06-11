# neste tutorial, você aprenderá como usar a ALTER TABLEinstrução PostgreSQL para modificar a estrutura de uma tabela;

* Introdução à ALTER TABLE instrução PostgreSQL:
  - Para alterar a estrutura de uma tabela existente, use a ALTER TABLEinstrução PostgreSQL:
  
  - SINTAXE ALTER TABLE:
    
	ALTER TABLE nome_tabela AÇÃO;
  
  - O POSTGRESSQL OFERECE MUITAS AÇÕES:
  
    - adicionar uma coluna;
	- apagar uma coluna;
	- alterar o tipo de dados de uma coluna;
	- renomear uma coluna;
	- definir uma valor padrão para a coluna;
	- adicionar uma restrição a uma coluna;
	- renomear uma tabela;
	
* Para adicionar uma nova coluna a uma tabela, você usa a ALTER TABLE ADD COLUMN instrução:
 
  ALTER TABLE 
             nome_tabela
  ADD COLUMN
           nome_coluna tipo_dado_coluna restricao_coluna_se_tiver;

* Para remover uma coluna de uma tabela, você usa a ALTER TABLE DROP COLUMN instrução:

 ALTER TABLE
           nome_tabela
 DROP COLUMN
            nome_coluna;

* Para renomear uma coluna, você usa a ALTER TABLE RENAME COLUMN TO instrução:

 ALTER TABLE
            nome_tabela
 RENAME COLUMN
             nome_coluna
 TO
   novo_nome_coluna;
   
* Para alterar um valor padrão da coluna, você usa ALTER TABLE ALTER COLUMN SET DEFAULT ou DROP DEFAULT:

 ALTER TABLE
           nome_tabela
 ALTER COLUMN 
             nome_coluna
 [SET DEFAULT valor | DROP DEFAULT];
 
* Para alterar a NOT NULLrestrição , você usa a ALTER TABLE ALTER COLUMN instrução:

 ALTER TABLE 
            nome_tabela
 ALTER COLUMN 
            nome_coluna
 [SET NOT NULL | DROP NOT NULL];

* Para adicionar uma CHECK restrição, você usa a ALTER TABLE ADD CHECK instrução:

 ALTER TABLE
           nome_tabela
 ADD CHECK 
          expressao;

* Geralmente, para adicionar uma restrição a uma tabela, você usa a ALTER TABLE ADD CONSTRAINT instrução:

 ALTER TABLE 
           nome_tabela
 ADD CONSTRAINT 
              nome_restricao definicao_restricao;

* Para renomear uma tabela, você usa a ALTER TABLE RENAME TO instrução:

 ALTER TABLE
            nome_tabela
 RENAME TO
          novo_nome_tabela;

* ALTER TABLE Exemplos de PostgreSQL:
 
  - CRIANDO UMA TABELA PARA PODER TRALHAR COM O ALTER TABLE ISTRUÇÃO:
  
  CREATE TABLE links(
         id_link SERIAL PRIMARY KEY,
	     titulo VARCHAR(512) NOT NULL,
	     url VARCHAR(1024) NOT NULL
  );
  
  - ADICONADO UMA NOVA COLUNA A TABELA LINKS:
  
     ALTER TABLE 
	             links
	 ADD COLUMN 
	           ativado BOOLEAN;

  - REMOVENDO UMA COLUNA DA TABELA  LINKS:
  
    ALTER TABLE
	           links
    DROP COLUMN
	          ativado;

  - ALTERANDO O NOME DA COLUNA TITULO para TITULO_LINK:
  
    ALTER TABLE 
	           links
	RENAME COLUMN
	             titulo TO titulo_link;
 
 - ADICIONANDO UMA NOVA COLUNA A TABELA LINKS:
 
  ALTER TABLE 
              links
  ADD COLUMN 
            alvo VARCHAR(10);
			
 - DEFININDO UM VALOR PADRÃO PARA A COLUNA ALVO DA TABELA LINKS:
   valor_padrão = em branco(_blank);
   
   ALTER TABLE
              links
   ALTER COLUMN
               alvo
   SET DEFAULT 
              '_blank';

 - INSERINDO UM REGISTRO(VALOR) NA TABELA LINKS SEM INFORMAR O VALOR
   DA COLUNA alvo PARA QUE ELE AUTOMATICAMENTE DE O VALOR PADRÃO,
   PARA O REGISTRO, VER SE O VALOR PADRÃO DEFINIDO NESSA COLUNA
   ESTA FUNCIONANDO:
  
   INSERT INTO
              links(titulo_link,url)
   VALUES
        ('PostgreSQL Tutorial','https://www.postgresqltutorial.com/');	           
	   
   SELECT * FROM links;   
 - ADICIONANDO UMA CONDIÇÃO CHECK PARA A COLUNA alvo DE MODO QUE
   A COLUNA ALVO SO ACEITE OS SEGUINTES VALORES:
   _self(auto),_blank(em branco),_parent(mae ou pai),_top(topo)
   
   ALTER TABLE 
              links
   ADD CHECK (alvo IN ('_self','_blank','_parent','_top'));
   
   
 - ADICIONANDO UMA RESTRIÇÃO UNIQUE A COLUNA url, para cada URL INFORMADA SER UNICA:
  
   ALTER TABLE 
              links
   ADD CONSTRAINT 
                unique_url UNIQUE(url);
  
 - MUDANDO O NOME DA TABELA:
   
   ALTER TABLE 
              links
   RENAME TO
             urls;
    
 
 
 
 