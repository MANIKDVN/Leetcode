# Write your MySQL query statement below
select
person_name
from(
    select
person_name
,sum(weight) over (order by turn) as s
,rank() over (order by turn) as rnk
from
Queue
) as a
where s<=1000
order by rnk desc
limit 1