-- Perform a 3 table inner join to list all credits (movie title, movie year, actor name, role).

select title, year, firstname, lastname, role
from movie m
join credit c
on movieid = m.id
join actor a
on actorid = a.id; 