-- The INNER JOIN matches each row in one table with every row in other tables and allows you to query rows that contain columns from both tables.
-- The INNER JOIN is an optional clause of the SELECT statement. It appears immediately after the FROM clause. Here is the syntax of the INNER JOIN clause:

-- SELECT
--     select_list
-- FROM t1
-- INNER JOIN t2 ON join_condition1
-- INNER JOIN t3 ON join_condition2
-- ...;

-- Problem:
-- Suppose you want to get:
-- The productCode and productName from the products table.
-- The textDescription of product lines from the productlines table

SELECT 
	productCode,
    productName,
    textDescription 
FROM 
	products p
INNER JOIN 
	productlines pl 
ON 
	p.productLine = pl.productLine;

-- If joining column name are same in both tables we can use Using Clause

SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products
INNER JOIN productlines USING (productline);

-- This query returns order number, order status, and total sales from the orders and orderdetails tables using the INNER JOIN clause with the GROUP BYclause:
SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;

/*markdown
### MySQL INNER JOIN – join three tables example
*/

-- This query uses two INNER JOIN clauses to join three tables: orders, orderdetails, and products:
SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;

/*markdown
### MySQL INNER JOIN – join four tables example

*/

SELECT 
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
INNER JOIN products 
    USING (productCode)
INNER JOIN customers 
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;

/*markdown
### MySQL INNER JOIN using other operators
So far, you have seen that the join condition used the equal operator (=) for matching rows.

In addition to the equal operator (=), you can use other operators such as greater than ( >), less than ( <), and not-equal ( <>) operator to form the join condition.

The following query uses a less-than ( <) join to find the sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product.
*/

SELECT 
    orderNumber, 
    productName, 
    msrp, 
    priceEach
FROM
    products p
INNER JOIN orderdetails o 
   ON p.productcode = o.productcode
      AND p.msrp > o.priceEach
WHERE
    p.productcode = 'S10_1678';

