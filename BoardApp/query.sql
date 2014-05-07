CREATE TABLE tblBoard(
	num			number,				-- 글번호
	name		varchar2(20),		-- 작성자
	email		varchar2(50),		
	homepage	varchar2(50),
	subject		varchar2(50),		-- 글 제목
	content		varchar2(4000),		-- 글 내용
	pass		varchar2(10),		
	count		number,				-- 조회수
	ip			varchar2(50),		-- 작성자 ip주소
	regdate		date,				-- 등록일
	pos			number,				-- 답변의 위치
	depth		number,				-- 답변의 레벨
	constraint pk_num	primary key(num)
);

CREATE SEQUENCE seq_num;

insert into TBLBOARD values(seq_num.nextVal, 'aaa', 'aaa', 'aaa', 
'aaa', 'aaa', 'aaa', 0, 'aaa', sysdate, 0, 0);

insert into TBLBOARD values(seq_num.nextVal, 'bbb', 'bbb', 'bbb', 
'bbb', 'bbb', 'bbb', 0, 'bbb', sysdate, 0, 0);

select * from tblboard;