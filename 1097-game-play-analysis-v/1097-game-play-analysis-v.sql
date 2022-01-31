# Write your MySQL query statement below
with cte as(select
player_id
,min(event_date) as min1
from Activity
group by player_id)

select min1 as install_dt,count(distinct player_id) as installs,round(sum(case when datediff(event_date,min1)=1 then 1 else 0 end)/count(distinct player_id),2) as Day1_retention
from cte inner join Activity a
using(player_id)
group by install_dt