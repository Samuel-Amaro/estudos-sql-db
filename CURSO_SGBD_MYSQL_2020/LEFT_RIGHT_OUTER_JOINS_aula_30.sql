-- LEFT e RIGHT JOIN - CONSULTAR DADOS EM MAIS DE DUAS TABELAS COM SELECTS E FILTRAGEMS - AULA 30
-- OUTER JOINS: PERMITE RETORNA DADOS PROVENIENTES DE DUAS OU MAIS TABELAS, MESMO QUANDO NÃO HA CORRESPONDECIA
-- ENTRE AS TABELAS, ENTRE OS DADOS EM AMBAS AS TABELAS OU AS LINHAS MESMO.

-- TIPOS DE OUTER JOINS:
   
   -- LEFT JOIN: Retorna todas as linhas da tabela à esquerda, mesmo se não houver nenhuma,
      -- correspondência na tabela à direita.
      -- obs: quando se tabela a esquerda e direita se fala em um diagram de tabelas com um relacionamento estabelecido entre elas.
	
   -- RIGHT JOIN: Retorna todas as linhas da tabela à direita, mesmo se não houver nenhuma correspondência na tabela á esquerda.
   
   -- FULL JOIN: Retorna linhas quando houver uma correspondência em qualquer uma das tabelas. É uma combinação de LEFT e RIGHT JOINS.
   
   -- SINTAXE LEFT JOIN:
   SELECT colunas FROM tabela_esquerda LEFT(OUTER) JOIN tabela_direita
   ON tabela_esquerda.coluna = tabela_direita.coluna;
   
   USE biblioteca;
   
   -- EXEMPLO DE LEFT JOIN:
   -- LEFT JOIN MOSTRA REGISTROS QUE POSSUI CORRESPONDECIA EM AMBAS AS TABELAS, E OS REGISTROS QUE POSSUI EM UMA TABELA MAS NÃO TEM CORRESPONDENCIA EM OUTRA.
   -- (mostrando autores que estão cadastrados mas que não possui livros publicados em suas autorias(ou cadastrados no banco de dados)).
   SELECT * FROM autores LEFT JOIN livro ON livro.id_autor = autores.id_autor;
   
 -- USANDO LEFT JOIN AINDA:
 -- TRAZENDO REGISTROS QUE POSSUI EM UMA TABELA MAS NÃO TEM CORRESPONDECIA COM A OUTRA, ISSO E EXCLUO OS REGISTROS COM CORRESPONDECIAS
 -- E TRAGO SO OS QUE NÃO POSSUI CORRESPONDENCIA.
 
 -- SINTAXE (a diferença e que agora esta sendo aplicado um filtro com WHERE para buscar na tabela onde tem que haver correposndecias,
 -- para buscar os valores null(significa que não ha correspondecia): 
 SELECT colunas FROM tabela_esquerda LEFT(OUTER) JOIN tabela_direita
 ON tabela_esquerda.coluna = tabela_direita.coluna
 WHERE tabela_direita.coluna IS NULL; -- IS NULL == E NULO
 
 -- EXEMPLO:
 -- TRAZENDO AUTORES QUE ESTÃO CADASTRADOS, MAS QUE NÃO POSSUI LIVROS PUBLICADOS EM SUAS AUTORIAS
  SELECT * FROM autores LEFT JOIN livro ON livro.id_autor = autores.id_autor WHERE livro.id_autor IS NULL;

-- RIGTH JOIN: MESMA COISA QUE LEFT SO INVERTE AS ORDENS DA TABELA
-- SINTAXE:
 SELECT colunas FROM tabela_esquerda RIGHT(OUTER) JOIN tabela_direita ON
 tabela_esquerda.coluna = tabela_direita.coluna;
 
 -- EXEMPLO USANDO RIGHT JOIN:
 -- ANTES DE FAZER O EXEMPLO INSERIR UMA EDITORAS
  INSERT INTO editoras(id_editora,nome_editora) VALUES(6,'COMPANIA DAS LETRAS');
  
  -- exemplo agora:
  SELECT * FROM livro AS L RIGHT JOIN editoras AS E ON L.id_editora = E.id_editora;
  -- exemplo de consulta com RIGHT JOIN buscando livros que possui livros e suas respectivas editoras
  -- RIGHT JOIN VAI MOSTRAR editoras que não possui livros publicados.
  -- no caso so a ultima editora inserida acima.
  
  -- se quiser excluir as correspondecias e traze so os registros que não possui correspondencias mas tem se quiser mostrar.















