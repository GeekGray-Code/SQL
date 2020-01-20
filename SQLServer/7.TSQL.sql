/*7-1 声明一个长度为8个字符的局部变量id，并将其赋值为‘10010001’*/
DECLARE @ID CHAR(8)
SELECT @ID = '10010001'


/*7-2 从数据表s中查询学号为s7的学生的学号与姓名，
	  并将查询到的学号姓名分别存储到局部变量@sno 和 @sn 中*/
DECLARE @SNO VARCHAR(10),@SN VARCHAR(10)
SELECT @SNO  = SNO,@SN = SN
FROM S
WHERE SNO = 'S7'


--注释符（单行）
/*（多行注释符）*/


--算术运算符：+，-，*，/，%（求余）
--参与运算的表达式必须是数值类型或能够进行算术运算的其他数据类型
--也可以对datetime、smalldatetime、money、smallmoney类型的值执行算术运算


--等号（=）是唯一的Transact-SQL 赋值运算符


--字符串连接运算符：（+），用它将字符串连接起来
--其他所有字符串操作都使用字符串函数进行处理
--‘good’+‘’+‘morning’ 结果是：‘good morning’


--比较运算符：=，>,<,>=,<=,<>(不等于),
--！=（不等于）非SQL-92 标准 
--！<(不小于)
--！>(不大于)
--用来比较2个表达式值之间的大小关系，
--可以用于除了text，ntext和image数据类型之外的所有数据类型
--运算结果为true或false


--逻辑运算符
--ALL	一组比较中都为true，结果为true
--AND	2个表达式都为true，结果为true
--ANY	一组标记中任何一个为true，结果为true
--BETWEEN	操作数在某个范围之内，结果为true
--EXISTS	子查询包含一些行，结果为true
--IN	操作数等于表达式列表中的一个，结果为true
--LIKE	操作数与一种模式相匹配，结果为true
--NOT	逻辑值取反，操作数的值为true，结果为false，否则为true
--OR	两个布尔表达式中的一个位true，结果为true
--SOME	一系列操作数中有些值为true，结果为true


--按位运算符
--&	两个数对应的二进制位上都为1时，该位上的运算结果为1，否则为0
--|	两个数对应的二进制位上有一个为1时，该位上的运算结果为1，否则为0
--^	两个数对应的二进制位上不同时，该位上的运算结果为1，否则为0


--一元运算符
--+		正号，数值为正
--（-）	负号，数值为负
--~		按位取反，对操作数进行按二进制位取反运算，即原来为1，运算结果为0，否则为1


--运算符优先级和结合性
--小括号			（）
--正、负、按位取反	 +，-，~
--乘、除、求余数	 *，/，%
--加、减、字符串连接 +，-，+
--各种比较元素符	 =，>,<,>=,<=,<> 
--位运算符			 ^,&,|
--逻辑非			 NOT
--逻辑与			 AND
--逻辑元素符		 ALL,ANY,BETWEEN,IN,LIKE,OR,SOME
--赋值元素符		 =


--7.1.3 批处理：包含一个或多个T-SQL语句的组
--被整合成一个执行计划，
--要么被放在一起执行，要么没有一句能执行
--使用GO语句将多条语句进行分割，GO之间的语句时一个批处理单元
--每个批处理被单独地处理，一个批处理中的错误不会阻止另一个批处理的运行



/*7-3 执行批处理程序，依次查询学生选课表sc、学生总数*/
GO
SELECT * 
FROM SC
SELECT COUNT(*)
FROM S
GO


--7.1.4 流程控制语句

--1.BEGIN...END 语句
--用来设定一个程序块，在该结构内的所有程序视为一个执行单元
--可嵌套另外的BEGIN...END 语句
BEGIN
	--命令行或程序块
END

--2.IF...ELSE 语句
--<条件表达式>:可以是各种表达式的组合，表达式的值必须为逻辑值真或假
--else子句可选
--不使用程序块只能执行一条命令
--可嵌套，T-SQL 最多嵌套32级
IF	--<条件表达式>
		--命令行或程序块
ELSE
	--命令行或程序块
	
/*7-4 从数据库中的sc表求出学号为s1同学的平均成绩，
	  如果平均成绩大于或等于60分，则输出‘pass！’信息*/	
GO
IF(SELECT AVG(SCORE)FROM SC WHERE SNO='S1')>=60
	PRINT 'PASS!'
ELSE
	PRINT 'FAIL!'
GO


--3.IF[NOT]EXISTS语句
--用于检测数据是否存在
--如果exists后面的select子查询的结果不为空，就执行其后面的程序块，否则执行else后面的
--当采用not关键字时，则与上面的功能相反
/*7-5 从s表中读取学号为s1同学的数据记录
	  如果存在，则输出‘存在’，否则输出‘不存在学号为s1的学生’*/
IF EXISTS(SELECT * FROM S WHERE SNO='S1')
	PRINT '存在'
ELSE
	PRINT '不存在学号为s1的学生'

GO
DECLARE @MESSAGE NVARCHAR(50)
IF EXISTS(SELECT * FROM S WHERE SNO='S1')
	SET @MESSAGE='存在学号为s1的学生'
ELSE
	SET @MESSAGE='不存在学号为s1的学生'
PRINT @MESSAGE
GO


--4.CASE 语句
--将case后面表达式的值，与各when子句中的表达式的值进行比较，如相等，则返回then后表达式的值，跳出case语句
--否则返回else子句中表达式的值
--else子句是可选项，
--当不包含case子句时，且所有比较都失败，case返回null

/*7-6 从s表中，选取sno 和sex ，
	  如果字段sex值为‘男’，则输出‘m’
	  如果为‘女’，则输出‘f’*/
GO
SELECT SNO,SEX= CASE SEX
					WHEN '男' THEN 'M'
					WHEN '女' THEN 'F'
				END
FROM S
GO


/*7-7 从sc表中查询所有同学选课成绩情况，凡成绩为空的输出‘未考’
	  小于60分的输出不及格，
	  60-70分的输出‘及格’
	  70-90分的输出‘良好’
	  大于或等于90分的输出‘优秀’*/
GO
SELECT SNO,CNO,SCORE = CASE
							WHEN SCORE IS NULL THEN '未考'
							WHEN SCORE <60 THEN '不及格'
							WHEN SCORE >=60 AND SCORE<70 THEN '及格'
							WHEN SCORE >=70 AND SCORE<90 THEN '良好'
							WHEN SCORE >=90 THEN '优秀'
						END
FROM SC
GO


--5.WHILE...CONTINUE...BREAK语句
