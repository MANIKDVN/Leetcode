# Write your MySQL query statement below
select
round(avg(cnt)*100,2) as average_daily_percent
from(
select
action_date
,count(distinct r.post_id)/count(distinct a.post_id) as cnt
from
Actions a left join Removals r
using(post_id)
where action='report' and extra='spam'
group by 1) as a