-- FUNÇÕES MATEMATICAS E OPERADORES ARITMETICOS AULA 32 MYSQL BOSON

-- OPERAÇÕES ARITMETICAS
   -- e possivel relizar operações matematicas simples nos valores de uma coluna e retornar resultados em um coluna calculada.
   -- para isso usamos os operadores matematicos comuns:
   -- + soma
   -- - subtração
   -- / divisão
   -- * multiplicação
   -- % ou MOD modulo(resto de uma divisão)
   -- DIV divisão inteira
   
-- EXEMPLOS:

SELECT 3 * 9;

-- exemplo usando coluna e tabela.(pego o preço de cada livro e multiplico por 5 e mostro)
SELECT nome_livro, preco_livro * 5 AS 'Preço De 5 Unidades' FROM livro;

SELECT 2 * 9 / 3;

-- dando um desconto nos preços dos livros
SELECT nome_livro, preco_livro / 2 AS 'Preço de Cada Livro com 50% Desconto!.' FROM livro;

SELECT 10 / 3 AS '10 / 3 divisão inteira';

SELECT 10 MOD 3 AS 'Resto da Divisão de 10/3';

-- FUNÇÕES MATEMATICAS:
   -- e possivel tambem utilizar funções matematicas nos valores de uma coluna e retornar resultados em uma coluna calculada.
   -- abaixo vemos algumas funções matematicas mais comuns:

   -- CEILING() arrendodar para cima
   -- FLOOR() arrendoda para baixo
   -- PI()   retorna o valor de PI
   -- POW(x,y) retorna x elevado a y
   -- SQRT() retorna a raiz quadrada de um argumento
   -- SIN()   retorna o seno de um numero informado em radianos.
   -- HEX() retorna a representaçaõ hexadecimal de um valor decimal.
   

-- EXEMPLOS:
 
 -- arredondando para cima
SELECT nome_livro,ceiling(preco_livro * 5) AS 'Preço De 5 Unidades Arredondados' FROM livro; 

SELECT PI() AS 'Valor de PI';

SELECT POW(2,4) AS '2 elevado a 4';

SELECT SQRT(81) AS 'Raiz Quadrada de 81';
   
SELECT SIN(PI()) AS 'Seno de PI';

SELECT HEX(1200) AS '1200 em HEXADECIMAL';   

   
   
   
   
   
   
   
   
   
   
   