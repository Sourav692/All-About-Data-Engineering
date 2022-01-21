SELECT 
  customerNumber,
  customerName, 
  orderDate,
  Lead(orderDate,1,"No Date") over(
    partition By customerNumber
    order by orderDate) nextOrderDate
FROM
  customers
join 
  orders
using (customerNumber);