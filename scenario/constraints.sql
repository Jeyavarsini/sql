create database constraints;

use constraints;

-- CONSTRAINTS
-- 17.	Create a Users table with UserID (Primary Key), Username (Unique), Password (Not Null).
-- 18.	Add a foreign key constraint between Orders(CustomerID) and Customers(CustomerID).
-- 19.	Add a check constraint that ensures Salary > 10000 in an Employees table.

create table users(
userid int primary key,
username varchar(50) unique,
password varchar(30) not null);

insert into users
values(1,'amith','universe'),(2,'kim','poppins'),(3,'vishal','decode');
select * from users;

create table orders(
orderId int,
name varchar(30));

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Address VARCHAR(200)
);

ALTER TABLE Orders
ADD CustomerID INT;

ALTER TABLE Orders
ADD CONSTRAINT Orders_Customers
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

create table employeesd(
eid int,
name varchar(20),
salary decimal(10,2),
age int);

insert into employeesd
values(101,'qshok',50000,40),(102,'hem',30000,35),(103,'dev',25000,30),(104,'mathan',20000,25);

alter table employeesd
add constraint chk_salary check(salary>10000);

select * from employeesd;