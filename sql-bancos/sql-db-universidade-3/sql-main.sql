select 
	id_instrutor,
	nome,
	(
		select count(*)
		from ministra
		where instrutor.id_instrutor = ministra.id_instrutor
	) as quantidade
from instrutor;