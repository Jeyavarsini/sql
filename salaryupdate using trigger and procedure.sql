use practice;

select * from employee;

CREATE TABLE salary_update_log (
    empid INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2));


DELIMITER $$
CREATE TRIGGER log_salary_update
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF NEW.salary > OLD.salary THEN
        INSERT INTO salary_update_log (empid, old_salary, new_salary)
        VALUES (OLD.empid, OLD.salary, NEW.salary);
    END IF;
END$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE updatesalary3(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2),
    OUT message VARCHAR(100)
)
BEGIN
    DECLARE current_salary DECIMAL(10,2);

    SELECT salary INTO current_salary
    FROM employee
    WHERE empid = emp_id;

    IF new_salary > current_salary THEN
        
        UPDATE employee
        SET salary = new_salary
        WHERE empid = emp_id;
    END IF;
END$$

DELIMITER ;

update employee set salary = 70000 where empid=3;

select * from salary_update_log;

