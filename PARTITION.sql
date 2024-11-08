CREATE DATABASE BIT_PARTITION;
USE BIT_PARTITION;

CREATE TABLE BIT_COURSE(
COURSE_NAME VARCHAR(50),
COURSE_ID INT(10),
COURSE_TITLE VARCHAR(60),
COURSE_DESC VARCHAR(60),
LAUNCH_DATE DATE,
COURSE_FEE INT,
COURSE_MENTOR VARCHAR(60),
COURSE_LAUNCH_YEAR INT);

insert into bit_course values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019); 

SELECT * FROM BIT_COURSE;
SELECT * FROM BIT_COURSE WHERE COURSE_LAUNCH_YEAR = 2019;

#PARTITION BY RANGE
CREATE TABLE BIT_COURSE1(
COURSE_NAME VARCHAR(50),
COURSE_ID INT(10),
COURSE_TITLE VARCHAR(60),
COURSE_DESC VARCHAR(60),
LAUNCH_DATE DATE,
COURSE_FEE INT,
COURSE_MENTOR VARCHAR(60),
COURSE_LAUNCH_YEAR INT)
PARTITION BY RANGE(COURSE_LAUNCH_YEAR)(
PARTITION P0 VALUES LESS THAN (2019),
PARTITION P1 VALUES LESS THAN (2020),
PARTITION P2 VALUES LESS THAN (2021),
PARTITION P3 VALUES LESS THAN (2022),
PARTITION P4 VALUES LESS THAN (2023));

insert into bit_course1 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019); 

SELECT * FROM BIT_COURSE1;

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'BIT_COURSE1';

SELECT * FROM BIT_COURSE1 PARTITION(P0,P1,P2,P3,P4);
SELECT * FROM BIT_COURSE1 PARTITION(P1);


#PARTITION BY HASH
CREATE TABLE BIT_COURSE2(
COURSE_NAME VARCHAR(50),
COURSE_ID INT(10),
COURSE_TITLE VARCHAR(60),
COURSE_DESC VARCHAR(60),
LAUNCH_DATE DATE,
COURSE_FEE INT,
COURSE_MENTOR VARCHAR(60),
COURSE_LAUNCH_YEAR INT)
PARTITION BY HASH(COURSE_LAUNCH_YEAR)
PARTITIONS 5;

insert into bit_course2 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);

SELECT * FROM BIT_COURSE2; 

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'BIT_COURSE2';

SELECT * FROM BIT_COURSE2 PARTITION(P1);
SELECT * FROM BIT_COURSE2 PARTITION(P0,P1,P2,P3,P4);

#PARTITION BY KEY
CREATE TABLE BIT_COURSE3(
COURSE_NAME VARCHAR(50),
COURSE_ID INT(10) PRIMARY KEY,
COURSE_TITLE VARCHAR(60),
COURSE_DESC VARCHAR(60),
LAUNCH_DATE DATE,
COURSE_FEE INT,
COURSE_MENTOR VARCHAR(60),
COURSE_LAUNCH_YEAR INT)
PARTITION BY KEY()
PARTITIONS 10;

insert into bit_course3 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 111 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 112 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 113 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 114 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 115 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);

SELECT * FROM BIT_COURSE3; 
SELECT * FROM BIT_COURSE3 PARTITION(P1);

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'BIT_COURSE3';

#PARTITION BY LIST
CREATE TABLE BIT_COURSE4(
COURSE_NAME VARCHAR(50),
COURSE_ID INT(10),
COURSE_TITLE VARCHAR(60),
COURSE_DESC VARCHAR(60),
LAUNCH_DATE DATE,
COURSE_FEE INT,
COURSE_MENTOR VARCHAR(60),
COURSE_LAUNCH_YEAR INT)
PARTITION BY LIST(COURSE_LAUNCH_YEAR)(
PARTITION P0 VALUES IN (2019,2020),
PARTITION P1 VALUES IN (2022,2021)
)

insert into bit_course4 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);

SELECT * FROM BIT_COURSE4; 

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'BIT_COURSE4';


#partition by range columns
CREATE TABLE BIT_COURSE5(
COURSE_NAME VARCHAR(50),
COURSE_ID INT(10),
COURSE_TITLE VARCHAR(60),
COURSE_DESC VARCHAR(60),
LAUNCH_DATE DATE,
COURSE_FEE INT,
COURSE_MENTOR VARCHAR(60),
COURSE_LAUNCH_YEAR INT)
PARTITION BY RANGE COLUMNS(COURSE_NAME,COURSE_LAUNCH_YEAR)(
PARTITION P0 VALUES LESS THAN ('AIOPS',2019),
PARTITION P1 VALUES LESS THAN ('FSDS',2020),
PARTITION P2 VALUES LESS THAN ('MERN',2021)
)

insert IGNORE into bit_course5 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);

SELECT * FROM BIT_COURSE5;

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'BIT_COURSE5';

SELECT * FROM BIT_COURSE1 PARTITION(P1);
SELECT * FROM BIT_COURSE1 PARTITION(P2);

#SUBPARTITIONING
CREATE TABLE BIT_COURSE6(
COURSE_NAME VARCHAR(50),
COURSE_ID INT(10),
COURSE_TITLE VARCHAR(60),
COURSE_DESC VARCHAR(60),
LAUNCH_DATE DATE,
COURSE_FEE INT,
COURSE_MENTOR VARCHAR(60),
COURSE_LAUNCH_YEAR INT)
PARTITION BY RANGE(COURSE_LAUNCH_YEAR)
SUBPARTITION BY HASH(COURSE_LAUNCH_YEAR)
SUBPARTITIONS 5(
PARTITION P0 VALUES LESS THAN (2019),
PARTITION P1 VALUES LESS THAN (2020),
PARTITION P2 VALUES LESS THAN (2021),
PARTITION P3 VALUES LESS THAN (2022));

insert IGNORE into bit_course6 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'jalpa',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'jalpa',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'jalpa',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'jalpa',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'jalpa',2019);


SELECT * FROM bit_course6;

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'BIT_COURSE6';