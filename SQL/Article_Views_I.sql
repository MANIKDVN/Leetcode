# Write your MySQL query statement below
select id from(
select
author_id as id,count(*) cnt
from
Views
where author_id=viewer_id
group by author_id
) as a where cnt>=1
order by id 