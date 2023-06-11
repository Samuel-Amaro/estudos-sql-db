# ALTERAÇÃO DE TIPO DE COLUNA DO POSTGRESQL

* este tutorial mostra passo a passo como alterar o tipo de dados de uma coluna usando a ALTER TABLE instrução.

* Declaração de alteração do tipo de coluna do PostgreSQL

 - para alterar o tipo de dados de uma coluna, você usa a alter table istrução
   da seguinte maneira:
   
   ALTER TABLE nome_tabela
   ALTER COLUMN nome_coluna [TIPO DADO] TYPE novo_tipo_Dado;
   
   - especificar nome da tabela no qual deseja alterar a coluna;
   - segundo especifique o nome da coluna cujo tipo de dados você deseja
   alterar após a ALTER COLUMN clausula;
   - terceiro fornecer o novo tipo de dados para a colunas após a TYPE palavra-chave.
   O set DATA TYPE E TYPE.
   - PARA ALTERAR OS TIPOS DE DADOS DE VARIAS COLUNAS EM UMA UNICA ISTRUÇÃO,VOCÊ USA VARIAS ALTER COLUMN CLAUSULAS COMO ESTA:
   
   ALTER TABLE nome_tabela
   ALTER COLUMN nome_coluna1 [TIPO DADO] TYPE novo_tipo_Dado,
   ALTER COLUMN nome_coluna_2 [TIPO DADO] TYPE novo_tipo_Dado,
   ...;
   
   - PostgreSql permite que você converta os valores de uma coluna em novos enquanto
   altera seu tipo de dados, adiconando uma USING clausul da seguinte maneira:
   
   ALTER TABLE nome_tabela
   ALTER COLUMN nome_coluna TYPE novo_tipo_dado USING expressao;
   
   - USING CLAUSULA ESPECIFICA UMA EXPRESSÃO QUE PERMITE CONVERTE OS VALORES ANTIGOS EM NOVOS
   
  * EXEMPLOS DE ALTERAÇÃO DE TIPO DE COLUNA DO POSTGRESQL:
  
   - criando uma nova tabela

   CREATE TABLE assets (
    id serial PRIMARY KEY,
    name TEXT NOT NULL,
    asset_no VARCHAR NOT NULL,
    description TEXT,
    location TEXT,
    acquired_date DATE NOT NULL
);

INSERT INTO assets(name,asset_no,location,acquired_date)
VALUES('Server','10001','Server room','2017-01-01'),
      ('UPS','10002','Server room','2017-01-01');

  - PARA ALTERAR O TIPO DE DADOS DA COLUNA name PARA VARCHAR voc usa a seguiunte istrução:
  
  ALTER TABLE assets
  ALTER COLUMN name TYPE VARCHAR;
  
  - ALTERAR OS TIPOS DE DADOS DA COLUNA description e location de Text para VARCHAR
  
   ALTER TABLE assets
   ALTER COLUMN location TYPE VARCHAR,
   ALTER COLUMN description TYPE VARCHAR;
   
  - para alterar o tipo de dados da assrt_no coluna para inteiro, usa:
  
  ALTER TABLE assets
  ALTER COLUMN asset_no TYPE INT;
  
  - assim da um erro! tem que colocar a clausula using:
  
  ALTER TABLE assets
  ALTER COLUMN asset_no TYPE INT
  USING asset_no::integer;
  
   
   