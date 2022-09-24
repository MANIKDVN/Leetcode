# Write your MySQL query statement below
select
b.customer_id,a.customer_name
from Customers a
join Orders b
on a.customer_id=b.customer_id
group by b.customer_id
having sum(product_name='A')>=1 and sum(product_name='B')>=1 and sum(product_name='C')=0