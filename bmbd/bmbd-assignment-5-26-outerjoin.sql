-- Bonus:  Perform an outer join to list all movies and the actors who star in them, 
-- but also list movies which have no actors assigned.

select title, year, firstname, lastname
from movie m
left outer join credit c
on movieid = m.id
left outer join actor a
on actorid = a.id; 