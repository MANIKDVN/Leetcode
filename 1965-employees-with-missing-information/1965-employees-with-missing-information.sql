# Write your MySQL query statement below

with cte as (select
e.employee_id
,e.name
,s.salary
from Employees e join Salaries s
on e.employee_id=s.employee_id)

select employee_id from Employees where employee_id not in (select employee_id from cte)
union
select employee_id from Salaries where employee_id not in (select employee_id from cte) order by 1