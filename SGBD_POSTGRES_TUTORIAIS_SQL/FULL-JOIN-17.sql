* você aprenderá como usar o PostgreSQL FULL OUTER JOIN para consultar dados de duas ou mais tabelas.

* Suponha que você queira realizar uma junção externa completa de duas tabelas: A e B. O seguinte ilustra a sintaxe do FULL OUTER JOIN:

 SELECT * FROM A FULL [OUTER] JOIN B ON A.id = B.id;
 
-- CLAUSULA ENTRO DE COLCHETES E OPCIONAL

- A FULL JOIN  combina os resultados da LEFT JOIN e RIGHT JOIN.

- Se as linhas da tabela associada não corresponderem, a junção externa completa definirá valores NULL para cada coluna da tabela que não tiver a linha correspondente.

- Se uma linha de uma tabela corresponder a uma linha de outra tabela, a linha de resultado conterá colunas preenchidas por colunas de linhas de ambas as tabelas.

- O seguinte diagrama de Venn ilustra a FULL OUTER JOIN operação:

- O resultado inclui as linhas correspondentes de ambas as tabelas e também as linhas que não correspondem:

-- EXEMPLO USANDO O FULL OUTER JOIN:

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

 -- CRIANDO TABELA 01
 CREATE TABLE departamentos(
       id_departamento SERIAL PRIMARY KEY,
	   nome_departamento VARCHAR(255) NOT NULL
 );
 -- CRIANDO TABELA 02
 CREATE TABLE empregados(
     id_empregado SERIAL PRIMARY KEY,
	 nome_empregado VARCHAR(255),
	 id_departamento INTEGER
 );
 
* Cada departamento tem zero ou muitos funcionários e cada funcionário pertence a zero ou um departamento:

 -- INSERINDO DADOS NA TABELA:
 INSERT INTO departamentos(nome_departamento)
 VALUES ('Sales'),
	    ('Marketing'),
	    ('HR'),
	    ('IT'),
	    ('Production');
		
 -- INSERIR DADOS DE empregados
 INSERT INTO empregados(nome_empregado,id_departamento)
 VALUES ('Bette Nicholson', 1),
	    ('Christian Gable', 1),
	    ('Joe Swank', 2),
	    ('Fred Costner', 3),
	    ('Sandra Kilmer', 4),
	    ('Julia Mcqueen', NULL);
 
 -- CONSULTA OS DADOS DAS TABELAS
 SELECT * FROM departamentos;
 SELECT * FROM empregados;
 
 -- USANDO O FULL JOIN PARA CONSULTAR DADOS DE TABELAS empregados E departamentos:
 SELECT nome_empregado, nome_departamento 
 FROM empregados AS E
 FULL OUTER JOIN departamentos AS D
 ON D.id_departamento = E.id_departamento;
 
* O conjunto de resultados inclui todos os funcionários que pertencem a um departamento e todos os departamentos que possuem um funcionário;
* Além disso, inclui todos os funcionários que não pertencem a um departamento e todos os departamentos que não têm um funcionário;


* Para encontrar o departamento que não possui funcionários, você usa uma cláusula WHERE da seguinte forma:
 
 SELECT nome_empregado,nome_departamento
 FROM empregados AS E
 FULL OUTER JOIN departamentos AS D
 ON D.id_departamento = E.id_departamento
 WHERE nome_empregado IS NULL;
 
 - O resultado mostra que o Productiondepartamento não possui funcionários;
 
* Para localizar o funcionário que não pertence a nenhum departamento, você verifica o NULL da department_name na WHERE cláusula conforme a seguinte declaração:
SELECT nome_empregado, nome_departamento 
FROM empregados AS E
FULL OUTER JOIN departamentos AS D
ON D.id_departamento = E.id_departamento
WHERE nome_departamento IS NULL;

* Como você pode ver claramente na saída,   Juila Mcqueennão pertence a nenhum departamento;



 
 


