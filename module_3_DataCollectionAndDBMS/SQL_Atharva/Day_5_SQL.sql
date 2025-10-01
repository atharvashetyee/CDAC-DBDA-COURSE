create database day_5;
use day_5;
create table emp_primary(
	s_id int ,
    s_name varchar(50),
    email varchar(20) primary key
);
drop table emp_primary;
alter table emp_primary drop primary key;
desc emp_primary;

alter table emp_primary modify column s_id int not null ;
alter table emp_primary add column s_id int unique;

-------------------------------------------------------------------------
create table emp_temp as select * from employees;
select * from emp_temp;

update emp_temp set salary =50000 where employee_id=100;

-- update the first name for employee_id 104

update emp_temp set first_name="Sam" where employee_id=104;

update emp_temp set department_id=30,manager_id=100 where employee_id=104;
-- condition increase
update emp_temp set salary =salary *1000 where salary<10000;

update emp_temp set manager_id=90 where job_id= "AD_VP" and department_id="90";

-- update for multiple department_id 
update emp_temp set manager_id=70 where department_id in(90,60,30,100); -- here "in" works as "or" so like if anything from bracket is present in record it will
-- make change
-------------------------------------------------------------------------
-- delete
select * from emp_temp;
delete from emp_temp where department_id=90;

delete from emp_temp where salary>100000;

delete from emp_temp where salary between 10000 and 30000;

-- rename table
rename table emp_temp to employee_temp_table;
show tables; 
-------------------------------------------------------------------------

-- DQL
show tables;
select * from employees order by salary; 

-- alis = temp name given to table
select salary,salary*100 as incremented_salary
from employees;

select salary,salary*100 increment from employess;

-- create table using aalias
create table tmp_employee as select* from employees;

select employee_id,concate(first_name," ",last_name) as full_name from employees;
select e.employee_id,concat (e.first_name," ",e.last_name) full_name
from employees; 
--------------------------------------------------------------------------------------

select upper(first_name),lower(last_name) from employees;
-------------------------------------------------------------------------------------

