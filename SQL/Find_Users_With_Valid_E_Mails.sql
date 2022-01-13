# Write your MySQL query statement below
select
user_id
,name
,mail
from Users where mail regexp '^[a-z|A-Z][a-z|A-Z|0-9|\\_|\\-|\\.]*@leetcode\\.com$'