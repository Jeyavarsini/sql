use practice;

create table students_details(
regno int primary key,
name varchar(20),
subjects varchar(30));

 select * from students_details;

insert into students_details
values(1,'akash','tamil'),(2,'bala','english'),(3,'chandru','maths'),(4,'deja','tamil'),(5,'eswaran','english');
 
 -- Scenario 1: A teacher wants a list of all subjects each student has enrolled in.
select subjects,group_concat(name ) as studentname
from students_details group by subjects;
-- Scenario 2: Cleaning up user input (removing extra spaces).
insert into students_details
values(6,'ganesh','maths  '),(7,'  sibi','science');
select trim(name) from students_details;
-- Scenario 3: Ranking employees within each department.
select *,rank() over(partition by department order by mark desc) as Rank_Marks, dense_rank() over(partition by department order by mark desc)
as denserank_mark from students1;
-- Scenario 4: Create a view for reusable queries (high salary employees)
CREATE view high_view as
select empid,name,conatct,salary from employee
where salary > 80000;
select * from high_view;
-- Scenario 5: Divide students into 3 groups based on marks.
select *,ntile(3) over (order by name) as grp from students_details;
-- Scenario 6: Correct misspelled words in a product description.
select replace('this is so godo','godo','good') as result;
-- Scenario 7: Format employee IDs with leading zeros (LPAD) and right padding with stars (RPAD).
select lpad(1,3,0), rpad(1,3,'*') as id;
-- Scenario 8: Extract first 3 letters of employee names.
select substring('eswaran',1,3) as result;