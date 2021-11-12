SELECT DAYNAME('2000-01-01') dayname;

SELECT 
    DAYNAME(orderdate) weekday, 
    COUNT(*) total_orders
FROM
    orders
WHERE
    YEAR(orderdate) = 2004
GROUP BY weekday
ORDER BY total_orders DESC;