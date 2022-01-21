-- MySQL DISTINCT clause
SELECT 
  DISTINCT lastname
FROM
  employees
ORDER BY
  lastname;
  
SELECT DISTINCT state
FROM customers;

SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;