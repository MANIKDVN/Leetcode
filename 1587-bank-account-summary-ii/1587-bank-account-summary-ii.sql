# Write your MySQL query statement below
select
u.name as NAME
,t.s as BALANCE
from Users u join
(select
account, sum(amount) as s
from
Transactions
group by account) as t
using(account)
where t.s>10000