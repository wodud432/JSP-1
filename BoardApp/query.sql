CREATE TABLE tblBoard(
	num			number,				-- �۹�ȣ
	name		varchar2(20),		-- �ۼ���
	email		varchar2(50),		
	homepage	varchar2(50),
	subject		varchar2(50),		-- �� ����
	content		varchar2(4000),		-- �� ����
	pass		varchar2(10),		
	count		number,				-- ��ȸ��
	ip			varchar2(50),		-- �ۼ��� ip�ּ�
	regdate		date,				-- �����
	pos			number,				-- �亯�� ��ġ
	depth		number,				-- �亯�� ����
	constraint pk_num	primary key(num)
);

CREATE SEQUENCE seq_num;

insert into TBLBOARD values(seq_num.nextVal, 'aaa', 'aaa', 'aaa', 
'aaa', 'aaa', 'aaa', 0, 'aaa', sysdate, 0, 0);

insert into TBLBOARD values(seq_num.nextVal, 'bbb', 'bbb', 'bbb', 
'bbb', 'bbb', 'bbb', 0, 'bbb', sysdate, 0, 0);

select * from tblboard;

-- �亯�ޱ� �׽�Ʈ ���̺�
CREATE TABLE replyTest(
	num			number,
	subject		varchar2(10),
	pos			number,
	depth		number
);

CREATE TABLE replyTest(
	num			int,
	subject		varchar(10),
	pos			int,
	depth		int
);

delete from TBLBOARD;

select * from tblBoard;

/*
 * �������� : pos�� �������� �������� ����
 * 1. ���ο� �����͸� �Է��� �� ���� ���� �������� ��� pos���� 1 ����
 * 2. ���� �ԷµǴ� �����ʹ� ������ pos�� depth�� 0���� �Է�
 * 3. �亯���� �Է��� �� �θ𺸴� ū pos�� 1�� �����Ѵ�.
 * 4. �亯���� pos�� �θ���� pos�� 1�� ���Ѵ�.
 */

-- 1���� �Է�
update REPLYTEST set pos=pos+1;
insert into REPLYTEST values(1, 'aaa', 0, 0);

select * from REPLYTEST order by pos;

-- 2���� �Է�
update REPLYTEST set pos=pos+1;
insert into REPLYTEST values(2, 'bbb', 0, 0);

select * from REPLYTEST order by pos;

-- 3���� �Է�
update REPLYTEST set pos=pos+1;
insert into REPLYTEST values(3, 'ccc', 0, 0);

select * from REPLYTEST order by pos;

-- 4���� �Է�
update REPLYTEST set pos=pos+1;
insert into REPLYTEST values(4, 'ddd', 0, 0);

select * from REPLYTEST order by pos;

-- 3���ۿ� ���� �亯�� �Է�
update REPLYTEST set pos=pos+1 where pos > 1;
insert into REPLYTEST values(5, 'ccc_cc', 2, 1);

select * from REPLYTEST order by pos;

-- 2���ۿ� ���� �亯�� �Է�(bbb_b)
update REPLYTEST set pos=pos+1 where pos > 3;
insert into REPLYTEST values(6, 'bbb_b', 4, 1);

select * from REPLYTEST order by pos;




