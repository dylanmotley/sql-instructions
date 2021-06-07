-- left join - student major
SELECT firstname, lastname, MajorId, Description 
FROM student
left outer join major maj
on majorid = maj.id;