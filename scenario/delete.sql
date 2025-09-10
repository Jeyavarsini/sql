use data;

-- DELETE
-- 10.	Delete all students whose age is less than 18.
-- 11.	Delete an order with OrderID = 5.
-- 12.	Delete students who do not belong to any department.

select * from students;
select * from orders;
DELETE FROM Students
WHERE Age < 18;

delete from orders
where orderid = 5;

delete from students
where department = '';