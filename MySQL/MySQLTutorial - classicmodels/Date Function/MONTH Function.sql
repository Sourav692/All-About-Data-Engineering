SELECT MONTH('2010-01-01');

SELECT MONTH(NOW()) CURRENT_MONTH;

SELECT MONTH('0000-00-00');

-- Practical usages of MySQL MONTH function
-- The following statement gets the order’s volume by month in 2004:

SELECT 
    MONTH(orderDate) month,
    ROUND(SUM(quantityOrdered * priceEach)) subtotal
FROM
    orders
        INNER JOIN
    orderdetails USING (orderNumber)
WHERE
    YEAR(orderDate) = 2004
GROUP BY month;