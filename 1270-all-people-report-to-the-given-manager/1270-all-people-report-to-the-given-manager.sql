# Write your MySQL query statement below
with direct as(
select
e1.employee_id
,e1.employee_name
,e1.manager_id
from Employees e1
where manager_id=1 and employee_id<>1)

,direct_1 as(
select e1.employee_id
,e1.employee_name
,e1.manager_id
from Employees e1 join direct d
on e1.manager_id=d.employee_id)

,direct_2 as(
select e1.employee_id
,e1.employee_name
,e1.manager_id
from Employees e1 join direct_1 d
on e1.manager_id=d.employee_id
)

select employee_id from direct
union
select employee_id from direct_1
union
select employee_id from direct_2

