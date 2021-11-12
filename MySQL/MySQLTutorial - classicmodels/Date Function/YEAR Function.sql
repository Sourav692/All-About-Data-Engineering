SELECT YEAR('2017-01-01');

SELECT YEAR(NOW());

-- If year is Null
SELECT YEAR(NULL);

 SELECT YEAR('0000-00-00');
 
 -- The following query uses the YEAR() function to get the number of orders shipped per year.
SELECT 
    YEAR(shippeddate) year, 
    COUNT(ordernumber) orderQty
FROM 
    orders
WHERE
    shippeddate IS NOT NULL
GROUP BY YEAR(shippeddate)
ORDER BY YEAR(shippeddate);

-- Currently, MySQL does no support function index. It means that the expression YEAR(column) will not leverage index if the index is available for the column.
-- We will create a new table named dates for demonstration purpose:
CREATE TABLE dates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dt DATE
); 
CREATE INDEX idx_td ON dates(dt);

-- The following recursive CTE generates the dates between '1800-01-01' and '2020-12-31':
-- SET @cte_max_recursion_depth = 3000;

-- WITH RECURSIVE dates (dt) AS
-- (
--   SELECT '1800-01-01'
--   UNION ALL
--   SELECT dt + INTERVAL 1 DAY FROM dates
--   WHERE dt + INTERVAL 1 DAY <= '1802-12-31'
-- )
-- SELECT dt FROM dates;

-- INSERT INTO dates(dt)
-- WITH RECURSIVE dates (dt) AS
-- (
--   SELECT '1800-01-01'
--   UNION ALL
--   SELECT dt + INTERVAL 1 DAY FROM dates
--   WHERE dt + INTERVAL 1 DAY <= '2020-01-01'
-- )
-- SELECT dt FROM dates;
