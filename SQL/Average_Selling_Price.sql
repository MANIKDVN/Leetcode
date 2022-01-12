# Write your MySQL query statement below
select
p.product_id
,round(sum(units *price)/sum(units),2) as average_price
from
Prices p inner join UnitsSold us
on p.product_id=us.product_id
and purchase_date between start_date and end_date
group by product_id