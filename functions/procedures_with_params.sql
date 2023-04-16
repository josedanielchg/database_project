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

create or replace function getOpenRestaurants(poll_id int)
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

select * from getOpenRestaurants(1);