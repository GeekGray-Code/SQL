
/************************ 第三章书本例题 ****************************************/



/* 创建数据库 默认逻辑名称，文件组，自动增长，路径*/
CREATE DATABASE DBName

/* 例3-1 创建数据库，

逻辑名称：Test_Data
数据文件存放在：E盘根目录下
文件名：Test_Data.mdf
数据文件的初始存储空间大小为：10MB
最大存储空间为：500MB
存储空间自动增长量为：10MB

日志文件的逻辑名称为：Test_Log
日志文件物理存放在：E盘根目录下
文件名为：Test_Data.ldf
初始存储空间为：5MB
最大存储空间为：500MB
存储空间自动增长量为：5MB
 */
CREATE DATABASE Test
ON
(
	NAME=Test_Data,
	FILENAME='E:\Test_Data.mdf',
	SIZE=10,
	MAXSIZE=500,
	FILEGROWTH=10
)
LOG ON
(
	NAME=Test_Log,
	FILENAME='E:\Test_Data.ldf',
	SIZE=10,
	MAXSIZE=500,
	FILEGROWTH=5
)


/* 修改数据库 */

/*例3-2 修改Test数据库中的Test_Data增容方式为一次增加20MB*/
ALTER DATABASE Test
MODIFY FILE
(
	NAME=Test_Data,
	FILEGROWTH=20
)

/*例3-3 添加一个次要数据文件，
逻辑名称为Test_Datanew，
存放在E盘根目录下，
文件名为Test_Datanew.ndf
数据文件初始大小为100MB
最大容量为200MB
文件自动增长容量为10MB
*/
ALTER DATABASE Test
ADD FILE
(
	NAME=Test_Datanew,
	FILENAME='E:\Test_Datanew.ndf',
	SIZE=100,
	MAXSIZE=200,
	FILEGROWTH=10
)

/*例3-4 从Test数据库中删除例3-3中增加的次要文件*/
ALTER DATABASE Test
REMOVE FILE Test_Datanew
/**********************************************************************************/



/*删除用户数据库****************************************************************/
/*例3-5 删除数据库Test*/
DROP DATABASE Test
/******************************************************************************/


/*3.3.7 查看数据信息************************************************************/

/*用系统存储过程显示数据库结构*/
EXEC Sp_helpdb DatabasePrincipleDB

/*用系统存储过程显示文件信息*/
EXEC Sp_helpfile Teacher

/*用系统存储过程显示文件组信息*/
USE DatabasePrincipleDB
EXEC Sp_helpfilegroup 

/*******************************************************************************/

/* 例3-6 创建学生关系表 S */

CREATE TABLE S(
	[SNo] [nchar](10) NOT NULL,
	[SN] [nvarchar](50) NOT NULL,
	[Sex] [nchar](2) NOT NULL,
	[Age] [int] NOT NULL,
	[Dept] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_S] PRIMARY KEY CLUSTERED 
(
	[SNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/* 删除表 drop table S */

select * from SC



/* 创建课程关系表 C */

CREATE TABLE [dbo].[C](
	[CNO] [nchar](10) NOT NULL,
	[CN] [nvarchar](50) NOT NULL,
	[CT] [float] NOT NULL,
 CONSTRAINT [PK_C] PRIMARY KEY CLUSTERED 
(
	[CNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

select * from T


/* 创建教师关系表 T */

CREATE TABLE [dbo].[T](
	[TNO] [nchar](10) NOT NULL,
	[TN] [nvarchar](50) NOT NULL,
	[Sex] [nchar](2) NOT NULL,
	[Age] [int] NOT NULL,
	[Prof] [nchar](10) NOT NULL,
	[Sal] [numeric](18, 2) NOT NULL,
	[Comm] [numeric](18, 2) NOT NULL,
	[Dept] [nchar](20) NOT NULL,
 CONSTRAINT [PK_T] PRIMARY KEY CLUSTERED 
(
	[TNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/* 创建授课关系表 TC */
CREATE TABLE [dbo].[TC](
	[TNO] [nchar](10) NOT NULL,
	[CNO] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TC_1] PRIMARY KEY CLUSTERED 
(
	[TNO] ASC,
	[CNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/* 创建选课关系表 SC */
CREATE TABLE [dbo].[SC](
	[SNO] [nchar](10) NOT NULL,
	[CNO] [nchar](10) NOT NULL,
	[Score] [numeric](18, 2) NULL,
 CONSTRAINT [PK_SC] PRIMARY KEY CLUSTERED 
(
	[SNO] ASC,
	[CNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/*插入数据*/
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES ('C1', N'程序设计', 60)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C2        ', N'微机原理', 80)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C3        ', N'数字逻辑', 60)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C4        ', N'数据结构', 80)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C5        ', N'数据库', 60)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C6        ', N'编译原理', 60)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C7        ', N'操作系统', 61)
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S1        ', N'赵亦', N'女 ', 17, N'计算机')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S2        ', N'钱尔', N'男 ', 18, N'信息')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S3        ', N'孙珊', N'女 ', 20, N'信息')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S4        ', N'李思', N'男 ', 21, N'自动化')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S5        ', N'周武', N'男 ', 19, N'计算机')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S6        ', N'吴丽', N'女 ', 20, N'自动化')
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S1        ', N'C1        ', CAST(90.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S1        ', N'C2        ', CAST(85.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S2        ', N'C4        ', CAST(70.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S2        ', N'C5        ', CAST(57.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S2        ', N'C6        ', CAST(80.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S2        ', N'C7        ', NULL)
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S3        ', N'C1        ', CAST(75.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S3        ', N'C2        ', CAST(70.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S3        ', N'C4        ', CAST(85.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S4        ', N'C1        ', CAST(93.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S4        ', N'C2        ', CAST(85.00 AS Numeric(18, 2)))
INSERT [dbo].[SC] ([SNO], [CNO], [Score]) VALUES (N'S4        ', N'C3        ', CAST(83.00 AS Numeric(18, 2)))
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T1        ', N'李力', N'男 ', 47, N'教授        ', CAST(1500.00 AS Numeric(18, 2)), CAST(3000.00 AS Numeric(18, 2)), N'计算机                 ')
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T2        ', N'王平', N'女 ', 28, N'讲师        ', CAST(800.00 AS Numeric(18, 2)), CAST(1200.00 AS Numeric(18, 2)), N'信息                  ')
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T3        ', N'刘伟', N'男 ', 30, N'讲师        ', CAST(900.00 AS Numeric(18, 2)), CAST(1200.00 AS Numeric(18, 2)), N'计算机                 ')
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T4        ', N'张雪', N'女 ', 51, N'教授        ', CAST(1600.00 AS Numeric(18, 2)), CAST(3000.00 AS Numeric(18, 2)), N'自动化                 ')
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T5        ', N'张兰', N'女 ', 39, N'副教授       ', CAST(1300.00 AS Numeric(18, 2)), CAST(2000.00 AS Numeric(18, 2)), N'信息                  ')
INSERT [dbo].[TC] ([TNO], [CNO]) VALUES (N'T1        ', N'C1        ')
INSERT [dbo].[TC] ([TNO], [CNO]) VALUES (N'T1        ', N'C4        ')
INSERT [dbo].[TC] ([TNO], [CNO]) VALUES (N'T2        ', N'C5        ')
INSERT [dbo].[TC] ([TNO], [CNO]) VALUES (N'T2        ', N'C6        ')
INSERT [dbo].[TC] ([TNO], [CNO]) VALUES (N'T3        ', N'C1        ')
INSERT [dbo].[TC] ([TNO], [CNO]) VALUES (N'T3        ', N'C5        ')
INSERT [dbo].[TC] ([TNO], [CNO]) VALUES (N'T4        ', N'C2        ')
INSERT [dbo].[TC] ([TNO], [CNO]) VALUES (N'T4        ', N'C3        ')
INSERT [dbo].[TC] ([TNO], [CNO]) VALUES (N'T5        ', N'C5        ')

select * from T
/*建表和出入数据*/

/*例3-7 建立一个S表,对SNO字段进行NOT NULL 约束*/
CREATE TABLE S
(
	SNO VARCHAR(6) CONSTRAINT S_CONS NOT NULL,
	SN NVARCHAR(10),
	Sex NCHAR(1),
	Age INT,
	Dept NVARCHAR(20)
)

/*字段后面不加约束名称，直接写约束类型*/
CREATE TABLE S
(
	SNO VARCHAR(6)  NOT NULL,
	SN NVARCHAR(10),
	Sex NCHAR(1),
	Age INT,
	Dept NVARCHAR(20)
)

/*例3-8 列约束 建立一个S表，定义SN为唯一键*/
CREATE TABLE S
(
	SNO VARCHAR(6)NOT NULL,
	SN NVARCHAR(10) CONSTRAINT SN_UNIQ UNIQUE,
	Sex NCHAR(1),
	Age INT,
	Dept NVARCHAR(20)
)

/*例3-9 表约束 建立一个S表，定义SN+Sex 为唯一键，磁约束为表约束*/
CREATE TABLE S
(
	SNO VARCHAR(6),
	SN NVARCHAR(10) UNIQUE,
	Sex NCHAR(1),
	Age	INT,
	Dept NVARCHAR(20),
	CONSTRAINT S_UNIQ UNIQUE(SN,Sex)/*系统为SN+Sex 建立唯一索引，确保同一性别的学生没有重名*/
)

/*例3-10 列约束 建立一个S表，定义SNo为S的主键*/
CREATE TABLE S
(
	SNO VARCHAR(6) NOT NULL CONSTRAINT S_prim PRIMARY KEY,
	SN NVARCHAR(10) UNIQUE,
	Sex NCHAR(1),
	Age	INT,
	Dept NVARCHAR(20)
)

/*例3-11 表约束 建立一个SC表，定义SNo+CNo为SC的主键*/
CREATE TABLE SC
(
	SNO VARCHAR(6) NOT NULL,
	CNo VARCHAR(6) NOT NULL,
	Score NUMERIC(4,1),
	CONSTRAINT SC_Prim PRIMARY KEY(SNo,CNo)
)

/*例3-12 表约束 建立一个SC表，定义SNo+CNo为SC的外部键*/
CREATE TABLE SC
(
	SNo NCHAR(6) NOT NULL CONSTRAINT S_Fore FOREIGN KEY REFERENCES S(SNo),
	CNo NCHAR(6) NOT NULL CONSTRAINT C_Fore FOREIGN KEY REFERENCES C(CNo),
	Score NUMERIC(4,1),
	CONSTRAINT SC_Prim PRIMARY KEY(SNo,CNo)
)

/*例3-13  建立一个SC表，定义Score 的分数取值范围为 0-100之间*/
CREATE TABLE SC
(
	SNo	VARCHAR(6) ,
	CNo VARCHAR(6) ,
	Score NUMERIC(4,1) CONSTRAINT Score_Chk CHECK(Score>=0 AND Score<=100),
	
)


/*例3-14 建立一个包含完整性定义的学生表S，*/
CREATE TABLE S
(
	SNo VARCHAR(6) CONSTRAINT S_Prim PRIMARY KEY,
	SN VARCHAR(6) NOT NULL,
	Sex NCHAR(1) NOT NULL DEFAULT '男',
	Age INT NOT NULL CHECK(Age BETWEEN 15 AND 50),
	Dept NVARCHAR(20) NOT NULL
)


/*修改数据表*/

/*例3-15 在S表中增加一个班号列和住址列*/
ALTER TABLE S
ADD
Class_No VARCHAR(6),
Stu_address NVARCHAR(20) /*新列自动填充null值，不能为增加的新列指定 NOT NULL 约束 */

/*例3-16 在SC表中增加完整性约束，使Score 在0-100 之间*/
ALTER TABLE SC
ADD
CONSTRAINT S_FORE CHECK(Score BETWEEN 0 AND 100)

/*例3-17 把S表中的SN列加宽到12个字符*/
ALTER TABLE S
ALTER COLUMN
SN NVARCHAR(12)

/*DROP 的方式 只用于删除完整性约束定义*/
/*例3-18 删除S表中的主键*/
ALTER TABLE S
DROP CONSTRAINT S_Prim

/*例3-19 删除表S  (只能删除自己建立的表，不能删除其他用户所建立的表)*/
DROP TABLE S




/*********************表的数据查询********************/

/*例3-20 查询全体学生的学号、姓名和年龄*/
USE DatabasePrincipleDB

SELECT SNo,SN,Age
FROM S


/*例3-21 查询全部学生信息*/
SELECT *
FROM S


/*3-22 查询选修了课程的学生的学号*/
SELECT DISTINCT SNo /*DISTINCT 关键字 去掉结果中的重复行*/
FROM SC



/*3-23 查询全体学生的姓名、学号、和年龄*/
SELECT SN,SNo,Age
FROM S

/*或者*/
SELECT SN AS NAME,SNo,Age	/*AS 可以省略*/
FROM S


/*3-24 查询选修课程号为C1的学生的学号和成绩*/
SELECT SNo,Score	/*此查询结果与关系代数中的选取操作结果相同*/
FROM SC
WHERE CNo = 'C1'


/*3-25 查询成绩高于85分的学生的学号、课程号和成绩*/
SELECT SNo,CNo,Score
FROM SC
WHERE Score>85



/*多条件查询	逻辑运算符优先级：NOT、AND、OR，可以使用括号修改优先级*/
/*3-26 查询选修C1或C2且分数大于等于85分学生的学号、课程号和成绩*/
SELECT SNo,CNo,Score
FROM SC
WHERE (CNo='C1' OR CNo='C2') AND (Score>=85)


/*3-27 查询工资在1000元-1500元之间的教师的教师号、姓名及职称*/
SELECT TNo,TN,Prof
FROM T
WHERE Sal BETWEEN 1000 AND 1500	/*SQL SERVER 中between and 包含等号，在有些DBMS中则不包含等号*/

/*等价于：*/
SELECT TNo,TN,Prof
FROM T
WHERE Sal>=1000 AND Sal<=1500


/*3-28 查询工资不在100元-1500元之间的教师的教师号、姓名、职称*/
SELECT TNo,TN,Prof
FROM T
WHERE Sal NOT BETWEEN 1000 AND 1500




/*3-29 查询选修C1或C2的学生的学号、课程号、成绩*/
SELECT SNo,CNo,Score
FROM SC
WHERE CNo IN ('C1','C2')

/*也可以用 OR 来实现*/
SELECT SNo,CNo,Score
FROM SC
WHERE CNo='C1' OR CNo='C2'


/*3-30 查询没有选修C1，也没有选修C2的学生的学号、课程号、成绩*/
SELECT SNo,CNo,Score
FROM SC
WHERE CNo NOT IN ('C1','C2')

/*等价于*/
SELECT SNo,CNo,Score
FROM SC
WHERE (CNo<>'C1') AND (CNo<>'C2')



/*5.部分匹配查询*/
/*3-31 查询所有姓张的教师的教师号和姓名*/
SELECT TNo,TN
FROM T
WHERE TN LIKE '张%'


/*3-21 查询姓名中第二个字是“力”教师的教师号和姓名*/
SELECT TNo,TN
FROM T
WHERE TN LIKE '_力%'


/*6.空值查询*/
/*3-22 查询没有考试成绩的学生的学号和相应的课程号*/
SELECT SNo,CNo,Score
FROM SC
WHERE Score IS NULL



/*库函数统计汇总查询,使用库函数查询，通常要给查询的每一项内容加别名，否则将不显示列名称*/
/*
	AVG:按列计算平均值（只能对数值型字段进行计算）
	SUM:按列计算值的总和（只能对数值型字段进行计算）
	MAX:求一列中的最大值
	MIN:求一列中的最小值
	COUNT:按列统计个数
*/

/*3-34 求学号为S1的学生的总分和平均分*/
SELECT SUM(Score) AS SCORE_SUM,AVG(Score) AS SCORE_AVG
FROM SC
WHERE SNo = 'S1'


/*3-35 求选修C1号课程的最高分，最低分及之间的差的分数*/
SELECT MAX(Score) AS MAX_SCORE,MIN(Score) AS MIN_SCORE,MAX(Score)-MIN(Score) AS DIFF_SCORE
FROM SC
WHERE CNo = 'C1'


/*3-36 求计算机系学生的总数*/
SELECT COUNT(*) AS DEPT_CUP 
FROM S
WHERE Dept = '计算机'

SELECT COUNT(SNo) AS DEPT_CUP 
FROM S
WHERE Dept = '计算机'


/*3-37 求学校中共有多少个系*/
SELECT  COUNT(DISTINCT Dept) AS DEPT_TOTAL /*DISTINCT 关键字要放在 count（）函数里面，count函数对空值不计算，但对0进行计算*/
FROM S


/*3-38 统计有成绩同学的人数*/
SELECT COUNT(Score)	/*成绩为0的也你算在内，成绩为空的不计算*/
FROM SC


/*3-39 利用特殊函数Count（*）求计算机系学生的总数*/
SELECT COUNT(*) AS CUPDEPT_NUM	/*COUNT(*)用来统计元组的个数，不消除重复行，不允许使用 DISTINCT 关键字*/
FROM S
WHERE Dept = '计算机'



/*分组查询*/
/*3-40 查询每个教师的教师号及其任课的门数*/
SELECT TNo,COUNT(*)AS 任课的门数
FROM TC
GROUP BY TNo

/*3-41 查询选修两门以上（含两门）课程的学生的学号和选课门数*/
SELECT SNo,COUNT(*) 选课门数
FROM SC
GROUP BY SNo
HAVING (COUNT(*)>=2)


/*查询结果的排序*/
/*3-42 查询选修C1的学生学号和成绩，并按成绩降序排序*/
SELECT SNo,Score
FROM SC
WHERE CNo = 'C1'
ORDER BY Score DESC

/*3-43 查询选修C2、C3、C4、或C5课程的学号、课程号和成绩，查询结果按学号升序排列，学号相同再按成绩降序排列*/
SELECT SNo,CNo,Score
FROM SC
WHERE CNo IN ('C2','C3','C4','C5')
ORDER BY SNo ASC, Score DESC




/*多关系表的连接查询*/
/*内连接查询*/
/*3-44 查询刘伟老师所讲授的课程，要求列出教师号、教师姓名和课程号*/
SELECT T.TNo,TN,CNo
FROM T,TC
WHERE T.TNo = TC.TNo
AND TN = '刘伟'

/*JOIN ON 关键字*/
SELECT T.TNo,TN,CNo
FROM T INNER JOIN TC
ON T.TNo = TC.TNo
WHERE TN = '刘伟'

/*方法3*/
SELECT R1.TNo,R2.TN,R1.CNo
FROM 
	(
		SELECT TNo,CNo
		FROM TC
	)AS R1
INNER JOIN
		  (
			SELECT TNo,TN
			FROM T
			WHERE TN = '刘伟'
		  )AS R2
ON R1.TNO=R2.TNO

/*3-45 查询所有选课学生的学号、姓名、选课成绩及成绩*/
SELECT SC.SNO,SN,CN,SCORE
FROM S,SC,C
WHERE S.SNO = SC.SNO
AND SC.CNO = C.CNO

/*3-46查询每门课程的课程号、课程名和选课人数*/
SELECT SC.CNO,CN,COUNT(SC.SNO) AS 选课人数
FROM C,SC
WHERE SC.CNO = C.CNO
GROUP BY SC.CNO,CN
/********************************************************************************/



/*3.6.3 外连接查询，bit类型的列，不允许有null值，因此会被填上0，再返回到结果中..............................................................................*/

/*3-47 查询所有学生的学号，姓名，选课名称及成绩（没有选课的同学的选课信息显示为空）*/
SELECT S.SNO,SN,CN,SCORE
FROM S
LEFT OUTER JOIN SC
ON S.SNO = SC.SNO
LEFT OUTER JOIN C
ON SC.CNO = C.CNO

/*3.6.4 交叉查询,笛卡尔积*/

/*3-48 对学生表s和课程表c进行交叉查询*/
SELECT *
FROM S
CROSS JOIN C

/*3.6.5 自连接查询*/
/*3-49 查询所有比‘刘伟’工资高的教师的姓名、工资、和刘伟的工资*/
SELECT T2.TN,T2.SAL,T1.SAL AS 刘伟的工资
FROM T AS T1,T AS T2
WHERE T2.SAL > (SELECT SAL
				FROM T
				WHERE T.TN = '刘伟'
				)
AND T1.TN = '刘伟'

/*或者*/
SELECT T2.TN,T2.SAL,T1.SAL AS 刘伟的工资
FROM T AS T1,T AS T2
WHERE T2.SAL > T1.SAL
AND T1.TN = '刘伟'

/*或者*/
SELECT T2.TN,T2.SAL,T1.SAL AS 刘伟的工资
FROM T AS T1
INNER JOIN T AS T2
ON T2.SAL > T1.SAL
AND T1.TN = '刘伟'

SELECT T2.TN,T2.SAL,T1.SAL AS 刘伟的工资
FROM T AS T1
INNER JOIN T AS T2
ON T2.SAL > T1.SAL
WHERE T1.TN = '刘伟'


/*3-50 检索所有学生的姓名、年龄和选课名称*/
SELECT SN,AGE,CN
FROM S,SC,C
WHERE S.SNO = SC.SNO
AND SC.CNO = C.CNO


/*3.7.1 普通子查询,先执行子查询，父查询有用到子查询的结果*/
/*3-51 （返回一个值）查询与刘伟老师职称相同的教师号、姓名*/
SELECT TNO,TN
FROM T
WHERE PROF = 
	(
		SELECT PROF
		FROM T
		WHERE T.TN = '刘伟'  
	)


/*3-52 （返回一组值）查询讲授课程号为C5的教师姓名*/
SELECT TN
FROM T
WHERE T.TNO IN
				(
					SELECT TNO
					FROM TC
					WHERE CNO = 'C5'
				)

/*或者用any 表示任意一个*/
SELECT TN
FROM T
WHERE T.TNO = ANY
				(
					SELECT TNO
					FROM TC
					WHERE CNO = 'C5'
				)

/*连接查询实现*/
SELECT TN
FROM T,TC
WHERE T.TNO = TC.TNO
AND CNO = 'C5'


/*3-53 查询其他系中比计算机系某一教师工资高的教师的姓名和工资*/
SELECT TN,SAL
FROM T 
WHERE T.SAL > 
				(
					SELECT MIN(SAL)
					FROM T
					WHERE T.DEPT = '计算机'
				)
AND T.DEPT <> '计算机'

/*或者用any*/
SELECT TN,SAL
FROM T 
WHERE T.SAL > ANY
				(
					SELECT SAL
					FROM T
					WHERE T.DEPT = '计算机'
				)
AND T.DEPT <> '计算机'


/*3-55 查询其他系中比计算机系中所有教师的工资都高的教师的姓名和工资*/
SELECT TN,SAL
FROM T
WHERE SAL > ALL
		(
			SELECT SAL
			FROM T
			WHERE T.DEPT = '计算机'
		)
AND T.DEPT <> '计算机'

/*或者用max*/
SELECT TN,SAL
FROM T
WHERE SAL > 
		(
			SELECT MAX(SAL)
			FROM T
			WHERE T.DEPT = '计算机'
		)
AND T.DEPT <> '计算机'



/*3.7.2 相关子查询 子查询的条件需要引用父类查询表中的属性值
		相关子查询的执行次数由父查询表的行数决定
		执行顺序：
					1.选取父查询表中的一行记录，内部子查询利用此行中先关的熟悉值进行查询
					2.父查询根据子查询返回的结果判断此行是否满足查询条件
					3.若满足，则把该行放入父查询结果集中，重复执行过程，直到处理完父查询表中的每一行数据
*/


/*3-56 查询不讲授课程号为c5的教师姓名*/
SELECT TN
FROM T
WHERE 'C5'<>ALL
		(
			SELECT CNO
			FROM TC
			WHERE TNO = T.TNO
		)

/*除法运算 求的是象集中不包含c5的元组*/
SELECT TN
FROM T
WHERE 'C5'NOT IN
		(
			SELECT CNO
			FROM TC
			WHERE TNO = T.TNO
		)


/*3-57 用含有exists 的语句完成例3-52 的查询，即查询讲授课程号为c5的教师姓名*/
SELECT TN
FROM T
WHERE EXISTS
			(
				SELECT *
				FROM TC
				WHERE TNO = T.TNO
				AND CNO = 'C5'
			)

/*3-58 查询没有讲授课程号为C5 的教师的姓名*/
SELECT TN
FROM T
WHERE NOT EXISTS 
				(
					SELECT *
					FROM TC
					WHERE T.TNO = TC.TNO
					AND CNO = 'C5'
				)


/*3-59 查询选修了所有课程的学生的姓名*/
SELECT SN
FROM S
WHERE NOT EXISTS 
					(
						SELECT *
						FROM C
						WHERE NOT EXISTS
										(
											SELECT *
											FROM SC
											WHERE SNO =S.SNO
											AND CNO = C.CNO
										)
					)



/*集合运算查询*/
/*3-60 从sc数据表中查询出学号为s1同学的学号和总分，
	   再从sc数据表中查询出学号为s5同学学号和总分
	   然后将两个查询结果合成一个结果集
*/

SELECT SNO AS 学号,SUM(SCORE) AS TOTALSCORE
FROM SC
WHERE SNO = 'S1'
GROUP BY SNO
UNION
SELECT SNO AS 学号,SUM(SCORE) AS TOTALSCORE
FROM SC
WHERE SNO = 'S4'
GROUP BY SNO


/*这样查结果也一样*/
SELECT SNO AS 学号,SUM(SCORE) AS TOTALSCORE
FROM SC
WHERE SNO = 'S1' OR SNO = 'S4'
GROUP BY SNO



/*存储查询结果到表中*/
/*3-61 从sc中查询出所有同学的学号和总分，并将查询结果存放到一个新的数据表Cal_Table中*/
SELECT SNO AS 学号,SUM(SCORE) AS TOTALSCORE
INTO Cal_Table
FROM SC
GROUP BY SNO

SELECT * FROM Cal_Table



/*3.9.1 添加数据表中的数据
		必须用逗号隔开数据，字符型数据用单引号括起来
		into 子句中没有指定列名，则新添加的记录必须在每个属性列上均有值，
		且values子句中指的排列书序要和表中各属性列的排序一致
*/

/*3-62 在s表中添加一条学生记录（学号s7，姓名：郑冬，性别：女，年龄：21，系别：计算机）*/
INSERT INTO S (SNO,SN,AGE,SEX,DEPT)
VALUES ('S7','郑冬',21,'女','计算机')

/*3-63 在sc表中添加一条选课记录（‘S7’，‘C1’）*/
INSERT INTO SC (SNO,CNO)
VALUES ('S7','C1')


/*3-64 求出各系教师的平均工资，把结果放在新表AvgSal中*/

/*首先，建立新表AvgSal，用来存放系名和各系的平均工资*/
CREATE TABLE AvgSal
(
	Department VARCHAR(20),
	AvgSal SMALLINT
)

/*然后，利用子查询求出t表中各系的平均工资，把结果存放在新表中*/
INSERT INTO AvgSal
SELECT DEPT,AVG(SAL)
FROM T
GROUP BY DEPT

SELECT * FROM AvgSal


/*3.9.2 修改表中的数据*/

/*3-65 修改一行，把刘伟老师转到信息系*/
UPDATE T
SET DEPT = '信息'
WHERE TN = '刘伟'


/*3-66 修改多行 将所有学生的年龄增加1岁*/
UPDATE S
SET AGE=AGE+1

/*3-67 把教师表中工资小于或等于1000元的讲师的工资提高20%*/
UPDATE T
SET SAL = 1.2*SAL
WHERE (PROF = '讲师') AND (SAL<=1000)



/*3-68 用子查询选择要修改的行 把讲授c5课程的教师的岗位津贴增加100元*/
UPDATE T
SET COMM = COMM+100
WHERE 
		(
			TNO IN 
					(
						SELECT TC.TNO
						FROM T,TC
						WHERE T.TNO = TC.TNO
						AND TC.CNO = 'C5'
					)
		)	/*子查询的作用是得到所有讲授c5课程的教师号*/


/*3-69 用子查询提供要修改的值 把所有教师的工资提高到平均工资的1.2倍*/
UPDATE T
SET SAL = 
			(
				SELECT 1.2 * AVG(SAL)
				FROM T
			)	/*子查询的作用是得到所有教师的平均工资的1.2倍*/



/*3.9.3 删除数据*/
/*3-70 删除一行记录 删除刘伟老师的记录*/
DELETE 
FROM T
WHERE TN = '刘伟'



/*3-71 删除多行记录 删除所有教师的授课记录*/
DELETE 
FROM TC	/*执行此语句后，tc为空表，但其定义仍存在数据字典中*/


/*3-72 利用子查询选择要删除的行 删除刘伟老师的授课记录*/
DELETE 
FROM TC
WHERE TNO =
		(
			SELECT TNO
			FROM T
			WHERE TN = '刘伟'
		)







/*3.10 视图*/

/*3-73 创建一个计算机系教师情况的视图
		视图操作是批处理语句，放在go之间
*/
GO
CREATE VIEW SUB_T
AS SELECT TNO,TN,PROF
FROM T
WHERE DEPT = '计算机'
GO
SELECT * FROM SUB_T


/*3-74 创建一个学生情况的视图（包括姓名学号课程名及成绩）*/
GO
CREATE VIEW S_SC_C(SNO,SN,CN,SCORE)
AS SELECT S.SNO,SN,CN,SCORE
FROM S,C,SC
WHERE S.SNO = SC.SNO 
AND SC.CNO = C.CNO
GO


/*3-75 创建一个学生平均成绩视图s_avg*/
GO
CREATE VIEW S_AVG(SNO,SCORE_AVG)
AS SELECT SNO,AVG(SCORE)
FROM SC
GROUP BY SNO
GO


/*3.10.2 修改视图*/
/*3-76 修改学生情况视图S_SC_C(SN,CN,SCORE)*/
GO
ALTER VIEW S_SC_C(SN,CN,SCORE)
AS SELECT SN,CN,SCORE
FROM S,SC,C
WHERE S.SNO = SC.SNO
AND SC.CNO = C.CNO
GO



/*3.10.3 删除视图*/
/*3-77 删除计算机教师情况的视图sub_t*/
DROP VIEW SUB_T


/*3.10.4 查询视图*/
/*3-78 查询视图sub_t 中职称为教授的教师号和姓名*/
GO
SELECT TNO,TN
FROM SUB_T
WHERE PROF = '教授'
GO


/*3.10.5 更新视图*/

/*3-79 添加 向计算机教师视图中添加一条记录（教师号：t6，姓名：李丹，职称：副教授）*/
INSERT INTO SUB_T (TNO,TN,PROF)
VALUES('T6','李丹','副教授')	/*操作失败，不能将null值插入dept列 
									未指定列名的数据默认填充null值
									若该列有not null 约束 则插入失败
								*/


/*3-80 修改 将计算机系教师视图sub_t 中刘伟的职称改为’副教授‘*/
UPDATE SUB_T
SET PROF = '副教授'
WHERE TN = '刘伟'


/*3-81 删除 删除计算机系教师视图 sub_t 中刘伟老师的记录*/
DELETE FROM SUB_T
WHERE TN = '刘伟'



/*3.11.3 创建索引 */
/*3-82 为sc表 在sno 和 cno 上建立唯一索引*/
CREATE UNIQUE INDEX SCI ON SC(SNO,CNO)
/*此索引为sno和cno两列的符合索引，即对sc表中的行先按sno 的递增顺序索引，
  对于相同的sno，再按cno的递增顺序索引
  由于unique的限制，所以在（sno，cno）组合列的排序上具有唯一性，不存在重复值	
*/

/*3-83 为教师表 t 在 tn 上建立聚集索引*/
CREATE CLUSTERED INDEX TI ON T(TN)	/*T 表中的巨鹿将按照tn的值升序存放*/


/*3.11.4 修改索引*/


/*3.11.5 删除索引*/
DROP INDEX 索引名称 ON 当前索引基于的表名或视图名



/*3.11.6 查看索引*/
/*用 sp_helpindex 存储过程查看索引*/
EXEC SP_HELPINDEX T


/*使用 sp_rename 存储过程更改索引名称*/
EXEC SP_RENAME 'T.TI','T_INDEX'