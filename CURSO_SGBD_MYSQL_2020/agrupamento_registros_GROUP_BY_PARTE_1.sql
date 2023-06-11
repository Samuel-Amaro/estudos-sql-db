-- GORUPY BY - AGRUPAMENTO DE REGISTROS
-- USADO PARA AGRUPAR REGISTROS EM SUBGRUPOS BASEADOS EM COLUNAS OU VALORES RETORNADOS POR UMA EXPRESSÃO!
-- SINTAXE:
SELECT colunas FUNÇÃO_AGREGAÇÃO() FROM nome_tabela WHERE filtragem_especifica_trazer_registros_especificos 
GROUP BY qual_coluna_vai_ser_utilizada_para_fazer_agrupamento_de_dados;

-- ENTENDE MELHOR COMO FUNCIONA O GOUPY BY:
-- CRIANDO TABELA DE TESTE VENDAS NO BANCO_TESTES:
CREATE DATABASE banco_testes;
USE banco_testes;
CREATE TABLE vendas(id_venda int primary key,
                    nome_vendedor varchar(30) not null,
                    quantidade int,
                    produto varchar(50),
                    cidade varchar(50)
                    );
-- inserindo registros nessa TABELA vendas
INSERT INTO vendas (id_venda, nome_vendedor, quantidade, produto, cidade)
  VALUES
(10,'Jorge',1400,'Mouse','São Paulo'),
(12,'Tatiana',1220,'Teclado','São Paulo'),
(14,'Ana',1700,'Teclado','Rio de Janeiro'),
(15,'Rita',2120,'Webcam','Recife'),
(18,'Marcos',980,'Mouse','São Paulo'),
(19,'Carla',1120,'Webcam','Recife'),
(22,'Roberto',3145,'Mouse','São Paulo');

-- vendo se deu certo
SELECT * FROM vendas;

-- USANDO O GROUPY BY NA TABELA VENDAS:
-- CONSULTA USANDO AGREGAÇÃO PARA OBTER O TOTAL DE VENDAS DE do produto mouse:
-- explicando: SUM(função de agregação que traz o total de itens ou ocorrencias desses itens em uma tabela)
-- aplicando uma filtragem para contar so mouses
SELECT SUM(quantidade) AS Total_Mouses FROM vendas WHERE produto = 'Mouse';

-- OBSERVE AS PROXIMAS CONSULTAS:
-- CONSULTA QUE TRAZ O TOTAL DE VENDAS E SELECIONA A CIDADE:
-- traz o total de vendas baseada nos registros de quantidade inseridos na coluna quantidade:
-- soma toda a quantidade de produtos vendidos baseado na coluna quantidade(soma toda a coluna)
SELECT cidade,SUM(quantidade) as Total_Vendas FROM vendas;

-- consulta que traz o total de produtos vendidos por cidade usando o group by.
-- aqui a consulta vai somar(a coluna quantidade) sendo que por cidade,produtos vendidos por cidade
-- o total de vendas de  cada cidade agrupado por cidade, a soma_total(coluna quantidade) sendo que so soma por cidade, soma por cada cidade.
SELECT cidade,SUM(quantidade) as Total_Vendas FROM vendas GROUP BY cidade;

-- CONSULTA QUE CONTE O NUMERO DE REGISTROS DE VENDAS POR CIDADE
-- contagem do registro de vendas( A COLUNA QUE VAI SER USADA PARA AGRUPAR TEM QUE SER SELECIONADA)
-- COUNT(*) = CONTA A QUANTIDADE DE ITENS EM UMA COLUNA OU UMA TABELA INFORMADA
-- (*) TUDO == TABELA.
-- (OU PODE INFORMAR UMA COLUNA OU TABELA).
-- consulta sem o gupy by(perceba a diferença).
SELECT cidade,count(*) as Numero_Vendas_Por_Cidade FROM vendas;

-- com o groupy by
SELECT cidade,count(*) as Numero_Vendas_Por_Cidade FROM vendas GROUP BY cidade;

-- OBSERVAÇÃO:
-- SEMPRE QUE USAR UMA FUNÇÃO DE AGREGAÇÃO USA-SE TAMBEM POR CAUTELA O AGRUPAMENTO PARA NÃO TRAZER INFORMAÇÕES ERRADAS,
-- SO OLHAS AS CONSULTAS COM AGRUPAMENTO E SEM AGRUPAMENTO.