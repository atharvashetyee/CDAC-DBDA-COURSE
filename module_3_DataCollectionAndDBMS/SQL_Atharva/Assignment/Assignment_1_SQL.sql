#Basic table creation
create table department4(
	dept_id int not null primary key,
    dept_name varchar(255) not null
);

create table employee4(
	emp_id int not null primary key ,
    emp_name varchar(255) not null,
    salary int not null,
    dept_id int
     
);
insert into department4 values(1,"IT"),
(2,"HR"),(3,"OPERATIONS");
insert into department4 value(4,"FINANCE");

desc department4;
select * from department4;

insert into employee4 values(10,"Abc",10000,1);
insert into employee4 values(20,"xyz",15000,2);
insert into employee4 values(30,"wer",15000,3);
insert into employee4 values(40,"rty",35000,3);
insert into employee4 values(50,"jhg",25000,4);

select *from employee4;

select * from employee4 where dept_id=2;
#Advanced tasks Modify the Employee table so that if a department is deleted, all its employees are also deleted (ON DELETE CASCADE).

create table department(
	dept_id int not null primary key,
    dept_name varchar(255) not null
);

create table employee(
	emp_id int not null primary key ,
    emp_name varchar(255) not null,
    salary int not null,
    dept_id int,
    foreign key (dept_id) references department(dept_id) on delete cascade 
);

insert into department values(1,"IT"),
(2,"HR"),(3,"OPERATIONS");
insert into department value(4,"FINANCE");

desc department;
select * from department;

insert into employee values(10,"Abc",10000,1);
insert into employee values(20,"xyz",15000,2);
insert into employee values(30,"wer",15000,3);
insert into employee values(40,"rty",35000,3);
insert into employee values(50,"jhg",25000,4);

select *from employee;

insert into employee values(60,"Meena",25000,4);

select *from employee;

delete from department where dept_name="FINANCE";


#Modify the Employee table so that if the department_id in Department is updated, it should also update automatically in the Employee table (ON UPDATE CASCADE).

create table department1(
	dept_id int not null primary key,
    dept_name varchar(255) not null
);

create table employee1(
	emp_id int not null primary key ,
    emp_name varchar(255) not null,
    salary int not null,
    dept_id int,
    foreign key (dept_id) references department(dept_id) on update cascade 
);

insert into department1 values(1,"IT"),
(2,"HR"),(3,"OPERATIONS");
insert into department1 value(4,"FINANCE");

desc department;
select * from department1;

insert into employee1 values(10,"Abc",10000,1);
insert into employee1 values(20,"xyz",15000,2);
insert into employee1 values(30,"wer",15000,3);
insert into employee1 values(40,"rty",35000,3);
insert into employee1 values(50,"jhg",25000,4);

update department1 set dept_id=5 where dept_id=4;


#Change the Foreign Key constraint so that if a department is deleted, employees should have their dept_id set to NULL (ON DELETE SET NULL).

create table department13(
	dept_id int not null primary key,
    dept_name varchar(255) not null
);

create table employee13(
	emp_id int not null primary key ,
    emp_name varchar(255) not null,
    salary int not null,
    dept_id int,
    foreign key (dept_id) references department(dept_id) on delete set null 
);

insert into department13 values(1,"IT"),
(2,"HR"),(3,"OPERATIONS");
insert into department13 value(4,"FINANCE");

desc department13;
select * from employee13;

insert into employee13 values(10,"Abc",10000,1);
insert into employee13 values(20,"xyz",15000,2);
insert into employee13 values(30,"wer",15000,3);
insert into employee13 values(40,"rty",35000,3);
insert into employee13 values(50,"jhg",25000,4);

delete from department13 where dept_id=4;
select * from employee13;