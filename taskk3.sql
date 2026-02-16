CREATE DATABASE IF NOT EXISTS shop_management_db;

USE shop_management_db;
CREATE TABLE IF NOT EXISTS client (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(100) NOT NULL,
    client_email VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE IF NOT EXISTS purchase (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    purchase_date DATE,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);
CREATE TABLE IF NOT EXISTS purchase_details (
    purchase_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (purchase_id) REFERENCES purchase(purchase_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);
SHOW TABLES;
INSERT INTO client (client_name, client_email, city) VALUES
('Amit Sharma', 'amit@gmail.com', 'Mumbai'),
('Priya Patil', 'priya@gmail.com', 'Pune'),
('Rahul Mehta', 'rahul@gmail.com', 'Nagpur');
SELECT * FROM client;
INSERT INTO items (item_name, price, stock) VALUES
('Laptop', 55000.00, 10),
('Mobile', 20000.00, 20),
('Headphones', 2000.00, 50);
SELECT * FROM items;
INSERT INTO purchase (client_id, purchase_date) VALUES
(1, '2026-02-15'),
(2, '2026-02-16');

SELECT * FROM purchases;
INSERT INTO purchase_details (purchase_id, item_id, quantity) VALUES
(1, 1, 1),  
(1, 3, 2),  
(2, 2, 1);
SELECT * FROM purchase_details;
SELECT 
    p.purchase_id,
    c.client_name,
    i.item_name,
    pd.quantity,
    i.price,
    (pd.quantity * i.price) AS total_amount
FROM purchase_details pd
JOIN purchase p ON pd.purchase_id = p.purchase_id
JOIN clients c ON p.client_id = c.client_id
JOIN items i ON pd.item_id = i.item_id;
SELECT SUM(pd.quantity * i.price) AS total_revenue
FROM purchase_details pd
JOIN items i ON pd.item_id = i.item_id;

SELECT * 
FROM clients
WHERE city = 'Pune'
ORDER BY client_name;

SELECT 
    p.purchase_id,
    SUM(pd.quantity * i.price) AS total_amount
FROM purchase_details pd
JOIN items i ON pd.item_id = i.item_id
JOIN purchase p ON pd.purchase_id = p.purchase_id
GROUP BY p.purchase_id;

SELECT 
    c.client_name,
    SUM(pd.quantity * i.price) AS total_spent
FROM purchase_details pd
JOIN purchase p ON pd.purchase_id = p.purchase_id
JOIN clients c ON p.client_id = c.client_id
JOIN items i ON pd.item_id = i.item_id
GROUP BY c.client_name
ORDER BY total_spent DESC;

SELECT 
    c.client_name,
    p.purchase_date
FROM purchase p
INNER JOIN clients c ON p.client_id = c.client_id;

SELECT 
    c.client_name,
    p.purchase_id
FROM clients c
LEFT JOIN purchase p ON c.client_id = p.client_id;

SELECT 
    c.client_name,
    p.purchase_id
FROM clients c
RIGHT JOIN purchase p ON c.client_id = p.client_id;

SELECT item_name, price
FROM items
WHERE price > (
    SELECT AVG(price) FROM items
);

CREATE VIEW client_purchase_summary AS
SELECT 
    c.client_name,
    SUM(pd.quantity * i.price) AS total_spent
FROM purchase_details pd
JOIN purchase p ON pd.purchase_id = p.purchase_id
JOIN clients c ON p.client_id = c.client_id
JOIN items i ON pd.item_id = i.item_id
GROUP BY c.client_name;

SELECT * FROM client_purchase_summary;

CREATE INDEX idx_client_id ON purchase(client_id);
CREATE INDEX idx_item_id ON purchase_details(item_id);

