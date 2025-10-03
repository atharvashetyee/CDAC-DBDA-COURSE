use practice;

-- Ranking function
-- 1.Find the top 3 highest paid employees in each department using RANK().
with RankEmp as(
	select first_name,last_name,department_id,salary,
    rank() over (partition by department_id order by salary desc) as sal_rank
    from employees
)
select first_name,last_name,department_id,salary,sal_rank
from RankEmp
where sal_rank<=3
order by sal_rank;

-- 2.Assign a unique row number to each employee within their department using ROW_NUMBER() based on salary descending.
with sal_rank as (
	select first_name,last_name,department_id,salary,
    row_number() over (partition by department_id order by salary desc) as row_no
    from employees
)
select first_name,last_name,department_id,salary,row_no
from sal_rank
order by department_id;

-- 3.List departments where at least two employees share the same salary rank using DENSE_RANK().
with same_sal as (
 select first_name,last_name,department_id,salary,
 dense_rank() over (partition by department_id order by salary desc) as same
 from employees
)
select distinct department_id
from same_sal
where department_id in(
		select department_id
        from same_sal
        group by department_id,same
        having count(*)>=2
);

-- 4.Divide employees into 4 equal salary groups using NTILE(4) and display the group number along with employee details.


-- 5.Find the top 3 highest paid employees in each department using RANK().
-- 6.Assign a unique row number to each employee within their department using ROW_NUMBER() based on salary descending.
with same_sal as (
	select employee_id,department_id,salary,
    row_number() over (partition by department_id order by salary desc) as sal
	from employees
)
select employee_id,department_id,salary,sal
from same_sal
order by department_id ;

-- 7.List departments where at least two employees share the same salary rank using DENSE_RANK().
with same_sal as (
	select employee_id,department_id,salary,
    dense_rank() over(partition by department_id order by salary) as sal
    from employees
)
select distinct department_id
from same_sal
where department_id in(
select department_id
from same_sal
group by department_id,sal
having count(*)>=2);

-- 8.Divide employees into 4 equal salary groups using NTILE(4) and display the group number along with employee details.
with same_sal as (
	select employee_id,department_id,salary,
    NTILE(4) over( order by salary) as sal
    from employees
)
select distinct employee_id,department_id,salary,sal
from same_sal;

-- Aggregate function
-- 1.For each employee, show their salary and the average salary of their department using AVG() as a window function.
with avg_sal as(
	select salary,department_id,
    avg(salary) over(partition by department_id) as avg_s
	from employees
)
select department_id,salary,avg_s
from avg_sal
;

-- 2. Show the running total of salaries for each department ordered by hire date using SUM() window function.
with hd as (
	select department_id,salary,hire_date,
    sum(salary) over (partition by department_id order by hire_date) as sal
    from employees
)
select department_id,hire_date,sal
from hd
order by hire_date;

-- 3.Find the maximum salary in each department and compare it with each employee’s salary.
with comp as(
	select department_id,salary,
    max(salary) over (partition by department_id ) as sal
    from employees
)
select department_id,salary,sal
from comp;

-- Value functions
-- 1.For each employee, show their salary and the salary of the employee hired just before them using LAG().
with bef as (
	select employee_id,salary,hire_date,
    lag(salary) over (order by hire_date) as lag_sal
	from employees
)
select employee_id,salary,hire_date,lag_sal
from bef;

-- 2.Display each employee’s salary and the salary of the next hired employee in the same department using LEAD().
with nxt as(
	select department_id,employee_id,salary,hire_date,
    lead(salary) over (partition by department_id order by hire_date) as ld
	from employees
)
select department_id,salary,hire_date,ld
from nxt;

-- 3.List each department and show the first and last hired employee using FIRST_VALUE() and LAST_VALUE() functions.
with hr as(
	select employee_id,department_id,hire_date,
    first_value(employee_id) over (partition by department_id order by hire_date) as fr,
    last_value(employee_id) over (partition by department_id order by hire_date 
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) as ls
    from employees
)
select department_id,hire_date,fr,ls
from hr;