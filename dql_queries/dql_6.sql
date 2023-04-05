/* Return to the restaurants that are open at this moment */
select * 
    from restaurants r 
    where r.opening_time < CURRENT_TIME 
    and r.closing_time > CURRENT_TIME;


/* Return the restaurant info in uppercase */
select id, upper(r.name) from restaurants r;


/* Return the product with specific format */
select concat(p.name, ' tiene un precio de: ', p.price) 
    as product_price 
    from products p 
    where p.restaurant_id = 2;


/* Return the polls that started before 2023-05 */
select * from polls where start_date < '2023-05-01 00:00:00';


/* Return the products with price < 10 dollars */
select * from products where price::numeric::float8 < 10.00;