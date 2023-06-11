use prova_bd_3bim;

select * from nota;

#item 1
select count(*) as 'QTDE de alunos em redes'
from nota
where cod_disciplina = 
(select codigo
from disciplina
where nome = 'REDES');

#item 2
select nome from disciplina
 where codigo in
 (select cod_disciplina from nota
 where matricula_aluno in 
 (select matricula 
 from aluno 
 where nome = 'ANA' or nome='PEDRO')
 );
 
 #item 3
 select nome, date_format(data_de_nascimento, '%d/%m/%Y') as 'data de nascimento'
from aluno 
where matricula not in 
(select matricula_aluno
 from nota);

#item 4
select nome
from disciplina 
where codigo in 
(select cod_disciplina 
from prof_disciplina
 where cod_professor in
 (select codigo
 from professor
 where data_de_nascimento = 
 (select min(data_de_nascimento)
 from professor)));
 
 #item 5
 select nome
from professor 
where codigo in 
(select cod_professor 
from prof_disciplina 
where cod_disciplina = 
(select codigo 
from disciplina 
where nome = 'Banco de dados'));

#item 6
select matricula_aluno, avg(nota) as 'CR' 
from nota
group by matricula_aluno;

#item 7
select aluno.nome, disciplina.nome
from aluno, disciplina, nota
where aluno.matricula = nota.matricula_aluno and disciplina.codigo = nota.cod_disciplina and nota < 6;

#item 8
select nome, date_format(data_de_nascimento, '%d, %M de %Y') as 'data de nascimento'
from professor 
where data_de_nascimento =
(select max(data_de_nascimento) from professor);

#item 9
select disciplina.nome, avg(nota) as 'Média'
from disciplina, nota
where disciplina.codigo = nota.cod_disciplina
group by cod_disciplina 
having Média >= 7;

#item 10 - Resposta: O registro é excluído!
delete from nota
where matricula_aluno = '002INF' and cod_disciplina = 'RDSI';

#item 11 - Resposta: Não será permitida a exclusão, devido as restrições de integridade (chave estrangeira)!
delete from disciplina
where codigo = 'BDI';

#item 12
select aluno.matricula, date_format(aluno.data_de_nascimento, '%d, %M de %Y') as 'data de nascimento', disciplina.nome, max(nota) as 'Maior nota'
from aluno, nota, disciplina
where aluno.matricula = nota.matricula_aluno and disciplina.codigo = nota.cod_disciplina and aluno.nome = 'JOÃO';