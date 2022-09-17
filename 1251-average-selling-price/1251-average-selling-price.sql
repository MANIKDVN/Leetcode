# Write your MySQL query statement below
select
product_id,round(total/products,2) as average_price from(
select
us.product_id product_id
,sum(case when us.purchase_date between p.start_date and p.end_date then us.units*p.price end) total
,sum(case when us.purchase_date between p.start_date and p.end_date then us.units end) products
from UnitsSold us join Prices p
on us.product_id=p.product_id
group by 1) as a