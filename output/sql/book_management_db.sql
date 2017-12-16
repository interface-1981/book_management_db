
/* Drop Tables */

DROP TABLE IF EXISTS t_lending_books;
DROP TABLE IF EXISTS t_user_books;
DROP TABLE IF EXISTS m_books;
DROP TABLE IF EXISTS m_users;




/* Create Tables */

CREATE TABLE m_books
(
	book_id int NOT NULL,
	title varchar(100) NOT NULL,
	author varchar(100),
	publisher varchar(100),
	contents text,
	thumbnail_image text,
	regist_datetime timestamp with time zone NOT NULL,
	regist_user varchar(10),
	update_datetime timestamp with time zone,
	update_user varchar(10),
	is_deleted boolean,
	PRIMARY KEY (book_id)
) WITHOUT OIDS;


CREATE TABLE m_users
(
	user_id int NOT NULL,
	user_name varchar(100) NOT NULL,
	mail_address varchar(100) NOT NULL,
	password varchar(1000) NOT NULL,
	is_admin boolean NOT NULL,
	last_login_datetime timestamp with time zone,
	regist_datetime timestamp with time zone NOT NULL,
	regist_user varchar(10),
	update_datetime timestamp with time zone,
	update_user varchar(10),
	is_deleted boolean,
	PRIMARY KEY (user_id)
) WITHOUT OIDS;


CREATE TABLE t_lending_books
(
	lending_books_id int NOT NULL,
	user_books_id int NOT NULL,
	user_id int NOT NULL,
	lending_status smallint NOT NULL,
	cntact_comment text NOT NULL,
	regist_datetime timestamp with time zone NOT NULL,
	regist_user varchar(10),
	update_datetime timestamp with time zone,
	update_user varchar(10),
	is_deleted boolean,
	PRIMARY KEY (lending_books_id)
) WITHOUT OIDS;


CREATE TABLE t_user_books
(
	user_books_id int NOT NULL,
	user_id int NOT NULL,
	book_id int NOT NULL,
	is_editable boolean NOT NULL,
	regist_datetime timestamp with time zone NOT NULL,
	regist_user varchar(10),
	update_datetime timestamp with time zone,
	update_user varchar(10),
	is_deleted boolean,
	PRIMARY KEY (user_books_id)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE t_user_books
	ADD FOREIGN KEY (book_id)
	REFERENCES m_books (book_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_lending_books
	ADD FOREIGN KEY (user_id)
	REFERENCES m_users (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_user_books
	ADD FOREIGN KEY (user_id)
	REFERENCES m_users (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_lending_books
	ADD FOREIGN KEY (user_books_id)
	REFERENCES t_user_books (user_books_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



