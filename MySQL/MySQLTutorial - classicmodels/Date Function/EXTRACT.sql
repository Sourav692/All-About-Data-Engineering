-- The EXTRACT() function extracts part of a date. The following illustrates the syntax of the EXTRACT() function.

-- EXTRACT(unit FROM date)

SELECT EXTRACT(DAY FROM '2017-07-14 09:04:44') DAY;
SELECT EXTRACT(MONTH FROM '2017-07-14 09:04:44') MONTH;
SELECT EXTRACT(DAY_HOUR FROM '2017-07-14 09:04:44') DAYHOUR;
SELECT EXTRACT(DAY_MICROSECOND FROM '2017-07-14 09:04:44') DAY_MS;
SELECT EXTRACT(DAY_MINUTE FROM '2017-07-14 09:04:44') DAY_M;
SELECT EXTRACT(QUARTER FROM '2017-07-14 09:04:44') QUARTER;

SELECT EXTRACT(WEEK FROM '2017-07-14 09:04:44') WEEK, DAYOFWEEK('2017-07-14 09:04:44');