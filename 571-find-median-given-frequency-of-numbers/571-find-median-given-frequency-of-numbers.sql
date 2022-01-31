# Write your MySQL query statement below
with cte as(
select *,sum(frequency) over(order by num) as cumsum
from Numbers)

select round(avg(num),1) as median
from cte
where num = (select min(num) from cte where cumsum=(select sum(frequency)/2 from cte))
  or  num = (select min(num) from cte where cumsum>(select sum(frequency)/2 from cte))