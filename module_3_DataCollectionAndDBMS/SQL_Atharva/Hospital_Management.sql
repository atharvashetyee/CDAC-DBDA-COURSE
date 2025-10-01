create database hospital;
use hospital;
create table patients(
	id int auto_increment primary key,
    name varchar(200) not null,
    age int(3) not null,
    gender varchar(10) not null
);

create table doctors(
	id int auto_increment primary key,
    name varchar (255) not null,
    specialization varchar(50) not null
);

create table appointment(
	id int auto_increment primary key,
    patient_id int not null,
    doctor_id int not null,
    appoinment_date date not null,
    foreign key (patient_id) references patients(id),
    foreign key (doctor_id) references doctors(id)
);

show tables;

insert into doctors(name,specialization) values ("Atharva","Phisician");
insert into doctors(name,specialization) values ("Shetye","Surgeon");

select * from doctors;

use hospital;
select * from patients;