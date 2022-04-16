# Write your MySQL query statement below
with abc as (
    select id,email,row_number() over (partition by email order by id) as row_num from Person
    )
delete p from person p inner join abc x on p.id=x.id where x.row_num>1