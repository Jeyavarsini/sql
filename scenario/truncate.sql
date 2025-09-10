use data;

-- TRUNCATE
-- 13.	Remove all rows from the Orders table but keep the structure.
-- 14.	Truncate the Products table and reinsert fresh values.

truncate table orders;

select * from orders;
truncate table products;

insert into products 
values(11,'soap'),(12,'battery'),(13,'charger'),(14,'table'),(15,'box');
select * from products;


