DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(12,2) NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO products VALUES
('P01', 'Dell Inspiron', 'Laptop', 15000000, 10),
('P02', 'MacBook Air', 'Laptop', 23000000, 5),
('P03', 'iPhone 15', 'Phone', 28000000, 8),
('P04', 'Samsung S22', 'Phone', 18000000, 12),
('P05', 'Logitech Mouse', 'Accessory', 500000, 20),
('P06', 'Asus Vivobook', 'Laptop', 14000000, 7),
('P07', 'iPhone 14', 'Phone', 22000000, 9),
('P08', 'Apple Keyboard', 'Accessory', 2500000, 15);

SELECT *
FROM products
WHERE price BETWEEN 10000000 AND 25000000;

SELECT *
FROM products
WHERE product_name LIKE '%iPhone%';

SELECT 
    category,
    AVG(price) AS avg_price
FROM products
GROUP BY category;

SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

SELECT *
FROM products p
WHERE price = (
    SELECT MIN(price)
    FROM products
    WHERE category = p.category
);
