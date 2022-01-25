# Write your MySQL query statement below

with cte as(select
session_id
,duration
,sum(case when (duration/60>=0 and duration/60<5) then 1 else 0 end) as c_0_5
,sum(case when (duration/60>=5 and duration/60<10) then 1 else 0 end) as c_5_10
,sum(case when (duration/60>=10 and duration/60<15) then 1 else 0 end) as c_10_15
,sum(case when duration/60>=15 then 1 else 0 end) as more
from Sessions)

select '[0-5>' as bin,c_0_5 as total from cte union
select '[5-10>' as bin,c_5_10 as total from cte union
select '[10-15>' as bin,c_10_15 as total from cte union
select '15 or more' as bin,more as total from cte