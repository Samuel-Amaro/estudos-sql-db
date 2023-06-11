# TIPOS DE LINHA PL/PGSQL;

 RESUMO =  neste tutorial, você aprenderá como usar os tipos de linha PL / pgSQL 
  para declarar variáveis de linha que contêm uma linha completa de um conjunto de resultados;
  
* INTRODUÇÃO AOS TIPOS DE LINHA PL/pgSQL:

 - Para armazenar a linha inteira de um conjunto de resultados retornado pela select into instrução, você usa a variável de tipo de linha ou variável de linha.
 
 - Você pode declarar uma variável que tenha o mesmo tipo de dados que o tipo de dados da linha em uma tabela usando a seguinte sintaxe:
 
   linha_variavel nome_tabela%ROWTYPE;
   linha_variavel nome_view%ROWTYPE;
   
   - para acessar o campo individual da variavel de linha:
   
     linha_Variavel.nome_campo
   
* EXEMPLOS DE TIPOS DE LINHA PL/pgSQL

 - usaremos a tabela ator do banco de dados amostra, para mostrar como funcionam os tipos de linha:
 
 -  exemplo a seguir mostra o nome e o sobrenome da identificação dea ator 10:
 
  DO $$
  DECLARE
    -- variavel que vai armazenar a  linha selecionada, tipo da variavel e cujo tipo de dados igual a linha da tabela actor
     ator_selecionado actor%ROWTYPE;
  BEGIN	 
	--seleciona o ator do id 10, e atribui o resultado a variavel
	SELECT * FROM actor INTO ator_selecionado WHERE actor_id = 10;
	-- mostra o ator selecionado atraves da variavel que armazena a linha de resultado 
	RAISE NOTICE 'Nome do ator Selecionado e % %',
	-- acessa os campos da linha atraves da variavel que e do mesmo tipo da linha
	ator_selecionado.first_name, -- primeiro nome
	ator_selecionado.last_name;-- sobrenome ator;
   END; $$