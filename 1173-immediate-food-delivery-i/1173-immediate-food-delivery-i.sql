# Write your MySQL query statement below
select
round(num/(select count(delivery_id) from Delivery)*100,2) immediate_percentage
from(
select
sum(case when order_date=customer_pref_delivery_date then 1 else 0 end) as num
from Delivery) as c