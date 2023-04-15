
/* Contar el numero de votos en un poll_restaurant. */
create or replace function get_votes_count(poll_restaurant int)
    returns int
    language plpgsql
as
$$
declare
    vote_count integer;
begin
    select count(*)
    into vote_count
    from votes v
    where v.poll_restaurant_id = poll_restaurant;

    return vote_count;
end;
$$;

select get_votes_count(1);


/* Retorna el numero de horas antes de que cierren todos los restaurantes. */
drop type if exists remaning_time_type cascade;

create type remaning_time_type as (
  restaurant_id integer,
  name varchar,
  remaning_time interval
);

create or replace function closing_remaning_time_per_restaurants()
    returns setof remaning_time_type as $$
declare
    now time := current_time;
begin
    return QUERY
    select id, name,
    case when closing_time < now
        then null
        else closing_time - now
    end as remaning_time from restaurants;
end;
$$ language plpgsql;

select * from closing_remaning_time_per_restaurants();


/* Retorna la cantidad de dinero gastada por el usuario y la gastada por la empresa en comida (tomando como parametro el id del usuario). */
drop type if exists spend_money_type cascade;

create type spend_money_type AS (
    user_spend_money money,
    company_spend_money money
);

create or replace function get_spend_money(user_id_param int)
    returns spend_money_type
    language plpgsql
as
$$
declare
    spend_money spend_money_type;
begin
    select sum(p.price)
    into spend_money.company_spend_money
    from order_users ou
    inner join order_products op on op.order_user_id = ou.id
    inner join products p on op.product_id = p.id
    where ou.user_id = user_id_param;

    select sum(ou.surplus_money)
    into spend_money.user_spend_money
    from order_users ou
    where ou.user_id = user_id_param;

    spend_money.company_spend_money = spend_money.company_spend_money - spend_money.user_spend_money;

    return spend_money;
end;
$$;

select company_spend_money, user_spend_money from get_spend_money(1);

