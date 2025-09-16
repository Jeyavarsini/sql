-- 1️⃣1️⃣ TRIGGER
-- 31.	Write a trigger that updates a log table whenever a student record is inserted.
-- 32.	Write a trigger that prevents deleting an employee if their salary is greater than 50,000.
-- 33.	Write a trigger that automatically updates the LastModifiedDate column in Orders whenever an order is updated.

use practice;
select * from students1;
delimiter $$
create trigger log
after update on students1
for each row
begin
   insert into students1(regno,name,department,mark ,age)
   values(old.regno,new.name,old.department,old.mark,old.age);
   end $$
   delimiter ;
   
   update students1 set name = 'sibi';
  select * from students1 where regno = 7;
  
  DELIMITER //

CREATE TRIGGER prevent_high_salary_delete
BEFORE DELETE ON Employees
FOR EACH ROW
BEGIN
    IF OLD.salary > 50000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete employee with salary greater than 50,000';
    END IF;
END //

DELIMITER ;
delete from employees where emid = 5;
delimiter $$
create trigger order_modifies
before update on ordertable
for each row
begin
   set new.dateandtime= now();
end $$
delimiter ;

alter table ordertable
add dateandtime date;
  select * from ordertable;