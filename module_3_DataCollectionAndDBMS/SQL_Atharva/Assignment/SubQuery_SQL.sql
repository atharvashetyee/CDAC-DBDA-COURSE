use hr;
show tables;
select * from employees;
select * from departments;
select * from jobs;
select * from countries;
select * from locations;



-- 1. Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'. 
select first_name,last_name,salary 
from employees
where salary>(select salary
from employees
where last_name="Bull");

-- 2. Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
select e.first_name,e.last_name
from employees e
join departments d
on e.manager_id=d.manager_id
where department_name="IT";

-- 3. Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department. 
select concat(first_name," ",last_name) as full_name
from employees
where manager_id and department_id in
(select department_id
from departments
where location_id in (
select location_id
from locations
where country_id="IT")
);

-- 4. Write a query to find the name (first_name, last_name) of the employees who are managers. 

-- 5. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
select concat(first_name," ",last_name) as full_name,salary
from employees
where salary>(
select avg(salary)
from employees);

-- 6. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade. 
select e.first_name,e.last_name,e.salary
from employees e
where e.salary = (
select j.min_salary
from jobs j
where j.job_id = e.job_id
);

-- 7. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments.
select first_name,last_name,salary
from employees
where salary<(
select avg(salary)
from employees)
and department_id in(
select department_id
from departments
where department_name in ("IT")
);

 -- 8. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
select first_name,last_name,salary
from employees
where salary>(
select salary
from employees
where last_name="Bell");

 -- 9. Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments. 
select concat(first_name," ",last_name) as full_name,salary,department_id
from employees
where salary=(
select min(salary)
from employees
where department_id in(
select department_name
from departments
)
);

-- 10. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.
select concat(first_name," ",last_name) as full_name,salary
from employees
where salary>(
select avg(salary)
from employees
where department_id in (department_id));


-- 11. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest. 
select concat(first_name," ",last_name) as full_name,salary
from employees
where salary>(
select max(salary)
from employees
where job_id="sh_clerk"
order by salary
);

-- 12. Write a query to find the name (first_name, last_name) of the employees who are not accountants. 
select concat(first_name," ",last_name) as full_name
from employees
where job_id not in(
select job_title
from jobs
where job_title="Accountant");

-- 13. Write a query to display the employee ID, first name, last name, and department names of all employees. 
select e.employee_id,e.first_name,e.last_name,d.department_name
from employees e
join departments d;

-- 14. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
select employee_id,first_name,last_name,salary
from employees
where (salary)>(
select avg(salary)
from employees
);

-- 15. Write a query to fetch even numbered records from the employees table. 
select employee_id,first_name,last_name
from employees
where employee_id%2=0;

-- 16. Write a query to find the 5th maximum salary in the employees table. 
select employee_id,first_name,salary
from employees
where salary =(
select distinct (salary)
from employees
order by  salary desc limit 1 offset 4);


-- 17. Write a query to find the 4th minimum salary in the employees table. 
select employee_id,first_name,salary
from employees
where salary =(
select distinct (salary)
from employees
order by  salary desc limit 1 offset 3);

-- 18. Write a query to select the last 10 records from a table. 
select employee_id,first_name,last_name
from employees
order by employee_id desc limit 10 offset 10;

-- 19.Write a query to list the department ID and name of all the departments where no employee is working. 
select department_id,department_name
from departments
where department_id not in(
select department_id
from employees
where department_id is not null);

-- 20. Write a query to get 3 maximum salaries. 
select employee_id,first_name,salary
from employees
where salary in(
select distinct (salary)
from employees 
)
order by salary desc limit 3;

-- 21. Write a query to get 3 minimum salaries. 
select employee_id,first_name,salary
from employees
where salary in(
select distinct (salary)
from employees 
)
order by salary  limit 3;

-- 22. Write a query to get nth max salaries of employees. 
select employee_id,first_name,salary
from employees
where salary in(
select distinct (salary)
from employees 
)
order by salary desc;