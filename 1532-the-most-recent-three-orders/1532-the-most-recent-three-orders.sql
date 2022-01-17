# Write your MySQL query statement below
select
customer_name,customer_id,order_id,order_date
from(
select
c.name as customer_name
,o.customer_id
,o.order_id
,o.order_date
,rank() over(partition by o.customer_id order by o.order_date desc) as rnk
from Orders o left join Customers c
using(customer_id)
    ) as a
where rnk<=3
order by customer_name,customer_id,order_date desc