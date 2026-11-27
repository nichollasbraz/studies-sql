select ID, nome, nome_dept, avg(salario) as media_salario
from instrutor
group by nome_dept;

select *
from instrutor
where salario = (
	select min(salario)
	from instrutor
);

update instrutor
set salario = salario * 1.10
where nome_dept = 'Comp. Sci.';

select *
from instrutor
where nome_dept = 'Comp. Sci.';

insert into instrutor(ID, nome, nome_dept, salario)
select 
	ID, 
	nome, 
	nome_dept, 
	30000
from aluno
where tot_cred > 100;

select * from instrutor
where salario = 30000;

delete from curso
where id_curso not in (
	select id_curso
	from secao
);

select * from curso;

select distinct
	aluno.id,
	aluno.nome
from aluno, realiza, curso
where aluno.id = realiza.id
and realiza.id_curso = curso.id_curso
and curso.nome_dept = 'Comp. Sci.';

select distinct id, nome
from aluno
natural join realiza
natural join curso
WHERE nome_dept = 'Comp. Sci.';

SELECT a.ID, a.nome
FROM aluno AS a
LEFT JOIN realiza AS r
ON a.ID = r.ID
WHERE r.ID IS NULL;

SELECT d.nome_dept, COUNT(i.ID) AS total_instrutores
FROM departamento AS d
LEFT JOIN instrutor AS i
ON d.nome_dept = i.nome_dept
GROUP BY d.nome_dept;

