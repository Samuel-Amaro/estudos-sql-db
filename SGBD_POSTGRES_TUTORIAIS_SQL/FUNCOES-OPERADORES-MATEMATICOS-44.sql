# FUNÇÕES E OPERADORES MATEMATICOS

 - São fornecidos operadores matemáticos para muitos tipos de dado do PostgreSQL. 
 
 * OPERADORES MATEMATICOS
 
 (+)  ADIÇÃO
 (-) SUBTRAÇÃO
 (*) MULTIPLICAÇÃO
 (/) DIVISÃO(DIVISÃO INTEIRA TRUNCA O RESULTADO)
 (%) MODULO(RESTO)
 (^) EXPONENCIAÇÃO
 (|/) RAIZ QUADRADA
 (||/) RAIZ CUBICA
 (!) FATORIAL
 (!!) FATORIAL(OPERADOR DE PREFIXO)
 (@) VALOR ABSOLUTO
 (&) AND(E) BIT A BIT
 (|) OR(OU) BIT A BIT
 (#) XOR BIT A BIT
 (~) NOT(NEGAÇÃO) BIT A BIT
 (<<) DESLOCAMENTE Á ESQUERDA BIT A BIT
 (>>) DESLOCAMENTO Á DIREITA BIT A BIT
 
 - Os operadores bit a bit [1] trabalham somente em tipos de dado inteiros, enquanto os demais estão disponíveis para todos os tipos de dado numéricos
 
 - exemeplos USANDO OS OPERADORES ARITMETICOS:
 
 -- ADIÇÃO
 SELECT 10 + 23 AS "ADIÇÃO";
 
 -- SUBTRAÇÃO
 SELECT 13 - 4 AS "SUBTRAÇÃO";
 
 -- MULTIPLICAÇÃO
 SELECT 90 * 2 AS "MULTIPLICAÇÃO";
 
 -- DIVISÃO (UMA DIVISÃO QUE DE UM NUMERO QUEBRADO COMO RESULTADO),
 -- O OPERADOR DE DIVISÃO SO RETORNA A PARTE INTEIRA DO RESULTADO, O 
 -- RESTO QUEBRADO ELE NÃO MOSTRA
 -- DIVISÃO INTEIRA(TRUNCA O RESULTADO)
 SELECT 9 / 2 AS "DIVISÃO";
 
 -- MODULO (RESTO)
 -- MOSTRA O RESTO DE UMA DIVISÃO QUEBRADA, NO EXEMPLO ACIMA O OPERADOR
 -- MODULO MOSTRA O RESTO DO RESULTADO QUEBRADO, APOS A VIRGULA
 SELECT 9 % 2 AS "Modulo";
 

* FUNÇÕES MATEMATICAS

 -  Muitas destas funções são fornecidas em várias formas, com diferentes tipos de dado dos argumentos. Exceto onde estiver indicado, todas as formas das funções retornam o mesmo tipo de dado de seu argumento. 
 
 - FORMA GERAL:
 
  - valor absouto: Valor absoluto é o valor próprio do algarismo, independentemente do lugar que ocupa no número. Por exemplo, em 257, o valor absoluto do 7 é 7; do 5, 5; e do 2, 2.
  
  	ABS(x) 
  	tipoRetornado = (o mesmo de x) 
	
    SELECT ABS(-17.4) AS VALOR_ABSOLUTO;
 
 - RAIZ CÚBICA:
 
  CBRT(double precision) 
  retorna = double precision
  
  SELECT CBRT(27.0) AS raiz_cubica;

 - CEIL: O MENOR INTEIRO NÃO MENOR QUE O ARGUMENTO
 
 CEIL(double precision ou numeric)
 retorna = o mesmo da entrada
 
 SELECT CEIL(-42.8) AS menor_inteiro;
 
 - EXP: EXPONENCIAÇÃO
 
 EXP(double precision ou numeric)
 retorna = o mesmo da entrada
 SELECT EXP(1.0) AS "exponenciação";
 
 - FLOOR: O MAIOR INTEIRO NÃO MAIOR QUE O ARGUMENTO
   
   FLOOR(double precision ou numeric)
   retorna = o mesmo da entrada
   SELECT FLOOR(-42.8);
   
 - MOD: O RESTO DE Y/X
 
 MOD(Y,X)
 retorna = o mesmo tipo dos argumentos
 SELECT MOD(9,4) as "MOD";
 
 - POWER: A ELEVADO A B
 
 POWER(double precision ou numeric A, numeric ou double precision B)
 RETORNA = double precision
 SELECT POWER(9.0,3.0) AS POWER_DOUBLE_PRECISION,
 POWER(9.0,3.0) AS POWER_NUMERIC;
 
 - RANDOM(): GERA VALOR ALEATORIO RANDOMICO ENTRE 0.0 E 1.0
 
 RAMDOM()
 retorna = double precision
 
 SELECT RANDOM() AS ALETORIO_01,
 RANDOM() AS ALETORIO_02,
 RANDOM() AS ALETORIO_03,
 RANDOM() AS ALETORIO_04;
 
 - ROUND: ARREDONDAR PARA O INTEIRO MAIS PROXIMO
 
 ROUND(double precision ou numeric)
 retorna = o mesmo da entrada
 
 SELECT ROUND(42.4) AS ARREDONDAMENTO_01,
 ROUND(90.5) AS ARREDONDAMENTO_02;
 
 - ROUND: ARREDONDAR PARA S CASAS DECIMAIS
 
  ROUND(valor numeric,s integer)
  retorn = numeric
  SELECT ROUND(42.3382,2);
 
 - SIGN: SINAL DO ARGUMENTO
 
 SIGN(double precision ou numeric)
 retorna = o mesmo da entrada
 
 SELECT SIGN(-8.4);
 
 - SQRT: RAIZ QUADRADA
 
 SQRT(double precision ou numeric)
 retorna = o mesmo da entrada
 
 SELECT SQRT(2.0);
 
 - TRUNC: TRUNCA EM DIREÇÃO AO ZERO
 
 TRUNC(double precision ou numerico)
 retorna = o mesmo da entrada
 
 SELECT TRUNC(42.8);
 
- TRUNC: TRUNCA COM S CASAS DECIMAIS 

 TRUNC(V numeric,S INTEIGER)
 retorna = o mesmo da entrada
 
 SELECT TRUNC(42.4382,2);

	
 
 