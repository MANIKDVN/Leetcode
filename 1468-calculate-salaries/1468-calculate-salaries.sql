# Write your MySQL query statement below
with max_sal as(select
company_id
,employee_id
,employee_name
,salary
,max(salary) as max_salary 
from Salaries
group by company_id
)

select
s.company_id
,s.employee_id
,s.employee_name
,round(case when ms.max_salary>10000 then
s.salary-(0.49*s.salary)
when ms.max_salary >= 1000 and ms.max_salary <= 10000 then s.salary-(0.24*s.salary)
when ms.max_salary < 1000 then s.salary
else s.salary
end,0) salary
from Salaries s left join max_sal ms
using(company_id)