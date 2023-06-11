-- como usar o operador PostgreSQL BETWEEN para comparar um valor com uma faixa de valores.
-- Você usa o BETWEEN operador para comparar um valor com um intervalo de valores.
-- SINTAXE:
valor BETWEEN valor_baixo AND valor_alto;
-- Se valuefor maior ou igual ao lowvalor e menor ou igual ao highvalor, a expressão retorna verdadeiro, caso contrário, retorna falso

-- VERIFICAR SE UM VALOR ESTA FORA DE UM INTERVALO
valor NOT BETWEEN valor_baixo AND valor_alto;

-- A seguinte expressão é equivalente à expressão que usa os operadores NOTe BETWEEN:
-- OPERADORES QUE FAZER A MESMA CONSULTA SO QUE SEM USAR O BETWEEN:
VALOR < valor_baixo OR valor > valor_alto;

-- EXEMPLO 01 SELIONANDO PRODUTOS QUE POSSUIM O PRECO
-- NO SEGUINTE INTERVALO
SELECT id_produto,nome_produto,preco_produto FROM produto
WHERE preco_produto BETWEEN 0.01 AND 2.99;

-- PARA OBTER VALORES QUE NÃO ESTEJAM NO SEGUINTE INTERVALO
SELECT id_produto,nome_produto,preco_produto FROM produto
WHERE preco_produto NOT BETWEEN 0.01 AND 2.99;

