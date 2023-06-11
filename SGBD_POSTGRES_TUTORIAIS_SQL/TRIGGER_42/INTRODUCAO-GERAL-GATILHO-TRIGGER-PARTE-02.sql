# INTRODUÇÃO AO POSTGRESQL Trigger

 RESUMO = neste tutorial, você aprenderá sobre gatilhos PostgreSQL, por que você deve usar os gatilhos e quando usá-los.
 
*  Um gatilho PostgreSQL é uma função chamada automaticamente sempre que ocorre um evento associado a uma tabela. Um evento pode ser qualquer um dos seguintes: INSERT , UPDATE , DELETE ou TRUNCATE 

* Um gatilho é uma função especial definida pelo usuário associada a 
  uma tabela. Para criar um novo gatilho, você define uma função 
  de gatilho primeiro e, em seguida, vincula essa função de 
  gatilho a uma tabela. A diferença entre um gatilho e uma 
  função definida pelo usuário é que um gatilho é 
  automaticamente invocado quando ocorre um evento de gatilho.
  
* O PostgreSQL fornece dois tipos principais de gatilhos: gatilhos de linha e de nível de instrução. As diferenças entre os dois tipos são quantas vezes o gatilho é invocado e a que horas.

* Por exemplo, se você emitir uma UPDATE instrução que afeta 20 linhas, o gatilho de nível de linha será invocado 20 vezes, enquanto o gatilho de nível de instrução será invocado 1 vez.

* Você pode especificar se o gatilho é invocado antes ou depois de um evento. Se o gatilho for invocado antes de um evento, ele pode pular a operação para a linha atual ou até mesmo alterar a linha que está sendo atualizada ou inserida. Caso o gatilho seja acionado após o evento, todas as alterações estarão disponíveis para o gatilho.

* Os gatilhos são úteis caso o banco de dados seja acessado por vários aplicativos e você deseja manter a funcionalidade cruzada dentro do banco de dados que é executada automaticamente sempre que os dados da tabela são modificados. Por exemplo, se você deseja manter o histórico de dados sem exigir que o aplicativo tenha lógica para verificar todos os eventos, como INSERT ou UDPATE.

* Você também pode usar gatilhos para manter regras de integridade de dados complexas que você não pode implementar em outro lugar, exceto no nível do banco de dados. Por exemplo, quando uma nova linha é adicionada à customer tabela, outras linhas também devem ser criadas nas tabelas de bancos e créditos.

* A principal desvantagem de usar um gatilho é que você deve saber que ele existe e entender sua lógica para descobrir os efeitos quando os dados são alterados.

* Embora o PostgreSQL implemente o padrão SQL, os gatilhos no PostgreSQL têm alguns recursos específicos:

 - O PostgreSQL dispara o gatilho para o  TRUNCATE evento.
 - O PostgreSQL permite que você defina o gatilho no nível da instrução nas visualizações.
 - O PostgreSQL requer que você defina uma função definida pelo usuário como a ação do gatilho, enquanto o padrão SQL permite que você use qualquer comando SQL.
