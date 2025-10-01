create database operator_ex;
use operator_ex;

show tables;
-- arithmetic operator(+,-,/,%,*)

select salary,salary+1000 as bonus
from employees;

alter table employees add column check_bonus int default null;

select * from employees;

select check_bonus+1000 as bonus
from employees;

select first_name,(salary-salary) as diff
from employees;

select first_name,(salary/2) as half
from employees;

select first_name,(salary%3) as mod_
from employees;

select first_name(salary *2) as double_sal
from employees;

-----------------------------------------------------------------------------------------
-- comparison operators(=,<>,<=,>=,<,>)

select employee_id,concat(first_name," ",last_name)full_name
from employees where first_name="Steve"; 

select employee_id,concat(first_name," ",last_name)full_name
from employees where department_id=90;


-- write query to find sal of 12K
select employee_id,concat(first_name," ",last_name)full_name
from employees where salary=12000;

-- try to find the check bonus is null
select employee_id,concat(first_name," ",last_name)full_name
from employees where check_bonus=null; -- wrong way to check null

select employee_id,concat(first_name," ",last_name)full_name
from employees where check_bonus is null; 

-- not null
select employee_id,concat(first_name," ",last_name)full_name
from employees where check_bonus is not null; 

-- all dept in dept 90
select employee_id,concat(first_name," ",last_name)full_name
from employees where department_id != 90;

select * from employees where manager_id <>103;

-- employees not hired in 1987
select employee_id,concat(first_name," ",last_name)full_name
from employees where year( hire_date) <> 1987;

select * from employees where salary>10000 order by salary desc;

-- to find employees working since 1987-08-01
select employee_id,concat(first_name," ",last_name)full_name
from employees where date( hire_date) >= "1987-08-01";

-- employees sal less than 10k
select *
from employees where salary <10000;

-- employee sal greater than 10k
select *
from employees where salary >=10000;

-- find me employees whose commission_pct is 0.15
select *
from employees where commission_pct<0.15;

select *
from employees where salary between 10000 and 24000;

-- find employees who were hired betn 1987-08-01 to 1987-08-31
select *
from employees where date(hire_date) between "1987-08-01" and "1987-08-31";

-- first name range from a to d
select *
from employees where first_name between "a" and "d";

-- not between
select *
from employees where date(hire_date)  not between "1987-08-01" and "1987-08-31";

-- find employees working in dept ranging from 70 to 100
select *
from employees where department_id between 70 and 100;

-- where manger id is not betn 70 -105
select *
from employees where manager_id not between 70 and 105;

-- to check either of the condn should match
select * 
from employees where department_id in(70,40,90,100);

-- to find the employee working with job id ad_vp,it_prog
select *
from employees where job_id in("ad_vp","IT_prog","fi_mgr");

-- all employees
select *
from employees where job_id not in("HR_REP","AD_Pres","AD-VP");

-- like operator

select *
from employees where first_name like "D%";  -- employees whose name starts with "D"

select *
from employees where first_name like "%ee"; -- ends with ee

select *
from employees where first_name like "%en"; -- ends with en

select *
from employees where first_name like "%ah%"; -- return when pattern is anywhere in records

select *
from employees where first_name like "_a%" order by first_name; -- third char as "e"

-- first name contains "a" at second last position
select *
from employees where first_name like "%a_" order by first_name;

-- employee whose name dont contain "a" at first postn
select *
from employees where first_name not like "a%" order by first_name;

-- find employees whose name starts with vowel
select *
from employees where first_name like "a%" or first_name like "u%" or first_name like "e%" or first_name like "i%" or first_name like "o%" 
order by first_name;

--------------------------------------------------------------------------------------------------------

-- logical operator and,or,not

-- and both condn should be true
-- or any of the condn should be true
-- not negate

select *
from employees where department_id=90 and salary=24000;
 
select *
from employees where department_id=90 or salary=24000;

select *
from employees where department_id=90 and check_bonus is null;

-- write a query to find employee sal>10000 in dept 90,100,70,80
select *
from employees where department_id in(90,100,70,80) and salary>24000;

-- emp working in it_prgram and hire date is 1987-08-01 and sal>10000
select *
from employees where job_id="It_program" and salary=10000 and hire_date=1987-08-01;

-- find employees sal>15000 or commission_pct>0.30
select *
from employees where salary>15000 or commission_pct>0.30;

select *
from employees where 
(salary not between 5000 and 10000) and (salary is not null);

-- write query to find emp not hired in 1987
select *
from employees where year(hire_date) != 1987;


select *
from employees where phone_number regexp"[0-9]+%";

-----------------------------------------------------------------------
-- predefined functions

-- string
-- select employee_id ,
-- concat(first name," ",last_name) as full_name from employees;

-- select employee_id,
-- concate ("Name:"first_name",department_id)
-- as name_department from empleed;

-- write a qeury to present the contact info
-- phone number and email

-- sub-strings
select first_name

-- write a query to find first two chrachter from first name
#select first_name, 
#substring(first_name 1,4) as emp
from employees;

-- extract last two no digits
select phone_number,
substring(phone_number,-2) sub_string
from employee;

-- where the name starts with capital letters

--------------------------------------------------------------------------------------------------------------------------------
-- select country_id
-- concate(lower case
-- in country table make first letter in country chrac like AR in a way Ar and lkee and then look.

select first_name,ltrim(first_name),rtrim(first_name)
from employees;

select first_name,rpad(first_name,6,"$")
from employees;

select first_name,reverse(first_name)
from employees;

select first_name,Phone_number, replace(phone_number,".","-")
from employees;

select first_name,job_id,replace(job_id,"AD_VP","President")
from employees;

-- to find country_id,country_name,and replace USA to US where the country name belongs to united kingdom and USA
select country_id,country_name , replace(country_name,"United States of America","USA"),replace(country_name,"United Kingdom","USA")
from countries;

SELECT 
  country_id, 
  country_name, 
  REPLACE(REPLACE(country_name, 'United States of America', 'USA'), 'United Kingdom', 'UK') AS new_country_name 
FROM countries;

-------------------------------------------------------------------------------------------------------------------------------------
select now(),
curdate(),
sysdate(),
curtime(),
sysdate(),
system_user();

select employee_id,first_name,hire_date,
year(hire_date),
month(hire_date),
day(hire_date),
monthname(hire_date),
dayname()
from employees;

select length(first_name) as lenght_of_first_name
from employees;

-- find employees in firstnmae and last time. having same lenth
select lenght(first_name)  as lenght_of_first_name
from employees ;

-- find employee whose first containing three letter
select first_name
from employees where(lenght(first_name)=3);