-- 9️⃣ STORED PROCEDURE
-- 24.	Write a stored procedure to insert a new student record.
-- 25.	Write a stored procedure to update the salary of an employee given their ID.
-- 26.	Write a stored procedure to return all orders above a given amount.

use practice;
select * from students;
delimiter $$
create procedure insertrecord(in s_id int, in s_name varchar(20))
begin
    insert into students(s_id,s_name)
    values(5,'logesh');
end $$
delimiter ;

call insertrecord(5,'logesh');
select * from employee;
delimiter $$
create procedure updateemp(in empid int,in newsalary int)
begin
    update employee set salary = newsalary;
end $$
delimiter ;
call updateemp(3,75000);
select * from ordertable;
delimiter $$
create procedure amt(in orderamt decimal(10,2))
begin
    select * from ordertable where price>orderamt;
end $$
delimiter ;
call amt(10000);

