-- triggers
use practice;

delimiter //
create trigger ins_bef
before insert on employees
for each row
begin
	if new.salary<0 then
		set new.salary=0;
	end if;
end//
delimiter ;
show triggers;

-- to change incorrect joining data
delimiter //
create trigger emp_dept
before insert on employees
for each row
begin
	if new.department_id= null then
    set new.department_id =100;
    end if;
end//
delimiter ;

-- to throw error if sal is less than 1000
delimiter //
create trigger tri_sal
before insert on employees
for each row
begin
	if salary<1000 then
    signal sqlstate "45000"
    set message_text="Error";
	end if;
end //
delimiter ;

-- practice for triggers
-- Question 1: Product Stock Validation no negative product should be entered
delimiter //
create trigger check_product_stock
before insert on products
for each row
begin
	if new.stock_quantity<0 then
		signal sqlstate "45000"
		set message_text="Error";
    end if;
end//
delimiter ;

-- Employee Username Generation
delimiter //
create trigger generate_employee_username
before insert on employees
for each row
begin
	if new.username is null then
    set new.username=concat(lower(new.first_name),"_",lower(new.last_name));
    end if;
end//
delimiter ;

-- Order Date Verification
delimiter //
create trigger verify_order_date
before insert on orders
for each row
begin
	if new.order_date>curdate() then
    signal sqlstate "45000"
    set message_text="Error";
    end if;
end //
delimiter ;