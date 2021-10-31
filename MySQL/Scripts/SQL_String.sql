USE classicmodels;

-- MySQL CONCAT function
SELECT CONCAT('MySQL',' ','CONCAT');

-- If you add a NULL value, the CONCAT function returns a NULL value as follows:
SELECT CONCAT('MySQL',NULL,'CONCAT');

-- To get the full names of contacts, you use the CONCAT function to concatenate first name, space, last name as the following statement:
SELECT 
    concat(contactFirstName,' ',contactLastName) Fullname
FROM
    customers;
    
-- MySQL provides a special form of the CONCAT function: CONCAT_WS function. The CONCAT_WS function concatenates two or more string values with a predefined separator.
SELECT CONCAT_WS(',','John','Doe');

-- The CONCAT_WS function returns NULL if and only if the first argument, which is the separator, is NULL. See the following example:
SELECT CONCAT_WS(NULL ,'Jonathan', 'Smith');

-- Unlike the CONCAT function, the CONCAT_WS function skips NULL values after the separator argument. In other words, it ignores NULL values.
SELECT CONCAT_WS(',','Jonathan', 'Smith',NULL);

-- The following statement constructs complete addresses using the CONCAT_WS function.
SELECT 
    CONCAT_WS(CHAR(13),
            CONCAT_WS(' ', contactLastname, contactFirstname),
            addressLine1,
            addressLine2,
            ' ',
            CONCAT_WS(' ', postalCode, city),
            country,
            CONCAT_WS(CHAR(13), '')) AS Customer_Address
FROM
    customers;

SELECT contactLastname, contactFirstname,addressLine1,addressLine2,postalCode,city FROM customers

-- INSTR Keyword
-- The INSTR function returns the position of the first occurrence of a substring in a string. If the substring is not found in the str, the INSTR function returns zero (0).
-- The INSTR function accepts two arguments:
-- The str is the string that you want to search in.
-- The substr is the substring that you want to search for.
-- The INSTR function is not case sensitive. It means that it does not matter if you pass the lowercase, uppercase, title case, etc., the results are always the same.
-- If you want the INSTR function to perform searches in case-sensitive manner on a non-binary string, you use the BINARY operator to cast a one the argument of the INSTR function from a non-binary string to a binary string.

select INSTR('MySQL INSTR', 'MySQL');

-- The following statement returns the same result because the INSTR function is case-insensitive.

SELECT INSTR('MySQL INSTR', 'mysql');

-- To force INSTR function to search based on case-sensitive fashion, you use the BINARY operator as follows:

SELECT INSTR('MySQL INSTR', BINARY 'mysql');

-- Suppose you want to find product whose name contains the car keyword, you can use the INSTR function as follows:

SELECT 
    productName
FROM
    products
WHERE
    INSTR(productname,'Car') > 0;

-- With Like Keyword
SELECT 
    productname
FROM
    products
WHERE
    productname LIKE '%Car%';

-- Both queries return the same result. So which one is faster, the INSTR or the LIKE operator?
-- The answer is the that they are the same. They are both case-sensitive and perform full table scans.
-- Let’s create an index on the productname column
CREATE INDEX idx_products_name ON products(productname);

SELECT 
    productname
FROM
    products
WHERE
    productname LIKE '1900%';
    
EXPLAIN SELECT 
    productname
FROM
    products
WHERE
    productname LIKE '1900%';

EXPLAIN SELECT 
    productname
FROM
    products
WHERE
    instr(productname,'1900');

-- The INSTR function performs a table scan even though the productname column has an index. 
-- This is because MySQL cannot make any assumption about the semantics of the INSTR function, whereby MySQL can utilize its understanding of the semantics of the LIKE operator.
SHOW character SET
