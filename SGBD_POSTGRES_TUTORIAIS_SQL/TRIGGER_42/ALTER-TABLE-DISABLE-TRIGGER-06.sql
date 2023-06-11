# DESATIVAR GATILHOS

 RESUMO = neste tutorial, você aprenderá como desabilitar gatilhos usando a ALTER TABLE DISABLE TRIGGER instrução.
 
* INTRODUÇÃO Á ISTRUÇÃO ALTER TABLE DISABLE TRIGGER:

 - Para desabilitar um gatilho, você usa a ALTER TABLE DISABLE TRIGGER instrução:
 
 	ALTER TABLE nome_tabela
	DISABLE TRIGGER nome_gatilho | ALL;
	
 - especificar o nome da tabela á qual o acionador está associado;
 - especifique o nome do gatilho que deseja desativar após as DISABLE TRIGGER palavras - 
 chave ou use a ALL palavra chave para desativar todos os gatilhos associados á tabela;
 
 - Quando você desativa um gatilho, ele ainda existe no banco de dados. No entanto, o gatilho desativado não será disparado quando ocorrer um evento associado ao gatilho.
 
 - Suponha que você queira desativar o gatilho associado à empregados_teste tabela, você pode usar a seguinte instrução:
  
 ALTER TABLE empregados_teste
 DISABLE TRIGGER checar_nome_usuario;
 
 - PARA DESATIVAR TODOS OS GATILHOS ASSOCIADOS Á empregados_teste
 tabela, eu devo usar a seguinte istrução:
 
 ALTER TABLE empregados_teste
 DISABLE TRIGGER ALL;
 
 
 