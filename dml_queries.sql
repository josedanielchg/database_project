/* insert data in users table */
insert into users (email, password, name, lastname)
values 
('john.doe@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'John', 'Doe'),            -- ID: 01
('jane.smith@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Jane', 'Smith'),        -- ID: 02
('david.jones@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'David', 'Jones'),      -- ID: 03
('sara.lee@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Sara', 'Lee'),            -- ID: 04
('mike.chang@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Mike', 'Chang'),        -- ID: 05
('emily.nguyen@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Emily', 'Nguyen'),    -- ID: 06
('alex.kim@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Alex', 'Kim'),            -- ID: 07
('jessica.garcia@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Jessica', 'Garcia'),-- ID: 08
('kevin.wang@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Kevin', 'Wang'),        -- ID: 09
('amanda.brown@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Amanda', 'Brown');    -- ID: 10


/* insert data in restaurants table */
INSERT INTO restaurants (name, opening_time, address)
VALUES 
('Pizza Palace', '12:00:00', '123 Main St.'),
('Taco Town', '11:00:00', '456 Elm St.'),
('Burger Barn', '13:00:00', '789 Oak St.'),
('Sushi Shack', '18:00:00', '321 Maple St.'),
('Thai Terrace', '17:30:00', '654 Pine St.');


/* insert data in food_types table */
INSERT INTO food_types (name)
VALUES 
('Pizza'),
('Tacos'),
('Burgers'),
('Sushi'),
('Thai Curry'),
('Steak'),
('Pasta'),
('Salad'),
('BBQ'),
('Seafood');


/* insert data in products table */
INSERT INTO products (restaurant_id, food_type_id, name, price)
VALUES 
(1, 1, 'Pepperoni Pizza', 12.99),
(1, 1, 'Margherita Pizza', 11.99),
(2, 2, 'Beef Tacos', 9.99),
(2, 2, 'Fish Tacos', 10.99),
(3, 3, 'Cheeseburger', 8.99),
(3, 3, 'Bacon Cheeseburger', 9.99),
(4, 4, 'California Roll', 7.99),
(4, 4, 'Spicy Tuna Roll', 8.99),
(5, 5, 'Green Curry', 11.99),
(5, 5, 'Pad Thai', 10.99),
(1, 6, 'Grilled Steak', 16.99),
(1, 6, 'Filet Mignon', 24.99),
(2, 7, 'Spaghetti and Meatballs', 12.99),
(2, 7, 'Lasagna', 14.99),
(3, 8, 'Caesar Salad', 7.99),
(3, 8, 'Greek Salad', 8.99),
(4, 9, 'Pulled Pork Sandwich', 9.99),
(4, 9, 'Brisket Plate', 12.99),
(5, 10, 'Crab Cakes', 14.99),
(5, 10, 'Shrimp Scampi', 15.99);


/* insert data in polls table */
INSERT INTO polls (start_date, end_date, name)
VALUES 
('2023-04-05 09:00:00', '2023-04-06 16:00:00', 'Dinner Vote - April 5th'),
('2023-04-12 09:00:00', '2023-04-13 16:00:00', 'Dinner Vote - April 12th'),
('2023-04-19 09:00:00', '2023-04-20 16:00:00', 'Dinner Vote - April 19th'),
('2023-04-26 09:00:00', '2023-04-27 16:00:00', 'Dinner Vote - April 26th'),
('2023-05-03 09:00:00', '2023-05-04 16:00:00', 'Dinner Vote - May 3rd'),
('2023-05-10 09:00:00', '2023-05-11 16:00:00', 'Dinner Vote - May 10th'),   
('2023-05-17 09:00:00', '2023-05-18 16:00:00', 'Dinner Vote - May 17th'),
('2023-05-24 09:00:00', '2023-05-25 16:00:00', 'Dinner Vote - May 24th'),
('2023-05-31 09:00:00', '2023-06-01 16:00:00', 'Dinner Vote - May 31st'),
('2023-06-07 09:00:00', '2023-06-08 16:00:00', 'Dinner Vote - June 7th'),
('2023-06-14 09:00:00', '2023-06-15 16:00:00', 'Dinner Vote - June 14th'),
('2023-06-21 09:00:00', '2023-06-22 16:00:00', 'Dinner Vote - June 21st'),
('2023-06-28 09:00:00', '2023-06-29 16:00:00', 'Dinner Vote - June 28th'),
('2023-07-05 09:00:00', '2023-07-06 16:00:00', 'Dinner Vote - July 5th'),
('2023-07-12 09:00:00', '2023-07-13 16:00:00', 'Dinner Vote - July 12th'),
('2023-07-19 09:00:00', '2023-07-20 16:00:00', 'Dinner Vote - July 19th'),
('2023-07-26 09:00:00', '2023-07-27 16:00:00', 'Dinner Vote - July 26th'),
('2023-08-02 09:00:00', '2023-08-03 16:00:00', 'Dinner Vote - August 2nd'),
('2023-08-09 09:00:00', '2023-08-10 16:00:00', 'Dinner Vote - August 9th'),
('2023-08-16 09:00:00', '2023-08-17 16:00:00', 'Dinner Vote - August 16th');


/* insert data in votes table */
