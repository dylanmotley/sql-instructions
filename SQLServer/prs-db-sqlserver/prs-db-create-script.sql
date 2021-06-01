use master;
go
alter database prsdb set single_user with rollback immediate
go
DROP DATABASE IF EXISTS prsdb;
go
CREATE DATABASE prsdb;
go
USE prsdb;
go

Create table [User] (
ID 			        integer 		    primary key identity(1,1),
Username 		    nvarchar(20) 	    not null unique,
Password 		    nvarchar(10) 		not null,
FirstName 		    nvarchar(20) 		not null,
LastName 	        nvarchar(20) 	    not null,
Phone               nvarchar(12)        not null,
Email               nvarchar(75)        not null,
Reviewer            Bit                 default 0 not null,
Admin               Bit                 default 0 not null
);

Create table Vendor (
ID 			integer 		primary key identity(1,1),
Code 	    nvarchar(10) 	not null unique,
Name        nvarchar(255) 	not null,
Address     nvarchar(255) 	not null,
City        nvarchar(255) 	not null,
State       nvarchar(2) 	not null,
Zip         nvarchar(5) 	not null,
Phone       nvarchar(12) 	not null,
Email       nvarchar(100) 	not null,
Constraint 
);

Create table Request (
ID 				   integer 			    primary key identity(1,1),
UserID 		       integer 			    not null,
Description        nvarchar(100) 	    not null,
Justification      nvarchar(255)	    not null,
DataNeeded         date                 not null,
DeliveryMode       nvarchar(25) 	    not null,
Status             nvarchar(20) 	    not null default 'New',
Total              decimal (10,2) 	    not null,
SubmittedDate      datetime 	        default getdate() not null,
ReasonForRejection varchar(10) 	        null,
foreign key (UserID) references [User](ID)
);

Create table Product (
ID 				integer 			    primary key identity(1,1),
VendorID 		integer 			    not null,
PartNumber		nvarchar(50)		    not null,
Name            nvarchar(150)           not null,
Price           decimal(10,2)           not null,
Unit            nvarchar(255)           null,
PhotoPath       nvarchar(255)           null,
foreign key (VendorID) references Vendor(ID),
constraint vendor_part unique (VendorID, PartNumber)
);

Create table LineItem (
ID 				integer 			    primary key identity(1,1),
RequestID       integer 			    not null,
ProductID       integer 			    not null,
Quantity		integer		            not null,
foreign key (ProductID) references Product(ID),
foreign key (RequestID) references Request(ID),
constraint req_pdt unique (RequestID, ProductID)
);


insert into [user] (Username, Password, FirstName, LastName, Phone, Email, Reviewer, Admin) VALUES
	(1, 'SYSTEM', 'xxxxx', 'System', 'System', 'XXX-XXX-XXXX', 'system@test.com', 0, 0),
	(2, 'sblessing', 'login', 'Sean', 'Blessing', '513-600-7096', 'sean@blessingtechnology.com', 1, 1),
	(3, 'dmotley', 'alpha', 'Dylan', 'Motley', '513-364-3332', 'motley.dylan60@gmail.com', 2, 2);

set identity_insert vendor ON

INSERT into vendor (ID, code, name, address, city, state, zip, phone, email) VALUES
(1, 'BB-1001', 'Best Buy', '100 Best Buy Street', 'Louisville', 'KY', '40207', '502-111-9099', 'geeksquad@bestbuy.com'),
(2, 'AP-1001', 'Apple Inc', '1 Infinite Loop', 'Cupertino', 'CA', '95014', '800-123-4567', 'genius@apple.com'),
(3, 'AM-1001', 'Amazon', '410 Terry Ave. North', 'Seattle', 'WA', '98109','206-266-1000', 'amazon@amazon.com'),
(4, 'ST-1001', 'Staples', '9550 Mason Montgomery Rd', 'Mason', 'OH', '45040', '513-754-0235', 'support@orders.staples.com'),
(5, 'MC-1001', 'Micro Center', '11755 Mosteller Rd', 'Sharonville', 'OH', '45241', '513-782-8500', 'support@microcenter.com');

set identity_insert vendor OFF

set identity_insert product ON

INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL);
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,'','/images/AcerAspireDesktop.jpg');
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES (13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,'','/images/LenovoIdeaCenter.jpg');

set identity_insert product OFF

