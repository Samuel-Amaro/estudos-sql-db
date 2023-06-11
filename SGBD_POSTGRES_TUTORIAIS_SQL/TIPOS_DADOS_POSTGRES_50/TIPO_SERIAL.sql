# USO DO POSTGRESQL SERIAL PARA CRIAR COLUNAS DE INCREMENTO AUTOMÁTICO

# RESUMO: neste tutorial, você aprenderá sobre o SERIAL pseudo-tipo do PostgreSQL e como usar o SERIAL pseudo-tipo para definir colunas de autoincremento em tabelas.

# INTRODUÇÃO AO SERIAL pseudo-tipo POSTGRESQL

 - No PostgreSQL, uma sequência(SEQUENCE) é um tipo especial de objeto de banco de dados que gera uma sequência de inteiros. Uma sequência(SEQUENCE) é freqüentemente usada como a coluna de chave primária(PRIMARY KEY) em uma tabela.

 - Ao criar uma nova tabela , a sequência(SEQUENCE) pode ser criada por meio do SERIAL pseudo-tipo da seguinte maneira:

    CREATE TABLE nome_tabela(
        id SERIAL
    );

 - Ao atribuir o SERIAL pseudo-tipo à id coluna, o PostgreSQL realiza o seguinte:

   - Primeiro, crie um objeto de sequência e defina o próximo valor gerado pela sequência como o valor padrão para a coluna.

   - Em segundo lugar, adicione uma NOT NULL restrição à id coluna porque uma sequência sempre gera um número inteiro, que é um valor não nulo.

   - Terceiro, atribua o proprietário da sequência à id coluna; como resultado, o objeto de sequência é excluído quando a id coluna ou tabela é eliminada.

 - Nos bastidores, a seguinte declaração:

    CREATE TABLE nome_tabela(
        id SERIAL
    );

 - é equivalente às seguintes afirmações:

    CREATE SEQUENCE nome_tabela_id_seq;

    CREATE TABLE nome_tabela (
        id INTEGER NOT NULL DEFAULT nextval('table_name_id_seq');
    );

    ALTER SEQUENCE nome_tabela_id_seq;
    OWNED BY nome_tabela.id;

 - PostgreSQL fornece três pseudo-tipos de SERIAL  SMALLSERIAL , SERIAL e BIGSERIAL com as seguintes características:

    NOME: SMALLSERIAL;
    TAMANHO DE ARMAZENAMENTO: 2 bytes;
    FAIXA: 1 a 32.767;
    -----------------------------------
    NOME: SERIAL;
    TAMANHO DE ARMAZENAMENTO: 4 BYTES;
    FAIXA: 1 a 2.147.483.647;
    -----------------------------------
    NOME: BIGSERIAL;
    TAMANHO DE ARMAZENAMENTO: 8 BYTES;
    FAIXA: 1 A 9.223.372.036.854.775.807;

 # EXEMPLO DE POSTGRESQL SERIAL 

  - É importante observar que o SERIAL não cria implicitamente um índice na coluna ou torna a coluna a coluna de chave primária(PRIMARY KEY). No entanto, isso pode ser feito facilmente especificando a PRIMARY KEY restrição para a SERIAL coluna.

  - A instrução a seguir cria a fruits tabela com a id coluna como SERIAL coluna:
   
   CREATE TABLE fruits(
       id SERIAL PRIMARY KEY,--chave primaria com o PSEUDO-TIPO SERIAL
       name VARCHAR NOT NULL
   );
   
  - Para atribuir o valor padrão(DEFAULT) a uma coluna serial 
   ao inserir uma linha na tabela , ignore o nome da coluna 
   ou use a DEFAULT palavra - chave na INSERT instrução. Veja o 
   seguinte exemplo:
   
   INSERT INTO fruits(name) VALUES('Orange');
   
  - OU
  
   INSERT INTO fruits(id, name) VALUES (DEFAULT, 'Apple');
   
  - O POSTGRESQL INSERIU DUAS LINHAS NA FRUITS TABELA COM OS VALORES 
  DA COLUNA id são 1 e 2.
  
  SELECT * FROM fruits;
  	--id |  name
	----+--------
--	  1 | Apple
--	  2 | Orange
--	(2 rows)

 - Para obter o nome de sequência(SEQUENCE) de uma SERIAL coluna 
 em uma tabela, você usa a 
 pg_get_serial_sequence() função da seguinte maneira:
   
  pg_get_serial_sequence('nome_tabela', 'nome_coluna'); 
  
  SELECT pg_get_serial_sequence('fruits', 'id') AS nome_sequence_gerada_serial;
  
  -- public.fruits_id_seq
  
 - Você pode passar um nome de sequência para a currval()
 função para obter o valor recente gerado pela sequência. 
 Por exemplo, a seguinte instrução retorna o valor recente 
 gerado pelo fruits_id_seq objeto:
 
 SELECT currval(pg_get_serial_sequence('fruits', 'id')) AS valor_recente_gerado_sequence;
 
 -- 2
 
 - Se você deseja obter o valor gerado pela sequência ao 
  inserir uma nova linha na tabela, use a RETURNING id cláusula na 
  INSERT instrução.
  
  INSERT INTO fruits(name) VALUES('Banana') RETURNING id;
  
  -- 3
  
 - A operação do gerador de sequência não é segura para 
  transações. Isso significa que se duas conexões de 
  banco de dados simultâneas tentarem obter o próximo 
  valor de uma sequência, cada cliente obterá um valor 
  diferente. Se um cliente reverter a transação, o número 
  de sequência desse cliente não será usado, criando uma 
  lacuna na sequência.
 
 - Neste tutorial, você aprendeu como usar o pseudo-tipo 
 PostgreSQL SERIAL para criar uma coluna de incremento 
 automático para uma tabela.