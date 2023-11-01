-- pro04

-- 핵심기능 : 공지사항, 자료실, 회원, 자유게시판, 강의별 댓글, 교재와 시범강의

-- 부가기능 : 파일업로드, 채팅 및 쪽지, 타계정 또는 SNS로 로그인, 수강평, 달력
-- 가입시 축하 메일 보내기, 비밀번호 변경시 이메일 보내기
-- 온라인 평가, 진도 관리 등


CREATE DATABASE haebeop;

USE haebeop

CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

INSERT INTO board(title, content, author) VALUES('본문 제목1', '본문 내용1', 'admin');
UPDATE board SET par=bno WHERE bno=1;

INSERT INTO board(title, content, author) VALUES('본문 제목2', '본문 내용2', 'hong'); 
UPDATE board SET par=bno WHERE bno=2;

INSERT INTO board(title, content, author) VALUES('본문 제목3', '본문 내용3', 'kang');
UPDATE board SET par=bno WHERE bno=3;

INSERT INTO board(title, content, author) VALUES('본문 제목4', '본문 내용4', 'lee');
UPDATE board SET par=bno WHERE bno=4;

INSERT INTO board(title, content, author) VALUES('본문 제목5', '본문 내용5', 'son');
UPDATE board SET par=bno WHERE bno=5;

INSERT INTO board(title, content, author) VALUES('본문 제목6', '본문 내용6', 'hong');
UPDATE board SET par=bno WHERE bno=6; 

INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 7);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 7);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 6);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 5);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 4);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 3);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 2);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 1);

select * from board where par = 7 and lev = 1 order by resdate DESC;


CREATE TABLE board_tea(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

CREATE TABLE board_par(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 공지사항(notice) 테이블 생성
create table notice(
	no int primary KEY AUTO_INCREMENT, -- notice 글 번호
	title varchar(200) not NULL,	-- 제목
	content varchar(1000), -- 내용
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt int DEFAULT 0 -- 조회수
);

-- 공지사항 더미글 추가 10건

INSERT INTO notice(title, content) VALUES ('공지사항1', '공지사항1 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항2', '공지사항2 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항3', '공지사항3 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항4', '공지사항4 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항5', '공지사항5 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항6', '공지사항6 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항7', '공지사항7 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항8', '공지사항8 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항9', '공지사항9 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항10', '공지사항10 더미글입니다.');

-- 자주 묻는 질문 (FAQ) 테이블 생성

CREATE TABLE faq (
    fno int PRIMARY KEY AUTO_INCREMENT, -- faq 글 번호
    question VARCHAR(1000) NOT NULL, -- 질문
    answer VARCHAR(1000) NOT NULL -- 답변
);

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문1', '자주 묻는 질문1 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문2', '자주 묻는 질문2 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문3', '자주 묻는 질문3 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문4', '자주 묻는 질문4 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문5', '자주 묻는 질문5 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문6', '자주 묻는 질문6 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문7', '자주 묻는 질문7 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문8', '자주 묻는 질문8 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문9', '자주 묻는 질문9 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문10', '자주 묻는 질문10 더미글입니다.');


-- 대외활동 정보
CREATE TABLE info_act(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(2000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	rec INT DEFAULT 0,
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 학습 정보
CREATE TABLE info_stu(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(2000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	rec INT DEFAULT 0,
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 대학 정보
CREATE TABLE info_uni(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(2000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	rec INT DEFAULT 0,
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

INSERT INTO free(title, content, author) VALUES('본문 제목1', '본문 내용1', 'admin');


-- qna
CREATE TABLE qna(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	pw VARCHAR(330), -- 비밀글, 비밀번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 학교 정보
CREATE TABLE school(
	eo_code VARCHAR(10), -- 교육청 코드
	eo_name VARCHAR(100), -- 교육청 이름
	sc_code VARCHAR(50), -- 학교 코드
	sc_name VARCHAR(100) -- 학교 이름
	);

-- 자료실 db
CREATE TABLE fileobj (
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	postno INT NOT NULL,
	savefolder VARCHAR(400),
	originfile VARCHAR(400),
	savefile VARCHAR(800),
	filesize LONG,
	uploaddate VARCHAR(100)
);

CREATE TABLE fileboard (
	postno int NOT NULL AUTO_INCREMENT PRIMARY KEY,	-- 글 번호
	title VARCHAR(100) not null,   -- 글제목
	content VARCHAR(1500) not null,    -- 글내용
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
	visited INT DEFAULT 0   -- 조회수
);

-- 성적 게시판
CREATE TABLE grade( 
	no INTEGER auto_increment PRIMARY KEY,
	sname VARCHAR(150) NOT NULL ,
	pid VARCHAR(150) NOT null ,
	kor INTEGER ,
	math INTEGER,
	eng INTEGER ,
	social INTEGER ,
	science INTEGER ,
	exam VARCHAR(80),
	tname VARCHAR(150),
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
						
-- sname : 학생 이름, pid: 부모님 아이디, exam : 시험 유형(?), tname: 선생님 성함 
						  
DROP TABLE grade;

INSERT INTO grade VALUES(DEFAULT, '홍길동', 'oh12345', 90, 50, 50, 50, 50, '1학기 중간고사', '이순신', default);

-- 관리자 게시판 관리 테이블
CREATE TABLE report (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    board_bno INT,
    reporter VARCHAR(16),
    reason VARCHAR(255),
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(board_bno) REFERENCES board(bno) ON DELETE CASCADE,
    FOREIGN KEY(reporter) REFERENCES member(id) ON DELETE CASCADE
);
CREATE TABLE report_tea (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    board_bno INT,
    reporter VARCHAR(16),
    reason VARCHAR(255),
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(board_bno) REFERENCES board_tea(bno) ON DELETE CASCADE,
    FOREIGN KEY(reporter) REFERENCES member(id) ON DELETE CASCADE
);
CREATE TABLE report_par (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    board_bno INT,
    reporter VARCHAR(16),
    reason VARCHAR(255),
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(board_bno) REFERENCES board_par(bno) ON DELETE CASCADE,
    FOREIGN KEY(reporter) REFERENCES member(id) ON DELETE CASCADE
);

-- 관리자 댓글 관리 테이블
CREATE TABLE report_rev (
    report_id INT PRIMARY KEY AUTO_INCREMENT, -- 신고 번호
    no INT, -- 댓글 번호
    reporter VARCHAR(16), -- 신고자
    reason VARCHAR(255), -- 이유
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 신고일
    FOREIGN KEY(no) REFERENCES review(no) ON DELETE CASCADE,
    FOREIGN KEY(reporter) REFERENCES member(id) ON DELETE CASCADE
);



CREATE TABLE test(
	num INT,
	title VARCHAR(200)
);

INSERT test VALUES(1, '제목1');
INSERT test VALUES(2, '제목2');
INSERT test VALUES(3, '제목3');
INSERT test VALUES(4, '제목4');
INSERT test VALUES(5, '제목5');

-- 회원(아이디, 비밀번호, 이름, 이메일, 전화번호, 주소1, 주소2, 우편번호, 가입일, 생년월일, 점수, 방문횟수, 직업)
CREATE TABLE member(
	id VARCHAR(20) PRIMARY KEY, -- 아이디
	pw VARCHAR(350) NOT NULL, -- 비밀번호
	NAME VARCHAR(50) NOT NULL, -- 이름
	email VARCHAR(150), -- 이메일
	tel VARCHAR(20), -- 전화번호
	addr1 VARCHAR(200), -- 주소1
	addr2 VARCHAR(200), -- 주소2
	postcode VARCHAR(20), -- 우편번호
	resdate DATETIME DEFAULT CURRENT_TIME, -- 가입일
	birth DATE DEFAULT CURRENT_TIME, -- 생년월일
	pt INT DEFAULT 0, -- 점수
	cnt INT DEFAULT 0 -- 방문횟수,
);

ALTER TABLE member DROP COLUMN job;

UPDATE member SET pw='$2a$10$3zl8fmNyd1IsP1Ru0TNVee9AMtpM9E7yz5ZR9Qiofbj8zqqjJiqIi' WHERE pw='1234';

-- 공지사항(순번, 제목, 내용, 작성자, 작성일, 읽은 횟수)
create table notice(
	no int primary KEY AUTO_INCREMENT, -- notice 글 번호
	title varchar(200) not NULL,	-- 제목
	content varchar(1000), -- 내용
	id VARCHAR(20), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt int DEFAULT 0 -- 조회수
);

-- 강사(강사코드(PK), 강사명, 연락처, 이메일)
-- DROP TABLE instructor;
CREATE TABLE instructor(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(20) not null,
	pw VARCHAR(100) NOT null,
	NAME VARCHAR(10),
	tel VARCHAR(20),
	email VARCHAR(100)
);
	
INSERT INTO instructor VALUES(DEFAULT, '강감찬', '01011111111', 'kang@edu.com');
INSERT INTO instructor VALUES(DEFAULT, '홍길동', '01022222222', 'hong@edu.com');
INSERT INTO instructor VALUES(DEFAULT, '이순신', '01033333333', 'lee@edu.com');

-- 강의(강의코드(PK), 강의명,  강의동영상파일, 과목코드(FK), 강사코드(FK), 수강인원, 최대수강인원)
-- 외래 키 체크를 비활성화
-- SET FOREIGN_KEY_CHECKS = 0;

-- 테이블 삭제
-- DROP TABLE lecture;

-- 외래 키 체크를 다시 활성화
-- SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE lecture(
	NO INT PRIMARY KEY AUTO_INCREMENT, -- 강의 번호
	cate VARCHAR(100), -- 과목 (국어, 수학, 영어, ...)
	slevel VARCHAR(100), -- 수강 레벨, 분류 ex(중학교 1학년, 고등학교 3학년 등등..)
	title VARCHAR(200) NOT NULL, -- 강의 제목
	content VARCHAR(2000), -- 강의 소개 글
	simg VARCHAR(1000), -- 목록 프로필 이미지
	sfile1 VARCHAR(1000), -- ot 영상
	sfile2 VARCHAR(1000), -- 강의 영상1
	sfile3 VARCHAR(1000), -- 강의 영상2
	sfile4 VARCHAR(1000), -- 강의 영상3
	sfile5 VARCHAR(1000), -- 강의 영상4
	price INT NOT NULL, -- 강의 가격
	ino INT, -- 강사코드(FK)
	cnt INT DEFAULT 0, -- 조회수
	lec INT DEFAULT 0, -- 현재 수강인원
	lec_max INT, -- 최대 수강인원
	aplctClss1 DATE, -- 수강신청 시작일
	aplctClss2 DATE, -- 수강신청 종료일
	studystart DATE, -- 강의 시작일
	studyend DATE, -- 강의 종료일
	endday INT, -- 강의 수강 기간일 지정
	FOREIGN KEY(ino) REFERENCES instructor(NO) -- 강사 번호를 외래키로 사용
);
-- ALTER TABLE lecture ADD COLUMN endday INT;
-- UPDATE lecture SET endday = 100; 

-- 강의 리뷰
CREATE TABLE review(
    NO INT AUTO_INCREMENT PRIMARY KEY, -- 번호
    id VARCHAR(20) NOT NULL, -- 작성 아이디
    content VARCHAR(300) NOT NULL, -- 후기
    resdate timestamp DEFAULT CURRENT_TIMESTAMP(), -- 작성일
    score INT CHECK (score >= 1 AND score <= 5), -- 점수 (1부터 5까지의 정수)
    par INT, -- 강의 번호
    FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE -- 회원 아이디를 외래키로 선언
);

-- 실제 파일 이름 저장 경로
CREATE TABLE lecfile (
	NO INT PRIMARY KEY AUTO_INCREMENT, -- 번호
	sfile VARCHAR(1000), -- 난수화된 파일 이름
	realname VARCHAR(250) -- 실제 파일 이름
)


-- 수강(수강코드(PK), 강의코드(FK), 학생아이디(FK), 수강총시간, 수강완료 여부)
DROP table course;

CREATE TABLE course(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	lec_no INT, 
	sid VARCHAR(20),
	CHECK1 VARCHAR(10),
	-- FOREIGN KEY(lec_no) REFERENCES lecture(no), 
	-- FOREIGN KEY(sid) REFERENCES member(id)
	);

-- payment 

-- 교재(교재코드(PK), 교재명, 교재목차, 출판사, 출판일, 저자, 가격, 기타메모)
CREATE TABLE textbook(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	bookname VARCHAR(100),
	contents VARCHAR(1000),
	company VARCHAR(50),
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 출판일
	author VARCHAR(50),
	cost INT DEFAULT 0,
	memo VARCHAR(1000)
	);

-- 장바구니
-- SET FOREIGN_KEY_CHECKS = 0;

-- 테이블 삭제
-- DROP TABLE cart;

-- 외래 키 체크를 다시 활성화
-- SET FOREIGN_KEY_CHECKS = 1;
-- 여기에서 lecture의 과목, 강의명 컬럼 추가

-- 장바구니 테이블
CREATE TABLE cart(
	cartno INT PRIMARY KEY AUTO_INCREMENT, -- 장바구니 번호
	id VARCHAR(20), -- 아이디
	lec_no INT,  -- 과목 번호
	FOREIGN KEY(lec_no) REFERENCES lecture(NO) ON DELETE CASCADE, 
	FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE
	)

-- 결제 내역(강의 구매 내역)
CREATE TABLE payment(
	sno INT PRIMARY KEY AUTO_INCREMENT, -- (수강신청, 걸제 내역 번호)
	id VARCHAR(20), -- 구매자 id(FK)
	lec_no INT, -- 강의 번호(FK)
	lec_name VARCHAR(200), -- 강의 이름
	pmethod VARCHAR(500), -- 결제 방법
	pcom VARCHAR(500), -- 결제 대행
	cnum VARCHAR(500), -- 결제번호
	price INT, -- 가격
	state INT DEFAULT 0, -- 상태
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 결제 일
	buydate TIMESTAMP, -- 구매 확정 일
	pt INT, -- 포인트
	FOREIGN KEY(lec_no) REFERENCES lecture(NO),
	FOREIGN KEY(id) REFERENCES member(id) ON DELETE CASCADE
	);
-- ALTER TABLE payment ADD COLUMN resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP();
-- ALTER TABLE payment ADD COLUMN buydate TIMESTAMP;
-- alter table payment change resdate TIMESTAMP;
-- ALTER TABLE payment DROP COLUMN resdate;
-- ALTER TABLE payment ADD COLUMN pt INT;

-- 강의 배정
-- 과목, 강사, 교재 정보를 강의 테이블에 등록하는 행위
-- 하나의 과목당 여러 강의를 모두 등록해야한다.


-- 수강 신청
-- 강의 정보를 보고, 학생이 수강 신청을 하는 행위,
-- 학생별로 모든 강의 정보가 등록되어야 하며, 
-- 만약 수강신청시 수강인원이 초과될 경우 수강신청을 할 수 없다.