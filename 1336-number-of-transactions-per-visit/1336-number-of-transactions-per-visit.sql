# Write your MySQL query statement below
WITH RECURSIVE cte AS
(
 SELECT v.user_id, v.visit_date, COUNT(transaction_date) AS num_trans
 FROM Visits v LEFT JOIN Transactions t ON v.user_id=t.user_id 
 AND v.visit_date=t.transaction_date
 GROUP BY v.user_id, v.visit_date
),

    cte2 AS
(
 SELECT 0 AS num
    UNION ALL
 SELECT num + 1 AS num FROM cte2 where num < (SELECT MAX(num_trans) FROM cte)
)

SELECT num AS transactions_count, COUNT(num_trans) AS visits_count
FROM cte2 LEFT JOIN cte ON cte2.num=cte.num_trans
GROUP BY num
