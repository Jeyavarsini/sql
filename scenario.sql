-- Table Setup
-- Imagine a small database for an Online Course Platform with tables:
-- •	Students(StudentID, Name, Email, City, JoinDate)
-- •	Courses(CourseID, Title, Category, Price)
-- •	Enrollments(EnrollID, StudentID, CourseID, EnrollDate, Status)
-- •	Payments(PaymentID, StudentID, Amount, PayDate)

use constraints;

create table students(
studentID int,
name varchar(20),
email varchar(50),
city varchar(20),
joindate date);

 
create table courses(
courseID int,
Title varchar(20),
category varchar(20),
price int);

create table enrollments(
enrollID int,
studentID int,
courseID int,
enrolldate date,
staatus varchar(20));

create table payments(
PaymentID int, 
StudentID int,
 Amount decimal(10,2),
PayDate date);

-- 1–5: INSERT Scenarios
-- 1.	Add a new student who joined today.
-- 2.	Insert 3 new courses into the Courses table.
-- 3.	A student enrolls in 2 courses — insert into Enrollments.
-- 4.	Record a payment for a student in the Payments table.
-- 5.	Insert multiple rows of students in a single query.

insert into students 
values(1,'banu','banu@gmail.com','trichy',curdate());
select *  from students;

insert into courses
values(101,'java','programming',40000),(102,'sql','database',30000),(103,'python','programming',35000);

insert into enrollments
values(1,1,101,curdate(),'active'),(1,2,102,curdate(),'active');

insert into students
values(2,'vimal','vimal@gmail.com','chennai',curdate()),(3,'ashok','ashok@gmail.com','bangalore',curdate()),(4,'rosh','rosh@gmail.com','dubai',curdate());

-- 6–9: UPDATE Scenarios
-- 6.	Update a student’s city from Chennai to Bangalore.
-- 7.	Increase the price of all Programming courses by 10%.
-- 8.	Update enrollment status to Completed for a student who finished a course.
-- 9.	Correct a wrongly typed student email.

UPDATE Students SET City = 'Bangalore'
WHERE City = 'Chennai';
UPDATE Courses SET Price = Price * 1.10
WHERE Category = 'Programming';
UPDATE Enrollments SET Staatus = 'Completed'
WHERE StudentID = 1 AND CourseID = 101;
UPDATE Students SET Email = 'vimal.actor@example.com'
WHERE StudentID = 2;

-- 10–12: DELETE & TRUNCATE Scenarios
-- 10.	Delete a student who requested account removal.
-- 11.	Delete all enrollments for a specific course.
-- 12.	Truncate the Payments table before re-importing fresh data.

DELETE FROM Students WHERE StudentID = 2;
DELETE FROM Enrollments WHERE CourseID = 103;
TRUNCATE TABLE Payments;

-- 13–14: ALTER & DROP Scenarios
-- 13.	Add a new column PhoneNumber to the Students table.
-- 14.	Drop the Payments table (assume migrating to another system).

alter table students
add column phonenumber bigint;
-- drop table payments;

-- 15–17: Aggregate Function Scenarios
-- 15.	Find the total number of students enrolled in all courses.
-- 16.	Calculate the average price of courses by category.
-- 17.	Get the highest payment made by any student.

SELECT COUNT(DISTINCT StudentID) AS Total_Students
FROM Enrollments;
SELECT Category, AVG(Price) AS Avg_Price
FROM Courses
GROUP BY Category;
SELECT MAX(Amount) AS Highest_Payment
FROM Payments;

-- 18–20: Subquery Scenarios
-- 18.	Find students who enrolled in more than 2 courses.
-- 19.	List courses that no one has enrolled in (use NOT IN subquery).
-- 20.	Find the student who paid the maximum amount (nested subquery).

SELECT StudentID, COUNT(*) AS Total_Enrollments
FROM Enrollments
GROUP BY StudentID
HAVING COUNT(*) >2;
SELECT *
FROM Courses
WHERE CourseID NOT IN (SELECT DISTINCT CourseID FROM Enrollments);
SELECT StudentID, Name
FROM Students
WHERE StudentID = (
    SELECT StudentID
    FROM Payments
    WHERE Amount = (SELECT MAX(Amount) FROM Payments)
);

-- 21–22: Stored Procedure Scenarios
-- 21.	Write a stored procedure to add a new student (with Name, Email, City).
-- 22.	Write a stored procedure that takes StudentID and returns all courses enrolled by that student.

DELIMITER //
CREATE PROCEDURE studentsrec(IN Name VARCHAR(100), IN Email VARCHAR(100), IN City VARCHAR(50))
BEGIN
    INSERT INTO Students (Name, Email, City, JoinDate)
    VALUES (Name, Email, City, CURDATE());
END //
DELIMITER ;
CALL Studentsrec('arun', 'arun@gmail.com', 'vizag');

DELIMITER //
CREATE PROCEDURE GetCourses(IN j_StudentID INT)
BEGIN
    SELECT c.CourseID, c.Title, c.Category
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE e.StudentID = j_StudentID;
END //
DELIMITER ;
CALL GetCourses(1);

-- 23–24: Trigger Scenarios
-- 23.	Create a trigger on Enrollments that automatically updates Status = 'Active' when a new row is inserted.
-- 24.	Create a trigger on Payments that prevents inserting negative amounts.

DELIMITER //
CREATE TRIGGER automatic
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    SET NEW.Staatus = 'Active';
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER paycheck
BEFORE INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.Amount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount cannot be negative';
    END IF;
END //
DELIMITER ;

-- 25: Mixed Complex Scenario
-- A student deletes their account →
-- •	Delete them from Students.
-- •	Delete related Enrollments and Payments.
-- •	Log the deleted student into an Archive_Students table using a trigger.

DELETE FROM Enrollments WHERE StudentID = 3;
DELETE FROM Payments WHERE StudentID = 3;
DELETE FROM Students WHERE StudentID = 3;

CREATE TABLE Archive_Students (
    StudentID INT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50),
    JoinDate DATE);
DELIMITER //
CREATE TRIGGER Archive
BEFORE DELETE ON Students
FOR EACH ROW
BEGIN
    INSERT INTO Archive_Students (StudentID, Name, Email, City, JoinDate)
    VALUES (OLD.StudentID, OLD.Name, OLD.Email, OLD.City, OLD.JoinDate);
END //
DELIMITER ;