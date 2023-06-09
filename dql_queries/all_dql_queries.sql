/* SIMPLE SELECT QUERIES */

/* find the users that vote in the restaurant with the id = 1 */
select concat(u.name, ' ',u.lastname) as full_name from users u where u.id in
    (select user_id from votes where poll_restaurant_id in (select id from poll_restaurants where restaurant_id = 1));

/* Return the number of restaurants */
select count(*) as restaurant_quantity from restaurants;

/* Return the restaurants (name capitalized) with products that has a specific food type */
select upper(name) as name 
    from restaurants r 
    where r.id in (
        select restaurant_id 
            from products p 
            where p.food_type_id in (
                select id 
                    from food_types f 
                    where f.name like '%Pasta%'
                )
    );

/* Return the food type max price in specific restaurant */
select max(price) as price, (select f.name from food_types f where id = food_type_id) as food_type from products p
    group by p.food_type_id, p.restaurant_id having p.restaurant_id = 2;

/* Return to the restaurants that are open at this moment */
select * from restaurants r where r.opening_time < CURRENT_TIME and r.closing_time > CURRENT_TIME;

/* Return the restaurant info in uppercase */
select id, upper(r.name) from restaurants r;

/* Return the product with specific format */
select concat(p.name, ' tiene un precio de: ', p.price) as product_price from products p where p.restaurant_id = 2;

/* Return the polls that started before 2023-05 */
select * from polls where start_date < '2023-05-01 00:00:00';

/* Return the products with price < 10 dollars */
select * from products where price::numeric::float8 < 10.00;

/* Return the users ordered by email */
select * from users order by email;

/* Return the most recent 10 polls */
select * from polls order by end_date desc limit 10;

/* returns the restaurants ordered from the one that closes later */
select * from restaurants order by closing_time desc;

/* returns the products ordered from the cheapest */
select * from products order by price limit 10;

/* Return the users ordered by name */
select * from food_types order by name limit 10;

/* Return the product average by food_type */
select round(avg(price::numeric), 2) as average from products where food_type_id = 7;

/* Return the max closing time in the restaurants */
select max(closing_time) as hour from restaurants;

/* Return the min closing time in the restaurants */
select min(closing_time) as hour from restaurants;

/* Return the users quantity by email */
SELECT substring(email from '@(.*)') as domain, COUNT(*) as total
    FROM users
    GROUP BY domain
    ORDER BY total DESC;

/* SELECT QUERIES WITH JOIN */

/* return all products with the restaurant name */
select p.name as product_name, p.price as products_price, r.name as restaurant_name
    from products p inner join restaurants r on r.id = p.restaurant_id;

/* Return the restaurants in specific poll */
select r.name as restaurant_name from poll_restaurants pr
    inner join restaurants r on r.id = pr.restaurant_id  where pr.poll_id = 1;

/* Returns the polls that the user has participated */
select poll.name
    from users u
         inner join votes v on (u.id = v.user_id)
         inner join polls poll on (v.poll_id = poll.id)
    where u.email like '%amanda.brown@example.com%';

/* Returns the products that the user bought */
select p.name as product_name from users u
    inner join order_users ordu on (u.id = ordu.user_id)
    inner join order_products op on (ordu.id = op.order_user_id)
    inner join products p on (op.product_id = p.id)
    where u.email like '%amanda.brown@example.com%'
    group by p.name;

/* Returns the product name with the food type */
select p.name as product_name, ft.name as foot_type from products p
    inner join food_types ft on (p.food_type_id = ft.id);

/* Returns the number of polls in which a user has participated per month */
select to_char(date_trunc('month', p.start_date), 'Month YYYY') as month, count(*) as quantity
    from users u
         inner join votes v on (u.id = v.user_id)
         inner join polls p on (v.poll_id = p.id)
    group by month, u.email
    having u.email like '%amanda.brown@gmail.com%';

/* Returns the number of food types a user has ordered */
select ft.name as name, count(*) as quantity
    from users u
         inner join order_users ordu on (u.id = ordu.user_id)
         inner join order_products op on (ordu.id = op.order_user_id)
         inner join products p on (op.product_id = p.id)
         inner join food_types ft on (p.food_type_id = ft.id)
    where u.email like '%amanda.brown@example.com%'
    group by ft.name;

/* Returns the number of products belonging to a food type, as long as the product costs more than $10 */
select ft.name, count(*)
    from products p
         inner join food_types ft on (p.food_type_id = ft.id)
    where p.price::numeric::float8 < 10.00
    group by ft.name