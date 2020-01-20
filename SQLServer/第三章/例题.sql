
/************************ �������鱾���� ****************************************/



/* �������ݿ� Ĭ���߼����ƣ��ļ��飬�Զ�������·��*/
CREATE DATABASE DBName

/* ��3-1 �������ݿ⣬

�߼����ƣ�Test_Data
�����ļ�����ڣ�E�̸�Ŀ¼��
�ļ�����Test_Data.mdf
�����ļ��ĳ�ʼ�洢�ռ��СΪ��10MB
���洢�ռ�Ϊ��500MB
�洢�ռ��Զ�������Ϊ��10MB

��־�ļ����߼�����Ϊ��Test_Log
��־�ļ��������ڣ�E�̸�Ŀ¼��
�ļ���Ϊ��Test_Data.ldf
��ʼ�洢�ռ�Ϊ��5MB
���洢�ռ�Ϊ��500MB
�洢�ռ��Զ�������Ϊ��5MB
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


/* �޸����ݿ� */

/*��3-2 �޸�Test���ݿ��е�Test_Data���ݷ�ʽΪһ������20MB*/
ALTER DATABASE Test
MODIFY FILE
(
	NAME=Test_Data,
	FILEGROWTH=20
)

/*��3-3 ���һ����Ҫ�����ļ���
�߼�����ΪTest_Datanew��
�����E�̸�Ŀ¼�£�
�ļ���ΪTest_Datanew.ndf
�����ļ���ʼ��СΪ100MB
�������Ϊ200MB
�ļ��Զ���������Ϊ10MB
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

/*��3-4 ��Test���ݿ���ɾ����3-3�����ӵĴ�Ҫ�ļ�*/
ALTER DATABASE Test
REMOVE FILE Test_Datanew
/**********************************************************************************/



/*ɾ���û����ݿ�****************************************************************/
/*��3-5 ɾ�����ݿ�Test*/
DROP DATABASE Test
/******************************************************************************/


/*3.3.7 �鿴������Ϣ************************************************************/

/*��ϵͳ�洢������ʾ���ݿ�ṹ*/
EXEC Sp_helpdb DatabasePrincipleDB

/*��ϵͳ�洢������ʾ�ļ���Ϣ*/
EXEC Sp_helpfile Teacher

/*��ϵͳ�洢������ʾ�ļ�����Ϣ*/
USE DatabasePrincipleDB
EXEC Sp_helpfilegroup 

/*******************************************************************************/

/* ��3-6 ����ѧ����ϵ�� S */

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

/* ɾ���� drop table S */

select * from SC



/* �����γ̹�ϵ�� C */

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


/* ������ʦ��ϵ�� T */

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

/* �����ڿι�ϵ�� TC */
CREATE TABLE [dbo].[TC](
	[TNO] [nchar](10) NOT NULL,
	[CNO] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TC_1] PRIMARY KEY CLUSTERED 
(
	[TNO] ASC,
	[CNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/* ����ѡ�ι�ϵ�� SC */
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


/*��������*/
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES ('C1', N'�������', 60)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C2        ', N'΢��ԭ��', 80)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C3        ', N'�����߼�', 60)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C4        ', N'���ݽṹ', 80)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C5        ', N'���ݿ�', 60)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C6        ', N'����ԭ��', 60)
INSERT [dbo].[C] ([CNO], [CN], [CT]) VALUES (N'C7        ', N'����ϵͳ', 61)
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S1        ', N'����', N'Ů ', 17, N'�����')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S2        ', N'Ǯ��', N'�� ', 18, N'��Ϣ')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S3        ', N'��ɺ', N'Ů ', 20, N'��Ϣ')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S4        ', N'��˼', N'�� ', 21, N'�Զ���')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S5        ', N'����', N'�� ', 19, N'�����')
INSERT [dbo].[S] ([SNo], [SN], [Sex], [Age], [Dept]) VALUES (N'S6        ', N'����', N'Ů ', 20, N'�Զ���')
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
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T1        ', N'����', N'�� ', 47, N'����        ', CAST(1500.00 AS Numeric(18, 2)), CAST(3000.00 AS Numeric(18, 2)), N'�����                 ')
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T2        ', N'��ƽ', N'Ů ', 28, N'��ʦ        ', CAST(800.00 AS Numeric(18, 2)), CAST(1200.00 AS Numeric(18, 2)), N'��Ϣ                  ')
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T3        ', N'��ΰ', N'�� ', 30, N'��ʦ        ', CAST(900.00 AS Numeric(18, 2)), CAST(1200.00 AS Numeric(18, 2)), N'�����                 ')
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T4        ', N'��ѩ', N'Ů ', 51, N'����        ', CAST(1600.00 AS Numeric(18, 2)), CAST(3000.00 AS Numeric(18, 2)), N'�Զ���                 ')
INSERT [dbo].[T] ([TNO], [TN], [Sex], [Age], [Prof], [Sal], [Comm], [Dept]) VALUES (N'T5        ', N'����', N'Ů ', 39, N'������       ', CAST(1300.00 AS Numeric(18, 2)), CAST(2000.00 AS Numeric(18, 2)), N'��Ϣ                  ')
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
/*����ͳ�������*/

/*��3-7 ����һ��S��,��SNO�ֶν���NOT NULL Լ��*/
CREATE TABLE S
(
	SNO VARCHAR(6) CONSTRAINT S_CONS NOT NULL,
	SN NVARCHAR(10),
	Sex NCHAR(1),
	Age INT,
	Dept NVARCHAR(20)
)

/*�ֶκ��治��Լ�����ƣ�ֱ��дԼ������*/
CREATE TABLE S
(
	SNO VARCHAR(6)  NOT NULL,
	SN NVARCHAR(10),
	Sex NCHAR(1),
	Age INT,
	Dept NVARCHAR(20)
)

/*��3-8 ��Լ�� ����һ��S������SNΪΨһ��*/
CREATE TABLE S
(
	SNO VARCHAR(6)NOT NULL,
	SN NVARCHAR(10) CONSTRAINT SN_UNIQ UNIQUE,
	Sex NCHAR(1),
	Age INT,
	Dept NVARCHAR(20)
)

/*��3-9 ��Լ�� ����һ��S������SN+Sex ΪΨһ������Լ��Ϊ��Լ��*/
CREATE TABLE S
(
	SNO VARCHAR(6),
	SN NVARCHAR(10) UNIQUE,
	Sex NCHAR(1),
	Age	INT,
	Dept NVARCHAR(20),
	CONSTRAINT S_UNIQ UNIQUE(SN,Sex)/*ϵͳΪSN+Sex ����Ψһ������ȷ��ͬһ�Ա��ѧ��û������*/
)

/*��3-10 ��Լ�� ����һ��S������SNoΪS������*/
CREATE TABLE S
(
	SNO VARCHAR(6) NOT NULL CONSTRAINT S_prim PRIMARY KEY,
	SN NVARCHAR(10) UNIQUE,
	Sex NCHAR(1),
	Age	INT,
	Dept NVARCHAR(20)
)

/*��3-11 ��Լ�� ����һ��SC������SNo+CNoΪSC������*/
CREATE TABLE SC
(
	SNO VARCHAR(6) NOT NULL,
	CNo VARCHAR(6) NOT NULL,
	Score NUMERIC(4,1),
	CONSTRAINT SC_Prim PRIMARY KEY(SNo,CNo)
)

/*��3-12 ��Լ�� ����һ��SC������SNo+CNoΪSC���ⲿ��*/
CREATE TABLE SC
(
	SNo NCHAR(6) NOT NULL CONSTRAINT S_Fore FOREIGN KEY REFERENCES S(SNo),
	CNo NCHAR(6) NOT NULL CONSTRAINT C_Fore FOREIGN KEY REFERENCES C(CNo),
	Score NUMERIC(4,1),
	CONSTRAINT SC_Prim PRIMARY KEY(SNo,CNo)
)

/*��3-13  ����һ��SC������Score �ķ���ȡֵ��ΧΪ 0-100֮��*/
CREATE TABLE SC
(
	SNo	VARCHAR(6) ,
	CNo VARCHAR(6) ,
	Score NUMERIC(4,1) CONSTRAINT Score_Chk CHECK(Score>=0 AND Score<=100),
	
)


/*��3-14 ����һ�����������Զ����ѧ����S��*/
CREATE TABLE S
(
	SNo VARCHAR(6) CONSTRAINT S_Prim PRIMARY KEY,
	SN VARCHAR(6) NOT NULL,
	Sex NCHAR(1) NOT NULL DEFAULT '��',
	Age INT NOT NULL CHECK(Age BETWEEN 15 AND 50),
	Dept NVARCHAR(20) NOT NULL
)


/*�޸����ݱ�*/

/*��3-15 ��S��������һ������к�סַ��*/
ALTER TABLE S
ADD
Class_No VARCHAR(6),
Stu_address NVARCHAR(20) /*�����Զ����nullֵ������Ϊ���ӵ�����ָ�� NOT NULL Լ�� */

/*��3-16 ��SC��������������Լ����ʹScore ��0-100 ֮��*/
ALTER TABLE SC
ADD
CONSTRAINT S_FORE CHECK(Score BETWEEN 0 AND 100)

/*��3-17 ��S���е�SN�мӿ�12���ַ�*/
ALTER TABLE S
ALTER COLUMN
SN NVARCHAR(12)

/*DROP �ķ�ʽ ֻ����ɾ��������Լ������*/
/*��3-18 ɾ��S���е�����*/
ALTER TABLE S
DROP CONSTRAINT S_Prim

/*��3-19 ɾ����S  (ֻ��ɾ���Լ������ı�����ɾ�������û��������ı�)*/
DROP TABLE S




/*********************������ݲ�ѯ********************/

/*��3-20 ��ѯȫ��ѧ����ѧ�š�����������*/
USE DatabasePrincipleDB

SELECT SNo,SN,Age
FROM S


/*��3-21 ��ѯȫ��ѧ����Ϣ*/
SELECT *
FROM S


/*3-22 ��ѯѡ���˿γ̵�ѧ����ѧ��*/
SELECT DISTINCT SNo /*DISTINCT �ؼ��� ȥ������е��ظ���*/
FROM SC



/*3-23 ��ѯȫ��ѧ����������ѧ�š�������*/
SELECT SN,SNo,Age
FROM S

/*����*/
SELECT SN AS NAME,SNo,Age	/*AS ����ʡ��*/
FROM S


/*3-24 ��ѯѡ�޿γ̺�ΪC1��ѧ����ѧ�źͳɼ�*/
SELECT SNo,Score	/*�˲�ѯ������ϵ�����е�ѡȡ���������ͬ*/
FROM SC
WHERE CNo = 'C1'


/*3-25 ��ѯ�ɼ�����85�ֵ�ѧ����ѧ�š��γ̺źͳɼ�*/
SELECT SNo,CNo,Score
FROM SC
WHERE Score>85



/*��������ѯ	�߼���������ȼ���NOT��AND��OR������ʹ�������޸����ȼ�*/
/*3-26 ��ѯѡ��C1��C2�ҷ������ڵ���85��ѧ����ѧ�š��γ̺źͳɼ�*/
SELECT SNo,CNo,Score
FROM SC
WHERE (CNo='C1' OR CNo='C2') AND (Score>=85)


/*3-27 ��ѯ������1000Ԫ-1500Ԫ֮��Ľ�ʦ�Ľ�ʦ�š�������ְ��*/
SELECT TNo,TN,Prof
FROM T
WHERE Sal BETWEEN 1000 AND 1500	/*SQL SERVER ��between and �����Ⱥţ�����ЩDBMS���򲻰����Ⱥ�*/

/*�ȼ��ڣ�*/
SELECT TNo,TN,Prof
FROM T
WHERE Sal>=1000 AND Sal<=1500


/*3-28 ��ѯ���ʲ���100Ԫ-1500Ԫ֮��Ľ�ʦ�Ľ�ʦ�š�������ְ��*/
SELECT TNo,TN,Prof
FROM T
WHERE Sal NOT BETWEEN 1000 AND 1500




/*3-29 ��ѯѡ��C1��C2��ѧ����ѧ�š��γ̺š��ɼ�*/
SELECT SNo,CNo,Score
FROM SC
WHERE CNo IN ('C1','C2')

/*Ҳ������ OR ��ʵ��*/
SELECT SNo,CNo,Score
FROM SC
WHERE CNo='C1' OR CNo='C2'


/*3-30 ��ѯû��ѡ��C1��Ҳû��ѡ��C2��ѧ����ѧ�š��γ̺š��ɼ�*/
SELECT SNo,CNo,Score
FROM SC
WHERE CNo NOT IN ('C1','C2')

/*�ȼ���*/
SELECT SNo,CNo,Score
FROM SC
WHERE (CNo<>'C1') AND (CNo<>'C2')



/*5.����ƥ���ѯ*/
/*3-31 ��ѯ�������ŵĽ�ʦ�Ľ�ʦ�ź�����*/
SELECT TNo,TN
FROM T
WHERE TN LIKE '��%'


/*3-21 ��ѯ�����еڶ������ǡ�������ʦ�Ľ�ʦ�ź�����*/
SELECT TNo,TN
FROM T
WHERE TN LIKE '_��%'


/*6.��ֵ��ѯ*/
/*3-22 ��ѯû�п��Գɼ���ѧ����ѧ�ź���Ӧ�Ŀγ̺�*/
SELECT SNo,CNo,Score
FROM SC
WHERE Score IS NULL



/*�⺯��ͳ�ƻ��ܲ�ѯ,ʹ�ÿ⺯����ѯ��ͨ��Ҫ����ѯ��ÿһ�����ݼӱ��������򽫲���ʾ������*/
/*
	AVG:���м���ƽ��ֵ��ֻ�ܶ���ֵ���ֶν��м��㣩
	SUM:���м���ֵ���ܺͣ�ֻ�ܶ���ֵ���ֶν��м��㣩
	MAX:��һ���е����ֵ
	MIN:��һ���е���Сֵ
	COUNT:����ͳ�Ƹ���
*/

/*3-34 ��ѧ��ΪS1��ѧ�����ֺܷ�ƽ����*/
SELECT SUM(Score) AS SCORE_SUM,AVG(Score) AS SCORE_AVG
FROM SC
WHERE SNo = 'S1'


/*3-35 ��ѡ��C1�ſγ̵���߷֣���ͷּ�֮��Ĳ�ķ���*/
SELECT MAX(Score) AS MAX_SCORE,MIN(Score) AS MIN_SCORE,MAX(Score)-MIN(Score) AS DIFF_SCORE
FROM SC
WHERE CNo = 'C1'


/*3-36 ������ϵѧ��������*/
SELECT COUNT(*) AS DEPT_CUP 
FROM S
WHERE Dept = '�����'

SELECT COUNT(SNo) AS DEPT_CUP 
FROM S
WHERE Dept = '�����'


/*3-37 ��ѧУ�й��ж��ٸ�ϵ*/
SELECT  COUNT(DISTINCT Dept) AS DEPT_TOTAL /*DISTINCT �ؼ���Ҫ���� count�����������棬count�����Կ�ֵ�����㣬����0���м���*/
FROM S


/*3-38 ͳ���гɼ�ͬѧ������*/
SELECT COUNT(Score)	/*�ɼ�Ϊ0��Ҳ�������ڣ��ɼ�Ϊ�յĲ�����*/
FROM SC


/*3-39 �������⺯��Count��*��������ϵѧ��������*/
SELECT COUNT(*) AS CUPDEPT_NUM	/*COUNT(*)����ͳ��Ԫ��ĸ������������ظ��У�������ʹ�� DISTINCT �ؼ���*/
FROM S
WHERE Dept = '�����'



/*�����ѯ*/
/*3-40 ��ѯÿ����ʦ�Ľ�ʦ�ż����οε�����*/
SELECT TNo,COUNT(*)AS �οε�����
FROM TC
GROUP BY TNo

/*3-41 ��ѯѡ���������ϣ������ţ��γ̵�ѧ����ѧ�ź�ѡ������*/
SELECT SNo,COUNT(*) ѡ������
FROM SC
GROUP BY SNo
HAVING (COUNT(*)>=2)


/*��ѯ���������*/
/*3-42 ��ѯѡ��C1��ѧ��ѧ�źͳɼ��������ɼ���������*/
SELECT SNo,Score
FROM SC
WHERE CNo = 'C1'
ORDER BY Score DESC

/*3-43 ��ѯѡ��C2��C3��C4����C5�γ̵�ѧ�š��γ̺źͳɼ�����ѯ�����ѧ���������У�ѧ����ͬ�ٰ��ɼ���������*/
SELECT SNo,CNo,Score
FROM SC
WHERE CNo IN ('C2','C3','C4','C5')
ORDER BY SNo ASC, Score DESC




/*���ϵ������Ӳ�ѯ*/
/*�����Ӳ�ѯ*/
/*3-44 ��ѯ��ΰ��ʦ�����ڵĿγ̣�Ҫ���г���ʦ�š���ʦ�����Ϳγ̺�*/
SELECT T.TNo,TN,CNo
FROM T,TC
WHERE T.TNo = TC.TNo
AND TN = '��ΰ'

/*JOIN ON �ؼ���*/
SELECT T.TNo,TN,CNo
FROM T INNER JOIN TC
ON T.TNo = TC.TNo
WHERE TN = '��ΰ'

/*����3*/
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
			WHERE TN = '��ΰ'
		  )AS R2
ON R1.TNO=R2.TNO

/*3-45 ��ѯ����ѡ��ѧ����ѧ�š�������ѡ�γɼ����ɼ�*/
SELECT SC.SNO,SN,CN,SCORE
FROM S,SC,C
WHERE S.SNO = SC.SNO
AND SC.CNO = C.CNO

/*3-46��ѯÿ�ſγ̵Ŀγ̺š��γ�����ѡ������*/
SELECT SC.CNO,CN,COUNT(SC.SNO) AS ѡ������
FROM C,SC
WHERE SC.CNO = C.CNO
GROUP BY SC.CNO,CN
/********************************************************************************/



/*3.6.3 �����Ӳ�ѯ��bit���͵��У���������nullֵ����˻ᱻ����0���ٷ��ص������..............................................................................*/

/*3-47 ��ѯ����ѧ����ѧ�ţ�������ѡ�����Ƽ��ɼ���û��ѡ�ε�ͬѧ��ѡ����Ϣ��ʾΪ�գ�*/
SELECT S.SNO,SN,CN,SCORE
FROM S
LEFT OUTER JOIN SC
ON S.SNO = SC.SNO
LEFT OUTER JOIN C
ON SC.CNO = C.CNO

/*3.6.4 �����ѯ,�ѿ�����*/

/*3-48 ��ѧ����s�Ϳγ̱�c���н����ѯ*/
SELECT *
FROM S
CROSS JOIN C

/*3.6.5 �����Ӳ�ѯ*/
/*3-49 ��ѯ���бȡ���ΰ�����ʸߵĽ�ʦ�����������ʡ�����ΰ�Ĺ���*/
SELECT T2.TN,T2.SAL,T1.SAL AS ��ΰ�Ĺ���
FROM T AS T1,T AS T2
WHERE T2.SAL > (SELECT SAL
				FROM T
				WHERE T.TN = '��ΰ'
				)
AND T1.TN = '��ΰ'

/*����*/
SELECT T2.TN,T2.SAL,T1.SAL AS ��ΰ�Ĺ���
FROM T AS T1,T AS T2
WHERE T2.SAL > T1.SAL
AND T1.TN = '��ΰ'

/*����*/
SELECT T2.TN,T2.SAL,T1.SAL AS ��ΰ�Ĺ���
FROM T AS T1
INNER JOIN T AS T2
ON T2.SAL > T1.SAL
AND T1.TN = '��ΰ'

SELECT T2.TN,T2.SAL,T1.SAL AS ��ΰ�Ĺ���
FROM T AS T1
INNER JOIN T AS T2
ON T2.SAL > T1.SAL
WHERE T1.TN = '��ΰ'


/*3-50 ��������ѧ���������������ѡ������*/
SELECT SN,AGE,CN
FROM S,SC,C
WHERE S.SNO = SC.SNO
AND SC.CNO = C.CNO


/*3.7.1 ��ͨ�Ӳ�ѯ,��ִ���Ӳ�ѯ������ѯ���õ��Ӳ�ѯ�Ľ��*/
/*3-51 ������һ��ֵ����ѯ����ΰ��ʦְ����ͬ�Ľ�ʦ�š�����*/
SELECT TNO,TN
FROM T
WHERE PROF = 
	(
		SELECT PROF
		FROM T
		WHERE T.TN = '��ΰ'  
	)


/*3-52 ������һ��ֵ����ѯ���ڿγ̺�ΪC5�Ľ�ʦ����*/
SELECT TN
FROM T
WHERE T.TNO IN
				(
					SELECT TNO
					FROM TC
					WHERE CNO = 'C5'
				)

/*������any ��ʾ����һ��*/
SELECT TN
FROM T
WHERE T.TNO = ANY
				(
					SELECT TNO
					FROM TC
					WHERE CNO = 'C5'
				)

/*���Ӳ�ѯʵ��*/
SELECT TN
FROM T,TC
WHERE T.TNO = TC.TNO
AND CNO = 'C5'


/*3-53 ��ѯ����ϵ�бȼ����ϵĳһ��ʦ���ʸߵĽ�ʦ�������͹���*/
SELECT TN,SAL
FROM T 
WHERE T.SAL > 
				(
					SELECT MIN(SAL)
					FROM T
					WHERE T.DEPT = '�����'
				)
AND T.DEPT <> '�����'

/*������any*/
SELECT TN,SAL
FROM T 
WHERE T.SAL > ANY
				(
					SELECT SAL
					FROM T
					WHERE T.DEPT = '�����'
				)
AND T.DEPT <> '�����'


/*3-55 ��ѯ����ϵ�бȼ����ϵ�����н�ʦ�Ĺ��ʶ��ߵĽ�ʦ�������͹���*/
SELECT TN,SAL
FROM T
WHERE SAL > ALL
		(
			SELECT SAL
			FROM T
			WHERE T.DEPT = '�����'
		)
AND T.DEPT <> '�����'

/*������max*/
SELECT TN,SAL
FROM T
WHERE SAL > 
		(
			SELECT MAX(SAL)
			FROM T
			WHERE T.DEPT = '�����'
		)
AND T.DEPT <> '�����'



/*3.7.2 ����Ӳ�ѯ �Ӳ�ѯ��������Ҫ���ø����ѯ���е�����ֵ
		����Ӳ�ѯ��ִ�д����ɸ���ѯ�����������
		ִ��˳��
					1.ѡȡ����ѯ���е�һ�м�¼���ڲ��Ӳ�ѯ���ô������ȹص���Ϥֵ���в�ѯ
					2.����ѯ�����Ӳ�ѯ���صĽ���жϴ����Ƿ������ѯ����
					3.�����㣬��Ѹ��з��븸��ѯ������У��ظ�ִ�й��̣�ֱ�������길��ѯ���е�ÿһ������
*/


/*3-56 ��ѯ�����ڿγ̺�Ϊc5�Ľ�ʦ����*/
SELECT TN
FROM T
WHERE 'C5'<>ALL
		(
			SELECT CNO
			FROM TC
			WHERE TNO = T.TNO
		)

/*�������� ��������в�����c5��Ԫ��*/
SELECT TN
FROM T
WHERE 'C5'NOT IN
		(
			SELECT CNO
			FROM TC
			WHERE TNO = T.TNO
		)


/*3-57 �ú���exists ����������3-52 �Ĳ�ѯ������ѯ���ڿγ̺�Ϊc5�Ľ�ʦ����*/
SELECT TN
FROM T
WHERE EXISTS
			(
				SELECT *
				FROM TC
				WHERE TNO = T.TNO
				AND CNO = 'C5'
			)

/*3-58 ��ѯû�н��ڿγ̺�ΪC5 �Ľ�ʦ������*/
SELECT TN
FROM T
WHERE NOT EXISTS 
				(
					SELECT *
					FROM TC
					WHERE T.TNO = TC.TNO
					AND CNO = 'C5'
				)


/*3-59 ��ѯѡ�������пγ̵�ѧ��������*/
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



/*���������ѯ*/
/*3-60 ��sc���ݱ��в�ѯ��ѧ��Ϊs1ͬѧ��ѧ�ź��ܷ֣�
	   �ٴ�sc���ݱ��в�ѯ��ѧ��Ϊs5ͬѧѧ�ź��ܷ�
	   Ȼ��������ѯ����ϳ�һ�������
*/

SELECT SNO AS ѧ��,SUM(SCORE) AS TOTALSCORE
FROM SC
WHERE SNO = 'S1'
GROUP BY SNO
UNION
SELECT SNO AS ѧ��,SUM(SCORE) AS TOTALSCORE
FROM SC
WHERE SNO = 'S4'
GROUP BY SNO


/*��������Ҳһ��*/
SELECT SNO AS ѧ��,SUM(SCORE) AS TOTALSCORE
FROM SC
WHERE SNO = 'S1' OR SNO = 'S4'
GROUP BY SNO



/*�洢��ѯ���������*/
/*3-61 ��sc�в�ѯ������ͬѧ��ѧ�ź��ܷ֣�������ѯ�����ŵ�һ���µ����ݱ�Cal_Table��*/
SELECT SNO AS ѧ��,SUM(SCORE) AS TOTALSCORE
INTO Cal_Table
FROM SC
GROUP BY SNO

SELECT * FROM Cal_Table



/*3.9.1 ������ݱ��е�����
		�����ö��Ÿ������ݣ��ַ��������õ�����������
		into �Ӿ���û��ָ��������������ӵļ�¼������ÿ���������Ͼ���ֵ��
		��values�Ӿ���ָ����������Ҫ�ͱ��и������е�����һ��
*/

/*3-62 ��s�������һ��ѧ����¼��ѧ��s7��������֣�����Ա�Ů�����䣺21��ϵ�𣺼������*/
INSERT INTO S (SNO,SN,AGE,SEX,DEPT)
VALUES ('S7','֣��',21,'Ů','�����')

/*3-63 ��sc�������һ��ѡ�μ�¼����S7������C1����*/
INSERT INTO SC (SNO,CNO)
VALUES ('S7','C1')


/*3-64 �����ϵ��ʦ��ƽ�����ʣ��ѽ�������±�AvgSal��*/

/*���ȣ������±�AvgSal���������ϵ���͸�ϵ��ƽ������*/
CREATE TABLE AvgSal
(
	Department VARCHAR(20),
	AvgSal SMALLINT
)

/*Ȼ�������Ӳ�ѯ���t���и�ϵ��ƽ�����ʣ��ѽ��������±���*/
INSERT INTO AvgSal
SELECT DEPT,AVG(SAL)
FROM T
GROUP BY DEPT

SELECT * FROM AvgSal


/*3.9.2 �޸ı��е�����*/

/*3-65 �޸�һ�У�����ΰ��ʦת����Ϣϵ*/
UPDATE T
SET DEPT = '��Ϣ'
WHERE TN = '��ΰ'


/*3-66 �޸Ķ��� ������ѧ������������1��*/
UPDATE S
SET AGE=AGE+1

/*3-67 �ѽ�ʦ���й���С�ڻ����1000Ԫ�Ľ�ʦ�Ĺ������20%*/
UPDATE T
SET SAL = 1.2*SAL
WHERE (PROF = '��ʦ') AND (SAL<=1000)



/*3-68 ���Ӳ�ѯѡ��Ҫ�޸ĵ��� �ѽ���c5�γ̵Ľ�ʦ�ĸ�λ��������100Ԫ*/
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
		)	/*�Ӳ�ѯ�������ǵõ����н���c5�γ̵Ľ�ʦ��*/


/*3-69 ���Ӳ�ѯ�ṩҪ�޸ĵ�ֵ �����н�ʦ�Ĺ�����ߵ�ƽ�����ʵ�1.2��*/
UPDATE T
SET SAL = 
			(
				SELECT 1.2 * AVG(SAL)
				FROM T
			)	/*�Ӳ�ѯ�������ǵõ����н�ʦ��ƽ�����ʵ�1.2��*/



/*3.9.3 ɾ������*/
/*3-70 ɾ��һ�м�¼ ɾ����ΰ��ʦ�ļ�¼*/
DELETE 
FROM T
WHERE TN = '��ΰ'



/*3-71 ɾ�����м�¼ ɾ�����н�ʦ���ڿμ�¼*/
DELETE 
FROM TC	/*ִ�д�����tcΪ�ձ����䶨���Դ��������ֵ���*/


/*3-72 �����Ӳ�ѯѡ��Ҫɾ������ ɾ����ΰ��ʦ���ڿμ�¼*/
DELETE 
FROM TC
WHERE TNO =
		(
			SELECT TNO
			FROM T
			WHERE TN = '��ΰ'
		)







/*3.10 ��ͼ*/

/*3-73 ����һ�������ϵ��ʦ�������ͼ
		��ͼ��������������䣬����go֮��
*/
GO
CREATE VIEW SUB_T
AS SELECT TNO,TN,PROF
FROM T
WHERE DEPT = '�����'
GO
SELECT * FROM SUB_T


/*3-74 ����һ��ѧ���������ͼ����������ѧ�ſγ������ɼ���*/
GO
CREATE VIEW S_SC_C(SNO,SN,CN,SCORE)
AS SELECT S.SNO,SN,CN,SCORE
FROM S,C,SC
WHERE S.SNO = SC.SNO 
AND SC.CNO = C.CNO
GO


/*3-75 ����һ��ѧ��ƽ���ɼ���ͼs_avg*/
GO
CREATE VIEW S_AVG(SNO,SCORE_AVG)
AS SELECT SNO,AVG(SCORE)
FROM SC
GROUP BY SNO
GO


/*3.10.2 �޸���ͼ*/
/*3-76 �޸�ѧ�������ͼS_SC_C(SN,CN,SCORE)*/
GO
ALTER VIEW S_SC_C(SN,CN,SCORE)
AS SELECT SN,CN,SCORE
FROM S,SC,C
WHERE S.SNO = SC.SNO
AND SC.CNO = C.CNO
GO



/*3.10.3 ɾ����ͼ*/
/*3-77 ɾ���������ʦ�������ͼsub_t*/
DROP VIEW SUB_T


/*3.10.4 ��ѯ��ͼ*/
/*3-78 ��ѯ��ͼsub_t ��ְ��Ϊ���ڵĽ�ʦ�ź�����*/
GO
SELECT TNO,TN
FROM SUB_T
WHERE PROF = '����'
GO


/*3.10.5 ������ͼ*/

/*3-79 ��� ��������ʦ��ͼ�����һ����¼����ʦ�ţ�t6�����������ְ�ƣ������ڣ�*/
INSERT INTO SUB_T (TNO,TN,PROF)
VALUES('T6','�','������')	/*����ʧ�ܣ����ܽ�nullֵ����dept�� 
									δָ������������Ĭ�����nullֵ
									��������not null Լ�� �����ʧ��
								*/


/*3-80 �޸� �������ϵ��ʦ��ͼsub_t ����ΰ��ְ�Ƹ�Ϊ�������ڡ�*/
UPDATE SUB_T
SET PROF = '������'
WHERE TN = '��ΰ'


/*3-81 ɾ�� ɾ�������ϵ��ʦ��ͼ sub_t ����ΰ��ʦ�ļ�¼*/
DELETE FROM SUB_T
WHERE TN = '��ΰ'



/*3.11.3 �������� */
/*3-82 Ϊsc�� ��sno �� cno �Ͻ���Ψһ����*/
CREATE UNIQUE INDEX SCI ON SC(SNO,CNO)
/*������Ϊsno��cno���еķ�������������sc���е����Ȱ�sno �ĵ���˳��������
  ������ͬ��sno���ٰ�cno�ĵ���˳������
  ����unique�����ƣ������ڣ�sno��cno������е������Ͼ���Ψһ�ԣ��������ظ�ֵ	
*/

/*3-83 Ϊ��ʦ�� t �� tn �Ͻ����ۼ�����*/
CREATE CLUSTERED INDEX TI ON T(TN)	/*T ���еľ�¹������tn��ֵ������*/


/*3.11.4 �޸�����*/


/*3.11.5 ɾ������*/
DROP INDEX �������� ON ��ǰ�������ڵı�������ͼ��



/*3.11.6 �鿴����*/
/*�� sp_helpindex �洢���̲鿴����*/
EXEC SP_HELPINDEX T


/*ʹ�� sp_rename �洢���̸�����������*/
EXEC SP_RENAME 'T.TI','T_INDEX'