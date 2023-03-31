
/* UPDATE QUERIES */
update votes set poll_restaurant_id = 2 where id = 1;
update users set email = 'jane@example.com' where id = 2;
update restaurants set address = '123 Center' where id = 1;
update products set price = 12.50 where id = 1;
update poll_restaurants set is_winner = true where id = 2;