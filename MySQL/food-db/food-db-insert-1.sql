-- add some test data to the food_db
insert into menuitem values
(1, 1, 'Cheese Sticks', 8.99, 800),
(2, 1, 'Fried Pickles', 5.99, 600),
(3, 1, 'Bread Sticks', 7.99, 700),
(4, 1, 'Nachos', 11.99, 1200),
(5, 1, 'Potato Skins', 8.99, 850),
(6, 1, 'Loaded French Fries', 9.99, 1000),
(7, 2, 'House Salad', 4.99, 400),
(8, 2, 'Caesar Salad', 6.99, 600),
(9, 3, 'Filet Mignon', 28.99, 1100),
(10, 3, 'Pizza', 13.99, 1400);

insert into menuitem values
(11, 3, 'Cheese Burger', 10.99, 1050),
(12, 4, 'Cole Slaw', 2.99, 100),
(13, 4, 'Vegtable Soup', 4.99, 300),
(14, 4, 'Onion Rings', 3.99, 450),
(15, 5, 'Miller Light', 4.99, 100),
(16, 5, 'Coke', 2.99, 200),
(17, 5, 'Merlo', 7.99, 175),
(18, 6, 'Sundae', 5.99, 600),
(19, 6, 'Cheese Cake', 6.99, 450),
(20, 6, 'Cake', 4.99, 500);

insert into customer values
(1, 'DM101', 'Motley', 'Dylan', 'motley.dyan60@gmail.com', 513-364-3332);

insert into customer values
(2, 'MM101', 'Motley', 'Melinda', 'mmotley@aol.com', 513-919-6436),
(3, 'TM101', 'Motley', 'Timothy', 'tmotley@gmail.com', 513-254-9992),
(4, 'TH101', 'Helton', 'Taylor', 'thelton@ou.com', 513-295-3456);

insert into orderticket (id, customerid) values (1, 1);

insert into orderticket (id, customerid) values
(2, 2),
(3, 3);

insert into lineitem (orderticketid, menuitemid, qty) values
(1, 9, 2),
(1, 4, 2),
(1, 7, 1);

insert into lineitem (orderticketid, menuitemid, qty) values
(2, 1, 2),
(2, 3, 2),
(2, 6, 1);

insert into lineitem (orderticketid, menuitemid, qty) values
(3, 2, 1),
(3, 10, 2),
(3, 7, 2);