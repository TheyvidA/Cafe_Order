--Display the menu in the table

SELECT *
FROM Cafe_Order..product

--Find the number of items on the menu

SELECT COUNT(*)
FROM Cafe_Order..product

--What is the least expensive item in the menu

SELECT id, name, price, category
FROM Cafe_Order..product
ORDER BY price

--What is the most expensive item in the menu

SELECT id, name, price, category
FROM Cafe_Order..product
ORDER BY price DESC

--How many Indian meals are on the menu

SELECT id, name, price, category
FROM Cafe_Order..product
WHERE category = 'Indian'

--What is the least expensive Indian meals on the menu

SELECT id, name, price, category
FROM Cafe_Order..product
WHERE category = 'Indian'
ORDER BY price

--What is the most expensive Indian meals on the menu

SELECT id, name, price, category
FROM Cafe_Order..product
WHERE category = 'Indian'
ORDER BY price DESC

--How many dishes are in each category

SELECT category, COUNT(category) Num_Dishes
FROM Cafe_Order..product
GROUP BY category

--The Average dish price in each category

SELECT category, AVG(CAST(price as Int)) Avg_Price_Dishes
FROM Cafe_Order..product 
GROUP BY category

--Display the order table

SELECT *
FROM Cafe_Order..orders

--Which orders had the most number of items sold

SELECT order_id, COUNT(quantity) Num_Item
FROM Cafe_Order..orders
GROUP BY order_id
ORDER BY Num_Item DESC

--How many orders had more than 10 items

SELECT COUNT(*) Count_Orders
	FROM
		(SELECT order_id, COUNT(quantity) Num_Item
		FROM Cafe_Order..orders
		GROUP BY order_id
		HAVING COUNT(CAST(quantity as INT)) >= 10) Num_Orders

--Combine the product and the order table

SELECT *
FROM Cafe_Order..product Pro
JOIN Cafe_Order..orders Ord
	ON Pro.id = Ord.id
	
--Display the least and most expensive ordered items. Which category?

SELECT name, category, COUNT(quantity) Num_Purchase
FROM Cafe_Order..product Pro
JOIN Cafe_Order..orders Ord
	ON Pro.id = Ord.id
GROUP BY name, category
ORDER BY Num_Purchase

--The top 5 orders that spent the most money

SELECT order_id, SUM(CAST(price AS INT)) Total_price
FROM Cafe_Order..product Pro
JOIN Cafe_Order..orders Ord
	ON Pro.id = Ord.id
GROUP BY order_id
ORDER BY Total_price
--LIMIT 5

--View the details of the highest spent orders through their category

SELECT category, COUNT(quantity)
FROM Cafe_Order..product Pro
JOIN Cafe_Order..orders Ord
	ON Pro.id = Ord.id
WHERE order_id >= 20
GROUP BY category

--View the details of the top 5 highest spend orders

SELECT order_id, category, COUNT(order_id) Num_Item
FROM Cafe_Order..product Pro
JOIN Cafe_Order..orders Ord
	ON Pro.id = Ord.id
WHERE order_id IN (24, 25, 26, 27, 28)
GROUP BY order_id, category
