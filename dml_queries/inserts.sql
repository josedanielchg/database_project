/* insert data in users table */
insert into users (email, password, name, lastname)
values 
('john.doe@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'John', 'Doe'),                -- ID: 01
('jane.smith@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Jane', 'Smith'),            -- ID: 02
('david.jones@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'David', 'Jones'),          -- ID: 03
('sara.lee@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Sara', 'Lee'),                -- ID: 04
('mike.chang@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Mike', 'Chang'),            -- ID: 05
('emily.nguyen@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Emily', 'Nguyen'),        -- ID: 06
('alex.kim@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Alex', 'Kim'),                -- ID: 07
('jessica.garcia@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Jessica', 'Garcia'),    -- ID: 08
('kevin.wang@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Kevin', 'Wang'),            -- ID: 09
('amanda.brown@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Amanda', 'Brown');        -- ID: 10


/* insert data in restaurants table */
insert into restaurants (name, opening_time, closing_time, address)
values
('Pizza Palace', '4:30:00', '12:30:00', '123 Main St.'),        -- ID: 01
('Taco Town', '8:00:00', '16:00:00', '456 Elm St.'),            -- ID: 02
('Burger Barn', '12:30:00', '20:30:00', '789 Oak St.'),         -- ID: 03
('Sushi Shack', '16:00:00', '00:00:00', '321 Maple St.'),       -- ID: 04
('Thai Terrace', '20:30:00', '23:30:00', '654 Pine St.');       -- ID: 05


/* insert data in food_types table */
insert into food_types (name)
values 
('Pizza'),          -- ID: 01
('Tacos'),          -- ID: 02
('Burgers'),        -- ID: 03
('Sushi'),          -- ID: 04
('Thai Curry'),     -- ID: 05
('Steak'),          -- ID: 06
('Pasta'),          -- ID: 07
('Salad'),          -- ID: 08
('BBQ'),            -- ID: 09
('Seafood');        -- ID: 10


/* insert data in products table */
insert into products (restaurant_id, food_type_id, name, price)
values 
(1, 1, 'Pepperoni Pizza', 12.99),           -- ID: 01
(1, 1, 'Margherita Pizza', 11.99),          -- ID: 02
(2, 2, 'Beef Tacos', 9.99),                 -- ID: 03
(2, 2, 'Fish Tacos', 10.99),                -- ID: 04
(3, 3, 'Cheeseburger', 8.99),               -- ID: 05
(3, 3, 'Bacon Cheeseburger', 9.99),         -- ID: 06
(4, 4, 'California Roll', 7.99),            -- ID: 07
(4, 4, 'Spicy Tuna Roll', 8.99),            -- ID: 08
(5, 5, 'Green Curry', 11.99),               -- ID: 09
(5, 5, 'Pad Thai', 10.99),                  -- ID: 10
(1, 6, 'Grilled Steak', 16.99),             -- ID: 11
(1, 6, 'Filet Mignon', 24.99),              -- ID: 12
(2, 7, 'Spaghetti and Meatballs', 12.99),   -- ID: 13
(2, 7, 'Lasagna', 14.99),                   -- ID: 14
(3, 8, 'Caesar Salad', 7.99),               -- ID: 15
(3, 8, 'Greek Salad', 8.99),                -- ID: 16
(4, 9, 'Pulled Pork Sandwich', 9.99),       -- ID: 17
(4, 9, 'Brisket Plate', 12.99),             -- ID: 18
(5, 10, 'Crab Cakes', 14.99),               -- ID: 19
(5, 10, 'Shrimp Scampi', 15.99),            -- ID: 20
(1, 7, 'Spaghetti and Cheese', 14.99);      -- ID: 21


/* insert data in polls table */
insert into polls (start_date, end_date, name)
values 
('2023-04-05 09:00:00', '2023-04-06 16:00:00', 'Dinner Vote - April 5th'),      -- ID: 01
('2023-04-12 09:00:00', '2023-04-13 16:00:00', 'Dinner Vote - April 12th'),     -- ID: 02
('2023-04-19 09:00:00', '2023-04-20 16:00:00', 'Dinner Vote - April 19th'),     -- ID: 03
('2023-04-26 09:00:00', '2023-04-27 16:00:00', 'Dinner Vote - April 26th'),     -- ID: 04
('2023-05-03 09:00:00', '2023-05-04 16:00:00', 'Dinner Vote - May 3rd'),        -- ID: 05
('2023-05-10 09:00:00', '2023-05-11 16:00:00', 'Dinner Vote - May 10th'),       -- ID: 06
('2023-05-17 09:00:00', '2023-05-18 16:00:00', 'Dinner Vote - May 17th'),       -- ID: 07
('2023-05-24 09:00:00', '2023-05-25 16:00:00', 'Dinner Vote - May 24th'),       -- ID: 08
('2023-05-31 09:00:00', '2023-06-01 16:00:00', 'Dinner Vote - May 31st'),       -- ID: 09
('2023-06-07 09:00:00', '2023-06-08 16:00:00', 'Dinner Vote - June 7th'),       -- ID: 10
('2023-06-14 09:00:00', '2023-06-15 16:00:00', 'Dinner Vote - June 14th'),      -- ID: 11
('2023-06-21 09:00:00', '2023-06-22 16:00:00', 'Dinner Vote - June 21st'),      -- ID: 12
('2023-06-28 09:00:00', '2023-06-29 16:00:00', 'Dinner Vote - June 28th'),      -- ID: 13
('2023-07-05 09:00:00', '2023-07-06 16:00:00', 'Dinner Vote - July 5th'),       -- ID: 14
('2023-07-12 09:00:00', '2023-07-13 16:00:00', 'Dinner Vote - July 12th');      -- ID: 15


/* insert data in poll_restaurants table */
insert into poll_restaurants (poll_id, restaurant_id, is_winner)
values 
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
insert into votes (user_id, poll_id, poll_restaurant_id) 
values 
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


/* insert data in order_users table */
insert into order_users (user_id, poll_restaurant_id, surplus_money) 
values 
(1, 1, 0.5), (3, 1, 0.5), (5, 1, 0.5), (7, 1, 0.5), (9, 1, 0.5), (2, 1, 0.5), (4, 1, 0.5), (6, 1, 0.5), (8, 1, 0.5),            -- winner of the poll 1 => poll_restaurant_id = 1
(1, 4, 0.5), (3, 4, 0.5), (5, 4, 0.5), (7, 4, 0.5), (2, 4, 0.5), (4, 4, 0.5), (6, 4, 0.5), (8, 4, 0.5), (10, 4, 0.5),           -- winner of the poll 2 => poll_restaurant_id = 4
(1, 6, 0.5), (3, 6, 0.5), (5, 6, 0.5), (7, 6, 0.5), (2, 6, 0.5), (4, 6, 0.5), (6, 6, 0.5), (8, 6, 0.5), (10, 6, 0.5),           -- winner of the poll 3 => poll_restaurant_id = 6
(1, 7, 0.5), (3, 7, 0.5), (5, 7, 0.5), (7, 7, 0.5), (9, 7, 0.5), (2, 7, 0.5), (4, 7, 0.5), (6, 7, 0.5), (8, 7, 0.5),            -- winner of the poll 4 => poll_restaurant_id = 7
(1, 10, 0.5), (3, 10, 0.5), (5, 10, 0.5), (7, 10, 0.5), (2, 10, 0.5), (4, 10, 0.5), (6, 10, 0.5), (8, 10, 0.5), (10, 10, 0.5),  -- winner of the poll 5 => poll_restaurant_id = 10
(1, 11, 0.5), (3, 11, 0.5), (5, 11, 0.5), (7, 11, 0.5), (9, 11, 0.5), (2, 11, 0.5), (4, 11, 0.5), (6, 11, 0.5), (8, 11, 0.5),   -- winner of the poll 6 => poll_restaurant_id = 11
(1, 14, 0.5), (3, 14, 0.5), (5, 14, 0.5), (7, 14, 0.5), (2, 14, 0.5), (4, 14, 0.5), (6, 14, 0.5), (8, 14, 0.5), (10, 14, 0.5),  -- winner of the poll 7 => poll_restaurant_id = 14
(1, 16, 0.5), (3, 16, 0.5), (5, 16, 0.5), (7, 16, 0.5), (9, 16, 0.5), (2, 16, 0.5), (4, 16, 0.5), (6, 16, 0.5), (8, 16, 0.5),   -- winner of the poll 8 => poll_restaurant_id = 16
(1, 17, 0.5), (3, 17, 0.5), (5, 17, 0.5), (7, 17, 0.5), (9, 17, 0.5), (2, 17, 0.5), (4, 17, 0.5), (6, 17, 0.5), (8, 17, 0.5),   -- winner of the poll 9 => poll_restaurant_id = 17
(1, 19, 0.5), (3, 19, 0.5), (5, 19, 0.5), (7, 19, 0.5), (9, 19, 0.5), (2, 19, 0.5), (4, 19, 0.5), (6, 19, 0.5), (8, 19, 0.5),   -- winner of the poll 10 => poll_restaurant_id = 19
(1, 21, 0.5), (3, 21, 0.5), (5, 21, 0.5), (7, 21, 0.5), (9, 21, 0.5), (2, 21, 0.5), (4, 21, 0.5), (6, 21, 0.5), (8, 21, 0.5),   -- winner of the poll 11 => poll_restaurant_id = 21
(1, 24, 0.5), (3, 24, 0.5), (5, 24, 0.5), (7, 24, 0.5), (2, 24, 0.5), (4, 24, 0.5), (6, 24, 0.5), (8, 24, 0.5), (10, 24, 0.5),  -- winner of the poll 12 => poll_restaurant_id = 24
(1, 26, 0.5), (3, 26, 0.5), (5, 26, 0.5), (7, 26, 0.5), (2, 26, 0.5), (4, 26, 0.5), (6, 26, 0.5), (8, 26, 0.5), (10, 26, 0.5),  -- winner of the poll 13 => poll_restaurant_id = 26
(1, 28, 0.5), (3, 28, 0.5), (5, 28, 0.5), (7, 28, 0.5), (2, 28, 0.5), (4, 28, 0.5), (6, 28, 0.5), (8, 28, 0.5), (10, 28, 0.5),  -- winner of the poll 14 => poll_restaurant_id = 28
(1, 29, 0.5), (3, 29, 0.5), (5, 29, 0.5), (7, 29, 0.5), (9, 29, 0.5),  (2, 29, 0.5), (4, 29, 0.5), (6, 29, 0.5), (8, 29, 0.5);  -- winner of the poll 15 => poll_restaurant_id = 29


/* insert data in order_products table */
insert into order_products (order_user_id, product_id)
values
(1, 1), (2, 1), (3, 2), (4, 2), (5, 11), (6, 11), (7, 12), (8, 12), (9, 12),                      -- poll_restaurant_id = 1 / All products have to be from restaurant_id = 1
(10, 7), (11, 7), (12, 8), (13, 8), (14, 17), (15, 17), (16, 18), (17, 18), (18, 18),             -- poll_restaurant_id = 4 / All products have to be from restaurant_id = 4
(19, 3), (20, 3), (21, 4), (22, 4), (23, 13), (24, 13), (25, 14), (26, 14), (27, 14),             -- poll_restaurant_id = 6 / All products have to be from restaurant_id = 2
(28, 3), (29, 3), (30, 4), (31, 4), (32, 13), (33, 13), (34, 14), (35, 14), (36, 14),             -- poll_restaurant_id = 7 / All products have to be from restaurant_id = 2
(37, 3), (38, 4), (39, 4), (40, 4), (41, 13), (42, 13), (43, 14), (44, 14), (45, 14),             -- poll_restaurant_id = 10 / All products have to be from restaurant_id = 2
(46, 5), (47, 5), (48, 6), (49, 6), (50, 15), (51, 15), (52, 16), (53, 16), (54, 16),             -- poll_restaurant_id = 11 / All products have to be from restaurant_id = 3
(55, 9), (56, 9), (57, 10), (58, 10), (59, 19), (60, 19), (61, 20), (62, 20), (63, 20),           -- poll_restaurant_id = 14 / All products have to be from restaurant_id = 5
(64, 1), (65, 1), (66, 2), (67, 2), (68, 11), (69, 11), (70, 12), (71, 12), (72, 12),             -- poll_restaurant_id = 16 / All products have to be from restaurant_id = 1
(73, 5), (74, 5), (75, 6), (76, 6), (77, 15), (78, 15), (79, 16), (80, 16), (81, 16),             -- poll_restaurant_id = 17 / All products have to be from restaurant_id = 3
(82, 5), (83, 5), (84, 6), (85, 6), (86, 15), (87, 15), (88, 16), (89, 16), (90, 16),             -- poll_restaurant_id = 19 / All products have to be from restaurant_id = 3
(91, 3), (92, 3), (93, 4), (94, 4), (95, 13), (96, 13), (97, 14), (98, 14), (99, 14),             -- poll_restaurant_id = 21 / All products have to be from restaurant_id = 2
(100, 3), (101, 3), (102, 4), (103, 4), (104, 13), (105, 13), (106, 14), (107, 14), (108, 14),    -- poll_restaurant_id = 24 / All products have to be from restaurant_id = 2
(109, 3), (110, 3), (111, 4), (112, 4), (113, 13), (114, 13), (115, 14), (116, 14), (117, 14),    -- poll_restaurant_id = 26 / All products have to be from restaurant_id = 2
(118, 5), (119, 6), (120, 15), (121, 16), (122, 5), (123, 6), (124, 15), (125, 16), (126, 5),     -- poll_restaurant_id = 28 / All products have to be from restaurant_id = 3
(127, 1), (128, 2), (129, 11), (130, 12), (131, 1), (132, 2), (133, 11), (134, 12), (135, 1);     -- poll_restaurant_id = 29 / All products have to be from restaurant_id = 1