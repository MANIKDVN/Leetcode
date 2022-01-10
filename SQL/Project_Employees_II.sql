# Write your MySQL query statement below
with p2 as(
select
project_id
,employee_id
,rank() over (partition by project_id order by employee_id)rk
from
Project)
select project_id from p2 where rk=(select max(rk) from p2)
