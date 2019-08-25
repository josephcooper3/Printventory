DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  buying_cost FLOAT(2),
  sale_price FLOAT(2),
  copies_in_stock INT4
)
