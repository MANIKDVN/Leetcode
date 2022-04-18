# Write your MySQL query statement below
select author_id as id from(
select
author_id,count(*) cnt
from Views v
where author_id=viewer_id
group by author_id)a
where cnt>=1
order by id