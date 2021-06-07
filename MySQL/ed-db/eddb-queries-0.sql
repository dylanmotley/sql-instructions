SELECT * FROM student
 where statecode = 'KY';
 
SELECT * FROM student
 where statecode = 'KY' or statecode = 'IN';
 
SELECT * FROM student
 where statecode in ('KY', 'IN');

SELECT * FROM student
 where statecode != 'KY';
 
SELECT * FROM student
 where not statecode = 'KY';
 
select * from student
 where gpa between 2.0 and 3.0
 order by gpa;
 
select * 
  from student
 where lastname like 'B%s'
 order by lastname;
 
select * from student
 where StateCode like 'I_';
   

    
    