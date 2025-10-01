-- date

create database day_3;
use day_3;

create table date_1(
	s_name varchar(20),
    dob date
    );
    
-- insert the date in format YYYY-MM-DD
insert into date_1 value("Atharva","2025-09-19");
insert into date_1 value("Abc","2025/09/18");
insert into date_1 value("Abcde",null);


select * from date_1;

select length(dob) as date_lenght from date_1;

-- time
create table date_2(
	s_name varchar(20),
    dob date,
    birth_time time
    );

-- insert the date in format HH:MM:SS    
insert into date_2 value("Atharva","2003-05-30","04:05:45");

select * from date_2;

-- date and time all together;

create table date_3(
	s_name varchar(20),
    birth_date__time datetime
    );

insert into date_3 value ("Atharva","2025-09-19 23:09:25");
select * from date_3;

-- to get real time date and time
select now();

-- timestamp
create table date_4(
	s_name varchar(20),
    login timestamp
    );
-- automatically insert date and time using function current_timestamp

insert into date_4 value("Atharva",current_timestamp());

select *from date_4;

-- year
create table date_5(
	s_name varchar(20),
    birth_year year
    );

-- default storage is 1 byte and range is 1901-2155

insert into date_5 values("Atharva","2025");

select * from date_5;

-- to get current date and time
select now();
select current_date();
select current_time();
select curdate();

-- UTC
select utc_timestamp();
select utc_date();
select utc_time();

-- constraints

-- unique 
create table student_uk(
	age int,
    email varchar(100) unique
    );
    
insert into student_uk value(22,"abc@gmail.com");

select * from student_uk;

create table student_uk1(
	age int,
    email varchar(100),
    mob_no int(10),
    unique(email,mob_no) -- work as a or condition
    );
insert into student_uk1 value(21,"athar@gmail.com",125478545);

--
create table student_uk2(
	s_name varchar(20),
    username varchar (10) unique,
    age int,
    email varchar(100),
    mob_no int(10),
    unique(email,mob_no) -- work as "or" condition
    );                            

insert into student_uk2 value("Atharva",111,21,"athar@gmail.com",125478545);    

select * from student_uk2;
desc student_uk2;

create table employee_UK1(
	emp_name varchar(20) not null,
    u_email varchar(10) unique,
    mail varchar (10) unique,
    email varchar(10) not null,
    alter_email varchar(10),
    unique(email,alter_email) -- work as "or" condition
    );      

insert into employee_UK1 values("Atharva","a@gl.com","a@il.com","a@gil","b@gmail");

--- #default
create table employee_UK2(
	emp_name varchar(20) not null,
    u_email varchar(10) unique,
    dept_name varchar(16) default "IT" -- sets default value if value is not provided
    );      

insert into employee_UK2(emp_name,u_email) values ("Atharva","a@il.co"); -- sets default value
insert into employee_UK2(emp_name,u_email) values ("Ath","b@il.co");
insert into employee_UK2 values ("Ath","b@l.co",default); -- add default values

select * from employee_UK2;

-- check 

create table employee_UK3(
	emp_name varchar(20) not null,
    u_email varchar(20) unique,
    age int check(age>18),
    dept_name varchar(16) default "IT" 
    );

desc employee_UK3;   

insert into employee_UK3 values("Atharva","a@sw.fd",20,"CS");
insert into employee_UK3 values("Ath","a@w.fd",17,"CS"); -- error for entering age <18

select * from employee_UK3;

create table employee_4(
	user_name varchar(20) not null,
    password_c varchar(20) check(char_length(password_c)>6) 
    );

insert into employee_4 values("admin","admin123");
insert into employee_4 values("admin2","admin"); -- error for the password not being of required length

select * from employee_4;
-------------------------------------------------------------------
create table employee_5(
	user_ varchar(20) not null,
    pass_c varchar(20) check(char_length(pass_c)>6 and char_length(user_)>8)
    );
----------------------------------------------------------------- 

#check 
create table employee_7(
	user_ varchar(20) not null,
    pass_c varchar(20),
    check(char_length(pass_c)>6 and char_length(user_)>8
    and char_length(user_)>6 and user_ regexp "^[A-Aa-z]+$")
    );
    
insert into employee_7 values("AtharvaShetye","admin12");

select * from employee_6;

#
create table department(
	dept_id int,
    dept_name varchar(50),
    location varchar(50),
    constraint pk_dept_id primary key (dept_id)
    );

desc department;


create table student1(
	stud_id int,
    student varchar(50),
	constraint pk_stud_id primary key(stud_id)
    );
--------------------------------- 


    
create table department2(
	dept_id int,
    dept_name varchar(50),
    location varchar(50),
    constraint pk_dept_id primary key (dept_id)
    );

desc department;

create table employee2(
	dept_id int,
    dept_name varchar(50),
    location varchar(50),
    emp_id int,
    constraint fk_emp_dept foreign key(dept_id)
    references department (dept_id)
    );

insert into department values(1,"IT","Mumbai");

insert into employee2 values (111,"Atharva","Ratnagiri",54);

select table_name,
constraint_name
from information_schema.table_constrains
where table_scheme=database() and table_name="employee4";

select table_name,
constraint_name,constraint_type
from information_schema.Table_constraints
where table_schema=database() and
table_name in("employee2","department2");
-----------------------------------------------------------