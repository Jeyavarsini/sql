-- group concat
-- 1. List all subjects each student has enrolled in as a single row.
-- 2. Show all department names each employee has worked in (comma separated).
-- 3. Concatenate all phone numbers of each customer separated by ;.
-- 4. Display a list of all product names under each category.
-- 5. Combine all cities where a supplier delivers into a single string.

use practice;
select * from ordertable;

alter table ordertable
add column city varchar(20);

select name,group_concat(subjects) s_name
from students_details group by name;

select subjects,group_concat(name) s_name
from students_details group by subjects;

select department,group_concat(name order by name separator ';' ) as sname
from employee group by department;

select o_id,group_concat(phonenum order by phonenum separator ';')as p_num
from ordertable group by o_id;

select o_id,group_concat(productname) as p_list
from ordertable group by o_id;

select o_id,group_concat(city) as p_city
from ordertable group by o_id;

-- 2. TRIM()
-- 6. Remove extra spaces before and after employee names in the employee table.
-- 7. Clean up email addresses where users have mistakenly added spaces.
-- 8. Show names after trimming only leading spaces.
-- 9. Show names after trimming only trailing spaces.
-- 10. Remove # characters from both sides of a string.

insert into employee 
values( 7,'   ravi   ',7890585421,30,'namakkal',5665490.4,' *EEE ');
select * from employee;
alter table employee
add column dates date;
select trim(name) from employee;
select trim(email) from employee;
select lpad('arjun',8,'$') as leftpad;
select rpad('kamal',8,'*') as rightpad;
select trim(both '#' from department) from employee;

-- ROW_NUMBER()
-- 11. Assign a unique row number to employees ordered by salary.
-- 12. Within each department, number employees based on their hire date.
-- 13. List the top 3 earners in each department using row numbers.
-- 14. Generate sequential numbers for students ordered by marks.
-- 15. Rank orders in each region by order amount.

SELECT empid, name, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employee;
select empid,name,department,row_number() over(partition by department order by dates asc) as hire_date
 from employee;
with rank_emp as(
select empid,name,salary,row_number() over(partition by department order by salary) as topemp
from employee)
select * from rank_emp
where topemp <= 3;
select regno,name,department,row_number() over(order by mark asc) as stu_marks
from students1;
select o_id,productname,price,row_number() over(partition by city order by price) as o_amt
from ordertable;

-- VIEW
-- 16. Create a view that shows only employees with salary greater than 50,000.
-- 17. Create a view for students who scored more than 80 in exams.
-- 18. Create a view that displays all products out of stock.
-- 19. Create a view that joins orders and customers for quick access.
-- 20. Create a view to show monthly sales summary.

create view highsal as
select empid,name,department,salary from employee
where salary > 50000;
select * from highsal;

create view student as
select regno,name,department,mark from students1
where mark > 80;
select * from student;

alter table ordertable
add column cus_name varchar(20);

create view product as
select o_id,productname,price ,staatus from ordertable
where staatus = 'out of stock';
select * from product;

CREATE VIEW Orders_Customers_View AS
SELECT o.o_id,o.dateandtime,o.cus_id,c.cus_name,c.cus_city,c.cus_phn,o.price
FROM ordertable o
JOIN customer c 
    ON o.cus_id = c.cus_id;
    select * from orders_customers_view;
select * from sales;
alter table ordertable
drop column s_year ;
create table sales(
sale_id int,
sale_name varchar(20),
sale_value int);

insert into sales 
values(107,'vinoth',5),(108,'ishu',2),(109,'samu',8),(110,'then',6);

create view monthsale as
select year(dateandtime) as sale_year,month(dateandtime) as sale_month,sum(price) as total,count(o_id) as total_orders from ordertable
group by year(dateandtime),month(dateandtime)
order by sale_year,sale_month;
select * from monthsale;

-- NTILE(n)
-- 21. Divide employees into 4 performance groups based on salary.
-- 22. Assign students into 3 grade buckets based on marks.
-- 23. Split salespeople into 5 groups according to sales value.
-- 24. Divide marathon runners into quartiles based on completion time.
-- 25. Classify customers into 2 halves: high spenders and low spenders.

select *,ntile(4) over(order by salary asc) from employee;
select *,ntile(3) over(order by mark asc) from students1;
select *,ntile(5) over(order by sale_value desc) from sales;
select *,ntile(4) over(order by c_time asc) from m_run; 
select *,ntile(2) over(order by price desc) from ordertable; 

-- REPLACE()
-- 26. Replace all occurrences of "colour" with "color" in a product description.
-- 27. Replace dashes - with slashes / in date strings.
-- 28. Replace old company name with new one in the clients table.
-- 29. Replace spaces with underscores in usernames.
-- 30. Replace "N/A" with NULL in the data column.\

select replace('everything is colour','colour','color') as result;
select replace('2025-09-17','-','/')as res;
select replace('amazon','amazon','zoho')as res;
select replace('2025 09 17',' ','_')as res;
select replace('yes0no','0','N/A')as res;

-- LPAD() / RPAD()
-- 31. Pad employee IDs with leading zeros to make them 6 digits.
-- 32. Right-pad customer names with * to make them 15 characters long.
-- 33. Display order numbers with leading ORD- prefix using LPAD.
-- 34. Format account numbers so they are always 10 digits (with LPAD).
-- 35. Pad invoice numbers with trailing # until they reach length 12.

select lpad(empid,'6','0') from employee;
select rpad(cus_name,'15','*')from customer;
select lpad(o_id,'6','ORD')from ordertable;
select lpad(act_num,'10') as res;
select rpad(invoice_num,'123456','*') as res;


-- SUBSTRING()
-- 36. Extract the first 3 letters of each employee name.
-- 37. Show last 4 digits of each phone number.
-- 38. Display the middle 2 characters of product codes.
-- 39. Extract year from a date string using substring.
-- 40. Show initials of each employee (first letter of first name + last name).

select substring(name,'1','3') from employee;
select substring(conatct,'5','4')from employee;
SELECT SUBSTRING(productname, (productname) / 2) AS middle_chars
FROM ordertable;

select substring(dateandtime,'1','4') from ordertable;
select substring(name,'1','1') from employee;
