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
('2023-07-12 09:00:00', '2023-07-13 16:00:00', 'Dinner Vote - July 12th');


/* insert data in poll_restaurants table */
INSERT INTO poll_restaurants (poll_id, restaurant_id, is_winner)
VALUES 
(1, 1, true),   (1, 3, false),  -- id = 01 y 02
(2, 3, false),  (2, 4, true),   -- id = 03 y 04
(3, 5, false),  (3, 2, true),   -- id = 05 y 06
(4, 2, true),   (4, 3, false),  -- id = 07 y 08
(5, 5, false),  (5, 2, true),   -- id = 09 y 10
(6, 3, true),   (6, 4, false),  -- id = 11 y 12
(7, 1, false),  (7, 5, true),   -- id = 13 y 14
(8, 3, true),   (8, 1, false),  -- id = 15 y 16
(9, 3, true),   (9, 2, false),  -- id = 17 y 18
(10, 3, true),  (10, 1, false), -- id = 19 y 20
(11, 2, true),  (11, 5, false), -- id = 21 y 22
(12, 1, false), (12, 2, true),  -- id = 23 y 24
(13, 1, false), (13, 2, true),  -- id = 25 y 26
(14, 4, false), (14, 3, true),  -- id = 27 y 28
(15, 1, true),  (15, 4, false); -- id = 29 y 30


/* insert data in votes table */
INSERT INTO votes (user_id, poll_id, poll_restaurant_id) 
VALUES 
(1, 1, 1), (3, 1, 1), (5, 1, 1), (7, 1, 1), (9, 1, 1),               -- poll_restaurant_id = 1
(2, 1, 2), (4, 1, 2), (6, 1, 2), (8, 1, 2),                          -- poll_restaurant_id = 2
(1, 2, 3), (3, 2, 3), (5, 2, 3), (7, 2, 3),                          -- poll_restaurant_id = 3
(2, 2, 4), (4, 2, 4), (6, 2, 4), (8, 2, 4), (10, 2, 4),              -- poll_restaurant_id = 4
(1, 3, 5), (3, 3, 5), (5, 3, 5), (7, 3, 5),                          -- poll_restaurant_id = 5
(2, 3, 6), (4, 3, 6), (6, 3, 6), (8, 3, 6), (10, 3, 6),              -- poll_restaurant_id = 6
(1, 4, 7), (3, 4, 7), (5, 4, 7), (7, 4, 7), (9, 4, 7),               -- poll_restaurant_id = 7
(2, 4, 8), (4, 4, 8), (6, 4, 8), (8, 4, 8),                          -- poll_restaurant_id = 8
(1, 5, 9), (3, 5, 9), (5, 5, 9), (7, 5, 9),                          -- poll_restaurant_id = 9
(2, 5, 10), (4, 5, 10), (6, 5, 10), (8, 5, 10), (10, 5, 10),         -- poll_restaurant_id = 10
(1, 6, 11), (3, 6, 11), (5, 6, 11), (7, 6, 11), (9, 6, 11),          -- poll_restaurant_id = 11
(2, 6, 12), (4, 6, 12), (6, 6, 12), (8, 6, 12),                      -- poll_restaurant_id = 12
(1, 7, 13), (3, 7, 13), (5, 7, 13), (7, 7, 13),                      -- poll_restaurant_id = 13
(2, 7, 14), (4, 7, 14), (6, 7, 14), (8, 7, 14), (10, 7, 14),         -- poll_restaurant_id = 14
(1, 8, 15), (3, 8, 15), (5, 8, 15), (7, 8, 15), (9, 8, 15),          -- poll_restaurant_id = 15
(2, 8, 16), (4, 8, 16), (6, 8, 16), (8, 8, 16),                      -- poll_restaurant_id = 16
(1, 9, 17), (3, 9, 17), (5, 9, 17), (7, 9, 17), (9, 9, 17),          -- poll_restaurant_id = 17
(2, 9, 18), (4, 9, 18), (6, 9, 18), (8, 9, 18),                      -- poll_restaurant_id = 18
(1, 10, 19), (3, 10, 19), (5, 10, 19), (7, 10, 19), (9, 10, 19),     -- poll_restaurant_id = 19
(2, 10, 20), (4, 10, 20), (6, 10, 20), (8, 10, 20),                  -- poll_restaurant_id = 20
(1, 11, 21), (3, 11, 21), (5, 11, 21), (7, 11, 21), (9, 11, 21),     -- poll_restaurant_id = 21
(2, 11, 22), (4, 11, 22), (6, 11, 22), (8, 11, 22),                  -- poll_restaurant_id = 22
(1, 12, 23), (3, 12, 23), (5, 12, 23), (7, 12, 23),                  -- poll_restaurant_id = 23
(2, 12, 24), (4, 12, 24), (6, 12, 24), (8, 12, 24), (10, 12, 24),    -- poll_restaurant_id = 24
(1, 13, 25), (3, 13, 25), (5, 13, 25), (7, 13, 25),                  -- poll_restaurant_id = 25
(2, 13, 26), (4, 13, 26), (6, 13, 26), (8, 13, 26), (10, 13, 26),    -- poll_restaurant_id = 26
(1, 14, 27), (3, 14, 27), (5, 14, 27), (7, 14, 27),                  -- poll_restaurant_id = 27
(2, 14, 28), (4, 14, 28), (6, 14, 28), (8, 14, 28), (10, 14, 28),    -- poll_restaurant_id = 28
(1, 15, 29), (3, 15, 29), (5, 15, 29), (7, 15, 29), (9, 15, 29),     -- poll_restaurant_id = 29
(2, 15, 30), (4, 15, 30), (6, 15, 30), (8, 15, 30);                  -- poll_restaurant_id = 30