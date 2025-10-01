create database constraint_1;
use constraint_1;

--  1 Create a table students with columns: id (INT), name (VARCHAR, NOT NULL), and age (INT with default 18).
create table students(
	id int,
    stud_name varchar(50) not null,
    age int default "18"
);
----------------------------------------------------------------
-- 2Insert into students: (1, NULL, 20). What will happen?
insert into students value(1,null,20); --  error
----------------------------------------------------------------
-- 3  Insert into students: (2, 'Ravi'). What will be stored in age?
insert into students value(2,"Ravi"); --  error
----------------------------------------------------------------
-- 4 Why will the following query fail?
INSERT INTO students (id) VALUES (3);

--  The following query will fail as we have set name attribute not null and 
--  by using this query ,it will try to set value null but as it
--  cant be so it will return null. 
----------------------------------------------------------------
--  Q5.Modify the students table so that the age column default changes from 18 to 21.

alter table students alter column age set default "21";
desc students;
----------------------------------------------------------------
--  Q6 Drop the NOT NULL constraint on the name column. Write the query.

alter table students modify column stud_name varchar(50) null;
desc students;
----------------------------------------------------------------
-- Q7.Create a table department with columns: dept_id (INT, PRIMARY KEY), dept_name (VARCHAR).
create table department(
	dept_id int primary key,
    dept_name varchar(50)
	);
----------------------------------------------------------------  
-- Q8.Insert (1,'IT') and (1,'HR'). What error will you get?
insert into department values(1,"IT");
insert into department values(1,"HR");
--  0	135	18:16:15	insert into department values(1,"HR")	Error Code: 1062. Duplicate entry '1' for key 'department.PRIMARY'	0.016 sec
----------------------------------------------------------------
-- Q9.Can a table have two PRIMARY KEYS? Demonstrate with a query.
 create table demo(
	cld varchar(25) primary key not null,
    id_ int(10) primary key not null
    );
 --  0	137	18:19:1 Error Code: 1068. Multiple primary key defined	0.000 sec
----------------------------------------------------------------
-- Q10. Create a table enrollment with composite primary key (student_id, course_id).
create table enrollment(
	student_id int(25) not null,
    course_id int(10) not null,
    primary key(student_id,course_id)
    );
----------------------------------------------------------------
-- Q11.Try inserting (101, 'DBMS') twice into enrollment. What happens?
insert into enrollment values (101,"DBMS");
--  It gives a error as we are trying to insert character into attribute
--  which has int as data type. 
----------------------------------------------------------------
-- Q12.Create a table users with columns: user_id (INT, PRIMARY KEY, AUTO_INCREMENT), email (VARCHAR, UNIQUE).
create table users(
	user_id int primary key auto_increment,
    email varchar(50) unique
);
----------------------------------------------------------------
-- Q13.Insert ('abc@mail.com') twice. What error occurs?
insert into users values("abc@g.com");
insert into users values("abc@g.com");
--  it will throw an error as attibute should have unique value. 
---------------------------------------------------------------- 
-- Q14.Does the following query work? Why?
INSERT INTO users (email) VALUES (NULL);
INSERT INTO users (email) VALUES (NULL);

select * from users;

--  the query is working as even though values have initiated unique 
--  value then too you will be able to execute those as it take null
--  values

----------------------------------------------------------------
-- Q15.Create a table products with UNIQUE constraint on (sku, region).

create table products(
	sku int,
    region varchar(50),
    unique(sku,region)
    );
alter table products modify column sku varchar(50);   
----------------------------------------------------------------

-- Q16.Insert (sku='A1', region='US') twice. What error?
insert into products values("A1","US");
insert into products values("A1","US");
--  it displays error as this values should be unique cause thats
--  specified.
----------------------------------------------------------------
-- Q17.Create a table department with primary key dept_id. Then create employee table with foreign key dept_id referencing department.
create table department1(
	dept_id int primary key
    );

create table employee1(
	dept_id int,
    emp_name varchar(50),
    emp_id int,
    foreign key (dept_id) references department1 (dept_id)
	);

----------------------------------------------------------------
-- Q18.Insert into employee (emp_id=1, name='Asha', dept_id=99) when no such dept exists. What error?
insert into employee1 values(emp_id=1,emp_name="Asha",dept_id=10);

--  Column count doesn't match value count at row 1
----------------------------------------------------------------
-- Q19.Delete dept_id=1 from department when employees exist. What error without ON DELETE CASCADE?
 insert into department1 values(1);
 delete department1 from dept_id where dept_id=1;
 --  delete department1 from dept_id where dept_id=1	Error Code: 1109. Unknown table 'department1' in MULTI DELETE	
---------------------------------------------------------------- 
-- Q20.Recreate employee table with ON DELETE CASCADE. What happens if you delete department 1?
drop table employee1;
create table employee1(
	dept_id int,
    emp_name varchar(50),
    emp_id int,
    foreign key (dept_id) references department1 (dept_id) on delete cascade
	);
    
insert into employee1 values(1,"Atharva",10);
insert into department1 values(1);

delete from department1 where dept_id=1;
--  delete from department1 where dept_id=1	1 row(s) affected
----------------------------------------------------------------
-- Q21.Use ON DELETE SET NULL in the foreign key. What happens when parent is deleted?
drop table employee1;
create table employee1(
	dept_id int,
    emp_name varchar(50),
    emp_id int,
    foreign key (dept_id) references department1 (dept_id) on delete set null
	);
    
delete from department1 where dept_id=1;

--  success!
----------------------------------------------------------------
-- Q22.Write a query to drop a foreign key constraint fk_emp_dept.
show create table employee1;
alter table employee1 drop foreign key employee1_ibfk_1;
--  sucsess
----------------------------------------------------------------
--  Q23.Add a new foreign key constraint fk_manager in employee table referencing itself (manager_id).
drop table employee1;
----------------------------------------------------------------
--  Q24.Create table accounts with balance >= 0 using CHECK.
create table accounts (
	id int,
	balance int check(balance >= 0)
);
---------------------------------------------------------------- 
--  Q25. Insert (id=1, balance=-100). What happens?
insert into accounts value (101,-100);
--  error: Error Code: 3819. Check constraint 'accounts_chk_1' is violated.
----------------------------------------------------------------
--  Q26.Modify the constraint so that balance must be between 100 and 1,000,000.
alter table accounts modify balance int check (balance >= 100 and balance <= 1000000);
----------------------------------------------------------------
--  Q27.Try to insert (id=2, balance=50). What error do you get?
insert into accounts value (2,50);
--  error: Error Code: 3819. Check constraint 'accounts_chk_2' is violated.
----------------------------------------------------------------
--  Q28.Create table invoices with invoice_id AUTO_INCREMENT PRIMARY KEY. Insert 3 rows. What will be the IDs?
create table invoices (
	invoice_id int primary key auto_increment,
    phone_no int 
);
insert into invoices(invoice_id,phone_no) values (101,8849844);
insert into invoices(phone_no) values (8849844);
insert into invoices(invoice_id, phone_no) values(103,9319487);
select * from invoices;
---------------------------------------------------------------- 
--  Q29. Delete last row. Insert again. Will AUTO_INCREMENT reuse the deleted number?
delete from invoices where invoice_id = 103;
insert into invoices(phone_no) values(9319487);
select * from invoices;
--  no auto increment doesn't reuses those values
----------------------------------------------------------------
--  Q30.Write queries to:
--  Add a UNIQUE constraint on phone column in users.
--  Drop the UNIQUE constraint from users.
alter table invoices add constraint unique_ph unique(phone_no);
alter table invoices drop constraint unique_ph;
----------------------------------------------------------------
--  Q31.Create a table library with a composite primary key (book_id, branch_id) and a UNIQUE constraint on (isbn, branch_id).
create table library (
	book_id int,
    branch_id int unique,
    isbn varchar(15) unique
);
---------------------------------------------------------------- 
--  Q32.Insert (book_id=1, branch_id=101, isbn='A123') twice. What error occurs?
insert into library values
	(1,101,"A123"),
    (1,101,"A123");
--  error: Error Code: 1062. Duplicate entry '101' for key 'library.branch_id'
----------------------------------------------------------------
-- Q33. Insert (book_id=1, branch_id=102, isbn='A123'). Will it work? Why?
Insert into library value(1, 102,'A123');
----------------------------------------------------------------
-- Q34.Can you have a table with PRIMARY KEY and multiple UNIQUE constraints? Write a query.
create table pk_check (
	id int primary key,
    name_ varchar(20) unique,
    phone_no int unique,
    adderess varchar(20) unique
);
----------------------------------------------------------------
-- Q35.Try to create a table with both PRIMARY KEY(id) and UNIE(id). What happens?
create table prk_check (
	id int primary key unique
);
----------------------------------------------------------------
-- Q36.Create table exam_results with composite primary key (student_id, exam_id) and CHECK constraint marks BETWEEN 0 AND 10
create table exam_results (
	student_id int,
    exam_id int,
	primary key (student_id,exam_id),
    marks int check (marks between 0 and 100)
);
----------------------------------------------------------------
-- Q37. Create table orders referencing customers with ON UPDATE CASCADE. Update customer_id in parent – what happens in child?
create table customers(
	cust_id int primary key,
    cust_name varchar(20)
);

create table orders(
	order_id int primary key,
    cust_id int default 22,
    order_name varchar(20),
    foreign key orders(cust_id) references customers(cust_id)
    on delete set default
);
INSERT INTO customers VALUES (101, 'tiniv');
INSERT INTO orders VALUES (1, 101, 'rice');
INSERT INTO orders VALUES (2, 101, 'chicken');
update customers set cust_id=102 where cust_id=101;
select * from customers;
----------------------------------------------------------------
-- Q38.Try to use ON DELETE SET DEFAULT in a foreign key. What happens in MySQL?
create table table1(
	id int primary key,
    name varchar(30)
);

create table table2(
	id2 int primary key default 1,
    id int,
    name2 varchar(39) ,
    foreign key table2(id2) references table1(id) 
   on delete set default
);
----------------------------------------------------------------
-- Q39.Create a self-referencing foreign key categories(parent_id) referencing categories(id). Insert parent and child categories.
CREATE TABLE categories (
    id int PRIMARY KEY,
    name VARCHAR(30) ,
    parent_id int ,
    constraint fk_key foreign key (parent_id) REFERENCES categories(id) 
);
insert into categories values (101,"jaggu",101);
insert into categories values (102,"jaggu",102);
select * from categories;
drop table categories;
----------------------------------------------------------------
-- Q40.What happens if you delete a parent row in categories without ON DELETE CASCADE
delete from categories where id = 101;
-- error :Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`assignment2`.`categories`, CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`))
----------------------------------------------------------------
-- Q41.Write a query to temporarily disable foreign key checks and insert invalid data.
alter table categories drop foreign key fk_key;
----------------------------------------------------------------
-- Q42.Write a query to re-enable foreign key checks.
alter table categories add constraint fk_newk foreign key (parent_id) references categories(id);
----------------------------------------------------------------
-- Q43.Explain with a query why indexes are automatically created when foreign keys are added.
explain delete from categories where id = 101;
----------------------------------------------------------------
-- Q44. Create a table employees with CHECK that salary > 20000.
create table employees (
	id_e int primary key,
    name_e varchar(30),
    salary int check(salary>20000)
);
----------------------------------------------------------------
-- Q45.Insert (id=1, salary=15000). What error code will you get?
insert into employees values(1,"jagadhale",15000);
-- error:Error Code: 3819. Check constraint 'employees_chk_1' is violated.
----------------------------------------------------------------
-- Q46. Add a CHECK constraint on gender column so only 'M' or 'F' is allowed.
alter table employees add gender varchar(5);
alter table employees add constraint gender_check check(gender in("M" ,"F"));
----------------------------------------------------------------
-- Q47.Try inserting gender='X'. What happens?
select * from employees;
insert into employees value(3,"name2",3000,"X");
-- error:Error Code: 3819. Check constraint 'employees_chk_1' is violated.
----------------------------------------------------------------
-- Q48.Add a foreign key constraint on employee.dept_id referencing department.dept_id.
alter table employees add constraint new_fk foreign key (id_e) references department(dept_id); 
desc employee;
----------------------------------------------------------------
-- Q49.Drop a primary key constraint from table library. What query do you use?
alter table library add constraint pk_key primary key (book_id);
alter table library drop primary key ;
----------------------------------------------------------------
-- Q50.Rename a foreign key constraint fk_emp_dept to fk_employee_department.
alter table employees drop foreign key new_fk ;
alter table employees add constraint fk_employee_department foreign key (id_e) references department(dept_id);

