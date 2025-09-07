use practice;

select * from employees where emname like 'a%';

select * from employees where city like 'san%';

select * from employees where emname like '%a';

select dept,count(emid) from employees
group by dept having count(emid)>2
order by avg(salary) desc;
