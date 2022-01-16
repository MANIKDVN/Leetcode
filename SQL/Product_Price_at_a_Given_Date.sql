# Write your MySQL query statement below
Select u.Product_id, (case when rnk=1 then u.new_price else 10 end) as price

FROM Products u
LEFT JOIN (
SELECT product_id, new_price, change_date,
RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) as rnk
FROM Products
WHERE datediff(change_date, '2019-08-16')<1) i
ON u.product_id = i.product_id
WHERE rnk = 1 and U.change_date=i.change_date OR rnk IS NULL
Group by U.product_id