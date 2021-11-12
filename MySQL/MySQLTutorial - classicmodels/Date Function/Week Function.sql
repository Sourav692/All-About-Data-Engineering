SELECT 
    WEEK(orderDate) week_no, 
    COUNT(*)
FROM
    orders
WHERE
    YEAR(orderDate) = 2003
GROUP BY WEEK(orderDate);
