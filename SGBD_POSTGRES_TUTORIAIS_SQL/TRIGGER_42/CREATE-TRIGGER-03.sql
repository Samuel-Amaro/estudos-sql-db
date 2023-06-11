# CREATE TRIGGER - CRIAR GATILHO

 RESUMO =  neste tutorial, você aprenderá como usar a CREATE TRIGGER instrução PostgreSQL para criar um gatilho.
 
* PARA CRIAR UM NOVO GATILHO NO POSTGRESQL SEGUIR AS SEGUINTES REGRAS:

 - CRIAR UMA FUNÇÃO DE GATILHO USANDO A CREATE FUNCTION -> ESSA FUNÇÃO DA AÇÃO PARA O GATILHO;
 - VINCULAR A FUNÇÃO DE GATILHO A UMA TABELA USANDO A CREATE TRIGGER ISTRUÇÃO;
 
* SINTAXE DA CREATE TRIGGER

 - Uma função de disparo é semelhante a uma função normal definida 
   pelo usuário . No entanto, uma função de gatilho 
   não aceita nenhum argumento e tem um valor de retorno 
   com o tipo trigger.
   
 - SINTAXE:   
 
  CREATE FUNCTION funcao_trigger()
  	RETURNS TRIGGER
  	LANGUAGE PLPGSQL
  AS $$
  BEGIN
      -- logica do gatilho(TRIGGER)
  END;
  $$;
  
 - Observe que você pode criar uma função de gatilho usando qualquer 
   linguagem suportada pelo PostgreSQL. 
   Neste tutorial, usaremos PL / pgSQL.
   
 - Uma função de gatilho recebe dados sobre seu ambiente de chamada 
  por meio de uma estrutura especial chamada TriggerData 
  que contém um conjunto de variáveis locais.
  
 - Por exemplo, OLD e NEW representam os estados da linha na tabela antes ou depois do evento de acionamento.
 
 - PostgreSQL também oferece outras variáveis locais precedidas por TG_ tais como TG_WHEN, e TG_TABLE_NAME.
 
 - Uma vez que você definir uma função de gatilho, você pode vinculá-lo a um ou mais eventos de disparo, como INSERT, UPDATE, e DELETE.
 
 
* INTRODUÇÃO Á CREATE TRIGGER

 - CRIANDO UM NOVO GATILHO;
 - MOSTRANDO ESPECIFICAMENTE A SINTAXE DA CREATE TRIGGER:
 
 CREATE TRIGGER nome_gatilho
  	{BEFORE | AFTER} {EVENT}
	ON nome_tabela
	[FOR [EACH] {ROW | STATEMENT}]
	   EXECUTE PROCEDURE funcao_gatilho
	   
 - NESTA SINTAXE:
 
   - primeiro especificar,nome_gatilho, definir o nome do gatilho;
   - segundo, especificar o tempo que causa o disparo do gatilho, pode ser
     BEFORE ou AFTER ocorre um evento;
   - terceiro, especifique o evento que invoca o gatilho. o evento pode ser 
   INSERT, DELETE, UPDATE ou TRUNCATE;
   - quarto especificar o nome da tabela associada ao acionador após a ON palavra-chave;
   - quinto, especificar o tipo de gatilhos que podem ser:
     - gatilho de nivel de linha que é especificado pela FOR EACH ROW;
	 - gatilho no nivel da istrução que é especificado pela FOR EACH STATEMENT;
	 
 - Um gatilho de nível de linha é disparado para cada linha, enquanto um gatilho de nível de instrução é disparado para cada transação.
 - Suponha que uma tabela tenha 100 linhas e dois gatilhos que serão disparados quando DELETE ocorrer um evento.
 - Se a DELETE instrução excluir 100 linhas, o acionador de nível de linha será disparado 100 vezes, uma para cada linha excluída. 
   Por outro lado, um gatilho de nível de instrução será disparado uma vez, independentemente de quantas linhas forem excluídas.
   
 - Finalmente, especifique o nome da função de gatilho após as EXECUTE PROCEDURE palavras - chave.  
 
 
* EXEMPLO DE POSTGRESQL CREATE TRIGGER

 - CRIANDO UMA NOVA TABELA CHAMADA EMPREGADOS
 
 
 CREATE TABLE empregados_teste(
 		  id INT GENERATED ALWAYS AS IDENTITY,
	    primeiro_nome VARCHAR(40) NOT NULL,
	    segundo_nome VARCHAR(40) NOT NULL,
	    PRIMARY KEY(id)
 );
 
 - Suponha que quando o nome de um funcionário muda, 
  você deseja registrar as mudanças em uma tabela separada chamada
  AUDITORIA_FUNCIONARIOS:
  
  - CRIANDO TABELA DE AUDITORIA DE FUNCIONARIOS
  
  CREATE TABLE auditoria_funcionarios(
  		id INT GENERATED ALWAYS	AS IDENTITY,
	    id_funcionario INT NOT NULL,
	    segundo_nome VARCHAR(40) NOT NULL,
	    modou_em TIMESTAMP(6) NOT NULL
  ); 
  
 - CRIANDO UMA NOVA FUNÇÃO CHAMADA  registrar_mudanca_sobrenome();
 	
	CREATE OR REPLACE FUNCTION registrar_mudanca_sobrenome()
		RETURNS TRIGGER
		LANGUAGE PLPGSQL
		AS
	$$
	BEGIN
	  
	    -- obs: OLD = ANTES e NEW = DEPOIS do evento ter sido acionado, representa o estado das linhas da tabela
	    
	 	IF NEW.segundo_nome <> OLD.segundo_nome THEN -- se os nomes forem difentes nos dois estados e porque vai haver mudança de sobrenome
		    -- inseri essa mudança de sobrenome na tabela auditoria
			INSERT INTO auditoria_funcionarios(
			id_funcionario,segundo_nome,modou_em
			) VALUES
			(OLD.id,OLD.segundo_nome,NOW());
		END IF;
		-- retorna o estado da linha apos o acionamento do evento
		RETURN NEW;
	END;
	$$

 - A função insere o sobrenome antigo na auditoria_funcionarios tabela, 
  incluindo a identificação do funcionário, 
  o sobrenome e a hora da alteração, 
  se o sobrenome de um funcionário for alterado.
	
 - 	O OLD representa a linha antes da atualização, 
    enquanto o NEW representa a nova linha que será atualizada. 
	O OLD.segundo_nome retorna o sobrenome antes da atualização 
	e o NEW.segundo_nome retorna o novo sobrenome.
	
 - Em segundo lugar, vincule a função de gatilho à empregados_teste tabela.
   O nome do gatilho é mudanca_de_sobrenome. 
   Antes que o valor da segundo_nome coluna seja atualizado, 
   a função de gatilho é automaticamente chamada para registrar 
   as alterações.
 
 CREATE TRIGGER mudanca_de_sobrenome
   BEFORE UPDATE -- evento que faz o gatilho ser disparado
   ON empregados_teste -- O EVENTO TEM QUE SER DISPARADO DESSA TABELA, PARA O GATILHO SER INVOCADO AUTOMATICAMENTE
   FOR EACH ROW
   EXECUTE PROCEDURE registrar_mudanca_sobrenome(); -- função que sera executada ao disparar o gatilho quando o evento de UPDATE estiver acontecendo na tabela empregados teste
 
 - INSERINDO REGISTROS NA TABELA empregados_teste:
 
  INSERT INTO empregados_teste(primeiro_nome,segundo_nome)
  VALUES ('John','Doe');
  INSERT INTO empregados_teste(primeiro_nome,segundo_nome)
  VALUES ('Lily','Bush');
  
 - VENDO SE O INSERT DEU CERTO:
 
   SELECT * FROM empregados_teste;
   
 - SUPONDO QUE A 'Lily Bush' modou seu sobrenome para 'Lily Brown':
 
  - ATUALIZANDO O SOBRENOME DA 'Lily Bush':
  
   UPDATE empregados_teste SET segundo_nome = 'Brown'
   WHERE ID = 2;
		
  - VERIFICANDO SE O SOBRENOME FOI ATUALIZADO:
  
    SELECT * FROM empregados_teste;
	
  - verificando se a minha triger funcionou e registrou a mudança de sobrenome
  na tabela_audioria funcioanrios:
  
  SELECT * FROM auditoria_funcionarios;
  
 - vera que o gatilho efetou a mudança e armazenou na tabela, vendo que o gatilho registrou a mudança na tabela
 
 
	