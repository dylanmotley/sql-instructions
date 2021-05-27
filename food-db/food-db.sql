-- create and select the database
DROP DATABASE IF EXISTS fddb;
CREATE DATABASE fddb;
USE fddb;

Create table Customer (
ID 			        integer 		    primary key auto_increment,
CustomerNumber 		varchar(5) 	        not null unique,
firstname 		    varchar(255) 		not null,
lastname 		    varchar(255) 		not null,
email 	            varchar(75) 	    not null,
phonenumber         varchar(12)         not null
);

Create table Category (
ID 			integer 		primary key auto_increment,
Name 	    varchar(100) 	not null unique
);

Create table MenuItem (
ID 				integer 			    primary key auto_increment,
Categoryid 		integer 			    not null,
Name     		varchar(55) 			not null,
Price		 	decimal(10,2)		    not null,
Calories        integer                 not null,
Foreign Key (categoryid) references Category(id),
constraint cat_name unique (Categoryid, Name)
);

Create table OrderTicket (
ID 				integer 			    primary key auto_increment,
customerid 		integer 			    not null,
Name     		varchar(255) 			not null,
orderdate		timestamp		        not null,
status          varchar(1)              not null,
total           decimal(10,2)           not null,
Foreign Key (customerid) references customer(id),
CONSTRAINT cus_ord unique (customerid, orderdate)
);

Create table LineItem (
ID 				integer 			    primary key auto_increment,
orderticketid 		integer 			    not null,
menuitemid      integer 			    not null,
Qty		        integer		            not null,
Foreign Key (orderticketid) references orderticket(id),
Foreign Key (menuitemid) references menuitem(id),
CONSTRAINT ord_men unique (orderticketid, menuitemid)
);

-- Add some movies
--  insert into Movie VALUES
--  	(1, 'Revenge of the Nerds', 1984, 'R', 'Jeff Kanew'),
--  	(2, 'Avengers Infinity War', 2018, 'PG-13', 'Anthony Russo, John Russo'),
--     (3, 'The Shawshank Redemption', 1994, 'R', 'Frank Darabont'),
--     (4, 'The Godfather', '1972', 'R', 'Francis Coppola'),
--     (5, 'The Dark Knight', '2008', 'PG-13', 'Christopher Nolan'),
--     (6, 'Inception', '2010', 'PG-13', 'Christopher Nolan');
--     
-- Add some actors
--  insert into Actor VALUES
--  	(1, 'Robert', 'Downey Jr.', 'M', '1965-4-4'),
--  	(2, 'Chris', 'Hemsworth', 'M', '1983-09-11'),
--     (3, 'Scarlett', 'Johansson', 'F', '1984-11-22'),
--  	(4, 'Robert', 'Carradine', 'M', '1954-3-24'),
--  	(5, 'Anthony', 'Edwards', 'M', '1962-7-19'),
--     (6, 'Tim', 'Robbins', 'M', '1958-10-16'),
--     (7, 'Morgan', 'Freeman', 'M', '1937-6-1'),
--     (8, 'Marlon', 'Brando', 'M', '1924-4-3'),
--     (9, 'Al', 'Pacino', 'M', '1924-4-25'),
--     (10, 'Christian', 'Bale', 'M', '1974-1-30'),
--     (11, 'Heath', 'Ledger', 'M', '1979-4-4');
--     
-- Add movie credits for actors
--  insert into Credit (ActorID, MovieID, Role) VALUES
--  	(1, 2, 'Tony Stark - Iron Man'),
--     (2, 2, 'Thor'),
--     (3, 2, 'Natasha Romanoff - Black Widow'),
--     (4, 1, 'Lewis'),
--     (5, 1, 'Gilbert'),
--     (6, 3, 'Andy'),
--     (7, 3, 'Ellis'),
--     (8, 4, 'Don'),
--     (9, 4, 'Michael'),
--     (10, 5, 'Bruce'),
--     (11, 5, 'Joker');


-- create a user and grant privileges to that user
DROP USER IF EXISTS bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;
