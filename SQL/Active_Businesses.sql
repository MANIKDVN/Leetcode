# Write your MySQL query statement below
with cte as (select
business_id
,event_type
,occurences
,avg(occurences) over(partition by event_type) as avg1
from Events)

,cte2 as(
select 
business_id
,occurences
,avg1
,rank() over(partition by business_id) as rnk
from cte
where occurences>avg1)

select business_id from cte2
group by business_id
having count(rnk)>1


OR

SELECT DISTINCT business_id
FROM(
    SELECT *, AVG(occurences) OVER (PARTITION BY event_type) average
    FROM Events) temp
WHERE occurences > average
GROUP BY business_id
HAVING COUNT(business_id) > 1