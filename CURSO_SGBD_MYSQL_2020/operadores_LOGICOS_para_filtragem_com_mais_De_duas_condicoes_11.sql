-- operadores logicos de uso para filtragem de consultas com mais de uma condição
-- operadores AND, OR , NOT (usados para filtrar registros baseados em mais de uma condição)

-- operador AND(MOSTRAR OS REGISTROS SE AS DUAS CONDIÇÕES IMPOSTAS PARA ELE FOREM VERDADEIRAS)
-- operador OR(MOSTRA OS REGISTROS SELECIONADOS SE PELO MENOS UMA DAS CONDIÇÕES FOREM VERDADEIRAS)
-- OPERADOR NOT(E A NEGAÇÃO DE UMA EXPRESSÃO, SE A EXPRESSÃO RETORNA V ELE INVERTE PARA FALSO E ASSIM VAI)


-- EXEMPLO COM OPERADOR(AND):
SELECT * FROM livro WHERE id_autor > 2 AND id_livro < 3; -- so vai trazer os registros se as duas condições forem verdadeiras

-- EXEMPLO COM OPERADOR(or):
SELECT * FROM livro WHERE id_autor > 2 or id_livro < 3; -- so vai trazer os registros se uma das condições forem verdadeiras

-- EXEMPLO COM OPERADOR(NOT):
SELECT * FROM livro WHERE id_autor > 2 AND NOT id_livro < 3; -- SO VAI TRAZER OS REGISTROS ONDE ID > 2 E ONDE O ID DO LIVRO NÃO SEJA MENOR QUE 3 NEM IGUAL, ENTÃO SO VAI TRAZER MAIORES QUE 3