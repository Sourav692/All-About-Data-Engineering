-- 1. Display all records in the EMP table.
SELECT * 
FROM emp;

-- 2. Display all employees who are working as managers.
SELECT *
FROM emp
WHERE JOB LIKE 'Manager';

-- 3.Display the detail of employee with employee no. 7369.
SELECT *
FROM emp
WHERE EMPNO = 7369;

-- 4. Display all employees who joined on 1st May,1981.
SELECT *
FROM emp
WHERE HIREDATE = '1981-05-01';


-- 5. Display all employees with salary greater than Rs.1500/-.
SELECT *
FROM emp
WHERE SAL > 1500;

-- 6. Display all employees who are not getting any commission.
SELECT *
FROM emp
WHERE COMM IS NULL;

-- 7. Display all employees whose names are starting with “A”.
SELECT *
FROM emp
WHERE ENAME LIKE 'A%';

-- 8. Add a new attribute Phone No.
ALTER TABLE emp ADD (PHONE VARCHAR(50) NULL DEFAULT NULL);

SELECT *
FROM emp;

-- 9. Change the data type of attribute Job from char to varchar2.
ALTER TABLE emp
MODIFY COLUMN JOB VARCHAR(50);

DESC emp;

-- 10. Remove the attribute Phone No. from the table.
ALTER TABLE emp DROP COLUMN PHONE;

SELECT *
FROM emp;
-- 11. Describe the tables emp and dept.
desc emp;
desc dept;

-- 12. Display lexicographically smallest and largest employee name starting with letter 'A'.
SELECT MIN(ENAME), MAX(ENAME)
FROM emp
WHERE ENAME LIKE 'A%';

