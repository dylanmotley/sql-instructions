DROP DATABASE IF EXISTS prs_db;
CREATE DATABASE prs_db;
USE prs_db;

Create table User (
ID 			        integer 		    primary key auto_increment,
Username 		    varchar(20) 	    not null unique,
Password 		    varchar(10) 		not null,
FirstName 		    varchar(20) 		not null,
LastName 	        varchar(20) 	    not null,
Phone               varchar(12)         not null,
Email               varchar(75)         not null,
Reviewer            Bit                 not null,
Admin               Bit                 not null
);

Create table Vendor (
ID 			integer 		primary key auto_increment,
Code 	    varchar(10) 	not null unique,
Name        varchar(255) 	not null,
Address     varchar(255) 	not null,
City        varchar(255) 	not null,
State       varchar(2) 	    not null,
Zip         varchar(5) 	    not null,
Phone       varchar(12) 	not null,
Email       varchar(100) 	not null        
);

Create table Request (
ID 				   integer 			    primary key auto_increment,
UserID 		       integer 			    not null,
Description        varchar(100) 	    not null,
Justification      varchar(255)	        not null,
DataNeeded         date                 not null,
DeliveryMode       varchar(25) 	        not null,
Status             varchar(20) 	        not null,
Total              decimal (10,2) 	    not null,
SubmittedDate      datetime 	        not null,
ReasonForRejection varchar(10) 	        null,
foreign key (UserID) references User(ID)
);

Create table Product (
ID 				integer 			    primary key auto_increment,
VendorID 		integer 			    not null,
PartNumber		varchar(50)		        not null,
Name            varchar(150)            not null,
Price           decimal(10,2)           not null,
Unit            varchar(255)            null,
PhotoPath       varchar(255)            null,
foreign key (VendorID) references Vendor(ID),
constraint vendor_part unique (VendorID, PartNumber)
);

Create table LineItem (
ID 				integer 			    primary key auto_increment,
RequestID       integer 			    not null,
ProductID       integer 			    not null,
Quantity		integer		            not null,
foreign key (ProductID) references Product(ID),
foreign key (RequestID) references Request(ID),
constraint req_pdt unique (RequestID, ProductID)
);

DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs_db.* TO prs_user@localhost;