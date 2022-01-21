CREATE TABLE t (
    val INT
);

INSERT INTO t(val)
VALUES(1),(2),(2),(3),(4),(4),(5);


SELECT * FROM t;

SELECT val,
	rank() over (
    partition by val) my_rank
from t;

SELECT val,
	row_number() over (
    partition by val) my_rank
from t;

SELECT * FROM t;

SELECT val,
	rank() over (
    order by val) my_rank
from t;

SELECT * FROM sales;

-- The following statement use the RANK() function to rank the sales employees by sales amount in every year:
SELECT 
	sales_employee,
    sale,
    fiscal_year,
    RANK() over(
		partition by fiscal_year
        order by sale ) my_rank
FROM 
	sales;

-- The following statement uses the RANK() function to find the top three highest valued-orders in each year:

SELECT 
	*
FROM 
(SELECT
	orderNumber,
    YEAR(orderDate) order_year,
    quantityOrdered*priceEach AS order_value,
    RANK() OVER (
		PARTITION BY YEAR(orderDate)
        ORDER BY quantityOrdered*priceEach DESC
    ) order_rank_value
FROM
	orders
JOIN
	orderdetails
USING (orderNumber)) derived_table
WHERE order_rank_value <=3;
	