# mysql 데이터베이스에
# user 테이블.
#---------------------------
# 데이터베이스 사용자 테이블 명세 확인.
desc mysql.user;
describe mysql.user;
show full columns from mysql.user;

# 데이터베이스 사용자 테이블 데이터 조회하기
select Host, User
  from mysql.user;
select Host, User from mysql.user;
select * from mysql.user;

#데이터베이스 사용자 만들기
create user 'test'@'localhost' identified by '1234';
# 어디서든 접속(%) 가능한 사용자 만들기
create user 'anywhere'@'%'identified by '1234';
select user, host from mysql.user;
# 특정 IP대역(192.168.0.%)에서만 접속 가능한 사용자 만들기
create user 'test2'@'192.168.0.%' identified by '1234';
select user, host from mysql.user;

# 데이터베이스 조건에 따라 사용자 만들기
# OR REPLACE라는 조건을 달면, 기존 사용자를 삭제하고 다시 만든다.
create or replace user 'test'@'localhost' identified by '1234';
select user, host from mysql.user;
# IF NOT EXISTS 조건을 붙이면, 같은 이름의 사용자가 없을때만 사용자를 추가한다.
create user if not exists 'test'@'localhost' identified by '1234';
select user, host from mysql.user;

# 데이터베이스 사용자 이름 변경하기
rename user 'test2'@'192.168.0.%' to 'test3'@'%';
select user, host from mysql.user;

# 데이터베이스 사용자 비밀번호 변경하기
set password for 'test3'@'%' = password('12345');
select user, host, password from mysql.user;

# 데이터베이스 사용자 삭제하기
drop user 'test3'@'%';

# 데이터베이스 사용자 조건에 따라 삭제하기
drop user if exists 'anywhere'@'%';

# 데이터베이스 권한 부여하기
# 기존 권한 확인
show grants for 'test'@'localhost';
grant all privileges on test.* to 'test'@'localhost';
flush privileges;

# 데이터베이스 목록 조회하기
show databases;

show grants for 'test'@'localhost';
# 데이터베이스 test라는 이름으로 생성
create database test; 

# 데이터베이스 권한 확인하기
revoke all on test.*from 'test'@'localhost';
flush privileges;
show grants for 'test'@'localhost';
show databases;

# 데이터베이스 조건에 따라 생성하기
create database if not exists test;

# 데이터베이스 특수한 이름 명명하기
create database `test.test`;
drop database `test.test`; 
show databases;

# 테이블 만들기 준비
create database python;
use python;

# table1이란 명칭의 테이블을 만듭니다. Column이 하나도 없으면 테이블이 만들어지지 않음.
create table table1 (column1 varchar(100));
# 현재 사용중인 데이터베이스 확인하는 명령어
select database();
# 테이블 목록 조회
show tables;
# 테이블 이름 변경하기
rename table table1 to table2;
show tables;
# 테이블 삭제하기 
drop table table2;
show tables;

# 테이블 생성하기
CREATE TABLE test_table(
test_column1 INT,
test_column2 INT,
test_column3 INT
);
DESC test_table;

# 테이블에 Column 추가하기
ALTER TABLE test_table
ADD test_column4 INT;
DESC test_table;

# 테이블에 여러개의 Column 한 번에 추가하기
ALTER TABLE test_table
ADD(
test_column5 INT,
test_column6 INT,
test_column7 INT
);
DESC test_table;

# 테이블에 Column 삭제하기
ALTER TABLE test_table
DROP test_column1;
DESC test_table;

# 테이블에 Column 순서 변경하기
ALTER TABLE test_table
MODIFY test_column7 INT
FIRST;
DESC test_table;

# 테이블에서 순서 변경 시 특정 열 뒤로 이동하고 싶다면 AFTER 명령어 사용
ALTER TABLE test_table
MODIFY test_column7 INT
AFTER test_column6;
DESC test_table;

# test_column2를 test_column0으로 이름을 변경 
ALTER TABLE test_table
CHANGE test_column2 test_column0 INT;
DESC test_table;

# 테이블 Column 데이터 타입 변경하기
ALTER TABLE test_table
CHANGE test_column0 test_column0 VARCHAR(10);
DESC test_table;

# 테이블 Column 이름과 데이터 타입 동시에 변경하기
ALTER TABLE test_table
CHANGE test_column0 test_column2 INT;
DESC test_table;



