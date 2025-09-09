use practice;

select * from employee;

delimiter $$
create procedure updatedept2(in emp_id int,in newdept varchar(30),out message varchar(50))
begin
   declare currentdept varchar(30);
   select department into currentdept from employee where empid=emp_id;
    
    if newdept <> currentdept then update employee set department = newdept where empid = emp_id;
    set message = 'department updated successfully';
    else 
         set message = 'department updation unsuccessfull';
    end if;
end $$
delimiter ; 

set @msg = '';
call updatedept2(1,'IT',@msg);
select @msg as updateddept; 



