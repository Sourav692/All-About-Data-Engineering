-- Get a specified number of leftmost characters from a string

SELECT LEFT('MySQL LEFT', 5);

SELECT LEFT('MySQL LEFT', 9999);

-- The following statements return an empty string because the length is zero or negative.

SELECT LEFT('MySQL LEFT', 0);
SELECT LEFT('MySQL LEFT', -2);

-- The following statement returns a NULL value because the length is NULL
SELECT LEFT('MySQL LEFT', NULL);

-- The following statement uses the LEFT function to return the first 50 characters of the product description.
SELECT 
    productname, LEFT(productDescription, 50) summary
FROM
    products;
    
-- You want to get the first 50 characters without cutting the word in the middle. To achieve this, you use the following steps:

-- 1) Take the leftmost 50 characters of the productDescription column.
SELECT 
    LEFT(productdescription, 50)
FROM
    products;

-- 2) Reverse the substring using the REVERSE function.
SELECT 
    REVERSE(LEFT(productdescription, 50))
FROM
    products;
    
-- 3) Get the first space’s position in the reversed substring using the LOCATE function.
SELECT 
    LOCATE(' ',REVERSE(LEFT(productdescription, 50))) first_space_pos
FROM
    products;

-- 4) Minus 1 from the position. In case you don’t find any space, keep the position zero.
SELECT
    IFNULL(NULLIF(LOCATE(' ', REVERSE(LEFT(productDescription, 50))), 0) - 1, 0)
FROM
    products;

-- 5) Minus the position from the 50, you got the position. Let’s call it as last_space_pos.
SELECT
	productDescription,
	(50 - IFNULL(NULLIF(LOCATE(' ', REVERSE(LEFT(productDescription, 50))), 0) - 1, 0)) last_space_pos
FROM
    products;
-- 6) Take the leftmost last_space_pos characters of the product description.
SELECT 
    productDescription, LEFT(productDescription, last_space_pos)
FROM
    (SELECT 
        productDescription,
            (50 - IFNULL(NULLIF(LOCATE(' ', REVERSE(LEFT(productDescription, 50))), 0) - 1, 0)) last_space_pos
    FROM
        products) AS t;

