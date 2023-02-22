# mysql 데이터베이스에
# user 테이블.
desc mysql.user;
describe mysql.user;

show full columns from mysql.user;


select Host, User
  from mysql.user;
select Host, User from mysql.user;
select * from mysql.user;


create user 'test'@'localhost' identified by '1234';

create user 'anywhere'@'%'identified by '1234';
select user, host from mysql.user;

create user 'test2'@'192.168.0.%' identified by '1234';
select user, host from mysql.user;

create or replace user 'test'@'localhost' identified by '1234';
select user, host from mysql.user;

create user if not exists 'test'@'localhost' identified by '1234';
select user, host from mysql.user;

rename user 'test2'@'192.168.0.%' to 'test3'@'%';
select user, host from mysql.user;

set password for 'test3'@'%' = password('12345');
select user, host, password from mysql.user;
drop user 'test3'@'%';

drop user if exists 'anywhere'@'%';

show grants for 'test'@'localhost';
grant all privileges on test.* to 'test'@'localhost';
flush privileges;
# 데이터베이스 목록 조회
show databases;

show grants for 'test'@'localhost';
# 데이터베이스 test라는 이름으로 생성
create database test; 

revoke all on test.*from 'test'@'localhost';
flush privileges;
show grants for 'test'@'localhost';
show databases;

create database if not exists test;
create database `test.test`;
drop database `test.test`;
show databases;
# 테이블 만들기
create database python;
use python;

# table1이란 명칭의 테이블을 만듭니다. Column이 하나도 없으면 테이블이 만들어지지 않음.
create table table1 (column1 varchar(100));
# 현재 사용중인 데이터베이스 
select database();
# 테이블 목록 조회
show tables;

rename table table1 to table2;
#테이블 목록 조회
show tables;

drop table table2;
show tables;

CREATE TABLE test_table(
test_column1 INT,
test_column2 INT,
test_column3 INT
);
DESC test_table;

ALTER TABLE test_table
ADD test_column4 INT;
DESC test_table;

ALTER TABLE test_table
ADD(
test_column5 INT,
test_column6 INT,
test_column7 INT
);
DESC test_table;

ALTER TABLE test_table
DROP test_column1;
DESC test_table;

ALTER TABLE test_table
MODIFY test_column7 INT
FIRST;
DESC test_table;

ALTER TABLE test_table
MODIFY test_column7 INT
AFTER test_column6;
DESC test_table;

ALTER TABLE test_table
CHANGE test_column2 test_column0 INT;
DESC test_table;

ALTER TABLE test_table
CHANGE test_column0 test_column0 VARCHAR(10);
DESC test_table;

ALTER TABLE test_table
CHANGE test_column0 test_column2 INT;
DESC test_table;



