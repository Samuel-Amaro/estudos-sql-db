-- REGEXP - Expressões regulares em Consultas 
-- O MYsql suporta um tipo de operação de busca de padrões baseada em expressões regulares com o operdor REGEXP
-- utilizar os caracteres coringas para filtragem de busca de strings com caracteres de filtragem

-- [...] -- QUALQUER CARACTER UNICO NO INTERVALO OU CONJUNTO ESPECIFICADO([a-h];[aeiou])
-- ex: buscar todos os registros que começem com A ate H como letra de inicio[a-h]
-- buscar registros que tem como letra de inicio uma vogal[aeiou]

-- [^...] Qualquer caracter unico que não esteja no itervalo ou conjunto especificado.([^a-h]; [^aeiou])
-- obs: cincunflexo dentro de colchetes e negação
-- ex: busque todos os registro que tenham letras de inicio que não esteja no seguinte intervalo [^a-h];(busque letras mas que não estejam nesse intervalo)
-- busque todos os registros que em seu nome tenha primeira letra como consoante [^aeiou](busque caracteres onde não sejam vogais)

-- ^ -> fora dos colchetes == e usado no inicio de string para informar que quero que busque uma string que começe por esse caracter ou pode usar alternação
-- $ -> fim da string, usado no fim da string para buscar uma string que termine com o seguinte caracter so, ou usa alternação para mais
-- a | b | c -> alternação(A ou B ou C) , usado para auxiliar na busca para poder usar mais caracteres

-- EX:
USE biblioteca;
-- [] -- COCLHETES E CONJUNTO  DE CARACTERES, FORA DO COLCHETES E ONDE BUSQUE ESSE CARACTERES
SELECT nome_livro FROM livro WHERE nome_livro REGEXP '^[FS]'; -- BUSQUE NOME DE LIVROS ONDE TENHAM A PRESENÇA DE  PELOS ESSE CONJUNTO DE CARACTERES NO INICIO (FS) 
SELECT nome_livro FROM livro WHERE nome_livro REGEXP '^[^FS]'; -- BUSQUE REGISTROS QUE INICIEM,POR CARACTERES QUE NÃO ESTEJA NESSE CONJUNTO INFORMADO
SELECT nome_livro FROM livro WHERE nome_livro REGEXP '^[ng]$'; -- BUSQUE NOME DE LIVROS ONDE TERMINEN COM ESSE CONJUNTO ng ou n ou g
SELECT nome_livro FROM livro WHERE nome_livro REGEXP '^[FS] | mi'; -- busque livros onde nome livro começe por F ou S ou COMEÇAR COM  a seguencia Mi
