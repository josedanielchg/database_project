/* create user table */
create table if not exists users(
	id int generated always as identity,
	email varchar(50) unique not null, -- muy corto
	password varchar(255) not null, 
	name varchar(255),
	lastname varchar(255),
	constraint pk_user_id
		primary key(id)
);

/* create restaurants table */
create table if not exists restaurants(
	id int generated always as identity,
	name varchar(255) unique not null,
	opening_time time not null,
	address varchar(255),
	primary key(id)
);

/* create food_types table */
create table if not exists food_types(
	id int generated always as identity,
	name varchar(50) unique not null,
	constraint pk_food_types_id
		primary key(id)
);

/* create polls table */
create table if not exists polls(
	id int generated always as identity,
	start_date timestamp not null,
	end_date timestamp not null,
	name varchar(255) not null,
	constraint pk_polls_id
		primary key(id)
);

/* create products table */
create table if not exists products(
	id int generated always as identity,
	restaurant_id int not null,
	food_type_id int,
	name varchar(255) not null,
	price money not null,
	constraint pk_products_id
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
	id int unique generated always as identity,
	poll_id int not null,
	restaurant_id int not null,
	is_winner bool not null default false,
	constraint pk_poll_restaurants_id
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
	id int generated always as identity,
	user_id int not null,
	poll_id int not null,
	poll_restaurant_id int not null,
	constraint pk_votes_id
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
);


/* order_users table unique */
CREATE unique INDEX votes_unique_idx ON votes(user_id, poll_id, poll_restaurant_id);


/* create order_users table */
create table if not exists order_users(
	id int generated always as identity,
	user_id int not null,
	poll_restaurant_id int not null,
	surplus_money float,
	constraint pk_order_users_id
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
CREATE unique INDEX order_users_unique_idx ON order_users(user_id, poll_restaurant_id);

/* create order_products table */
create table if not exists order_products(
	id int generated always as identity,	
	order_user_id int not null,
	product_id int not null,
	quantity int default 1,
	constraint pk_order_products_id
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
	  	on update cascade,
	constraint quantity_unsigned
		check(quantity >= 0)
);