# Write your MySQL query statement below
with cte1 as
(select
exam_id
,student_id
,score
,rank() over (partition by exam_id order by score desc) as rnk1
,rank() over (partition by exam_id order by score asc) as rnk2
from Exam)


#select exam_id ,student_id ,score from cte1 where rnk1<>1 and rnk2<>1

select distinct
s.student_id
,s.student_name
from Student s inner join Exam e
using(student_id)
where student_id not in (select student_id from cte1 where rnk1=1)
and student_id not in (select student_id from cte1 where rnk2=1)
order by s.student_id