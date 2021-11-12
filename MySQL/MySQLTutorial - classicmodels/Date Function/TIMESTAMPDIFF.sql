 -- https://www.mysqltutorial.org/mysql-timestampdiff/
 
 SELECT 
    TIMESTAMPDIFF(MONTH, '2010-01-01', '2010-06-01') result;

SELECT 
    TIMESTAMPDIFF(DAY, '2010-01-01', '2010-06-01') result;

SELECT 
    TIMESTAMPDIFF(MINUTE, '2010-01-01 10:00:00', '2010-01-01 10:45:00') result;
    

SELECT TIMESTAMPDIFF(MINUTE, '2010-01-01 10:00:00', '2010-01-01 10:45:59') result;

SELECT 
    TIMESTAMPDIFF(SECOND, '2010-01-01 10:00:00', '2010-01-01 10:45:59') result;
    
-- Calculating ages using MySQL TIMESTAMPDIFF function
CREATE TABLE persons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
);

INSERT INTO persons(full_name, date_of_birth)
VALUES('John Doe', '1990-01-01'),
      ('David Taylor', '1989-06-06'),
      ('Peter Drucker', '1985-03-02'),
      ('Lily Smith', '1992-05-05'),
      ('Mary William', '1995-12-01');
SELECT 
    id,
    full_name,
    date_of_birth,
    TIMESTAMPDIFF(YEAR,
        date_of_birth,
        NOW()) age
FROM
    persons;
    
    