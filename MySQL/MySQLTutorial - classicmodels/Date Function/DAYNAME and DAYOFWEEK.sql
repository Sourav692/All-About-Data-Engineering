-- The DAYOFWEEK function accepts 1 argument which is a DATE or DATETIME value. It returns an integer which ranges from 1 to 7 that represents Sunday to Saturday.

-- The DAYOFWEEK function returns NULL if the date is NULL, zero ( 0000-00-00), or invalid.

-- The DAYOFWEEK function returns the weekday index for a date i.e., 1 for Sunday, 2 for Monday, … 7 for Saturday. These index values correspond to the ODBC standard.

SELECT DAYNAME('2012-12-01'), DAYOFWEEK('2012-12-01');

SELECT DAYNAME('2010-01-01'), WEEKDAY('2010-01-01');