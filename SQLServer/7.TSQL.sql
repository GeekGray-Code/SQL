/*7-1 ����һ������Ϊ8���ַ��ľֲ�����id�������丳ֵΪ��10010001��*/
DECLARE @ID CHAR(8)
SELECT @ID = '10010001'


/*7-2 �����ݱ�s�в�ѯѧ��Ϊs7��ѧ����ѧ����������
	  ������ѯ����ѧ�������ֱ�洢���ֲ�����@sno �� @sn ��*/
DECLARE @SNO VARCHAR(10),@SN VARCHAR(10)
SELECT @SNO  = SNO,@SN = SN
FROM S
WHERE SNO = 'S7'


--ע�ͷ������У�
/*������ע�ͷ���*/


--�����������+��-��*��/��%�����ࣩ
--��������ı���ʽ��������ֵ���ͻ��ܹ��������������������������
--Ҳ���Զ�datetime��smalldatetime��money��smallmoney���͵�ִֵ����������


--�Ⱥţ�=����Ψһ��Transact-SQL ��ֵ�����


--�ַ����������������+�����������ַ�����������
--���������ַ���������ʹ���ַ����������д���
--��good��+����+��morning�� ����ǣ���good morning��


--�Ƚ��������=��>,<,>=,<=,<>(������),
--��=�������ڣ���SQL-92 ��׼ 
--��<(��С��)
--��>(������)
--�����Ƚ�2������ʽֵ֮��Ĵ�С��ϵ��
--�������ڳ���text��ntext��image��������֮���������������
--������Ϊtrue��false


--�߼������
--ALL	һ��Ƚ��ж�Ϊtrue�����Ϊtrue
--AND	2������ʽ��Ϊtrue�����Ϊtrue
--ANY	һ�������κ�һ��Ϊtrue�����Ϊtrue
--BETWEEN	��������ĳ����Χ֮�ڣ����Ϊtrue
--EXISTS	�Ӳ�ѯ����һЩ�У����Ϊtrue
--IN	���������ڱ���ʽ�б��е�һ�������Ϊtrue
--LIKE	��������һ��ģʽ��ƥ�䣬���Ϊtrue
--NOT	�߼�ֵȡ������������ֵΪtrue�����Ϊfalse������Ϊtrue
--OR	������������ʽ�е�һ��λtrue�����Ϊtrue
--SOME	һϵ�в���������ЩֵΪtrue�����Ϊtrue


--��λ�����
--&	��������Ӧ�Ķ�����λ�϶�Ϊ1ʱ����λ�ϵ�������Ϊ1������Ϊ0
--|	��������Ӧ�Ķ�����λ����һ��Ϊ1ʱ����λ�ϵ�������Ϊ1������Ϊ0
--^	��������Ӧ�Ķ�����λ�ϲ�ͬʱ����λ�ϵ�������Ϊ1������Ϊ0


--һԪ�����
--+		���ţ���ֵΪ��
--��-��	���ţ���ֵΪ��
--~		��λȡ�����Բ��������а�������λȡ�����㣬��ԭ��Ϊ1��������Ϊ0������Ϊ1


--��������ȼ��ͽ����
--С����			����
--����������λȡ��	 +��-��~
--�ˡ�����������	 *��/��%
--�ӡ������ַ������� +��-��+
--���ֱȽ�Ԫ�ط�	 =��>,<,>=,<=,<> 
--λ�����			 ^,&,|
--�߼���			 NOT
--�߼���			 AND
--�߼�Ԫ�ط�		 ALL,ANY,BETWEEN,IN,LIKE,OR,SOME
--��ֵԪ�ط�		 =


--7.1.3 ������������һ������T-SQL������
--�����ϳ�һ��ִ�мƻ���
--Ҫô������һ��ִ�У�Ҫôû��һ����ִ��
--ʹ��GO��佫���������зָGO֮������ʱһ����������Ԫ
--ÿ���������������ش�����һ���������еĴ��󲻻���ֹ��һ��������������



/*7-3 ִ���������������β�ѯѧ��ѡ�α�sc��ѧ������*/
GO
SELECT * 
FROM SC
SELECT COUNT(*)
FROM S
GO


--7.1.4 ���̿������

--1.BEGIN...END ���
--�����趨һ������飬�ڸýṹ�ڵ����г�����Ϊһ��ִ�е�Ԫ
--��Ƕ�������BEGIN...END ���
BEGIN
	--�����л�����
END

--2.IF...ELSE ���
--<��������ʽ>:�����Ǹ��ֱ���ʽ����ϣ�����ʽ��ֵ����Ϊ�߼�ֵ����
--else�Ӿ��ѡ
--��ʹ�ó����ֻ��ִ��һ������
--��Ƕ�ף�T-SQL ���Ƕ��32��
IF	--<��������ʽ>
		--�����л�����
ELSE
	--�����л�����
	
/*7-4 �����ݿ��е�sc�����ѧ��Ϊs1ͬѧ��ƽ���ɼ���
	  ���ƽ���ɼ����ڻ����60�֣��������pass������Ϣ*/	
GO
IF(SELECT AVG(SCORE)FROM SC WHERE SNO='S1')>=60
	PRINT 'PASS!'
ELSE
	PRINT 'FAIL!'
GO


--3.IF[NOT]EXISTS���
--���ڼ�������Ƿ����
--���exists�����select�Ӳ�ѯ�Ľ����Ϊ�գ���ִ�������ĳ���飬����ִ��else�����
--������not�ؼ���ʱ����������Ĺ����෴
/*7-5 ��s���ж�ȡѧ��Ϊs1ͬѧ�����ݼ�¼
	  ������ڣ�����������ڡ������������������ѧ��Ϊs1��ѧ����*/
IF EXISTS(SELECT * FROM S WHERE SNO='S1')
	PRINT '����'
ELSE
	PRINT '������ѧ��Ϊs1��ѧ��'

GO
DECLARE @MESSAGE NVARCHAR(50)
IF EXISTS(SELECT * FROM S WHERE SNO='S1')
	SET @MESSAGE='����ѧ��Ϊs1��ѧ��'
ELSE
	SET @MESSAGE='������ѧ��Ϊs1��ѧ��'
PRINT @MESSAGE
GO


--4.CASE ���
--��case�������ʽ��ֵ�����when�Ӿ��еı���ʽ��ֵ���бȽϣ�����ȣ��򷵻�then�����ʽ��ֵ������case���
--���򷵻�else�Ӿ��б���ʽ��ֵ
--else�Ӿ��ǿ�ѡ�
--��������case�Ӿ�ʱ�������бȽ϶�ʧ�ܣ�case����null

/*7-6 ��s���У�ѡȡsno ��sex ��
	  ����ֶ�sexֵΪ���С����������m��
	  ���Ϊ��Ů�����������f��*/
GO
SELECT SNO,SEX= CASE SEX
					WHEN '��' THEN 'M'
					WHEN 'Ů' THEN 'F'
				END
FROM S
GO


/*7-7 ��sc���в�ѯ����ͬѧѡ�γɼ���������ɼ�Ϊ�յ������δ����
	  С��60�ֵ����������
	  60-70�ֵ����������
	  70-90�ֵ���������á�
	  ���ڻ����90�ֵ���������㡯*/
GO
SELECT SNO,CNO,SCORE = CASE
							WHEN SCORE IS NULL THEN 'δ��'
							WHEN SCORE <60 THEN '������'
							WHEN SCORE >=60 AND SCORE<70 THEN '����'
							WHEN SCORE >=70 AND SCORE<90 THEN '����'
							WHEN SCORE >=90 THEN '����'
						END
FROM SC
GO


--5.WHILE...CONTINUE...BREAK���