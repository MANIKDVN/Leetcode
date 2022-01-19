# Write your MySQL query statement below
select distinct
left_operand
,operator
,right_operand
,case
when operator='>' and v.value>v1.value then 'true'
when operator='<' and v.value<v1.value then 'true'
when operator='=' and v.value=v1.value then 'true'
else 'false'
end as value
from
Expressions e join Variables v
on e.left_operand=v.name
join Variables v1
on e.right_operand=v1.name