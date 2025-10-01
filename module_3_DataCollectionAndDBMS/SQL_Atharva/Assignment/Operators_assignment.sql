create database operators;
use operators;
drop database operators;
select * from employees;
-- 1 Write a query to display the job titles whose MAX_SALARY is less than or equal to 20000.Write a query to find employees with a salary greater than 5000.
select *
from employees where max_salary<=20000;
select*
from employees where max_salary>5000;

-- 2 Write a query to display employees who do not belong to department 90.
select*
from employees where department !=90;

-- 3 Write a query to find employees with a salary less than 4000.
select*
from employees where salary <4000;

-- 4 Write a query to display employees whose COMMISSION_PCT is not null.Write a query to display employees whose MANAGER_ID is null.
select emp_name 
from employees where commission_pct is not null;

-- 5 Write a query to find employees in departments with IDs greater than 50.
select emp_name 
from employees where emp_id>50;

-- 6 Write a query to display the employees with DEPARTMENT_ID equal to 90.
select * 
from employees where department_id=90;

-- 7 Write a query to display employees in department ID 100, 200, or 300.
select *
from employees where department_id in(100,200,300);

-- 8 Write a query to display jobs where MAX_SALARY is greater than or equal to 10000.
select first_name,last_name,salary
from employees where salary>=10000;

-- 9 Write a query to display employees in department ID 100, 200, or 300.
select *
from employees where department_id=1700;

-- 10 Write a query to find countries where REGION_ID is greater than or equal to 2.
select *
from countries where region_id>=2;

-- 11 Write a query to find employees whose MANAGER_ID is less than 103.
select *
from employees where manager_id<103;

-- 12 Write a query to find employees whose SALARY is greater than or equal to 8000.
select *
from employees where salary>=8000;

-- 13 Write a query to find employees in departments with IDs less than or equal to 60
select *
from employees where department_id<=60;

-- 14 Write a query to find employees whose SALARY is between 4000 and 8000.
select *
from employees where salary between 4000 and 8000;

-- 15 Write a query to display the job titles where the minimum salary is greater than 6000.
select job_id,salary
from employees where salary>6000;

-- 16 Write a query to find employees whose salary is not equal to 5000.
select *
from employees where salary !=5000;

-- 17 Write a query to display departments whose MANAGER_ID is not 0.
select *
from departments where manager_id !=0;

-- 18 Write a query to display the countries where REGION_ID is not equal to 2.
select *
from countries where region_id!=2;

-- 19 Write a query to find employees whose salary is exactly 6000.
select *
from employees where salary=6000;

-- 20 Write a query to display employees where SALARY is greater than 10000 or DEPARTMENT_ID is 60.
select *
from employees where salary>10000 or department_id=60;

-- 21 Write a query to find employees whose salary is less than or equal to 3000.
select *
from employees where salary>=3000;

-- 22 Write a query to display employees where the DEPARTMENT_ID is equal to 60 and the MANAGER_ID is greater than 102.
select *
from employees where department_id=60 and manager_id>102;

-- 23 Write a query to display employees where DEPARTMENT_ID is 100 and SALARY is greater than 10000.
select *
from employees where department_id=100 and salary>10000;

-- 24 Write a query to display departments where the DEPARTMENT_ID is not in (60, 70, 80).
select *
from employees where department_id not in (60,70,80);

-- 25 Write a query to display job titles where the minimum salary is not less than 5000.
select *
from employees where salary>5000;

-- 26 Write a query to find employees whose department ID is not equal to 100 or 60.
select *
from employees where department_id not in(60,100);

-- 27 Write a query to display employees where LAST_NAME ends with 'son'.
select last_name
from employees where last_name like "%son";

-- 28 Write a query to display employees with FIRST_NAME starting with 'J' using the LIKE operator.
select first_name
from employees where first_name like "j%";

-- 29 Write a query to display employees where SALARY is greater than 8000 and DEPARTMENT_ID is 90.
select *
from employees where salary>8000 and department_id=90;

-- 30 Write a query to display jobs where the MIN_SALARY is less than 5000 or MAX_SALARY is greater than 20000.
select *
from employees where salary<5000 or salary>20000;

-- 31 Write a query to display employees where SALARY is greater than 6000 and DEPARTMENT_ID is either 50 or 60.
select *
from employees where salary>6000 and department_id in(50,60);

-- 32.Write a query to display countries where COUNTRY_NAME starts with 'C' and REGION_ID is greater than 1.
select *
from countries where country_name like "c%" and region_id>1;

-- 33.Write a query to display employees where FIRST_NAME contains 'an' and SALARY is greater than 4000.
select *
from employees where first_name like "%an%" and salary>4000;

-- 34.Write a query to display departments where the location is either 1700 or 1800 using the IN operator.
select *
from departments where location_id in (1700,1800);

-- 35.Write a query to display employees where FIRST_NAME starts with 'A' and LAST_NAME contains 'son'.
select *
from employees where first_name like "a%" and 
last_name like "%son%";

-- 36.Write a query to display employees where SALARY is greater than 5000 or DEPARTMENT_ID is 100.
select *
from employees where salary>5000 or department_id=100;

-- 37.Write a query to display countries where COUNTRY_NAME does not start with 'A' and REGION_ID is greater than 1.
select *
from countries where country_name not like "a%" and
region_id>1;

-- 38.Write a query to find employees who work in departments with DEPARTMENT_ID greater than 50 and earn more than 7000.
select *
from employees where department_id>50 and salary>7000;

-- 39.Write a query to display employees whose salary is either greater than 10,000 or less than 3,000.
select *
from employees where salary>10000 or salary<3000;

-- 40.Write a query to display employees whose salary is greater than 6000 and COMMISSION_PCT is null or less than 0.2.
select *
from employees where salary>6000 and 
commission_pct is null or commission_pct<0.2;

-- 41.Write a query to display employees whose hire date is within the last 10 years.
select *
from employees where year(hire_date);

-- 42.Write a query to display employees who either belong to department 50 or have a salary greater than the average salary of their department.
select *
from employees where department_id=50 or salary>avg;

-- 43.Write a query to find all countries where the REGION_ID is greater than 2 but not equal to 4.
select *
from countries where region_id>2 and region_id!=4;

-- 44.Write a query to display all employees where SALARY is not in the range of 5000 to 10000.
select *
from employees where salary not in (5000 , 10000);

-- 45.Write a query to display employees whose HIRE_DATE is not between '1995-01-01' and '2005-12-31'.
select *
from employees where hire_date not between "1995-01-01" and "2005-12-31";

-- 46.Write a query to display employees who earn a salary greater than 5000 but are not in department 50
select *
from employees where salary>5000 and department_id!=50;

-- 47.Write a query to display employees whose salary is either greater than 10,000 or less than 3,000 but not equal to 7,000
select *
from employees where salary>10000 or salary<3000 and salary!=7000;

-- 48 Write a query to display job titles where the minimum salary is greater than 5000 or the maximum salary is less than 15,000.
select *
from employees where salary>5000 or salary<15000;

-- 49.Write a query to find jobs where the minimum salary is at least half of the maximum salary.
select *
from employees
 where salary>=salary/2;

-- 49.Write a query to display employees who were hired after '1990-01-01' and have a MANAGER_ID greater than 100.
select *
from employees where (hire_date)>"1990-01-01" and manager_id>100;

-- 50.Write a query to display employees where SALARY is greater than 10000 and the JOB_ID is either 'IT_PROG' or 'ST_CLERK'.
select *
from employees where salary>10000 and job_id in('IT_PROG' , 'ST_CLERK');