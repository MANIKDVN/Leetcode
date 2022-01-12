# Write your MySQL query statement below
with cte as(
select
v.visit_id from
Visits v inner join Transactions t
on v.visit_id=t.visit_id)

select v.customer_id,count(*) as count_no_trans from Visits v where v.visit_id not in (select c.visit_id from cte c) group by v.customer_id