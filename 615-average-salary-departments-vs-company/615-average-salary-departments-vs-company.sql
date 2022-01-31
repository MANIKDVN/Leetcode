# Write your MySQL query statement below
with sal_average as (select date_format(pay_date, '%Y-%m') as pay_month,avg(amount) over(partition by date_format(pay_date, '%Y%m')) as tot_avg,employee_id,amount
                     from salary s)

select
distinct
pay_month
,department_id
,case when avg(amount) over(partition by department_id,pay_month)>tot_avg then 'higher'
      when avg(amount) over(partition by department_id,pay_month)<tot_avg then 'lower'
      else 'same' end as comparison
from saL_average s join Employee e
using(employee_id)
order by 2

