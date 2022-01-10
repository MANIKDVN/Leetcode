# Write your MySQL query statement below
select distinct
a.actor_id,
a.director_id
from
(select
actor_id,director_id, 
rank() over (partition by actor_id,director_id order by timestamp) rk
from ActorDirector)a
where a.rk>=3

#OR
select actor_id,director_id from ActorDirector group by actor_id,director_id having count(actor_id-director_id) >= 3