USE restaurant_db;
-- View the meu_items table
SELECT * FROM menu_items;
-- Find th enumber of items on the menu
SELECT COUNT(*) FROM menu_items;
-- What are the least and most expensive items on the menu?
SELECT * FROM menu_items
ORDER by price DESC; -- leasts: edmamame most:shrimp scampi
-- How many italian dishes ar eon the menu?
SELECT COUNT(*) FROM menu_items
WHERE category = "Italian";
-- Least and most expensive Italian dishes on the menu?
SELECT * FROM menu_items
WHERE category = 'Italian'
ORDER BY price; -- least: spaghetti most: shrimp scampi
-- How mnay dishes are in each category?
SELECT category, COUNT(menu_item_id) AS num_dishes 
FROM menu_items 
GROUP BY category;
-- What is the average dish price within each category?
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category

-- View the order_details table
SELECT * FROM order_details;
-- What is the date range of the table?
SELECT MIN(order_date), MAX(order_date) FROM order_details;
-- How many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) FROM order_details;
-- How many items were ordered within this data range?
SELECT COUNT(*) FROM order_details;
-- Which orders had the most number of items?
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;
-- How many orders had more than 12 items?
SELECT COUNT(*) FROM
(SELECT order_id,COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;

-- Combine the menu_items and order_details into a single table
SELECT * FROM menu_items;
SELECT * FROM order_details;
SELECT *
FROM order_details AS od LEFT JOIN menu_items AS mi
     ON od.item_id = mi.menu_item_id; 
-- Least and Most ordered items ? What categories were they in?
SELECT item_name,category,COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;
-- What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
-- View the details of the highest spent order. 
SELECT order_id, SUM(price) AS highest_spent
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY highest_spent DESC;

SELECT category,COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
WHERE order_id =440
GROUP BY category;
-- Details of the top 5 hight
SELECT category,COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
WHERE order_id IN (440,2075,1957, 330, 2675)
GROUP BY order_id, category;