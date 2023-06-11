-- CONCATENAÇÃO DE STRINGS EM MYSQL, USANDO (CONCAT,IFNULL, E COALESCE) - AULA 31

-- E possivel concatenar strings no my sql usando a função CONCAT();
-- Sintaxe: 
-- concatena a string + uma_coluna que possui string, string + coluna_ou_string que vai concatenar.
-- CONCAT(string | nome_coluna, string | nome_coluna, string | nome_coluna...);

-- Exemplo:
SELECT CONCAT('Samuel ','Amaro') AS 'Meu Nome';

-- Exemplo, concatenado conteudos de colunas:

SELECT CONCAT(nome_autor,' ',sobrenome_autor) AS 'Nome Completo' FROM autores;

-- Exemplo concatenado conteudo de colunas:
SELECT CONCAT('Eu Gosto do Livro ',nome_livro ) AS 'Livro que gosto' FROM livro WHERE id_autor = 2;

-- Criando uma tabela de testes, para usar a concatenação de strings
CREATE TABLE teste_nulos(id int primary key auto_increment,
                         item varchar(20),
                         quantidade int NULL
                         );
                         
-- fazendo uma insert na tabela
INSERT INTO teste_nulos(id,item,quantidade) VALUES (1,'Teclado',7),(2,'Monitor',5),(3,'Mouse',NULL);                         

-- Vendo se deu certo
SELECT * FROM teste_nulos;

-- OBSERVAÇÃO: NULL e Diferente de 0, NULL significa que não tem valor associado.


-- FAZENDO OS TESTES DE CONCATENAÇÃO

-- SE UMA STRING FOR CONCATENADA COM NULL, SERA RETORNADO NULL NA CONCATENAÇÃO
SELECT CONCAT('A quantidade Adquirida Foi ',quantidade) AS 'Quantidade' FROM teste_nulos WHERE item = 'Mouse';

-- MAS PODE EVITAR O PROBLEMA ACIMA USANDO, FUNÇÕES COMO IFNULL(), e COALESCE();

-- IFNULL(valor,substituição); --> VALOR == valor da string, ou propria string ou coluna | --> susbtituição == valor de susbtituição, caso o valor da string
-- seja inicialmente NULL, o valor da susbtituição entra em ação. substitui o valor da string por esse valor substituto que eu informei. 
-- IFNULL(SE NULL);
-- EXEMPLO:
SELECT CONCAT('A quantidade Adquirida Foi ',IFNULL(quantidade,0)) AS 'Quantidade' FROM teste_nulos WHERE item = 'Mouse';

-- A FUNÇÃO COALESCE
-- COALESCE(valor1,valor2,...,valorN);
-- essa função retornara o primeiro valor não nulo encontrado em seu argumentos.
-- posso passar para os argumentos um monte de colunas ou valores, ai o primeiro valor não nulo que ela encontrar ela retorna esse valor.
-- Exemplo 1:
SELECT CONCAT('A quantidade Adquirida Foi ',COALESCE(NULL,quantidade,NULL,0)) AS 'Quantidade' FROM teste_nulos WHERE item = 'Mouse';
-- Exemplo 2:
SELECT CONCAT('A quantidade Adquirida Foi ',COALESCE(NULL,quantidade,NULL,0)) AS 'Quantidade' FROM teste_nulos WHERE item = 'Monitor';

