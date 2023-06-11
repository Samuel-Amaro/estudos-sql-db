-- HAVING - FILTRANDO GROUP BY
-- FILTRA RESULTADOS OBTIDOS EM UM GROUP BY 
-- SERVE PARA ESPECIFICAR UM CRITERIO DE FILTRAGEM EM UM GROUPY BY
-- clausula usada para especificar condições de filtragem de grupos de registros ou agregações.
-- e frequentemeente usada com a clausula GROUP BY para filtrar as colunas agrupadas.

-- SINTAXE:
SELECT colunas_selecionar,FUNÇÃO_AGREGAÇÃO() FROM nome_tabela WHERE filtragem_para_selecionar_registros_especificos
GROUP BY coluna_que_vai_ser_usada_para_agrupar HAVING filtrar_do_agrupamento;

-- EXEMPLO:
-- CONSULTA QUE TRAZ O TOTAL DE VENDAS DE CADA CIDADE, SO QUE SO QUERO AS CIDADES QUE VENDERAM MENOS QUE 2500 PRODUTOS POR CIDADE.
-- APLICANDO FUNÇÃO DE AGREGAÇÃO, AGRUPAMENTO,E FILTRGEM DE AGRUPAMENTO.
-- having == tendo
-- aplicando a consulta sem o HAVING
SELECT cidade,SUM(quantidade) AS Total_Venda_Por_Cidade FROM vendas GROUP BY cidade;

-- COM O HAVING
-- EM QUESTÃO DE EXECUÇÃO PRIMEIRO SE OBTEM O TOTAL DE VENDAS PARA DEPOIS FILTRAR O NUMERO DE VENDAS QUE QUERO SELECIONAR
SELECT cidade,SUM(quantidade) AS Total_Venda_Por_Cidade FROM vendas GROUP BY cidade HAVING Total_Venda_Por_Cidade < 2500;

-- CONSULTA QUE TRAZ O TOTAL DE VENDAS DO PRODUTO TECLADO POR CIDADE, SENDO QUE SO QUERO AS CIDADES QUE VENDERAM MENOS QUE 1500 TECLADOS
-- entende abaixo as diferenças das consultas:
SELECT cidade,produto,SUM(quantidade) AS total_vendas_teclado_por_cidade FROM vendas
 where produto = 'Teclado';

-- aplicando groupy BY
SELECT cidade,produto,SUM(quantidade) AS total_vendas_teclado_por_cidade FROM vendas
 where produto = 'Teclado' GROUP BY cidade;

-- aplicando a filtragem do agrupamento
SELECT cidade,produto,SUM(quantidade) AS total_vendas_teclado_por_cidade FROM vendas
 where produto = 'Teclado' GROUP BY cidade HAVING total_vendas_teclado_por_cidade < 1500; 