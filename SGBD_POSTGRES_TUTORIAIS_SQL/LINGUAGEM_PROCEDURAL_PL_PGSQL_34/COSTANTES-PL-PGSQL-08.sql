# COSTANTES PL/pgSQL

 RESUMO = neste tutorial, você aprenderá sobre as constantes PL/pgSQL cujos valores não podem ser alterados;

* INTRODUÇÃO ÁS CONSTANTES PL/PGSQL

 - Ao contrário de uma variável , o valor de uma constante não pode ser alterado depois de inicializada;
 
 - COSTANTES TORNÃO O CÓDIGO MAIS LEGIVEL E SUSTENTÁVEL
 
 - COSTANTES REDUZEM O ESFORÇO DE MANUTENÇÃO
 
 - AO USAR COSTANTE EU SO PRECISO ALTERAR SEU VALOR EM UM LUGAR ONDE EU DEFINO A COSTANTE;
 
* DEFININDO COSTANTES:

  - PARA DEFINIR UMA CONSTANTE EM PL/PGSQL EU USO A SEGUINTE SINTAXE:
  
   nome_costante CONSTANT tipo_dado := expressão;
   
   - nome da costante;
   - palavra chave CONSTANT;
   - ESPECIFICAR O TIPO DE DADO;
   - INICIALIZAR O VALOR PARA A COSTNTE APÓS O OPERADOR DE ATRIBUIÇÃO
   
* EXEMPLO DE CONSTANTES PL/pgSQL:

 - declarando uma constante chamada VAT que armazena o imposto sobre
   valor agregado e calcula preço de venda a partir do preço liqueido:
   
   DO $$
   DECLARE
       --  DECLARANDO UMA CONSTANTE QUE NÃO PODE TER SEU VALOR ALTERADO, DEPOIS DE INICIALIZADA
       vat CONSTANT numeric := 0.1;
	   preco_liquido numeric := 20.5;
   BEGIN
      RAISE NOTICE 'The selling price is %', preco_liquido * (1 + vat);
   END $$;
   
	  