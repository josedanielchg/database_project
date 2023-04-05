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