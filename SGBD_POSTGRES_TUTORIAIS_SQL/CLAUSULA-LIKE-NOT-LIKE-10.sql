-- usar o PostgreSQL LIKE e os ILIKE operadores para consultar dados usando correspondências de padrão.

-- EXEMPLO 01 QUERO ENCONTRAR UM CLIENE NA MINHA TABELA MAS NÃO SEI O NOME DELE COMPLETO
-- SO SEI UMA PARTE DO NOME COMO FAÇO PARA ENCONTRAR ESSE CLIENTE ?
-- USANDO O OPERADOR DE CORREPONDENCIA DE PADRÃO DE STRING O LIKE:
-- QUERO ENCONTRAR O PRODUTO ARROZ BRANCO MAS SO SEI O NOME ARR, COMO ECONTRO ?
SELECT * FROM produto WHERE nome_produto LIKE 'Arr%';

-- a STRING 'Arr%' e chamada de padrão
-- a consulta acima retorna linhas cujos valores na coluna nome_produto começam com
-- Arr e podem  ser seugidos por qualquer correspodencia de caracteres. 
-- essa tecnica e chamada de correspondencia de padrões.

-- para costruit padrões, usa combinadamente valores literais com caracteres cutingas e usar o operador
-- LIKE ou NOT LIKE para encontrar correspondências.
-- CARACTERES CURINGAS DO POSTGRES:
  % QUALQUER SEQUENCIA DE ZERO OU MAIS CARACTERES.
  _ CORRESPONDE A QUALQUER CARACTERE ÚNICO.
-- SINTAXE OPERADOR POSTGRESQL e a SEGUINTE:
valor LIKE padrão_correspondencia
-- o valor tem que corresponder ao padrão
-- PARA NEGAR O OPERADOR LIKE:
valor NOT LIKE padrão_correspondencia;
-- o valor não corresponde ao padrão retorna verdadeiro;


-- EXEMPLOS DE CORRESPONDENCIA DE PADRÕES:

SELECT 'foo' LIKE 'foo' AS padrão_completo, -- retorna true, O LIKE ATUA COMO (=) PORQUE NÃO CONTEM NENHUM CARACTERE CURINGA 
       'foo' LIKE 'f%' AS padrão_com_carctere_curinga, -- retorna true, PORQUE CORRESPONDE A QUALQUER STRING QUE COMECE COM A LETRA f e seja seguida por qualquer numero de caracteres;
	   'foo' LIKE '_o_' AS padrão_com_carctere_curinga, -- retorna true, corresponde a qualquer string que com qualquer caractere unico, seguido pela letra (o)  e termine com qualquer caractere unico; 
	   'bar' LIKE 'b_' AS padrão_com_carctere_curinga; -- retorna false, corresponde a qualquer string que comece com a letra b e seja seguida por qualquer caractere unico;
	   
	   
-- e possivel usar curingas no inicio e ou no final do padrão


-- quero buscar produtos que comecem com a letra B e o resto não importa
SELECT * FROM produto WHERE nome_produto LIKE 'B%';

-- quero buscar produtos que comecem por qualquer caracter e tenha rr a segunda letra e termine com qualquer coisa
SELECT * FROM produto WHERE nome_produto LIKE '_rr%';


-- EXEMPLOS USANDO O OPERADOR NOT LIKE
-- QUERO ENCONTRAR PRODUTOS QUE NÃO COMECEM COM A LETRA B
SELECT * FROM produto WHERE nome_produto NOT LIKE 'B%';


-- EXTENSÕES DO OPERADOR LIKE
-- ILIKE (e o mesma coisa do operador LIKE so que  o ILIKE não faz disitinção entre maiuscula e minusculas para ele todos caracteres são iguais);
-- TRAZER TODOS PRODUTOS QUE COMEÇAM COM LETRA B,b
SELECT * FROM produto WHERE nome_produto ILIKE 'b%';


-- OPERADORES QUE AGEM COMO O OPERADOR LIKE,NOT LIKE,ILIKE, E NOT ILIKE
~~ - LIKE
~~* - ILIKE
!~~ - NOT LIKE
!~~* - NOT ILIKE


