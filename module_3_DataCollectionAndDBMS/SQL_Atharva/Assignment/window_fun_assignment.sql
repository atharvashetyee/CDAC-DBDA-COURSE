-- find the top 3 highest paid employees in each department using rank()
select *
from (
  select employee_id, first_name, last_name, department_id, salary,
         rank() over (partition by department_id order by salary desc) as sal_rank
  from employees
) as ranked
where sal_rank <= 3 ;

-- assign a unique row number to each employee within their department using row_number() based on salary descending
select employee_id, first_name, last_name, department_id, salary,
       row_number() over (partition by department_id order by salary desc) as row_num
from employees;

-- list departments where at least two employees share the same salary rank using dense_rank()
select department_id
from (
  select department_id,
         dense_rank() over (partition by department_id order by salary desc) as sal_rank
  from employees
) ranked
group by department_id, sal_rank
having count(*) >= 2;

-- divide employees into 4 equal salary groups using ntile(4) and display the group number along with employee details
select employee_id, first_name, last_name, department_id, salary,
       ntile(4) over (order by salary desc) as salary_group
from employees;

-- function 

-- for each employee, show their salary and the average salary of their department using avg() as a window function
select employee_id, first_name, last_name, department_id, salary,
       avg(salary) over (partition by department_id) as avg_dept_salary
from employees;

-- show the running total of salaries for each department ordered by hire date using sum() window function
select employee_id, first_name, department_id, hire_date, salary,
       sum(salary) over (partition by department_id order by hire_date) as running_total
from employees;

-- find the maximum salary in each department and compare it with each employee’s salary
select employee_id, first_name, department_id, salary,
       max(salary) over (partition by department_id) as max_dept_salary
from employees;


-- value function

-- for each employee, show their salary and the salary of the employee hired just before them using lag()
select employee_id, first_name, hire_date, salary,
       lag(salary) over (order by hire_date) as previous_salary
from employees;

-- display each employee’s salary and the salary of the next hired employee in the same department using lead()
select employee_id, first_name, department_id, hire_date, salary,
       lead(salary) over (partition by department_id order by hire_date) as next_salary
from employees;

-- list each department and show the first and last hired employee using first_value() and last_value()
select department_id, employee_id, first_name, hire_date,
       first_value(first_name) over (partition by department_id order by hire_date) as first_hired,
       last_value(first_name) over (partition by department_id order by hire_date
         rows between unbounded preceding and unbounded following) as last_hired
from employees;


