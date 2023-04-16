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



/* Calcular la cantidad de veces que un usuario ha comprado en todos los restaurantes (recibe el user_id). */
drop type if exists purchases_type cascade;

create type purchases_type as (
	user_id INTEGER, user_email varchar,
	restaurant_id INTEGER, restaurant_name varchar,
	purchase_count INTEGER,
	amount_spend NUMERIC
);

create or replace function get_user_purchase_counts()
returns setof purchases_type as $$
declare
  user_cursor cursor for select id, email from users;
  id_user integer;
  user_email varchar;
  
  restaurant_cursor cursor for select id, name from restaurants;
  id_restaurant integer;
  restaurant_name varchar;
  
  purchase_count integer;
  amount_spend numeric;
  purchase purchases_type%rowtype;
begin
  -- Iterate over each user
  open user_cursor;
  loop
    fetch user_cursor into id_user, user_email;
    exit when not found;
    
    -- Iterate over each restaurant
    open restaurant_cursor;
    loop
      fetch restaurant_cursor into id_restaurant, restaurant_name;
      exit when not found;
      
      -- Count the number of purchases made by the user at the restaurant
      select count(*), sum(p.price) into purchase_count, amount_spend
      from order_products op
      inner join products p on (op.product_id = p.id)
      inner join order_users ou on (ou.id = op.order_user_id)
      where ou.user_id = id_user and p.restaurant_id = id_restaurant;
      
      -- Return the results as a row in the output table
      if purchase_count > 0 then
	  	purchase := (id_user, user_email, id_restaurant, restaurant_name, purchase_count, amount_spend);
        return next purchase;
      end if;
	  
    end loop;
	
    close restaurant_cursor;
  end loop;

  close user_cursor;
  return;
end;
$$ language plpgsql;

select * from get_user_purchase_counts() order by amount_spend desc;

/* Calcular el porcentaje de votos que tuvo cada poll_restaurant (recibe el poll_id y rotarna nombre del restaurant y porcentaje de votos) */

drop type if exists percentage_type cascade;

create type percentage_type as (
	poll_id integer,
	restaurant_name varchar,
	num_votes integer, 
	percentage_total_votes numeric
);

create or replace function get_percentages(id_poll int)
    returns setof percentage_type AS $$
declare
	total_votes integer;
	poll_restaurant record;
	restaurant record;
	percentage percentage_type;
	percentage_value NUMERIC(4, 2);
	
	votes_cursor cursor for select r.name as r_name, v.poll_restaurant_id as pr_id, count(*) as num_votes
		from votes v
            inner join poll_restaurants pr on (pr.id = v.poll_restaurant_id)
            inner join polls p on (pr.poll_id =  p.id)
			inner join restaurants r on (r.id = pr.restaurant_id)
		where p.id = id_poll
		group by v.poll_restaurant_id, r.name
		order by num_votes desc;
begin
	total_votes := 0;
	open votes_cursor;
		FETCH votes_cursor INTO poll_restaurant;

		-- Procesar las filas del cursor
		WHILE FOUND LOOP
			total_votes := total_votes + poll_restaurant.num_votes;
			FETCH votes_cursor INTO poll_restaurant;

			-- Reiniciar el cursor si se ha llegado al final del conjunto de resultados
			IF NOT FOUND THEN
				MOVE ABSOLUTE 0 IN votes_cursor;
				loop
					fetch votes_cursor into poll_restaurant;
					exit when not found;
					percentage_value := CAST(poll_restaurant.num_votes AS NUMERIC) * 100 / CAST(total_votes AS NUMERIC);
					percentage := (
						id_poll, poll_restaurant.r_name, 
						poll_restaurant.num_votes, percentage_value
					);
        			RETURN NEXT percentage;
				end loop;
			END IF;
		END LOOP;

  CLOSE votes_cursor;
END;
$$ language plpgsql;

select * from  get_percentages(6);