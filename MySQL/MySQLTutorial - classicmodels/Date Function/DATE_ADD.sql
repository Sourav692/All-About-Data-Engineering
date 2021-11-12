-- The DATE_ADD function takes two arguments:

-- start_date is a starting DATE or DATETIME value
-- INTERVAL expr unit is an interval value to be added to the starting date value.
-- The DATE_ADD function may return a DATETIME value or a string, depending on the arguments:

-- DATETIME if the first argument is a DATETIME value or if the interval value has time element such as hour, minute or second, etc.
-- String otherwise.

SELECT DATE_ADD('1999-12-31 23:59:59', INTERVAL 1 SECOND) result;

-- Add -1 day and 5 hours to 2000-01-01 00:00:00.
SELECT DATE_ADD('2000-01-01 00:00:00',
     INTERVAL '-1 5' DAY_HOUR) result;
     
-- Add 1 second and 999999 microseconds to 1999-12-31 23:59:59.000002:
SELECT 
    DATE_ADD('1999-12-31 23:59:59.000002',
        INTERVAL '1.999999' SECOND_MICROSECOND) result;

-- NOTE : If we use 6/4 HOUR_MINUTE in Interval it would evaulate to 1 hour 5000 minute So we should use CAST(6/4 AS DECIMAL(3,1)).

SELECT 
    DATE_ADD('2000-01-01',
        INTERVAL 5 / 2 HOUR_MINUTE) result;

SELECT 
    DATE_ADD('2000-01-01',
        INTERVAL CAST(6/4 AS DECIMAL(3,1)) HOUR_MINUTE) result;
        
-- Automatic DATETIME conversion
-- If you add a time value to a date value, the result is a DATETIME value as shown in the following example:
SELECT 
    DATE_ADD('2000-01-01', INTERVAL 12 HOUR) result;

-- Invalid starting date
-- The DATE_ADD function returns NULL if you use an invalid date for the first argument, for example:
SELECT DATE_ADD('2000-02-30', 
            INTERVAL 1 DAY) result;

SHOW WARNINGS;

-- Adjusted day, month, or year
-- If you add an interval of MONTH, YEAR, or YEAR_MONTH to a date that results in a date which has a day larger than the maximum day for the new month, the day will be adjusted to the maximum day in the new month.
SELECT 
    DATE_ADD('2010-01-30', 
              INTERVAL 1 MONTH) result;









