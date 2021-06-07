select
	@max_gpa := max(gpa)
  from student;
select * from student
 where gpa = @max_gpa;