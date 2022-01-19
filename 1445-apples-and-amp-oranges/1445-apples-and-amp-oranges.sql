# Write your MySQL query statement below
select
sale_date
,sold_num_apples-sold_num_oranges as diff
from(
select
sale_date
,sum(case when fruit='apples' then sold_num
else 0 end) as sold_num_apples
,sum(case when fruit='oranges' then sold_num
else 0 end) as sold_num_oranges
from
Sales
group by sale_date) as a
order by sale_date

