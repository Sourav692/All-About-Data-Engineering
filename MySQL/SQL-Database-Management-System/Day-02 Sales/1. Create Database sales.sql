-- --------------------------------------------------------
-- Author:								       Adrish Bose
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

DROP DATABASE IF EXISTS sales;
CREATE DATABASE sales;
USE sales;
-- Dumping structure for table sales.client_master
CREATE TABLE IF NOT EXISTS `client_master` (
  `Client_no` varchar(6) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Pincode` int DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Bal_due` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Client_no`),
  CONSTRAINT `CC1` CHECK ((`Client_no` like _utf8mb4'C%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table sales.client_master: ~6 rows (approximately)
/*!40000 ALTER TABLE `client_master` DISABLE KEYS */;
INSERT INTO `client_master` (`Client_no`, `Name`, `City`, `Pincode`, `State`, `Bal_due`) VALUES
	('C00001', 'Ivan Bayross', 'Mumbai', 400054, 'Maharashtra', 15000.00),
	('C00002', 'Mamta Mazumdar', 'Madras', 780001, 'Tamil Nadu', 0.00),
	('C00003', 'Chhaya Bankar', 'Mumbai', 400057, 'Maharashtra', 5000.00),
	('C00004', 'Ashwini Joshi', 'Bangalore', 560001, 'Karnataka', 0.00),
	('C00005', 'Hansel Colaco', 'Mumbai', 400060, 'Maharashtra', 2000.00),
	('C00006', 'Deepak Sharma', 'Mangalore', 560050, 'Karnataka', 0.00);
/*!40000 ALTER TABLE `client_master` ENABLE KEYS */;

-- Dumping structure for table sales.product_master
CREATE TABLE IF NOT EXISTS `product_master` (
  `Product_no` varchar(6) NOT NULL,
  `Description` varchar(15) NOT NULL,
  `Profit_percent` decimal(4,2) NOT NULL,
  `Unit_measure` varchar(10) NOT NULL,
  `Qty_on_hand` int NOT NULL,
  `Reorder_lvl` int NOT NULL,
  `Sell_price` decimal(8,2) NOT NULL,
  `Cost_price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Product_no`),
  CONSTRAINT `PC1` CHECK ((`Product_no` like _utf8mb4'P%')),
  CONSTRAINT `PC2` CHECK ((`Sell_price` > 0)),
  CONSTRAINT `PC3` CHECK ((`Cost_price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table sales.product_master: ~9 rows (approximately)
/*!40000 ALTER TABLE `product_master` DISABLE KEYS */;
INSERT INTO `product_master` (`Product_no`, `Description`, `Profit_percent`, `Unit_measure`, `Qty_on_hand`, `Reorder_lvl`, `Sell_price`, `Cost_price`) VALUES
	('P00001', 'T-Shirts', 5.00, 'Piece', 200, 50, 350.00, 250.00),
	('P03453', 'Shirts', 6.00, 'Piece', 150, 50, 500.00, 350.00),
	('P06734', 'Cotton Jeans', 5.00, 'Piece', 100, 20, 600.00, 450.00),
	('P07865', 'Jeans', 5.00, 'Piece', 100, 20, 750.00, 500.00),
	('P07868', 'Trousers', 2.00, 'Piece', 150, 50, 850.00, 550.00),
	('P07885', 'Pum-Overs', 2.50, 'Piece', 80, 30, 700.00, 450.00),
	('P07965', 'Denim Shirts', 4.00, 'Piece', 100, 40, 350.00, 250.00),
	('P07975', 'Lyers Tops', 5.00, 'Piece', 70, 30, 300.00, 175.00),
	('P08865', 'Skirts', 5.00, 'Piece', 75, 30, 450.00, 300.00);
/*!40000 ALTER TABLE `product_master` ENABLE KEYS */;

-- Dumping structure for table sales.salesman_master
CREATE TABLE IF NOT EXISTS `salesman_master` (
  `Salesman_no` varchar(6) NOT NULL,
  `Salesman_name` varchar(20) NOT NULL,
  `Address1` varchar(10) NOT NULL,
  `Address2` varchar(10) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Pincode` int DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Sal_amt` decimal(8,2) NOT NULL,
  `Tgt_to_get` decimal(6,2) NOT NULL,
  `Ytd_sales` decimal(6,2) NOT NULL,
  `Remarks` varchar(20) DEFAULT '',
  PRIMARY KEY (`Salesman_no`),
  CONSTRAINT `SC1` CHECK ((`Salesman_no` like _utf8mb4'S%')),
  CONSTRAINT `SC2` CHECK ((`Sal_amt` > 0)),
  CONSTRAINT `SC3` CHECK ((`Tgt_to_get` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table sales.salesman_master: ~4 rows (approximately)
/*!40000 ALTER TABLE `salesman_master` DISABLE KEYS */;
INSERT INTO `salesman_master` (`Salesman_no`, `Salesman_name`, `Address1`, `Address2`, `City`, `Pincode`, `State`, `Sal_amt`, `Tgt_to_get`, `Ytd_sales`, `Remarks`) VALUES
	('S00001', 'Aman', 'A/14', 'Worli', 'Mumbai', 400002, 'Maharashtra', 3000.00, 100.00, 50.00, 'Good'),
	('S00002', 'Omkar', '65', 'Nariman', 'Mumbai', 400001, 'Maharashtra', 3000.00, 200.00, 100.00, 'Good'),
	('S00003', 'Raj', 'P-7', 'Bandra', 'Mumbai', 400032, 'Maharashtra', 3000.00, 200.00, 100.00, 'Good'),
	('S00004', 'Ashish', 'A/5', 'Juhu', 'Mumbai', 400044, 'Maharashtra', 3500.00, 200.00, 150.00, 'Good');
/*!40000 ALTER TABLE `salesman_master` ENABLE KEYS */;

-- Dumping structure for table sales.sales_order
CREATE TABLE IF NOT EXISTS `sales_order` (
  `Order_no` varchar(6) NOT NULL,
  `Order_date` date DEFAULT NULL,
  `Client_no` varchar(6) NOT NULL,
  `Dely_address` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Salesman_no` varchar(6) NOT NULL,
  `Dely_type` char(1) NOT NULL DEFAULT 'F',
  `Billed_yn` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Dely_date` date NOT NULL,
  `Order_status` varchar(10) NOT NULL,
  PRIMARY KEY (`Order_no`),
  KEY `FK__client_master` (`Client_no`),
  KEY `FK__salesman_master` (`Salesman_no`),
  CONSTRAINT `FK__client_master` FOREIGN KEY (`Client_no`) REFERENCES `client_master` (`Client_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__salesman_master` FOREIGN KEY (`Salesman_no`) REFERENCES `salesman_master` (`Salesman_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SO1` CHECK ((`Dely_date` > `Order_date`)),
  CONSTRAINT `SO2` CHECK ((`Order_status` in (_utf8mb4'in process',_utf8mb4'fulfilled',_utf8mb4'backorder',_utf8mb4'cancelled')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table sales.sales_order: ~6 rows (approximately)
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
INSERT INTO `sales_order` (`Order_no`, `Order_date`, `Client_no`, `Dely_address`, `Salesman_no`, `Dely_type`, `Billed_yn`, `Dely_date`, `Order_status`) VALUES
	('O19001', '2002-06-12', 'C00001', NULL, 'S00001', 'F', 'N', '2002-07-20', 'in process'),
	('O19002', '2002-06-25', 'C00002', NULL, 'S00002', 'P', 'N', '2002-06-27', 'cancelled'),
	('O19003', '2002-04-03', 'C00001', NULL, 'S00001', 'F', 'Y', '2002-04-07', 'fulfilled'),
	('O19008', '2002-05-24', 'C00005', NULL, 'S00004', 'F', 'N', '2002-07-26', 'in process'),
	('O46865', '2002-02-18', 'C00003', NULL, 'S00003', 'F', 'Y', '2002-02-20', 'fulfilled'),
	('O46866', '2002-05-20', 'C00004', NULL, 'S00002', 'P', 'N', '2002-05-22', 'cancelled');
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;

-- Dumping structure for table sales.sales_order_details
CREATE TABLE IF NOT EXISTS `sales_order_details` (
  `Order_no` varchar(6) NOT NULL,
  `Product_no` varchar(6) NOT NULL,
  `Qty_ordered` int DEFAULT NULL,
  `Qty_disp` int DEFAULT NULL,
  `Product_rate` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Order_no`,`Product_no`),
  KEY `FK4` (`Product_no`),
  CONSTRAINT `FK3` FOREIGN KEY (`Order_no`) REFERENCES `sales_order` (`Order_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK4` FOREIGN KEY (`Product_no`) REFERENCES `product_master` (`Product_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table sales.sales_order_details: ~14 rows (approximately)
/*!40000 ALTER TABLE `sales_order_details` DISABLE KEYS */;
INSERT INTO `sales_order_details` (`Order_no`, `Product_no`, `Qty_ordered`, `Qty_disp`, `Product_rate`) VALUES
	('O19001', 'P00001', 4, 4, 525.00),
	('O19001', 'P07885', 2, 1, 5250.00),
	('O19001', 'P07965', 2, 1, 8400.00),
	('O19002', 'P00001', 10, 0, 525.00),
	('O19003', 'P03453', 2, 2, 1050.00),
	('O19003', 'P06734', 1, 1, 12000.00),
	('O19008', 'P00001', 10, 5, 525.00),
	('O19008', 'P07975', 5, 3, 1050.00),
	('O46865', 'P00001', 10, 10, 525.00),
	('O46865', 'P03453', 4, 4, 1050.00),
	('O46865', 'P07868', 3, 3, 3150.00),
	('O46865', 'P07885', 3, 1, 5250.00),
	('O46866', 'P07965', 1, 0, 8400.00),
	('O46866', 'P07975', 1, 0, 1050.00);
/*!40000 ALTER TABLE `sales_order_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;