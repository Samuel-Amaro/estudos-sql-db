-- CRIAÇÃO DE TABELAS - COM COMANDO CREATE TABLE
-- SINTAXE:
CREATE TABLE nome_tabela(coluna tipo_de_Dados_coluna constraint,etc...);

-- EXEMPLO DE CRIAÇÃO DE UMA TABELA:
CREATE TABLE livro( id_livro smallint AUTO_INCREMENT PRIMARY KEY,
                    nome_livro varchar(50) NOT NULL,
                    isbn VARCHAR(50) NOT NULL,
                    id_autor smallint NOT NULL,
                    data_public DATE NOT NULL,
                    preco_livro DECIMAL NOT NULL
                    );
                    
-- PARA VER SE A TABELA FOI CRIADA:
SHOW TABLES;

-- MAIS EXEMPLOS DE CRIAÇÃO DE TABELAS:
CREATE TABLE autores(id_autor smallint AUTO_INCREMENT primary KEY,
                     nome_autor varchar(30),
                     sobrenome_autor varchar(30)
                     );
                     
CREATE TABLE editoras(id_editora smallint auto_increment primary key,
                      nome_editora varchar(50)
                      );
                      
                      