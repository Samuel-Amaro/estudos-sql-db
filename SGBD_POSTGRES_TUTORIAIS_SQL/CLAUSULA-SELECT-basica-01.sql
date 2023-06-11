-- ISTRUÇÃO SELECT BASICA PARA CONSULTAR DADOS DE UMA TABELA
-- O SELECT POSSUI VARIAS CLAUSULAS QUE PODEM SER COMBINADAS PARA COSTRUIR CONSULTAS COMPLEXAS

-- ISTRUÇÃO SELECT QUE REUPERA DADOS CONSULTA DADOS DE UMA UNICA TABELA
-- SINTAXE:
SELECT lista_seleção FROM nome_tabela;
-- lista_seleção(pode ser uma coluna ou varios colunas da tabela separadas por virugla que quero selecionar ou um *
-- que diz para selecionar tudo da tabela, todas colunas)


-- EXEMPLO 01 CONSULTANDO DADOS DE UMA TABELA E SELECIONANDO UMA COLUNA
SELECT nome_produto FROM produto;

-- EXEMPLO 02 CONSULTANDO DADOS DE MULTIPLHAS COLUNAS DE UMA TABELA
SELECT nome_produto,preco_produto,validade_produto FROM produto;

-- EXEMPLO 03 CONSULTANDO DADDOS DE TODAS AS COLUNAS DE UMA TABELA
SELECT * FROM produto;