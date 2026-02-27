-- Create Database
create database college;

-- Check whether database exists or not
create database if not exists college;

-- Delete Database
drop database college;

-- Drop database if exists
drop database if exists company;

-- Use Database
Use college;

-- Create Table
create table student (
id int primary key,
name varchar(50),
age int not null
);

-- Insert Data Into Table
insert into student values (1, "Chetan", 25);
insert into student values (2, "Roy", 24);

-- Show Table Data
select * from student;

-- Show list of databases
show databases;

-- Show all tables in a MySQL database
show tables;

-- Delete Table
drop table student;

-- Practice --
create table student (roll_no int primary key, name varchar(50));

select * from student;

insert into student (roll_no, name) values (101, "Chetan"), (102, "Roy");

-- Practice - 1
create database company_XYZ;

use company_XYZ;

create table employee_info (id int, name varchar(50), salary int);
insert into employee_info (id, name, salary) values (101, "adam", 25000), (102, "bob", 30000), (103, "casey", 40000);

select * from employee_info;

-- Constraints

-- Not Null Constraint
create table temp_1 (id int not null);

-- Unique Constraint
create table temp_1 (id int unique);
insert into temp_1 (id) values (101), (102);

-- Primary Key Constraint
-- Syntax-1
create table temp_1 (id int primary key);
-- Syntax-2
create table temp_1 (id int, name varchar(50), age int, city varchar(20), primary key(id, name));

-- Default Constraint
create table emp (id int primary key, salary int default 25000);
insert into emp (id) values (101);

select * from emp;

-- Check Constraint
create table emp (id int primary key, age int check (age >= 18));

-- //////////////////////////////

-- create database college;
-- Use college;

create table student (rollno int primary key, name varchar(50), marks int not null, grade varchar(1), city varchar(20));

insert into student (rollno, name, marks, grade, city)
values
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

select name, marks from student;
select city from student;
select distinct city from student; -- Select only unique values
select * from student;

-- Where Clause
select * from student where marks > 80;
select * from student where city = "Mumbai";
select * from student where marks > 80 AND city = "Mumbai";

-- Using Operators in WHERE (Arithmetic Operators, Comparison Operators, Logical Operators, Bitwise Operators)

-- Arithmetic Operators - +, -, *, /, %
select * from student where marks+10 > 100;

-- Comparison Operators - =, !=, >, >=, <, <=
select * from student where marks = 93;

-- Logical Operators - AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
select * from student where marks > 80 AND city = "Mumbai";
select * from student where marks > 80 OR city = "Mumbai";
select * from student where marks Between 80 AND 90;
select * from student where city In ("Delhi", "Mumbai");
select * from student where city Not In ("Delhi", "Mumbai");

-- Bitwise Operators - & (Bitwise AND), | (Bitwise OR)

-- Limit Clause
select * from student limit 3;
select * from student where marks > 75 limit 3;

-- Order by Clause
select * from student order by city asc;
select * from student order by marks desc limit 3;

-- Aggregate Function (COUNT(), MAX(), MIN(), SUM(), AVG())
select count(rollno) from student;
select max(marks) from student;
select min(marks) from student;
select sum(marks) from student;
select avg(marks) from student;

-- Group By Clause
select city, count(rollno) from student group by city;
select city, name, count(rollno) from student group by city, name;

-- Practice - 2
select city, avg(marks) from student group by city order by city asc;

create table payment (customer_id int primary key, customer varchar(20), mode varchar(20), city varchar(20));

insert into payment (customer_id, customer, mode, city) 
values (101, "Olivia Barrett", "Netbanking", "Portland"),
(102, "Ethan Sinclair", "Credit Card", "Miami"),
(103, "Maya Hernandez", "Credit Card", "Seattle"),
(104, "Liam Donovan", "Netbanking", "Denver"),
(105, "Sophia Nguyen", "Credit Card", "New Orleans"),
(106, "Caleb Foster", "Debit Card", "Minneapolis"),
(107, "Ava Patel", "Debit Card", "Phoenix"),
(108, "Lucas Carter", "Netbanking", "Boston"),
(109, "Isabella Martinez", "Netbanking", "Nashville"),
(110, "Jackson Brooks", "Credit Card", "Boston");

select * from payment;

select mode, count(customer_id) from payment group by mode;

-- //////////////////////////////

select grade, count(rollno) from student group by grade order by grade asc;

-- Having Clause
select city, count(rollno) from student group by city having max(marks) > 90;

-- General Order

-- Select column(s)
-- from table_name
-- where condition
-- group by column(s)
-- having condition
-- order by column(s) ASC;

select city
from student
where grade = "A"
group by city
having max(marks) >= 93
order by city desc;

-- Update Command
set SQL_SAFE_UPDATES = 0;
update student set grade = "O" where grade = "A";
update student set marks = 82 where rollno = 105;
update student set grade = "B" where marks between 80 and 90;
update student set marks = marks + 1;

select * from student;

-- Delete Command
delete from student where marks < 33;

-- Delete All Table Data
delete from student;

select * from student;

set SQL_SAFE_UPDATES = 1;

-- Revisiting foreign key
create table dept (id int primary key, name varchar(20));

create table teacher (id int primary key, name varchar(20), dept_id int, foreign key (dept_id) references dept(id));

-- Cascading Key
create table dept (id int primary key, name varchar(20));
insert into dept (id, name) values (101, "English"), (102, "IT");

update dept set id = 103 where id = 102;

select * from dept;

create table teacher (id int primary key, name varchar(20), dept_id int, foreign key (dept_id) references dept(id) on update cascade on delete cascade);
insert into teacher (id, name, dept_id)
values (101, "Adam", 101),
(102, "Eve", 102);

select * from teacher;

-- ALTER Command
alter table student
add column age int;
select * from student;

alter table student
drop column age;

-- Rename Table
-- alter table table_name
-- rename to new_table_name;

-- Change Column (rename)
-- alter table table_name
-- change column old_name new_name new_datatype new_comnstraint;

-- Modify Column (modify datatype/ constraint)
-- alter table table_name
-- modify col_name new_datatype new_constraint;

alter table student
add column age int not null default 19;

alter table student
modify column age varchar(2);

insert into student (rollno, name, marks, stu_age) 
values (107, "gargi", 68, 100); 

alter table student
change age stu_age int;

alter table student
drop column stu_age;

alter table stu
rename to student;

select * from student;

-- Truncate (to delete table's data)
truncate table student;

-- Practice - 3

-- Change the name of column "name" to "full_name".
alter table student
change name full_name varchar(50);

-- Delete all the students who scored marks less than 80.
delete from student where marks < 80;

-- Delete the column for grade.
alter table student
drop column grade;

-- //////////////////////////////

-- JOINS In SQL
create table stu (id int primary key, name varchar(50));

insert into stu (id, name) 
values (101, "adam"),
(102, "bob"),
(103, "casey");

create table course (id int primary key, course varchar(50));

insert into course (id, course)
values (102, "english"),
(105, "math"),
(103, "science"),
(107, "computer science");

select * from stu;
select * from course;

-- Inner Join
select * 
from stu 
inner join course
on stu.id = course.id;

-- Using Alias
-- select * 
-- from stu as s
-- inner join course as c
-- on s.id = c.id;

-- Left Join
select * 
from stu
left join course
on stu.id = course.id;

-- Right Join
select *
from stu
right join course
on stu.id = course.id;

-- Full Join
select *
from stu as a
left join course as c
on a.id = c.id
union
select *
from stu as a
right join course as c
on a.id = c.id;

-- Left Exclusive Join
select *
from stu as a
left join course as b
on a.id = b.id
where b.id is null;

-- Right Exclusive Join
select *
from stu as acourse
right join course as b
on a.id = b.id
where a.id is null;

-- Full Exclusive Join
select *
from stu as a
left join course as b
on a.id = b.id
where b.id is null
union
select *
from stu as a
right join course as b
on a.id = b.id
where a.id is null;

create table employee (id int primary key, name varchar(50), manager_id int);

insert into employee (id, name, manager_id)
values (101, "adam", 103),
(102, "bob", 104),
(103, "casey", null),
(104, "donald", 103);

-- Self Join
select a.name as manager_name, b.name
from employee as a
join employee as b
on a.id = b.manager_id;

-- Union
select name from employee
union
select name from employee;

-- Union All
select name from employee
union all
select name from employee;

-- SQL Sub Queries
/* A Subquery or inner query or a Nested query is a query within another SQL query.

Syntex
SELECT column(s)
FROM table_name
WHERE col_name operator (subquery); 
*/

-- Using This queries to perform static.
select avg(marks) from student;
select full_name from student where marks > 89.0000;

-- Using This querie to perform dynamically.

-- 1) Get names of all students who scored more than class average. (In Where Command)
select full_name, marks
from student
where marks > (select avg(marks) from student);

-- 2) Find the names of all students with even roll numbers. (In Where Command)
-- select rollno, full_name 
-- from student
-- where rollno % 2 = 0;

select rollno
from student
where rollno % 2 = 0;

select full_name, rollno
from student
where rollno in (102, 104, 106);

select full_name, rollno
from student
where rollno in (
	select rollno
	from student
	where rollno % 2 = 0);

-- 3) Find the max marks from the students of Delhi. (In From Where Command)
select max(marks)
from (select * from student where city = "Delhi") as temp;

-- (In Select Command)
select (select max(marks) from student), full_name
from student;

-- MySQL Views
create view view1 as
select rollno, full_name, marks from student;

select * from view1;

select * from view1
where marks > 90;

drop view view1;