/*����Depts ��SQL ����*/
CREATE TABLE LNDepts
(
	Dno CHAR(5) PRIMARY KEY,/*ϵ����*/
	Dname NCHAR(20) NOT NULL /*ϵ������*/
)
/*DROP TABLE DEPTS*/


/*���� LNStudents */
CREATE TABLE LNStudents
(
	Sno CHAR(5) PRIMARY KEY,
	Sname NCHAR(20) NOT NULL,
	Ssex NCHAR(2),
	Sage INT,
	Dno CHAR(5),			/*ϵ����*/
	CONSTRAINT FK_Dno FOREIGN KEY(Dno) REFERENCES LNDepts
)
SELECT * FROM LNStudents 
/*DROP TABLE LNStudents*/


/*���� LNCourses */
CREATE TABLE LNCourses
(
	Cno CHAR(6) PRIMARY KEY,/*�γ̺�*/
	Cname NCHAR(20),		/*�γ�����*/
	PreCno CHAR(6),			/*ѡ�޿γ̺�*/
	Credits INT				/*ѧ��*/
)


/*���� LNReports */
CREATE TABLE LNReports
(
	Sno CHAR(5),			/*ѧ��*/
	Cno CHAR(6) ,			/*�γ̺�*/
	Grade INT,				/*���Գɼ�*/
	PRIMARY KEY(Sno,Cno),
	CONSTRAINT Student_Reports FOREIGN KEY(Sno) REFERENCES LNStudents,
	CONSTRAINT Reports_Course FOREIGN KEY(Cno) REFERENCES LNCourses
)



/*****************************************************************************************/
/*************************************insert ��������**********************************/

SELECT * FROM LNReports

INSERT INTO LNDepts VALUES('D01','�Զ���')
INSERT INTO LNDepts VALUES('D02','�����')
INSERT INTO LNDepts VALUES('D03','��ѧ')
INSERT INTO LNDepts VALUES('D04','ͨ��')
INSERT INTO LNDepts VALUES('D05','����')


INSERT INTO LNStudents VALUES('S01','����ƽ','��',20,'D01')
INSERT INTO LNStudents VALUES('S02','����','��',18,'D02')
INSERT INTO LNStudents VALUES('S03','���־�','��',29,'D03')
INSERT INTO LNStudents VALUES('S04','��ΰ','��',21,'D04')
INSERT INTO LNStudents VALUES('S05','�ƺ�','��',22,'D05')
INSERT INTO LNStudents VALUES('S06','����','��',22,'D01')


INSERT INTO LNCourses VALUES('C01','Ӣ��',NULL,4)
INSERT INTO LNCourses VALUES('C02','���ݽṹ','C05',2)
INSERT INTO LNCourses VALUES('C03','���ݿ�','C02',2)
INSERT INTO LNCourses VALUES('C04','DB_���','C03',3)
INSERT INTO LNCourses VALUES('C05','C++',NULL,3)
INSERT INTO LNCourses VALUES('C06','����ԭ��','C07',3)
INSERT INTO LNCourses VALUES('C07','����ϵͳ','C05',3)


INSERT INTO LNReports VALUES('S01','C01',92)
INSERT INTO LNReports VALUES('S01','C03',84)
INSERT INTO LNReports VALUES('S02','C01',90)
INSERT INTO LNReports VALUES('S02','C02',94)
INSERT INTO LNReports VALUES('S02','C03',82)
INSERT INTO LNReports VALUES('S03','C01',72)
INSERT INTO LNReports VALUES('S03','C02',90)
INSERT INTO LNReports VALUES('S03','C03',75)


/*****************************************************************************************/


/**************************************chapter1 �κ�ϰ��************************************/

/*1.3 SQL��佨��������4��*/

/*��Ӧ�̱� LNS����Ӧ�̴��룬��Ӧ��������Ӧ״̬����Ӧ�����ڳ��У�*/
CREATE TABLE LNS
(
	SNO CHAR(4),
	Sname NCHAR(10),
	Sstatus CHAR(10),
	City NCHAR(20)
)

/*����� LNP��������룬���������ɫ��������*/
CREATE TABLE LNP
(
	Pno CHAR(4),
	Pname NCHAR(20),
	Color CHAR(4),
	Weight INT
)

/*������Ŀ�� LNJ��������Ŀ���룬������Ŀ����������Ŀ���ڳ��У�*/
CREATE TABLE LNJ
(
	Jno CHAR(4),
	Jname NCHAR(20),
	City NCHAR(20)
)

/*�����Ӧ����� LNSPJ����Ӧ�̴��룬������룬������Ŀ���룬��Ӧ������*/
CREATE TABLE LNSPJ
(
	SNO CHAR(4),
	Pno CHAR(4),
	Jno CHAR(4),
	Qty INT
)

/*1.3 ���������*/

/*LNS*/
INSERT INTO LNS VALUES('S1','��Ⱥ','30','����')
INSERT INTO LNS VALUES('S2','ͬ��','20','����')
INSERT INTO LNS VALUES('S3','��Զ','60','����')
INSERT INTO LNS VALUES('S4','����','10','�Ϻ�')
INSERT INTO LNS VALUES('S5','��Ե','80','����')
INSERT INTO LNS VALUES('S6','����','50','̫ԭ')

/*LNP*/
INSERT INTO LNP VALUES('P1','����','��',34)
INSERT INTO LNP VALUES('P2','��˿','��',25)
INSERT INTO LNP VALUES('P3','��ĸ','��',12)
INSERT INTO LNP VALUES('P4','��˨','��',27)
INSERT INTO LNP VALUES('P5','�ݶ�','��',53)
INSERT INTO LNP VALUES('P6','����','��',17)
INSERT INTO LNP VALUES('P7','���ʹ�','��',28)

/*LNJ*/
INSERT INTO LNJ VALUES('J1','һ��','����')
INSERT INTO LNJ VALUES('J2','����','����')
INSERT INTO LNJ VALUES('J3','������','����')
INSERT INTO LNJ VALUES('J4','���ߵ糧','����')
INSERT INTO LNJ VALUES('J5','������','�Ϻ�')
INSERT INTO LNJ VALUES('J6','�ݶ���','����')
INSERT INTO LNJ VALUES('J7','��е��','���')

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


/*1.4 ���� 1.3 �е�4�� �������SQL��ѯ*/

/*��1���ҳ���Ӧ����J1����Ĺ�Ӧ�̺�*/
SELECT SNO 
FROM LNSPJ
WHERE JNO = 'J1'

/*(2)�ҳ���Ӧ����j1���P1�Ĺ�Ӧ�̺�*/
SELECT SNO 
FROM LNSPJ
WHERE JNO = 'J1'
AND PNO = 'P1'

/*(3)�ҳ���Ӧ����j1��ɫ����Ĺ�Ӧ�̺�*/
SELECT SNO 
FROM LNSPJ,LNP
WHERE LNSPJ.Pno = LNP.Pno
AND JNO = 'J1'
AND Color = '��'

/*(4)�ҳ�û��ʹ�ú��ݹ�Ӧ����������ɫ����Ĺ��̺�*/
SELECT JNO
FROM LNJ
WHERE NOT EXISTS
				(
					SELECT *
					FROM LNS,LNSPJ,LNP
					WHERE LNSPJ.JNO = LNJ.JNO	/*����Ӳ�ѯ*/
					AND LNS.SNO = LNSPJ.SNO
					AND LNP.PNO = LNSPJ.Pno
					AND LNS.City = '����'
					AND LNP.Color = '��'
				)


/*(5)�ҳ�ͬ��Ӧ��s1��ͬһ���еĹ�Ӧ�����ṩ���������*/
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



/*(6)�ҳ���Ӧ��ɫ��p1������乩Ӧ������200�Ĺ�Ӧ�̺�*/

SELECT SNO
FROM LNSPJ
WHERE PNO IN
			(
				SELECT PNO
				FROM LNP
				WHERE Pno = 'P1'
				AND COLOR = '��'
			)
AND Qty >200




/*1.5 ���1.3 �е�4������SQL����������¸������*/

/*��1���ҳ����й�Ӧ�̵����ֺ����ڳ���*/
SELECT SNAME,CITY
FROM LNS


/*��2���ҳ�������������ơ���ɫ������*/
SELECT PNAME,COLOR,WEIGHT
FROM LNP


/*��3���ҳ���Ӧ��s2����Ӧ����Ĺ��̺�*/
SELECT JNO
FROM LNSPJ
WHERE SNO = 'S2'


/*��4���ҳ�������Ŀj3ʹ�õĸ�����������Ƽ�������*/
SELECT PNAME,QTY
FROM LNSPJ,LNP
WHERE LNSPJ.PNO = LNP.PNO
AND JNO = 'J3'


/*��5���ҳ����ݳ��̹�Ӧ���������*/
SELECT DISTINCT PNO
FROM LNSPJ
WHERE SNO IN 
				(
					SELECT SNO
					FROM LNS
					WHERE CITY = '����'
				)
				

/*��6���ҳ�ʹ�ú�������������Ĺ�������*/
SELECT JNAME
FROM LNJ
WHERE JNO IN (
				SELECT JNO
				FROM LNSPJ
				WHERE SNO IN(
								SELECT SNO
								FROM LNS
								WHERE CITY = '����'
						
							)

			 )

/*����*/
SELECT JNAME
FROM LNJ,LNSPJ,LNS
WHERE LNJ.JNO = LNSPJ.JNO
AND LNSPJ.SNO = LNS.SNO
AND LNS.City = '����'