# Write your MySQL query statement below
select
case when from_id<to_id then from_id else to_id end as person1
,case when from_id>to_id then from_id else to_id end as person2
,count(*) as call_count
,sum(duration) as total_duration
from Calls
group by 1,2