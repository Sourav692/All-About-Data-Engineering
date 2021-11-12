-- Using MySQL LAST_DAY()  function to get the last day of the current month
SELECT LAST_DAY(NOW());

-- Using the MySQL LAST_DAY() function to get the last day of the next month
SELECT LAST_DAY(CURDATE() + INTERVAL 1 MONTH);

-- Getting the first day of the month for a date
-- MySQL does not have a function that returns the first day of a date. However, you can use the LAST_DAY() function to calculate it by using these steps:

-- First, get the last day of the month of a date.
-- Second, add 1 day to get the first day of the next month using DATE_ADD() function
-- Third, subtract 1 month to get the first day of the month of the date.
-- The following query illustrates how to get the first day of the month of 2017-07-14.
SELECT 
    DATE_ADD(DATE_ADD(LAST_DAY('2017-07-14'),
            INTERVAL 1 DAY),
        INTERVAL - 1 MONTH) AS first_day;