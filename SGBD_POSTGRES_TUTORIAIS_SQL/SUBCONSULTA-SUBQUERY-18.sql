*  neste tutorial, você aprenderá como usar a subconsulta PostgreSQL que permite construir consultas complexas.

 * Introdução à subconsulta PostgreSQL:
 
  - EXEMPLO SIMPLES:
  - Suponha que desejamos encontrar os filmes cuja taxa de aluguel é superior à taxa média de aluguel. Podemos fazer isso em duas etapas:
  
  1 - ENCONTRAR A TAXA MEDIA DE ALUGUEL USANDO UMA FUNÇÃO DE AGREGAÇÃO NO SELECT(AVG);
  2 - USE O RESULTADO DA PRIMEIRA CONSULTA NA SEGUNDA SELECT DECLARAÇÃO PARA ENCONTRAR OS FILMES QUE QUEREMOS;
  
 -- CONSULTA QUE OBTEM A TAXA MEDIA DE ALUGUEL DOS FILMES:
 SELECT AVG(rental_rate) AS media_preco_aluguel 
 FROM film;
 
 -- consulta que vai obter os filmes que possui a taxa de aluguel maior que a media da taxa de aluguel de todos os filmes:
 SELECT film_id,title,rental_rate
 FROM film 
 WHERE rental_rate > 2.98;
 
* O código não é tão elegante, o que requer duas etapas.

 * Queremos uma maneira de passar o resultado da primeira consulta para a segunda consulta em uma consulta. A solução é usar uma subconsulta:
 * Uma subconsulta é uma consulta aninhada dentro de outra consulta, como SELECT, INSERT, DELETEe UPDATE:
 
 * Para construir uma subconsulta, colocamos a segunda consulta entre colchetes e a usamos na cláusula WHERE como uma expressão:
 -- EXEMPLO 01 DE SUBCONSULTA, OTIMIZA AS 2 CONSULTAS DE CIMA, EM UMA CONSULTA SO:
 
 SELECT film_id,title,rental_rate
 FROM film 
 WHERE  
  rental_rate > (SELECT AVG(rental_rate) AS media_preco_aluguel 
			    FROM film);
				
 - A consulta entre parenteses é chamada de subconsulta ou consulta interna.
 - A consulta que contém a subconsulta é conhecida como consulta externa.
 
 - O PostgreSQL executa a consulta que contém uma subconsulta na seguinte sequência:
   1 - executa a subconsulta;
   2 - obtém o resultado e o passa para a consulta externa;
   3 - executa a consulta externa;
* Subconsulta PostgreSQL com operador IN:
 
 - Uma subconsulta pode retornar zero ou mais linhas. Para usar esta subconsulta, você usa o operador IN na WHEREcláusula.
 
 - EXEMPLO 01 SEM USAR SUBCONSULTA:
 - Por exemplo, para obter filmes que têm a data de retorno entre 2005-05-29 e 2005-05-30, você usa a seguinte consulta:
 SELECT 
      inventory.film_id
 FROM 
     rental 
 INNER JOIN 
           inventory 
 ON 
   inventory.inventory_id = rental.inventory_id
 WHERE 
      return_date BETWEEN '2005-05-29' AND '2005-05-30';
	  
 - essa consulta acima so retorna os ids dos filmes, preciso saber os nomes dos filmes
 - que estão nesse intervalo de data;
 
 - EXEMPLO 02 USANDO SUBCONSULTA:
 - CONSULTA EXTERNA OBTEM O NOME DOS FILMES;
 - CONSULTA INTERNA OBTEM OS FILMES NO SEGUINTE INTERVALO DE DATA;
 - E OBTEM OS NOMES DOS FILMES ATRAVES DO ID DOS FILMES QUE A SOBCONSULTA TRAZ;
 
 SELECT 
      film_id,title
 FROM 
     film
 WHERE film_id IN (
                  SELECT 
	                    inventory.film_id
	              FROM 
	                  rental
	              INNER JOIN 
	                        inventory 
	                         ON inventory.inventory_id = rental.inventory_id 
	              WHERE 
	                   return_date BETWEEN '2005-05-29' AND '2005-05-30'
	              );
				  
         - ONDE A CONSULTA EXTERNA OBTER OS SEGUINTES VALORES DE ID DA SUBCONSULTA
		 INTERNA QUE PARA A CONSULTA EXTERNA E COMO UMA LISTA DE VALORES, VAI MOSTRAR O NOME DO FILME QUE TIVER O ID
		 CORRESPONDENTE DA CONSULTA EXTERNA;
   