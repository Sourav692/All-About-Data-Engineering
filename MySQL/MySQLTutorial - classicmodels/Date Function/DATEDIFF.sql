-- The MySQL DATEDIFF function calculates the number of days between two  DATE,  DATETIME, or  TIMESTAMP values.

SELECT DATEDIFF('2011-08-17','2011-08-17'); --  0 day
SELECT DATEDIFF('2011-08-17','2011-08-08'); --  9 days
SELECT DATEDIFF('2011-08-08','2011-08-17'); -- -9 days

-- To calculate the number of days between the required date and shipped date of the orders, you use the DATEDIFF function as follows:
SELECT requiredDate, shippedDate,DATEDIFF(requiredDate,shippedDate) daysLeft 
FROM orders
ORDER BY daysLeft DESC;

-- The following statement gets all orders whose statuses are in-process and calculates the number of days between ordered date and required date:

SELECT 
    orderNumber,
    DATEDIFF(requiredDate, orderDate) remaining_days
FROM
    orders
WHERE
    status = 'In Process'
ORDER BY remaining_days;

