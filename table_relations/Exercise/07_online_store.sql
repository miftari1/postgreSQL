CREATE TABLE item_types(
	id SERIAL PRIMARY KEY,
	item_type_name VARCHAR(20)
);

CREATE TABLE items(
	id SERIAL PRIMARY KEY,
	item_name VARCHAR(20),
	item_type_id INT REFERENCES item_types
);

CREATE TABLE cities(
	id SERIAL PRIMARY KEY,
	city_name VARCHAR(20)
);

CREATE TABLE customers(
	id SERIAL PRIMARY KEY,
	customer_name VARCHAR(50),
	birthday DATE,
	city_id INT REFERENCES cities
);

CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers
);

CREATE TABLE order_items(
	order_id INT REFERENCES orders,
	item_id INT REFERENCES items,
	CONSTRAINT pk_orders_items
	PRIMARY KEY(order_id, item_id)
);