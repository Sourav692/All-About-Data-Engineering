-- --------------------------------------------------------
-- Author:						 Adrish Bose
-- Host:                         127.0.0.1
-- Server version:               8.0.23 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6257
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table office.dept
drop database if exists office;
create schema office;
use office;

CREATE TABLE IF NOT EXISTS `dept` (
  `DNO` int NOT NULL,
  `DNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table office.dept: ~5 rows (approximately)
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` (`DNO`, `DNAME`, `LOC`) VALUES
	(10, 'Accounting', 'New York'),
	(20, 'Research', 'Dallas'),
	(30, 'Sales', 'Chicago'),
	(40, 'Operations', 'Boston'),
	(50, 'Management', 'Michigan');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;

-- Dumping structure for table office.emp
CREATE TABLE IF NOT EXISTS `emp` (
  `EMPNO` int NOT NULL,
  `ENAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `JOB` varchar(50) DEFAULT NULL,
  `MGR` int DEFAULT NULL,
  `HIREDATE` date NOT NULL,
  `SAL` int NOT NULL,
  `COMM` int DEFAULT NULL,
  `DEPTNO` int NOT NULL,
  PRIMARY KEY (`EMPNO`),
  KEY `FK_emp_dept` (`DEPTNO`),
  CONSTRAINT `FK_emp_dept` FOREIGN KEY (`DEPTNO`) REFERENCES `dept` (`DNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table office.emp: ~14 rows (approximately)
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` (`EMPNO`, `ENAME`, `JOB`, `MGR`, `HIREDATE`, `SAL`, `COMM`, `DEPTNO`) VALUES
	(7369, 'Smith', 'Clerk', 7902, '1980-12-17', 800, NULL, 20),
	(7499, 'Allen', 'Salesman', 7698, '1981-02-20', 1600, 300, 30),
	(7521, 'Ward', 'Salesman', 7698, '1981-02-22', 1250, 500, 30),
	(7566, 'Jones', 'Manager', 7839, '1981-04-02', 2975, NULL, 20),
	(7654, 'Martin', 'Salesman', 7698, '1981-09-28', 1250, 1400, 30),
	(7698, 'Blake', 'Manager', 7839, '1981-05-01', 2850, NULL, 30),
	(7782, 'Clark', 'Manager', 7839, '1981-06-09', 2450, NULL, 10),
	(7788, 'Scott', 'Analyst', 7566, '1982-12-09', 3000, NULL, 20),
	(7839, 'King', 'President', NULL, '1981-11-17', 5000, NULL, 10),
	(7844, 'Turner', 'Salesman', 7698, '1981-09-08', 1500, 500, 30),
	(7876, 'Adam', 'Clerk', 7788, '1983-01-12', 1100, NULL, 20),
	(7900, 'James', 'Clerk', 7698, '1981-12-03', 950, NULL, 30),
	(7902, 'Ford', 'Analyst', 7566, '1981-12-04', 3000, NULL, 20),
	(7934, 'Miller', 'Clerk', 7782, '1982-01-23', 1300, NULL, 10);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;