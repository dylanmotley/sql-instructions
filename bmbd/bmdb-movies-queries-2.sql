-- using an alias, using as key word
select mov.title, mov.year, mov.rating 
  from movie mov;
  
  -- using an alias, no 'as' key word
select m.title, m.year, m.rating 
  from movie m;