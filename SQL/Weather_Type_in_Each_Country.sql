# Write your MySQL query statement below
select
distinct country_name
,case when avg(weather_state)<=15 then 'Cold' 
      when avg(weather_state)>=25 then 'Hot' else 'Warm' end as weather_type
from
Countries c inner join Weather w
on c.country_id=w.country_id
where extract(year from day)=2019 and extract(month from day)=11
group by w.country_id