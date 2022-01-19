# Write your MySQL query statement below
with metric as(
select
log_id
,log_id-row_number() over(order by log_id asc) as rnk
from
Logs)

select min(log_id) as start_id,max(log_id) as end_id
from metric group by rnk
order by start_id