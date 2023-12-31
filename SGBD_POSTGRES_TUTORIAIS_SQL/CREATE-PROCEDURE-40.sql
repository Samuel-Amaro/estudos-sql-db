# CREATE PROCEDURE

 RESUMO = neste tutorial, você aprenderá como usar a CREATE PROCEDURE instrução PostgreSQL para criar novos procedimentos armazenados;
 
* INTRODUÇÃO Á CREATE PROCEDURE ISTRUÇÃO
 
  - Uma desvantagem das funções definidas pelo usuário é que elas não podem executar transações . Em outras palavras, dentro de uma função definida pelo usuário, você não pode iniciar uma transação e confirmá-la ou retrocedê-la;
  - Para definir um novo procedimento armazenado, você usa a create procedure instrução;
  - SINTAXE:
  
   CREATE [OR REPLACE] PROCEDURE nome_procedure(lista_parametros)
   LANGUAGE plpgsql
   AS $$
   DECLARE
      -- declaração de variaveis
   BEGIN
      -- corpo da procedimento armazenado
   END;$$
   
   - especificar o nome do procedimento armazenado;
   - definir os parametros para o procedimento armazenado;
   - especificar linguagem;
   
   - Um procedimento armazenado não retorna um valor. Você não pode usar a returninstrução com um valor dentro de um procedimento de armazenamento como este:
   
    RETURN expression;
	
   - No entanto, você pode usar a returninstrução sem o expressionpara interromper o procedimento armazenado imediatamente:
   
     RETURN;
	 
   - Se você deseja retornar um valor de um procedimento armazenado, você pode usar parâmetros com o inout modo.
   
* EXEMPLOS DE ISTRUÇÃO CREATE PROCEDURE 

 - USAREMOS A SEGUINTE TABELA PARA EXEMPLO:
  
	drop table if exists accounts;

	create table accounts (
    	id int generated by default as identity,
    	name varchar(100) not null,
    	balance dec(15,2) not null,
    	primary key(id)
	);
  
    insert into accounts(name,balance)
	values('Bob',10000);

	insert into accounts(name,balance)
	values('Alice',10000);
	
   - MOSTRANDO DADOS DA TABELA CRIADA:
   
    SELECT * FROM accounts;
	
   - CRIANDO UM PROCEDIMENTO ARMAZENADO QUE TRASFERE UMA DETERMINADA QUANTIA DE DINHEIRO DE UMA CONTA PARA OUTRA:
   
     CREATE OR REPLACE PROCEDURE transfere(conta_id_origem INT,conta_id_destino INT,valor DEC)
	 LANGUAGE plpgsql
	 AS $$
	 BEGIN
	    -- subtraindo valor da conta do remetente, fazendo um saque
		UPDATE accounts
		SET balance = balance - valor
		WHERE id = conta_id_origem;
		-- fazendo deposito na conta de destino
		UPDATE accounts
		SET balance = balance + valor
		WHERE id = conta_id_destino;
		COMMIT;
	 END;$$
	 
* CHAMANDO UM PROCEDIMENTO ARMAZENADO:

 - Para chamar um procedimento armazenado, você usa a CALLinstrução da seguinte maneira:
 
   CALL nome_procedimento_armazenado(lista_argumentos);
   
 - um exemplo que invoca o procedimento armazenado para trasferir R$1,000 da conta de bobo para conta de alice:
 
  CALL trasfere(1,2,1000);
  
 - vendo se a trasferencia deu certo
 
   SELECT * FROM accounts;
 