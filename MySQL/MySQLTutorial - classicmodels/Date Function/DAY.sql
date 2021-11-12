SELECT DAY('2010-01-15');

SELECT DAY(LAST_DAY('2016-02-03'));

-- The following statement uses the DAY() function to return the number of orders by day number in 2003.
SELECT 
    DAY(orderdate) dayofmonth, 
    COUNT(*)
FROM
    orders
WHERE
    YEAR(orderdate) = 2004
GROUP BY dayofmonth
ORDER BY dayofmonth;

