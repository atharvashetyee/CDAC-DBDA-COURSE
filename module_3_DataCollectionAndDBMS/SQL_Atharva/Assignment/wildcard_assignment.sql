-- 1. salespeople from 'paris' or 'rome'
select salesman_id, name, city, commission
from salespeople
where city in ('paris', 'rome');

-- 2. salespeople from either 'paris' or 'rome'
select salesman_id, name, city, commission
from salespeople
where city = 'paris' or city = 'rome';

-- 3. salespeople from cities other than 'paris' and 'rome'
select salesman_id, name, city, commission
from salespeople
where city not in ('paris', 'rome');

-- 4. customers with id 3007, 3008, or 3009
select customer_id, cust_name, city, grade, salesman_id
from customers
where customer_id in (3007, 3008, 3009);

-- 5. salespeople with commission between 0.12 and 0.14
select salesman_id, name, city, commission
from salespeople
where commission between 0.12 and 0.14;

-- 6. orders between 500 and 4000 excluding 948.50 and 1983.43
select ord_no, purch_amt, ord_date, customer_id, salesman_id
from orders
where purch_amt between 500 and 4000
  and purch_amt not in (948.50, 1983.43);

-- 7. salespeople whose names begin with letters between 'b' and 'k'
select salesman_id, name, city, commission
from salespeople
where lower(substr(name, 1, 1)) > 'a' and lower(substr(name, 1, 1)) < 'l';

-- 8. salespeople whose names do not begin with letters between 'b' and 'k'
select salesman_id, name, city, commission
from salespeople
where lower(substr(name, 1, 1)) <= 'a' or lower(substr(name, 1, 1)) >= 'l';

-- 9. customers whose names begin with 'b'
select customer_id, cust_name, city, grade, salesman_id
from customers
where lower(cust_name) like 'b%';

-- 10. customers whose names end with 'n'
select customer_id, cust_name, city, grade, salesman_id
from customers
where lower(cust_name) like '%n';

-- 11. salespeople whose names begin with 'n' and fourth character is 'l'
select salesman_id, name, city, commission
from salespeople
where lower(name) like 'n__l%';

-- 12. rows where col1 contains underscore (_)
select col1
from your_table
where col1 like '%\_%' escape "\ ";

-- 13. rows where col1 does not contain underscore (_)
select col1
from your_table
where col1 not like '%\_%' escape "\ ";

-- 14. rows where col1 contains forward slash (/)
select col1
from your_table
where col1 like '%/%';

-- 15. rows where col1 does not contain forward slash (/)
select col1
from your_table
where col1 not like '%/%';

-- 16. rows where col1 contains string '_/'
select col1
from your_table
where col1 like '%_/%';

-- 17. rows where col1 does not contain string '_/'
select col1
from your_table
where col1 not like '%_/%';

-- 18. rows where col1 contains percent (%)
select col1
from your_table
where col1 like '%\%%' escape "\ ";

-- 19. rows where col1 does not contain percent (%)
select col1
from your_table
where col1 not like '%\%%' escape "\ ";

-- 20. customers with no grade
select customer_id, cust_name, city, grade, salesman_id
from customers
where grade is null;

-- 21. customers with a grade value
select customer_id, cust_name, city, grade, salesman_id
from customers
where grade is not null;

-- 22. employees whose last name begins with 'd'
select emp_idno, emp_fname, emp_lname, emp_dept
from employees
where lower(emp_lname) like 'd%';
