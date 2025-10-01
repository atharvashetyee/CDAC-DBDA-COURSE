use hr;
select * from employees;
select * from departments;
select * from locations;
-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
select d.department_id,d.department_name,l.street_address,l.city,l.state_province,
l.country_id
from departments d
join locations l
on d.location_id=l.location_id;

-- 2. Write a query to find the name (first_name, last name), department ID and name of all the employees
select concat(first_name," ",last_name),d.department_id
from employees e
join departments d 
on e.manager_id=d.manager_id;

-- 3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
select concat(e.first_name, ' ', e.last_name) as employee_name,j.job_title,
d.department_id,d.department_name
from employees e
join departments d 
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
join jobs j 
on e.job_id = j.job_id
where l.city = 'London';

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
select e.employee_id,concat(first_name," ",last_name) as full_n,d.manager_id,
e.last_name
from employees e
join departments d
on e.manager_id=d.manager_id;

-- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
select concat(first_name," ",last_name) as first_name,hire_date
from employees
where hire_date> hire_date="jones";

-- 6. Write a query to get the department name and number of employees in the department.
select d.department_name,count(department_name) as total
from departments d
join employees e
on d.manager_id=e.manager_id 
group by department_name;

-- 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
select employee_id,job_id,hire_date,timestampdiff(days,hire_date,curdate())
from employees e
join department d
on e.manager_id=d.manager_id
where d.department_id=90