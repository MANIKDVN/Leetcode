# Write your MySQL query statement below
with immediate as(

    select * from
    Delivery
    where order_date=customer_pref_delivery_date
)
select round(count(*)/(select count(*) from Delivery)*100,2) as immediate_percentage
from immediate