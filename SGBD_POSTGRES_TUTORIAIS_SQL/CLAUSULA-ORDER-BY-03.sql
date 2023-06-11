-- como ordenar o conjunto de resultados retornado da SELECT instrução usando a cláusula ORDER BY do  PostgreSQL.;
-- QUANDO SE FAZ UMA CONSULTA COM SELECT ELE RETORNA DADOS OU LINHAS EM UMA ORDEM NÃO ESPECIFICA;
-- PARA CLASSIFICAR AS LINHAS DO CONJUNTO DE RESULTADOS DEVE-SE USAR A CLAUSULA ORDER BY NA ISTRUÇÃO;
-- A ORDER BY cláusula permite classificar as linhas retornadas por uma  SELECT cláusula 
-- em ordem crescente ou decrescente com base em uma expressão de classificação.;
-- SINTAXE:
SELECT colunas_selecionar FROM nome_tabela classifica_expressao_01[ASC | DESC],
classifica_expressao_02[ASC | DESC]...;
-- Primeiro, especifique uma expressão de classificação, que pode ser uma coluna 
-- ou uma expressão, que você deseja classificar após as ORDER BY;
-- Em segundo lugar, você usa a  ASC opção de classificar as linhas em ordem crescente e a DESC opção de 
-- classificar as linhas em ordem decrescente. Se você omitir a opção ASCou DESC, o ORDER BY usa ASCpor padrão;
-- COMO O POST GRES AVALIA ?
-- FROM -> SELECT -> ORDER BY;

-- EXEMPLO 01 classifica nome de produtos em ORDEM CRESCENTE
SELECT  nome_produto FROM produto ORDER BY nome_produto ASC;

-- EXEMPLO 02 CLASSIFICA nome de produtos em ORDEM DECRECENTE
SELECT nome_produto FROM produto ORDER BY nome_produto DESC;

-- EXEMPLO 03 CLASSIFICA AS LINHAS POR VARIAS COLUNAS
-- CLASSIFICA O NOME DO PRODUTO EM ORDEM CRESCENTE, E O PREÇO DO PRODUTO EM ORDEM DECRECENTE
SELECT nome_produto,preco_produto FROM produto ORDER BY nome_produto ASC, preco_produto DESC;


-- EXEMPLO 04 CLASSIFICA AS LINHAS POR EXPRESSÃO
-- VOU MOSTRAR O TAMANHO DA STRING DE CADA NOME DE PRODUTO, E MANDAR ORDENAR OS TAMANHOS CRESCENTEMENTE
SELECT nome_produto,LENGTH(nome_produto) AS "Tamanho String" FROM produto ORDER BY "Tamanho String" ASC;


-- No mundo do banco de dados, NULLé um marcador que indica os dados ausentes ou os dados 
-- são desconhecidos no momento da gravação;
-- Ao classificar as linhas que contêm NULL, você pode especificar a ordem NULL com outros valores 
-- não nulos usando a opção NULLS FIRST(mostra o valores null da coluna antes do valores de dados) ou 
-- NULLS LAST(mostra valores null depois por ultimo depois dos dados) da ORDER BY cláusula:
ORDER BY sort_expresssion [ASC | DESC] [NULLS FIRST | NULLS LAST]




