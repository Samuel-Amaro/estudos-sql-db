# DROP PROCEDURE - APAGAR UM PROCEDIMENTO ARMAZENADO

 RESUMO = neste tutorial, você aprenderá como usar a instrução drop procedure do PostgreSQL para remover um procedimento.
 
* INTRODUÇÃO Á DECLARAÇÃO DO PROCEDIMENTO DE DESCARTE

 - A drop procedureinstrução remove um procedimento armazenado;
 - SINTAXE:
 
   DROP PROCEDURE [IF EXISTS] nome_procedure(lista_argumentos)
   [CASCADE | RESTRICT]
   
   - nome procedimento armazenado;
   - especificar a lista de argumentos, se o nome do procedimento armazenado não for exclusivo no banco de dados;
   - precisa da lista de argumentos para saber qual procedimento armzenado vou remover;
   - usar a cascade opção para descartar procedimentos armazenados e seus objetos dependendentes e os objetos que dependem desses objetos e assim por diante;
   
* CRIAÇÃO DE UM PROCEDIMENTO ARMAZENADO DE AMOSTRA:

  - CRIAR PROCEDIMENTOS ARMAZENADOS QUE GERENCIAM ATORES
  
  - CRIADO UM PROCEDIMENTO ARMAZENADO QUE INSERI UMA NOVA LINHA NA TABELA ACTOR. ELE ACEITA DOIS ARGUMENTOS, QUE SÃO O NOME E SOBRENOME DO ATOR:
  
   CREATE OR REPLACE inserir_ator(nome VARCHAR,sobrenome VARCHAR)
   LANGUAGE plpgsql
   AS $$
   BEGIN
	 -- inserindo um novo ator na tabela
	 INSERT INTO actor(first_name,last_name)
	 VALUES ('John','Doe');
   END; $$
   
   
   - apagando dropando o procedimento armazenado acabado de ser criado:
   
   DROP PROCEDURE inserir_ator(VARCHAR,VARCHAR);