drop SEQUENCE booking_seq;
drop table qna;
drop table notice;
drop table event;
drop table cal_table;

drop table card;
drop table bookings;
drop table users; --bookings,payment drop해야 가능
drop table hotel; --bookings drop해야 가능
drop table tb_file; -- hotel할때 같이
drop SEQUENCE tmp_seq1; -- hotel할때 같이

-- 회원
create table users(
id varchar2(50) primary key,
password varchar2(50) not null,
name varchar2(50) not null,
mail varchar2(30) not null,
mailConfirm VARCHAR2(10) default 'N',
role varchar2(10) default 'guest', 
regDate date default sysdate,
mangerRequest VARCHAR2(10) default 'N',
requestDate date default null
);

-- 공지사항 게시판
create table notice(
	seq number primary key,
	title varchar2(100),
	writer varchar2(50),
	content varchar2(2000),
	regDate date default sysdate,
	cnt number default 0
);

-- 이벤트 게시판
create table event(
	seq number primary key,
	title varchar2(100),
	writer varchar2(50),
	content varchar2(2000),
	regDate date default sysdate,
	cnt number default 0
);

-- QnA 게시판
create table qna(		
	seq number primary key,
	originSeq number(10) default 0 not null, 
	originNo number(10) default 0 not null, 
	groupOrd number(10) default 0 not null,
	title varchar2(100),
	writer varchar2(50),
	content varchar2(2000),
	regDate date default sysdate,
	cnt number default 0
);

-- 호텔
create table hotel(
	num number(8) primary key,
	userid varchar2(50) not null, --id 추가
	username varchar2(50) not null, --name 추가
	hotelcode varchar2(10) not null,  
	hotelname varchar2(100) not null,  
	zipcode varchar2(10) not null,  
	address varchar2(100) not null,  
	addressdetail varchar2(100) not null,  
	extraAddress varchar2(100),  
	roomtype varchar2(80),
	hotelprice number(10),  
	oldcount number(1),  
	youngcount number(1),  
	checkin date,  
	checkout date,  
	singlebed number(1),  
	doublebed number(1),  
	chkinfo varchar2(100),  
	otherinfo varchar2(100),
	hit number(38)
);

-- 호텔 이미지
CREATE TABLE tb_file ( 
  IDX int NOT NULL, --호텔 테이블의 기본키 (외래키)
  ORG_FILE_NAME varchar(260) NOT NULL -- 파일 실제 이름
);

-- 예약 목록
create table bookings(
	booking_id number(8) not null, --예약번호(기본키)
	hotel_num number(8), --호텔번호(외래키)
	user_id varchar2(50) not null, --예약자 아이디
	guest_name varchar2(50) not null,-- 투숙객 이름
	guest_email varchar2(50) not null, --투숙객 연락망
	adult number(1) not null, --성인 숙박인원
	child number(1), --아동 숙박인원
	checkin date not null, --체크인
	checkout date not null, --체크아웃
	booking_date date default sysdate not null, --예약날짜
	state varchar2(30) default '예정' not null,--예정/완료/취소 구분
	PRIMARY KEY (booking_id),
 	FOREIGN KEY (hotel_num) REFERENCES Hotel(num) ON DELETE CASCADE,
 	FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- 호텔등록번호 시퀀스(반드시 데이터 insert해주세요. 데이터 안넣을거면 start값 1로 변경)
create sequence tmp_seq1  START WITH 17 INCREMENT BY 1 MAXVALUE 1000000 CYCLE NOCACHE;

-- 예약번호 시퀀스
CREATE SEQUENCE booking_seq START WITH 14367232 INCREMENT BY 1;

-- 결제 카드
create table card(
	userid varchar2(50) not null,  --아이디(외래키)
	card_name varchar2(50) not null, --카드이름
	card_num1 number(4) not null, --카드번호1
	card_num2 number(4) not null, --카드번호2
	card_num3 number(4) not null, --카드번호3
	card_num4 number(4) not null, --카드번호4
	card_month number(2) not null, --유효기간 월
	card_year number(4) not null, --유효기간 년도
	card_pwd number(6) not null, --비밀번호
	owner_name varchar2(20) not null, --명의자
	FOREIGN KEY (userid) REFERENCES Users(id) ON DELETE CASCADE
);