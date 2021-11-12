-- DATE_FORMAT Function
-- Let us view some of the Data Types formats used in MySQL for DATE and TIME functions and storing the values:

-- DATE: YYYY-MM-DD
-- DATETIME: YYYY-MM-DD HH:MM:SS
-- TIMESTAMP: YYYY-MM-DD HH:MM:SS
-- YEAR: YYYY or YY

-- Supposing we want to show the current date then, we use the below query:
SELECT CURRENT_DATE();
SELECT CURDATE();

-- DATE_ADD(): This function adds the value of time in the form of intervals to a date. The ADDDATE() function is a substitute for this function.
SELECT DATE_ADD("2020-04-30 08:30:20", INTERVAL 10 MINUTE) 'date_add';

-- Now, we will write a query where we will subtract 2 hours from a given date and time:

SELECT DATE_ADD("2020-04-30 08:30:20", INTERVAL -2 HOUR) 'date_add';

-- DATE_FORMAT(): This MySQL Date function organizes a date as indicated in the argument of the function. Some formats are ‘YYYY-MM-DD’, ‘YYYYMMDD’, etc.
SELECT DATE_FORMAT("2020-03-25", "%M %D %Y");

SELECT 
    orderNumber,
    DATE_FORMAT(orderdate, '%Y-%m-%d') orderDate,
    DATE_FORMAT(requireddate, '%a %D %b %Y') requireddate,
    DATE_FORMAT(shippedDate, '%W %D %M %Y') shippedDate
FROM
    orders;

-- Though in below query we have mentioned order by it is not sorting as we used shippeddate as the alias for the output of the
--  DATE_FORMAT function, which is a string, the ORDER BY clause took the alias and sorted the orders based on string values, not date values.    
SELECT 
    orderNumber,
    DATE_FORMAT(shippeddate, '%W %D %M %Y') shippeddate
FROM
    orders
WHERE
    shippeddate IS NOT NULL
ORDER BY shippeddate;

-- Right Query
SELECT 
    orderNumber,
    DATE_FORMAT(shippeddate, '%W %D %M %Y') 'Shipped date'
FROM
    orders
WHERE
    shippeddate IS NOT NULL
ORDER BY shippeddate;


-- DATE_SUB(): This MySQL Date function is responsible to subtract a time interval value from a date.
SELECT DATE_SUB("2020-04-28", INTERVAL 5 DAY);
SELECT DATE_SUB("2020-04-28", INTERVAL 12 HOUR);

-- DATE(): This MySQL Date function allow02s to provide the date portion out from a given DATETIME() value expression.(date should be in YYYY-MM-DD format)
SELECT DATE("2020-04-30 08:30:20");
-- DATEDIFF(): This MySQL Date function returns the result as the number of days found between any two specified datetimes or dates.
SELECT DATEDIFF ("2020-04-15 06:10:30", "2020-04-12");


-- EXTRACT(): This function extracts a section of a date expression.

-- LOCALTIME(): This MySQL Date function provides the current date and time values in a special format i.e. ‘YYYY-MM-DD HH:MM: SS’ or ‘YYYYMMDDHHMMSS which depends on the type of arguments passed in the context as a string or numeric’ of the function.

-- MAKEDATE(): This type of Date function is used to return date by captivating a value of a year and a number of days where the day value should be greater than 0. If this condition is not provided then, the function will return a NULL value.

-- MONTH(): This type of function returns the value of the month for the specified date which should be between range from 1 to 12 i.e. Jan to Dec.

-- NOW(): This MySQL Date function gives the value of current date and time in a distinct format i.e. ‘YYYY-MM-DD HH:MM:SS’ or ‘YYYYMMDDHHMMSS which depends on the type of arguments passed in the context as a string or numeric’ of the function.
SELECT NOW();

-- STR_TO_DATE(): It provides the value of datetime with the help of a string and its indicated format passed in the arguments of the function.

-- SUBDATE(): It is responsible for providing a time period value from a particular date.

-- SYSDATE(): This function offers the value of current date and time in a separate format i.e. ‘YYYY-MM-DD HH:MM: SS’ or ‘YYYYMMDDHHMMSS which is determined by the type of arguments passed in the context as a string or numeric’ of the function.
SELECT sysdate();
-- UTC_DATE(): On the basis of the arguments as a string or numeric in the function, the result i.e. current Coordinated Universal Time (UTC) date value is delivered in the layout like ‘YYYY-MM-DD’ or ‘YYYYMMDD’.

-- GETDATE(): It returns the present date with the time.

-- CONVERT(): This function helps to display the result of date and time in diverse formats.



