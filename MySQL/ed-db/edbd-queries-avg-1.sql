-- SELECT avg(sat)
-- from student;

select * 
from student
where sat < (SELECT avg(sat)
from student)
order by sat;