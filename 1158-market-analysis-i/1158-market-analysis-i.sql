# Write your MySQL query statement below
select
user_id as buyer_id
,u.join_date
,count(order_id) as orders_in_2019
from Orders o right join Users u
on o.buyer_id=u.user_id
and order_date like '2019-%'
group by user_id