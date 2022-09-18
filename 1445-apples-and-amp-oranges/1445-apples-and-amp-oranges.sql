# Write your MySQL query statement below
select
sale_date
,apple-orange as diff
from(
select
sale_date
,sum(case when fruit='apples' then sold_num else 0 end) as apple
,sum(case when fruit='oranges' then sold_num else 0 end) as orange
from Sales
group by 1)
as a