-- How can MySQL triggers be used to automatically update employee records when a department is changed?
delimiter $$
create trigger sync_dept_name
after update on departments
for each row
begin
    if old.department_name <> new.department_name then
        update employees
        set department_name_cache = new.department_name
        where department_id = new.department_id;
    end if;
end$$
delimiter ;
-- What MySQL trigger can be used to prevent an employee from being deleted if they are currently assigned to a department?
delimiter $$
create trigger stop_del_assigned_emp
before delete on employees
for each row
begin
    if old.department_id is not null then
        signal sqlstate '45000'
        set message_text = 'error: cannot delete employee. unassign from department first.';
    end if;
end$$
delimiter ;
-- How can a MySQL trigger be used to send an email notification to HR when an employee is hired or terminated?
create table notification_queue (
    notification_id int auto_increment primary key,
    recipient varchar(255) default 'hr@example.com',
    subject varchar(255),
    body text,
    created_at timestamp default current_timestamp
);

delimiter $$
create trigger notify_hire
after insert on employees
for each row
begin
    insert into notification_queue(subject, body)
    values(
        concat('new hire: ', new.first_name, ' ', new.last_name),
        concat('employee id ', new.employee_id, ' was hired on ', new.hire_date, '.')
    );
end$$
delimiter ;

delimiter $$
create trigger notify_term
after update on employees
for each row
begin
    if old.active_status = 'active' and new.active_status = 'terminated' then
        insert into notification_queue(subject, body)
        values(
            concat('employee termination: ', new.first_name, ' ', new.last_name),
            concat('employee id ', new.employee_id, ' was terminated on ', curdate(), '.')
        );
    end if;
end$$
delimiter ;
-- What MySQL trigger can be used to automatically assign a new employee to a department based on their job title?
delimiter $$
create trigger set_dept_on_hire
before insert on employees
for each row
begin
    if new.department_id is null then
        case new.job_id
            when 'IT_PROG' then set new.department_id = 60;
            when 'SA_REP' then set new.department_id = 80;
            when 'PU_CLERK' then set new.department_id = 30;
            when 'HR_REP' then set new.department_id = 40;
            else set new.department_id = null;
        end case;
    end if;
end$$
delimiter ;
-- How can a MySQL trigger be used to calculate and update the total salary budget for a department whenever a new employee is hired or their salary is changed?
delimiter $$
create trigger add_salary_to_dept
after insert on employees
for each row
begin
    update departments
    set total_salary_budget = total_salary_budget + new.salary
    where department_id = new.department_id;
end$$
delimiter ;

delimiter $$
create trigger sub_salary_from_dept
after delete on employees
for each row
begin
    update departments
    set total_salary_budget = total_salary_budget - old.salary
    where department_id = old.department_id;
end$$
delimiter ;

delimiter $$
create trigger adj_salary_on_update
after update on employees
for each row
begin
    if old.department_id <> new.department_id then
        update departments
        set total_salary_budget = total_salary_budget - old.salary
        where department_id = old.department_id;
        
        update departments
        set total_salary_budget = total_salary_budget + new.salary
        where department_id = new.department_id;
    elseif old.salary <> new.salary then
        update departments
        set total_salary_budget = total_salary_budget - old.salary + new.salary
        where department_id = new.department_id;
    end if;
end$$
delimiter ;
-- What MySQL trigger can be used to enforce a maximum number of employees that can be assigned to a department?
delimiter $$
create trigger check_dept_full
before insert on employees
for each row
begin
    declare current_count int;
    declare max_limit int;

    select max_employees into max_limit from departments where department_id = new.department_id;

    if max_limit is not null then
        select count(*) into current_count from employees where department_id = new.department_id;

        if current_count >= max_limit then
            signal sqlstate '45000'
            set message_text = 'error: department is full. cannot add more employees.';
        end if;
    end if;
end$$
delimiter ;
-- How can a MySQL trigger be used to update the department manager whenever an employee under their supervision is promoted or leaves the company?
delimiter $$
create trigger clear_mgr_on_delete
after delete on employees
for each row
begin
    update departments
    set manager_id = null
    where manager_id = old.employee_id;
end$$
delimiter ;
-- What MySQL trigger can be used to automatically archive the records of an employee who has been terminated or has left the company?
delimiter $$
create trigger archive_on_delete
after delete on employees
for each row
begin
    insert into job_history (employee_id, start_date, end_date, job_id, department_id)
    values (
        old.employee_id,
        old.hire_date,
        curdate(),
        old.job_id,
        old.department_id
    );
end$$
delimiter ;
