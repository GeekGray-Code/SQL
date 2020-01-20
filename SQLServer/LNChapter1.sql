/*建立Depts 的SQL 命令*/
CREATE TABLE LNDepts
(
	Dno CHAR(5) PRIMARY KEY,/*系别编号*/
	Dname NCHAR(20) NOT NULL /*系别名称*/
)
/*DROP TABLE DEPTS*/


/*建立 LNStudents */
CREATE TABLE LNStudents
(
	Sno CHAR(5) PRIMARY KEY,
	Sname NCHAR(20) NOT NULL,
	Ssex NCHAR(2),
	Sage INT,
	Dno CHAR(5),			/*系别编号*/
	CONSTRAINT FK_Dno FOREIGN KEY(Dno) REFERENCES LNDepts
)
SELECT * FROM LNStudents 
/*DROP TABLE LNStudents*/


/*建立 LNCourses */
CREATE TABLE LNCourses
(
	Cno CHAR(6) PRIMARY KEY,/*课程号*/
	Cname NCHAR(20),		/*课程名称*/
	PreCno CHAR(6),			/*选修课程号*/
	Credits INT				/*学分*/
)


/*建立 LNReports */
CREATE TABLE LNReports
(
	Sno CHAR(5),			/*学号*/
	Cno CHAR(6) ,			/*课程号*/
	Grade INT,				/*考试成绩*/
	PRIMARY KEY(Sno,Cno),
	CONSTRAINT Student_Reports FOREIGN KEY(Sno) REFERENCES LNStudents,
	CONSTRAINT Reports_Course FOREIGN KEY(Cno) REFERENCES LNCourses
)



/*****************************************************************************************/
/*************************************insert 插入数据**********************************/

SELECT * FROM LNReports

INSERT INTO LNDepts VALUES('D01','自动化')
INSERT INTO LNDepts VALUES('D02','计算机')
INSERT INTO LNDepts VALUES('D03','数学')
INSERT INTO LNDepts VALUES('D04','通信')
INSERT INTO LNDepts VALUES('D05','电子')


INSERT INTO LNStudents VALUES('S01','王建平','男',20,'D01')
INSERT INTO LNStudents VALUES('S02','刘华','男',18,'D02')
INSERT INTO LNStudents VALUES('S03','范林军','男',29,'D03')
INSERT INTO LNStudents VALUES('S04','李伟','男',21,'D04')
INSERT INTO LNStudents VALUES('S05','黄河','男',22,'D05')
INSERT INTO LNStudents VALUES('S06','长江','男',22,'D01')


INSERT INTO LNCourses VALUES('C01','英语',NULL,4)
INSERT INTO LNCourses VALUES('C02','数据结构','C05',2)
INSERT INTO LNCourses VALUES('C03','数据库','C02',2)
INSERT INTO LNCourses VALUES('C04','DB_设计','C03',3)
INSERT INTO LNCourses VALUES('C05','C++',NULL,3)
INSERT INTO LNCourses VALUES('C06','网络原理','C07',3)
INSERT INTO LNCourses VALUES('C07','操作系统','C05',3)


INSERT INTO LNReports VALUES('S01','C01',92)
INSERT INTO LNReports VALUES('S01','C03',84)
INSERT INTO LNReports VALUES('S02','C01',90)
INSERT INTO LNReports VALUES('S02','C02',94)
INSERT INTO LNReports VALUES('S02','C03',82)
INSERT INTO LNReports VALUES('S03','C01',72)
INSERT INTO LNReports VALUES('S03','C02',90)
INSERT INTO LNReports VALUES('S03','C03',75)


/*****************************************************************************************/


/**************************************chapter1 课后习题************************************/

/*1.3 SQL语句建立如下下4表*/

/*供应商表 LNS（供应商代码，供应商名，供应状态，供应商所在城市）*/
CREATE TABLE LNS
(
	SNO CHAR(4),
	Sname NCHAR(10),
	Sstatus CHAR(10),
	City NCHAR(20)
)

/*零件表 LNP（零件代码，零件名，颜色，重量）*/
CREATE TABLE LNP
(
	Pno CHAR(4),
	Pname NCHAR(20),
	Color CHAR(4),
	Weight INT
)

/*工程项目表 LNJ（工程项目代码，工程项目名，工程项目所在城市）*/
CREATE TABLE LNJ
(
	Jno CHAR(4),
	Jname NCHAR(20),
	City NCHAR(20)
)

/*零件供应情况表 LNSPJ（供应商代码，零件代码，工程项目代码，供应数量）*/
CREATE TABLE LNSPJ
(
	SNO CHAR(4),
	Pno CHAR(4),
	Jno CHAR(4),
	Qty INT
)

/*1.3 插入表数据*/

/*LNS*/
INSERT INTO LNS VALUES('S1','利群','30','广州')
INSERT INTO LNS VALUES('S2','同方','20','杭州')
INSERT INTO LNS VALUES('S3','天远','60','北京')
INSERT INTO LNS VALUES('S4','精诚','10','上海')
INSERT INTO LNS VALUES('S5','华缘','80','重庆')
INSERT INTO LNS VALUES('S6','弘治','50','太原')

/*LNP*/
INSERT INTO LNP VALUES('P1','钉子','绿',34)
INSERT INTO LNP VALUES('P2','螺丝','蓝',25)
INSERT INTO LNP VALUES('P3','螺母','橙',12)
INSERT INTO LNP VALUES('P4','螺栓','紫',27)
INSERT INTO LNP VALUES('P5','螺钉','红',53)
INSERT INTO LNP VALUES('P6','齿轮','绿',17)
INSERT INTO LNP VALUES('P7','传送带','红',28)

/*LNJ*/
INSERT INTO LNJ VALUES('J1','一建','济南')
INSERT INTO LNJ VALUES('J2','三汽','广州')
INSERT INTO LNJ VALUES('J3','拉链厂','杭州')
INSERT INTO LNJ VALUES('J4','无线电厂','北京')
INSERT INTO LNJ VALUES('J5','机床厂','上海')
INSERT INTO LNJ VALUES('J6','螺钉厂','重庆')
INSERT INTO LNJ VALUES('J7','机械厂','天津')

/*LNSPJ*/
INSERT INTO LNSPJ VALUES('S1','P1','J3',340)
INSERT INTO LNSPJ VALUES('S1','P1','J2',250)
INSERT INTO LNSPJ VALUES('S1','P2','J5',120)
INSERT INTO LNSPJ VALUES('S1','P2','J6',270)
INSERT INTO LNSPJ VALUES('S1','P2','J7',530)
INSERT INTO LNSPJ VALUES('S2','P2','J1',170)
INSERT INTO LNSPJ VALUES('S5','P3','J2',280)
INSERT INTO LNSPJ VALUES('S2','P4','J3',100)
INSERT INTO LNSPJ VALUES('S2','P4','J4',120)
INSERT INTO LNSPJ VALUES('S2','P5','J7',310)
INSERT INTO LNSPJ VALUES('S2','P5','J5',560)
INSERT INTO LNSPJ VALUES('S2','P6','J6',200)
INSERT INTO LNSPJ VALUES('S3','P7','J1',300)
INSERT INTO LNSPJ VALUES('S3','P1','J1',400)
INSERT INTO LNSPJ VALUES('S4','P3','J2',410)
INSERT INTO LNSPJ VALUES('S4','P4','J3',330)
INSERT INTO LNSPJ VALUES('S4','P4','J4',650)
INSERT INTO LNSPJ VALUES('S4','P5','J4',150)
INSERT INTO LNSPJ VALUES('S5','P7','J5',230)
INSERT INTO LNSPJ VALUES('S5','P7','J7',280)
INSERT INTO LNSPJ VALUES('S6','P2','J2',350)
INSERT INTO LNSPJ VALUES('S6','P2','J3',420)
INSERT INTO LNSPJ VALUES('S6','P6','J1',310)

SELECT * FROM lnp
/*DROP TABLE LNP*/


/*1.4 根据 1.3 中的4表 完成以下SQL查询*/

/*（1）找出供应工程J1零件的供应商号*/
SELECT SNO 
FROM LNSPJ
WHERE JNO = 'J1'

/*(2)找出供应工程j1零件P1的供应商号*/
SELECT SNO 
FROM LNSPJ
WHERE JNO = 'J1'
AND PNO = 'P1'

/*(3)找出供应工程j1红色零件的供应商号*/
SELECT SNO 
FROM LNSPJ,LNP
WHERE LNSPJ.Pno = LNP.Pno
AND JNO = 'J1'
AND Color = '红'

/*(4)找出没有使用杭州供应商生产的绿色零件的工程号*/
SELECT JNO
FROM LNJ
WHERE NOT EXISTS
				(
					SELECT *
					FROM LNS,LNSPJ,LNP
					WHERE LNSPJ.JNO = LNJ.JNO	/*相关子查询*/
					AND LNS.SNO = LNSPJ.SNO
					AND LNP.PNO = LNSPJ.Pno
					AND LNS.City = '杭州'
					AND LNP.Color = '绿'
				)


/*(5)找出同供应商s1在同一城市的供应商所提供的所有零件*/
SELECT PNAME
FROM LNP,LNSPJ
WHERE LNP.PNO = LNSPJ.PNO
AND LNSPJ.SNO IN
					(
						SELECT SNO
						FROM LNS
						WHERE CITY =
							 (
								SELECT CITY
								FROM LNS
								WHERE SNAME = 'S1'
							 )
					)



/*(6)找出供应红色的p1零件且其供应量大于200的供应商号*/

SELECT SNO
FROM LNSPJ
WHERE PNO IN
			(
				SELECT PNO
				FROM LNP
				WHERE Pno = 'P1'
				AND COLOR = '红'
			)
AND Qty >200




/*1.5 针对1.3 中的4个表，用SQL语言完成以下各项操作*/

/*（1）找出所有供应商的名字和所在城市*/
SELECT SNAME,CITY
FROM LNS


/*（2）找出所有零件的名称、颜色、重量*/
SELECT PNAME,COLOR,WEIGHT
FROM LNP


/*（3）找出供应商s2所供应零件的工程号*/
SELECT JNO
FROM LNSPJ
WHERE SNO = 'S2'


/*（4）找出工程项目j3使用的各种零件的名称及其数量*/
SELECT PNAME,QTY
FROM LNSPJ,LNP
WHERE LNSPJ.PNO = LNP.PNO
AND JNO = 'J3'


/*（5）找出杭州厂商供应的零件号码*/
SELECT DISTINCT PNO
FROM LNSPJ
WHERE SNO IN 
				(
					SELECT SNO
					FROM LNS
					WHERE CITY = '杭州'
				)
				

/*（6）找出使用杭州生产的零件的工程名称*/
SELECT JNAME
FROM LNJ
WHERE JNO IN (
				SELECT JNO
				FROM LNSPJ
				WHERE SNO IN(
								SELECT SNO
								FROM LNS
								WHERE CITY = '杭州'
						
							)

			 )

/*或者*/
SELECT JNAME
FROM LNJ,LNSPJ,LNS
WHERE LNJ.JNO = LNSPJ.JNO
AND LNSPJ.SNO = LNS.SNO
AND LNS.City = '杭州'