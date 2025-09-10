use practice;

select * from employee;

create table salary_update(
empid int,
old_salary decimal(10,2),
new_salary decimal(10,2),
status varchar(100),
date_time datetime);

delimiter $$
create trigger update_salary
before update on employee 
for each row
begin
    if 
    NEW.salary > OLD.salary then
    INSERT INTO salary_update(empid, old_salary, new_salary, status)
        VALUES (OLD.empid, OLD.salary, NEW.salary, 'Salary updated successfully');
    else
        SET NEW.salary = OLD.salary;
        
        INSERT INTO salary_update(empid, old_salary, new_salary, status)
        VALUES (OLD.empid, OLD.salary, NEW.salary, 'Update skipped: New salary is not higher');
    end if;
end $$
delimiter ;

UPDATE employee SET salary = 7000 WHERE empid = 1;

UPDATE employee SET salary = 25000 WHERE empid = 3;

UPDATE employee SET salary = 75000 WHERE empid = 4;

select * from salary_update;
    