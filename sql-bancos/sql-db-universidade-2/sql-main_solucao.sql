.headers on
.mode column
.open universidade.db

delete from curso where id_curso= 'CS-001';
delete from secao where id_curso= 'CS-001';
delete from realiza where id_curso= 'CS-001';

-- Escreva aqui o código da consulta 1
insert into curso
values ('CS-001', 'Weekly Seminar', 'Comp. Sci.', 1);



-- Escreva aqui o código da consulta 2
insert into secao
values ('CS-001', 1, 'Fall', 2017, null, null, null);



-- Escreva aqui o código da consulta 3
insert into realiza
  select ID, 'CS-001', 1, 'Fall', 2017, null
  from aluno
  where nome_dept = 'Comp. Sci.';



-- Escreva aqui o código da consulta 4
delete from realiza
where id_curso= 'CS-001' and id_sec = 1 and
ano = 2017 and semestre = 'Fall' and
ID = 12345;



-- Escreva aqui os dump das tabelas curso, secao, e realiza
.dump curso
.dump secao
.dump realiza