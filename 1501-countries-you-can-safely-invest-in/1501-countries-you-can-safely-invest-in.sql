# Write your MySQL query statement below
with cte1 as (select
p.id
,c.name
from
Country c left join Person p
on c.country_code=left(p.phone_number,3))
,caller as(
select
cte1.id
,name,(duration) as sce
from cte1 inner join Calls c
on cte1.id = c.caller_id
    union all
    select
cte1.id
,name,(duration) as sce
from cte1 inner join Calls c
on cte1.id = c.callee_id)
,Global_avg as(
select (sum(duration)*2)/(count(duration)*2) as Global_avg from Calls)
,local_avg as(
select avg(sce) as local_avg1,name from caller group by name)
select name as country from local_avg
where local_avg1>(select global_avg from global_avg)