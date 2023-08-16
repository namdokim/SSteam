<<<<<<< HEAD
﻿CREATE TABLE rentalhome_pay
(
	pay_idx int NOT NULL AUTO_INCREMENT,
	room_idx int NOT NULL,
	kind varchar(10),
	bank varchar(20),
	price int,
	pay_date datetime DEFAULT now(),
	pay_stauts varchar(10),
	refund_request_date datetime,
	refund_complete_date datetime,
	accountholder varchar(20),
	start_date datetime,
	end_date datetime,
	uNo int NOT NULL,
	PRIMARY KEY (pay_idx)
);

CREATE TABLE rentalhome_price
(
	price_idx int NOT NULL AUTO_INCREMENT,
	room_idx int NOT NULL,
	change_yn char DEFAULT 'N' NOT NULL,
	reason varchar(20),
	start_date datetime,
	end_date datetime,
	rate int,
	fix int,
	PRIMARY KEY (price_idx)
);

CREATE TABLE rentalhome
(
	rentalhome_idx int NOT NULL AUTO_INCREMENT,
	name varchar(100),
    	address varchar(100),
	info text,
   	type varchar(20),
	inPool_yn char default 'N',
    	outPool_yn char default 'N',
	parking_yn char default 'N',
	pickup_yn char default 'N',
	wifi_yn char default 'N',
	beach_yn char default 'N',
	bbq_yn char default 'N',
	breakfast_yn char default 'N',
	animal_yn char default 'N',
   	checkIn char(5) NOT NULL,
   	checkOut char(5) NOT NULL,
	checkIn_info varchar(100) NOT NULL,
   	breakfast_price int,
    	breakfast_open char(5),
    	breakfast_close char(5),
   	breakfast_day varchar(100),
	uNo int NOT NULL,
	PRIMARY KEY (rentalhome_idx)
);

CREATE TABLE rentalhome_attach
(
	attach_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	logical_name varchar(100),
	physical_name varchar(100),
	thumbnail char DEFAULT 'N',
	PRIMARY KEY (attach_idx)
);

CREATE TABLE rentalhome_report
(
	report_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	report_contents varchar(255),
	report_date datetime DEFAULT NOW(),
	report_process varchar(10),
	uNo int NOT NULL,
	PRIMARY KEY (report_idx)
);

CREATE TABLE rentalhome_review
(
	review_idx int NOT NULL AUTO_INCREMENT,
    	room_idx int NOT NULL,
	rentalhome_idx int NOT NULL,
	contents text,
	kind int,
	facility int,
	clean int,
	price int,
    	wdate datetime DEFAULT now(),
	uNo int NOT NULL,
	PRIMARY KEY (review_idx)
);

CREATE TABLE rentalhome_review_attach
(
	attach_idx int NOT NULL AUTO_INCREMENT,
	review_idx int NOT NULL,
	logical_name varchar(255),
	physical_name varchar(255),
	PRIMARY KEY (attach_idx)
);

CREATE TABLE rentalhome_review_report
(
	report_idx int NOT NULL AUTO_INCREMENT,
	review_idx int NOT NULL,
	report_date datetime DEFAULT NOW(),
	report_contents varchar(255),
	report_process varchar(10),
	uNo int NOT NULL,
	PRIMARY KEY (report_idx)
);

CREATE TABLE rentalhome_room
(
	room_idx int NOT NULL auto_increment,
	rentalhome_idx int NOT NULL,
	name varchar(30) NOT NULL,
	min_person int NOT NULL,
	max_person int NOT NULL,
	weekday_price int,
	weekend_price int,
	smoking char DEFAULT 'N',
    	wifi char DEFAULT 'N',
	bed_info varchar(50),
	PRIMARY KEY (room_idx)
);

CREATE TABLE rentalhome_room_attach
(
	attach_idx int NOT NULL AUTO_INCREMENT,
	room_idx int NOT NULL,
	logical_name varchar(255),
	physical_name varchar(255),
	thumbnail char DEFAULT 'N',
	PRIMARY KEY (attach_idx)
);

CREATE TABLE rentalhome_like
(
	like_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	uNo int NOT NULL,
	PRIMARY KEY (like_idx)
);


CREATE TABLE User
(
	uNo int NOT NULL AUTO_INCREMENT,
	uId varchar(50),
	uPw text,
	uName varchar(50),
	uNick varchar(50),
	uPhone varchar(50),
	uAddsPostCode VARCHAR(20) comment "우편번호",
	uRoadAddress text comment "도로명주소",
	uJibunAddress text comment "지번주소",
	uDetailAddress text comment "상세주소",
	uDate datetime DEFAULT NOW(),
	uImg text,
	uPoint int DEFAULT 0,
	uType char(10) ,
	uSocialType char(10) DEFAULT 'N',
	uDely char(2) DEFAULT 'N',
	PRIMARY KEY (uNo)

);

ALTER TABLE rentalhome_pay
	ADD FOREIGN KEY (room_idx)
	REFERENCES rentalhome_room (room_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_pay
	ADD FOREIGN KEY (uNo)
	REFERENCES user (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;
ALTER TABLE rentalhome_room
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_room_attach
	ADD FOREIGN KEY (room_idx)
	REFERENCES rentalhome_room (room_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_attach
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_price
	ADD FOREIGN KEY (room_idx)
	REFERENCES rentalhome_room (room_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review
	ADD FOREIGN KEY (room_idx)
	REFERENCES rentalhome_room (room_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review_attach
	ADD FOREIGN KEY (review_idx)
	REFERENCES rentalhome_review (review_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review_report
	ADD FOREIGN KEY (review_idx)
	REFERENCES rentalhome_review (review_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_report
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_like
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

=======
﻿CREATE TABLE rentalhome_pay
(
	pay_idx int NOT NULL AUTO_INCREMENT,
	room_idx int NOT NULL,
	kind varchar(10),
	bank varchar(20),
	price int,
	pay_date datetime DEFAULT now(),
	pay_stauts varchar(10),
	refund_request_date datetime,
	refund_complete_date datetime,
	accountholder varchar(20),
	start_date datetime,
	end_date datetime,
	uNo int NOT NULL,
	PRIMARY KEY (pay_idx)
);

CREATE TABLE rentalhome_price
(
	price_idx int NOT NULL AUTO_INCREMENT,
	room_idx int NOT NULL,
	change_yn char DEFAULT 'N' NOT NULL,
	reason varchar(20),
	start_date datetime,
	end_date datetime,
	rate int,
	fix int,
	PRIMARY KEY (price_idx)
);

CREATE TABLE rentalhome
(
	rentalhome_idx int NOT NULL AUTO_INCREMENT,
	name varchar(100),
    	address varchar(100),
	info text,
   	type varchar(20),
	inPool_yn char default 'N',
    	outPool_yn char default 'N',
	parking_yn char default 'N',
	pickup_yn char default 'N',
	wifi_yn char default 'N',
	beach_yn char default 'N',
	bbq_yn char default 'N',
	breakfast_yn char default 'N',
	animal_yn char default 'N',
   	checkIn char(5) NOT NULL,
   	checkOut char(5) NOT NULL,
	checkIn_info varchar(100) NOT NULL,
   	breakfast_price int,
    	breakfast_open char(5),
    	breakfast_close char(5),
   	breakfast_day varchar(100),
	uNo int NOT NULL,
	PRIMARY KEY (rentalhome_idx)
);

CREATE TABLE rentalhome_attach
(
	attach_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	logical_name varchar(100),
	physical_name varchar(100),
	thumbnail char DEFAULT 'N',
	PRIMARY KEY (attach_idx)
);

CREATE TABLE rentalhome_report
(
	report_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	report_contents varchar(255),
	report_date datetime DEFAULT NOW(),
	report_process varchar(10),
	uNo int NOT NULL,
	PRIMARY KEY (report_idx)
);

CREATE TABLE rentalhome_review
(
	review_idx int NOT NULL AUTO_INCREMENT,
    	room_idx int NOT NULL,
	rentalhome_idx int NOT NULL,
	contents text,
	kind int,
	facility int,
	clean int,
	price int,
    	wdate datetime DEFAULT now(),
	uNo int NOT NULL,
	PRIMARY KEY (review_idx)
);

CREATE TABLE rentalhome_review_attach
(
	attach_idx int NOT NULL AUTO_INCREMENT,
	review_idx int NOT NULL,
	logical_name varchar(255),
	physical_name varchar(255),
	PRIMARY KEY (attach_idx)
);

CREATE TABLE rentalhome_review_report
(
	report_idx int NOT NULL AUTO_INCREMENT,
	review_idx int NOT NULL,
	report_date datetime DEFAULT NOW(),
	report_contents varchar(255),
	report_process varchar(10),
	uNo int NOT NULL,
	PRIMARY KEY (report_idx)
);

CREATE TABLE rentalhome_room
(
	room_idx int NOT NULL auto_increment,
	rentalhome_idx int NOT NULL,
	name varchar(30) NOT NULL,
	min_person int NOT NULL,
	max_person int NOT NULL,
	weekday_price int,
	weekend_price int,
	smoking char DEFAULT 'N',
    	wifi char DEFAULT 'N',
	bed_info varchar(50),
	PRIMARY KEY (room_idx)
);

CREATE TABLE rentalhome_room_attach
(
	attach_idx int NOT NULL AUTO_INCREMENT,
	room_idx int NOT NULL,
	logical_name varchar(255),
	physical_name varchar(255),
	thumbnail char DEFAULT 'N',
	PRIMARY KEY (attach_idx)
);

CREATE TABLE rentalhome_like
(
	like_idx int NOT NULL AUTO_INCREMENT,
	rentalhome_idx int NOT NULL,
	uNo int NOT NULL,
	PRIMARY KEY (like_idx)
);


CREATE TABLE User
(
	uNo int NOT NULL AUTO_INCREMENT,
	uId varchar(50),
	uPw text,
	uName varchar(50),
	uNick varchar(50),
	uPhone varchar(50),
	uAddsPostCode VARCHAR(20) comment "우편번호",
	uRoadAddress text comment "도로명주소",
	uJibunAddress text comment "지번주소",
	uDetailAddress text comment "상세주소",
	uDate datetime DEFAULT NOW(),
	uImg text,
	uPoint int DEFAULT 0,
	uType char(10) ,
	uSocialType char(10) DEFAULT 'N',
	uDely char(2) DEFAULT 'N',
	PRIMARY KEY (uNo)

);

ALTER TABLE rentalhome_pay
	ADD FOREIGN KEY (room_idx)
	REFERENCES rentalhome_room (room_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_pay
	ADD FOREIGN KEY (uNo)
	REFERENCES user (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;
ALTER TABLE rentalhome_room
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_room_attach
	ADD FOREIGN KEY (room_idx)
	REFERENCES rentalhome_room (room_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_attach
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_price
	ADD FOREIGN KEY (room_idx)
	REFERENCES rentalhome_room (room_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review
	ADD FOREIGN KEY (room_idx)
	REFERENCES rentalhome_room (room_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review_attach
	ADD FOREIGN KEY (review_idx)
	REFERENCES rentalhome_review (review_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_review_report
	ADD FOREIGN KEY (review_idx)
	REFERENCES rentalhome_review (review_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_report
	ADD FOREIGN KEY (rentalhome_idx)
	REFERENCES rentalhome (rentalhome_idx)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_report
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rentalhome_like
	ADD FOREIGN KEY (uNo)
	REFERENCES User (uNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

>>>>>>> main
