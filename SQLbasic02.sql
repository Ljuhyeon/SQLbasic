# DAY 2
/* 자동으로 증가하는 Column 만들기
- 고유값(Primary key)을 수동으로 데이터를 넣을 수 있지만, 
  값을 자동으로 증가시키는 AUTO_INCREMENT를 사용해서 생성하면 편리함 
- Column 이름은 id, 데이터 타입은 정수(INT)로 만들어줌 */
CREATE TABLE test (
id INT AUTO_INCREMENT PRIMARY KEY
);
DESCRIBE test;

# AUTO_INCREMENT Column에 데이터 추가하기
INSERT INTO test VALUES ();
# 특정 데이터 조회하기 
SELECT * FROM test;
SELECT id FROM test;
SELECT id.name FROM test;

# AUTO_INCREMENT 
INSERT INTO test VALUES (101);
SELECT * FROM test;

# AUTO_INCREMENT Column 생성 값 살펴보기
DELETE FROM test WHERE id = 101;
SELECT * FROM test;

# 삭제를 한 데이터 다음의 숫자부터 추가
INSERT INTO test VALUES();
SELECT * FROM test;

# 데이터 전체 삭제 
DELETE FROM test;
SELECT * FROM test;

# 삭제된 데이터 id 이후 순번부터 적용됨
INSERT INTO test VALUES();
SELECT * FROM test;

# AUTO_INCREMENT 값 초기화 하기
SHOW TABLE STATUS WHERE NAME ='test';
ALTER TABLE test AUTO_INCREMENT = 1;
SELECT * FROM test;

# AUTO_INCREMET 값 수정하기
SET @count=0;
UPDATE test SET id=@count:=@count+1;
SELECT * FROM test;

INSERT INTO test VALUES();
SELECT * FROM test;

# 테이블에 데이터 추가. INSERT
CREATE TABLE table1 (
column1 varchar(100),
column2 varchar(100),
column3 varchar(100)
);
DESC table1;
# 데이터 추가 명령어 INSERT
INSERT INTO table1 (column1, column2, column3) VALUES ('a', 'aa', 'aaa');
SELECT * FROM table1;

# 일부 컬럼에만 값을 넣을때
INSERT INTO table1 ( column1, column2 ) VALUES ( 'b', 'bb' );
SELECT * FROM table1;

# 테이블 데이터 수정. UPDATE
UPDATE table1 SET column1 = 'z';
SELECT * FROM table1;

# 특정 행의 값을 변경하고 싶다면 WHERE를 사용
UPDATE table1 SET column1 = 'x' WHERE column2 = 'aa';
SELECT * FROM table1;

# 여러개의 컬럼 값을 변경하고 싶을 경우 쉼표로 구분하여 여러개의 컬럼별 값을 지정
UPDATE table1
   SET column1 = 'y'
     , column2 = 'yy'
 WHERE column3 = 'aaa';
SELECT * FROM table1;

# 테이블에 데이터 삭제하는 명령어 DELETE, 특정 데이터를 삭제하려면 WHERE 사용
DELETE FROM table1 WHERE column1 = 'y';
SELECT * FROM table1;

# 기존테이블 삭제(테이블 존재시)
DROP TABLE IF EXISTS day_visitor_realtime;
# 테이블 생성
CREATE TABLE IF NOT EXISTS day_visitor_realtime(
ipaddress varchar(16),
iptime_first datetime,
before_url varchar(250),
device_info varchar(40),
os_info varchar(40),
session_id varchar(80));

# 데이터 타입의 길이에 맞게 데이터를 삽입할 때
INSERT INTO day_visitor_realtime(
	ipaddress, iptime_first, before_url, device_info
)
VALUES ('192.168.0.1', '2023-02-23 11:37:28', 'localhost', 'PC')
     , ('192.168.0.1', '2023-02-23 11:37:28', 'localhost', 'PC');
     
SELECT * FROM day_visitor_realtime;
DESC day_visitor_realtime;

#데이터 타입의 길이를 초과해서 데이터를 삽입할 때 error남
INSERT INTO day_visitor_realtime(
	ipaddress, iptime_first, before_url, device_info
)
VALUES ('12345678901234567', '2023-02-23 11:37:28', 'localhost', 'PC');
# varchar(16)에 17자리의 값을 넣어서 에러 발생
SELECT * FROM day_visitor_realtime;
DESC day_visitor_realtime;

# 데이터 삽입하기
INSERT INTO `python`.`day_visitor_realtime` (`session_id`) VALUES ('12345.567890');
INSERT INTO `python`.`day_visitor_realtime` (`session_id`) VALUES ('1234.567890');
INSERT INTO `python`.`day_visitor_realtime` (`session_id`) VALUES ('123');
INSERT INTO `python`.`day_visitor_realtime` (`session_id`) VALUES ('1234');
INSERT INTO `python`.`day_visitor_realtime` (`session_id`) VALUES ('12345');
SELECT * FROM day_visitor_realtime;

DELETE FROM day_visitor_realtime;
SELECT * FROM day_visitor_realtime;

# NOT NULL
DROP TABLE IF EXISTS day_visitor_realtime;
CREATE TABLE IF NOT EXISTS day_visitor_realtime(
ipaddress varchar(16) NOT NULL,
iptime_first datetime,
before_url varchar(250),
device_info varchar(40),
os_info varchar(40),
session_id varchar(80));
SELECT * FROM day_visitor_realtime;
DESC day_visitor_realtime;

#INSERT시 값을 넣지 않게되면 NULL로서 표시된다
INSERT INTO day_visitor_realtime (
ipaddress, iptime_first, before_url, device_info, os_info
/*session_id*/
)
VALUES (
'asdf', NOW(), 'aa', 'asdf', 'aa'
);
SELECT * FROM day_visitor_realtime;

 # NOT NULL컬럼에 값을 넣지 않으면 오류가 발생한다
INSERT INTO day_visitor_realtime (
/*ipaddress*/
iptime_first, before_url, device_info, os_info
/*session_id*/
)
VALUES (
NOW(), 'aa', 'asdf', 'aa'
);
# Error Code: 1364. Field 'ipaddress' doesn't have a default value 오류 발생


/* PRIMARY KEY
- ROW를 고유하게 확인할 수 있는 필드 값(?)
- 기본키는 한 개의 테이블에 하나만 생성가능
- 중복된 값을 가질 수 없으며 NULL값 또한 가질 수 없다
- PRIMARY KEY(컬럼명1, 컬럼명2,...) 와 같이 작성할 수 있음
*/
DROP TABLE IF EXISTS day_visitor_realtime;
CREATE TABLE day_visitor_realtime (
id INT,
ipaddress varchar(16),
iptime_first datetime,
before_url varchar(250),
device_info varchar(40),
os_info varchar(40),
session_id varchar(80),
PRIMARY KEY(id)
);

#PRIMARY KEY에 같은 값을 두번 넣으면 오류가 발생
INSERT INTO day_visitor_realtime (
id, ipaddress, iptime_first, before_url, device_info, os_info
/*session_id*/
)
VALUES (1, 'asdf', NOW(), 'aa', 'asdf', 'aa')
, (1, 'asdf2', NOW(), 'aa2', 'asdf2', 'aa2');
# Error Code: 1062. Duplicate entry '1' for key 'PRIMARY' 오류 발생

# FOREIGN KEY
/* - 외래키는 참조하는 테이블의 컬럼에 존재하는 값만 사용하는 제약조건
   - 참조할 수 있는 컬럼은 참조하는 테이블의 기본키이거나 UNIQUE한 컬럼만 가능 */
CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  order_date DATETIME,
  PRIMARY KEY(order_id)
);

INSERT INTO orders VALUES(1, 1, now());
INSERT INTO orders VALUES(2, 1, now());
INSERT INTO orders VALUES(3, 1, now());
SELECT * FROM orders;

CREATE TABLE order_detail (
  order_id INT,
  product_id INT,
  product_name VARCHAR(200),
  order_date DATETIME,
  CONSTRAINT FK_ORDERS_ORDERID FOREIGN KEY (order_id) REFERENCES orders(order_id),
  PRIMARY KEY(order_id, product_id)
);
INSERT INTO order_detail (order_id, product_id, product_name)
VALUES (1, 100, 'iphone')
	 , (1, 100, 'ipad');

# Datebase와 Tables
# Database는 하나 이상ㅇ의 Table을 가지고 있고
---------------------------------------------------------------------------------
# Sample database 활용하기
use employees;

# 테이블 departments의 모든 컬럼에 대한 조회 
select *
from departments;

# select distinct문
# 해당 컬럼의 서로 다른 유일한 값만 추려서 result-set을 반환
select distinct dept_no, dept_name
from departments;
# titles 테이블의 titles 컬럼이 갖는 데이터를 보면 중복이 많이 발생하는 것을 확인할 수 있다.
select *
from titles;

select distinct title
from titles;

# SELECT WHERE절
# WHERE절은 데이터를 필터링하고 싶을 때 사용합니다.





# GROUP BY절
select title, count(*)
  from titles
 where to_date = '9999-01-01'   # 현재의 title 
 group by title
 ;
 # HAVING절
 select title, count(*)
  from titles
 where to_date = '9999-01-01'   # 현재의 title 
 group by 1
 having count(*) < 10
 ;
 
