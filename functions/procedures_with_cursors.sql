/* Calcular cual poll_restaurant de un poll es winner (usando la funcion de contar votos por poll_restaurant). */
create or replace function set_winner_poll_restaurant(id_poll int)
    returns table (restaurant_id int, restaurant_name varchar, poll_id int, poll_restaurant_id int, num_votes int) AS $$
declare
	max_votes integer;
	most_voted_poll_request record;
	poll_restaurant record;
	restaurant record;
	
	votes_cursor cursor for select v.poll_restaurant_id as pr_id, count(*) as num_votes
		from votes v
            inner join poll_restaurants pr on (pr.id = v.poll_restaurant_id)
            inner join polls p on (pr.poll_id =  p.id)
		where p.id = id_poll
		group by v.poll_restaurant_id 
		order by num_votes desc;
begin
	max_votes := 0;
	open votes_cursor;
	
	-- Find the most voted poll request.
	loop
		fetch votes_cursor into poll_restaurant;
		exit when not found;

		if poll_restaurant.num_votes > max_votes then
			max_votes := poll_restaurant.num_votes;
			most_voted_poll_request = poll_restaurant;
		end if;
	end loop;
	
	close votes_cursor;
	
	-- Update most voted poll request
	update poll_restaurants set is_winner = true where id = most_voted_poll_request.pr_id;
	
	-- Get all winner restaurant's info 
	select * 
	into restaurant
	from restaurants r
	inner join poll_restaurants pr on (pr.restaurant_id = r.id)
	where pr.id = most_voted_poll_request.pr_id;
	
	return query select restaurant.id, restaurant.name, id_poll, most_voted_poll_request.pr_id, max_votes;
end;
$$ language plpgsql;

select * from  set_winner_poll_restaurant(6);


/*
Mientras hacia esa vaina me di cuenta que se puede hayar el ganador solo con esto

select r.id, r.name, p.id, v.poll_restaurant_id, count(*) as num_votes
	from votes v
	inner join poll_restaurants pr on (pr.id = v.poll_restaurant_id)
	inner join polls p on (pr.poll_id =  p.id)
	inner join restaurants r on (r.id = pr.restaurant_id)
where p.id = 6
group by v.poll_restaurant_id, r.id, r.name, p.id
order by num_votes desc
limit 1

pero entonces no podriamos usar el loop -_- ... xD
*/





/* Calcular la cantidad de veces que un usuario ha comprado en todos los restaurantes (recibe el user_id). */

drop type if exists purchases_type cascade;

create type purchases_type as (
	user_id INTEGER, user_email varchar,
	restaurant_id INTEGER, restaurant_name varchar,
	purchase_count INTEGER,
	amount_spend NUMERIC
);

CREATE OR REPLACE FUNCTION get_user_purchase_counts()
RETURNS setof purchases_type AS $$
DECLARE
  user_cursor CURSOR FOR SELECT id, email FROM users;
  id_user INTEGER;
  user_email varchar;
  
  restaurant_cursor CURSOR FOR SELECT id, name FROM restaurants;
  id_restaurant INTEGER;
  restaurant_name varchar;
  
  purchase_count INTEGER;
  amount_spend NUMERIC;
  purchase purchases_type%rowtype;
BEGIN
  -- Iterate over each user
  OPEN user_cursor;
  LOOP
    FETCH user_cursor INTO id_user, user_email;
    EXIT WHEN NOT FOUND;
    
    -- Iterate over each restaurant
    OPEN restaurant_cursor;
    LOOP
      FETCH restaurant_cursor INTO id_restaurant, restaurant_name;
      EXIT WHEN NOT FOUND;
      
      -- Count the number of purchases made by the user at the restaurant
      SELECT COUNT(*), SUM(p.price) INTO purchase_count, amount_spend
      FROM order_products op
      INNER JOIN products p ON (op.product_id = p.id)
      INNER JOIN order_users ou ON (ou.id = op.order_user_id)
      WHERE ou.user_id = id_user AND p.restaurant_id = id_restaurant;
      
      -- Return the results as a row in the output table
      IF purchase_count > 0 THEN
	  	purchase := (id_user, user_email, id_restaurant, restaurant_name, purchase_count, amount_spend);
        RETURN NEXT purchase;
      END IF;
	  
    END LOOP;
	
    CLOSE restaurant_cursor;
  END LOOP;

  CLOSE user_cursor;
  RETURN;
END;
$$ LANGUAGE plpgsql;

Select * from get_user_purchase_counts() order by amount_spend desc;

/*
Mientras hacia esa vaina me di cuenta que se puede hayar el ganador solo con esto

select p.restaurant_id, count(*) as num_purchases, r.name
from order_products op
inner join products p on (op.product_id = p.id)
inner join order_users ou on (ou.id = op.order_user_id)
inner join restaurants r on (r.id = p.restaurant_id)
where ou.user_id = 1
group by p.restaurant_id, r.name

pero entonces no podriamos usar el loop -_- ... xD
*/





/* Calcular el porcentaje de votos que tuvo cada poll_restaurant (recibe el poll_id y rotarna nombre del restaurant y porcentaje de votos) */

