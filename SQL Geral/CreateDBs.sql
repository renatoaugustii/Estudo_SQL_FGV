CREATE TABLE sala(
    predio      varchar(15),
    numero_sala varchar(7),
    capacidade  numeric(4,0),
    primary key (predio, numero_sala)
);
INSERT INTO sala VALUES('Packard','101',500);
INSERT INTO sala VALUES('Painter','514',10);
INSERT INTO sala VALUES('Taylor','3128',70);
INSERT INTO sala VALUES('Watson','100',30);
INSERT INTO sala VALUES('Watson','120',50);
CREATE TABLE departamento(
    nome_dept   varchar(20), 
    predio      varchar(15), 
    orcamento   numeric(12,2) check (orcamento &amp;gt; 0),
    primary key (nome_dept)
);
INSERT INTO departamento VALUES('Biology','Watson',90000);
INSERT INTO departamento VALUES('Comp. Sci.','Taylor',100000);
INSERT INTO departamento VALUES('Elec. Eng.','Taylor',85000);
INSERT INTO departamento VALUES('Finance','Painter',120000);
INSERT INTO departamento VALUES('History','Painter',50000);
INSERT INTO departamento VALUES('Music','Packard',80000);
INSERT INTO departamento VALUES('Physics','Watson',70000);
CREATE TABLE curso(
    id_curso    varchar(8), 
    titulo      varchar(50), 
    nome_dept   varchar(20),
    creditos    numeric(2,0) check (creditos &amp;gt; 0),
    primary key (id_curso),
    foreign key (nome_dept) references departamento (nome_dept)
        on delete set null
);
INSERT INTO curso VALUES('BIO-101','Intro. to Biology','Biology',4);
INSERT INTO curso VALUES('BIO-301','Genetics','Biology',4);
INSERT INTO curso VALUES('BIO-399','Computational Biology','Biology',3);
INSERT INTO curso VALUES('CS-101','Intro. to Computer Science','Comp. Sci.',4);
INSERT INTO curso VALUES('CS-190','Game Design','Comp. Sci.',4);
INSERT INTO curso VALUES('CS-315','Robotics','Comp. Sci.',3);
INSERT INTO curso VALUES('CS-319','Image Processing','Comp. Sci.',3);
INSERT INTO curso VALUES('CS-347','Database System Concepts','Comp. Sci.',3);
INSERT INTO curso VALUES('EE-181','Intro. to Digital Systems','Elec. Eng.',3);
INSERT INTO curso VALUES('FIN-201','Investment Banking','Finance',3);
INSERT INTO curso VALUES('HIS-351','World History','History',3);
INSERT INTO curso VALUES('MU-199','Music Video Production','Music',3);
INSERT INTO curso VALUES('PHY-101','Physical Principles','Physics',4);
CREATE TABLE instrutor(
    ID          varchar(5), 
    nome        varchar(20) not null, 
    nome_dept   varchar(20), 
    salario     numeric(8,2) check (salario &amp;gt; 29000),
    primary key (ID),
    foreign key (nome_dept) references departamento (nome_dept)
        on delete set null
);
INSERT INTO instrutor VALUES('10101','Srinivasan','Comp. Sci.',65000);
INSERT INTO instrutor VALUES('12121','Wu','Finance',90000);
INSERT INTO instrutor VALUES('15151','Mozart','Music',40000);
INSERT INTO instrutor VALUES('22222','Einstein','Physics',95000);
INSERT INTO instrutor VALUES('32343','El Said','History',60000);
INSERT INTO instrutor VALUES('33456','Gold','Physics',87000);
INSERT INTO instrutor VALUES('45565','Katz','Comp. Sci.',75000);
INSERT INTO instrutor VALUES('58583','Califieri','History',62000);
INSERT INTO instrutor VALUES('76543','Singh','Finance',80000);
INSERT INTO instrutor VALUES('76766','Crick','Biology',72000);
INSERT INTO instrutor VALUES('83821','Brandt','Comp. Sci.',92000);
INSERT INTO instrutor VALUES('98345','Kim','Elec. Eng.',80000);
CREATE TABLE secao(
    id_curso        varchar(8), 
    id_sec          varchar(8),
    semestre        varchar(6)
    check (semestre in ('Fall', 'Winter', 'Spring', 'Summer')), 
    ano             numeric(4,0) check (ano &amp;gt; 1701 and ano &amp;lt; 2100), 
    predio          varchar(15),
    numero_sala     varchar(7),
    time_slot_id    varchar(4),
    primary key (id_curso, id_sec, semestre, ano),
    foreign key (id_curso) references curso (id_curso)
        on delete cascade,
    foreign key (predio, numero_sala) references sala (predio, numero_sala)
        on delete set null
);
INSERT INTO secao VALUES('BIO-101','1','Summer',2017,'Painter','514','B');
INSERT INTO secao VALUES('BIO-301','1','Summer',2018,'Painter','514','A');
INSERT INTO secao VALUES('CS-101','1','Fall',2017,'Packard','101','H');
INSERT INTO secao VALUES('CS-101','1','Spring',2018,'Packard','101','F');
INSERT INTO secao VALUES('CS-190','1','Spring',2017,'Taylor','3128','E');
INSERT INTO secao VALUES('CS-190','2','Spring',2017,'Taylor','3128','A');
INSERT INTO secao VALUES('CS-315','1','Spring',2018,'Watson','120','D');
INSERT INTO secao VALUES('CS-319','1','Spring',2018,'Watson','100','B');
INSERT INTO secao VALUES('CS-319','2','Spring',2018,'Taylor','3128','C');
INSERT INTO secao VALUES('CS-347','1','Fall',2017,'Taylor','3128','A');
INSERT INTO secao VALUES('EE-181','1','Spring',2017,'Taylor','3128','C');
INSERT INTO secao VALUES('FIN-201','1','Spring',2018,'Packard','101','B');
INSERT INTO secao VALUES('HIS-351','1','Spring',2018,'Painter','514','C');
INSERT INTO secao VALUES('MU-199','1','Spring',2018,'Packard','101','D');
INSERT INTO secao VALUES('PHY-101','1','Fall',2017,'Watson','100','A');
CREATE TABLE ministra(
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
INSERT INTO ministra VALUES('10101','CS-101','1','Fall',2017);
INSERT INTO ministra VALUES('10101','CS-315','1','Spring',2018);
INSERT INTO ministra VALUES('10101','CS-347','1','Fall',2017);
INSERT INTO ministra VALUES('12121','FIN-201','1','Spring',2018);
INSERT INTO ministra VALUES('15151','MU-199','1','Spring',2018);
INSERT INTO ministra VALUES('22222','PHY-101','1','Fall',2017);
INSERT INTO ministra VALUES('32343','HIS-351','1','Spring',2018);
INSERT INTO ministra VALUES('45565','CS-101','1','Spring',2018);
INSERT INTO ministra VALUES('45565','CS-319','1','Spring',2018);
INSERT INTO ministra VALUES('76766','BIO-101','1','Summer',2017);
INSERT INTO ministra VALUES('76766','BIO-301','1','Summer',2018);
INSERT INTO ministra VALUES('83821','CS-190','1','Spring',2017);
INSERT INTO ministra VALUES('83821','CS-190','2','Spring',2017);
INSERT INTO ministra VALUES('83821','CS-319','2','Spring',2018);
INSERT INTO ministra VALUES('98345','EE-181','1','Spring',2017);
CREATE TABLE aluno(
    ID          varchar(5), 
    nome        varchar(20) not null, 
    nome_dept   varchar(20), 
    tot_cred    numeric(3,0) check (tot_cred &amp;gt;= 0),
    primary key (ID),
    foreign key (nome_dept) references departamento (nome_dept)
        on delete set null
);
INSERT INTO aluno VALUES('00128','Zhang','Comp. Sci.',102);
INSERT INTO aluno VALUES('12345','Shankar','Comp. Sci.',32);
INSERT INTO aluno VALUES('19991','Brandt','History',80);
INSERT INTO aluno VALUES('23121','Chavez','Finance',110);
INSERT INTO aluno VALUES('44553','Peltier','Physics',56);
INSERT INTO aluno VALUES('45678','Levy','Physics',46);
INSERT INTO aluno VALUES('54321','Williams','Comp. Sci.',54);
INSERT INTO aluno VALUES('55739','Sanchez','Music',38);
INSERT INTO aluno VALUES('70557','Snow','Physics',0);
INSERT INTO aluno VALUES('76543','Brown','Comp. Sci.',58);
INSERT INTO aluno VALUES('76653','Aoi','Elec. Eng.',60);
INSERT INTO aluno VALUES('98765','Bourikas','Elec. Eng.',98);
INSERT INTO aluno VALUES('98988','Tanaka','Biology',120);
CREATE TABLE realiza(
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
INSERT INTO realiza VALUES('00128','CS-101','1','Fall',2017,'A');
INSERT INTO realiza VALUES('00128','CS-347','1','Fall',2017,'A-');
INSERT INTO realiza VALUES('12345','CS-101','1','Fall',2017,'C');
INSERT INTO realiza VALUES('12345','CS-190','2','Spring',2017,'A');
INSERT INTO realiza VALUES('12345','CS-315','1','Spring',2018,'A');
INSERT INTO realiza VALUES('12345','CS-347','1','Fall',2017,'A');
INSERT INTO realiza VALUES('19991','HIS-351','1','Spring',2018,'B');
INSERT INTO realiza VALUES('23121','FIN-201','1','Spring',2018,'C+');
INSERT INTO realiza VALUES('44553','PHY-101','1','Fall',2017,'B-');
INSERT INTO realiza VALUES('45678','CS-101','1','Fall',2017,'F');
INSERT INTO realiza VALUES('45678','CS-101','1','Spring',2018,'B+');
INSERT INTO realiza VALUES('45678','CS-319','1','Spring',2018,'B');
INSERT INTO realiza VALUES('54321','CS-101','1','Fall',2017,'A-');
INSERT INTO realiza VALUES('54321','CS-190','2','Spring',2017,'B+');
INSERT INTO realiza VALUES('55739','MU-199','1','Spring',2018,'A-');
INSERT INTO realiza VALUES('76543','CS-101','1','Fall',2017,'A');
INSERT INTO realiza VALUES('76543','CS-319','2','Spring',2018,'A');
INSERT INTO realiza VALUES('76653','EE-181','1','Spring',2017,'C');
INSERT INTO realiza VALUES('98765','CS-101','1','Fall',2017,'C-');
INSERT INTO realiza VALUES('98765','CS-315','1','Spring',2018,'B');
INSERT INTO realiza VALUES('98988','BIO-101','1','Summer',2017,'A');
INSERT INTO realiza VALUES('98988','BIO-301','1','Summer',2018,NULL);
CREATE TABLE mentor(
    id_est      varchar(5),
    id_inst     varchar(5),
    primary key (id_est),
    foreign key (id_inst) references instrutor (ID)
        on delete set null,
    foreign key (id_est) references aluno (ID)
        on delete cascade
);
INSERT INTO mentor VALUES('00128','45565');
INSERT INTO mentor VALUES('12345','10101');
INSERT INTO mentor VALUES('23121','76543');
INSERT INTO mentor VALUES('44553','22222');
INSERT INTO mentor VALUES('45678','22222');
INSERT INTO mentor VALUES('76543','45565');
INSERT INTO mentor VALUES('76653','98345');
INSERT INTO mentor VALUES('98765','98345');
INSERT INTO mentor VALUES('98988','76766');
CREATE TABLE time_slot(
    time_slot_id    varchar(4),
    dia             varchar(1),
    start_hr        numeric(2) check (start_hr &amp;gt;= 0 and start_hr &amp;lt; 24),
    start_min       numeric(2) check (start_min &amp;gt;= 0 and start_min &amp;lt; 60),
    end_hr          numeric(2) check (end_hr &amp;gt;= 0 and end_hr &amp;lt; 24),
    end_min         numeric(2) check (end_min &amp;gt;= 0 and end_min &amp;lt; 60),
    primary key     (time_slot_id, dia, start_hr, start_min)
);
INSERT INTO time_slot VALUES('A','M',8,0,8,50);
INSERT INTO time_slot VALUES('A','W',8,0,8,50);
INSERT INTO time_slot VALUES('A','F',8,0,8,50);
INSERT INTO time_slot VALUES('B','M',9,0,9,50);
INSERT INTO time_slot VALUES('B','W',9,0,9,50);
INSERT INTO time_slot VALUES('B','F',9,0,9,50);
INSERT INTO time_slot VALUES('C','M',11,0,11,50);
INSERT INTO time_slot VALUES('C','W',11,0,11,50);
INSERT INTO time_slot VALUES('C','F',11,0,11,50);
INSERT INTO time_slot VALUES('D','M',13,0,13,50);
INSERT INTO time_slot VALUES('D','W',13,0,13,50);
INSERT INTO time_slot VALUES('D','F',13,0,13,50);
INSERT INTO time_slot VALUES('E','T',10,30,11,45);
INSERT INTO time_slot VALUES('E','R',10,30,11,45);
INSERT INTO time_slot VALUES('F','T',14,30,15,45);
INSERT INTO time_slot VALUES('F','R',14,30,15,45);
INSERT INTO time_slot VALUES('G','M',16,0,16,50);
INSERT INTO time_slot VALUES('G','W',16,0,16,50);
INSERT INTO time_slot VALUES('G','F',16,0,16,50);
INSERT INTO time_slot VALUES('H','W',10,0,12,30);
CREATE TABLE prereq(
    id_curso        varchar(8),
    id_prereq       varchar(8),
    primary key (id_curso, id_prereq),
    foreign key (id_curso) references curso (id_curso)
        on delete cascade,
    foreign key (id_prereq) references curso (id_curso)
);
INSERT INTO prereq VALUES('BIO-301','BIO-101');
INSERT INTO prereq VALUES('BIO-399','BIO-101');
INSERT INTO prereq VALUES('CS-190','CS-101');
INSERT INTO prereq VALUES('CS-315','CS-101');
INSERT INTO prereq VALUES('CS-319','CS-101');
INSERT INTO prereq VALUES('CS-347','CS-101');
INSERT INTO prereq VALUES('EE-181','PHY-101');
CREATE TABLE profesor(
    ID          varchar(5), 
    nome        varchar(20), 
    nome_dept   varchar(20), 
    salario     numeric(8,2) 
);
COMMIT;
&lt;/sql&gt;&lt;sql name=&quot;SQL 2&quot;&gt;.help


&lt;/sql&gt;&lt;current_tab id=&quot;0&quot;/&gt;&lt;/tab_sql&gt;&lt;/sqlb_project&gt;
</sql><current_tab id="0"/></tab_sql></sqlb_project>
