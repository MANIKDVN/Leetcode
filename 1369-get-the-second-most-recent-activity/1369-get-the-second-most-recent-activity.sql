# Write your MySQL query statement below
select
username
,activity
,startDate
,endDate from(select
username
,activity
,startDate
,endDate
,rank() over(partition by username order by startDate desc) rnk
,count(*) over(partition by username) cnt
from
UserActivity)a
where cnt=1 or rnk=2