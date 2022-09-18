# Write your MySQL query statement below
with cte as
(select
product_id
,width*length*height as prod_vol
from Products
)
select name as warehouse_name
,sum(units*prod_vol) as volume
from warehouse p inner join cte cte
on p.product_id=cte.product_id
group by name