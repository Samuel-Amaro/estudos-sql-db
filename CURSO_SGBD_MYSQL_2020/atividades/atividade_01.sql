-- exercicio 01 pratico
-- CRIANDO BANCO DE DADOS
CREATE DATABASE faculdade_ifg;

USE faculdade_ifg;

CREATE TABLE aluno(id_aluno int auto_increment primary key,
				  matricula varchar(10) not null,
                  nome_aluno varchar(30) not null,
                  data_nascimento date not null
                  );

INSERT INTO aluno(matricula,nome_aluno,data_nascimento) VALUES('01NF','Samuel',20000502),('02NF','Junior',19790901),
('03NF','Michele',19990501),('04NF','Tiago',19970102),('05NF','Ramires',20010909),('06NF','Maria',19790201),
('07NF','Jorge Jesus',19650301),('08NF','Vitoria',20000306),('09NF','Larissa',19990301),('010NF','Debora',19940201);

SELECT * FROM aluno;

                  
CREATE TABLE professor(id_prof int auto_increment primary key,
                       codigo_prof int not null,
                       nome_prof varchar(30) not null,
                       data_nascimento date not null
                       );

INSERT INTO professor(codigo_prof,nome_prof,data_nascimento) VALUES(1001,'Alice',19790408),(1002,'Carlos',19830509),
(1003,'Luiz',19810302),(1004,'Jeremias',19790305),(1005,'Guanabara',19840102),(1006,'Alfredo',19890109),
(1007,'Uyara',19900205);
                       
CREATE TABLE disciplina(id_disciplina int auto_increment primary key,
                        codigo_disc varchar(30) not null,
                        nome_disciplina varchar(30) not null
						);

INSERT INTO disciplina(codigo_disc,nome_disciplina) VALUES('FSI','Fundamentos Sistemas de Inf'),
('BD','Banco de Dados'),('ED','Estrutura de Dados'),('POO','Programação orientada a obj'),
('AOO','Analise orientada a obj'),('SO','Sistemas Operacionais'),('MTP','Metodologia da Pesquisa Cien'),
('PPW','Programação Para Web');

select * from disciplina;

CREATE TABLE notas(id_nota int auto_increment primary key,
                   fk_matricula_aluno int not null,
                   fk_codg_disc int  not null                        
                   );     

ALTER TABLE notas ADD CONSTRAINT fk_matricula_aluno FOREIGN KEY(fk_matricula_aluno) REFERENCES aluno(id_aluno);
ALTER TABLE notas ADD CONSTRAINT fk_codigo_dic FOREIGN KEY(fk_codg_disc) REFERENCES disciplina(id_disciplina);
ALTER TABLE notas ADD COLUMN nota decimal not null;

INSERT INTO notas(fk_matricula_aluno,fk_codg_disc,nota) VALUES(1,1,9.1),(1,2,5.9),(1,3,6.7),(1,4,8.2),
(2,8,8.9),(2,4,7.1),(2,1,4.3),(2,5,4.9),(3,7,3.9),(3,4,5.9),(2,6,9.8),(4,3,4.8),(4,8,5.4),(5,1,7.5),(10,5,6.10),(5,2,5.7),
(6,6,6),(7,7,7),(7,5,7.9),(8,4,2.5);

select * from notas;

CREATE TABLE professor_disc(fk_id_prof int not null,
                            fk_codg_disc int not null
                            );
                           
ALTER TABLE professor_disc ADD CONSTRAINT fk_id_professor FOREIGN KEY(fk_id_prof) REFERENCES professor(id_prof);
ALTER TABLE professor_disc ADD CONSTRAINT fk_codigo_disciplina FOREIGN KEY(fk_codg_disc) REFERENCES disciplina(id_disciplina);                           

INSERT INTO professor_disc(fk_id_prof,fk_codg_disc) VALUES(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(3,8),(3,4),
(3,7),(4,2),(4,4),(4,5),(2,5),(3,1),(3,1); 


SELECT * FROM professor_disc;                           
                            