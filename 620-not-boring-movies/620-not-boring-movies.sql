# Write your MySQL query statement below
select
id
,movie
,description
,rating
from(
select
case when mod(id,2)!=0 then id else 0.0 end as id
,movie
,description
,rating
from Cinema
where description!='boring') as a
where id<>'a'
order by rating desc