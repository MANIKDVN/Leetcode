# Write your MySQL query statement below
select
seller_name from seller where seller_name not in(
select
distinct
b.seller_name
from Orders a
join Seller b
on a.seller_id=b.seller_id
where extract(year from sale_date)=2020
)order by 1