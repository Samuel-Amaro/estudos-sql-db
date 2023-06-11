-- COMO MODIFICAR A SAIDA DE DATAS NO MYSQL EM COMANDOS SELECTS
-- NO FORMATO DD/MM/AAAA O PADRÃO DO MYSQL E AAAA-MM-DD
-- Com a função DATE_FORMAT( data, formato ) você pode converter uma data em uma string formatada.
-- EX:
SELECT data_public AS data_padrão,DATE_FORMAT(data_public,"%d/%m/%Y") AS data_formatada FROM livro;

-- Como utilizar uma string dd/mm/aaaa ao se fazer o INSERT:
-- A função que faz o do exemplo acima é STR_TO_DATE( string, formato ).
-- ex:
INSERT INTO nome_tabela SET nome_coluna_para_a_data = STR_TO_DATE("31/05/2020","%d/%m/%Y");

%d   Dia (00..31)
%e   Dia (0..31)
%m   Mês (00..12)
%y   Ano (dois dígitos)
%Y   Ano (quatro dígitos)
%%   Caractere %
%H   Horas (00..23)
%i   Minutos (00..59)
%s   Segundos (00..59)
%T   Hora completa ( 24 horas, formato hh:mm:ss)