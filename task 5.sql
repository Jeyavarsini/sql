use practice;

select * from employee
where salary > (select avg(salary) from employee);

select avg(salary) as avgSalary,department from employee group by department
having avgSalary > 60000;

-- without having--
select * from
(select avg(salary) as avgSalary,department from employee group by department)
as averageSalary where avgSalary > 60000;

create table employees1(
emp_id int primary key,
name varchar(20),
Salary decimal(10,2),
department_id int);

create table departments(
department_id int,
department_name varchar(20),
location_id int);

insert into employees1 values(101,'John',50000,10),(102,'Alice',60000,20),
(103,'Bob',45000,30),(104,'Emma',70000,20),(105,'David',55000,10);

insert into departments values(10,'Hr',1700),(20,'Sales',1700),(30,'IT',1800);

select * from employees1;
select * from departments;

select * from employees1
where department_id in(select department_id from departments where location_id=1700);
select avg(salary) from employee group by department;

select * from employees;
select * from employee e1
where salary > (select avg(salary) from employee e2 where e2.department = e1.department);

select salary from employees1 where department_id = 20;
select name, salary from employees1
where salary > any(select salary from employees where department_id = 20);

select name, salary from employees1
where salary > all(select salary from employees where department_id = 20);

select * from employees1 where department_id = any(
select department_id from departments where location_id = 1700);

select name from employees1 e where exists
(select * from departments d where d.department_id = e.department_id and d.location_id=1700);

select name from employees1 e where not exists
(select * from departments d where d.department_id = e.department_id);


