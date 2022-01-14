# Write your MySQL query statement below
select name from (select
e1.name
,count(*) cnt
from Employee e1 join Employee e2
where e1.id = e2.managerId
group by 1) as a
where cnt>=5