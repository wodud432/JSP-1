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

-- 답변달기 테스트 테이블
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
 * 전제조건 : pos를 기준으로 오름차순 정렬
 * 1. 새로운 데이터를 입력할 때 먼저 기존 데이터의 모든 pos값을 1 증가
 * 2. 새로 입력되는 데이터는 무조건 pos와 depth는 0으로 입력
 * 3. 답변글을 입력할 때 부모보다 큰 pos는 1씩 증가한다.
 * 4. 답변글의 pos는 부모글의 pos에 1을 더한다.
 */

-- 1번글 입력
update REPLYTEST set pos=pos+1;
insert into REPLYTEST values(1, 'aaa', 0, 0);

select * from REPLYTEST order by pos;

-- 2번글 입력
update REPLYTEST set pos=pos+1;
insert into REPLYTEST values(2, 'bbb', 0, 0);

select * from REPLYTEST order by pos;

-- 3번글 입력
update REPLYTEST set pos=pos+1;
insert into REPLYTEST values(3, 'ccc', 0, 0);

select * from REPLYTEST order by pos;

-- 4번글 입력
update REPLYTEST set pos=pos+1;
insert into REPLYTEST values(4, 'ddd', 0, 0);

select * from REPLYTEST order by pos;

-- 3번글에 대한 답변글 입력
update REPLYTEST set pos=pos+1 where pos > 1;
insert into REPLYTEST values(5, 'ccc_cc', 2, 1);

select * from REPLYTEST order by pos;

-- 2번글에 대한 답변글 입력(bbb_b)
update REPLYTEST set pos=pos+1 where pos > 3;
insert into REPLYTEST values(6, 'bbb_b', 4, 1);

select * from REPLYTEST order by pos;




