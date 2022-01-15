# Write your MySQL query statement below
select
b.book_id,
name
from Books b
left join Orders o
on b.book_id=o.book_id
and datediff('2019-06-23',o.dispatch_date)<=365
where datediff('2019-06-23',b.available_from)>=30
group by 1,2
having ifnull(sum(o.quantity),0) < 10