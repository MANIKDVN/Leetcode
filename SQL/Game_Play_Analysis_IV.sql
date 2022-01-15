# Write your MySQL query statement below
SELECT round(count(distinct player_id)
/(SELECT count(distinct player_id) FROM activity),2) as fraction
from
Activity
where (player_id,event_date) in (select player_id,date(min(event_date)+1) from Activity group by player_id)