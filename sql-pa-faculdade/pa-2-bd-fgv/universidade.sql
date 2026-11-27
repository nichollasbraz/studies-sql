-- sala
create table sala(
    predio      varchar(15),
    numero_sala varchar(7),
    capacidade  numeric(4,0),
    primary key (predio, numero_sala)
);

-- departamento
create table departamento(
    nome_dept   varchar(20), 
    predio      varchar(15), 
    orcamento   numeric(12,2) check (orcamento > 0),
    primary key (nome_dept)
);

-- curso
create table curso(
    id_curso    varchar(8), 
    titulo      varchar(50), 
    nome_dept   varchar(20),
    creditos    numeric(2,0) check (creditos > 0),
    primary key (id_curso),
    foreign key (nome_dept) references departamento (nome_dept)
        on delete set null
);

-- instrutor
create table instrutor(
    ID          varchar(5), 
    nome        varchar(20) not null, 
    nome_dept   varchar(20), 
    salario     numeric(8,2) check (salario > 29000),
    primary key (ID),
    foreign key (nome_dept) references departamento (nome_dept)
        on delete set null
);

-- seção
create table secao(
    id_curso        varchar(8), 
    id_sec          varchar(8),
    semestre        varchar(6)
    check (semestre in ('Fall', 'Winter', 'Spring', 'Summer')), 
    ano             numeric(4,0) check (ano > 1701 and ano < 2100), 
    predio          varchar(15),
    numero_sala     varchar(7),
    id_periodo      varchar(4),
    primary key (id_curso, id_sec, semestre, ano),
    foreign key (id_curso) references curso (id_curso)
        on delete cascade,
    foreign key (predio, numero_sala) references sala (predio, numero_sala)
        on delete set null
);

-- ministra
create table ministra(
    ID          varchar(5), 
    id_curso    varchar(8),
    id_sec      varchar(8),
    semestre    varchar(6),
    ano         numeric(4,0),
    primary key (ID, id_curso, id_sec, semestre, ano),
    foreign key (id_curso, id_sec, semestre, ano) references secao (id_curso, id_sec, semestre, ano)
        on delete cascade,
    foreign key (ID) references instrutor (ID)
        on delete cascade
);

-- aluno
create table aluno(
    ID          varchar(5), 
    nome        varchar(20) not null, 
    nome_dept   varchar(20), 
    tot_cred    numeric(3,0) check (tot_cred >= 0),
    primary key (ID),
    foreign key (nome_dept) references departamento (nome_dept)
        on delete set null
);

-- realiza
create table realiza(
    ID          varchar(5), 
    id_curso    varchar(8),
    id_sec      varchar(8), 
    semestre    varchar(6),
    ano         numeric(4,0),
    nota        varchar(2),
    primary key (ID, id_curso, id_sec, semestre, ano),
    foreign key (id_curso, id_sec, semestre, ano) references secao (id_curso, id_sec, semestre, ano)
        on delete cascade,
    foreign key (ID) references aluno (ID)
        on delete cascade
);

-- mentor
create table mentor(
    id_est      varchar(5),
    id_inst     varchar(5),
    primary key (id_est),
    foreign key (id_inst) references instrutor (ID)
        on delete set null,
    foreign key (id_est) references aluno (ID)
        on delete cascade
);

-- periodo
create table periodo(
    id_periodo      varchar(4),
    dia             varchar(1),
    hora_inicio     numeric(2) check (hora_inicio >= 0 and hora_inicio < 24),
    min_inicio      numeric(2) check (min_inicio >= 0 and min_inicio < 60),
    hora_fim        numeric(2) check (hora_fim >= 0 and hora_fim < 24),
    min_fim         numeric(2) check (min_fim >= 0 and min_fim < 60),
    primary key     (id_periodo, dia, hora_inicio, min_inicio)
);

-- prereq
create table prereq(
    id_curso        varchar(8),
    id_prereq       varchar(8),
    primary key (id_curso, id_prereq),
    foreign key (id_curso) references curso (id_curso)
        on delete cascade,
    foreign key (id_prereq) references curso (id_curso)
);

create table nota_pontos(
    nota    varchar(2),
    pontos  numeric(2,1)
);

insert into nota_pontos values ('A',4);
insert into nota_pontos values ('A-',3.7);
insert into nota_pontos values ('B+',3.3);
insert into nota_pontos values ('B',3);
insert into nota_pontos values ('B-',2.7);
insert into nota_pontos values ('C+',2.4);
insert into nota_pontos values ('C',2.1);
insert into nota_pontos values ('C-',1.8);
insert into sala values ('Packard', '101', '500');
insert into sala values ('Painter', '514', '10');
insert into sala values ('Taylor', '3128', '70');
insert into sala values ('Watson', '100', '30');
insert into sala values ('Watson', '120', '50');
insert into departamento values ('Biology', 'Watson', '90000');
insert into departamento values ('Comp. Sci.', 'Taylor', '100000');
insert into departamento values ('Elec. Eng.', 'Taylor', '85000');
insert into departamento values ('Finance', 'Painter', '120000');
insert into departamento values ('History', 'Painter', '50000');
insert into departamento values ('Music', 'Packard', '80000');
insert into departamento values ('Physics', 'Watson', '70000');
insert into curso values ('BIO-101', 'Intro. to Biology', 'Biology', '4');
insert into curso values ('BIO-301', 'Genetics', 'Biology', '4');
insert into curso values ('BIO-399', 'Computational Biology', 'Biology', '3');
insert into curso values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
insert into curso values ('CS-190', 'Game Design', 'Comp. Sci.', '4');
insert into curso values ('CS-315', 'Robotics', 'Comp. Sci.', '3');
insert into curso values ('CS-319', 'Image Processing', 'Comp. Sci.', '3');
insert into curso values ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
insert into curso values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
insert into curso values ('FIN-201', 'Investment Banking', 'Finance', '3');
insert into curso values ('HIS-351', 'World History', 'History', '3');
insert into curso values ('MU-199', 'Music Video Production', 'Music', '3');
insert into curso values ('PHY-101', 'Physical Principles', 'Physics', '4');
insert into instrutor values ('10101', 'Srinivasan', 'Comp. Sci.', '65000');
insert into instrutor values ('12121', 'Wu', 'Finance', '90000');
insert into instrutor values ('15151', 'Mozart', 'Music', '40000');
insert into instrutor values ('22222', 'Einstein', 'Physics', '95000');
insert into instrutor values ('32343', 'El Said', 'History', '60000');
insert into instrutor values ('33456', 'Gold', 'Physics', '87000');
insert into instrutor values ('45565', 'Katz', 'Comp. Sci.', '75000');
insert into instrutor values ('58583', 'Califieri', 'History', '62000');
insert into instrutor values ('76543', 'Singh', 'Finance', '80000');
insert into instrutor values ('76766', 'Crick', 'Biology', '72000');
insert into instrutor values ('83821', 'Brandt', 'Comp. Sci.', '92000');
insert into instrutor values ('98345', 'Kim', 'Elec. Eng.', '80000');
insert into secao values ('BIO-101', '1', 'Summer', '2017', 'Painter', '514', 'B');
insert into secao values ('BIO-301', '1', 'Summer', '2018', 'Painter', '514', 'A');
insert into secao values ('CS-101', '1', 'Fall', '2017', 'Packard', '101', 'H');
insert into secao values ('CS-101', '1', 'Spring', '2018', 'Packard', '101', 'F');
insert into secao values ('CS-190', '1', 'Spring', '2017', 'Taylor', '3128', 'E');
insert into secao values ('CS-190', '2', 'Spring', '2017', 'Taylor', '3128', 'A');
insert into secao values ('CS-315', '1', 'Spring', '2018', 'Watson', '120', 'D');
insert into secao values ('CS-319', '1', 'Spring', '2018', 'Watson', '100', 'B');
insert into secao values ('CS-319', '2', 'Spring', '2018', 'Taylor', '3128', 'C');
insert into secao values ('CS-347', '1', 'Fall', '2017', 'Taylor', '3128', 'A');
insert into secao values ('EE-181', '1', 'Spring', '2017', 'Taylor', '3128', 'C');
insert into secao values ('FIN-201', '1', 'Spring', '2018', 'Packard', '101', 'B');
insert into secao values ('HIS-351', '1', 'Spring', '2018', 'Painter', '514', 'C');
insert into secao values ('MU-199', '1', 'Spring', '2018', 'Packard', '101', 'D');
insert into secao values ('PHY-101', '1', 'Fall', '2017', 'Watson', '100', 'A');
insert into ministra values ('10101', 'CS-101', '1', 'Fall', '2017');
insert into ministra values ('10101', 'CS-315', '1', 'Spring', '2018');
insert into ministra values ('10101', 'CS-347', '1', 'Fall', '2017');
insert into ministra values ('12121', 'FIN-201', '1', 'Spring', '2018');
insert into ministra values ('15151', 'MU-199', '1', 'Spring', '2018');
insert into ministra values ('22222', 'PHY-101', '1', 'Fall', '2017');
insert into ministra values ('32343', 'HIS-351', '1', 'Spring', '2018');
insert into ministra values ('45565', 'CS-101', '1', 'Spring', '2018');
insert into ministra values ('45565', 'CS-319', '1', 'Spring', '2018');
insert into ministra values ('76766', 'BIO-101', '1', 'Summer', '2017');
insert into ministra values ('76766', 'BIO-301', '1', 'Summer', '2018');
insert into ministra values ('83821', 'CS-190', '1', 'Spring', '2017');
insert into ministra values ('83821', 'CS-190', '2', 'Spring', '2017');
insert into ministra values ('83821', 'CS-319', '2', 'Spring', '2018');
insert into ministra values ('98345', 'EE-181', '1', 'Spring', '2017');
insert into aluno values ('00128', 'Zhang', 'Comp. Sci.', '102');
insert into aluno values ('12345', 'Shankar', 'Comp. Sci.', '32');
insert into aluno values ('19991', 'Brandt', 'History', '80');
insert into aluno values ('23121', 'Chavez', 'Finance', '110');
insert into aluno values ('44553', 'Peltier', 'Physics', '56');
insert into aluno values ('45678', 'Levy', 'Physics', '46');
insert into aluno values ('54321', 'Williams', 'Comp. Sci.', '54');
insert into aluno values ('55739', 'Sanchez', 'Music', '38');
insert into aluno values ('70557', 'Snow', 'Physics', '0');
insert into aluno values ('76543', 'Brown', 'Comp. Sci.', '58');
insert into aluno values ('76653', 'Aoi', 'Elec. Eng.', '60');
insert into aluno values ('98765', 'Bourikas', 'Elec. Eng.', '98');
insert into aluno values ('98988', 'Tanaka', 'Biology', '120');
insert into realiza values ('00128', 'CS-101', '1', 'Fall', '2017', 'A');
insert into realiza values ('00128', 'CS-347', '1', 'Fall', '2017', 'A-');
insert into realiza values ('12345', 'CS-101', '1', 'Fall', '2017', 'C');
insert into realiza values ('12345', 'CS-190', '2', 'Spring', '2017', 'A');
insert into realiza values ('12345', 'CS-315', '1', 'Spring', '2018', 'A');
insert into realiza values ('12345', 'CS-347', '1', 'Fall', '2017', 'A');
insert into realiza values ('19991', 'HIS-351', '1', 'Spring', '2018', 'B');
insert into realiza values ('23121', 'FIN-201', '1', 'Spring', '2018', 'C+');
insert into realiza values ('44553', 'PHY-101', '1', 'Fall', '2017', 'B-');
insert into realiza values ('45678', 'CS-101', '1', 'Fall', '2017', 'F');
insert into realiza values ('45678', 'CS-101', '1', 'Spring', '2018', 'B+');
insert into realiza values ('45678', 'CS-319', '1', 'Spring', '2018', 'B');
insert into realiza values ('54321', 'CS-101', '1', 'Fall', '2017', 'A-');
insert into realiza values ('54321', 'CS-190', '2', 'Spring', '2017', 'B+');
insert into realiza values ('55739', 'MU-199', '1', 'Spring', '2018', 'A-');
insert into realiza values ('76543', 'CS-101', '1', 'Fall', '2017', 'A');
insert into realiza values ('76543', 'CS-319', '2', 'Spring', '2018', 'A');
insert into realiza values ('76653', 'EE-181', '1', 'Spring', '2017', 'C');
insert into realiza values ('98765', 'CS-101', '1', 'Fall', '2017', 'C-');
insert into realiza values ('98765', 'CS-315', '1', 'Spring', '2018', 'B');
insert into realiza values ('98988', 'BIO-101', '1', 'Summer', '2017', 'A');
insert into realiza values ('98988', 'BIO-301', '1', 'Summer', '2018', null);
insert into mentor values ('00128', '45565');
insert into mentor values ('12345', '10101');
insert into mentor values ('23121', '76543');
insert into mentor values ('44553', '22222');
insert into mentor values ('45678', '22222');
insert into mentor values ('76543', '45565');
insert into mentor values ('76653', '98345');
insert into mentor values ('98765', '98345');
insert into mentor values ('98988', '76766');
insert into periodo values ('A', 'M', '8', '0', '8', '50');
insert into periodo values ('A', 'W', '8', '0', '8', '50');
insert into periodo values ('A', 'F', '8', '0', '8', '50');
insert into periodo values ('B', 'M', '9', '0', '9', '50');
insert into periodo values ('B', 'W', '9', '0', '9', '50');
insert into periodo values ('B', 'F', '9', '0', '9', '50');
insert into periodo values ('C', 'M', '11', '0', '11', '50');
insert into periodo values ('C', 'W', '11', '0', '11', '50');
insert into periodo values ('C', 'F', '11', '0', '11', '50');
insert into periodo values ('D', 'M', '13', '0', '13', '50');
insert into periodo values ('D', 'W', '13', '0', '13', '50');
insert into periodo values ('D', 'F', '13', '0', '13', '50');
insert into periodo values ('E', 'T', '10', '30', '11', '45 ');
insert into periodo values ('E', 'R', '10', '30', '11', '45 ');
insert into periodo values ('F', 'T', '14', '30', '15', '45 ');
insert into periodo values ('F', 'R', '14', '30', '15', '45 ');
insert into periodo values ('G', 'M', '16', '0', '16', '50');
insert into periodo values ('G', 'W', '16', '0', '16', '50');
insert into periodo values ('G', 'F', '16', '0', '16', '50');
insert into periodo values ('H', 'W', '10', '0', '12', '30');
insert into prereq values ('BIO-301', 'BIO-101');
insert into prereq values ('BIO-399', 'BIO-101');
insert into prereq values ('CS-190', 'CS-101');
insert into prereq values ('CS-315', 'CS-101');
insert into prereq values ('CS-319', 'CS-101');
insert into prereq values ('CS-347', 'CS-101');
insert into prereq values ('EE-181', 'PHY-101');
