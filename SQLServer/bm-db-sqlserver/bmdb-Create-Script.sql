use master;
go
alter database bmdb set single_user with rollback immediate
go
DROP DATABASE IF EXISTS bmdb;
go
CREATE DATABASE bmdb;
go
USE bmdb;
go


Create table Movie (
ID 			integer 		primary key identity(1,1),
Title 		nvarchar(255) 	not null unique,
Year 		integer 		not null,
Rating 		nvarchar(5)     not null,
Director 	nvarchar(255) 	not null
);


Create table Actor (
ID 			integer 		primary key identity(1,1),
FirstName 	nvarchar(255) 	not null,
LastName 	nvarchar(255) 	not null,
Gender 		nvarchar(1)     not null,
BirthDate 	date 			not null,
CONSTRAINT unq_actor unique (FirstName, LastName, BirthDate)
);


Create table Credit (
ID 				integer 			primary key identity(1,1),
ActorID 		integer 			not null,
MovieID 		integer 			not null,
Role		 	varchar(255)		not null,
Foreign Key (ActorID) references Actor(ID),
Foreign Key (MovieID) references Movie(ID),
CONSTRAINT act_mov unique (ActorID, MovieID)
);

insert into Movie VALUES
 	('Revenge of the Nerds', 1984, 'R', 'Jeff Kanew'),
 	('Avengers Infinity War', 2018, 'PG-13', 'Anthony Russo, John Russo'),
    ('The Shawshank Redemption', 1994, 'R', 'Frank Darabont'),
    ('The Godfather', '1972', 'R', 'Francis Coppola'),
    ('The Dark Knight', '2008', 'PG-13', 'Christopher Nolan'),
    ('Inception', '2010', 'PG-13', 'Christopher Nolan');

insert into Actor VALUES
 	('Robert', 'Downey Jr.', 'M', '1965-4-4'),
 	('Chris', 'Hemsworth', 'M', '1983-09-11'),
    ('Scarlett', 'Johansson', 'F', '1984-11-22'),
 	('Robert', 'Carradine', 'M', '1954-3-24'),
 	('Anthony', 'Edwards', 'M', '1962-7-19'),
    ('Tim', 'Robbins', 'M', '1958-10-16'),
    ('Morgan', 'Freeman', 'M', '1937-6-1'),
    ('Marlon', 'Brando', 'M', '1924-4-3'),
    ('Al', 'Pacino', 'M', '1924-4-25'),
    ('Christian', 'Bale', 'M', '1974-1-30'),
    ('Heath', 'Ledger', 'M', '1979-4-4');

insert into Credit (ActorID, MovieID, Role) VALUES
 	(1, 2, 'Tony Stark - Iron Man'),
    (2, 2, 'Thor'),
    (3, 2, 'Natasha Romanoff - Black Widow'),
    (4, 1, 'Lewis'),
    (5, 1, 'Gilbert'),
    (6, 3, 'Andy'),
    (7, 3, 'Ellis'),
    (8, 4, 'Don'),
    (9, 4, 'Michael'),
    (10, 5, 'Bruce'),
    (11, 5, 'Joker');

