/*markdown
### MySQL RIGHT JOIN clause examples

*/

/*markdown
![picture 3](../../images/9b9ed615d29d1a38e756988be3773c515bc2af87333797aa8c98bdae6600a696.png)  


*/

/*markdown
A sales representative, or an employee, may be in charge of zero or more customers. And each customer is taken care of by zero or one sales representative.

If the value in the column salesRepEmployeeNumber is NULL, which means the customer does not have any sales representative.
*/

SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	employeeNumber;

-- From the above you can see there are no entry for salesRepEmployeeNumber where we are getting null value for employee number in employee table.

SELECT *  FROM customers where salesRepEmployeeNumber = 1002

-- Now check with one salesRepEmployeeNumber for which we got value in right join
SELECT *  FROM customers where salesRepEmployeeNumber = 1166


/*markdown
### 2) Using MySQL RIGHT JOIN to find unmatching rows

*/

SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;

