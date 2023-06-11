# COSTANTES DE STRING ENTRE ASPAS

 * neste tutorial, você aprenderá como usar constantes de string entre aspas ( $$) em funções definidas pelo usuário e procedimentos armazenados;
 
* INTRODUÇÃO A SINTAXE DA COSTANTE DE STRING ENTRE ASPAS

 - no postgreSQL usa aspas simples para uma costante de string como esta:
 
   SELECT 'costante de string';
 
 - quando uma costante de string contem uma aspas simples como escapar ?
   
   SELECT 'I''m also a string costante';
   
 - outra forma de escapar aspas simples dentro de uma string:
 
  SELECT E'I\'m also a string constante';
  
 - quando a constante de string tem muitas aspas simples para se escapar e um problema,
   mas como resolver esse problema ?
   
   - usando o recurso de citação de dolar para tornar as costantes de strings mais legiveis:
   
     SINTAXE:
	   
	     $tag$<costante_string>$tag$
		 
   - na sintaxe o tag e opcional. ele pode conter 0 ou mais caracteres;
   
   - entre os $tag$ pode colocar qualquer string com aspas simples e barras invertidas;
   
   - exemplo:
   
     string message como uma tag entre os $
     SELECT $message$I'essa e uma string escapada com aspas simples\$message$;
	 
	 SELECT $$I'essa e uma string escapada com aspas simples\$$;
  
* USANDO A COSNTANTE DE STRING ENTRE ASPAS EM BLOCOS ANÔNIMOS

 o seguinte mostra o bloco anonimo:
 
DO
'DECLARE
  qtd_filmes integer;
BEGIN
   SELECT COUNT(*) INTO qtd_filmes FROM film;
   RAISE NOTICE ''Quantidade de Filmes: %'',qtd_filmes;
END;';

  - para evitar o escape de todas as aspas simples e barra invertidas, eu 
    posso usar a string entre aspas em CIFROES:
	
    DO
	$$
      DECLARE
         qtd_filmes integer;
       BEGIN
         SELECT COUNT(*) INTO qtd_filmes FROM film;
         RAISE NOTICE ''Quantidade de Filmes: %'',qtd_filmes;
    END;
	$$
    
	- ASSIM NÃO PRECISO ESCAPARA ASPAS SIMPLES E BARRA INVERTIDAS;
	
* USANDO COSTANTES DE STRING CITADAS EM DÓLARES EM FUNÇÕES:

  - SINTAXE DA CREATE FUNCTION, ISTRUÇÃO QUE PERMITE CRIAR UMA FUNÇÃO DEFINIDA PELO USUÁRIO:
  
  CREATE FUNCTION nome_funcao(lista_parametros)
      RETURNS tipo_dado
  LANGUAGE nome_linguagem
  AS
   'CORPO DA FUNÇÃO'
   
 - SE A FUNÇÃO TIVER MUITAS ISTRUÇÕES SERA MAIS DIFICIL DE LER.
   nesse caso eu posso usar a  sintaxe da costante de string entre aspas;
   
  - exemplo, uma função que seleciona um filme pelo seu id:
  
  CREATE FUNCTION busca_filme_por_id(id int)
  RETURNS film
  LANGUAGE SQL
  AS
  $$
    SELECT * FROM film WHERE film_id = id;
  $$;
  