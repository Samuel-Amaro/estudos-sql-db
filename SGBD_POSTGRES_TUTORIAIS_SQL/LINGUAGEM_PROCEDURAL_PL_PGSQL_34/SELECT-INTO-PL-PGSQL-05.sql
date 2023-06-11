# PL/pgSQL  SELECT INTO

 RESUMO = neste tutorial, você aprenderá como usar a select intoinstrução PL / pgSQL para selecionar dados do banco de dados e atribuí-los a uma variável;

* INTRODUÇÃO Á ISTRUÇÃO PL/pgSQL SELECT INTO

 - A select intoinstrução permite selecionar dados do banco de dados e atribuir os dados a uma variável;
 
 - SINTAXE DA SELECT INTO:
 
  SELECT lista_seleção
  INTO nome_variavel
  FROM expressão_tabela;
  
  - eu coloco a variavel apos a INTO palavra-chave;
  - a SELECT INTO istrução atribuira os dados retornados pela SELECT cláusula á variável;

 - EXEMPLO DE ISTRUÇÃO PL/pgSQL SELECT INTO:
 
   DO $$
   DECLARE
     -- declaração de variavel
     contage_atores INTEGER;
   BEGIN
     -- seleciona o numero de atores da tabela de atores, E ATRIBUI A VARIAVEL
	 SELECT COUNT(*) INTO contage_atores FROM actor;
     -- mostrando o numero de atores
	 RAISE NOTICE 'O Numero de atores: %',contage_atores;
   END; $$