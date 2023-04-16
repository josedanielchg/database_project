
/* gets the total spend on a user */
select
    sum(op.quantity * (
        select sum(p.price) from products p where p.id = op.product_id)
    ) as total_spend
    from order_products op
    where op.order_user_id in (
        select id from order_users ou1 where ou1.user_id = 2
);

/* find the users that vote in the restaurant with the id = 1 */
select concat(u.name, ' ',u.lastname) as full_name
    from users u where u.id in
        (select user_id from votes where poll_restaurant_id in
        (select id from poll_restaurants
     where restaurant_id = 1));

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


/* gets the number of votes by user in a specific company */
select
    count(*) as number_of_votes from votes
    where poll_restaurant_id in (select id from poll_restaurants where restaurant_id = 1) and user_id = 1;

/* Query for bonus, the surplus money of the most recent order of a user is set to 0 */
update order_users
set surplus_money = 0
where id in
      (select id from order_users ou where ou.user_id in (select id from users u where u.email = 'alex.kim@example.com') order by id desc limit 1);