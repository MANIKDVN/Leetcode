# Write your MySQL query statement below
with cte as(select
date_format(c.trans_date,'%Y-%m') as month,t.country as country,'chargebacks' as state,id,amount
from Chargebacks c left join Transactions t
on c.trans_id=t.id
union all
select
date_format(trans_date,'%Y-%m') as month,country,state,id,amount
from Transactions t
where state='approved')

select month,country
,sum(case when t.state='approved' then 1 else 0 end) as approved_count
,sum(case when t.state='approved' then t.amount else 0 end) as approved_amount
,sum(case when t.state='chargebacks' then 1 else 0 end) as chargeback_count
,sum(case when t.state='chargebacks' then t.amount else 0 end) as chargeback_amount
from
cte t
group by month,country