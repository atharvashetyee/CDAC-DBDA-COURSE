-- ======================================================================================
-- Q1.Write a stored procedure to retrieve all employees from the Employees table for a given department ID.
delimiter $$
create procedure q1(in d_id int)
deterministic
begin
		select * 
        from employees
        where department_id=d_id;
end;;
$$
delimiter ;

call q1(100);

-- ======================================================================================
-- 2.Create a function that calculates the total salary expenditure for a given department ID.
delimiter $$
create function q2(dept_id int)
returns varchar(2000)
deterministic
begin
	declare total_sal varchar(200);
    select sum(salary) into total_sal
	from employees
    where DEPARTMENT_ID=dept_id;
    return total_sal;
end;;
$$
delimiter ;

select q2(100);
-- ======================================================================================
-- 3.Develop a stored procedure that accepts an employee ID as an input parameter and increases the salary of that employee by a specified percentage.

-- ======================================================================================
-- 4.Write a function to determine the average salary for employees in a specific job title category.

select * from employees;
select * from jobs;

delimiter $$
create function q4(job_tit varchar(40))
returns varchar(5000)
deterministic
begin
	declare tot varchar(5000);
    select avg(salary) into tot
	from employees e
    join jobs j
    on e.job_id=j.job_id
    where job_title=job_tit;
	return tot;
end ;;
$$
delimiter ;

select q4("Sales Manager");
----------------------------------------------------------------------------
-- 5.Create a stored procedure that takes an employee's first name and last name as input parameters and returns the full name in uppercase letters.
select upper(concat(first_name," ",last_name)) as full_name
from employees;

delimiter $$
create procedure q5(in f_name varchar(10),in l_name varchar(10),inout p_full varchar(50))
deterministic
begin
		select upper(concat(first_name," ",last_name)) as full_name into p_full
		from employees
        where FIRST_NAME=f_name and LAST_NAME=l_name;
end;;
$$
delimiter ;

call q5("sarah", "bell",@sarahbell);
select @q5;

-------------------------------------------------------------------------------------------------------
-- 6.Write a stored procedure to insert a new employee into the Employees table with the provided first name, last name, and department ID.
DELIMITER $$
create procedure add_new_employee(
    in p_first_name varchar(20),
    in p_last_name varchar(25),
    in p_email varchar(25),        
    in p_job_id varchar(10),       
    in p_department_id int
)
begin
  insert into employees (
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        department_id
    )
    values (
        p_first_name,
        p_last_name,
        p_email,
        curdate(),  
        p_job_id,
        p_department_id
    );
end$$

DELIMITER ;

------------------------------------------------------------------------------------------
-- 7.Create a function to calculate the total number of employees in a specific department
delimiter $$
create function q7(d_id int)
returns varchar(1000)
deterministic
begin
	declare d varchar(1000);
	select count(EMPLOYEE_ID) into d
	from employees
	where DEPARTMENT_ID=d_id;
    return d;
end ;;
$$
delimiter ;

select q7(100);

--------------------------------------------------------------------------------------------
-- 8.Develop a stored procedure that accepts an employee ID as input and deletes that employee's record from the Employees table.
delimiter $$
create procedure q8(in d_id int)
deterministic
begin
		delete 
		from employees 
		where EMPLOYEE_ID=d_id;
end ;;
$$
delimiter ;

call q8(205);
---------------------------------------------------------------------------------------------
-- 9.Write a function to determine the 3rd highest salary in the Employees table.

delimiter $$
create procedure q9()
begin
	select salary
	from employees
    order by salary desc limit 1 offset 3;
end ;;
$$
delimiter ;

call q9();
------------------------------------------------------------------------------------------------
-- 10. Create a stored procedure that takes a department ID as an input parameter and returns the list of employees sorted by their salary in descending order within that department
delimiter $$
create procedure q10(in d_id int)
deterministic
begin
		select employee_id,department_id,salary
		from employees
		where DEPARTMENT_ID=d_id
		order by salary desc;
end ;;
$$
delimiter ;

call q10(100);
------------------------------------------------------------------------------------------------
-- 11.Write a stored procedure to update the job title of an employee based on their employee ID.
select * from employees;
select * from jobs;

update employees e
join jobs j
on e.job_id=j.job_id
set job_title="SH_CLERK"
where employee_id=200;

delimiter $$
create procedure q11(in e_id int, j_tit varchar(500))
deterministic
begin
		update employees e
		join jobs j
		on e.job_id=j.job_id
		set job_id=j_tit
		where employee_id=e_id;

end ;;
$$
delimiter ;

call q11(200,"SH_CLERK");
select * from employees where EMPLOYEE_ID=200;
