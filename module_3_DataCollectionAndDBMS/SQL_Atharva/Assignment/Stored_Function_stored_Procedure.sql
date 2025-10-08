-- Ques1. Write a stored procedure to retrieve all employees from the Employees table for a given department ID.
use hr;
delimiter $$

create procedure emp_with_dept_id(
	in dept_id int
)
begin 
	select * from employees
    where department_id = dept_id;
end$$
delimiter ;
 
call emp_with_dept_id(10);

-- Ques 2. Create a function that calculates the total salary expenditure for a given department ID.
delimiter //

create function get_totlal_sal(
	 dept_id int
)
returns decimal(15,2)
deterministic
begin
	declare total_salary decimal(15,2);
    select sum(salary) into total_salary
    from employees
    where department_id = dept_id;
    return ifnull(total_salary,0);
end //
delimiter ;

select get_totlal_sal(10);

-- Ques 3. Develop a stored procedure that accepts an employee ID as an input parameter and increases the salary of that employee by a specified percentage.
delimiter $$

create procedure increase_salary (
    in p_emp_id int,
    in p_percent decimal(5,2)
)
begin
    update employees
    set salary = salary + (salary * p_percent / 100)
    where employee_id = p_emp_id;
end$$

delimiter ;

call increase_salary(101, 12.5);

-- Ques4. Write a function to determine the average salary for employees in a specific job title category.

delimiter $$
create function avg_sal_with_jobtitle(
	p_job_title varchar(50)
)

returns decimal(10,2)
deterministic
begin
	declare avg_sal decimal(10,2);
    
    select avg(salary)
    into avg_sal
    from employees
    where job_title = p_job_title;
	
    return avg_sal;
end$$

delimiter ;

select avg_sal_with_jobtitle('Sales Representative') as avg_salary;

-- q5: average salary for employees in a specific job title
delimiter $$
create function fn_avg_salary_by_job(p_job_title varchar(50))
returns decimal(15,2)
deterministic
begin
    declare v_avg decimal(15,2);
    select round(avg(salary),2) into v_avg
    from employees
    where job_title = p_job_title;
    return v_avg;
end $$
delimiter ;

-- q6: highest salary in employees table
delimiter $$
create function fn_highest_salary()
returns decimal(15,2)
deterministic
begin
    declare v_max decimal(15,2);
    select coalesce(max(salary),0) into v_max from employees;
    return v_max;
end $$
delimiter ;

-- q7: number of employees in a specific department
delimiter $$
create function fn_count_by_dept(p_dept_id int)
returns int
deterministic
begin
    declare v_count int;
    select count(*) into v_count from employees where department_id = p_dept_id;
    return v_count;
end $$
delimiter ;

-- q8: number of employees hired in a specific year
delimiter $$
create function fn_count_hired_in_year(p_year int)
returns int
deterministic
begin
    declare v_count int;
    select count(*) into v_count
    from employees
    where year(hire_date) = p_year;
    return v_count;
end $$
delimiter ;

-- q9: average tenure (in years) of employees in company
delimiter $$
create function fn_avg_tenure_years()
returns decimal(6,2)
deterministic
begin
    declare v_avg decimal(6,2);
    select round(avg(timestampdiff(year, hire_date, curdate())),2) into v_avg
    from employees
    where hire_date is not null;
    return v_avg;
end $$
delimiter ;

-- q10: total experience (years) of all employees combined
delimiter $$
create function fn_total_experience_years()
returns int
deterministic
begin
    declare v_total int;
    select sum(timestampdiff(year, hire_date, curdate())) into v_total
    from employees
    where hire_date is not null;
    return coalesce(v_total,0);
end $$
delimiter ;

-- q11: average age of employees (based on birthdate)
delimiter $$
create function fn_avg_age()
returns decimal(6,2)
deterministic
begin
    declare v_avg decimal(6,2);
    select round(avg(timestampdiff(year, birth_date, curdate())),2) into v_avg
    from employees
    where birth_date is not null;
    return v_avg;
end $$
delimiter ;
-- q12: insert a new employee (first name, last name, department id)
delimiter $$
create procedure sp_insert_employee(p_first_name varchar(50), p_last_name varchar(50), p_dept_id int)
begin
    insert into employees (first_name, last_name, department_id)
    values (p_first_name, p_last_name, p_dept_id);
end $$
delimiter ;

-- q13: delete an employee by employee_id
delimiter $$
create procedure sp_delete_employee(p_emp_id int)
begin
    delete from employees where employee_id = p_emp_id;
end $$
delimiter ;

-- q14: update job title of an employee by employee_id
delimiter $$
create procedure sp_update_job_by_id(p_emp_id int, p_job_title varchar(50))
begin
    update employees set job_title = p_job_title where employee_id = p_emp_id;
end $$
delimiter ;

-- q15: update email address of an employee based on id
delimiter $$
create procedure sp_update_email_by_id(p_emp_id int, p_email varchar(100))
begin
    update employees set email = p_email where employee_id = p_emp_id;
end $$
delimiter ;

-- q16: insert new employee with first, last and department id and return last_insert_id()
delimiter $$
create procedure sp_insert_employee_full(p_first_name varchar(50), p_last_name varchar(50), p_dept_id int, out p_new_id int)
begin
    insert into employees (first_name, last_name, department_id)
    values (p_first_name, p_last_name, p_dept_id);
    set p_new_id = last_insert_id();
end $$
delimiter ;

-- q17: get employee details (name, department, salary) by id
delimiter $$
create procedure sp_get_employee_details(p_emp_id int)
begin
    select e.employee_id, concat(e.first_name,' ',e.last_name) as full_name,
           d.department_name, e.salary, e.job_title
    from employees e
    left join departments d on e.department_id = d.department_id
    where e.employee_id = p_emp_id;
end $$
delimiter ;

-- q18: get employees by department sorted by salary desc
delimiter $$
create procedure sp_get_employees_by_dept_sorted(p_dept_id int)
begin
    select employee_id, first_name, last_name, salary
    from employees
    where department_id = p_dept_id
    order by salary desc;
end $$
delimiter ;

-- q19: retrieve top n highest-paid employees
delimiter $$
create procedure sp_top_n_paid(p_n int)
begin
    select employee_id, first_name, last_name, salary
    from employees
    order by salary desc
    limit p_n;
end $$
delimiter ;
-- q20: get employees with salary above threshold
delimiter $$
create procedure sp_employees_above_salary(p_threshold decimal(15,2))
begin
    select employee_id, first_name, last_name, salary
    from employees
    where salary > p_threshold
    order by salary desc;
end $$
delimiter ;
-- q21: get employees by job title with total compensation
delimiter $$
create procedure sp_employees_by_job_with_total_comp(p_job varchar(50))
begin
    select employee_id, first_name, last_name, job_title, salary,
           round(salary + coalesce(commission_pct,0) * salary,2) as total_compensation
    from employees
    where job_title = p_job
    order by total_compensation desc;
end $$
delimiter ;
-- q22: get employees by last name pattern
delimiter $$
create procedure sp_employees_by_lastname(p_lastname_pattern varchar(100))
begin
    select employee_id, first_name, last_name
    from employees
    where last_name like p_lastname_pattern;
end $$
delimiter ;
-- q23: get employees in a city
delimiter $$
create procedure sp_employees_by_city(p_city varchar(100))
begin
    select employee_id, first_name, last_name, city
    from employees
    where city = p_city;
end $$
delimiter ;
-- q24: calculate total bonus based on performance rating
delimiter $$
create function fn_total_bonus()
returns decimal(18,2)
deterministic
begin
    declare v_total decimal(18,2);
    select round(sum(
        salary *
        case
            when performance_rating >= 4 then 0.10
            when performance_rating >= 3 then 0.05
            else 0
        end
    ),2) into v_total
    from employees;
    return coalesce(v_total,0);
end $$
delimiter ;
-- q25: count employees with tenure greater than specified years
delimiter $$
create function fn_count_tenure_gt(p_years int)
returns int
deterministic
begin
    declare v_count int;
    select count(*) into v_count
    from employees
    where timestampdiff(year, hire_date, curdate()) > p_years;
    return coalesce(v_count,0);
end $$
delimiter ;
-- q26: total sales revenue by employee
delimiter $$
create function fn_total_sales_by_emp(p_emp_id int)
returns decimal(18,2)
deterministic
begin
    declare v_total decimal(18,2);
    select round(coalesce(sum(amount),0) + coalesce(sum(team_contribution),0),2) into v_total
    from sales
    where employee_id = p_emp_id;
    return v_total;
end $$
delimiter ;
-- q27: total working hours for employee in a month
delimiter $$
create function fn_total_hours_for_month(p_emp_id int, p_year int, p_month int)
returns decimal(10,2)
deterministic
begin
    declare v_hours decimal(10,2);
    select coalesce(sum(work_hours),0) into v_hours
    from attendance
    where employee_id = p_emp_id
      and year(attend_date) = p_year
      and month(attend_date) = p_month;
    return v_hours;
end $$
delimiter ;
-- q28: department name and employee count
delimiter $$
create procedure sp_dept_name_and_count(p_dept_id int)
begin
    select d.department_id, d.department_name, count(e.employee_id) as employee_count
    from departments d
    left join employees e on d.department_id = e.department_id
    where d.department_id = p_dept_id
    group by d.department_id, d.department_name;
end $$
delimiter ;
-- q29: department name and average salary
delimiter $$
create procedure sp_dept_avg_salary(p_dept_id int)
begin
    select d.department_id, d.department_name, round(avg(e.salary),2) as avg_salary
    from departments d
    left join employees e on d.department_id = e.department_id
    where d.department_id = p_dept_id
    group by d.department_id, d.department_name;
end $$
delimiter ;
-- q30: employees attendance in date range with late/early
delimiter $$
create procedure sp_attendance_in_range(p_from date, p_to date)
begin
    select a.employee_id, a.attend_date, a.arrival_time, a.depart_time, a.work_hours,
           case when a.arrival_time > '09:30:00' then 'late' else 'on_time' end as arrival_status,
           case when a.depart_time < '17:30:00' then 'early_leave' else 'normal' end as depart_status
    from attendance a
    where a.attend_date between p_from and p_to;
end $$
delimiter ;
-- q31: uppercase full name from first and last name
delimiter $$
create procedure sp_fullname_upper(p_first varchar(50), p_last varchar(50), out p_full_upper varchar(150))
begin
    set p_full_upper = upper(concat(p_first, ' ', p_last));
end $$
delimiter ;
-- q32: employees by project location
delimiter $$
create procedure sp_employees_by_project_location(p_location varchar(100))
begin
    select distinct e.employee_id, e.first_name, e.last_name, pa.project_id, pa.contribution, pa.performance_rating
    from project_assignments pa
    join projects p on pa.project_id = p.project_id
    join employees e on pa.employee_id = e.employee_id
    where p.location = p_location;
end $$
delimiter ;
-- q33: get employee department and manager
delimiter $$
create procedure sp_emp_dept_and_manager(p_emp_id int)
begin
    select d.department_name, concat(m.first_name,' ',m.last_name) as manager_name
    from employees e
    left join departments d on e.department_id = d.department_id
    left join employees m on d.manager_id = m.employee_id
    where e.employee_id = p_emp_id;
end $$
delimiter ;


-- q34: get employees in salary range
delimiter $$

create procedure sp_employees_in_salary_range(p_min decimal(15,2), p_max decimal(15,2))
begin
    select employee_id, first_name, last_name, salary
    from employees
    where salary between p_min and p_max
    order by salary desc;
end $$
delimiter ;
-- q35: project hours for employee in date range
delimiter $$
create procedure sp_project_hours_in_range(p_project_id int, p_from date, p_to date)
begin
    select pa.employee_id, e.first_name, e.last_name, sum(pa.hours) as total_hours
    from project_assignments pa
    join employees e on pa.employee_id = e.employee_id
    where pa.project_id = p_project_id and pa.work_date between p_from and p_to
    group by pa.employee_id
    order by total_hours desc;
end $$
delimiter ;

-- q36: delete employee by id (alias)
delimiter $$
create procedure sp_delete_employee_by_id(p_emp_id int)
begin
    delete from employees where employee_id = p_emp_id;
end $$
delimiter ;

-- q37: update employee job title by id (alias)
delimiter $$
create procedure sp_update_employee_job(p_emp_id int, p_new_job varchar(50))
begin
    update employees set job_title = p_new_job where employee_id = p_emp_id;
end $$
delimiter ;
-- q38: total working hours for employee (alias)

delimiter $$
create function fn_total_work_hours(p_emp_id int, p_year int, p_month int)
returns decimal(10,2)
deterministic
begin
    declare v_hours decimal(10,2);
    select coalesce(sum(work_hours),0) into v_hours
    from attendance
    where employee_id = p_emp_id
      and year(attend_date) = p_year
      and month(attend_date) = p_month;
    return v_hours;
end $$

delimiter ;
