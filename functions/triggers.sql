
/* this calcs the surplus money when insert, update or delete in order_product */
create or replace function calculate_surplus_money_function()
    returns trigger
    language plpgsql
as
$$
declare
    total_spend_var numeric;
    surplus_money_var numeric;
begin
    -- In the insert case the OLD value is null, we set like new only in this case
    if OLD.order_user_id is null
    then
        OLD = NEW;
    end if;

    select sum(p.price * op.quantity)
    into total_spend_var
    from order_products op
             inner join products p on op.product_id = p.id
    where OLD.order_user_id = op.order_user_id;

    surplus_money_var = total_spend_var::numeric::float - 7.00;

    if surplus_money_var < 0
    then surplus_money_var = 0;
    end if;

    update order_users
    set surplus_money = surplus_money_var
    where id = OLD.order_user_id;

    return OLD;
end;
$$;

create or replace trigger calculate_suplus_money
    after insert or update or delete
    on order_products
    for each row
execute procedure calculate_surplus_money_function();


/* This calidate the email when the user insert or update in users table */

create or replace function validate_email_function()
    returns trigger
    language plpgsql
as
$$
begin
    if NEW.email !~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'
    then
        update users
        set email = OLD.email
        where id = OLD.id;

        raise exception 'Formato invalido de email %', NEW.email
            using hint = 'Por favor revisa el formato.';
    end if;

    return OLD;
end;
$$;

create or replace trigger validate_email_insert_or_update
    after insert or update
    on users
    for each row
execute procedure validate_email_function();

/* This Verify (and update if is necessary) that is winner is false when the user creates a poll_restaurant */

create or replace function check_winner_is_not_true_function()
    returns trigger
    language plpgsql
as
$$
begin
    if NEW.is_winner = true
    then
        update poll_restaurants
        set is_winner = false
        where id = NEW.id;
    end if;

    return NEW;
end;
$$;

create or replace trigger check_winner_is_not_true
    after insert
    on poll_restaurants
    for each row
execute procedure check_winner_is_not_true_function();