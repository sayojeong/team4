/* Drop Tables */

DROP TABLE note;
DROP TABLE basket;
DROP TABLE coupon;
DROP TABLE studentwanswer;
DROP TABLE HWanswer_st;
DROP TABLE homework_m;
DROP TABLE homework_w;
DROP TABLE suc_class;
DROP TABLE ins_class_vid;
DROP TABLE ins_class;
DROP TABLE student;
DROP TABLE teacher;

/* drop sepeunces */
DROP SEQUENCE note_seq;
DROP SEQUENCE basket_seq;
DROP SEQUENCE coupon_seq;
DROP SEQUENCE studentwanswer_seq;
DROP SEQUENCE HWanswer_st_seq;
DROP SEQUENCE homework_m_seq;
DROP SEQUENCE homework_w_seq;
DROP SEQUENCE suc_class_seq;
DROP SEQUENCE ins_class_vid_seq;
DROP SEQUENCE ins_class_seq;



/* Create Tables */


-- 학생테이블
CREATE TABLE student
(
	-- 학생아이디
	st_id varchar2(20) NOT NULL,
	-- 비밀번호
	st_pw varchar2(20) NOT NULL,
	-- 이름
	st_name varchar2(20) NOT NULL,
	-- 생년월일
	st_dob varchar2(20) NOT NULL,
	-- 전화번호
	st_phone varchar2(20) NOT NULL,
	-- 이메일
	st_email varchar2(30) NOT NULL,
	-- 레벨
	st_level varchar2(5) NOT NULL,
	-- 사진이름
	st_picname varchar2(30),
	-- 저장되는 사진의 이름
	st_savedpicname varchar2(30),
	PRIMARY KEY (st_id)
);


--선생님 테이블
CREATE TABLE teacher
(
	-- 선생님 아이디
	tc_id varchar2(20) NOT NULL,
	-- 비밀번호
	tc_pw varchar2(20) NOT NULL,
	-- 선생님 이름
	tc_name varchar2(30) NOT NULL,
	-- 생년월일
	tc_dob varchar2(20) NOT NULL,
	-- 전화번호
	tc_phone varchar2(20) NOT NULL,
	-- 이메일
	tc_email varchar2(30) NOT NULL,
	-- 사진이름
	tc_picname varchar2(30),
	-- 저장된 사진 이름
	tc_savedpicid varchar2(30),
	-- 권한 승인 여부
	tc_check varchar2(1) default 'n',
	PRIMARY KEY (tc_id)
);


--강의등록테이블
CREATE TABLE ins_class
(
   -- 강의등록 번호
   ins_num  number PRIMARY KEY,
   -- 강의 제목
   ins_title varchar2(30) not null,
   -- 강의 설명
   ins_des varchar2(500) not null,
   -- 강의등록일
   ins_date date default sysdate,
   -- 카테고리
   ins_cate varchar2(20) not null,
   -- 동영상 목록
   ins_vidlist varchar2(3000),
   -- 가격
   ins_price number,
   -- 대표썸네일
   ins_thumbnail varchar2(50),
   -- 대표썸네일실제저장이름
   ins_thumbnailsave varchar2(50),
   -- 전체비디오
   ins_vidcount number,
   -- 선생님 아이디
   tc_id varchar2(20) NOT NULL,
   -- 선생님 이름
    tc_name varchar2(30) NOT NULL,
    constraint ins_fk foreign key(tc_id) references teacher(tc_id) on delete cascade
);
create sequence ins_class_seq;



-- 강의동영상
CREATE TABLE ins_class_vid
(
   -- 강의 비디오 번호
   vid_num number PRIMARY KEY,
   --동영상 제목
   vid_title varchar2(200) not null,
   --동영상 강의 설명
   vid_desc varchar2(500) not null,
   -- 동영상 저장이름
   vid_vidname varchar2(200),
   -- 동영상 실제 저장 이름
   vid_vidsavename varchar2(50),
   -- 썸네일이름
   vid_thumbnail varchar2(50),
   -- 썸네일실제저장이름
   vid_thumbsavename varchar2(50),
   -- 강의등록 번호
   ins_num  number NOT NULL,
    constraint vd_fk foreign key(ins_num) references ins_class(ins_num) on delete cascade
);
create sequence ins_class_vid_seq;


-- 강의신청 테이블
CREATE TABLE suc_class
(
	-- 수강신청 번호
	suc_num number PRIMARY KEY,
    -- 수강구매일
    suc_buydate date default sysdate,
    -- 진도율
    progress number default 0,
    -- 비디오진도
    suc_vidcount number default 0,
	-- 학생아이디
	st_id varchar2(20) NOT NULL,
    -- 대표썸네일실제저장이름
    ins_thumbnailsave varchar2(50),
   -- 카테고리
    ins_cate varchar2(20) not null,
	-- 선생님 이름
	tc_name varchar2(30) NOT NULL,
    -- 강의 제목
    ins_title varchar2(30) not null,
	-- 강의등록 번호
	ins_num  number not null,
    constraint sucid_fk foreign key(st_id) references student(st_id) on delete cascade,
    constraint sucnum_fk foreign key(ins_num) references ins_class(ins_num) on delete cascade	
);
create sequence suc_class_seq;


-- 객관식 문제
create table homework_m( 
--문제번호 pk
m_num number primary key,
--객관식문제
m_question varchar(500) not null,
--객관식찐답
m_answer number(10) not null,
--문제 해설
m_exp varchar(2000),
--동영상번호 fk(ins_class_vid)
vid_num number,
CONSTRAINT homework_m_fk foreign key(vid_num) references ins_class_vid(vid_num) on delete cascade
);
create sequence homework_m_seq;


-- 작문 문제
create table homework_w(
--문제번호 pk
w_num number primary key,
--문제
w_question varchar(1000) not null,
--핵심표현
w_pointexp varchar(1000) not null,
--답
w_answer varchar(1000),
--동영상번호 fk(ins_class_vid)
vid_num number,
CONSTRAINT homework_w_fk foreign key(vid_num) references ins_class_vid(vid_num) on delete cascade
);
create sequence homework_w_seq;


--학생 객관식 답
create Table HWanswer_st( 
    --학생답번호
    hw_num number primary key,
    --학생답
    hw_answer number(10),
    --객관식문제
    m_question varchar2(500),
    --객관식찐답
    m_answer number(10),
    --문제 해설
    m_exp varchar2(2000),
    --학생아이디
    st_id varchar2(20),
    --정답유무
    st_correct varchar2(2) DEFAULT 'y',
    --비디오 번호
    vid_num number,
    --강의번호
    ins_num number,
    constraint HWanswer_first_fk foreign key(st_id) references student(st_id) on delete cascade,
    constraint HWanswer_second_fk foreign key(vid_num) references ins_class_vid(vid_num) on delete cascade
);
create sequence HWanswer_st_seq;


--학생영작
create table studentwanswer( 
    -- 문제번호
    wa_num number primary key,
    -- 학생의 답
    wa_stans varchar2(1000),
    -- 문제
    w_question varchar2(1000) not null,
    --핵심표현
    w_pointexp varchar2(1000) not null,
    -- 선생님의 코멘트
    wa_tcomment varchar2(1000),
    --동영상번호 fk(ins_class_vid)
    vid_num number,
    --학생아이디
    st_id varchar2(20) NOT NULL
);
create sequence studentwanswer_seq;


-- 쿠폰
create table coupon( 
    -- 쿠폰 번호
    c_num number PRIMARY KEY,
    -- 쿠폰 할인 가격
    c_discount number,
    -- 쿠폰 이름(설명) ex) 가입 축하 쿠폰
    c_name varchar2(20),
    -- 학생 아이디
    st_id varchar2(20) not null,
    constraint coupon_fk foreign key(st_id) references student(st_id) on delete cascade
);
create sequence coupon_seq;

--장바구니
CREATE TABLE basket
(
	-- 장바구니 번호
	bas_num number PRIMARY KEY,
	-- 강의등록 번호
	ins_num  number NOT NULL,
	-- 학생아이디
	st_id varchar2(20) not null,
    constraint basket_fk foreign key(ins_num) references ins_class(ins_num) on delete cascade,
    constraint id_fk foreign key(st_id) references student(st_id) on delete cascade
);
create sequence basket_seq;

create table note(
    note_num number primary key,
    note_title date default sysdate,
    st_id varchar2(20) NOT NULL,
    note_content varchar2(3000)
);

create sequence note_seq;
