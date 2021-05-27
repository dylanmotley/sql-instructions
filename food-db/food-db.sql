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
orderticketid   integer 			    not null,
menuitemid      integer 			    not null,
Qty		        integer		            not null,
Foreign Key (orderticketid) references orderticket(id),
Foreign Key (menuitemid) references menuitem(id),
CONSTRAINT ord_men unique (orderticketid, menuitemid)
);

-- Add categories
 insert into Category (Name) VALUES
 	('Appetizers'),
    ('Entree'),
    ('Salads'),
    ('Appetizers'),
    ('Appetizers'),



-- create a user and grant privileges to that user
DROP USER IF EXISTS bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;
