
/* gets the total spend on a user */
select
    sum(op.quantity * (
        select sum(p.price) from products p where p.id = op.product_id)
    ) as total_spend
    from order_products op
    where op.order_user_id in (
        select id from order_users ou1 where ou1.user_id = 2
);

/* gets the number of votes by user in a specific company */
select
    count(*) as number_of_votes from votes
    where poll_restaurant_id in (select id from poll_restaurants where restaurant_id = 1) and user_id = 1;