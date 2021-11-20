/*markdown
### Introduction to MySQL LEFT JOIN clause

*/

/*markdown
The LEFT JOIN allows you to query data from two or more tables. Similar to the INNER JOIN clause, the LEFT JOIN is an optional clause of the SELECT statement, which appears immediately after the FROM clause.

Suppose that you want to join two tables t1 and t2.

The following statement shows how to use the LEFT JOIN clause to join the two tables:

    SELECT 
        select_list
    FROM
        t1
    LEFT JOIN t2 ON 
        join_condition;
*/

/*markdown
### 1) Using MySQL LEFT JOIN clause to join two tables

*/

/*markdown
![picture 2](../../images/36f294937ec4dae2768c2b9d04b5bcda250da339782b2b9b71622e1bdd0ccbc9.png)  


*/

/*markdown
Each customer can have zero or more orders while each order must belong to one customer.

This query uses the LEFT JOIN clause to find all customers and their orders:




*/

SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber;

/*markdown
In this example:

    The customers is the left table and orders is the right table.
    The LEFT JOIN clause returns all customers including the customers who have no order. If a customer has no order, the values in the column orderNumber and status are NULL.
*/

/*markdown
### 2) Using MySQL LEFT JOIN clause to find unmatched rows

*/

SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;

/*markdown
### 3) Using MySQL LEFT JOIN to join three tables

*/

SELECT 
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
LEFT JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber;

/*markdown
### Condition in WHERE clause vs. ON clause

*/

SELECT 
    o.orderNumber, 
    o.customerNumber, 
    d.productCode
FROM
    orders o
LEFT JOIN orderDetails d
    USING (orderNumber)
WHERE
    orderNumber = 10123;

/*markdown
This example used the LEFT JOIN clause to query data from the tables orders and  orderDetails. The query returns the order and its line items of the order number 10123.
*/

SELECT 
    o.orderNumber, 
    o.customerNumber, 
    d.productCode
FROM
    orders o
LEFT JOIN orderDetails d 
    ON o.orderNumber = d.orderNumber AND 
       o.orderNumber = 10123;

/*markdown
It will have a different meaning.

In this case, the query returns all orders but only the order 10123 will have line items associated with it as in the following picture:
*/

/*markdown
Notice that for INNER JOIN clause, the condition in the ON clause is equivalent to the condition in the WHERE clause
*/