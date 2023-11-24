CREATE DATABASE temp;

USE temp;

CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(255)
);

INSERT INTO student VALUES (1, 'Ankit');

SELECT * FROM student;

show tables;

INSERT INTO student VALUES (2, 'lakshay');

DROP DATABASE IF EXISTS temp;


CREATE DATABASE ORG;

SHOW DATABASES;

USE ORG;

CREATE TABLE Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25), 
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'), 
(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

SELECT * FROM Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10), 
    BONUS_DATE DATETIME, 
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(001, 3500, '16-06-21');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
SELECT * FROM Worker;
 
-- to show specific column only 
SELECT FIRST_NAME, SALARY FROM Worker;

-- using select statement without using from using dual table
SELECT 44+11;

SELECT now();
 
SELECT lcase('Ishaan');

SELECT ucase('Ishaan');


-- WHERE = Clause is used to apply condition
SELECT * FROM Worker WHERE SALARY > 100000;

SELECT * FROM Worker WHERE DEPARTMENT = 'HR';


-- BETWEEN = used to apply condition in range 
SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 300000;

-- IN = Used to reduce OR Statements (list)
SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';

SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Admin');


-- NOT IN = USED TO NEGATE IN
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'Admin');

-- IS NULL = TO show only that row which is null
SELECT * FROM Student WHERE Pincode IS NULL;

-- WILDCARDS   % = ANY NUM OF CHAR, _ = SINGLE CHAR  | LIKE is used here
SELECT * FROM Worker WHERE first_name LIKE '%a%';

-- SORTING USING ORDER BY
SELECT * FROM Worker ORDER BY SALARY ASC;
SELECT * FROM Worker ORDER BY SALARY DESC;

-- DISTINCT VALUES  (DISTICT DEPARTMENT ONLY)
SELECT * FROM Worker; 
SELECT DISTINCT department FROM Worker;

-- GROUP BY (AGGREGATION FUNCTION)	WITHOUT AGGREGATION SAME AS DISTINCT 
-- DATA GROUPING (No. of employees in different dept)
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;

-- FIND AVG SALARY PER DEPARTMENT
SELECT DEPARTMENT, AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- MIN SALARY PER DEPARTMENT
SELECT DEPARTMENT, MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- MAX SALARY PER DEPARTMENT
SELECT DEPARTMENT, MAX(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- TOTAL SALARY PER DEPARTMENT
SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;


-- HAVING (FILTERING IN GROUP BY) = MANDATORY TO USE GROUP BY TO USE HAVING (SAME AS WHERE)
-- GROUP BY HAVING
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;



-- CONSTRAINTS - PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, DEFAULT

-- UNIQUE AND CHECK CONSTRAINT 
CREATE DATABASE temp;

USE temp;

CREATE TABLE account (
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT, 
CONSTRAINT acc_balance_check CHECK(balance > 1000)
);

SELECT * FROM account;

INSERT INTO account (id, name, balance) VALUES 
(1, 'A', 10000);

INSERT INTO account (id, name, balance) VALUES 
(2, 'B', 5000);

INSERT INTO account (id, name, balance) VALUES 
(3, 'C', 500);

DROP TABLE account;

-- DEAFAULT CONSTRAINT 
CREATE TABLE account (
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT NOT NULL DEFAULT 0
);

INSERT INTO account (id, name) VALUES 
(1, 'A');

INSERT INTO account (id, name) VALUES 
(2, 'B');

SELECT * FROM account;

-- Describe command 
DESC account;


-- ALTER COMMANDS (ON ACCOUNT TABLE)

-- ADD NEW COLUMN
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

-- MODIFY 
ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 0;
DESC account;

-- CHANGE COLUMN - RENAME COLUMN  
ALTER TABLE account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- DROP TABLE COLUMN
ALTER TABLE account DROP COLUMN saving_interest;

-- RENAME THE TABLE => change name of table
ALTER TABLE account RENAME TO  account_details;


-- DML Commands

CREATE TABLE Customer(
	id int primary key,
    cname varchar(255),
    address varchar(255), 
    gender char(2), 
    city varchar(255), 
    picode int
);

-- INSERT (3WAYS)
INSERT INTO Customer (id, cname, address, gender, city, pincode) VALUES
(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandar', 144022);

INSERT INTO Customer VALUES
(1222, 'Ishaan Gaba', 'Pratap Nagar', 'M', 'Delhi', 100128);

INSERT INTO Customer (id, cname) VALUES
(1252, 'Drishti Gaba');

SELECT * FROM Customer;

-- update 

UPDATE Customer SET Address = 'Mumbai', Gender = 'M' WHERE id = 1252;

-- update multiple rows
-- update all rows pincode
SET SQL_SAFE_UPDATES = 0;

UPDATE Customer SET pincode = 110000;
UPDATE Customer SET pincode = pincode + 1;

-- DELETE 
DELETE FROM Customer WHERE id = 1251;

-- all table delete 
DELETE FROM Customer;

-- delete constraints 
-- on delete cascade (fk delete)
-- on delete set null (fk to null)

INSERT INTO Customer (id, cname, address, gender, city, pincode) VALUES
(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandar', 144022);

INSERT INTO Customer (id, cname, address, gender, city, pincode) VALUES
(1242, 'Ishaan Gaba', 'Pratap Nagar', 'M', 'Delhi', 100079);

CREATE TABLE Order_details(
Order_id INT PRIMARY KEY,
delivery_date DATE,
cust_id INT, 
foreign key(cust_id) references Customer(id)
);

INSERT INTO Order_details
VALUES (1, '2019-03-11', 1251);

INSERT INTO Order_details
VALUES (2, '2020-03-21', 1242); 

-- DELETE 
-- ON DELETE CASCADE WILL DELETE ALL THE ENTRIES IN CHILD TABLE THROUGH FORIEGN KEY
CREATE TABLE Order_details(
Order_id INT PRIMARY KEY,
delivery_date DATE,
cust_id INT, 
foreign key(cust_id) references Customer(id) ON DELETE CASCADE
);

SELECT * FROM ORDER_DETAILS;  

DELETE FROM Customer WHERE id = 1251; 

-- ON DELETE SET NULL => FORIEGN KEY VALUE SET TO NULL 

CREATE TABLE Order_details(
Order_id INT PRIMARY KEY,
delivery_date DATE,
cust_id INT, 
foreign key(cust_id) references Customer(id) ON DELETE SET NULL
);

DELETE FROM Customer WHERE id = 1251;

-- REPLACE => if data is present corresponding to primary key than update, if data is not present then insert.

REPLACE INTO Customer (id, city) 
Values (1251, 'Rajasthan');

REPLACE INTO Customer (id, cname, city) 
Values (1333, 'Drish', 'Goa');

REPLACE INTO Customer SET id = 1242, cname = 'Shalu', City = 'Gurgaon';

SELECT * FROM Customer;

-- REPLACE VS UPDATE

-- ****************JOINS***************

-- project table 
create table project (id int primary key ,
empid int , 
name varchar(255), 
startdate date, 
clientid int);

insert into project values(1 , 2 ,'A','2021-04-21',3);
insert into project values(2 , 2 ,'B','2021-03-12',1);
insert into project values(3 , 3 ,'C','2021-01-16',5);
insert into project values(4 , 3 ,'D','2021-04-27',2);
insert into project values(5 , 5 ,'E','2021-05-01',4);


-- employee table 
create table employee(id int primary key , fname varchar(255),lname varchar(255), age int ,
emailid varchar(255) , phoneno int(10) , city varchar(255));

insert into employee values(1 , 'Aman','Proto', 32 , 'aman@gmail.com',898 , 'Delhi');
insert into employee values(2 , 'Yagya','Narayan', 44 , 'yagya@gmail.com',222, 'Palam');
insert into employee values(3 , 'Rahul','BD', 22 , 'rahul@gmail.com',444 , 'Kolkata');
insert into employee values(4 , 'Jatin','Hermit', 31 , 'jatin@gmail.com',666 , 'Raipur');
insert into employee values(5 , 'PK','Pandey', 21 , 'pk@gmail.com',555 , 'Jaipur');


-- client table 
create table client (id int primary key , first_name varchar(255) , last_name varchar(255),
age int , emailid varchar(255) , phoneNo int ,city varchar(255) , empid int);

insert into client values(1 , 'Mac','Rogers' , 47 , 'mac@hotmail.com' , 333 , 'Kolkata', 3);
insert into client values(2 , 'Max','Poirier' , 27 , 'max@gmail.com' , 222 , 'Kolkata', 3);
insert into client values(3, 'Peter','Jain' , 24 , 'peter@abc.com' , 111 , 'Delhi', 1);
insert into client values(4 , 'Sushant','Aggrawal' , 23 , 'sushant@yahoo.com' , 45454, 'Hyderabad', 5);
insert into client values(5 , 'Pratap','Singh' , 36 , 'p@xyz.com' , 77767 , 'Mumbai', 2);

SELECT * FROM Client;
SELECT * FROM Project;
SELECT * FROM Employee;

-- INNER JOIN 
-- ENLIST ALL THE employees id, names along with the project allocated to me

SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee as e 
INNER JOIN project as p ON e.id = p.empid;

SELECT * FROM employee as e 
INNER JOIN project as p ON e.id = p.empid;

-- Fetch out all the employees id and theur contact details who have been working 
-- from jaipur with client name working in hyderabad

select e.id, e.emailID, e.phoneno, c.first_name, c.last_name from employee as e
 inner join client as c on e.id = c.empid WHERE e.city = 'Jaipur' and c.city = 'Hyderabad';
 
 
 -- Left join
 -- fetch out each project allocated to each employee
 
 select * from employee as e 
 LEFT JOIN project as p ON e.id = p.empID;

-- right join
-- list out all the projects along with the employee's name and their respective allocated email ID

SELECT p.id, p.name, e.fname, e.lname, e.emailID FROM Employee as e
RIGHT JOIN Project as p
ON e.id = p.empID;

-- CROSS JOIN 
-- List out all the combinations possible for employee's name and projects that can exist

SELECT e.fname, e.lname, p.id, p.name from Employee as e
CROSS JOIN Project as p;

-- Join with out using join keyword (using WHERE)   INNER JOIN => , AND ON => WHERE 
SELECT * FROM employee as e, project as p WHERE e.id = p.empid; 



-- SET OPERATIONS 

create table dept1(
empid int,
name varchar(255),
role varchar(255)
);

INSERT INTO dept1(empid,name,role)values
(1,'A','engineer'),
(2,'B','salesman'),
(3,'C','manager'),
(4,'D','salesman'),
(5,'E','engineer');

create table dept2(
empid int,
name varchar(255),
role varchar(255)
);

INSERT INTO dept2(empid,name,role)values
(3,'C','manager'),
(6,'F','marketing'),
(7,'G','salesman');


-- LIST OUT ALL THE EMPLOYEES IN THE COMPANY
-- UNION
SELECT * FROM dept1 
union 
SELECT * FROM dept2;


-- LIST OUT ALL THE EMPLOYEES IN ALL DEPARTMENT WHO WORK AS SALESMAN;
SELECT * FROM dept1 WHERE role = 'Salesman'
UNION
SELECT * FROM dept2 WHERE role = 'Salesman';


-- LIST OUT ALL THE EMPLOYEES WORKING IN BOTH THE DEPT;
-- INTERSECTION
SELECT * FROM dept1 INNER JOIN dept2 USING(empid);


-- LIST OUT ALL THE EMPLOYEES WORKING IN DEPT1 BUT NOT IN DEPT2
-- MINUS
SELECT dept1.* FROM dept1 LEFT JOIN dept2 using(empid) 
where dept2.empid IS NULL;



-- SUBQUERIES (QUERY INSIDE QUERY)
-- ALTERNATIVE TO JOINS

-- WHERE CLAUSE IN SAME TABLE 
-- EMPLOYEES WITH AGE > 30
SELECT * FROM employee WHERE age IN (SELECT age from employee WHERE age > 30);

-- WHERE CLAUSE DIFFERENT TABLE
-- EMPLOYEES DETAIL WORKING IN MORE THAN 1 PROJECT
SELECT * FROM employee WHERE id in (
SELECT empid FROM project GROUP BY empID HAVING COUNT(EMPID) > 1);


-- SINGLE VALUE SUBQUERY
-- employee details having age > avg(age);
select * from employee where age > (select avg(age) from employee);


-- FROM CLAUSE - derived table
-- Select max(age) person whose first name has a;
select max(age) from (select * from employee where fname like '%a%') as temp;


-- correlated subquery (inner query refer outer query)
-- third oldest employee

SELECT * FROM 
EMPLOYEE e1
WHERE 3 = (
SELECT COUNT(e2.age)
FROM Employee e2
WHERE e2.age >= e1.age
);


-- view 
select * from employee;

-- creating a view
CREATE VIEW custom_view AS SELECT fname, age FROM Employee;

-- viewing a view 
SELECT * FROM custom_view;

-- altering a view
ALTER VIEW custom_view AS SELECT fname, lname, age FROM Employee;

-- dropping a view 
DROP VIEW IF EXISTS custom_view;




