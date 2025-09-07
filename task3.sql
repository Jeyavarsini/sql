use practice;

create table employees(
emid int,
emname varchar(20),
dept varchar(30),
salary decimal(10,2),
city varchar(20));

insert into employees 
values(1,'Alice','HR',50000,'newyork'),(2,'Bob','IT',70000,'san diego'),(3,'Charlie','HR',55000,'newyork'),(4,'David','IT',80000,'boston'),(5,'Eva','Finance',60000,'san diego'),(6,'Frank','IT',75000,'san jose'),(7,'Grace','Finance',65000,'newtork'),(8,'Hannah','HR',52000,'Boston');

select * from employees;

select count(dept),dept from employees group by dept;

select avg(salary),dept from employees group by dept;

select * from employees order by salary desc;
 
 select * from employees order by dept,salary asc; 