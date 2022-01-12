# Write your MySQL query statement below
select
st.student_id
,st.student_name
,su.subject_name
,sum(case when st.student_id=ex.student_id and su.subject_name=ex.subject_name then 1 else 0 end) as attended_exams
from
Students st, Examinations ex, Subjects su
group by 1,2,3
order by st.student_id,su.subject_name