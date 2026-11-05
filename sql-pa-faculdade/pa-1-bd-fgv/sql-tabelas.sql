create table aluno(
    id          varchar(5), 
    nome        varchar(20), 
    nome_dept   varchar(20), 
    tot_cred    numeric(3,0),
    primary key (id)
);

-- departamento
create table departamento(
    nome_dept   varchar(20),
    predio      varchar(15),
    orcamento   numeric(12,2),
    primary key (nome_dept)
);

-- professor
create table professor(
    id          varchar(5), 
    nome        varchar(20), 
    nome_dept   varchar(20), 
    salario     numeric(8,2),
    primary key (id),
    foreign key (nome_dept) references departamento (nome_dept)
);

select p.id, p.nome, d.nome_dept, p.salario, d.predio from professor as p
inner join departamento as d
on p.nome_dept == d.nome_dept;




