USE `awesome chocolates`;
select *from sales;

-- to select specific attributes from table
select saleDAte,amount,customers from sales;
----------------------------------------------------------------------------
-- to add or calulate some values in sql
select saledate,Amount,boxes,amount / boxes as "Amount per box" from sales;
----------------------------------------------------------------------------
-- to impose query justifying
----------------------------------------------------------------------------
-- where clause to filter amt above 10000
select * from sales
where amount>10000;
----------------------------------------------------------------------------
-- to order by amount ie to get into ascending order
select * from sales
where amount>10000
order by amount; -- to get descending use desc after amount
 ----------------------------------------------------------------------------
-- to get amount in descending order depending on geoID=1 and having
-- pid in ascending order

select *from sales
where geoid= "g1"
order by pid,amount desc;
 ----------------------------------------------------------------------------
 -- get rows/record where amt >10000 and year =2022
 
 select *from sales
 where amount>10000 && SaleDate>="2022-01-01";
 
 -- if dataset has data from 2023 and you want data only for 2022
 select SaleDate,Amount from sales
 where amount>1000 && year(SaleDate)=2022
 order by amount desc;
 
 ----------------------------------------------------------------------------
 
 -- sales where number of boxes is betn 0 to 50
 select * from sales
 where boxes>0 && boxes<=50
 order by boxes;
 
 select * from sales
 where boxes between 0 and 50
 order by boxes;
 
 ----------------------------------------------------------------------------
 -- to sort shipments on fridays
 select saledate,amount,boxes,weekday(saledate)as "day_of_week" from sales
 where weekday(saledate)=4;
 ----------------------------------------------------------------------------
 -- to work on various table
 select * from people
 where team ="Delish" or team ="Jucies"; -- to search in table for
 -- whether they belong to any of given team
 
 select * from people
 where team in ("Delish","Jucies"); -- have used "in" clause 
 -- which offers more flexible condition
 ----------------------------------------------------------------------------
 -- pattern matching
  select * from people
  where salesperson like "B%"; -- here "like" is used to search 
  -- within the people table, B% implies that the salespers
  
     select * from people
  where salesperson like "%B%"; -- this searches when there is b
  -- anywhere in the record
  ----------------------------------------------------------------------------
  -- case operator and branch logic
  
select saledate,amount,
	case when amount<1000 then "Under 1K"
		 when amount<5000 then "Under 5k"
         when amount<10000 then "Under 10k"
         else "10K or more"
	end as "Amount Category"
from sales; -- "case" are used to define condition ,format is case when-then and we use "else" 
-- just like else condition ."end as" is used to provide with attribute name
-- for new attribute. 
----------------------------------------------------------------------------      
-- join query
-- use case- we want to see "sales" data but there the person's name is 
-- written in spid but the value of spid to see salesperson name we 
-- need to access the "people" table so we use "joins" in such scenarios to
-- see data from both table.

select s.saledate, s.amount,p.salesperson,s.spid,p.spid
from sales as s
join people p on p.spid =s.spid ;

-- s and p are the new names which we give to table

-- Left join
-- the sql will do left join ,ie if we join two table it will keep all tej
-- data in left table and if required it will take data from right table
-- to perform operations

select s.saledate,s.amount,s.pid,pr.product
from sales s
left join products pr on pr.pid=s.pid; -- here the left table is sales table 