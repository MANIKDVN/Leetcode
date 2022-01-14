# Write your MySQL query statement below
with cte as(select
distinct
t1.id
,case when t1.p_id is null then 'Root' else 'Inner' end as type
from Tree t1 join Tree t2
on t1.id=t2.p_id)

select id,
case when p_id is null then 'Root' else 'Leaf' end as type
from Tree where id not in (select distinct id from cte)
union
select * from cte

OR

select id,
case when p_id is null then 'Root' when id in (select p_id from Tree) then 'Inner' else 'Leaf' end as type
from Tree order by id