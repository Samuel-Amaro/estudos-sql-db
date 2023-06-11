# UMA VISÃO GERAL DO TIPO NUMERIC DO POSTGRESQL

 * RESUMO: neste tutorial você aprenderá sobre o NUMERIC 
 tipo de PostgreSQL para armazenamento de dados numéricos.
 
  
 * INTRODUÇÃO AO TIPO DE DADOS NUMERIC DO POSTGRESQL
 
   - O NUMERIC tipo pode armazenar números com muitos 
   dígitos. Normalmente, você usa o NUMERIC tipo para 
   números que exigem exatidão, como valores ou 
   quantidades monetárias.
   
   - o seguinte ilustra a sintaxe do numeric TIPO:
   
   		NUMERIC(precision, scale);
		
   - Nesta sintaxe, o precision é o número total de dígitos
   e scale é o número de dígitos na parte fracionária.
   Por exemplo, o número 1234.567 tem a precisão 7 e a
   escala 3.
   
   - O NUMERIC tipo pode conter um valor de até 131,072 
   dígitos antes da vírgula decimal, 16,383 
   dígitos após a vírgula decimal.
   
   - A escala do NUMERIC tipo pode ser zero ou positiva. 
   O seguinte mostra a sintaxe do NUMERIC tipo com escala zero:
   
   	 NUMERIC(precision)
	 
   - Se você omitir precision e scale, poderá armazenar 
    qualquer precisão e escala até o limite da precisão e
	escala mencionadas acima.
	
		NUMERIC
		
  - No PostgreSQL, os tipos NUMERIC e DECIMAL são 
  equivalentes e ambos também fazem parte do padrão SQL.
  
  - Se a precisão não for necessária, você não deve usar 
  o NUMERIC tipo porque os cálculos em NUMERIC valores são
  normalmente mais lentos do que inteiros, flutuantes 
  e precisões duplas.
  
 * EXEMPLOS DE POSTGRESQL NUMERIC
 
 	- Vejamos alguns exemplos de uso do NUMERIC tipo PostgreSQL.
	
 1) ARMAZENAMENTO DE VALORES NUMÉRICOS
 
   - Se você armazenar um valor com uma escala maior que 
   a escala declarada da NUMERIC coluna, o PostgreSQL 
   arredondará o valor para um número especificado de
   dígitos fracionários.
   
   - VEJA O SEGUINTE EXEMPLO:
   
   - Primeiro, crie uma nova tabela com o nome products 
   para a demonstração:

		DROP TABLE IF EXISTS products;
		
		CREATE TABLE products(
			id SERIAL PRIMARY KEY,
			nome VARCHAR(100) NOT NULL,
			preco NUMERIC(5,2)
		);
		
   - Em segundo lugar, insira alguns produtos com preços 
    cujas escalas excedam a escala declarada na price coluna:
	
		INSERT INTO products(nome,preco)
		VALUES ('Phone',500.215),
		('Tablet',500.214);
	
   - Como a escala da price coluna é 2, o PostgreSQL 
   arredonda o valor 500.215 para cima 500.22 e 500.214
   para baixo para 500.21:
   
   - A CONSULTA A SEGUIR retorna todas as linhas da products tabela:
   
   		SELECT * FROM products;
		
   - Caso você armazene um valor cuja precisão exceda a 
    precisão declarada, o PostgreSQL levantará um erro 
	conforme mostrado no exemplo a seguir:
	
	 	INSERT INTO products(nome,preco)
		VALUES('Phone',123456.21);
		
   - PostgreSQL emitiu o seguinte erro.
   
 * POSTGRESQL TIPO NUMERIC E NAN
 
    - Além de conter valores numéricos, o NUMERIC tipo 
	também pode conter um valor especial chamado, NaN que
	significa não um número.
	
	- O exemplo a seguir atualiza o preço do id do produto 1 para NaN:
	
		UPDATE products
		SET preco = 'Nan'
		WHERE id = 1;
		
	- O exemplo a seguir atualiza o preço do id do produto 1 para NaN:
	
	- A CONSULTA A SEGUIR RETORNA OS DADOS DA products tabela:
	
	- A consulta a seguir retorna os dados da products tabela:
	
		SELECT * FROM products;
		
	- Normalmente, o NaN não é igual a nenhum número, incluindo a si mesmo. 
	Isso significa que a expressão NaN = NaN retorna falso.
	
	- No entanto, dois NaN valores são iguais e NaN maiores do 
	que outros números. Esta implementação permite ao 
	PostgreSQL classificar os NUMERIC valores e usá-los em
	índices baseados em árvore .
	 
	- A consulta a seguir classifica os produtos com base nos preços:
		
	
		SELECT * FROM products
		ORDER BY preco DESC;
		
		
		