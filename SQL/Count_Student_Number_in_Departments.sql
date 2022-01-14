# Write your MySQL query statement below
select
d.dept_name
,count(s.dept_id) as student_number
from
Department d left join Student s
using (dept_id)
group by dept_id
order by student_number desc, dept_name
