# POSTGRESQL DROP TRIGGER - COMO APAGAR UM GATILHO

 RESUMO = neste tutorial, você aprenderá como usar o PostgreSQL DROP TRIGGERpara eliminar um gatilho de uma tabela;
 
* INTRODUÇÃO Á DROP TRIGGER INSTRUÇÃO POSTGRESQL

 - PARA EXCLUIR UMA GATILHO DE UMA TABELA, EU USO A DROP TRIGGER ISTRUÇÃO
  COM A SINTAXE:
  
  DROP TRIGGER [IF EXISTS] nome_gatilho
  ON nome_tabela [CASCADE | RESTRICT];
  
  - NESTA SINTAXE:
  
    - primeiro especificar o nome do acionador que deseja excluir após 
	as DROP TRIGGER palavras-chave;
	- em segundo lugar, use a IF EXISTS para exluir condicionalmente o gatilho
	apenas se ele existir. a tentativa de excluir um gatilho inexistente sem especificar os IF EXISTS resultados da istrução em erro.
	- terceiro especificar o nome da tabela á qual o gatilho pertence. se a tabela
	pertencer a um esquema especifico, você pode usar o nome qualificado do esquema da tabela:
	nome_schema.nome_tabela.
	- quarto, use a CASCADE opção se quiser descartar objetos que dependem do gatilho automaticamente. observe que a CASCADE
	opção também excluira objetos que dependem de objetos que dependem do gatilho.
	- quinto, usar a RESTRICT opção de se recusar a descartar o gatilho se algum objeto depender dele.
	por padrão, a DROP TRIGGER istrução usa RESTRICT;
	- NO PADRÃO SQL, os nomes dos gatilhos não são locais para as tabelas,
	portanto, a istrução é simplesmente:
	
	DROP TRIGGER nome_gatilho;
	
* EXEMPLO DE UMA DROP TRIGGER DO POSTGRESQL

 - primerio criar uma função que valide o nome de usuario de um usuario de uma equipe.
  o nome de usuario da equipe não deve ser nulo  e seu comprimenro deve ser 
  de pelo menos 8
  
 CREATE FUNCTION  verificar_usuario_equipe()
 	RETURNS TRIGGER
 AS $$
 BEGIN
    
	-- SE O NOVO NOME DO USUARIO TIVER O TAMANHO < QUE 8 CARACTERES
	-- E SE O NOME FOR NULL
	-- SOLTA UMA EXCEÇÃO
	IF LENGTH(NEW.username) < 8 OR NEW.username IS NULL THEN
	   RAISE EXCEPTION 'O nome de usuario possui menos que 8 caracteres';
	END IF;
	-- SE O NOVO NOME DO USUARIO FOR NULL
	-- SOLTA EXECEÇÃO
	IF NEW.NAME IS NULL THEN
	   RAISE EXCEPTION 'Nome de usuario e NULL';
	END IF;
	-- RETORNA O NOVA LINHA DE INSERÇÃO FEITA NA TABELA
	RETURN NEW;
 END;
 $$
 LANGUAGE PLPGSQL;
 
 
 - CRIANDO UM NOVO GATILHO NA TABELA DA EQUIPE PRA VERIFICAR O NOME DE USUARIO DE UMA EQUIPE
 - ESSE GATILHO SERA ACIONADO SEMPRE QUE INSERIR OU ATUALIZAR UMA LINHA NA STAFF tabela:
 
 CREATE TRIGGER checar_nome_usuario
   BEFORE INSERT OR UPDATE -- sera acionado antes do evento de INSERT OU UPDATE
 ON staff -- tabela em que a trigger vai ser executada, e onde os eventos devem ser captados
 FOR EACH ROW -- PARA CADA LINHA DA DE INSERÇÃO OU ATUALIZAÇÃO DA TABELA, EXECUTAR ESSA TRIGER
 EXECUTE PROCEDURE  verificar_usuario_equipe(); -- quando gatilho for aciondado executara essa função de ação
 
 
 - EXCLUINDO O GATILHO CRIADO:
 
  DROP TRIGGER checar_nome_usuario
  ON staff;