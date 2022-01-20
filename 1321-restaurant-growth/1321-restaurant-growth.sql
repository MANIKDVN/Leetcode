# Write your MySQL query statement below
 select
 visited_on
 ,amount 
 ,round((amount/7),2)  as average_amount
 from(
 select
 visited_on
 ,SUM(amount) over(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount
 from(
 SELECT visited_on, SUM(amount) AS amount FROM Customer
        group by visited_on
) as a
group by visited_on) as a
where visited_on>=(select min(visited_on) from Customer)+6