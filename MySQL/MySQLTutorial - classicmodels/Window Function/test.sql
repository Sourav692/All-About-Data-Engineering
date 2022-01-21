-- Select user defined tables
SELECT TABLE_NAME,TABLE_SCHEMA FROM INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = 'org';

-- display primary key in mysql 
SELECT * 
FROM 
	INFORMATION_SCHEMA. COLUMNS
WHERE 
	TABLE_SCHEMA = 'org'
-- AND 
-- 	TABLE_NAME = 'bonus'
AND 
	COLUMN_KEY = 'PRI';

-- Display Unique Keys
SELECT * 
FROM 
	INFORMATION_SCHEMA. COLUMNS
WHERE 
-- TABLE_SCHEMA = 'org'
-- AND 
-- 	TABLE_NAME = 'bonus'
-- AND 
	COLUMN_KEY = 'uq';
    
--- 
SELECT *  FROM Customers limit 25;
