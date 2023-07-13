use firstdb;
UPDATE studentdata SET id=1 WHERE studentname='john';
SELECT * from studentdata;
DELETE FROM studentdata WHERE studentname='john';


#ALTER: Add new column dateofbirth

ALTER TABLE Studentdata
ADD COLUMN DateOFBirth DATE;

select * from StudentData;
UPDATE  StudentData
SET DateOfBirth='1993-07-14'
where id=2;
SET SQL_SAFE_UPDATES=0;
INSERT INTO StudentData values(5,'Alice','1998/08/08');

INSERT INTO StudentData values(1,'Anna','1991/08/07');
select * from StudentData;
DELETE FROM StudentData where id=5;

select * from StudentData;
ALTER TABLE Studentdata
ADD COLUMN AssessmentScore float;

UPDATE StudentData
SET AssessmentScore=85.5
WHERE id=1;
UPDATE StudentData
SET AssessmentScore=90.5
WHERE id=2;
UPDATE StudentData
SET AssessmentScore=81.5
WHERE id=3;
UPDATE StudentData
SET AssessmentScore=89
WHERE id=4;
UPDATE StudentData
SET AssessmentScore=96
WHERE id=5;

# alter + change

ALTER TABLE StudentData
CHANGE COLUMN DateOFBirth DOB Date;

# Rename table name 
RENAME TABLE StudentData to StudentDetails;

#Delete 4th row 

DELETE FROM StudentDetails
where id=4;

select * from StudentDetails;
describe studentdetails;
select studentname as sname;

alter table studentdetails
change column studentname   sname varchar(20);

Use firstdb;

ALTER TABLE  StudentDetails
ADD COLUMN age int;
DESCRIBE StudentDetails;

SELECT * FROM StudentDetails;
select assessmentscore from Studentdetails where assessmentscore>50 AND assessmentscore<10;
select assessmentscore from Studentdetails where assessmentscore>50 OR assessmentscore<10;
SELECT SNAME FROM STUDENTDETAILS WHERE NOT SNAME='JOHN';
SELECT * FROM STUDENTDETAILS WHERE ASSESSMENTSCORE BETWEEN 80 AND 90;
SELECT * FROM STUDENTDETAILS WHERE ASSESSMENTSCORE BETWEEN 80 AND 90;
SELECT * FROM STUDENTDETAILS WHERE ASSESSMENTSCORE IN (60,80,90);
SELECT * FROM STUDENTDETAILS WHERE ASSESSMENTSCORE NOT IN (60,80,90);

SELECT DISTINCT SNAME
FROM STUDENTDETAILS;
select * FROM STUDENTDETAILS WHERE SNAME LIKE 'J%';

select * FROM STUDENTDETAILS WHERE SNAME LIKE '%J';
select * FROM STUDENTDETAILS WHERE SNAME LIKE '%J%';





CREATE TABLE Dept
(
DeptId int primary key,
Deptname varchar(30),
Location varchar(30)

);
CREATE TABLE EMP
(
EMPID int primary key,
EmpName varchar(30),
Salary float,
job varchar(30),
HireDate date,
DeptId int,
FOREIGN KEY(DeptId)REFERENCES Dept(DeptID)
);
DESC Dept;
Desc 

INSERT INTO DEPT VALUES(10,'Research','Chennai'),(20,'Admin','Gujrat'),(30,'Sale','Mumbai'),(40,'Account','Pune'),(50,'Purchse','');

INSERT INTO EMP VALUES(1,'John',20000,'Clerk','2021-12-15',null),(2,'Alice',49000,'Saleman','2023-03-30',30),
(3,'Anna',35000,'Admin','2022-09-29',20),(4,'Smith',90000,'Manager','2018-02-23',40),(5,'William',45000,'Analyst','2020-12-11',10),
(6,'Kiya',50000,'FinanceManager','2020-12-10',40),(7,'Rohan',60000,'SalesHead','2022-12-16',30),(8,'Kavya',60000,'AdminHead','2022-12-16',null);

SELECT * FROM DEPT;
select * from dept
where deptid=40;

SELECT * FROM EMP
WHERE ENAME LIKE 'A%';
SELECT * FROM EMP
order by salary desc;

#INNER JOIN COMMON DATA BETWEEN 2 TABLES
SELECT * FROM 
EMP INNER JOIN DEPT
ON EMP.DeptId=Dept.DeptID;
# LEFT OUTER JOIN : Common data between 2 tables+ full left side table
Select * from 
EMP LEFT OUTER JOIN Dept
ON EMP.DeptID=Dept.DeptID;
#RIGHT OUTER JOIN :Common data between 2 tables +full right side table
SELECT * from 
EMP RIGHT OUTER JOIN DEPT
ON EMP.DeptID=DEPT.DEptID;
Select * from dept;
select * from emp;
Select EMP.EmpID,EMP.EmpName,DEPT.DeptID,DEPT.DeptName FROM 
EMP RIGHT OUTER JOIN DEPT
ON EMP.DeptID=Dept.DeptID;
CREATE DATABASE 9369_laxmi;
use 9369_laxmi;
CREATE TABLE EMP

CREATE TABLE EMP1 
(
EMPID INT PRIMARY KEY,
EMPNAME VARCHAR(20) NOT NULL,LOCATION VARCHAR(30),
SALARY FLOAT CHECK(SALARY>50000),
DESIGNATION VARCHAR(30)UNIQUE,
HIREDATE DATE 
);
DESCRIBE EMP1;
INSERT INTO EMP1 VALUES(101,'Martin','UK',120000,'TestLead','2022-12-12'),
(102,'Smith','India',126000,'Developer Lead','2022-10-26'),
(103,'Allen','India',89000,'Sr.Tester','2023-05-16'),
(104,'Ward','Paris',78000,'Jr.Tester','2023-04-20'),
(105,'Scott','UK',90000,'Sr.developer','2023-02-21');
INSERT INTO EMP1 VALUES (106,'Alice','USA',90000,'Sr.Designer','2023-02-21'),(107,'Bob','Canada',100000,'Design Lead','2023-02-21');
INSERT INTO EMP1 VALUES (108,'Anna','New Zealand',115000,'DeploymentTeam','2023-06-21'),(109,'John','USA',75000,'BA','2023-01-01'),(110,'Smith','Canada',200000,'ProjectLead','2022-12-15');

SELECT * FROM EMP1 
WHERE EMPID=102;

SELECT * FROM EMP1 
WHERE Salary>100000;

SELECT * FROM EMP1 
WHERE Location='India';

SELECT * FROM EMP1 
WHERE Hiredate > '2023-02-28';

SELECT * FROM EMP1 
ORDER BY Salary ;

SELECT * FROM EMP1 
ORDER BY Salary DESC;
#Logical Operators
#AND 
SELECT * FROM EMP1 
WHERE Location='India' AND Designation='Sr.Tester';

SELECT * FROM EMP1 
WHERE Location='India' OR Location='UK';

SELECT * FROM EMP1 
WHERE Location='India' AND Salary>=100000;

SELECT * FROM EMP1 
WHERE Location='India' OR  Salary>=100000 OR EMPName='Ward';

SELECT * FROM EMP1 
WHERE  Location !='UK';

SELECT * FROM EMP1 
WHERE NOT  Location ='UK';

#Arithmetic Operators
#Display employee data with 2000 hike
SELECT EMPID,EMPName, Salary,Salary +2000 AS 'Salary with 20000 hike' FROM EMP1;

#Display Empname with 500 deduction 
SELECT EMPName, Salary, Salary-500 As'Deduction' FROM EMP1; 

#Display Empname with monthly and Annual Salary 
SELECT EMPName, Salary AS'Monthly Salary', Salary*12 As 'Annual Salary ' FROM EMP1;

#Display Empname with 15days salary 
SELECT EMPName, Salary, Salary/2 As'15Days Salary' FROM EMP1;

#Display Empname with salary with 30% hike
SELECT EMPName, Salary, Salary+(Salary*30)/100 AS '30% Hike'FROM EMP1;

#Relation Operators
#IN
SELECT * FROM EMP1 
WHERE location IN('Paris', 'Canada','USA');

SELECT * FROM EMP1 
WHERE location NOT IN('Paris', 'Canada','USA')
ORDER BY Salary;

SELECT * FROM EMP1 
WHERE Salary BETWEEN 70000 AND 90000
ORDER BY Salary DESC;

SELECT * FROM EMP1 
WHERE EMPName LIKE 'A%';

SELECT * FROM EMP1 
WHERE EMPName LIKE 'A__';

SELECT * FROM EMP1 ;

SELECT * FROM EMP1
WHERE EMPName LIKE '%O%';

SELECT * FROM EMP1
WHERE EMPName LIKE 'O_';

SELECT * FROM EMP
WHERE EMPName LIKE '%a'
#Single Row Functions
SELECT UPPER('edubridge');
SELECT EMPID,UPPER(EMPName) AS'EMPName'  FROM EMP1;

SELECT LOWER('EduBridge');
SELECT LOWER(Job) 'Job'FROM EMP;

SELECT INITCAP(EMPName) FROM EMP1; # Edubridge Infotech

SELECT CONCAT('ABC','XYZ') ;
SELECT CONCAT(EMPName, EMPID) FROM EMP1;

SELECT REPLACE('Jack','J','H');
SELECT REPLACE('Manual Testing','Manual','Automation');
SELECT REPLACE ('Ward','W','J') FROM EMP1
WHERE EMPID=101;
SELECT REPLACE ('Ward','d','12') FROM EMP1
WHERE EMPID=101;

SELECT SUBSTR(salary,1,2) FROM EMP1;

SELECT ROUND(75.7);
SELECT ROUND(Salary) FROM EMP1;

SELECT SQRT(225);
SELECT SQRT(Salary) FROM EMP1;

SELECT MOD(25,9);
SELECT MOD(Salary,2) FROM EMP1;

SELECT * FROM EMP1;
CREATE TABLE CustomerData (
    CustomerID INT(11) PRIMARY KEY,
    CustomerName VARCHAR(30) NOT NULL,
    ProductName VARCHAR(30) NOT NULL,
    OrderDate DATE NOT NULL,
    Price FLOAT NOT NULL,
    Location VARCHAR(30) NOT NULL,
    StatusOfOrder VARCHAR(50) NOT NULL
);

INSERT INTO CustomerData VALUES (1,'Anna','Printer','2023-02-25',5050,'India','Delivered'),
(2,'John','Tv','2023-04-20',90068,'UK','InProgress'),
(3,'Bob','Mobile Phone','2023-03-30',102000,'India','Dispatch'),
(4,'Smith','Laptop','2023-04-24',100000,'Canada','Cancelled'),
(5,'Martin','Laptop','2023-03-25',90500,'India','Delivered'),
(6,'John','Tablet','2023-04-21',90068,'Paris','InProgress'),
(7,'Kiya','Tv','2023-02-20',10000,'UK','Cancelled');

SELECT * FROM CustomerData;

SELECT MAX(Price) FROM CustomerData;

SELECT StatusOfOrder, MAX(Price) FROM CustomerData
GROUP BY StatusOfOrder;


SELECT Location,CustomerName,MAX(Price) FROM CustomerData
GROUP BY Location;

SET SESSION SQL_MODE=(SELECT REPLACE(@@sql_mode ,'ONLY_FULL_GROUP_BY',' '));
# OR
SET GLOBAL SQL_MODE=(SELECT REPLACE(@@sql_mode ,'ONLY_FULL_GROUP_BY',' '));
# OR
SET sql_mode='only_Full_group_By';
# Subquery/Nestedquery: Query inside another query
# Display Highest Price
SELECT MAX(Price) FROM CustomerData;
#OR
SELECT * FROM CustomerData
ORDER BY Price DESC
LIMIT 1;
# Display information of highest price
SELECT * FROM CustomerData
WHERE Price=
(SELECT MAX(Price) FROM CustomerData);


# Display the inforamation of SECOND HIGHEST PRICE
SELECT MAX(Price) AS'Second Highest Price' FROM CustomerData  # Outer Query(Final output) >> 100000
WHERE Price<
(SELECT MAX(Price) FROM CustomerData); # Inner Query >> 102000

#OR

SELECT * FROM CustomerData
ORDER BY Price DESC
LIMIT 1
OFFSET 1;

# Display full information for SECOND HIGHEST Price using Subquery
SELECT * FROM CustomerData
WHERE Price=
(SELECT Max(Price) FROM CustomerData
WHERE Price<
(SELECT Max(Price) FROM CustomerData));

# Display third highest price:
SELECT MAX(Price) FROM CustomerData
WHERE Price<
(SELECT MAX(Price) FROM CustomerData
WHERE Price<
(SELECT MAX(Price) FROM CustomerData));

#OR
SELECT * FROM CustomerData
ORDER BY Price DESC
LIMIT 1
OFFSET 2;

# Display 5th Highest Price
#Subquery
SELECT MAX(Price) FROM CustomerData
WHERE Price<
(SELECT MAX(Price) FROM CustomerData
WHERE Price<
(SELECT MAX(Price) FROM CustomerData
WHERE Price<
(SELECT MAX(Price) FROM CustomerData
WHERE Price<
(SELECT MAX(Price) FROM CustomerData))));

SELECT * FROM CustomerData;

SELECT * FROM CustomerData
ORDER BY Price DESC
LIMIT 1
OFFSET 4;
CREATE TABLE CustomerData (
    CustomerID INT(11) PRIMARY KEY,
    CustomerName VARCHAR(30) NOT NULL,
    ProductName VARCHAR(30) NOT NULL,
    OrderDate DATE NOT NULL,
    Price FLOAT NOT NULL,
    Location VARCHAR(30) NOT NULL,
    StatusOfOrder VARCHAR(50) NOT NULL
);

INSERT INTO CustomerData VALUES (1,'Anna','Printer','2023-02-25',5050,'India','Delivered'),
(2,'John','Tv','2023-04-20',90068,'UK','InProgress'),
(3,'Bob','Mobile Phone','2023-03-30',102000,'India','Dispatch'),
(4,'Smith','Laptop','2023-04-24',100000,'Canada','Cancelled'),
(5,'Martin','Laptop','2023-03-25',90500,'India','Delivered');
INSERT INTO CustomerData VALUES(6,'John','Tablet','2023-04-21',90068,'Paris','InProgress'),
(8,'Mariya','Tv','2023-02-20',10000,'UK','Cancelled');

SELECT * FROM CustomerData;

SELECT MAX(Price) FROM CustomerData;




SELECT StatusOfOrder, MAX(Price) FROM CustomerData
GROUP BY StatusOfOrder;

SELECT Location, CustomerName, MAX(Price) FROM CustomerData
GROUP BY Location;

#ERROR:  SELECT list is not in GROUP BY clause and contains nonaggregated column 
SET sql_mode='only_Full_group_By';
SET GLOBAL SQL_MODE=(SELECT REPLACE(@@sql_mode ,'ONLY_FULL_GROUP_BY',' '));
SET SESSION SQL_MODE=(SELECT REPLACE(@@sql_mode ,'ONLY_FULL_GROUP_BY',' '));

# Min price location wise
SELECT location,CustomerName, MIN(Price) FROM CustomerData
GROUP BY location
HAVING MIN(Price)>=10000;

# Sum of product>> location with customerID and name
SELECT Location,SUM(Price) FROM Customerdata
GROUP BY Location
HAVING SUM(Price) BETWEEN 50000 AND 100000;

# count of product >> location 
SELECT StatusOfOrder,COUNT(ProductName) FROM CustomerData
GROUP BY StatusOfOrder;

SELECT location,COUNT(ProductName) FROM CustomerData
GROUP BY location
HAVING NOT COUNT(ProductName)=3
ORDER BY COUNT(ProductName) DESC;

SELECT Location,AVG(Price) FROM CustomerData
GROUP BY Location
HAVING Location='India';
#self join
SELECT a.empname,b.job
from emp a,emp b;

#cross join
select * from 
emp CROSS JOIN dept


USE 9369_laxmi;
CREATE TABLE DEPT1 
(
DEPTNO INT PRIMARY KEY,
DNAME VARCHAR(30),
LOC VARCHAR(30)
);

CREATE TABLE EMP
(
EMPNO INT PRIMARY KEY,
ENAME VARCHAR(30),
JOB VARCHAR(30),
MGR INT,HIREDATE DATE,SAL INT,
COMM INT,
DEPTNO INT,
FOREIGN KEY(DEPTNO)REFERENCES DEPT1(DEPTNO)
);

INSERT INTO DEPT1 VALUES(10,'ACCOUNTIG','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');
DESCRIBE EMP;

INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,'1980-12-17',800,' ',20);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,'1981-05-20',1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,'1981-05-22',1250,500,30);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,1981-09-28,1250,1400,30);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,' ',30);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,' ',10);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,'1982-12-09',3000,' ',20);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',' ','1981-11-17',5000,' ',10);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,' ',30);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,' ',20);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,'1981-12-03',950,' ',30);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,'1981-12-03',3000,' ',20);
INSERT INTO EMP VALUES(7930,'MILLER','CLERK',7782,'1982-01-23',1300,' ',40);
SELECT * FROM DEPT1;
SELECT * FROM EMP;
select * from 
emp join dept1;
select dname from dept1
union all 
select ename from emp; 
CREATE DATABASE EXAMPLE;
USE EXAMPLE;
CREATE TABLE DEPT1 
(
DEPTNO INT PRIMARY KEY,
DNAME VARCHAR(30),
LOC VARCHAR(30)
);

CREATE TABLE EMP
(
EMPNO INT PRIMARY KEY,
ENAME VARCHAR(30),
JOB VARCHAR(30),
MGR INT,HIREDATE DATE,SAL INT,
COMM INT,
DEPTNO INT,
FOREIGN KEY(DEPTNO)REFERENCES DEPT1(DEPTNO)
);

INSERT INTO DEPT1 VALUES(10,'ACCOUNTIG','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');
DESCRIBE EMP;

INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-05-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-05-22',1250,500,30),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),
(7788,'SCOTT','ANALYST',7566,'1982-12-09',3000,NULL,20),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,NULL,30),
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,null,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
(7930,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,40);
SELECT * FROM EMP 
WHERE SAL=
(SELECT MAX(SAL)FROM EMP);
SELECT * FROM CustomerData
WHERE Price=
(SELECT MAX(Price) FROM CustomerData);


# Display the inforamation of SECOND HIGHEST PRICE
SELECT MAX(SAL) AS'Second Highest SALARY' FROM EMP  # Outer Query(Final output) >> 100000
WHERE SAL<
(SELECT MAX(SAL) FROM EMP); # Inner Qu
SELECT ENAME FROM EMP
WHERE DEPTNO =
(SELECT  DNAME='OPERATIONS' FROM DEPT1 )
GROUP BY ENAME;
SELECT ENAME
  FROM EMP
  WHERE DEPTNO=(SELECT DEPTNO
              FROM DEPT1
              WHERE LOC='BOSTON');
              
SELECT MAX(SAL)  FROM EMP  # Outer Query(Final output) >> 100000
WHERE SAL<
(SELECT SAL FROM EMP WHERE JOB='ANALYST');

SELECT  SAL,ENAME,JOB
  FROM EMP
  WHERE SAL IN
  (SELECT SAL FROM EMP WHERE JOB='ANALYST');
SELECT DNAME FROM DEPT1
WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE HIREDATE='1980-12-17');
SELECT Location,SUM(Price) FROM Customerdata
GROUP BY Location
HAVING SUM(Price) BETWEEN 50000 AND 100000;


SELECT * FROM emp
#WHERE EMPNO IN (SELECT JOB FROM EMP WHERE JOB='MANAGER')
WHERE JOB='MANAGER'
 HAVING SAL BETWEEN 500 AND 3000;
 SELECT DNAME FROM DEPT1
 WHERE DEPTNO IN(SELECT JOB FROM EMP WHERE JOB='MANAGER');
 

  #INNER JOIN COMMON DATA BETWEEN 2 TABLES
SELECT * FROM 
EMP INNER JOIN DEPT1
ON EMP.DEPTNO=Dept1.DEPTNO;
# LEFT OUTER JOIN : Common data between 2 tables+ full left side table
Select * from 
EMP LEFT OUTER JOIN Dept1
ON EMP.DeptNO=Dept1.DeptNO;
#RIGHT OUTER JOIN :Common data between 2 tables +full right side table
SELECT * from 
EMP RIGHT OUTER JOIN DEPT1
ON EMP.DeptNO=DEPT1.DEptNO;
Select * from dept;
select * from emp;
Select EMP.EmpNO,EMP.EName,DEPT1.DeptNO,DEPT1.DNAME FROM 
EMP RIGHT OUTER JOIN DEPT1
ON EMP.DeptNO=Dept1.DeptNO;


SELECT ENAME ,COMM  FROM  emp WHERE comm IN(select comm from emp where comm= (NULLIF(comm,0)));

SELECT * FROM EMP;

#Display the employee number and name for an employee working as a clerk and earning the highest salary among clerks.
SELECT  EMPNO,ENAME,SAL AS 'HIGHEST SALARY IN CLERK' FROM EMP WHERE JOB='CLERK'AND SAL=(SELECT MAX(SAL)FROM EMP WHERE JOB='CLERK');
#Display the names of employees from department number 10 with a salary greater than that of any employee working in other departments.
SELECT * FROM EMP;
SELECT EMPNO,JOB,HIREDATE FROM EMP WHERE SAL>500 AND HIREDATE IN(SELECT HIREDATE FROM EMP WHERE HIREDATE> '1981-01-01' AND HIREDATE < '1981-12-31') ;
SELECT hiredate FROM EMP WHERE Hiredate=EXTRACT(YEAR FROM HIREDATE)='1981';

select user();

create user 'laxmi'@'localhost' identified by 'laxmi';
grant select on *.* to 'laxmi'@'localhost';
grant insert on 9369_laxmi.emp to 'laxmi'@'localhost';
show grants for 'laxmi'@'localhost';

revoke select on *.* from 'laxmi'@'localhost';
revoke insert on 9369_laxmi.emp from 'laxmi'@'localhost';


grant update(ename) on 9369_laxmi.emp to 'laxmi'@'localhost';
show grants for 'laxmi'@'localhost';
create table projects(
ID int primary key,
Name varchar(100),
value decimal(5,2),
StartDate DATE,EndDate DATE);
CREATE TABLE employees(
id int primary key,
Firstname varchar(50),
Lastname varchar(50),
HourlyWage decimal(5,2),
HireDate date);
CREATE TABLE ProjectEmployees(
id int primary key,
ProjectID INT,
EmployeeID INT,
Hours Decimal(5,2),
CONSTRAINT FK_ProjectEmployees_Projects FOREIGN KEY (ProjectID)references Projects(ID),
constraint FK_ProjectEmployees_Employees Foreign key (EmployeeID)references employees(ID));
CREATE TABLE JobOrders(
ID INT PRIMARY KEY,
EMployeeID INT,
ProjectID int,
Description TEXT,
OrderDateTime datetime,
Quantity int,
price decimal(5,2),
constraint FK_JobOrders_projects FOREIGN KEY(PROJECTID)references PROJECTs(ID),
constraint FK_JobOrders_employees FOREIGN KEY(EmployeeID)references Employees(ID));

CREATE TABLE Customers10(
Fname varchar(100),
Industry Varchar(100),

contactpersonID int,

contactperson varchar(255),
contactrole varchar(255),
phonenumber varchar(22),
address varchar(255),
city varchar(255),
zip varchar(5));

drop table  customers10;

ALTER TABLE Customers10 ADD ID INT PRIMARY KEY ;

alter table customers10
rename column contactpersonandrole to contactperson ;

alter table customers10 add column contactrole varchar(50);

alter table customers10
drop column projrct1_feedback;
alter table customers10
drop column project2_feedback ;
alter table customers10
drop column project_ID ;
alter table customers10
drop column contactPeronsID ;
desc customers10;
create table projectFeedback(
ID int primary key,
projectID int,
customerID int,
feedback Text,
foreign key(projectID)references projects(ID),
foreign key(customerID)references customers10(id));
alter table customers10
drop column contactPerons;
alter table customers10
drop column contactrole;
alter table customers10
drop column phonenumber;
create table contactpersons(
id int primary key,
contactperson varchar(100),
contactpersonrole varchar(20),
phonenumber varchar(12));

alter table customers10
add foreign key(contactpersonid)references contactpersons(id);

CREATE table book_det (
bid int primary key,
title varchar(255),
copies int);
create table book_issue(
bid int,
sid int,
btitle varchar(255),
foreign key(bid)references book_det(bid));
insert  into  book_det values(1,'java',9);
insert  into  book_det values(2,'c++',4);
insert  into  book_det values(3,'mysql',10);
insert  into  book_det values(4,'oracle',5);
select * from book_det;

create trigger book_copies_deducts
after INSERT
on book_issue
for each  row
update book_det set copies=copies-1 where bid=new.bid;
insert into book_issue values(2,100,"c++");

select * from book_det;
select * from book_issue;
 create view booddetails As
 select title copies 
 from book_det
 where bid=4;
 select * from booddetails;
create index index_year on emp(hiredate);
drop index index_year on emp;
create index index_ex on emp(salary);
select * from emp;
select * from dept1;
select * from emp
left join dept1 on emp.deptno=dept1.deptno
union all
select * from emp
right join dept1 on emp.deptno=dept1.deptno;
select * from customerdata;
select ename from emp
union
select deptno from dept1
union
select customerID from customerdata;

create database Movie;
use movie;
use filmindustry;
create table Movie(
mov_id int primary key,
mov_title varchar(50),
mov_year varchar(50),
mov_time varchar(50),
mov_lang varchar(50),
mov_release varchar(50));
create table director(
dir_id int primary key,
dir_fname varchar(50),
dir_lname varchar(50));
create table producer(
prod_id int primary key,
mov_id int,
dir_id int,
foreign key(mov_id)references Movie(mov_id),
foreign key(dir_id)references director(dir_id)
);
create table actor(
act_id int primary key,
act_fname varchar(50),
act_lname varchar(50),
act_gender varchar(50));

create table movie_cast(
act_id int,
foreign key(act_id)references actor(act_id),
mov_id int,
foreign key(mov_id)references Movie(mov_id),
cast int);

create table movie_direction
(
dir_id int ,
mov_id int,
foreign key(dir_id)references director(dir_id),
foreign key(mov_id)references Movie(mov_id));

create table reviewer(
rev_id int primary key,
rev_name varchar(50));

create table rating(
mov_id int,
rev_id int,
rev_status varchar(50),
num_of_rating float,
foreign key(mov_id)references Movie(mov_id));

create table genres(
gen_id int primary key,
gen_title varchar(50));

create table movie_genres(
mov_id int,
gen_id int,
foreign key(mov_id)references Movie(mov_id),
foreign key(gen_id)references genres(gen_id));


insert into movie values(101,"ramayan","1994","3HRS","hindi","July_14_1994"),
(102,"mahabharath","2000","3HRS","hindi","august_07_2000"),
(103,"chatrapathi_shivaji","2011","3HRS","marathi","december_22_2011"),
(104,"sher_shivaji","2017","3hrs","marathi","march_7_2017"),
(105,"KGF","2021","2hrs_40min","kannada","june_10_2021");
insert into movie values(106,"padmavathi","2018","2hrs30min","hindi","august_21_2018"),
(107,"kuch_kuck_hota_hai","2005","3hrs","hindi","may_21_2005"),
(108,"sherlock","1993","20hrs","english","feb_05_1993");
insert into movie values(109,"shaandar","2015","2hrs30min","hindi","sep_09_2015");

use filmindustry;
desc movie;
desc director;
insert into director values("201","karan","johar"),
(202,"sanjayleela","bhansali"),
(203,"SS","rajamouli"),
(204,"prashanth","neel"),
(205,"coan","doyle");
insert into director values("207","vikas","bahl");
insert into director values("206","digpal","j");
desc producer;
alter table producer
add column prod_name varchar(50);
insert into producer values("301","101","203","ramesh"),
("302","101","203","vinod"),
("303","105","204","murthy"),
(304,"108","205","roye");
insert into producer values("306","109","207","vikas");
desc actor;
insert into actor values("401","hrithik","roshan","male"),
("402","yash","gowda","male"),
("403","deepika","padkoune","female"),
("404","benedict","cumberbatch","male"),
("405","sharukh","khan","male");
insert into actor values(406,"alia","bhat","female",109);
desc movie_cast;
desc actor;
alter table movie_cast
drop column cast;
alter table movie_cast
add column role varchar(50);
insert into movie_cast values(401,101,"lead_actor"),
(402,105,"lead_actor"),
(405,107,"lead_actor"),
(403,106,"lead_actress"),
(404,108,"lead_actor");
desc movie_direction;
insert into movie_direction values(203,101),
(203,102),(206,103),(206,104),(204,105),(202,106),(201,107),(205,108);
insert into movie_direction values(207,109);
desc reviewer;
insert into reviewer values(501,"imbd"),
(502,"movie_meter"),
(503,"rotten_tomatoes"),
(504,"times_of_india");

use filmindustry;
desc rating;
select * from movie;
insert into rating values(109,501,"flop",2);
insert into rating values(109,501,"blockbuster",10);
insert into rating values(101,501,"hit",8),
(102,502,"super_hit",9),
(103,504,"hit",8),
(104,503,"hit",8),
(106,502,"super hit",9),
(107,501,"block_busteer",10),
(108,504,"super_hit",9);
desc genres;
select * from movie;
insert into genres values(601,"drama_Adventure_action"),
(602,"drama_action_thriller"),
(603,"drama_romance_action"),
(604,"drama_romance"),
(605,"action_comedy_mystrey");

insert into movie_genres values(101,601),
(102,601),(103,601),(104,601),(105,602),
(106,603),(107,604),(108,605);

#1.SELECT ACTOR NAME WHO HAS WORKED IN FILM KGF AND FIND HIS MOVIE RATING

select act_fname,act_lname from actor 
join movie_cast on actor.act_id= movie_cast.act_id
join movie on movie_cast.mov_id=movie.mov_id 
and movie.mov_title='kgf' 
join rating on movie.mov_id=rating.mov_id;

select * from rating;
desc rating;
#2.select movies which is blockbuster
select mov_title from movie 
join rating on movie.mov_id=rating.mov_id and rev_status='blockbuster';

update rating 
set rev_status='blockbuster'
where mov_id=107;

#3.find director name who has directed thriller movies with the rating
select * from movie;
select dir_fname from director
join movie_direction on director.dir_id=movie_direction.dir_id
join movie_genres on movie_genres.mov_id=movie_direction.mov_id
join genres on genres.gen_id=movie_genres.gen_id and gen_title like '%thriller%'; 
select * from actor;
# 4.select the producer and director who has worked with hrithik roshan
select dir_fname ,prod_name from director
join producer on producer.dir_id=director.dir_id 
join actor on producer.mov_id=actor.mov_id and act_fname="hrithik";
select * from producer;
select * from director;
select * from movie;
insert into producer values(305,107,201,"karan");
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=101 where act_id=401;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=105 where act_id=402;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=106 where act_id=403;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=108 where act_id=404;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=107 where act_id=405;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=101 where act_id=401;
use filmindustry;
#5.find the movies director and producer name whose movie release between 1990 to 2000
select dir_fname,prod_name,mov_title from director
join producer on director.dir_id=producer.dir_id
join movie on movie.mov_id=producer.mov_id and mov_year between 1990 and 2000;
select * from producer;
select * from movie;
select * from actor;
# 6.find actors who have given blockbuster movies
select act_fname from actor where mov_id 
in (Select mov_title from movie where mov_id 
in (select rev_status from rating where rev_status="blockbuster"));
select act_fname from actor
join movie on actor.mov_id=movie.mov_id
join rating on movie.mov_id=rating.mov_id where rev_status="blockbuster";

#7.select movies which is produced by ramesh

select mov_title from movie where
mov_id in(select prod_name from producer where prod_name='ramesh');
select mov_title from movie 
join producer on producer.mov_id=movie.mov_id where prod_name='ramesh';

#8.select movies which is directed by ss rajamouli

select mov_title from movie 
join movie_direction on movie.mov_id=movie_direction.mov_id 
join director on director.dir_id=movie_direction.dir_id where dir_fname="ss";

#9.select movie whis is released in 2000
select mov_title from movie
where mov_year=2000;
select * from movie;
#10.select actor who worked in the year 1993
select act_fname As 'Actor name'from actor 
join movie on movie.mov_id=actor.mov_id where mov_year='1993';

#11.select movies in hindi language
select mov_title from movie
where mov_lang='hindi';

#12.select director name who have directed english movies

select dir_fname,dir_lname from director where (dir_id)in 
(select dir_id from movie_direction where mov_id in
(select mov_id from movie where mov_lang='english'));

#13.select producer who have produced english movie
select prod_name from producer
where (mov_id) in (Select mov_id from movie where mov_lang='english');


#14.select director who have given flop movies
select dir_fname from director
where (dir_id) in (select dir_id from movie_direction where mov_id in(select mov_id from rating where rev_status='flop'));  

#15.select actor who did hindi movies
select act_fname from actor where (mov_id) in(select mov_id from movie where mov_lang='hindi');

#select actor .producer and director movie who done comedy movies
select dir_fname from director where (dir_id)in(select dir_id,prod_name from producer where mov_id in(select mov_id from actor
where mov_id in(select mov_id from movie_genres where gen_id in (select gen_id from genres where gen_title like '%comedy%'))));

select dir_fname,prod_name,act_fname from director
join producer on director.dir_id=producer.dir_id
join actor on producer.mov_id=actor.mov_id
join movie_genres on movie_genres.mov_id=actor.mov_id
join genres on genres.gen_id=movie_genres.gen_id where gen_title like '%comedy%'; 