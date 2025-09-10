create database data;

use data;

-- scenario--
-- 1.Create a table Students with columns: StudentID, Name, Age, Department.--
-- 2.	Create a table Orders with OrderID, CustomerName, Amount, OrderDate.--
 -- 3.	Create a Products table with constraints (Primary Key on ProductID, Not Null on Name).--
 
create table Students(
student_id int ,
name varchar(30),
age int,
department  varchar(50));

create table Orders(
OrderId int,
customername varchar(30),
Amount decimal(10,2),
Orderdate date);

create table Products(
ProductId int primary key,
name varchar(30) not null);

insert into orders
values(1,'vikram',1700,'2025-09-01'),(2,'ajay',2100,'2025-09-02'),(3,'jeya',2200,'2025-09-03'),(4,'harini',2100,'2025-09-04'),(5,'aanath',3000,'2025-09-05');

insert into students 
values(101,'vikram',17,'java'),(102,'ajay',21,'python'),(103,'jeya',22,'c++'),(104,'harini',21,'c');
select * from students;
select * from orders;

