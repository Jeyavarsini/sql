use data;

-- 4.Update the age of a student whose StudentID = 101 to 25.
-- 5.	Increase the Amount of all orders by 10%.
-- 6.	Change the Department of all students with age > 22 to 'Computer Science'.

select * from students;

update students set age = 25 where student_id = 101;

update orders set amount = amount * 1.10;
select * from orders;

update students set department = 'computerscience' where age>22;

