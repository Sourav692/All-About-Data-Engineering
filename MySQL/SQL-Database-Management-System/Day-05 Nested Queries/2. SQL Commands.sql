-- Get PNO & PNAME values of parts that are priced less than 20.
SELECT PNO,PNAME
FROM parts
WHERE PRICE <20;

-- Get PNO values for parts for which orders have been placed.
SELECT PNO 
FROM parts 
where PNO in (select PNO from nested.odetails);

SELECT T1.PNO 'PNO'
FROM nested.parts T1
WHERE EXISTS (SELECT *
			  FROM nested.odetails T2
			  WHERE T1.PNO = T2.PNO);

-- Get all the details of customers whose names begin with the letter "S".
SELECT *
FROM nested.customers
WHERE nested.customers.CNAME LIKE 'S%';

-- Get the ONO & CNAME values for customers whose orders have not yet been shipped.
SELECT T2.ONO 'ONO', T1.CNAME 'CNAME'
FROM nested.customers T1 JOIN nested.orders T2
ON T1.CNO = T2.CNO
WHERE T2.SHIPPED IS NULL; 

-- Get CNAME & ENAME pairs such the customer with name CNAME has placed and ordered through the employees with name ENAME.
SELECT T2.CNAME 'CNAME', T1.ENAME 'ENAME'
FROM nested.employees T1, nested.customers T2
WHERE T1.ENO IN (SELECT DISTINCT T3.ENO
				 FROM nested.orders T3
				 WHERE T3.CNO = T2.CNO);

-- Get the name of employees who was hired on the earliest date.
SELECT T1.ENAME 'ENAME', temp.Earliest_Date 'EARLIEST HIRE DATE'
FROM nested.employees T1, (SELECT MIN(nested.employees.HDATE) 'Earliest_Date' 
								 FROM nested.employees) temp
WHERE T1.HDATE = temp.Earliest_Date;

-- Retrieve the part number, part name and price of parts with price greater than 2000 in an ascending order of part number.
SELECT PNO,PNAME,(PRICE * QOH) 'PART PRICE' 
FROM parts
WHERE (PRICE * QOH)  > 2000
ORDER BY PNO;

-- For each part, get PNO & PNAME values along with total sales.
SELECT T2.PNO 'PNO', T2.PNAME 'PNAME', SUM(T1.QTY * T2.PRICE) 'TOTAL SALES'
FROM nested.odetails T1, nested.parts T2
WHERE T1.PNO = T2.PNO
GROUP BY T2.PNO, T2.PNAME;

-- Get the total quantity of parts 10601 that has been ordered.
SELECT SUM(T1.QTY) 'TOTAL 10601 PARTS'
FROM nested.odetails T1
WHERE T1.PNO = 10601;

-- Get the ENO values of employees from city "Mumbai".
SELECT T1.ENO 'EMPLOYEE NO'
FROM nested.employees T1
WHERE T1.ZIP IN (SELECT ZIP FROM nested.zipcodes WHERE CITY LIKE 'Mumbai');