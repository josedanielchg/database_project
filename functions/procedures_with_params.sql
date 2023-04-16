/* Create polls and associated options, receives by parameter: 
    - start_date of the poll, 
    - end_date of the poll, 
    - the name of the poll 
    - the id's of the restaurants.
*/
create or replace procedure insert_poll(
    start_date timestamp, end_date timestamp, name varchar,
    restaurant_id_1 integer, restaurant_id_2 integer)
as $$
declare
    poll_id integer;
begin
    -- Insert new poll in polls table
    insert
    into polls (start_date, end_date, name)
    values(start_date, end_date, name)
    returning id into poll_id;

    -- Insert poll_restaurants
    insert
    into poll_restaurants(poll_id, restaurant_id, is_winner)
    values(poll_id, restaurant_id_1, false);

    insert
    into poll_restaurants(poll_id, restaurant_id, is_winner)
    values(poll_id, restaurant_id_2, false);
end;
$$ language plpgsql;

call insert_poll('2023-04-16 09:00:00', '2023-04-23 09:00:00', 'Ejemplo encuesta profesor', 1, 2);



/* Returns the restaurants that are open before the end_date of a poll (receives the poll_id and returns a list of restaurants). */
create or replace function get_open_restaurants(poll_id int)
    returns table(
     id int,
     name varchar(255),
     opening_time time,
     closing_time time
 ) as $$
declare
    poll_response polls;
begin
    select *
    into poll_response
    from polls p
    where p.id = poll_id;

    return query select r.id, r.name, r.opening_time, r.closing_time
        from restaurants r
        where r.closing_time > poll_response.end_date::timestamp::time;
end;
$$ language plpgsql;

select * from get_open_restaurants(1);



/* Returns a list of users who have purchased at a restaurant (receives the restaurant_id) */
create or replace function get_restaurant_clients(id_restaurant int)
    returns table(
	 id integer,
     name text
 ) as $$
begin
    return query select u.id, concat(u.name, ' ', u.lastname) as name 
        from restaurants r
        inner join products p on (r.id = p.restaurant_id)
        inner join order_products op on (p.id = op.product_id)
        inner join order_users ou on (op.order_user_id = ou.id)
        inner join users u on (ou.user_id = u.id)
        where r.id = id_restaurant
        group by u.id;
end;
$$ language plpgsql;

select * from get_restaurant_clients(1);