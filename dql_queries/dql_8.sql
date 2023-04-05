/* return all products with the restaurant name */
select p.name as product_name,
    p.price as products_price,
    r.name as restaurant_name
        from products p
        inner join restaurants r on r.id = p.restaurant_id;


/* Return the restaurants in specific poll */
select r.name as restaurant_name
    from poll_restaurants pr
    inner join restaurants r on r.id = pr.restaurant_id
    where pr.poll_id = 1;


/* Returns the polls that the user has participated */
select poll.name
    from users u
         inner join votes v on (u.id = v.user_id)
         inner join polls poll on (v.poll_id = poll.id)
    where u.email like '%amanda.brown@gmail.com%';


/* Returns the product name with the food type */
select p.name as product_name, 
    ft.name as foot_type 
    from products p
    	inner join food_types ft on (p.food_type_id = ft.id);


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


/* find the users that vote in the restaurant with the id = 1 */
select concat(u.name, ' ',u.lastname) as full_name 
    from users u where u.id in
    (select user_id from votes where poll_restaurant_id in 
    (select id from poll_restaurants 
    where restaurant_id = 1));