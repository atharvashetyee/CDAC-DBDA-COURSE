use northwind;
use hr;
show tables;
select * from employees;
select * from departments;
show tables;
select department_name,salary
from employees e
join departmnets d
on d.department_id =e.DEPARTMENT_ID;

-----------------------------------------------------------------------------------


 -- select concat(fisrt_name,' ',last_amme)as full_nam,
department_id,locationIT,city,country,country_zo;
from employees e
join departments d
on departments d=employees e
join location l
on ;

-- do this one again!!!!!!!!!!!!!! the above one 

-- query to find the emp where emp salary>avg(salary)
select first_name,last_name,salary
from employees
where salary>(
select avg(salary)
from employees);

-- emp who earns more than avg salary of their dept
select employee_id,concat(first_name," ",last_name)as full_name,salary,DEPARTMENT_ID
from employees 
where salary>(
select avg(salary)
from employees
where department_id=department_id
);

SELECT
  employee_id,
  first_name,
  last_name,
  salary
FROM employees 
WHERE
  salary > (
    SELECT
      AVG(salary)
    FROM employees 
    WHERE
      department_id = department_id
  );
--------------------------------------------------------------------------
select avg(salary)
from employees
where DEPARTMENT_ID=90;
---------------------------------------------------------------------------------
-- find dept id,name, emlopyee>10
select d.department_id,d.DEPARTMENT_NAME
from employees e
join departments d
where department_id >(
select count(department_id)
from employees

group by d.department_id
having count(department)>10;


--------------------------------------------------------------------------
--  CTE

with print as
(select "Hello" as welcome_note)
select wlecome_note from print;

-- find employee earning more than their avg sal of dept
with avg_count as 
(select avg(salary) from employees 
group by department_id)
select * from avgcount;
);

select first_name,dept_avg,c.departmnet_id
from employees e
join avg_count c
on e.DEPARTMENT_id=c.department_id
where e.salry>=dept_join;

-- find dept where there ae zero emp working
select first_name,last_name
from departments
where departmnet_id not in(
select departmnent_id
from employees
where deaprtment_id is not null);
;

select department_id,department_name
from departments
where department_id not in(
select department_id
from employees
where department_id is not null);

with emp_dept as
(
	select distinct department_id from employees
    where department_id is not null
)
select d.department_id,d.department_name
from departments d
left join emp_dept e ;


-- find no of emp working in each dept,including 0 emp dept
select department_id,department_name
from departments
where department_id not in(
select department_id
from employees
where department_id is not null);

-- find dept where there is no manager assigned
with no_mana as(
	select distinct department_id 
    from departments
    where MANAGER_ID=0
)
select department_name,department_id;

select distinct department_id ,DEPARTMENT_NAME,manager_id
    from departments
    where MANAGER_ID=0;
    
-- to write multiple CTEs
with emp_dept as
(
	select employee_id,department_id,salary
    from employees
),
r_map as
(
	select d.department_id,d.department_name,l.city,c.country_name,
    trim(replace(r.r_name,"\r",'')) as region_name
    from departments d
    join locations l 
    on d.location_id=l,location_id
    join countries c 
    on c.country_id=l.country_id
    join regions r
    on r.REGION_ID=c.REGION_ID
),
dept_co as 
(
	select department_id,count(*) as numb_of_emp from emp_dept
    group by department_id
)
select e.employee_id,d.department_id,r.city,r.region_name,d.numb_of_emp
from emp_dept e 
join dept_co d
on d.department_id=r.department_id;




-- write a query to find job id ,job title, count of job id and region name
with job as(
	select j.job_id,j.job_title,count(j.JOB_ID) as counting,r.region_name
    from jobs j
    join employees e
    on j.job_id=e.job_id
    join departments d
    on d.MANAGER_ID=e.MANAGER_ID
    join locations l
    on l.LOCATION_ID=d.LOCATION_ID
    join countries c
    on c.COUNTRY_ID=l.COUNTRY_ID
    join regions r
    on r.REGION_ID=c.REGION_ID
    group by JOB_ID
    order by job_id desc
)
select j.job_id,j.job_title,count(j.JOB_ID) as counting,r.region_name
from job;


------------------------------------------------------------------------------------------------------------------
-- AI
-- define the common table expression (cte) named 'job_region_data'
with job_region_data as (
    -- this first select statement joins all the necessary tables to link jobs to regions
    select
        j.job_id,
        j.job_title,
        r.region_name,
        e.employee_id -- we include employee_id to be able to count it later
    from
        jobs j
    join
        employees e on j.job_id = e.job_id
    join
        departments d on e.department_id = d.department_id
    join
        locations l on d.location_id = l.location_id
    join
        countries c on l.country_id = c.country_id
    join
        regions r on c.region_id = r.region_id
)
-- this is the final select statement that queries the data from our cte
select
    job_id,
    job_title,
    region_name,
    count(employee_id) as number_of_employees
from
    job_region_data -- we select from the cte as if it were a real table
group by
    job_id,
    job_title,
    region_name
order by
    region_name,
    job_title;

------------------------------------------------------------------------------------------------------------------
-- Recursive CTEs
select department_id
from employees
union
select department_id
from departments;

select department_id
from employees
union all
select department_id
from departments;

select employee_id,salary
from employees
where salary>=5000
union all
select EMPLOYEE_ID,salary
from employees
where salary<=15000;

with ex_rec as (
	select employee_id,manager_id,first_name,0 as level
    from employees
    where manager_id is null
    
    union all
    
    select EMPLOYEE_ID,manager_id,first_name,1 as level
    from employees
    where DEPARTMENT_ID=90
)
select * 
from ex_rec;

select * 
from employees;

select * 
from jobs;
select distinct job_id 
from employees;

select job_id 
from employees
union all
select job_id 
from jobs;
---------------------------------------------------------------------------------------------------------
with ex_recc as (
select employee_id,first_name,j.job_id,salary,min_salary,max_salary,
case
	when e.salary<j.min_salary then "under paid"
    when e.salary>j.min_salary then "over paid" 
    else "OK"
end as sal_cat
from employees e 
right join jobs j 
on e.JOB_ID=j.job_id

union all
	
select employee_id,first_name,j.job_id,salary,min_salary,max_salary,
case
	when e.salary<j.min_salary then "under paid"
    when e.salary>j.min_salary then "over paid" 
    else "OK"
end as sal_cat
from employees e 
right join jobs j 
on e.JOB_ID=j.job_id
)
select distinct employee_id,sal_cat 
from ex_recc 
where sal_cat
like "Overpaid%" or sal_cat like "Underpaid%";

---------------------------------------------------------------------------------------------------------------------------
-- stored function

delimiter $$
create function get_emp_details(emp_id int)
returns varchar(100)
deterministic
begin
	declare f_name varchar(100);
    select concat(first_name," ",last_name) into f_name
    from employees where employee_id=emp_id;
    return f_name;
end;;
$$
delimiter ;
select get_emp_details(100) ;


delimiter $$
create function get_dept_details(f_name varchar(50))
returns int
deterministic
begin
	declare d_id int;
    select DEPARTMENT_ID into d_id
    from employees where first_name=f_name;
    return d_id;
end;;
$$
delimiter ;
select get_dept_details("Lex") ;

-- diff betn store procedure and function

-- find of years of exp by employee id
delimiter $$
create function get_expre_details(emp_id int)
returns int
deterministic
begin
	declare yrs int;
    select timestampdiff(years,hire_date,curdate()) into yrs
    from employees where employee_id=emp_id;
    return yrs;
end;;
$$
delimiter ;
select get_expre_details(101) ;

drop function get_expre_details;

DELIMITER $$

CREATE FUNCTION get_expre_details(emp_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE yrs INT;
    
    SELECT TIMESTAMPDIFF(YEAR, hire_date, CURDATE())
    INTO yrs
    FROM employees
    WHERE employee_id = emp_id;
    
    RETURN yrs;
END$$

DELIMITER ;

-- Call the function and provide a column alias for the result
SELECT get_expre_details(101) AS years_of_experience;

-- Drop the function
DROP FUNCTION get_expre_details;

----------------------------------------------------------------------------------------
-- no of employees from job_id ie IT prog
delimiter $$
create function get_emp_count(emp_id int)
returns int
deterministic
begin
	declare f_count int;
    select count(EMPLOYEE_ID) into f_count  
    from employees where job_id="IT_PROG";
    return f_count;
end;;
$$
delimiter ;
select get_emp_count(1) ;


-- the above code modified for any job id to search
DELIMITER $$

CREATE FUNCTION get_emp_count(p_job_id VARCHAR(10))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE f_count INT;
    
    SELECT COUNT(EMPLOYEE_ID)
    INTO f_count
    FROM employees
    WHERE job_id = p_job_id; -- Correctly using the parameter here
    
    RETURN f_count;
END$$

DELIMITER ;

-- Example calls to test the function
-- Count employees for the 'IT_PROG' job
SELECT get_emp_count('IT_PROG');

-- Count employees for the 'SA_REP' job
SELECT get_emp_count('SA_REP');

---------------------------------------------------------------------------------------------------

delimiter $$
create function get_emp_by_job_details(j_id varchar(100),sal int)
returns int
deterministic
begin
	declare count_emp int;
    select count(*) into count_emp  
    from employees where job_id=j_id and salary>sal;
    return count_emp;
end;;
$$
delimiter ;
select get_emp_by_job_details("IT_PROG",5000) ;

-------------------------------------------------------------------------------------------------------- 

delimiter $$
create function get_emp_name_details(list varchar(100))
returns varchar(5000)
deterministic
begin
	declare emp_list int;
    select group_concat(concat(first_name," ",last_name)separator",") into emp_list  
    from employees e 
    join departments d
    on e.department_id=d.DEPARTMENT_ID;
    return emp_list;
end;;
$$
delimiter ;
select get_emp_name_details("IT") ;

drop function get_emp_name_details;

----------------------------------------------------------------------------------------------------------------

delimiter $$
create procedure get_emp_by_id (in emp_id int)
deterministic
begin
	select * 
    from employees
    where employee_id=emp_id;
end;;
$$
delimiter ;
call get_emp_by_id(101);