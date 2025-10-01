create database day_7;
use day_7;
show tables;

--------------------------------------------------------------------------------------------------------------
desc employees;

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
dayname(hire_date)
from employees;

-- YYYY-MM-DD
-- HH:MM:SS

-- give employees joined today
select employee_id,concat(first_name ," ",last_name),hire_date
from employees
where hire_date=curdate();
insert into employees values
('453', 'Randall', 'Matos', 'RMAERTOS', '650.121.2874', '2025-09-25', 'ST_CLERK', '2600.00', '0.00', '124', '50'),
('400', 'Randall', 'Matos', 'RMAERTDS', '650.121.2874', '2025-09-15', 'ST_CLERK', '2600.00', '0.00', '124', '50');

select curtime();
select count(*) as no_of_emp,curtime() as report_generated_time
from employees;

-- date_add/ date_sub
select date_add("2025-09-25",interval 1 year);
select date_add("2025-09-25",interval 1 month);
select date_add("2025-09-25",interval 1 day);
select date_add("2025-09-25",interval "6_2" year_month); -- this adds year and month in the date together

select date_sub("2025-09-25",interval 1 year);
select date_sub("2025-09-25",interval 1 month);
select date_sub("2025-09-25",interval 1 day);

-- find emp whose provision will end in next 30 days

select employee_id,concat(first_name," ",last_name) as full_name,
date_add(hire_date,interval 30 day) as probation_end_date
from employees;

-- find employees who has been hired in last 30 days
select employee_id,concat(first_name,"",last_name) as full_name,
hire_date
from employees 
where hire_date>=date_sub(curdate(),interval 30 day);

-- to find cust who has put order in last 30 days
select order_id,cust_name,order_date
from orders
where order_date>=date_sub(curdate(),interval 30 day);

-- to get result in days format
select datediff(curdate(),hire_date) as date_diff
from employees;

-- find employees who has been hired in last 30 days using datediff
select employee_id,concat(first_name,"",last_name) as full_name,
hire_date
from employees 
where datediff(curdate(),hire_date)<=30;

-- you have to find years
select employee_id,concat(first_name,"",last_name) as full_name,
hire_date,round(datediff(curdate(),hire_date)/365) as year
from employees;
--------------------------------------------------------------------------------------------------------------

-- time stamp
select timestampdiff(day,hire_date,curdate())
from employees;

select timestampdiff(month,hire_date,curdate())
from employees;

select timestampdiff(year,hire_date,curdate())
from employees;

-- find employees who has been hired in last 30 days
select employee_id,concat(first_name,"",last_name) as full_name,hire_date
from employees
where timestampdiff(day,hire_date,curdate())<=30;

-- to change date format
select date_format("2025-09-25","%d"-"%m"-"%y");

-- find emp who have served for 35 +years
select employee_id,concat(first_name,"",last_name)as full_name,hire_date
from employees
where timestampdiff(year,hire_date,curdate())>35;

-- find employees hired in month of august
select employee_id,concat(first_name,"",last_name) as full_name,hire_date
from employees
where month(hire_date)=08;

-- find emp who are having work anniversary in next 30 days
select employee_id,concat(first_name,"",last_name) as full_name,hire_date
from employees
where month(hire_date)=month(curdate())and 
day(hire_date) between day(curdate()) and (hire_date)+30;

-------------------------------------------------------------------------------------------

-- working on northwind
select concat(first_name," ",last_name) as full_name, birth_date, 
timestampdiff(year,birth_date,curdate())
from employees;

select * from orders;

-- cal how many days ago the order was placed
select order_id,order_date,
timestampdiff(day,order_date,curdate())
from orders;

-- find order that was placed in year 1997
select order_id,order_date
from orders
where year(order_date)=1997;

-- find diff betn order date and ship date
select order_id,order_date,timestampdiff(day,order_date,shipped_date)
from orders;

--------------------------------------------------------------------------------------------------------------

-- conditional function

-- if

-- syntax= if(condn,true statment,false statement)
use hr;
select *from employees;
select concat(first_name," ",last_name) as full_name,salary,
if(salary>10000,"High Salary","Low Salary")as sal_catgory
from employees;

select concat(first_name," ",last_name) as full_name,commission_pct,
if(commission_pct>0.15,"High Commission","Low Commission") as comm_cat
from employees 
where department_id in (60,70,90);

-- to check veteran
select concat(first_name," ",last_name) as full_name,
if(year(hire_date)<1997,"Veteran","Normal") as emp_cat
from employees;

-- where you are classifying emp by job id,if id is fi_mgr,pu_man
use hr;
select employee_id,concat(first_name," ",last_name) as full_name,job_id,
if(job_id in("fi_mgr","pu_man"),"Manager","Employee")
from employees;

-- find len of first name if len is less than 5 its short name or else long name
select employee_id,concat(first_name," ",last_name) as full_name,job_id,
if(length(first_name)<5,"Short Name","Long Name") as name_len
from employees;

-----------------------------------------------------------------------------------------------------------
-- case
select concat(first_name," ",last_name) as full_name,job_id,
case
	when job_id like "fi_mrg" then "finance manager"
    when job_id like "ad_pres" then "President"
    else "other"
end as job_cat
from employees;


-- categorize the salary in three catgories
select concat(first_name," ",last_name) as full_name,job_id,salary,
case
	when salary<5000 then "Low Salary"
    when salary>5000 and salary<10000 then "Mid Range"
    when salary>=10000 then "High Salary"
    else "NA"
end as sal_cat
from employees;

----------------------------------------------------------------------------------------------------------
use northwind;
-- ifnull
select order_id,customer_id,ship_region,
ifnull(ship_region,"NA") as ship_check
from orders;

select order_id,customer_id,ship_region,
ifnull(shipped_date,"NA") as ship_check
from orders;

select customer_id,
coalesce(region,"NA") as region_check
from customers;

select first_name,last_name,
coalesce(home_phone,extension,"NA") as no_info
from employees;

select avg(salary)
from employees;