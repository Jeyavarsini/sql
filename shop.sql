create database veg;

use veg;

create table shop1(
no int,
vegetable varchar(30),
price int );

select * from shop1;

insert into shop1
values(1,'carrot',60),(2,'zucchini',50),(3,'brinjal',40),(4,'tomato',30);

 select * from shop1;
 
 
 create table shop2(
 no int,
 vegetable varchar(30),
 price int);
 
 insert into shop2
 values(1,'tomato',40),(2,'brinjal',30),(3,'carrot',60),(4,'zucchini',50);
 
 select * from shop2;
 
 select s1.*,s2.*
 from shop1 s1 join shop2 s2
 on s1.price = s2.price; 

 select s1.*,s2.*
 from shop1 s1 left join shop2 s2
 on s1.price = s2.price
 
 union 
 select s1.*,s2.*
 from shop1 s1 right join shop2 s2
 on s1.price = s2.price
 
 
union all
  select s1.*,s2.*
 from shop1 s1 right join shop2 s2
 on s1.price = s2.price; 