--  como usar a WHERE cláusula PostgreSQL para filtrar linhas retornadas por uma SELECTinstrução.
-- WHERE(ONDE)
-- SINTAXE:
SELECT colunas FROM nome_tabela WHERE condicao ORDER BY expressao;
--  A WHERE cláusula usa o condicao para filtrar as linhas retornadas da SELECT cláusula;
-- O condition deve ser avaliado como verdadeiro, falso ou desconhecido;
-- Pode ser uma expressão booleana ou uma combinação de expressões booleanas usando os operadores AND e OR;
-- A consulta retorna apenas linhas que satisfazem o conditionin na WHERE cláusula. 
-- Em outras palavras, apenas as linhas que fazem com que as condition 
-- avaliações sejam verdadeiras serão incluídas no conjunto de resultados;
-- COMO POST GRES AVALIA ?
-- FROM -> WHERE -> SELECT -> ORDER BY;

-- PARA AJUDAR A FORMAR A CONDIÇÃO NA CLAUSULA WHERE EXISTE OS OPERADORES DE COMPARAÇÃO E LOGICO QUE AJUDAM, A FORMAR,
-- A CONDIÇÃO:
  > MAIOR QUE
  = IGUAL
  < MENOR QUE
  >= MAIOR OU IGUAL
  <= MENOR OU IGUAL
  <> OU != NÃO IGUAL(DIFERENTE)
  AND OPERADOR LOGICO (E)
  OR OPERADOR LOGICO (OU)
  IN Retorna verdadeiro se um valor corresponder a qualquer valor em uma lista
  BETWEEN Retorna verdadeiro se um valor estiver entre um intervalo de valores especificados
  LIKE Retorna verdadeiro se um valor corresponder a um padrão
  ISNULL Retorna verdadeiro se um valor e nullo
  NOT NEGAR O RESULTADO DE OUTROS OPERADORES(INVERTE O RESULTADO DE OUTROS OPERADORES)
  
  
-- EXEMPLO 01 USANDO O OPERADOR IGUAL(=) PARA PROCURAR UM NOME DE PRODUTO
SELECT nome_produto,preco_produto,validade_produto FROM produto WHERE nome_produto = 'Bucha';

-- EXEMPLO 02 USANDO O OPERADOR AND(E) PARA PROCURAR UM  PRODUTO
SELECT nome_produto,validade_produto,preco_produto FROM produto 
WHERE nome_produto = 'Mouse sem fio' AND preco_produto = 45.79;

-- EXEMPLO 03 USANDO OPERADOR OR(OU) PARA PROCURA DOIS PRODUTOS
SELECT nome_produto,validade_produto,preco_produto FROM produto 
WHERE nome_produto = 'Mouse sem fio' OR nome_produto = 'Sabonete';

-- EXEMPLO 04 USANDO OPERADOR IN(retorna os valores que corresponderem a uma lista que for passada),
-- PARA PROCURAR PRODUTO QUE POSSUI DATA VALIDADE NO MES 12 e 1 e 06
SELECT nome_produto,validade_produto,preco_produto FROM produto 
WHERE validade_produto IN ('06/2020','01/2020','12/2020');

-- EXEMPLO 05 - USANDO O OPERADOR LIKE para procurar produtos que começam com a letra A
-- procura uma string que corresponde a um padrão
SELECT nome_produto,validade_produto,preco_produto FROM produto 
WHERE nome_produto LIKE 'A%';

-- EXEMPLO 06 - USANDO O OPERADOR BETWENN QUE SELECINA VALORES QUE SO ESTÃO DENTRO DE UM INTERVALO;
-- A CONSULTA VAI CALCULAR O TAMANHO DE CADA STRING E VAI MOSTRAR SO AS QUE ESTÃO DENTRO DE UM INTERVALO DE TAMANHO,
-- TRAZ STRINGS DE NOME DE PRODUTO QUE TENHA TAMANHO DE ATE 8 CARACTERES
LENGTH(STRING) obtem o numero de caracteres de uma string;
SELECT nome_produto, LENGTH(nome_produto) AS "Tamanho String" FROM produto 
WHERE LENGTH(nome_produto) BETWEEN 1 AND 8; 

-- EXEMPLO 07 - seleciona produtos que tenham data de validade de janeiro de 2020 que possuam o preco diferente de 2.99
SELECT nome_produto,validade_produto,preco_produto FROM produto 
WHERE validade_produto IN ('01/2020') AND preco_produto <> 2.99;


