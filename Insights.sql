-- 1. What is the total revenue generated by each product category?
SELECT product_category,
     ROUND(SUM(total),2) AS Total_revenue
FROM orders
JOIN products
ON orders.product_id = products.product_id
GROUP BY product_category;

-- 2.How many unique products have been ordered?
SELECT DISTINCT(COUNT(product_name)) AS Unique_Products
FROM products;

-- 3. What is the total revenue generated each year?
SELECT EXTRACT(YEAR from order_date) YEAR,
       FORMAT(SUM(total),2) AS Total_Revenue
FROM orders
GROUP BY YEAR;

-- 4. What is the date of the latest and earliest order?
SELECT MIN(order_date) AS Earliest_Order,
	   MAX(order_date) AS Latest_order
FROM orders;

-- 6. What product category has the lowest average price of products?
SELECT product_category, 
       ROUND(AVG(retail_price),2) AS Average_price
FROM orders
JOIN products ON orders.product_id  = products.product_id
GROUP BY product_category
ORDER BY Average_price ASC
LIMIT 1;

-- 7. What are the top 10 highest performing products?
SELECT product_name, 
       ROUND(SUM(total),2) AS Revenue
FROM orders
JOIN products
USING(product_id)
GROUP BY product_name
ORDER BY Revenue DESC
LIMIT 10;

-- 8. Show the total revenue and profit generated by each account_manager?
SELECT account_manager,
       ROUND(SUM(total),2) AS Revenue,
       ROUND(SUM(total)-SUM(cost_price),2) AS Profit
FROM orders
JOIN accounts
USING(account_id)
GROUP BY account_manager
ORDER BY Revenue;

--  9. What is the name, city and account manager of the highest selling product in 2017?
SELECT product_name, 
       city, 
       account_manager,
       (SUM(order_total)) AS total_orders
FROM orders
JOIN products
USING(product_id)
JOIN accounts
USING(account_id)
WHERE EXTRACT(YEAR from order_date) = 2017
GROUP BY product_name,city,account_manager
ORDER BY total_orders DESC
LIMIT 1;

-- 10 Find the mean amount spent per order by each Customer type?
SELECT customer_type,
       AVG(total) AS total_amount
from orders
GROUP BY customer_type
ORDER BY total_amount DESC;

 -- 11. What is the 5th highest selling product? 
 
 SELECT product_name, 
       ROUND(SUM(total),2) AS Revenue
FROM orders
JOIN products
USING(product_id)
GROUP BY product_name
ORDER BY Revenue DESC
LIMIT 1 OFFSET 4;
 


       


      




