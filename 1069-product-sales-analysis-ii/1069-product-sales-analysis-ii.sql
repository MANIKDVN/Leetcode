# Write your MySQL query statement below
select distinct
product_id
,sum(quantity) over(partition by product_id) total_quantity
from Sales join Product
using(product_id)