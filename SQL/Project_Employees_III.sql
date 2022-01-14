# Write your MySQL query statement below
select project_id,employee_id from(
select
project_id,e.employee_id,
rank() over (partition by project_id order by experience_years desc) rnk
from
Project p join Employee e
using(employee_id)) as a where rnk=1