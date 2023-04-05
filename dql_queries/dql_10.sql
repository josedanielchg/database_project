/* Returns the products that the user bought */
select p.name as product_name from users u
    inner join order_users ordu on (u.id = ordu.user_id)
    inner join order_products op on (ordu.id = op.order_user_id)
    inner join products p on (op.product_id = p.id)
    where u.email like '%amanda.brown@gmail.com%'
    group by p.name;


/* Return the food type max price in specific restaurant */
select
    max(price) as price,
    (select f.name from food_types f where id = food_type_id) as food_type
    from products p
    group by p.food_type_id, p.restaurant_id having p.restaurant_id = 2;


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
    where u.email like '%amanda.brown@gmail.com%'
    group by ft.name;


/* Returns the number of products belonging to a food type, as long as the product costs more than $10.00 */
select ft.name, count(*)
    from products p
         inner join food_types ft on (p.food_type_id = ft.id)
    where p.price::numeric::float8 < 10.00
    group by ft.name