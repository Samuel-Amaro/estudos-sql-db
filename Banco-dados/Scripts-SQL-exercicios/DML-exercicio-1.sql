-- DML 
-- INSERT, UPDATE,SELECT,ALTER

-- INSERINDO DADOS NAS TABELAS

-- INSERINDO DADOS EM CLIENTE, TABELA SIMPLES, SEM COMPOSIÇÃO DE CHAVE ESTRANGEIRA
INSERT INTO cliente(nome,cidade,cep,estado,referencia,cpf,cnpj,tipo_cliente) VALUES ('Michel Lopes','São jose Rio Preto','22222-111','São Paulo','Ultima Quadra','000.000.000-90',null,'Fisico'),
('Maria Julia','Jatai','00000-999','Goias','Perto da Fabrica',null,'00063735817332','Juridico'),
('Fernado Ribeiro','Chapeco','33333-000','Santa Catarina','Atras da feira','001.002.003-00',null,'Fisico'),
('Margarida Xavier','São paulo','33313-044','São Paulo','Proximo ao Estadio Pacaembu',null,'03822904948392','Juridico');

-- VENDO SE O INSERÇÃO DE DADOS DEU CERTO NA TABELA CLIENTE
SELECT * FROM cliente;

-- INSERINDO DADOS NA TABELA TELEFONE_CLIENTE onde precisa de um cliente existente, isso e uma tabela composta de chave estrangeira,
-- isso e depende da existencia de dados em outra tabela.
INSERT INTO telefone_cliente(id_cliente,telefone) VALUES (1,'99911-0000'),(1,'03211-222'),(2,'01111-1111'),(3,'00000-9999'),(4,'11111-1111');

-- vendo se a inserção na tabela de telefone_Cliente deu certo
SELECT * FROM telefone_cliente;

-- FAZENDO UM JOIN PARA MOSTRAR OS DADOS DE CLIENTES JUNTO DE SEUS RESPECTIVOS TELEFONES
SELECT C.nome,C.cidade,C.tipo_cliente,T.telefone FROM cliente AS C JOIN telefone_cliente AS T ON C.codigo = T.id_cliente;

-- INSERINDO EDITORAS QUE FORNECEM LIVROS, tabela simples, sem composição de chaves estrangeiras
INSERT INTO editora(nome_editora,nome_gerente,cidade,estado,cep,numero) VALUES
('Saraiva','Polly Jones','São Paulo','São Paulo','22222-1111',1001),('Brasport','Michel Lins','Gavea','Rio Janeiro','33333-111',1002),
('Viena','Gutemberg JJ','Osasco','São Paulo','66666-1111',1003),('Novatec','Mauro','Campinas','Goias','00021-8900',1004);

-- vendo se a inserção na tabela EDITORA QUE E SIMPLES DEU CERTO
SELECT * FROM editora;

-- INSERINDO TELEFONES PARA AS EDITORAS, TABELA TELEFONE_EDITORA E UMA TABELA COMPOSTA POR CHAVE ESTRANGEIRA
INSERT INTO telefone_editora(id_editora,telefone) VALUES (1,'00000-1111'),(2,'99999-0000'),(2,'11111-4321'),(2,'21435-0012'),(3,'32435-0000'),(4,'12345-6789');

-- fazendo um join para verificar os telefones das EDITORAS EXISTENTES
SELECT E.nome_editora,E.cidade,E.nome_gerente,T.telefone FROM editora AS E JOIN telefone_editora AS T ON E.codigo = T.id_editora; 

-- INSERINDO LIVROS NA TABELA LIVRO
INSERT INTO livro(isbn,titulo_livro,nome_autor,assunto_livro,id_editora,qtd_em_estoque) VALUES
(201912131415,'Banco Dados Modelagem','Paulo Roberto','informatica',1,5),
(202010190190,'Estrutura Dados','Gustavo Romeu','Informatica',2,3),
(202190432242,'Linguagem C','Curouse','Informatica',3,7),
(202290322133,'Culinaria Para Iniciantes','Gustoz','Alimentos',4,2),
(212109472517,'Mecanica Amadora','Pablo Mexicano','Industria',3,10);

-- vendo se a inserção de livros deu certo
SELECT * FROM livro;

-- AGORA FAZENDO CLIENTES COMPRAR ALGUNS LIVROS
INSERT INTO cliente_compra_livro(isbn,id_cliente,data_compra) VALUES (201912131415,1,'2020-04-30'),(201912131415,1,'2020-04-30'),
(202010190190,2,'2020-04-30'),(202010190190,1,'2020-04-30'),(202010190190,3,'2020-04-30'),(202190432242,4,'2020-04-30'),(202190432242,3,'2020-04-30'),
(212109472517,4,'2020-04-30'),(212109472517,2,'2020-04-30'),(212109472517,1,'2020-04-30'),(202190432242,3,'2020-04-30');

-- VENDO OS CLIENTES QUE COMPRARAM LIVROS E VENDO OS LIVROS COMPRADOS
SELECT L.titulo_livro,L.assunto_livro,L.qtd_em_estoque,C.nome,C.tipo_cliente,CCP.data_compra,
(SELECT SUM(qtd_em_estoque) FROM livro) AS quantidade_total_livros,DATE_FORMAT(CCP.data_compra,"%d/%m/%Y") as DATA_FORMATADA
FROM cliente_compra_livro AS CCP JOIN livro AS L ON CCP.isbn = L.isbn JOIN cliente AS C
ON CCP.id_cliente = C.codigo;



