-- CRIANDO A BASE DE DADOS
CREATE DATABASE livraria;

-- obs: ao executar scripts de DDL principalmente de criação existe regras.
-- execute os scripts de tabelas simples, depois execute os scripts de tabelas compostas.
-- depois execute os scripst de alteração de tabelas para criar os relacionamentos.

 
-- CRIANDO TABELAS

-- criando tabela cliente, tabela Simples sem composição de chaves estrangeiras
CREATE TABLE cliente(codigo int primary key auto_increment,
                     nome varchar(30) not null,
                     cidade varchar(40) not null,
                     cep varchar(10) not null,
                     estado varchar(20) not null,
                     referencia varchar(100) not null
                     );
		
-- aplicando uma alteração na tabela, esqueceu dois campos importantes, CPF,CNPJ,TIPO CLIENTE,sendo que cpf,cnpj, são opcionais porque, quando,
-- um cliente e juridico, ele não e fisico, ou o inversso.
ALTER TABLE cliente ADD column cpf varchar(15);
ALTER TABLE cliente ADD column cnpj varchar(15);
ALTER TABLE cliente ADD column tipo_cliente varchar(20);


-- criando tabela telefone_cliente, para que o cliente possa ter um ou mais telefones, essa tebela e composta, ela precisa da chave primaria de cliente,
-- que aqui sera chave estrangeira.
CREATE TABLE telefone_cliente(id_cliente int not null,
                              telefone varchar(10)
                              );
                                                            

-- fazendo o relacionamento entre a tabela cliente e cliente telefone
ALTER TABLE telefone_cliente ADD CONSTRAINT fk_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(codigo);

-- criando tabela Livro
CREATE TABLE livro(isbn bigint primary key auto_increment,
                   titulo_livro varchar(30) not null,
                   nome_autor varchar(30) not null,
                   assunto_livro varchar(30) not null,
                   id_editora int not null,
                   qtd_em_estoque int not null
                   );

-- fazendo o relacionamento entre editora e livro, uma editora fornece um livro
ALTER TABLE livro ADD CONSTRAINT fk_editora FOREIGN KEY(id_editora) REFERENCES editora(codigo);

                   
-- criando tabela_aux para compor o relacionamento, cliente_compra_livro, tabela composta por duas chaves primarias de tabelas diferentes,
-- essa tabela vai ser composta por duas chaves estrangeiras de diferentes tabelas
CREATE TABLE cliente_compra_livro(isbn bigint,
								  id_cliente int,
                                  data_compra date
                                  );

-- criando o relacionamento que essa tabela auxiliar compoe, isso e um cliente compra nenhum ou varios livros, e um livro e vendido para
-- nenhum ou varios clientes, porque existem varios livros do mesmo tipo no estoque.
ALTER TABLE cliente_compra_livro ADD CONSTRAINT fk_isbn FOREIGN KEY(isbn) REFERENCES livro(isbn);
ALTER TABLE cliente_compra_livro ADD CONSTRAINT fk_id_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(codigo);

                                  
-- criando tabela editora, tabela simples
CREATE TABLE editora(codigo int primary key auto_increment, 
                     nome_editora varchar(30) not null,
                     nome_gerente varchar(25) not null,
                     cidade varchar(30) not null,
                     estado varchar(20) not null,
                     cep varchar(10) not null,
                     numero int not null
                    );
                    
-- criando tabela telefone_editora, e uma tabela composta por chave estrangeira da tabela editora,
-- uma editora pode ter um ou mais telefones
CREATE TABLE telefone_editora(id_editora int not null,
                     telefone varchar(10) not null
                     );
                     
-- criando relacionamento que compoe a tabela telefone editora, isso e uma editora pode ter um ou varios telefones
ALTER TABLE telefone_editora ADD CONSTRAINT fk_editora_telefone FOREIGN KEY(id_editora) REFERENCES editora(codigo);                     
