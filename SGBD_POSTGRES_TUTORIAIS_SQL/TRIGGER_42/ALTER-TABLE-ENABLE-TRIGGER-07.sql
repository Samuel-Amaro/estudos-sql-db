# HABILITAR GATILHOS

 RESUMO = neste tutorial, você aprenderá como habilitar um gatilho ou todos os gatilhos associados a uma tabela;
 
* INTRODUÇÃO Á ISTRUÇÃO ALTER TABLE ENABLE TRIGGER:

 - Para habilitar um gatilho ou todos os gatilhos associados a uma tabela, você usa a ALTER TABLE ENABLE TRIGGER instrução:
 
  ALTER TABLE nome_Tabela
  ENABLE TRIGGER nome_gatilho | ALL;
  
 - NESTA SINTAXE:
 
   - especificar o nome da tabela do gatilho que deseja ativar;
   - segundo lugar especificar o nome do gatilho que deseja ativar ou USE A ALL
   OPÇÃO se quiser ativar todos os gatilhos associados á tabela;
   
   - Um gatilho desativado não dispara quando o evento de gatilho ocorre. Para fazê-lo disparar, você precisa habilitá-lo.
   
  * EXEMPLO DE ATIVAÇÃO DE GATILHO
  
   - ATIVANDO O GATILHO salario_antes_atualizacao da tabela empregados_teste_2
   
   ALTER TABLE empregados_teste_2
   ENABLE TRIGGER salario_antes_atualizacao;
   
   - O EXEMPLO A SEGUIR ATIVA TODOS OS GATILHOS QUE PERTENCEM Á tabela
   empregados_teste_2
   
   ALTER TABLE empregados_teste_2
   ENABLE TRIGGER ALL;
   