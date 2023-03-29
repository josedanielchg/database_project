/* create user table */
create table if not exists users(
	id INT GENERATED ALWAYS AS IDENTITY,
	email varchar(50) UNIQUE NOT NULL, -- muy corto
	password varchar(255) NOT NULL, 
	name varchar(255),
	lastname varchar(255),
	primary key(id) -- asignar nombre al constraint pk -> PK_USERS_ID / APLICA A TODAS LAS TABLAS
    --CONSTRAINT PK_USERS_ID primary key(id)
);

/* create restaurants table */
create table if not exists restaurants(
	id INT GENERATED ALWAYS AS IDENTITY,
	name varchar(255) UNIQUE NOT null,
	opening_time timestamp NOT null,
	primary key(id)
);

/* create food_types table */
create table if not exists food_types(
	id INT GENERATED ALWAYS AS IDENTITY,
	name varchar(50) UNIQUE NOT null,
	primary key(id)
);

/* create polls table */
create table if not exists polls(
	id INT GENERATED ALWAYS AS IDENTITY,
	start_date timestamp NOT null,
	end_date timestamp NOT null,
	name varchar(255) not null,
	primary key(id)
);

/* create products table */
create table if not exists products(
	id INT GENERATED ALWAYS AS IDENTITY,
	restaurant_id INT not null,
	food_type_id INT,
	name varchar(255) not null,
	price money not null,
	primary key(id),
  	constraint fk_restaurant
      foreign key(restaurant_id) 
	  	references restaurants(id)
	  	on delete cascade
	  	on update cascade,
  	constraint fk_food_type
      foreign key(food_type_id) 
	  	references food_types(id)
	  	on delete set null
	  	on update cascade
);

/* create poll_restaurants table */
create table if not exists poll_restaurants(
	id int UNIQUE GENERATED ALWAYS AS IDENTITY,
	poll_id int not null,
	restaurant_id int not null,
	is_winner bool not null default false,
	primary key(id, poll_id),
	constraint fk_poll
      foreign key(poll_id) 
	  	references polls(id)
	  	on delete cascade
	  	on update cascade,
  	constraint fk_resturant
      foreign key(restaurant_id) 
	  	references restaurants(id)
	  	on delete cascade
	  	on update cascade
);

/* create votes table */
create table if not exists votes(
	id INT GENERATED ALWAYS AS IDENTITY,
	user_id INT, -- DEBEN SER OBLIGATORIO (LOS ID�S HEREDADOS DEBEN SER OBLIGATORIOS)
	poll_id INT, -- DEBEN SER OBLIGATORIO (LOS ID�S HEREDADOS DEBEN SER OBLIGATORIOS)
	poll_restaurant_id INT,
	primary key(id),
	constraint fk_user
      foreign key(user_id) 
	  	references users(id)
	  	on delete set null
	  	on update cascade,
  	constraint fk_poll_restaurant
      foreign key(poll_restaurant_id, poll_id)
	  	references poll_restaurants(id, poll_id)
	  	on delete set null
	  	on update cascade
); -- DEBE EXISTIR UNICIDAD VALIADA POR LA COMBINACION DE ESTOS TRES CAMPOS us,er_id, poll_restaurant_id

/* create order_users table */
create table if not exists order_users(
	id INT GENERATED ALWAYS AS IDENTITY,
	user_id INT,
	poll_restaurant_id INT,
	surplus_money FLOAT,
	primary key(id),
	constraint fk_user
      foreign key(user_id) 
	  	references users(id)
	  	on delete set null
	  	on update cascade,
	constraint fk_poll_restaurant
      foreign key(poll_restaurant_id) 
	  	references poll_restaurants(id)
	  	on delete set null
	  	on update cascade
);

/* order_users table unique */
CREATE UNIQUE INDEX order_users_user_poll_idx ON order_users(user_id, poll_restaurant_id);

/* create order_products table */
create table if not exists order_products(
	id INT GENERATED ALWAYS AS IDENTITY,	
	order_user_id INT,
	product_id INT,
	primary key(id),
	constraint fk_order_user
      foreign key(order_user_id) 
	  	references order_users(id)
	  	on delete set null
	  	on update cascade,
	constraint fk_product_id
      foreign key(product_id) 
	  	references products(id)
	  	on delete set null
	  	on update cascade
);-- es posible que se requiera la cantidad ordenada de productos