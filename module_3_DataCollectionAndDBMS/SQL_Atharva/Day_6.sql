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