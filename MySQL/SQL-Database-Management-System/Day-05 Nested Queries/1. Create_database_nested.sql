
DROP DATABASE IF EXISTS nested;
CREATE DATABASE nested;
USE nested;

CREATE TABLE `zipcodes` (
	`ZIP` INT(10) NOT NULL,
	`CITY` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`ZIP`) USING BTREE
);
INSERT INTO `nested`.zipcodes VALUES(67226,'Bristol');

INSERT INTO `nested`.zipcodes VALUES(60606,'London');

INSERT INTO `nested`.zipcodes VALUES(50302,'Birmingham');

INSERT INTO `nested`.zipcodes VALUES(63541,'Cardiff');

INSERT INTO `nested`.zipcodes VALUES(66782,'Nottingham');

INSERT INTO `nested`.zipcodes VALUES(68231,'Dublin');

INSERT INTO `nested`.zipcodes VALUES(71235,'Mumbai');

INSERT INTO `nested`.zipcodes VALUES(70546,'Delhi');

INSERT INTO `nested`.zipcodes VALUES(70000,'Kolkata');

-- 
CREATE TABLE `parts` (
	`PNO` INT(10) NOT NULL,
	`PNAME` VARCHAR(30) NOT NULL,
	`QOH` INT(10) NOT NULL,
	`PRICE` DECIMAL(6,2) NOT NULL,
	`LEVEL` INT(10) NOT NULL,
	PRIMARY KEY (`PNO`) USING BTREE,
	CONSTRAINT `CC1` CHECK ((`QOH` >= 0)),
	CONSTRAINT `CC2` CHECK ((`PRICE` >= 0.0))
);
INSERT INTO `nested`.parts VALUES(10506,'Pulley',200,19.99,20);

INSERT INTO `nested`.parts VALUES(10507,'Inclined plane',156,19.99,20);

INSERT INTO `nested`.parts VALUES(10508,'Wheel barrel',190,19.99,20);

INSERT INTO `nested`.parts VALUES(10509,'Gears',60,19.99,20);

INSERT INTO `nested`.parts VALUES(10601,'Callipers',300,24.99,20);

INSERT INTO `nested`.parts VALUES(10701,'Steel bar',120,19.99,30);

INSERT INTO `nested`.parts VALUES(10800,'Hinge',140,14.99,30);

-- 
CREATE TABLE `employees` (
	`ENO` INT(10) NOT NULL,
	`ENAME` VARCHAR(30) NOT NULL,
	`ZIP` INT(10) NOT NULL,
	`HDATE` DATE NOT NULL,
	PRIMARY KEY (`ENO`) USING BTREE,
	INDEX `FK__zipcodes` (`ZIP`) USING BTREE,

	CONSTRAINT `FK__zipcodes` FOREIGN KEY (`ZIP`) REFERENCES `nested`.`zipcodes` (`ZIP`) ON UPDATE NO ACTION ON DELETE NO ACTION
);
INSERT INTO `nested`.employees VALUES(1000,'Jones',71235,'1995-12-12');

INSERT INTO `nested`.employees VALUES(1001,'Smith',60606,'1992-01-01');

INSERT INTO `nested`.employees VALUES(1002,'Albert',50302,'1994-09-01');

INSERT INTO `nested`.employees VALUES(1003,'Brown',71235,'1995-10-10');

INSERT INTO `nested`.employees VALUES(1004,'Daniel',70000,'1994-05-15');

INSERT INTO `nested`.employees VALUES(1005,'Harry',70546,'1992-08-20');


CREATE TABLE `customers` (
	`CNO` INT(10) NOT NULL,
	`CNAME` VARCHAR(30) NOT NULL,
	`STREET` VARCHAR(40) NOT NULL,
	`ZIP` INT(10) NOT NULL,
	`PHONE` VARCHAR(12) NOT NULL,
	PRIMARY KEY (`CNO`) USING BTREE,
	INDEX `FK__zipcodes_2` (`ZIP`) USING BTREE,
	CONSTRAINT `FK__zipcodes_2` FOREIGN KEY (`ZIP`) REFERENCES `nested`.`zipcodes` (`ZIP`) ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO `nested`.customers VALUES(1111,'Charles','123 Main St',67226,'316-636-5555');

INSERT INTO `nested`.customers VALUES(2222,'Bertram','237 Ash Avenue',71235,'456-686-5444');

INSERT INTO `nested`.customers VALUES(3333,'Bayross','111 Inwood St',68231,'316-111-1234');

INSERT INTO `nested`.customers VALUES(4444,'Tom','56 Canning St',70000,'316-122-1274');

INSERT INTO `nested`.customers VALUES(5555,'Matthew','14 Gun Avenue',71235,'316-148-2874');

INSERT INTO `nested`.customers VALUES(6666,'Alex','17 Ivan Avenue',60606,'316-258-2994');

INSERT INTO `nested`.customers VALUES(7777,'Stuart','44 Burns Road',70546,'316-544-7612');
--
CREATE TABLE `orders` (
	`ONO` INT(10) NOT NULL,
	`CNO` INT(10) NOT NULL,
	`ENO` INT(10) NOT NULL,
	`PRECEIVED` DATE NULL DEFAULT NULL,
	`SHIPPED` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`ONO`) USING BTREE,
	INDEX `FK__customers` (`CNO`) USING BTREE,
	INDEX `FK__employees` (`ENO`) USING BTREE,
	CONSTRAINT `FK__customers` FOREIGN KEY (`CNO`) REFERENCES `nested`.`customers` (`CNO`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK__employees` FOREIGN KEY (`ENO`) REFERENCES `nested`.`employees` (`ENO`) ON UPDATE NO ACTION ON DELETE NO ACTION

);
INSERT INTO `nested`.orders VALUES(1020,1111,1000,'1994-12-10','1994-12-12');

INSERT INTO `nested`.orders VALUES(1021,1111,1000,'1995-01-12','1995-01-15');

INSERT INTO `nested`.orders VALUES(1022,2222,1001,'1995-02-13',NULL);

INSERT INTO `nested`.orders VALUES(1023,3333,1000,'1997-06-20','1997-06-22');

INSERT INTO `nested`.orders VALUES(1024,4444,1002,'1995-10-02',NULL);




CREATE TABLE `odetails` (
	`ONO` INT(10) NULL DEFAULT NULL,
	`PNO` INT(10) NULL DEFAULT NULL,
	`QTY` INT(10) NULL DEFAULT NULL,
	INDEX `FK__orders` (`ONO`) USING BTREE,
	INDEX `FK__parts` (`PNO`) USING BTREE,
	CONSTRAINT `FK__orders` FOREIGN KEY (`ONO`) REFERENCES `nested`.`orders` (`ONO`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK__parts` FOREIGN KEY (`PNO`) REFERENCES `nested`.`parts` (`PNO`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `CO1` CHECK ((`QTY` > 0))
);
INSERT INTO `nested`.odetails VALUES(1020,10506,1);

INSERT INTO `nested`.odetails VALUES(1020,10507,1);

INSERT INTO `nested`.odetails VALUES(1020,10508,2);

INSERT INTO `nested`.odetails VALUES(1020,10601,3);

INSERT INTO `nested`.odetails VALUES(1021,10601,4);

INSERT INTO `nested`.odetails VALUES(1022,10601,1);

INSERT INTO `nested`.odetails VALUES(1022,10701,1);

INSERT INTO `nested`.odetails VALUES(1023,10800,1);

INSERT INTO `nested`.odetails VALUES(1024,10508,3);

INSERT INTO `nested`.odetails VALUES(1024,10601,2);




