-- neste tutorial, você aprenderá sobre vários tipos de junções PostgreSQL, incluindo junção interna, junção à esquerda, junção à direita e junção externa completa;
-- INNER JOIN(junção interna),LEFT JOIN(junção a esquerda), RIGHT JOIN(junção a direita)
-- ,FULL OUTER JOIN(junção externa completa);

-- A junção PostgreSQL é usada para combinar colunas de uma ( auto-junção ) ou mais tabelas com base nos valores das colunas comuns entre tabelas relacionadas;
-- As colunas comuns são normalmente as colunas de chave primária da primeira tabela e as colunas de chave estrangeira da segunda tabela;

-- CONFIGURANDO CRIANDO TABELAS DE AMOSTRA PARA PODER TRABALHAR

CREATE TABLE cesta_a (
    a INT PRIMARY KEY,
    fruta_a VARCHAR (100) NOT NULL
);

CREATE TABLE cesta_b (
    b INT PRIMARY KEY,
    fruta_b VARCHAR (100) NOT NULL
);

-- INSERINDO VALORES NAS TABELAS REGISTROS
INSERT INTO cesta_a (a, fruta_a)
VALUES
    (1, 'Maça'),
    (2, 'Laranja'),
    (3, 'Banana'),
    (4, 'Cocô');

-- INSERINDO VALORES(registros) NAS TABELAS
INSERT INTO cesta_b (b, fruta_b)
VALUES
    (1, 'Laranja'),
    (2, 'Maça'),
    (3, 'Melancia'),
    (4, 'Pera');

-- MOSTRANDO DADOS DA TABELA cesta_a
SELECT * FROM cesta_a;

-- MOSTRANDO DADOS DA TABELA cesta_b
SELECT * FROM cesta_b;

-- INNER JOIN
-- ISTRUÇÃO A SEGUIR UNI A TABELA cesta_a COM A SEGUNDA TABELA cesta_b COMBINADO OS VALORES NAS COLUNAS
-- fruta_a e fruta_b:

SELECT a,fruta_a,b,fruta_b FROM cesta_a INNER JOIN cesta_b 
ON fruta_a = fruta_b;
-- A CLAUSULA INNER JOIN examina cada linha na primeira Tabela cesta_a.
-- COMPARA VALOR DA coluna fruta_a com o valor de cada linha da coluna fruta_b.
-- se os valores forem iguais, o INNER JOIN cria uma nova linha que contem colunas de amabas tabelas,
-- e adiciona essa nova linha ao conjunto de resultados.


-- LEFT JOIN
-- USANDO A CLAUSULA LEFT JOIN para unit tabela
-- cesta_a a tabela cesta_b. no contexto de junção(left join),
-- a primeira tabela é chamada de tabela da esquerda e a segunda tabela
-- é chamada de tabela da direita.
-- EXEMPLO:

SELECT a,fruta_a,b,fruta_b FROM cesta_a -- (tabela esquerda) 
LEFT JOIN cesta_b -- (tabela direita)
ON fruta_a = fruta_b;
-- a left join começa a selecionar dados da tabela à esquerda. Ele compara os valores da
-- fruta_a com os valores da coluna fruta_b da tabela cesta_b
-- Se esses valores forem iguais o left join cria uma nova linha que
-- contem colunas de ambas as tabelas e adiciona novas linha ao conjunto
-- de resultados;
-- caso os valores não sejam iguais, a left join também cria uma nova linha
-- que contém colunas de ambas as tabelas e a adiciona ao conjunto de 
-- resultados.

-- para selecionar linhas da tabela esquerda que não possuem linhas
-- correspondentes na tabela direita, use left join com uma WHERE:
SELECT a,fruta_a,b,fruta_b FROM cesta_a -- (tabela esquerda) 
LEFT JOIN cesta_b -- (tabela direita)
ON fruta_a = fruta_b
WHERE b IS NULL;



-- RIGHT JOIN(JUNÇÃO A DIREITA)
-- e o contrario do left JOIN a junção certa começa selecionando os dados
-- da tabela certa. ele compara cada valor na coluna fruta_b de cada linha
-- da tabela certa com cada valor na coluna fruta_a de cada linha da tabela
-- cesta_a;
-- se esses valores forem iguais, a junção á direita cria uma nova linha que contém
-- colunas de ambas as tabelas;
-- caso esses valores não sejam iguais, a right join também cria uma nova
-- linha que contém colunas de ambas tabelas. no entanto, ele preenche as colunas da tabela 
-- á esquerda com NULL
-- exemplo:
SELECT a, fruta_a,b,fruta_b FROM cesta_a -- (tabela esquerda)
RIGHT JOIN cesta_b -- (tabela direita)
ON fruta_a = fruta_b;

-- mostrando linhas da tabela da direita que não possuem correspondencias da tabela da esquerda adicionando uma WHERE:
SELECT a,fruta_a,b,fruta_b FROM cesta_a 
RIGHT JOIN cesta_b ON fruta_a = fruta_b 
WHERE a IS NULL;


-- FULL JOIN
-- o full join retorna um conjunto de resultados que contém todas as linhas
-- das tabelas esquerda e direita, com as linhas correspondents de ambos os lados, se disponiveis.
-- caso não haja correspondencia, as colunas da atbela serão preenchidas com NULL;
-- exemplo:
SELECT a,fruta_a,b,fruta_b 
FROM cesta_a
FULL OUTER JOIN cesta_b ON fruta_a = fruta_b;

-- Para retornar linhas em uma tabela que não possuem linhas correspondentes na outra, você usa a junção completa com uma WHEREcláusula como esta:
SELECT
    a,
    fruta_a,
    b,
    fruta_b
FROM
    cesta_a
FULL JOIN cesta_b 
   ON fruta_a = fruta_b
WHERE a IS NULL OR b IS NULL;
