-- join views
-- join student and major...
-- a list of all students and their respective majors
select firstname, lastname , code, description
from student
join major m
on majorid = m.id;

-- Attempt
-- select firstname, lastname, subject 
-- from student
-- join studentclass sc
-- on studentid = sc.id
-- join class c
-- on classid = c.id;

-- three table join
select firstname, lastname, code, subject
 from student
join studentclass
 on studentid = student.id
join class
 on classid = class.id;