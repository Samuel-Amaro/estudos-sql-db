-- operador PostgreSQL IN na WHERE cláusula para verificar se um valor corresponde a qualquer valor em uma lista.
-- Você usa o IN operador na WHERE cláusula para verificar se um valor corresponde a qualquer valor em uma lista de valores.
-- SINTAXE:
VALUE IN (value1,value2,...)
-- O IN operador retorna verdadeiro se o valuecorresponde a qualquer valor na lista ou seja, value1, value2, ...
VALUE IN (SELECT nomes_colunas FROM nome_tabela);

-- EXEMPLO USANDO O OPERADOR IN PARA TRAZER OS PRODUTOS DE INDICE 1 E 2
SELECT id_produto, nome_produto FROM produto WHERE id_produto IN (1,2);

-- MESMO EXEMPLO DE CIMA USANDO OPERADORES DIFERENTES DO IN
-- USANDO O OR(ou) =(igual)
SELECT id_produto, nome_produto FROM produto WHERE id_produto = 1 OR id_produto = 2;

-- EXEPLO  USANDO OPERADORES COMBINADOS (IN,NOT(NEGAÇÃO,NÃO)) OPERADOR PARA SELECIONAR
-- LINHAS CUJOS VALORES NÃO CORRESPONDEM AOS VALORES NA LISTA
-- QUERO TODOS PRODUTOS QUE NÃO TENHA INDICE 1 E 2
SELECT id_produto, nome_produto FROM produto WHERE id_produto NOT IN (1,2);


-- EXEMPLO DA MESMA CONSULTA DE CIMA SO QUE USANDO OPERADORES <>(DIFERENTE) AND(E)
SELECT id_produto, nome_produto FROM produto WHERE id_produto <> 1 AND id_produto <> 2;


-- EXEMPLO QUE QUERO SELECIONAR TODOS PRODUTOS COM DATA DE VALIDADE DO MES 1 E 12 DESSE ANO
-- USANDO SUBCONSULTA
SELECT id_produto,nome_produto,validade_produto FROM produto WHERE
validade_produto IN 
(
SELECT validade_produto FROM produto WHERE validade_produto IN 
 ('01/2020','12/2020')
);