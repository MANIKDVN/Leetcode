# Write your MySQL query statement below
select distinct
buyer_id
from Product p inner join Sales s
on s.product_id=p.product_id
where product_name='S8'
and buyer_id not in 
(select buyer_id from Product p inner join Sales s
on s.product_id=p.product_id
where product_name='iPhone')