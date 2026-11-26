create view tot_creditos as
select 
	h.ano,
	sum(c.creditos_curso) as num_créditos
from curso as c
inner join historico as h
on c.id_curso = h.id_curso
where h.situacao = 'Aprovado'
group by h.ano;

select *
from tot_creditos;