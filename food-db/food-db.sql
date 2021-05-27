-- create and select the database
DROP DATABASE IF EXISTS food_db;
CREATE DATABASE food_db;
USE food_db;

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
orderdate		timestamp		        not null default current_timestamp,
status          varchar(1)              not null default 'O',
total           decimal(10,2)           not null default 0,
Foreign Key (customerid) references customer(id),
CONSTRAINT cus_ord unique (customerid, orderdate)
);

Create table LineItem (
ID 				integer 			    primary key auto_increment,
orderticketid   integer 			    not null,
menuitemid      integer 			    not null,
Qty		        integer		            not null,
Foreign Key (orderticketid) references orderticket(id),
Foreign Key (menuitemid) references menuitem(id),
CONSTRAINT ord_menu unique (orderticketid, menuitemid)
);

-- Add categories
 insert into Category (Name) VALUES
 	('Appetizers'),
    ('Salads'),
    ('Entree'),
    ('Sides'),
    ('Drinks'),
    ('Desserts');

-- create a user and grant privileges to that user
DROP USER IF EXISTS fooddb_user@localhost;
CREATE USER fooddb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON food_db.* TO fooddb_user@localhost;
