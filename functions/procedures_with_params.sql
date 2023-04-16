/* Que permita crear poll y opciones asociadas, recibe por parametro: start_date del poll, end_date del poll, el nombre del poll y los id's de los restaurantes. */
CREATE OR REPLACE PROCEDURE insert_poll(
    start_date TIMESTAMP, end_date TIMESTAMP, name varchar,
    restaurant_id_1 INTEGER, restaurant_id_2 INTEGER)
AS $$
DECLARE
    poll_id INTEGER;
BEGIN
    -- Insert new poll in polls table
    INSERT
    INTO polls (start_date, end_date, name)
    VALUES(start_date, end_date, name)
    RETURNING id INTO poll_id;

    -- Insert poll_restaurants
    INSERT
    INTO poll_restaurants(poll_id, restaurant_id, is_winner)
    VALUES(poll_id, restaurant_id_1, false);

    INSERT
    INTO poll_restaurants(poll_id, restaurant_id, is_winner)
    VALUES(poll_id, restaurant_id_2, false);
END;
$$ LANGUAGE plpgsql;

CALL insert_poll('2023-04-16 09:00:00', '2023-04-23 09:00:00', 'Ejemplo encuesta profesor', 1, 2);



/* Retorna los restaurantes que estan abiertos antes del end_date de un poll (recibe el poll_id y retorna una lista de restaurantes). */
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



/* Retorna un listado de usuarios que han comprado en un restaurante (recibe el restaurant_id). */
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