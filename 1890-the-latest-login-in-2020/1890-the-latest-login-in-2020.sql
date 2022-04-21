# Write your MySQL query statement below
select
user_id
,time_stamp as last_stamp
from(
select
user_id
,time_stamp
,rank() over (partition by user_id order by time_stamp desc) rnk
from
Logins where time_stamp like '2020-%') as a
where rnk=1