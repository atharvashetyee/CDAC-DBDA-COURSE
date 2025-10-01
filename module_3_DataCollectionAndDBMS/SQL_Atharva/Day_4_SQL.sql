select * from employees;
select * from countries;
select * from departments;
select * from job_history;
select * from jobs;
select * from locations;
select * from regions;
----------------------------------------------------------------------------------------------------------
-- ADD in alter 
-- add new colmn
alter table regions add column country_id int(20);
----------------------------------------------------------------------------
-- add column with some constriants
alter table regions add column dept_id varchar(10) default "10";
select * from regions;
----------------------------------------------------------------------------
-- adding 2 column
alter table regions add column emp_id int(10), 
add column department_name varchar(30) default "Development";
----------------------------------------------------------------------------
-- add columns using data type enums
alter table employees add column status enum("Active","Inactive")
default "Inactive";
select  * from  employees;

create table emp_ex(
	emp_id int(10),
    ename varchar(20),
    dept_id int
);

desc table emp_ex;
----------------------------------------------------------------------------
-- add primary key
alter table emp_ex modify column emp_id int(10) auto_increment primary key ;
select * from emp_ex;
alter table employees drop column emp_ex;
----------------------------------------------------------------------------
-- pre existing attribute to primary key using add
alter table emp_ex add primary key (emp_id);

create table emp_ex2(
	emp_id int(10),
    ename varchar(20),
    dept_id int,
    saalry int(10)
);
----------------------------------------------------------------------------
-- alter primary key constraint name

alter table emp_ex2 add constraint primary key(emp_id); 

alter table emp_ex2 add constraint pk_emp_id primary key(emp_id); -- using a name to constraint 
----------------------------------------------------------------------------
-- alter with check constraint
use hr;
alter table emp_ex2 rename column saalry to salary; 
alter table emp_ex2 add constraint chk_salary check(salary>50000);
----------------------------------------------------------------------------
-- trying alter commands
create table emp_ex3(
	emp_id int(10),
    ename varchar(20),
    dept_id int,
    salary int(10),
    location varchar(50)
);

alter table emp_ex3 add constraint primary key(emp_id);

alter table emp_ex3 modify location varchar(50) default "Mumbai";

alter table emp_ex3 add constraint chk_sal check(salary>20000);

alter table emp_ex3 modify dept_id int(10) not null auto_increment; -- look how this works

-- add index
alter table emp_ex2 add index (emp_id);
desc emp_ex2;
show indexes from emp_ex2;

------------------------------------------------------------------------------------------------------------------ 

-- modify 
select * from employees;
select * from countries;
select * from departments;
select * from job_history;
select * from jobs;
select * from locations;
select * from regions;
----------------------------------------------------------------------------
-- modify data type for phone number
create table emp_ex4(
	emp_id int(10),
    ename varchar(20),
    dept_id int,
    salary varchar(10),
    location varchar(50)
);
alter table emp_ex4 modify column salary int(10);
select * from emp_ex4;
desc emp_ex4;
desc employees;
----------------------------------------------------------------------------
-- modify the current time stamp
alter table emp_ex3 add column doj datetime;
alter table emp_ex3 modify column doj timestamp default current_timestamp();
desc emp_ex3;

alter table emp_ex3 add column status enum("Inactive","Active","Resigned","Long leave")
default "Long Leave";

desc emp_ex3;
----------------------------------------------------------------------------
-- modify auto_increment
create table emp_ex5(
	emp_id int(10),
    ename varchar(20),
    location varchar(50)
);
desc emp_ex5;

alter table emp_ex5 modify column emp_id int(10) auto_increment,
auto_increment=2000;  -- look after this
drop table emp_ex5;
----------------------------------------------------------------------------
-- rename by using change- we can change the name along with data type
alter table regions change column region_id r_id decimal(5,2);
desc regions;

-- using rename- this only changes the name not data type
alter table regions rename column region_name to r_name;
desc regions;

alter table regions rename column country_id to c_id,rename column dept_id to d_id;
-----------------------------------------------------------------------------
-- drop from the table
alter table regions
drop column d_id;

alter table emp_ex
drop column emp_id;
desc emp_ex;

alter table emp_ex 
add column emp_ int(10) auto_increment primary key;

-----------------------------------------------------------------------------
-- truncate is used to remove all the records from the table
select *from employees;

truncate table employees;
-----------------------------------------------------------------------------
