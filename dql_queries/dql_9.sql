/* Return the number of restaurants */
select count(*) as restaurant_quantity from restaurants;


/* Return the product average by food_type */
select round(avg(price::numeric), 2) as average from products where food_type_id = 7;


/* Return the min closing time in the restaurants */
select min(closing_time) as hour from restaurants;


/* Return the max closing time in the restaurants */
select max(closing_time) as hour from restaurants;


/* Return the users quantity by email */
SELECT substring(email from '@(.*)') as domain, COUNT(*) as total
    FROM users
    GROUP BY domain
    ORDER BY total DESC;