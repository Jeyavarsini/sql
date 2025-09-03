use practice;
 
delimiter $$
create function average(m1 int,m2 int,m3 int,m4 int)
returns int
deterministic
begin 
return(m1+m2+m3+m4)/4;
end $$
delimiter ;

select average(55,66,77,88);
