-- oracle
drop table tblsawon;
CREATE TABLE tblSawon(
	no		number,
	id		varchar2(20),
	name	varchar2(20),
	pass	varchar2(10),
	age		number(2),
	addr	varchar2(50),
	ext		char(4),
	dept	varchar2(10),
	CONSTRAINT pk_no PRIMARY KEY(no)
);

-- mysql
-- show tables;
/*
CREATE TABLE tblSawon(
	no		int 	not null 	auto_increment,
	id		varchar(20),
	name	varchar(20),
	pass	varchar(10),
	age		int,
	addr	varchar(50),
	ext		char(4),
	dept	varchar(10),
	CONSTRAINT pk_no PRIMARY KEY(no)
);
*/

DROP SEQUENCE seq_no;
CREATE SEQUENCE seq_no;

delete from TBLSAWON;
INSERT INTO tblSawon values(seq_no.nextVal, 'hong', '홍길동', '1111',
20, '서울', '3431', '영업');
INSERT INTO tblSawon values(seq_no.nextVal, 'lim', '임꺽정', '2222',
29, '광주', '3432', '영업');
INSERT INTO tblSawon values(seq_no.nextVal, 'lee', '이순신', '3333',
39, '부산', '3433', '영업');
INSERT INTO tblSawon values(seq_no.nextVal, 'shin', '신돌석', '4444',
36, '서울', '3434', '기술');
INSERT INTO tblSawon values(seq_no.nextVal, 'jang', '장보고', '5555',
35, '서울', '3435', '기술');
INSERT INTO tblSawon values(seq_no.nextVal, 'ahn', '안창호', '6666',
34, '경기', '3436', '기획');
INSERT INTO tblSawon values(seq_no.nextVal, 'yun', '윤봉길', '7777',
25, '경기', '3437', '기획');

INSERT INTO tblSawon(id, name, pass, age, addr, ext, dept) 
values('hong', '홍길동', '1111',20, '서울', '3431', '영업');

INSERT INTO tblSawon(id, name, pass, age, addr, ext, dept)  
values('lim', '임꺽정', '2222',29, '광주', '3432', '영업');

INSERT INTO tblSawon(id, name, pass, age, addr, ext, dept)  
values('lee', '이순신', '3333', 39, '부산', '3433', '영업');

INSERT INTO tblSawon(id, name, pass, age, addr, ext, dept)  
values('shin', '신돌석', '4444', 36, '서울', '3434', '기술');

INSERT INTO tblSawon(id, name, pass, age, addr, ext, dept)  
values('jang', '장보고', '5555', 35, '서울', '3435', '기술');

INSERT INTO tblSawon(id, name, pass, age, addr, ext, dept)  
values('ahn', '안창호', '6666', 34, '경기', '3436', '기획');

INSERT INTO tblSawon(id, name, pass, age, addr, ext, dept)  
values('yun', '윤봉길', '7777', 25, '경기', '3437', '기획');






