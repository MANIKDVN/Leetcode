# Write your MySQL query statement below
(select
page_id as recommended_page
from
Friendship f inner join Likes l
on f.user2_id=l.user_id
where user1_id = 1
and page_id not in (select page_id from Likes where user_id = 1)
)

union

(select
page_id as recommended_page
from
Friendship f inner join Likes l
on f.user1_id=l.user_id
where user2_id = 1
and page_id not in (select page_id from Likes where user_id = 1)
)