# Write your MySQL query statement below
select
distinct title
from
Content c join TVProgram tvp
on c.content_id=tvp.content_id
where Kids_content='Y'
and content_type='Movies'
and extract(year from program_date)=2020
and extract(month from program_date)=6