use classicmodels;



CREATE TABLE tbl_Emp(Empid int NULL,EmpName varchar(250) NULL, Gender varchar(20), EmpAddress varchar(500) NULL,City varchar(250) NULL,Salary int NULL, Fk_DepId int);  

CREATE TABLE tbl_Department(Depid int NULL,DepName varchar (250) NULL); 

-- Insert into tbl_Department
INSERT INTO tbl_Department(Depid, DepName)VALUES(1, 'IT Department');  
INSERT INTO tbl_Department(Depid, DepName)VALUES(2, 'HR Department');  
INSERT INTO tbl_Department(Depid, DepName)VALUES(3, 'Developer Department');  
INSERT INTO tbl_Department(Depid, DepName)VALUES(4, 'Tester Department');  
INSERT INTO tbl_Department(Depid, DepName)VALUES(5, 'Creative Department');  
INSERT INTO tbl_Department(Depid, DepName)VALUES(6, 'SEO Department');  
INSERT INTO tbl_Department(Depid, DepName)VALUES(7, 'Admin Department'); 

-- Insert into tbl_Emp
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(1, 'Jitendra' , 'Male', 'Demo Address', 'Agra', 4000, 3);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(2, 'Aman' , 'Male', 'Demo Address', 'Ghaziabad', 0, 2);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(3, 'Niman' , 'Male', 'Demo Address', 'Agra', 1000, 2);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(4, 'Rita' , 'Female', 'Demo Address', 'Mathura', 1000, 2);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(5, 'Sita' , 'Female', 'Demo Address', 'Agra', 4000, 3);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(6, 'Rohan' , 'Male', 'Demo Address', 'Agra', 5000, 2);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(7, 'Sohan' , 'Male', 'Demo Address', 'Noida', 4000, 1);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(8, 'Mohan' , 'Male', 'Demo Address', 'Agra', 4000, 5);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(9, 'Ram' , 'Male', 'Demo Address', 'Noida', 5000, 1);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(10, 'Shyam' , 'Male', 'Demo Address', 'Delhi', 0, 5);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(11, 'Teena' , 'Female', 'Demo Address', 'Mathura', 3000, 3);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(12, 'Aman' , 'Male', 'Demo Address', 'Ghaziabad', 4000, 3);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(13, 'Jitendra' , 'Male', 'Demo Address', 'Ghaziabad', 4000, 3);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(14, 'Sunil' , 'Male', 'Demo Address', 'Delhi', 2000, 6);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(15, 'Roshan' , 'Male', 'Demo Address', 'Mathura', 3000, 2);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(16, 'Manoj' , 'Male', 'Demo Address', 'Ghaziabad', 2000, 3);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(17, 'Rinky' , 'Female', 'Demo Address', 'Mathura', 0, 1);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(18, 'Pooja' , 'Female', 'Demo Address', 'Delhi', 4000, 7);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(19, 'Shivani' , 'Female', 'Demo Address', 'Delhi', 4000, 7);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(20, 'Pankaj' , 'Male', 'Demo Address', 'Agra', 7000, 1);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(21, 'Sendy' , 'Male', 'Demo Address', 'Mathura', 8000, 3);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(22, 'Akash' , 'Male', 'Demo Address', 'Delhi', 6000, 1);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(23, 'Nidhi' , 'Female', 'Demo Address', 'Ghaziabad', 7000, 6);  
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(24, 'Kartik' , 'Male', 'Demo Address', 'Agra', 6000, 6); 
INSERT INTO tbl_Emp(Empid, EmpName, Gender, EmpAddress, City, Salary, Fk_DepId)VALUES(25, 'Ashish' , 'Male', 'Demo Address', 'Ghaziabad', 5000, 3);  

-- 
SELECT Depid, DepName from tbl_Department

-- Question 1: How to find duplicate records in the Employee Table
Select EmpName, Count(EmpName)as EmpRepeat from tbl_Emp  
Group by EmpName  
having Count(EmpName)>1; 

-- Question 2: How to delete duplicate records in the Employee Table?

-- WITH TempEmpTbl (EmpName,duplicateEmpCount)  
-- AS  
-- (  
-- SELECT EmpName,ROW_NUMBER() OVER(PARTITION by EmpName, Salary ORDER BY EmpName)  
-- AS duplicateEmpCount  
-- FROM tbl_Emp  
-- )  
-- DELETE FROM TempEmpTbl  
-- WHERE duplicateEmpCount > 1

-- Question 3: How to find the highest salary of an Employee?
Select MAX(Salary) as Salary from tbl_Emp;

-- Question 4: How to find the second highest salary of an Employee?
Select MAX(Salary) as Salary from tbl_Emp WHERE Salary NOT IN (select MAX(Salary) from tbl_Emp )  

-- Question 5: How to find the Max Salary from each department?
SELECT D.DepName, MAX(E.Salary) as Salary from tbl_Emp E  
Inner Join tbl_Department D on E.Fk_DepId = D.DepId Group By D.DepName

-- Question 6: How to find the name of the department with the Max Sum of Salaries of its employees?
SELECT D.DepName, Sum(E.Salary) as Salary from tbl_Emp E Inner Join tbl_Department D on E.Fk_DepId = D.DepId Group By D.DepName Order by sum(salary) desc  LIMIT 1

-- Question 7: How to find cities  and number of employees whose Salary is greater than 4000.
SELECT City, Count(City) as CityCount from tbl_Emp where Salary > 4000 group by City Having Count(City) > 1  

-- Question 8: How to find the name of an employee whose name contains "ha" and the length is greater than 5?
SELECT EmpName from tbl_emp where EmpName Like '%ha%' and length(EmpName) > 5

-- Question 9: How to get all the employee details from the Employee table who's "EmpName" does not start with any single character between "a" and "r"?
SELECT * FROM tbl_Emp WHERE EmpName like '[^a-r]%'  

-- Question 10: How to reverse the gender of each employee in a table?
SELECT EmpName, Case Gender When 'Male' then 'Female' else 'Male' End As Gender from tbl_Emp























