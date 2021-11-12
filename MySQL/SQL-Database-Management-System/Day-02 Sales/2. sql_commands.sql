-- Find the names of all clients having ‘a’ as the second letter in their names.
SELECT Name
FROM client_master
WHERE Name LIKE '_a%';

-- Find out the clients who stay in a city whose second letter is 'a'.

SELECT Name
FROM client_master
WHERE city LIKE '_a%';

-- Find the list of all clients who stay in 'Bombay' or 'Delhi'.
SELECT *
FROM client_master
WHERE city IN ('Mumbai','Delhi');

SELECT * FROM client_master;

-- Print the list of clients whose bal_due is greater than value 10000.
SELECT *
FROM client_master
WHERE Bal_due > 10000;

-- Print the information from sales_order table for orders placed in the month of Jun.
SELECT * 
FROM sales_order
WHERE MONTH(Order_date) = '06';

SELECT * FROM sales_order;

-- Display the order information for client_no 'C00001' and 'C00002'.
SELECT *
FROM sales_order
WHERE Client_no IN ('C00001','C00002');

-- Find products whose selling price is greater than 200 and less than or equal to 500.
SELECT * 
FROM product_master
WHERE Sell_price> 200 AND Sell_price  <= 500;

-- Find products whose selling price is more than 500. Calculate a new selling price as original selling price * .15. Rename the new column in the above query as new_price.
SELECT *,Sell_price*0.15 `New_price`
FROM product_master
WHERE Sell_price> 500;

-- List the names, city and state of clients who are not in the state of 'Maharashtra'.
SELECT `Name`, `City`, `State`
FROM client_master
WHERE `State` NOT IN ('Maharashtra');

-- Count the total number of orders.
SELECT COUNT(*) `Order_count`
FROM sales_order;

-- Calculate the average price of all the products.
SELECT AVG(Sell_price), AVG(Cost_price)
FROM product_master;

-- Determine the maximum and minimum product prices. Rename the output as max_price and min_price respectively.
SELECT MAX(Sell_price) `Max_price`, MIN(Sell_price) `Min_price`
FROM product_master;


-- Count the number of products having price greater than or equal to 500.
SELECT COUNT(*) `Order_count`
FROM product_master
WHERE Sell_price >= 500;

-- Find all the products whose qty_on_hand is less than reorder level.
SELECT *
FROM product_master
WHERE Qty_on_hand < Reorder_lvl;

-- Display the order number and day on which clients placed their order.
SELECT Order_no, Client_no,Order_date, DAY(Order_date), DAYNAME(Order_date)
FROM sales_order;