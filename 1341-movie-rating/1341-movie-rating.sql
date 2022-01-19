# Write your MySQL query statement below
with cte1 as
(select
u.name
,rank() over(partition by m.user_id order by m.movie_id) as rnk
from
MovieRating m left join Users u
using(user_id)
order by u.name)

, cte2 as(
select
movie_id
,avg(rating) as rating
from
MovieRating
where extract(month from created_at)=2 and extract(year from created_at)=2020
group by movie_id)

(select name as results from cte1 where rnk=(select max(rnk) from cte1) limit 1)
union
(select m.title as results from cte2 join Movies m using(movie_id) where rating=(select max(rating) from cte2) order by m.title limit 1)