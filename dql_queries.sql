
/* SIMPLE SELECT QUERIES */

/* find the users that vote in the restaurant with the id = 1 */
select concat(u.name, ' ',u.lastname) as full_name from users u where u.id in
    (select user_id from votes where poll_restaurant_id in (select id from poll_restaurants where restaurant_id = 1));

/* Return the number of restaurants */
select count(*) as restaurant_quantity from restaurants;

/* Return the restaurants (name capitalized) with products that has a specific food type */
select upper(name) as name from restaurants r where r.id in (select restaurant_id from products p where p.food_type_id in
    (select id from food_types f where f.name like '%Pasta%'));

/* Return the food type max price in specific restaurant */
select max(price) as price, (select f.name from food_types f where id = food_type_id) as food_type from products p
    group by p.food_type_id, p.restaurant_id having p.restaurant_id = 2;

/* Return to the restaurants that are open at this moment */
select * from restaurants r where r.opening_time < CURRENT_TIME and r.close_time > CURRENT_TIME;

/* SELECT QUERIES WITH JOIN */

/* return all products with the restaurant name */
select p.name as product_name, p.price as products_price, r.name as restaurant_name
    from products p inner join restaurants r on r.id = p.restaurant_id;

/* Return the restaurants in specific poll */
select r.name as restaurant_name from poll_restaurants pr
    inner join restaurants r on r.id = pr.restaurant_id  where pr.poll_id = 1;
