#WINDOW FUNCTIONS 
CREATE DATABASE WIN1_FUN;
USE WIN1_FUN;
CREATE TABLE BIT_STUDENTS(
STUDENT_ID INT,
STUDENT_BATCH VARCHAR(40),
STUDENT_NAME VARCHAR(40),
STUDENT_STREAM VARCHAR(30),
STUDENS_MARKS INT,
STUDENT_MAIL_ID VARCHAR(50));

INSERT INTO BIT_STUDENTS VALUES(100,'FSDA','SAURABH','CS',80,'SAURABH@GMAIL.COM'),
(102,'FSDA','SANKET','CS',81,'SANKET@GMAIL.COM'),
(103,'FSDA','SHYAM','CS',80,'SHYAM@GMAIL.COM'),
(104,'FSDA','SANKET','CS',82,'SANKET@GMAIL.COM'),
(105,'FSDA','SHYAM','ME',67,'SHYAM@GMAIL.COM'),
(106,'FSDS','AJAY','ME',45,'AJAY@GMAIL.COM'),
(106,'FSDS','AJAY','ME',78,'AJAY12@GMAIL.COM'),
(108,'FSDS','SNEHAL','CI',89,'SNEHAL@GMAIL.COM'),
(109,'FSDS','MANISHA','CI',34,'MANISHA@GMAIL.COM'),
(110,'FSDS','RAKESH','CI',45,'RAKESH@GMAIL.COM'),
(111,'FSDE','ANUJ','CI',43,'ANUJ@GMAIL.COM'),
(112,'FSDE','MOHIT','EE',67,'MOHIT@GMAIL.COM'),
(113,'FSDE','VIVEK','EE',23,'VIVEK@GMAIL.COM'),
(114,'FSDE','GAURAV','EE',45,'GAURAV@GMAIL.COM'),
(115,'FSDE','PRATEEK','EE',89,'PRATEEK@GMAIL.COM'),
(116,'FSDE','MITHUN','ECE',23,'MITHUN@GMAIL.COM'),
(117,'FSBC','CHAITRA','ECE',23,'CHAITRA@GMAIL.COM'),
(118,'FSBC','PRANAY','ECE',45,'PRANAY@GMAIL.COM'),
(119,'FSBC','SANDEEP','ECE',65,'SANDEEP@GMAIL.COM'),
(119,'FSDS','JALPA','EC',60,'JALPA@GMAIL.COM');

SELECT * FROM BIT_STUDENTS;
SELECT * FROM BIT_STUDENTS WHERE STUDENS_MARKS = (SELECT MAX(STUDENS_MARKS) FROM BIT_STUDENTS);

SELECT STUDENT_BATCH, MAX(STUDENS_MARKS) AS HIGHEST_MARKS
FROM BIT_STUDENTS
GROUP BY STUDENT_BATCH;

SELECT STUDENT_ID, STUDENT_BATCH, STUDENT_STREAM, STUDENS_MARKS, 
ROW_NUMBER() OVER(PARTITION BY STUDENS_MARKS) AS
'ROW_NUMBER' FROM BIT_STUDENTS;

SELECT STUDENT_ID, STUDENT_BATCH, STUDENT_STREAM, STUDENS_MARKS, 
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENS_MARKS DESC) AS
'ROW_NUMBER' FROM BIT_STUDENTS;

SELECT * FROM (SELECT STUDENT_ID, STUDENT_BATCH, STUDENT_STREAM, STUDENS_MARKS, 
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENS_MARKS DESC) AS
'ROW_NUM' FROM BIT_STUDENTS) AS TEST WHERE ROW_NUM = 3;


SELECT STUDENT_ID, STUDENT_BATCH, STUDENT_STREAM, STUDENS_MARKS, 
ROW_NUMBER() OVER(ORDER BY STUDENS_MARKS DESC) AS 'ROW_NUMBER', 
RANK() OVER(ORDER BY STUDENS_MARKS DESC) AS 'ROW_RANK' 
FROM BIT_STUDENTS;

SELECT STUDENT_ID, STUDENT_BATCH, STUDENT_STREAM, STUDENS_MARKS, 
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENS_MARKS DESC) AS 'ROW_NUMBER',
RANK() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENS_MARKS DESC) AS 'ROW_RANK' 
FROM BIT_STUDENTS;

SELECT * FROM (SELECT STUDENT_ID, STUDENT_BATCH, STUDENT_STREAM, STUDENS_MARKS, 
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENS_MARKS DESC) AS 'ROW_NUMBER',
RANK() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENS_MARKS DESC) AS 'ROW_RANK', 
DENSE_RANK() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENS_MARKS DESC) AS 'DENSE_RANK' 
FROM BIT_STUDENTS) AS TEST WHERE 'DENSE_RANK' < 5;

SELECT STUDENT_ID, STUDENT_BATCH, STUDENT_STREAM, STUDENS_MARKS,
RANK() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENS_MARKS DESC) AS 'ROW_RANK',
PERCENT_RANK() OVER (PARTITION BY STUDENT_BATCH ORDER BY STUDENS_MARKS DESC) AS 'PERCENT_RANK'
FROM BIT_STUDENTS;

#NTILE FOR EVEN 
CREATE TABLE STUDENT(
ID INT PRIMARY KEY,
NAME VARCHAR (255),
PERCENTAGE INT);

INSERT INTO STUDENT VALUES
(1,'ATUL',90),
(2,'VISHAL',91),
(3,'SAILESH',3),
(4,'NIRAJ',92),
(5,'CHETAN',89),
(6,'SANGRAM',87),
(7,'ROHIT',87),
(8,'PRASHANT',93),
(9,'RAVI',91),
(10,'AKANSHA',94);

SELECT * FROM STUDENT;

SELECT ID, NAME, PERCENTAGE, NTILE(5) OVER (ORDER BY PERCENTAGE DESC) AS NTILEGROUP FROM STUDENT;

#NTILE FOR ODD
CREATE TABLE STUDENT1(
ID INT PRIMARY KEY,
NAME VARCHAR (255),
PERCENTAGE INT);

INSERT INTO STUDENT1 VALUES
(1,'ATUL',90),
(2,'VISHAL',91),
(3,'SAILESH',3),
(4,'NIRAJ',92),
(5,'CHETAN',89),
(6,'SANGRAM',87),
(7,'ROHIT',87),
(8,'PRASHANT',93),
(9,'RAVI',91),
(10,'AKANSHA',94),
(11,'FALAK',86);

SELECT * FROM STUDENT1;

SELECT ID, NAME, PERCENTAGE, NTILE(5) OVER (ORDER BY PERCENTAGE DESC) AS NTILEGROUP1 FROM STUDENT1;

#NTILE ODD AND EVEN WITH PARTITION 
CREATE TABLE STUDENTP(
ID INT PRIMARY KEY,
NAME VARCHAR (255),
SUBJECT VARCHAR(20),
PERCENTAGE INT);

INSERT INTO STUDENTP VALUES
(1,'ATUL','ENGLISH',90),
(2,'VISHAL','ENGLISH',91),
(3,'SAILESH','ENGLISH',3),
(4,'NIRAJ','ENGLISH',92),
(5,'CHETAN','ENGLISH',89),
(6,'SANGRAM','ENGLISH',87),
(7,'ROHIT','MATH',87),
(8,'PRASHANT','MATH',93),
(9,'RAVI','MATH',91),
(10,'AKANSHA','MATH',94),
(11,'FALAK','MATH',86),
(12,'AVNI','MATH',73);

SELECT * FROM STUDENTP;

SELECT ID, NAME, SUBJECT, PERCENTAGE, 
NTILE(2) OVER (PARTITION BY SUBJECT ORDER BY PERCENTAGE DESC) AS
NTILEGROUPP FROM STUDENTP;

SELECT ID, NAME, SUBJECT, PERCENTAGE, 
NTILE(3) OVER (PARTITION BY SUBJECT ORDER BY PERCENTAGE DESC) AS
NTILEGROUPP FROM STUDENTP;

CREATE TABLE STUDENTP1(
ID INT PRIMARY KEY,
NAME VARCHAR (255),
SUBJECT VARCHAR(20),
PERCENTAGE INT);

INSERT INTO STUDENTP1 VALUES
(1,'ATUL','ENGLISH',90),
(2,'VISHAL','ENGLISH',91),
(3,'SAILESH','ENGLISH',3),
(4,'NIRAJ','ENGLISH',92),
(5,'CHETAN','ENGLISH',89),
(6,'SANGRAM','ENGLISH',87),
(7,'ROHIT','MATH',87),
(8,'PRASHANT','MATH',93),
(9,'RAVI','MATH',91),
(10,'AKANSHA','MATH',94),
(11,'FALAK','MATH',86),
(12,'AVNI','MATH',73),
(13,'AADESH','ENGLISH',83),
(14,'RANJANA','MATH',94);

SELECT * FROM STUDENTP1;

SELECT ID, NAME, SUBJECT, PERCENTAGE, 
NTILE(2) OVER (PARTITION BY SUBJECT ORDER BY PERCENTAGE DESC) AS
NTILEGROUPP1 FROM STUDENTP1;