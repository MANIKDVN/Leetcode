# Write your MySQL query statement below
select seller_id from(
select seller_id,sum(price),
    dense_rank() over (order by sum(price) desc) as rk
    from Sales
    group by seller_id
) as a where rk=1