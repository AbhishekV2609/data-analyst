Pizza Hut SQL Analysis — Starter Queries
===========================================

-- 1. Total revenue
SELECT ROUND(SUM(Net_Sales), 2) AS total_revenue
FROM sales;

-- 2. Total orders
SELECT COUNT(DISTINCT Order_ID) AS total_orders
FROM sales;

-- 3. Pizzas sold
SELECT SUM(Quantity) AS pizzas_sold
FROM sales;

-- 4. Revenue by pizza category
SELECT p.Pizza_Category,
       ROUND(SUM(s.Net_Sales),2) AS revenue
FROM sales s
JOIN pizza p ON s.Pizza_ID = p.Pizza_ID
GROUP BY p.Pizza_Category
ORDER BY revenue DESC;

-- 5. Top 10 pizzas by quantity
SELECT p.Pizza_Name,
       SUM(s.Quantity) AS pizzas_sold
FROM sales s
JOIN pizza p ON s.Pizza_ID = p.Pizza_ID
GROUP BY p.Pizza_Name
ORDER BY pizzas_sold DESC
LIMIT 10;

-- 6. Revenue by city
SELECT l.City,
       ROUND(SUM(s.Net_Sales),2) AS revenue
FROM sales s
JOIN location l ON s.Location_ID = l.Location_ID
GROUP BY l.City
ORDER BY revenue DESC;

-- 7. Orders by channel
SELECT Order_Type,
       COUNT(DISTINCT Order_ID) AS orders
FROM sales
GROUP BY Order_Type
ORDER BY orders DESC;

-- 8. Peak ordering hours
SELECT Hour,
       COUNT(DISTINCT Order_ID) AS orders
FROM sales
GROUP BY Hour
ORDER BY orders DESC;

-- 9. Monthly revenue
SELECT Year, Month, Month_Name,
       ROUND(SUM(Net_Sales),2) AS revenue
FROM sales
GROUP BY Year, Month, Month_Name
ORDER BY Year, Month;
