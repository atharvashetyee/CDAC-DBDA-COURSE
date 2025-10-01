create user "Atharva@localhost" identified by "123";
create user "Shetye@localhost" identified by "123";

-- grant permission
grant all privileges on hr.* to "Atharva@localhost";
grant select,delete on northwind.* to "Shetye@localhost";

-- show grants
show grants for "Atharva@localhost";

-- revoke
revoke delete on hr.* from "Atharva@localhost";

-- remove all privilages
flush privileges;

-- Create database
CREATE DATABASE IF NOT EXISTS bank_demo;
USE bank_demo;

-- Drop tables if they exist (for clean start)
DROP TABLE IF EXISTS transaction_log;
DROP TABLE IF EXISTS accounts;

-- Create accounts table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create transaction log table
CREATE TABLE transaction_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account INT,
    to_account INT,
    amount DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20)
);

-- Insert sample data
INSERT INTO accounts (account_id, account_holder, balance) VALUES
(1, 'Alice Johnson', 5000.00),
(2, 'Bob Smith', 3000.00),
(3, 'Charlie Brown', 7000.00),
(4, 'Diana Prince', 2000.00),
(5, 'Eve Wilson', 4500.00);

-- View initial data
SELECT * FROM accounts;

grant all privileges on bank_demo.* to "Atharva@localhost";
grant all privileges on bank_demo.* to "Shetye@localhost";

----------------------------------------------------------------------------------------------------------------------------------------
-- department partition 
use hr;
SELECT first_name, department_id, salary,
AVG(salary) OVER (PARTITION BY department_id) as dept_avg
FROM employees;
----------------------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------------
use northwind;
select category_id,product_name,unit_price,row_number()
over(partition by category_id order by unit_price desc) as cat_in
from products;
----------------------------------------------------------------------------------------------------------------------------------------
-- dense rank and rank
select category_id,product_name,unit_price,row_number()
over(partition by category_id order by unit_price desc) as cat_in_row_num,
rank()
over(partition by category_id order by unit_price desc) as cat_by_rank,
dense_rank()
over(partition by category_id order by unit_price desc) as cat_by_dense_rank
from products;
----------------------------------------------------------------------------------------------------------------------------------------

select e.employee_id,e.first_name,
count(o.order_id) as total_order,
rank() over(order by count(o.order_id)desc) as performance_rank
from employees e
left join orders o
on e.employee_id=o.employee_id
group by employee_id,e.first_name
order by performance_rank;

select * from employees;