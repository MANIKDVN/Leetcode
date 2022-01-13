# Write your MySQL query statement below
with cte as(
select
ad_id
,case when action='Clicked' then 1 else 0 end as click
,case when action<>'Ignored' then 1 else 0 end as total
from Ads)

select ad_id,coalesce(round(sum(click)/sum(total)*100,2),0) as ctr from cte
group by ad_id
order by ctr desc,ad_id