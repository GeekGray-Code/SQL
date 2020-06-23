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

insert into Teacher values('101','张三',20,'男','教授')
insert into Teacher values('102','李四',30,'男','教授')
insert into Teacher values('103','小红',20,'女','教师')
insert into Teacher values('104','王五',50,'男','教授')

insert into Course values('101','c101','数据库原理')
insert into Course values('102','c102','C语言')
insert into Course values('103','c103','数据库原理')

select * from Teacher
select * from Course

select * from TestTable

select Teacher.tno,tname,age,gender,prof,cname
from Teacher,Course
where Teacher.tno=Course.tno
and prof='教授'


select Teacher.tno,tname,age,gender,prof,cname
from Teacher full join Course
on Teacher.tno=Course.tno
where prof='教授'


select Teacher.tno,tname,age,gender,prof,cname
from Teacher left join Course
on Teacher.tno=Course.tno
where prof='教授'


select Teacher.tno,tname,age,gender,prof,cname
from Course right join Teacher
on Teacher.tno=Course.tno
where prof='教授'