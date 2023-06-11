# TIPOS DE REGISTRO PL/PGSQL;

 RESUMO = neste tutorial, você aprenderá sobre os tipos de registro PL / pgSQL que permitem definir variáveis que podem conter uma única linha de um conjunto de resultados;
 
* INTRODUÇÃO AOS TIPOS DE REGISTRO PL/pgSQL

 - O PostgreSQL fornece um “tipo” denominado record que é semelhante ao tipo de linha;
 
 - Para declarar uma record variável, você usa um nome de variável seguido por uma record palavra - chave como esta:
 
  nome_variavel RECORD;
  
 - Uma recordvariável é semelhante a uma variável do tipo linha . Ele pode conter apenas uma linha de um conjunto de resultados;
 
 - Ao contrário de uma variável do tipo linha, uma recordvariável não possui uma estrutura predefinida. A estrutura de uma recordvariável é determinada quando a instrução selectou for atribui uma linha real a ela;
 
 - Para acessar um campo no registro, você usa a .sintaxe de notação de ponto ( ) como esta:
 
  variavel_record.nome_campo;
  
 - Se você tentar acessar um campo em uma variável de registro antes de ser atribuído, obterá um erro;
 
 - Na verdade, um registro não é um tipo de dados verdadeiro. É apenas um espaço reservado. Além disso, uma variável de registro pode alterar sua estrutura quando você a reatribui;
 
* EXEMPLOS DE REGISTRO PL/pgSQL;

 - Exemplos de uso das variaveis registro;
 
1) USANDO REGISTRO COM A ISTRUÇÃO SELECT INTO:

  exemplo a seguir demostra como usar a variavel de registro com a SELECT INTO istrução:
  
  DO
  $$
  DECLARE
        -- variavel de tipo registro, e um tipo de registro de linha de uma tabela,
		-- com varios dados, que pode ser acessados pelo ponto os campos do registro,
		-- um alinha com varios dados de colunas que podem ser acessados pelo operador .
        rec RECORD;
  BEGIN
     -- seleciona um FILME, e atribui o seu resultado a uma variavel de tipo RECORD, QUE RECEBE A LINHA INTEIRA COM RESULTADO EM FORMATO DE REGISTRO,
	 -- DEPOIS PODERA ACESSAR SEUS CAMPOS
	 SELECT film_id,title,length INTO rec FROM film WHERE film_id = 200;
     -- mostrando os dados do registro de linha obtido acessando os campos:
	 RAISE NOTICE '% % %',rec.film_id,rec.title,rec.length;
  END;
  $$
  LANGUAGE plpgsql;
  
 - Um registro é um espaço reservado que pode conter uma única linha de um conjunto de resultados.
 
 - Um registro não possui uma estrutura predefinida como uma variável de linha. Sua estrutura é determinada quando você atribui uma linha a ela;
 
 