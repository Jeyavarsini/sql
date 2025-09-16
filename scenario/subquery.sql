-- 🔟 SUBQUERY
-- 27.	Find all students whose age is greater than the average age.
-- 28.	Find employees who earn more than the salary of employee John.
-- 29.	Find orders that have the maximum order amount.
-- 30.	List departments that have more students than the average number of students in all departments.

use practice;

select * from students1
where age>(select avg(age) from students1);

select * from employee
where salary > (select salary from employee where empid= 5);

select *from ordertable
where price = (select max(price) from ordertable);

SELECT department
FROM Students1
GROUP BY department
HAVING COUNT(*) > (
    SELECT AVG(student_count)
    FROM (
        SELECT COUNT(*) AS student_count
        FROM Students1
        GROUP BY department
    ) AS dept_counts
);