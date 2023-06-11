 -- 1. Listar a quantidade de alunos que possuem nota na disciplina de banco de dados.

 SELECT * FROM notas as N JOIN aluno AS A ON N.fk_matricula_aluno = A.id_aluno 
 JOIN disciplina AS D ON N.fk_codg_disc = D.id_disciplina 
 WHERE D.nome_disciplina = 'Banco de Dados' AND N.nota > 0;
 -- explicação: fiz um join entre notas e aluno nas correspondecias
 -- dos id e fk e outro join entre notas e disciplina no mesmo sentido de correspondecia
 -- aplicando uma filtragem para buscar onde a disciplina e banco de dados e a nota seja maior que 0
 
-- 2. Listar o nome das disciplinas nas quais os alunos Samuel e Junior possuem nota.
SELECT N.fk_matricula_aluno,A.id_aluno,N.nota,A.nome_aluno,D.codigo_disc,D.nome_disciplina FROM notas AS N JOIN aluno AS A ON A.id_aluno = N.fk_matricula_aluno JOIN disciplina AS D ON N.fk_codg_disc = D.id_disciplina WHERE A.nome_aluno = 'Samuel' OR A.nome_Aluno = 'Junior' AND N.nota > 0;
-- explicação do que fiz
-- fiz um join entre notas e alunos(para obter nome dos alunos) e um join entre notas e disciplina(obter nome das diciplinas)
-- depois fiz uma filtragem para buscar onde o nome e junior ou samuel(os dois pode ocorrer junto de acordo com a tabela verdade)
-- e tammbem onde a notas deles for maior que 0

-- 3. Listar o nome, e a data de nascimento (no formato DD/MM/AAAA), dos alunos que não possuem notas em nenhuma disciplina.
SELECT *,DATE_FORMAT(A.data_nascimento,"%d/%m/%Y") as Data_formatda FROM notas AS N JOIN aluno AS A ON N.fk_matricula_aluno = A.id_aluno JOIN disciplina AS D ON N.fk_codg_disc = D.id_disciplina WHERE N.nota = 0;


-- 4. Listar o nome da(s) disciplina(s) lecionada(s) pelo professor mais velho.
SELECT * FROM professor_disc AS PD JOIN professor AS P ON PD.fk_id_prof = P.id_prof
JOIN disciplina AS D ON PD.fk_codg_disc = D.id_disciplina
WHERE P.data_nascimento = (select min(data_nascimento) as Data_velho from professor);

-- explicação: fiz um join entre prof_disc e professor e prof_disc e disciplina
-- onde a filtragem e uma subconsulta para buscar a pessoa mais velha via data de nascimento

 