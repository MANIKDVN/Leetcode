# Write your MySQL query statement below
with sa3 as(
select
s.product_id,p.product_name,s.sale_date
from
Sales s inner join Product p
on s.product_id=p.product_id)

select distinct s.product_id,s.product_name from sa3 s 
where s.sale_date between '2019-01-01' and '2019-03-31'
and s.product_id not in (
select product_id from Sales where sale_date not between '2019-01-01' and '2019-03-31'
)