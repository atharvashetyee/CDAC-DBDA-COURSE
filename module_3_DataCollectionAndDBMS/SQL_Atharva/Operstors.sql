create database operators;
use operators;
drop database operators;
-- Write a query to display the job titles whose MAX_SALARY is less than or equal to 20000.Write a query to find employees with a salary greater than 5000.
select *
from employees where max_salary<=20000;
select*
from employees where max_salary>5000;

-- Write a query to display employees who do not belong to department 90.
select*
from employees where department !=90;

-- Write a query to find employees with a salary less than 4000.
select*
from employees where salary <4000;

-- Write a query to display employees whose COMMISSION_PCT is not null.Write a query to display employees whose MANAGER_ID is null.
select emp_name 
from employees where commission_pct is not null;

-- Write a query to find employees in departments with IDs greater than 50.
select emp_name 
from employees where emp_id>50;

-- Write a query to display the employees with DEPARTMENT_ID equal to 90.
select * 
from employees where department_id=90;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

select length(first_name) as lenght_of_first_name
from employees;

-- find employees in firstnmae and last time. having same lenth
select lenght(first_name)  as lenght_of_first_name
from employees ;

-- find employee whose first containing three letter
select first_name
from employees where(lenght(first_name)=3);