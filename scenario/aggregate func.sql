-- 8️⃣ AGGREGATE FUNCTIONS
-- 20.	Find the average age of students.
-- 21.	Find the total order amount per customer.
-- 22.	Find the maximum salary from the Employees table.
-- 23.	Count how many students are in each department.

use practice;
select * from students1;

alter table students1
add column age int;

select avg(age) as avg_age from students1; 
select max(salary) as maxsalary from employee;
select * from ordertable;
select count(regno) as totalstudents from students1 where department = 'EEE'; 
 select sum(price) as totalamt from ordertable;
