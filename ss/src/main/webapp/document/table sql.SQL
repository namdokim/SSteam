SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS community_attach;
DROP TABLE IF EXISTS community_board_like;
DROP TABLE IF EXISTS community_board_report;
DROP TABLE IF EXISTS community_comment_like;
DROP TABLE IF EXISTS community_comment_report;
DROP TABLE IF EXISTS community_comment_list;
DROP TABLE IF EXISTS community_board;
DROP TABLE IF EXISTS event_attach;
DROP TABLE IF EXISTS event_like;
DROP TABLE IF EXISTS event_report;
DROP TABLE IF EXISTS event_review_attach;
DROP TABLE IF EXISTS event_review_like;
DROP TABLE IF EXISTS event_review_report;
DROP TABLE IF EXISTS event_review_list;
DROP TABLE IF EXISTS Local;
DROP TABLE IF EXISTS event_Index;
DROP TABLE IF EXISTS food_attach;
DROP TABLE IF EXISTS food_like;
DROP TABLE IF EXISTS food_local;
DROP TABLE IF EXISTS food_menu;
DROP TABLE IF EXISTS food_report;
DROP TABLE IF EXISTS food_review_attach;
DROP TABLE IF EXISTS food_review_like;
DROP TABLE IF EXISTS food_review_report;
DROP TABLE IF EXISTS food_review;
DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS home_like;
DROP TABLE IF EXISTS pay;
DROP TABLE IF EXISTS Point;
DROP TABLE IF EXISTS reserve;
DROP TABLE IF EXISTS room_attach;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS price;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS rentalhome_attach;
DROP TABLE IF EXISTS rentalhome_report;
DROP TABLE IF EXISTS review_attach;
DROP TABLE IF EXISTS review_report;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS rentalhome;
DROP TABLE IF EXISTS User;




/* Create Tables */

-- 첨부파일을 관리하는 테이블
CREATE TABLE community_attach
(
	-- 파일 첨부 시 기존에 있는 마지막 첨부파일 번호 + 1 의 값으로 자동생성
	attach_number int NOT NULL AUTO_INCREMENT COMMENT '파일 첨부 시 기존에 있는 마지막 첨부파일 번호 + 1 의 값으로 자동생성',
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	board_number int NOT NULL COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	-- 글 작성 시 or 글 수정 시 저장 가능
	attach_logical_name varchar(255) COMMENT '글 작성 시 or 글 수정 시 저장 가능',
	-- 글 작성 시 or 글 수정 시 저장 가능
	attach_physical_name varchar(255) COMMENT '글 작성 시 or 글 수정 시 저장 가능',
	PRIMARY KEY (attach_number),
	UNIQUE (attach_number),
	UNIQUE (board_number),
	UNIQUE (attach_physical_name)
) COMMENT = '첨부파일을 관리하는 테이블';


-- 커뮤니티 게시판의 글을 관리하는 테이블
CREATE TABLE community_board
(
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	board_number int NOT NULL AUTO_INCREMENT COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	-- 값이 존재하지 않거나, 공백문자만 존재할 수 없음
	board_title varchar(30) NOT NULL COMMENT '값이 존재하지 않거나, 공백문자만 존재할 수 없음',
	-- -1 = 기타
	-- 0 = 게임 1
	-- 1 = 게임 2
	-- 2 = 게임 3
	-- ...
	--
	-- (to enum)
	board_type int NOT NULL COMMENT '-1 = 기타
0 = 게임 1
1 = 게임 2
2 = 게임 3
...

(to enum)',
	-- 값이 존재하지 않거나, 공백문자만 존재할 수 없음
	board_content text NOT NULL COMMENT '값이 존재하지 않거나, 공백문자만 존재할 수 없음',
	-- 글 작성 시 그 때의 날짜로 저장, 글 수정 시에는 동기화 하지 않음
	write_date datetime DEFAULT NOW() NOT NULL COMMENT '글 작성 시 그 때의 날짜로 저장, 글 수정 시에는 동기화 하지 않음',
	-- 계정 당 한 가지 글에 대해서 증가시킬 수 있는 조회수에 한계를 둠
	hit_count int DEFAULT 0 NOT NULL COMMENT '계정 당 한 가지 글에 대해서 증가시킬 수 있는 조회수에 한계를 둠',
	uNo int NOT NULL,
	PRIMARY KEY (board_number),
	UNIQUE (board_number),
	UNIQUE (uNo)
) COMMENT = '커뮤니티 게시판의 글을 관리하는 테이블';


-- 글 좋아요 클릭 여부를 관리하는 테이블
CREATE TABLE community_board_like
(
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	board_number int NOT NULL COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	uNo int NOT NULL,
	UNIQUE (uNo)
) COMMENT = '글 좋아요 클릭 여부를 관리하는 테이블';


-- 글 좋아요 클릭 여부를 관리하는 테이블
CREATE TABLE community_board_report
(
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	board_number int NOT NULL COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	report_date datetime DEFAULT NOW() NOT NULL,
	report_content text,
	report_process char(10),
	uNo int NOT NULL,
	UNIQUE (board_number),
	UNIQUE (uNo)
) COMMENT = '글 좋아요 클릭 여부를 관리하는 테이블';


CREATE TABLE community_comment_like
(
	-- 댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성
	comment_number int NOT NULL COMMENT '댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성',
	uNo int NOT NULL,
	UNIQUE (comment_number),
	UNIQUE (uNo)
);


-- 커뮤니티 게시판의 댓글 목록을 관리하는 테이블
CREATE TABLE community_comment_list
(
	-- 댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성
	comment_number int NOT NULL AUTO_INCREMENT COMMENT '댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성',
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	board_number int NOT NULL COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	-- 값이 존재하지 않거나, 공백문자만 존재할 수 없음
	comment_content text NOT NULL COMMENT '값이 존재하지 않거나, 공백문자만 존재할 수 없음',
	-- 댓글 작성 시 그 때의 날짜로 저장, 댓글 수정 시에는 동기화 하지 않음
	write_date datetime DEFAULT NOW() NOT NULL COMMENT '댓글 작성 시 그 때의 날짜로 저장, 댓글 수정 시에는 동기화 하지 않음',
	uNo int NOT NULL,
	PRIMARY KEY (comment_number),
	UNIQUE (comment_number),
	UNIQUE (uNo)
) COMMENT = '커뮤니티 게시판의 댓글 목록을 관리하는 테이블';


-- 글 좋아요 클릭 여부를 관리하는 테이블
CREATE TABLE community_comment_report
(
	-- 댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성
	comment_number int NOT NULL COMMENT '댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성',
	report_date datetime DEFAULT NOW() NOT NULL,
	report_content text,
	uNo int NOT NULL,
	UNIQUE (comment_number),
	UNIQUE (uNo)
) COMMENT = '글 좋아요 클릭 여부를 관리하는 테이블';


-- 첨부파일을 관리하는 테이블
CREATE TABLE event_attach
(
	-- 파일 첨부 시 기존에 있는 마지막 첨부파일 번호 + 1 의 값으로 자동생성
	attach_number int NOT NULL AUTO_INCREMENT COMMENT '파일 첨부 시 기존에 있는 마지막 첨부파일 번호 + 1 의 값으로 자동생성',
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	event_number int NOT NULL COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	-- 글 작성 시 or 글 수정 시 저장 가능
	attach_logical_name varchar(255) COMMENT '글 작성 시 or 글 수정 시 저장 가능',
	-- 글 작성 시 or 글 수정 시 저장 가능
	attach_physical_name varchar(255) COMMENT '글 작성 시 or 글 수정 시 저장 가능',
	PRIMARY KEY (attach_number),
	UNIQUE (attach_number),
	UNIQUE (event_number),
	UNIQUE (attach_physical_name)
) COMMENT = '첨부파일을 관리하는 테이블';


-- 커뮤니티 게시판의 글을 관리하는 테이블
CREATE TABLE event_Index
(
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	event_number int NOT NULL AUTO_INCREMENT COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	-- 값이 존재하지 않거나, 공백문자만 존재할 수 없음
	event_title varchar(30) COMMENT '값이 존재하지 않거나, 공백문자만 존재할 수 없음',
	-- 값이 존재하지 않거나, 공백문자만 존재할 수 없음
	event_content text COMMENT '값이 존재하지 않거나, 공백문자만 존재할 수 없음',
	-- 글 작성 시 그 때의 날짜로 저장, 글 수정 시에는 동기화 하지 않음
	write_date datetime DEFAULT NOW() COMMENT '글 작성 시 그 때의 날짜로 저장, 글 수정 시에는 동기화 하지 않음',
	-- 계정 당 한 가지 글에 대해서 증가시킬 수 있는 조회수에 한계를 둠
	hit_count int DEFAULT 0 COMMENT '계정 당 한 가지 글에 대해서 증가시킬 수 있는 조회수에 한계를 둠',
	event_tel varchar(255),
	event_start date,
	event_end date,
	event_local numeric,
	uNo int NOT NULL,
	PRIMARY KEY (event_number),
	UNIQUE (event_number),
	UNIQUE (uNo)
) COMMENT = '커뮤니티 게시판의 글을 관리하는 테이블';


-- 글 좋아요 클릭 여부를 관리하는 테이블
CREATE TABLE event_like
(
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	event_number int NOT NULL COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	uNo int NOT NULL,
	UNIQUE (uNo)
) COMMENT = '글 좋아요 클릭 여부를 관리하는 테이블';


-- 글 좋아요 클릭 여부를 관리하는 테이블
CREATE TABLE event_report
(
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	event_number int NOT NULL COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	event_report_date datetime DEFAULT NOW(),
	event_report_content text,
	event_report_state int,
	uNo int NOT NULL,
	UNIQUE (event_number),
	UNIQUE (uNo)
) COMMENT = '글 좋아요 클릭 여부를 관리하는 테이블';


CREATE TABLE event_review_attach
(
	event_review_ano int NOT NULL AUTO_INCREMENT,
	event_review_logical_name varchar(255),
	event_review_physical_name varchar(255),
	-- 댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성
	comment_number int NOT NULL COMMENT '댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성',
	PRIMARY KEY (event_review_ano),
	UNIQUE (comment_number)
);


CREATE TABLE event_review_like
(
	-- 댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성
	comment_number int NOT NULL COMMENT '댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성',
	uNo int NOT NULL,
	UNIQUE (comment_number),
	UNIQUE (uNo)
);


-- 커뮤니티 게시판의 댓글 목록을 관리하는 테이블
CREATE TABLE event_review_list
(
	-- 댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성
	comment_number int NOT NULL AUTO_INCREMENT COMMENT '댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성',
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	event_number int NOT NULL COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	-- 값이 존재하지 않거나, 공백문자만 존재할 수 없음
	comment_content text COMMENT '값이 존재하지 않거나, 공백문자만 존재할 수 없음',
	-- 댓글 작성 시 그 때의 날짜로 저장, 댓글 수정 시에는 동기화 하지 않음
	write_date datetime DEFAULT NOW() COMMENT '댓글 작성 시 그 때의 날짜로 저장, 댓글 수정 시에는 동기화 하지 않음',
	Ratio numeric,
	uNo int NOT NULL,
	PRIMARY KEY (comment_number),
	UNIQUE (comment_number),
	UNIQUE (uNo)
) COMMENT = '커뮤니티 게시판의 댓글 목록을 관리하는 테이블';


-- 글 좋아요 클릭 여부를 관리하는 테이블
CREATE TABLE event_review_report
(
	-- 댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성
	comment_number int NOT NULL COMMENT '댓글 작성 시 기존에 있는 마지막 댓글 번호 +1 의 값으로 자동생성',
	event_report_date datetime DEFAULT NOW(),
	event_report_content text,
	event_report_state int,
	uNo int NOT NULL,
	UNIQUE (comment_number),
	UNIQUE (uNo)
) COMMENT = '글 좋아요 클릭 여부를 관리하는 테이블';


CREATE TABLE food
(
	food_number int NOT NULL AUTO_INCREMENT,
	food_title varchar(255) NOT NULL,
	food_grade double,
	food_adress varchar(255) NOT NULL,
	food_call int(255),
	food_foodkind varchar(255),
	food_money int(255),
	food_car varchar(255),
	food_write_date datetime,
	food_working datetime,
	-- 네가 원하는 방식으로 해
	food_rest int COMMENT '네가 원하는 방식으로 해',
	food_website varchar(255),
	-- 숫자입니다
	food_map numeric COMMENT '숫자입니다',
	uNo int NOT NULL,
	PRIMARY KEY (food_number),
	UNIQUE (uNo)
);


CREATE TABLE food_attach
(
	food_attach_number int NOT NULL AUTO_INCREMENT,
	food_number int NOT NULL,
	food_attach_logical_name varchar(255),
	food_attach_physical_name varchar(255),
	PRIMARY KEY (food_attach_number)
);


CREATE TABLE food_like
(
	food_like_number int NOT NULL AUTO_INCREMENT,
	food_number int NOT NULL,
	uNo int NOT NULL,
	PRIMARY KEY (food_like_number),
	UNIQUE (uNo)
);


CREATE TABLE food_local
(
	food_local_code varchar(255) NOT NULL,
	food_number int NOT NULL,
	PRIMARY KEY (food_local_code)
);


CREATE TABLE food_menu
(
	food_menu_number int NOT NULL AUTO_INCREMENT,
	food_number int NOT NULL,
	food_menu_name varbinary(255),
	food_menu_price int,
	PRIMARY KEY (food_menu_number)
);


CREATE TABLE food_report
(
	food_report_number int NOT NULL,
	food_report_date datetime,
	food_report_content text,
	food_report_state int,
	food_number int NOT NULL,
	uNo int NOT NULL,
	PRIMARY KEY (food_report_number),
	UNIQUE (uNo)
);


CREATE TABLE food_review
(
	food_review_number int NOT NULL AUTO_INCREMENT,
	food_review_content text,
	food_review_writedate datetime DEFAULT NOW(),
	food_number int NOT NULL,
	uNo int NOT NULL,
	PRIMARY KEY (food_review_number),
	UNIQUE (uNo)
);


CREATE TABLE food_review_attach
(
	food_review_attach_number int NOT NULL AUTO_INCREMENT,
	food_review_attach_logical_name varchar(255),
	food_review_attach_physical_name varchar(255),
	food_review_number int NOT NULL,
	PRIMARY KEY (food_review_attach_number)
);


CREATE TABLE food_review_like
(
	food_review_like_number int NOT NULL AUTO_INCREMENT,
	food_review_number int NOT NULL,
	uNo int NOT NULL,
	PRIMARY KEY (food_review_like_number),
	UNIQUE (uNo)
);


CREATE TABLE food_review_report
(
	food_review_report_number int NOT NULL AUTO_INCREMENT,
	food_review_report_date datetime,
	food_review_report_content text,
	food_review_report_state int,
	food_review_number int NOT NULL,
	uNo int NOT NULL,
	PRIMARY KEY (food_review_report_number),
	UNIQUE (uNo)
);


CREATE TABLE home_like
(
	like_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	uNo int NOT NULL,
	PRIMARY KEY (like_idx),
	UNIQUE (uNo)
);


CREATE TABLE Local
(
	LocalCode varchar(255) NOT NULL,
	-- 글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성
	event_number int NOT NULL COMMENT '글 작성 시 기존에 있는 마지막 글 번호 + 1 의 값으로 자동생성',
	PRIMARY KEY (LocalCode),
	UNIQUE (event_number)
);


CREATE TABLE pay
(
	pay_idx int NOT NULL AUTO_INCREMENT,
	room_idx int NOT NULL,
	reserve_idx int NOT NULL,
	kind varchar(10),
	bank varchar(20),
	price int,
	pay_date datetime DEFAULT now(),
	pay_stauts varchar(10),
	refund_request_date datetime DEFAULT NOW(),
	refund_complete_date datetime DEFAULT NOW(),
	accountholder varchar(20),
	PRIMARY KEY (pay_idx)
);


CREATE TABLE Point
(
	pNo int NOT NULL AUTO_INCREMENT,
	uPoint int DEFAULT 0,
	pointdate datetime DEFAULT NOW(),
	pType varchar(20),
	PRIMARY KEY (pNo)
);


CREATE TABLE price
(
	price_idx int NOT NULL AUTO_INCREMENT,
	change_yn char DEFAULT 'N' NOT NULL,
	reason varchar(20),
	start_date datetime,
	end_date datetime,
	rate int,
	fix int,
	PRIMARY KEY (price_idx)
);


CREATE TABLE region
(
	code varchar(255) NOT NULL,
	name varchar(200),
	PRIMARY KEY (code)
);


CREATE TABLE rentalhome
(
	rentalhome_idx int NOT NULL AUTO_INCREMENT,
	address varchar(100),
	type varchar(20),
	name varchar(100),
	info text,
	pool_type varchar(10),
	parking_yn char,
	pickup_yn char,
	wifi_yn char,
	beach_yn char,
	bbq_yn char,
	breakfast_yn char,
	animal_yn char DEFAULT 'N',
	uNo int NOT NULL,
	PRIMARY KEY (rentalhome_idx),
	UNIQUE (uNo)
);


CREATE TABLE rentalhome_attach
(
	attach_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	logical_name varchar(100),
	physical_name varchar(100),
	PRIMARY KEY (attach_idx)
);


CREATE TABLE rentalhome_report
(
	report_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	report_contents varchar(255),
	report_date datetime DEFAULT NOW(),
	report_porcess varchar(10),
	uNo int NOT NULL,
	PRIMARY KEY (report_idx),
	UNIQUE (uNo)
);


CREATE TABLE reserve
(
	reserve_idx int NOT NULL AUTO_INCREMENT,
	room_idx int NOT NULL,
	start_date datetime,
	end_date datetime,
	reserve_status varchar(10),
	reserve_price int,
	balance int,
	uNo int NOT NULL,
	PRIMARY KEY (reserve_idx),
	UNIQUE (uNo)
);


CREATE TABLE review
(
	review_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	contents text,
	kind int,
	facility int,
	clean int,
	price int,
	uNo int NOT NULL,
	PRIMARY KEY (review_idx),
	UNIQUE (uNo)
);


CREATE TABLE review_attach
(
	attach_idx int NOT NULL AUTO_INCREMENT,
	review_idx int NOT NULL,
	logical_name varchar(255),
	physical_name varchar(255),
	PRIMARY KEY (attach_idx)
);


CREATE TABLE review_report
(
	report_idx int NOT NULL AUTO_INCREMENT,
	review_idx int NOT NULL,
	report_date datetime DEFAULT NOW(),
	report_contents varchar(255),
	report_process varchar(10),
	uNo int NOT NULL,
	PRIMARY KEY (report_idx),
	UNIQUE (uNo)
);


CREATE TABLE room
(
	room_idx int NOT NULL,
	rentalhome_idx int NOT NULL,
	price_idx int NOT NULL,
	name varchar(30) NOT NULL,
	min_person int NOT NULL,
	max_person int,
	weekday_price int,
	weekend_pricre int,
	smoking char DEFAULT 'N',
	bed_info varchar(50),
	PRIMARY KEY (room_idx)
);


CREATE TABLE room_attach
(
	attach_idx int NOT NULL AUTO_INCREMENT,
	room_idx int NOT NULL,
	logical_name varchar(255),
	physical_name varchar(255),
	PRIMARY KEY (attach_idx)
);


CREATE TABLE User
(
	uNo int NOT NULL AUTO_INCREMENT,
	uId varchar(50),
	uPw text,
	uName varchar(50),
	uNick varchar(50),
	uPhone varchar(50),
	uAdds text,
	uDate datetime DEFAULT NOW(),
	uImg text,
	uPoint int DEFAULT 0,
	uType char(10),
	uDely char(2) DEFAULT 'N',
	PRIMARY KEY (uNo),
	UNIQUE (uNo)
);



/* Create Foreign Keys */

ALTER TABLE community_attach
	ADD FOREIGN KEY (board_number)
	REFERENCES community_board (board_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_board_like
	ADD FOREIGN KEY (board_number)
	REFERENCES community_board (board_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_board_report
	ADD FOREIGN KEY (board_number)
	REFERENCES community_board (board_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_comment_list
	ADD FOREIGN KEY (board_number)
	REFERENCES community_board (board_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_comment_like
	ADD FOREIGN KEY (comment_number)
	REFERENCES community_comment_list (comment_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_comment_report
	ADD FOREIGN KEY (comment_number)
	REFERENCES community_comment_list (comment_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_attach
	ADD FOREIGN KEY (event_number)
	REFERENCES event_Index (event_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_like
	ADD FOREIGN KEY (event_number)
	REFERENCES event_Index (event_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_report
	ADD FOREIGN KEY (event_number)
	REFERENCES event_Index (event_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_review_list
	ADD FOREIGN KEY (event_number)
	REFERENCES event_Index (event_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Local
	ADD FOREIGN KEY (event_number)
	REFERENCES event_Index (event_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_review_attach
	ADD FOREIGN KEY (comment_number)
	REFERENCES event_review_list (comment_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_review_like
	ADD FOREIGN KEY (comment_number)
	REFERENCES event_review_list (comment_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_review_report
	ADD FOREIGN KEY (comment_number)
	REFERENCES event_review_list (comment_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_attach
	ADD FOREIGN KEY (food_number)
	REFERENCES food (food_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_like
	ADD FOREIGN KEY (food_number)
	REFERENCES food (food_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_local
	ADD FOREIGN KEY (food_number)
	REFERENCES food (food_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_menu
	ADD FOREIGN KEY (food_number)
	REFERENCES food (food_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_report
	ADD FOREIGN KEY (food_number)
	REFERENCES food (food_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_review
	ADD FOREIGN KEY (food_number)
	REFERENCES food (food_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_review_attach
	ADD FOREIGN KEY (food_review_number)
	REFERENCES food_review (food_review_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_review_like
	ADD FOREIGN KEY (food_review_number)
	REFERENCES food_review (food_review_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_review_report
	ADD FOREIGN KEY (food_review_number)
	REFERENCES food_review (food_review_number)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE room
	ADD FOREIGN KEY (price_idx)
	REFERENCES price (price_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE home_like
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE rentalhome_attach
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE rentalhome_report
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE review
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE room
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE pay
	ADD FOREIGN KEY (reserve_idx)
	REFERENCES reserve (reserve_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE review_attach
	ADD FOREIGN KEY (review_idx)
	REFERENCES review (review_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE review_report
	ADD FOREIGN KEY (review_idx)
	REFERENCES review (review_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE pay
	ADD FOREIGN KEY (room_idx)
	REFERENCES room (room_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reserve
	ADD FOREIGN KEY (room_idx)
	REFERENCES room (room_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE room_attach
	ADD FOREIGN KEY (room_idx)
	REFERENCES room (room_idx)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_board
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_board_like
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_board_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_comment_like
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_comment_list
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE community_comment_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_Index
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_like
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_review_like
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_review_list
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE event_review_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_like
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_review
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_review_like
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE food_review_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE home_like
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE rentalhome
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE rentalhome_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reserve
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE review
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE review_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;

-- 추가 수정 삭제
alter table User alter COLUMN uDely set default 'N';

insert into user(uId, uPw, uName, uNick, uPhone, uAdds) values ("123","asdgf","asdg","asdg","한글","한글");

select * from user where uId="aaaa" and uDely="N";