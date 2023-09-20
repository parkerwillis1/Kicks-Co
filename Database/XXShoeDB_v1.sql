-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: shoeshopping
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `cust_ID` int NOT NULL,
  `C_FirstName` varchar(45) DEFAULT NULL,
  `C_LastName` varchar(45) DEFAULT NULL,
  `C_Address` varchar(100) DEFAULT NULL,
  `C_Email` varchar(80) DEFAULT NULL,
  `C_DoB` date DEFAULT NULL,
  PRIMARY KEY (`cust_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Abel','Yuqen','45875 Brightbridge Street','SonofYuqen@gmail.com','1990-11-26'),(2,'Franz','Reti','32685 Cycle Circle','FranzTheGreat@gmail.com','1981-03-14'),(3,'Ruben','Thanada','12358 Enduring Path','ThanaBanana@yahoo.com','1994-01-21'),(4,'Alicia','Kant','48981 Oaks Canyon','MrsKant@gmail.com','1966-09-14'),(5,'Manlia','Alam','74336 Bench Street','ListingAlarm@yahoo.com','1974-10-24'),(6,'Erato','Gupta','81131 Market Avenue','EGLLC@gmail.com','1990-05-23'),(7,'Jasos','Khalil','4587 Lincoln Drive','BestJasos@gmail.com','1984-01-04'),(8,'Edgar','Idwal','68122 Open Forest','MoonShoe@yahoo.com','1988-03-22'),(9,'Gi','Severina','77988 Column Court','GiGi123@gmail.com','1974-12-02'),(10,'Livia','Yusuf','15742 Sinking Sea','MsLiv@yahoo.com','1974-08-14');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `discounts_ID` int NOT NULL,
  `Percentage` float DEFAULT NULL,
  PRIMARY KEY (`discounts_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (0,0),(1,0.1),(2,0.25),(3,0.35),(4,0.45);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inv_ID` int NOT NULL,
  `SaleStatus` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Shoes_shoes_ID` int NOT NULL,
  PRIMARY KEY (`inv_ID`),
  KEY `fk_Inventory_Shoes_idx` (`Shoes_shoes_ID`),
  CONSTRAINT `fk_Inventory_Shoes` FOREIGN KEY (`Shoes_shoes_ID`) REFERENCES `shoes` (`shoes_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,0,10,1),(2,0,10,2),(3,0,15,3),(4,0,10,4),(5,0,8,5);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_ID` int NOT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `OrderStatus` int DEFAULT NULL,
  `TotalAmount` float DEFAULT NULL,
  `Inventory_inv_ID` int NOT NULL,
  `staff_staff_ID` int NOT NULL,
  `customers_cust_ID` int NOT NULL,
  `discounts_discounts_ID` int NOT NULL,
  PRIMARY KEY (`order_ID`,`Inventory_inv_ID`),
  KEY `fk_Orders_staff1_idx` (`staff_staff_ID`),
  KEY `fk_Orders_customers1_idx` (`customers_cust_ID`),
  KEY `fk_Orders_discounts1_idx` (`discounts_discounts_ID`),
  KEY `fk_Orders_Inventory1_idx` (`Inventory_inv_ID`),
  CONSTRAINT `fk_Orders_customers1` FOREIGN KEY (`customers_cust_ID`) REFERENCES `customers` (`cust_ID`),
  CONSTRAINT `fk_Orders_discounts1` FOREIGN KEY (`discounts_discounts_ID`) REFERENCES `discountcodes` (`discounts_ID`),
  CONSTRAINT `fk_Orders_Inventory1` FOREIGN KEY (`Inventory_inv_ID`) REFERENCES `mydb`.`inventory` (`inv_ID`),
  CONSTRAINT `fk_Orders_staff1` FOREIGN KEY (`staff_staff_ID`) REFERENCES `staff` (`staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2019-10-29 14:56:59',0,300.55,1,1,3,0),(2,'2019-11-12 10:32:10',0,105.55,2,2,5,0),(3,'2019-11-24 13:01:45',0,540.45,3,2,8,0),(4,'2019-12-08 07:43:22',0,360,1,3,2,1),(4,'2019-12-02 09:13:55',0,75.55,4,4,1,0),(5,'2019-12-11 18:30:21',0,1242.95,5,7,4,0),(6,'2019-12-21 12:06:57',0,212.56,3,6,6,2),(7,'2019-12-24 09:40:13',0,90.96,2,8,7,0),(8,'2019-12-24 15:23:07',0,173.45,5,3,5,4),(9,'2020-01-13 09:51:39',0,75.33,4,1,10,0),(10,'2020-01-25 20:42:19',0,966.41,1,10,6,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoes`
--

DROP TABLE IF EXISTS `shoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoes` (
  `shoes_ID` int NOT NULL,
  `Name` varchar(80) DEFAULT NULL,
  `Brand` varchar(25) DEFAULT NULL,
  `Size` int DEFAULT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Image` blob,
  PRIMARY KEY (`shoes_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoes`
--

LOCK TABLES `shoes` WRITE;
/*!40000 ALTER TABLE `shoes` DISABLE KEYS */;
INSERT INTO `shoes` VALUES (1,'Chuck 70','Converse',5,'Red',85.55,''),(2,'FuelCell','New Balance',7,'Blue',75.99,''),(3,'UltraBoost','Adidas',11,'Black',105.55,''),(4,'ThunderCats','Puma',9,'White',59.99,''),(5,'Air Jordon','Nike',8,'Green',120,'');
/*!40000 ALTER TABLE `shoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_ID` int NOT NULL,
  `ST_FirstName` varchar(45) DEFAULT NULL,
  `ST_LastName` varchar(45) DEFAULT NULL,
  `ST_Address` varchar(100) DEFAULT NULL,
  `ST_Email` varchar(80) DEFAULT NULL,
  `ST_DoB` date DEFAULT NULL,
  PRIMARY KEY (`staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Charlie','Baker','15648 Bend Street','CBaker@gmail.com','1981-01-19'),(2,'Heather','Wonder','12348 Yule Drive','WonderWoman@gmail.com','1993-04-12'),(3,'David','Brash','75479 Canyon Oaks','BigBrash@yahoo.com','1991-12-30'),(4,'Monica','Liu','13993 Benard Avenue','TheM@gmail.com','2003-06-24'),(5,'Dion','Tempest','11404 State Court','StormingD@yahoo.com','1989-02-13'),(6,'Emily','Vega','361 Maple Oak Drive','EmilyVega@yahoo.com','2001-03-10'),(7,'Momo','Harb','12348 Cinnamon Street','HarbBro@gmail.com','1987-11-15'),(8,'Kasto','Issa','7845 Ember Creek','RollingIssa@yahoo.com','1989-05-07'),(9,'Leah','Tind','6671 Fig Leaf Drive','TindofLife@gmail.com','2005-08-30'),(10,'Nzo','Rubis','71265 Washington Avenue','TopBrassNzo@yahoo.com','1988-07-16');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-28 16:04:22
