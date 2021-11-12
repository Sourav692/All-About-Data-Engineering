-- The TIMEDIFF returns the difference between two TIME or DATETIME values. See the following syntax of TIMEDIFF function,

-- The TIMEDIFF function accepts two arguments that must be the same type, either TIME or DATETIME. The TIMEDIFF function returns the result of dt1 - dt2 expressed as a time value.

-- Because the TIMEDIFF function returns a TIME value, its result is limited to the range allowed for TIME values which is from -838:59:59 to 838:59:59.

-- It’s important to note that the TIMEDIFF function accepts values with TIME or DATETIME types. To compare a difference between two DATE or DATETIME values, you use the DATEDIFF function
-- https://www.mysqltutorial.org/mysql-timediff/

SELECT TIMEDIFF('12:00:00','10:00:00') diff;

SELECT 
            TIMEDIFF('2010-01-01 01:00:00',
                     '2010-01-02 01:00:00') diff;

-- The TIMEDIFF function returns NULL if either argument is NULL.
SELECT TIMEDIFF('2010-01-01',NULL) diff;

-- If you pass two arguments with different types, one is DATETIME and the other is TIME, the TIMEDIFF function also returns NULL.
SELECT TIMEDIFF('2010-01-01 10:00:00','10:00:00') diff;
		
-- MySQL TIMEDIFF function and truncated incorrect time value
SELECT 
    TIMEDIFF('2009-03-01 00:00:00', 
             '2009-01-01 00:00:00') diff;

Show WARNINGS; -- Truncated incorrect time value: '1416:00:00'

-- To fix this problem, you need to use the TIMESTAMPDIFF function as follows:
SELECT TIMESTAMPDIFF(
            HOUR, 
            '2009-01-01 00:00:00', 
            '2009-03-01 00:00:00') diff;



        