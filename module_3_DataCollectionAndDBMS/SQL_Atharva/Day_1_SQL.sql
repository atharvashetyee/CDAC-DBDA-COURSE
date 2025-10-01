show databases;
create database keys_to_learn;
use keys_to_learn;

#Creating tables.
create table demo_pk(
	s_id int(10) primary key,
    s_name varchar(30),
    agr int,
    m_no int(10)
);

create table demo_pk_01(
	emp_id int auto_increment primary key,
    emp_name varchar(50),
    dept_id int
);

create table demo_cpk(
	plot_no int,
    house_no int,
    area varchar(100),
    pin_code int(6),
    primary key(plot_no,pin_code)
);

show tables;
desc demo_cpk;

#Inserting into table.
insert into demo_pk value(1,"Atharva",22,1485963245);
insert into demo_pk value(2,"XYZ",25,457693581);

#we get error if we dont put required values as per in coln, if we use diff data type.

insert into demo_pk_01 value(10,"Ram",20);
insert into demo_pk_01(emp_name,dept_id) value("Sita",70);
insert into demo_pk_01(emp_name,dept_id) value("Lakshaman",90);
select * from demo_pk_01;

insert into demo_cpk values(12,101,"Ratnagiri",415612);
insert into demo_cpk values(13,105,"Ratnagiri",415612);

select * from demo_cpk;

create table customer(
	c_id int,
    c_name varchar(30)
);

create table orders(
	o_id int,
    o_type varchar(20),
    c_id int,
    amt int
);
drop table orders;
insert into customer value(1,"Atharva");
insert into customer value(2,"Abc");

insert into orders values(111,"Business",1,100);
insert into orders values(112,"Home",1,1000);
insert into orders values(113,"Home",2,500);

select * from orders;
select * from customer;
drop table orders;
drop table customer;