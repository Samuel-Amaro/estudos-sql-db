# ALTER TRIGGER

 RESUMO = neste tutorial, você aprenderá como usar a ALTER TRIGGER instrução PostgreSQL para renomear um gatilho.
 
* INTRODUÇÃO Á INSTRUÇÃO ALTER TRIGGER DO POSTGRESQL

 - A ALTER TRIGGERinstrução permite que você renomeie um gatilho. O seguinte mostra a sintaxe da ALTER TRIGGERi nstrução: 
 
  ALTER TRIGGER nome_gatilho
  ON nome_tabela
  RENAME TO novo_nome_gatilho;
  
  - NESTA SINTAXE:
    -  especificar o nome do acionador que deseja renomear;
	- nome da tabela associada ao acionador;
	- especificar o novo nome do acionador;
	
* EXEMPLO DE ALTER TRIGGER DO POSTGRESQL

 - primeiro, criar uma nova tabela:
 
 CREATE TABLE empregados_teste_2(
 		id_empregado INT GENERATED ALWAYS AS IDENTITY,
	    primeiro_nome VARCHAR(50) NOT NULL,
	    segundo_nome VARCHAR(50) NOT NULL,
	    salario DECIMAL(11,2) NOT NULL DEFAULT 0,
	    PRIMARY KEY(id_empregado)
 );
 
 - CRIAR UMA FUNÇÃO QUE GERE UMA EXCEÇÃO SE O NOVO SALÁRIO FOR MAIOR QUE O ANTIGO 100%:
 
  CREATE OR REPLACE FUNCTION checar_salario()
  	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	AS
  $$
  BEGIN
  		-- se o novo salario - o antigo salario / por salario antigo
		-- se ele for maior ou igual a 1
		-- lança uma exception dizendo que o salario não pode ter uma aumento tão alto
		IF(NEW.salario - OLD.salario) / OLD.salario >= 1 THEN
		  RAISE 'O incremento de salário não pode ser tão alto';
		END IF;
		
		-- retorna a nova linha de inserção ou atualização de salario
		RETURN NEW;
  END;
  $$
  
  - criando um gatilho antes da atualização de um salario:
  
  CREATE TRIGGER antes_atualizar_salario
   BEFORE UPDATE -- aciona o gatilho antes do evento de atualização
   ON empregados_teste_2 -- dessa respectiva tabela
   FOR EACH ROW -- para cada linha da atualização da tabela aciona o gatilho
   EXECUTE PROCEDURE checar_salario();
   
  - inserindo uma linha na tabela empregados_teste_2
    
	INSERT INTO empregados_teste_2(primeiro_nome,segundo_nome,salario)
	VALUES ('Mikael','Doe',100000);
	
  - ATUALIZANDO O SALARIO DO FUNCIONARIO DE ID = 2
  
  UPDATE empregados_teste_2 SET salario = 200000
  WHERE id_empregado = 2;
  
  - o gatilho ao ser acionado vai lançar uma mensagem
  
  - funciona como esperado
  
  - por fim, usar a ALTER TRIGGER istrução para renomear o 
   trigger antes_atualizar_salario para salario_antes_atualizar:
   
   ALTER TRIGGER antes_atualizar_salario
   ON empregados_teste_2
   RENAME TO salario_antes_atualizacao;
   
   