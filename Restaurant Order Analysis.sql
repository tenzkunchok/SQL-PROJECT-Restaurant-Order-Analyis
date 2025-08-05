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