
   
-- CREATE TABLE IF NOT EXISTS
-- 	category(
-- 		category_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
-- 		name VARCHAR(20) NOT NULL UNIQUE,
-- 		created_at TIMESTAMPTZ DEFAULT NOW()
-- 	);
	
CREATE TABLE IF NOT EXISTS
	product(
		product_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		name VARCHAR(30) NOT NULL,
		description VARCHAR(200) NOT NULL,
		brand VARCHAR(30) NOT NULL,
		image TEXT DEFAULT 'http://via.placeholder.com/360x360',
		price INTEGER NOT NULL CHECK(price>0),
		created_at TIMESTAMPTZ DEFAULT NOW(),
		updated_at TIMESTAMPTZ DEFAULT NOW()
	);

CREATE TABLE IF NOT EXISTS
	review(
		comment_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		comment VARCHAR(200) NOT NULL,
		rate VARCHAR(1) NOT NULL,
		created_at TIMESTAMPTZ DEFAULT NOW()
	);	
-- CREATE TABLE IF NOT EXISTS
-- 	customer(
-- 		customer_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
-- 		first_name VARCHAR(100) NOT NULL,
-- 		last_name VARCHAR(100) NOT NULL,
-- 		image TEXT DEFAULT 'http://via.placeholder.com/360x360',
-- 		email VARCHAR(50) NOT NULL UNIQUE,
-- 		created_at TIMESTAMPTZ DEFAULT NOW()
-- 	);
	
	
-- CREATE TABLE IF NOT EXISTS customer_order(
-- 		order_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
-- 		customer INTEGER REFERENCES customer,
-- 		created_at TIMESTAMPTZ DEFAULT NOW()
-- 	);

-- CREATE TABLE IF NOT EXISTS product_category(
-- 		product_category_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
-- 		product INTEGER REFERENCES product ON DELETE CASCADE,
-- 		category INTEGER REFERENCES category,
-- 		created_at TIMESTAMPTZ DEFAULT NOW()
-- );
	
-- CREATE TABLE IF NOT EXISTS review(
-- 		review_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
-- 		product INTEGER REFERENCES product,
-- 		customer INTEGER REFERENCES customer,
-- 		created_at TIMESTAMPTZ DEFAULT NOW()
-- );
	
-- CREATE TABLE IF NOT EXISTS customer_product(
-- 		customer_product_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
-- 		product INTEGER REFERENCES product,
-- 		customer INTEGER REFERENCES customer,
-- 		customer_order INTEGER REFERENCES customer_order,
-- 		created_at TIMESTAMPTZ DEFAULT NOW()
-- );
	
	
