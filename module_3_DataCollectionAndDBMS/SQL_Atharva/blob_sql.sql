use day_2;
create table char_1(
	s_name char(15),
	s_id int
);
insert into char_1 value("Ath",10);
insert into char_1 value(1000,100);

select *from  char_1;

create table char_2(
	s_name char(255),
    s_id int 
);
insert into char_2 values("etyr",25);
select * from char_1;

#inserting image
create table blob_ex(tag varchar(50),img blob);
	
desc blob_ex;
insert into blob_ex value("my_img","C:\Users\athar\Pictures\Screenshots\66747871.webp");
insert into blob_ex value("img3",load_file("C:\Users\athar\Pictures\Screenshots\66747871.webp"));

select * from blob_ex;

#inserting large para
create table text_ex(
	tag varchar(50),
    about text
);

desc text_ex;

insert into text_ex value("A paragraph","This stands for binary large objects. This holds a variable amount of data it can store binary data such as image, pdf, video etc. Suppose your data contains 50 binary values then blob will occupy 52 bytes in memory as it adds two bytes overhead for each value specified.

#blob
create table blob_example(img_name varchar(20),image_data blob);
insert into blob_example values('abc',load_file('D:/1.jpg'));
select * from blob_example ;

SHOW VARIABLES LIKE 'secure_file_priv';

INSERT INTO blob_example VALUES('abc', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/23.jpg'));
");

select * from text_ex;

select length(about) as no_of_byte from text_ex;

#set

create table set_ex(
	order_id int,
    c_name varchar(20),
    food_type set("veg","spicy","medium spicy","no onion")
);
insert into set_ex value(11,"Sai","veg");
insert into set_ex value(11,"Sai","veg,spicy");
select * from set_ex;

create table job_interview(
	app_name varchar(50),
	resume_update blob,contact_me set("Phone number","email","Text message","Letters")
);
insert into job_interview value("Atharva","C:\Users\athar\Pictures\Screenshots\66747871.webp","Phone number");
select * from job_interview;

#enum

create table form_app(
	app_name varchar(50),
    course_type varchar(10),
    gender enum("male","female","others")
);
insert into form_app values("Atharva","DBDA","male");
insert into form_app values("Atharva","DBDA","Male");
select * from form_app;

#implement all
create table cdac_form(
	student_name varchar(255),
    phone_number int,
    upload_marksheet blob,
    degree_branch enum("CS","IT","EXTC","MECH"),
	select_course set("DAC","DBDA")
);

insert into cdac_form value("Atharva",785412589,"C:\Users\athar\Pictures\Screenshots\Bike rally.jpg","CS","DBDA");

select *from cdac_form;

#numeric datatype
create table numeric_data(
	student_id int(12),
    student_name varchar(50),
    age int
);

select length(age) as age_len,length(student_id) as len_st_id from numeric_data;

insert into numeric_data value(111,"Atharva",22);
select * from numeric_data;

create table bank_data(
	account_no int(12),
    holder_name varchar(50),
    balance float(15,2)
);

select length(account_no) as acc_len,length(balance) as len_balance from bank_data;

insert into bank_data value(111,"Atharva",1000.00);
select * from bank_data;

create table numeric_example(
	student_id int(12),
    student_name varchar(50),
    age int,
    p_marks float(4,2),
    j_marks decimal(4,2)
	);
insert into numeric_example value(111,"Atharva",21,50.00,50.00);
select length(student_id) as len_id, length(student_name) as len_name, length(p_marks) as len_pmarks from numeric_example;
select * from numeric_example;

#boolean
create table bool_ex(
	s_name varchar(50),
    attendance boolean
    );

insert into bool_ex value("Atharva",1);

select * from bool_ex;


#float can be used without specifing parameters
create table float12(
	a float
    );
    
insert into float12 values(3342.14125);

select *from float12;
select length(a) as float_len from float12;