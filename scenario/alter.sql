use data;

 -- ALTER
-- 7.	Add a new column Email to the Students table.
-- 8.	Modify the Amount column in Orders to hold decimal(10,2).
-- 9.	Drop the Email column from Students.

select * from students;

alter table students 
add email varchar(100);

alter table orders
modify amount decimal(10,2);

alter table students
drop column email;


