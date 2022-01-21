# Write your MySQL query statement below
select
round(ifnull(avg(session_count),0),2) as average_sessions_per_user
from(
select
user_id
,session_id
,count(distinct session_id) as session_count
from
Activity
where activity_date between date_sub('2019-07-27',interval 29 day) and '2019-07-27'
group by user_id) as a