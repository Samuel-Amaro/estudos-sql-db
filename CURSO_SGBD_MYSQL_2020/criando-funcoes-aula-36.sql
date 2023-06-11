-- ROTINAS ARMAZENADAS: FUNÇÕES
-- FUNÇÕES E PROCEDIMENTOS NO MYSQL

-- OQUE SÃO FUNÇÕES E PROCEDIMENTOS:
   -- SÃO DOIS TIPOS DE ROTINAS ARMAZENADAS, PARTE DA ESPECIFICAÇÃO SQL.
   -- rotinas: conjunto de istruções que eu posso armazenar e usar posteriomente, sem precisar fazer tudo d novo.
   -- são um pouco similiares no modo de escrever, mas na pratica são diferentes, as aplicações são diferentes.
   -- são invocadas diferentes, invocar uma função ou procedimento e o mesmo que executalas.
   -- procedimento se envoca com a função CALL.
   -- e a função se invoca dentro de uma istrução sql, em uma declaração, ou expressão sql.
   
-- AQUI SERA FALADO SOBRE FUNÇÕES
-- FUNÇÕES: Uma função é usada para gerar um valor que pode ser usado em uma expressão. o valor geralmente e baseado em um ou mais parametros,
-- fornecidos  a função. e e executada como parte de uma expressão.


-- SINTAXE DE UMA FUNÇÃO:
-- parametros(oque a função recebe para ela pode usar, e processar)
CREATE FUNCTION nome_função (parametros) RETURNS tipo_dado DETERMINISTIC-- (que tipo de dado a funçaõ retorna, a clausa deterministic vai dar o mesmo processamento de execução para os mesmo parametros informados, isso e vai sempre multiplicar e devolver o resultado) 
codigo_função; -- oque a função vai executa, oque ela vai fazer


-- COMO INVOCAR UMA FUNÇÃO:
SELECT nome_função(parametros);

-- EXEMPLO, CRIANDO UMA FUNÇÃO QUE MULTIPLICA DOIS VALORES E RETORNA O RESULTADO,
-- A FUNÇÃO RECEBE DOIS VALORES NUMERICOS DIFERENTES, MULTIPLICA ELES , E RETORNA O RESULTADO.
CREATE FUNCTION fn_multiplica(a DECIMAL(10,2), b INT) 
RETURNS INT DETERMINISTIC
RETURN a * b;


-- COMO USAR A FUNÇÃO QUE FOI CRIADA ?, chamo ela dentro de uma consulta sql e passo seus respectivos parametros corretamente.
SELECT fn_multiplica(2.5,4) AS RESULTADO;

-- OUTRO EXEMPLO USANDO A FUNÇÃO QUE CRIEI
SELECT nome_livro,preco_livro AS 'Preço de Uma Unidade',fn_multiplica(55.96,6) AS 'Preço de 6 Unidades' FROM livro WHERE id_livro = 2;


-- COMO APAGAR UMA FUNÇÃO ?
DROP FUNCTION nome_função;

-- COMO ALTERAR UMA FUNÇÃO ?
ALTER FUNCTION nome_função 
caracteristicas_novas_função;