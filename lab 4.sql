--1.

select city
from agents
where aid in (select aid 
	      from orders
	      where ordno in (select ordno
			      from orders
			      where cid = (select cid 
					   from customers
					   where name = 'Basics')));
--


--2.

select distinct pid 
from orders 
where aid in (select aid
              from orders
              where cid in (select cid 
                            from customers
                            where city = 'Kyoto')) 
order by pid asc;


--3.

select cid,name 
from customers 
where cid not in (select distinct cid 
                  from orders 
                  where aid = 'a03');
--


--4.

select cid, name 
from customers
where cid in (select cid 
              from orders 
              where pid in ('p01','p07')) 
order by cid asc;



--5.

select distinct pid 
from orders 
where cid in(select cid 
             from orders 
             where aid = 'a03') 
order by pid asc;


--6.

select name,discount 
from customers 
where cid in(select cid 
             from orders
             where aid in(select aid 
                          from agents 
                          where city in ('Dallas','Duluth')));

--


--7.

select cid,name,discount 
from customers 
where discount in (select discount 
                   from customers  
                   where city in('Dallas','Kyoto'))
and discount in   (select discount 
                   from customers
                   where city not in('Dallas','Kyoto'))
and city not in ('Dallas','Kyoto');