/* 第三章 设计题 2. */

/* (1)建表 */
/* 创建存书表(书号,书名,出版社,版次,出版日期,作者,书价,进价,数量) */
create table PurchaseBooks
(
	BNo char(10) primary key,
	BName varchar(50) not null,
	Publish varchar(50),
	Version float,
	PDate date,
	BAuth varchar(50),
	BPrice numeric(4,1),
	PCPrice numeric(4,1),
	Bcount int
)



/* 创建销售表(日期,书号,数量,金额) */
create table BookSell
(
	BSID char(10) primary key,
	BNo char(10) constraint B_C foreign key REFERENCES PurchaseBooks (BNo),
	SDate date,
	SCount int,
	SMoney smallmoney
)

create table BookSellTest
(
	BSID char(10) primary key,
	BNo char(10) constraint B_CTest foreign key REFERENCES PurchaseBooks (BNo),
	SDate datetime,
	SCount int,
	SMoney smallmoney
)


/* drop table PurchaseBooks */

/* (2)列出当前库存的所有书名,数量,余额(余额=进价*数量) */
select Bname,Bcount,(PCPrice*Bcount) as 余额
from PurchaseBooks

/* (3) 统计销售总额 */
select sum(SCount*SMoney) as 销售总额
from BookSell

/* (3) 按日期统计销售总额 */
select SDate,sum(SCount*SMoney) as 销售总额
from BookSell
group by SDate


/* (4)列出每天的销售列表,包括书名,数量,合计金额(每一种书的销售总额) */
select SDate,BName,sum(SCount)as 每一种书当天的销售数量,sum(SCount*SMoney) as 每一种书当天的销售总额
from PurchaseBooks as PB,BookSell as BS
where PB.BNo = BS.BNo
group by BName,SDate
order by SDate

/* 如果少了日期的限制,就变成了每一种书的总销量和每一种书的总销售金额 */
select BName,sum(SCount)as 每一种书的销售数量,sum(SCount*SMoney) as 每一种书的销售总额
from PurchaseBooks as PB,BookSell as BS
where PB.BNo = BS.BNo
group by BName

/*列出每天的销售列表,包括书名,数量,合计金额(每一种书的销售总额)*/
SELECT SDATE,BS.BNO,BNAME,SCOUNT,SMONEY,SCOUNT*SMONEY AS TOTALMONEY
FROM PurchaseBooks as PB,BookSell as BS
where PB.BNo = BS.BNo
ORDER BY SDATE 




select * from BookSell
order by SDate


/* (5)分析畅销书，即列出本期（从当前日期起，向前30天）销售数量大于100的书名，数量 */

select BName,sum(SCount)as 销售数量
from PurchaseBooks,BookSell
where PurchaseBooks.BNo = BookSell.BNo
and DateDiff(dd,SDate,getdate())<=30
group by BName
having (sum(SCount)>100)

/*加上书编号*/
select BName,BookSell.BNo,sum(SCount)as 销售数量
from PurchaseBooks,BookSell
where PurchaseBooks.BNo = BookSell.BNo
and DateDiff(dd,SDate,GETDATE())<=30
group by BName,BookSell.BNo
having (sum(SCount)>100)

/*
select BName,SCount
from PurchaseBooks,BookSell
where PurchaseBooks.BNo = BookSell.BNo
and SCount>100
and DateDiff(dd,SDate,getdate())<=30

*/





/* 查询同一本书的销售总量 */
select  BNo,sum(SCount)as totalCount
from BookSell
group by BNo

/*插入测试数据*/
insert into PurchaseBooks values('PB01','《爱的供养》','出版社',1.0,'2019/11/05','作者',50.0,50.0,10)
insert into PurchaseBooks values('PB02','《爱的供养1》','出版社',1.0,'2019/11/04','作者',50.0,50.0,10)
insert into PurchaseBooks values('PB03','《爱的供养8》','出版社',1.0,'2019/10/01','作者',50.0,50.0,10)

insert into BookSell values('BS01','PB01','2019/11/05',5,50)
insert into BookSell values('BS02','PB02','2019/11/04',5,50)
insert into BookSell values('BS03','PB03','2019/10/01',5,50)
insert into BookSell values('BS04','PB03','2019/10/02',5,50)
insert into BookSell values('BS05','PB03','2019/10/02',5,50)
insert into BookSell values('BS06','PB02','2019/10/02',5,50)
insert into BookSell values('BS07','PB02','2019/10/02',99,50)
insert into BookSell values('BS08','PB03','2019/11/02',99,50)
insert into BookSell values('BS09','PB03','2019/11/02',99,50)

insert into BookSellTest values('BS09','PB03',GETDATE(),99,50)
insert into BookSellTest values('BS08','PB03','2019/10/02',99,50)

/*查询测试数据*/
select * from BookSell

select * from BookSellTest

select * from BookSellTest where SDate+30<(select max(SDate) from BookSellTest)
select * from BookSellTest where SDate<(select max(SDate)-30 from BookSellTest)

/*修改测试数据*/
update BookSell set SCount=101
where BSID='BS02'

/*删除测试数据*/
delete BookSell
where BSID='BS07'

/********************************* SQL 日期类操作 ***********************************************************/
/*获取表中最新的日期*/
select max(SDate)
from BookSell
 
/*获取当前日期时间*/
select GETDATE()

/* 当前日期-指定日期 的值 结果是一个int型 */
select DATEDIFF(dd,'2019/11/06', GETDATE())
from BookSell


/*30天内的所有数据：*/
select * from BookSell where DateDiff(dd,SDate,GETDATE())<=30

/*

今天的所有数据：select * from 表名 where DateDiff(dd,datetime类型字段,getdate())=0
昨天的所有数据：select * from 表名 where DateDiff(dd,datetime类型字段,getdate())=1
7天内的所有数据：select * from 表名 where DateDiff(dd,datetime类型字段,getdate())<=7
30天内的所有数据：select * from 表名 where DateDiff(dd,datetime类型字段,getdate())<=30
本月的所有数据：select * from 表名 where DateDiff(mm,datetime类型字段,getdate())=0
本年的所有数据：select * from 表名 where DateDiff(yy,datetime类型字段,getdate())=0
 
 
查询今天是今年的第几天： select datepart(dayofyear,getDate())
查询今天是本月的第几天：1. select datepart(dd, getDate()) 
                        2.select day(getDate())
查询本周的星期一日期是多少 （注意：指定日期不能是周日，如果是周日会计算到下周一去。所以如果是周日要减一天） SELECT DATEADD(wk,DATEDIFF(wk,0,getdate()),0)
 
查询昨天日期：select convert(char,dateadd(DD,-1,getdate()),111)  //111是样式号，（100-114）
 
查询本月第一天日期：Select DATEADD(mm, DATEDIFF(mm,0,getdate()), 0) as firstday
查询本月最后一天日期：Select dateadd(ms,-3,DATEADD(mm, DATEDIFF(m,0,getdate())+1, 0)) as lastday      //修改-3的值会有相应的变化
 
本月有多少天：select datepart(dd,dateadd(dd,-1,dateadd(mm,1,cast((cast(year(getdate()) as varchar)+'-'+cast(month(getdate()) as varchar)+'-01' ) as datetime ))))
 
求两个时间段相差几天：select datediff(day,'2012/8/1','2012/8/20') as daysum
在指定的日期上±N天：select convert(char,dateadd(dd,1,'2012/8/20'),111) as riqi    //输出2012/8/21
在指定的日期上±N分钟：select dateadd(mi,-15,getdate())  //查询当前时间15分钟之前的日期​

*/


/********************************************** 简单题4.5 四个基本表 s，sc，c，t  ************************************/

/*（1）用SQL的DDL语言创建S表，S#为主码，SN不能为空。*/
create table Student
(
	S# char(10) primary key,
	SN varchar(20) not null,
	AGE int,
	DEPT varchar(30)
);

/*创建C表，C#为主码*/
create table Course
(
	C# char(10) primary key,
	CN varchar(20) not null,
);


/*创建SC表*/
create table SCourse
(
	S# char(10) ,
	C# char(10),
	GR float
);

/*创T表*/
create table Teacher
(
	T# char(10) primary key,
	TN varchar(20) not null,
	SAL float,
	COMM float,
	C# char(10)
);

/* 插入S表数据 */
insert into Student values('S1','丁一',20,'计算机')
insert into Student values('S2','王二',19,'计算机')
insert into Student values('S3','张三',19,'外语')
insert into Student values('S4','赵四',21,'外语')

/*C表数据*/
insert into Course values('C1','数据库')
insert into Course values('C2','操作系统')
insert into Course values('C3','微机原理')

/* 插入SC表数据 */
insert into SCourse values('S1','C1',80)
insert into SCourse values('S1','C2',89)
insert into SCourse values('S2','C3',59)
insert into SCourse values('S2','C2',99)
insert into SCourse values('S3','C1',99)
insert into SCourse values('S3','C2',99)
insert into SCourse values('S3','C3',99)

/* 插入T表数据 */
insert into Teacher values('T1','王力',800,null,'C1')
insert into Teacher values('T2','张兰',1200,300,'C2')
insert into Teacher values('T3','李伟',700,150,'C1')

select  * from SCourse

/*（2）创建计算机系学生的视图，该视图的属性列由学号、姓名、课程号和任课教师号组成。*/

/*create view 必须是批处理中的第一条语句。也就是说，你可能在这段代码之前还有其他的语句是同时在处理。

解决方法：

1、可以在这段代码的前一行加上GO，在这段代码结束后一行加上GO

2、在新窗口单独执行这段代码*/

go
CREATE VIEW computer_student(S#,SN,C#,T#)
as
select Student.S#,SN,SCourse.C#,T#
from Student,SCourse,Teacher
where Student.S# = SCourse.S#
and SCourse.C# = Teacher.C#
and DEPT='计算机'
go

select * from computer_student

/* （3）检索计算机系年龄在20岁以上的学生学号。 */
select S#
from Student
where AGE>20
and DEPT='计算机'


/* （4）检索姓王的教师所讲课程的课程号及课程名称。 */
select Course.C#,CN
from Teacher,Course
where Teacher.C# = Course.C#
and Teacher.TN like '王%'

/* (5）检索张三同学所学课程的成绩，列出SN、C#和GR。 */
select SN,SCourse.C#,GR
from Student,SCourse
where Student.S# = SCourse.S#
and SN = '张三'

/* （6）检索选修总收入超过1000元的教师所讲课程的学生姓名、课程号和成绩。 */
select SN,SCourse.C#,GR
from Teacher,Student,SCourse
where Student.S# = SCourse.S#
and Teacher.C# = SCourse.C#
and (SAL+COMM)>1000

/* （7）检索没有选修C1课程且选修课程数为两门的学生的姓名和平均成绩，并按平均成绩降序排列。 */
select Student.S#,SN,avg(GR)as 平均成绩,count(SCourse.S#)as 选课门数 /* count(SCourse.S#)as 可要可不要 加上是为了清晰显示 */
from Student,SCourse
where Student.S# = SCourse.S#
and C#<>'C1'
group by Student.S#,SN
having count(*)=2
order by avg(GR)asc

/*
	COUNT() 函数返回匹配指定条件的行数。

	COUNT(*) 函数返回表中的记录数：
	SELECT COUNT(*) FROM Student

	COUNT(column_name) 函数返回指定列的值的数目（NULL 不计入）：
	SELECT COUNT(Student.S#) FROM Student

	COUNT(DISTINCT column_name) 函数返回指定列的不同值的数目：
	SELECT COUNT(DISTINCT SCourse.S#) FROM SCourse
*/

/* w3c数据库教程 https://www.w3school.com.cn/sql/sql_func_count.asp */
/* SQL 内置函数 https://www.cnblogs.com/kongsq/p/3861905.html */

/* （8）检索选修和张三同学所选课程中任意一门相同的学生姓名、课程名。 */
select Student.SN,CN
from Student,SCourse,Course
where Student.S# = SCourse.S#
and SCourse.C# = Course.C#
and SCourse.C# = any(
						select C#
						from SCourse,Student
						where Student.S# = SCourse.S#
						and SN = '张三'
					 )
and Student.SN<>'张三'

/* in 语句*/
SELECT Student.SN,CN
FROM Student,SCourse,Course 
WHERE Student.S# = SCourse.S#
and SCourse.C# = Course.C# 
AND SCourse.C#
IN (
		SELECT C# FROM Student,SCourse 
		WHERE SCourse.C# = Course.C# 
		AND SN='张三'
	) 
AND SN<>'张三'


/* （9）S1同学选修了C3，将此信息插入SC表中。 */
insert into SCourse(S#,C#) values('S1','C3')

/* 查看结果 */
select * from SCourse
order by S#


/* （10）删除S表中没有选修任何课程的学生记录。 */
delete  Student
where Student.S# not in 
(
	select distinct S#
	from SCourse
);


/* 查询S表中没有选修任何课程的学生记录*/
select Student.S#
from Student
where Student.S# not in 
(
	select distinct S#
	from SCourse
)
