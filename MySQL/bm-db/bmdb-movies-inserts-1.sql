 insert into Movie VALUES
    (3, 'The Shawshank Redemption', 1994, 'R', 'Frank Darabont'),
    (4, 'The Godfather', '1972', 'R', 'Francis Coppola'),
    (5, 'The Dark Knight', '2008', 'PG-13', 'Christopher Nolan'),
    (6, 'Inception', '2010', 'PG-13', 'Christopher Nolan');
    
insert into Actor VALUES
	(6, 'Tim', 'Robbins', 'M', '1958-10-16'),
    (7, 'Morgan', 'Freeman', 'M', '1937-6-1'),
    (8, 'Marlon', 'Brando', 'M', '1924-4-3'),
    (9, 'Al', 'Pacino', 'M', '1924-4-25'),
    (10, 'Christian', 'Bale', 'M', '1974-1-30'),
    (11, 'Heath', 'Ledger', 'M', '1979-4-4');
    
    
insert into Credit (ActorID, MovieID, Role) VALUES
    (6, 3, 'Andy'),
    (7, 3, 'Ellis'),
    (8, 4, 'Don'),
    (9, 4, 'Michael'),
    (10, 5, 'Bruce'),
    (11, 5, 'Joker');
    
    
    