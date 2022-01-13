# Write your MySQL query statement below
with june as(
select
o.customer_id
,sum(o.quantity*c.price) as sum_june
from
Product c join Orders o
on c.product_id=o.product_id
where extract(month from o.order_date)=6 and extract(year from o.order_date)=2020
group by 1)
,july as(
select
o.customer_id
,sum(o.quantity*c.price) as sum_july
from
Product c join Orders o
on c.product_id=o.product_id
where extract(month from o.order_date)=7 and extract(year from o.order_date)=2020
group by 1)
select jun.customer_id,c.name from june jun join july jul
USING (customer_id) 
inner join Customers c
USING (customer_id) 
where sum_june>=100 and sum_july>=100
