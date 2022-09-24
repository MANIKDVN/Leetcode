# Write your MySQL query statement below
select
student_id,min(course_id)course_id,grade from(
select
student_id,course_id,grade from(
select
student_id,course_id
,grade
,rank() over(partition by student_id order by grade desc) rnk
from Enrollments
)res
where rnk=1)res1
group by 1,3