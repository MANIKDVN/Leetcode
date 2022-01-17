# Write your MySQL query statement below
with cte1 as(select
m.host_team as team_id
,sum(case when host_goals>guest_goals then 3 
     when host_goals=guest_goals then 1
     else 0 end) as b
from Matches m
group by m.host_team
             union all
select
m.guest_team as team_id
,sum(case when host_goals<guest_goals then 3 
     when host_goals=guest_goals then 1
     else 0 end) as b
from Matches m
group by m.guest_team)


select
t.team_id
,t.team_name
,coalesce(sum(b),0) as num_points
from Teams t left join cte1
on t.team_id=cte1.team_id
group by 1,2
order by num_points desc,t.team_id