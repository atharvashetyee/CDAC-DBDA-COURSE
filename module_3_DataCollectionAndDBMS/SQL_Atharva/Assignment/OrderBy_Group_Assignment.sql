use hr;
select * from employees ;

-- 1.Write a SQL query to find the number of employees hired in each year.
select count(employee_id) as ct,year(hire_date) as hd
from employees
group by hire_date
having hd<=1
order by hd;

-- 2.Write a SQL query to find the number of employees in each department.
select department_id,count(employee_id) as ct
from employees
group by department_id
order by ct;

-- 3.Write a SQL query to find the department with the highest total salary.
select department_id,sum(salary) as total
from employees
group by department_id
order by total desc limit 1;

-- 4. Write a query to list the number of jobs available in the employees table.
select job_id, count(job_id) as jc
from employees
group by job_id
order by jc;

-- 5.Write a query to get the total salaries payable to employees.
select sum(salary) as sal
from employees;

-- 6.Write a query to get the minimum salary from the employees table.
select min(salary)
from employees;

-- 7.Write a query to get the maximum salary of an employee working as a Programmer. 
select job_id as jt,max(salary)
from employees
group by job_id
having job_id="IT_PROG";

-- 8.Write a query to get the average salary and number of employees working the department 90. 
select department_id,avg(salary) 
from employees
group by department_id
having department_id=90;

-- 9.Write a query to get the highest, lowest, sum, and average salary of all employees
select max(salary) as max,min(salary) as min,sum(salary) as sum,avg(salary) as average
from employees;

-- 10.Write a query to get the number of employees with the same job
select job_id,count(job_id) as ji
from employees
group by job_id;

-- 11.Write a query to get the difference between the highest and lowest salaries. 
select max(salary) as max_s,min(salary) as min_s,
max(salary) -min(salary) as difference
from employees;

-- 12.Write a query to find the manager ID and the salary of the lowest-paid employee for that manager. 
select manager_id,min(salary) as m_s
from employees
where manager_id
group by manager_id
order by m_s limit 1;

-- 13.Write a query to get the department ID and the total salary payable in each department.
select department_id,sum(salary) as sal_payable
from employees
group by department_id
order by sal_payable;

-- 14.Write a query to get the average salary for each job ID excluding programmer. 
select job_id,avg(salary) as avg_sal
from employees
where job_id != "IT-PROG"
group by job_id;

-- 15.Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only. 
select job_id,sum(salary) as sum_s,max(salary) as max_s,min(salary) as min
from employees
where department_id=90
group by job_id;

-- 16.Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
select job_id,max(salary)
from employees
group by job_id
having max(salary)>=4000; -- cant use aggregate func in where clause

-- 17.Write a query to get the average salary for all departments employing more than 10 employees. 
select department_id,avg(salary) as avg_sal,count(employee_id) as ei
from employees
group by department_id
having ei>10
order by avg_sal;