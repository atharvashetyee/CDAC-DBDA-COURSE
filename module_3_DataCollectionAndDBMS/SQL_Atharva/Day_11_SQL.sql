delimiter $$
create procedure get_emp_by_dept_id(inout emp_id int,out dept_id int,out f_name varchar(100))
deterministic
begin
    select 
    concat(first_name," ",last_name)as full_name,department_id into f_name,dept_id 
    from employees 
    where Employee_id=emp_id;
end;;
$$
delimiter ;
set @emp_id=105;

call get_emp_by_dept_id(@emp_id,@dept_id,@f_name);
select @emp_id as employee_id,@dept_id as department_id,@f_name as full_name;

--------------------------------------------------------------------------------------------------------------------------------
-- procedure to get emp sal and dept wise emp count

delimiter $$
create procedure get_emp_join_inout(inout dept_id int,out total_sal int ,out no_of int)
deterministic
begin
    select 
    sum(salary),count(*) into total_sal,no_of
    from employees e
    right join departments d 
    on e.department_id=d.department_id
    where d.department_id=dept_id
    group by d.department_id;
end;;
$$
delimiter ;

set @emp_id=100;
call get_emp_join_inout(@dept_id,@total_sal,@no_of);

select @dept_id as department_id,@total_sal as total_sal,@no_of as no_of;
-----------------------------------------------------------------------------------------------------------
-- to insert into table

delimiter $$
create procedure insert_emp_jn(in employee_id int,in first_name varchar(50),
in last_name varchar(50),in salary decimal(10,2),department_id int)
deterministic
begin
	insert into employee_jn values
    (employee_id,first_name,last_name,salary,department_id);
end;;
$$
delimiter ;

CALL insert_emp_jn(21,'Emily', 'Jones', 6800.00, 20);
select * from employee_jn;

----------------------------------------------------------------------------------------------------------
-- to remove employee
delimiter //
create procedure remove_emp(in emp_id int)
deterministic
begin
	if exists(select 1 from employees where employee_id);
end;;
//
delimiter ;
------------------------------------------------------------------------------------------------------------

-- Trigger
create database trigger_1;
use trigger_1;
CREATE TABLE salary_history (
    emp_id INT,
    first_name VARCHAR(50),
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    department_id INT
);


CREATE TABLE employee (
  employee_id INT,
  name VARCHAR(50),
  salary FLOAT,
  department_id INT
);


INSERT INTO employee (employee_id, name, salary, department_id)
VALUES
  (1, 'John Smith', 50000.0, 101),
  (2, 'Jane Doe', 60000.0, 102),
  (3, 'Bob Johnson', 55000.0, 101),
  (4, 'Mary Brown', 65000.0, 103),
  (5, 'Tom Davis', 70000.0, 102);
------------------------------------------------------------------------------------------------
-- Trigger before insert
-- while inserting no salary in employee table
Before Insert:
delimiter $$
create trigger before_insert_into_employee
before insert on employee
for each row
begin
	-- new === this take new value 
    -- old == this take old vvalues in the table
    if new.salary is null then
		set new.salary=15000.0;
	end if;
    
end;;
$$
delimiter ;
-- --------------------------------------------------------------------------------------------------------- 
drop trigger before_insert_into_employee;
select * from  employee;
 
INSERT INTO employee (employee_id, name,  department_id)
VALUES(6, 'Karen Smith', 101);
-----------------------------------------------------------------------------------------------------------

-- trigger before inserting
-- trying to insert wrong mail id
use hr;
delimiter $$
create trigger before_insert_into_employee_eg3
before insert on employees
for each row
begin
	
    if new.email not like '%@%' then
		signal SQLSTATE '45000'
			set message_text="Invalid email type";
        
	end if;
    
end;;
$$
delimiter ;
INSERT INTO employee (employee_id, name)
VALUES(7, ' Will Smith');


INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`) VALUES
('1001', 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', '24000.00', '0.00', '0', '90');

---------------------------------------------------------------------------------------------------------------------------------

-- Trigger after insert
DELIMITER $$
CREATE TRIGGER trg_employee_salary_change
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
if (NEW.salary <> OLD.salary) then
  INSERT INTO salary_history (employee_id, first_name, old_salary, new_salary, department_id)
  VALUES (old.employee_id, old.first_name,OLD.salary, NEW.salary, old.department_id);
END;
DELIMITER 

-- Insert a new employee with the same salary
INSERT INTO employee (employee_id, name, salary) VALUES (57, 'Jane Smith', 50000.00);

SELECT * FROM salary_history;
-- Create a logging table to store the messages
CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_message VARCHAR(255),
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Create the trigger to log messages after employee insertions





DELIMITER $$


CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    -- Insert the message into the logging table
    INSERT INTO employee_log (log_message)
    VALUES (CONCAT('A new employee has been inserted with ID: ', NEW.employee_id));
END;
$$


DELIMITER ;
INSERT INTO employee (employee_id, name, salary)
VALUES (10, 'John Doe', 50000.00);


select * from employee;
select * from employee_log;







