SELECT * FROM student
  where statecode = 'OH' OR statecode = 'KY';
  
  SELECT * FROM student
  where statecode IN ('KY', 'IN');
  
  SELECT * FROM student
  where statecode != 'KY';
  
    SELECT * FROM student
  where not statecode = 'KY';
  
    SELECT * FROM student
  where gpa between 2.0 and 3.0
    order by gpa;
    
SELECT * 
  FROM student
  -- where lastname like binary 'B%'
  where lastname like 'B%S'
   order by sat;
   
select * from student
  where statecode like 'I_';
   

    
    