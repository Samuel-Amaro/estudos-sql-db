-- INSERINDO DADOS EM TABELAS (INSERT INTO)
-- SINTAXE:
INSERT INTO nome_tabela(coluna1,coluna2,coluna3) VALUES(valor1,valor2,valor3);
-- obs: os valores inseridos tem que obedecer as ordens da coluna, cada coluna tem seu respectivo valor inserido
-- coluna1 recebe valor1, coluna2 recebe valor2, coluna3 recebe valor3 etc.....

-- OBS TEM QUE RESPEITAR A INTEGRIDADE DO BANCO DE DADOS
-- NÃO PODE INSERIR EM TABELAS RELACIONADAS VALORES UNICOS SEM ASSOCIAÇÕES DE VALORES ENTRE AS TABELAS
-- PRIMEIRO SE INSERI VALORES EM TABELAS SEM RELACIONAMENTOS
-- EX: PARA TER LIVROS COM AUTORES E EDITORAS E PRECISO INSERIR AUTORES E EDITORAS EM SUAS TABELAS

-- INSERINDO DADOS NAS TABELAS AUTORES:
INSERT INTO autores(id_autor,nome_autor,sobrenome_autor) VALUES(1,'Daniel','Barret');
INSERT INTO autores(id_autor,nome_autor,sobrenome_autor) VALUES(2,'Gerald','Carter');
INSERT INTO autores(id_autor,nome_autor,sobrenome_autor) VALUES(3,'Mark','Sobel');
INSERT INTO autores(id_autor,nome_autor,sobrenome_autor) VALUES(4,'Willian','Stanek');
INSERT INTO autores(id_autor,nome_autor,sobrenome_autor) VALUES(5,'Richard','Blum');

-- INSERINDO NA TABELA EDITORAS CHAVE PRIMARIA E AUTO_INCREMENT
INSERT INTO editoras(nome_editora) VALUES('Prentice Hall');
INSERT INTO editoras(nome_editora) VALUES('O Reilly');
INSERT INTO editoras(nome_editora) VALUES('Microsoft Press');
INSERT INTO editoras(nome_editora) VALUES('Wiley');

-- AGORA TENDO INSERIDO NAS TABELAS AUTORES E EDITORAS QUE ESTÃO ASSOCIADAS NA TABELA LIVRO, POSSO INSERIR NA TABELA LIVRO:
INSERT INTO livro(nome_livro,isbn,data_public,preco_livro,id_autor,id_editora) VALUES('Linux Comand Line and Shell Scripting',2827628,20200204,68.32,5,4);
INSERT INTO livro(nome_livro,isbn,data_public,preco_livro,id_autor,id_editora) VALUES('SSH, The Secure Shell',127465311,20200204,58.30,1,2);
INSERT INTO livro(nome_livro,isbn,data_public,preco_livro,id_autor,id_editora) VALUES('Using Samba',1236532,20001221,61.35,2,2);
INSERT INTO livro(nome_livro,isbn,data_public,preco_livro,id_autor,id_editora) VALUES('Fedora And Hat Linux',4327363518,20200204,79.90,3,1);
INSERT INTO livro(nome_livro,isbn,data_public,preco_livro,id_autor,id_editora) VALUES('Windows Server 2012',213475832,20200204,48.25,3,3);
