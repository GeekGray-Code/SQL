create table TestTable
(
	 id char(6) primary key,
	 name nchar(6),
	 age int,
	 sex nchar(1)
)


create table Teacher
(
	tno char(6) primary key,
	tname nchar(6) not null,
	age int,
	gender nchar(2),
	prof nchar(6)
)

create table Course
(
	tno char(6) foreign key references Teacher(tno),
	cno char(6),
	cname nchar(10)
)

insert into Teacher values('101','����',20,'��','����')
insert into Teacher values('102','����',30,'��','����')
insert into Teacher values('103','С��',20,'Ů','��ʦ')
insert into Teacher values('104','����',50,'��','����')

insert into Course values('101','c101','���ݿ�ԭ��')
insert into Course values('102','c102','C����')
insert into Course values('103','c103','���ݿ�ԭ��')

select * from Teacher
select * from Course

select * from TestTable

select Teacher.tno,tname,age,gender,prof,cname
from Teacher,Course
where Teacher.tno=Course.tno
and prof='����'


select Teacher.tno,tname,age,gender,prof,cname
from Teacher full join Course
on Teacher.tno=Course.tno
where prof='����'


select Teacher.tno,tname,age,gender,prof,cname
from Teacher left join Course
on Teacher.tno=Course.tno
where prof='����'


select Teacher.tno,tname,age,gender,prof,cname
from Course right join Teacher
on Teacher.tno=Course.tno
where prof='����'