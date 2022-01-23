# Write your MySQL query statement below
with day_per_year as(select
*
,(case when year(period_start)=2018 and year(period_end)>2018 then datediff('2018-12-31', period_start)+1
when year(period_start)=2018 and year(period_end)=2018 then datediff(period_end, period_start)+1 else 0
end) y2018
,(case when year(period_start)<2019 and year(period_end)=2019 then datediff(period_end, '2019-01-01')+1
when year(period_start)=2019 and year(period_end)>2019 then datediff('2019-12-31', period_start)+1
when year(period_start)<2019 and year(period_end)>2019 then datediff('2019-12-31', '2019-01-01')+1
when year(period_start)=2019 and year(period_end)=2019 then datediff(period_end, period_start)+1 else 0
end) y2019
,(case when year(period_start)<2020 and year(period_end)=2020 then datediff(period_end, '2020-01-01')+1
when year(period_start)=2020 and year(period_end)=2020 then datediff(period_end, period_start)+1 else 0
end) y2020
from
Sales)

,per_day_calc as (
    select * from(
    select product_id, '2018' report_year , y2018 * average_daily_sales total_amount
    from day_per_year
    union 
    select product_id, '2019' report_year , y2019 * average_daily_sales total_amount
    from day_per_year
    union
    select product_id, '2020' report_year , y2020 * average_daily_sales total_amount
    from day_per_year) A
    where total_amount <> 0
)

select per_day_calc.product_id, product_name, report_year, total_amount 
from per_day_calc
join Product
using (product_id)
order by product_id, report_year