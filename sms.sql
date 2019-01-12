-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sms
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,'Management Assistant'),(2,'Finance Manager'),(3,'IT Manager'),(4,'System Analyst'),(5,'System Administrator'),(6,'FInance Cleark'),(7,'Directer'),(8,'IT Cleark'),(9,'Store Keeper'),(10,'Store Manager');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `head_employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_division_employee1_idx` (`head_employee_id`),
  CONSTRAINT `fk_division_employee1` FOREIGN KEY (`head_employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'IT',1),(6,'Stores',1),(7,'HR',1),(8,'Marketing',1),(9,'Finance',3),(10,'Administration',1);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(12) NOT NULL,
  `title_id` int(11) NOT NULL,
  `initials` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `full_name` varchar(191) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nic` varchar(15) DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  `marital_status_id` int(11) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `land` varchar(15) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `designation_id` int(11) NOT NULL,
  `date_of_join` date DEFAULT NULL,
  `img_url` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `division_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_title_idx` (`title_id`),
  KEY `fk_employee_gender1_idx` (`gender_id`),
  KEY `fk_employee_marital_status1_idx` (`marital_status_id`),
  KEY `fk_employee_designation1_idx` (`designation_id`),
  KEY `fk_employee_division1_idx` (`division_id`),
  CONSTRAINT `fk_employee_designation1` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`),
  CONSTRAINT `fk_employee_division1` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`),
  CONSTRAINT `fk_employee_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_employee_marital_status1` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_status` (`id`),
  CONSTRAINT `fk_employee_title` FOREIGN KEY (`title_id`) REFERENCES `title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'2018/001',1,'HLPM','Madhushanka','Hewa Lunuvilage Prageeth Madhawa Madhushanka','1992-03-21','920811213V',1,2,'No 88,\r\nKanaththa Road,\r\nNaligama,\r\nMirigama.','0715902443','0332274361','pra@i3cubes.com',5,'1984-04-03','img/users\\19912298.jpg','2018-07-31 03:18:45','2018-11-21 11:50:46',NULL,1),(2,'2018/002',1,'SDN','Kumara','Sirisenage Dhanoj Nuwan Kumara','1980-12-05','806343568V',1,1,'No 77,\r\nMirigama,\r\nGampaha','0750022346','0114720511','dir@i3cubes.com',7,'2001-11-07','img/users\\002.jpg','2018-11-21 10:24:23','2018-11-21 10:41:43',NULL,10),(3,'2018/003',1,'D','Subaneethan','Durairaj Subaneethan','1981-11-11','811234567V',1,2,'No 288,\r\nColombo 7.','0771880209','0332273224','ufm@i3cubes.com',2,'2002-09-10','img/users\\.jpg','2018-11-21 10:28:15','2018-11-22 01:13:34',NULL,10),(4,'2018/004',2,'WNH','Fernando','Weerahannedige Nelini Hareendri Fernando','1977-11-03','884545445V',2,1,'No 89,\r\nJosop Road,\r\nMalabe.','0728136805','0332284325','ufc@i3cubes.com',6,'2007-10-17','img/users\\004.jpg','2018-11-21 10:46:59','2018-11-22 01:13:04',NULL,9),(5,'2018/005',1,'WHKNC','Marcus','Wickrama Hetti Konnehelage Nethmina Chiran Marcus','1991-09-25','913456783V',1,1,'No 34,\r\nMel Road,\r\nColombo 6.','0783454321','0116734563','whk@i3cubes.com',3,'1994-10-04','img/users\\005.jpg','2018-11-21 10:51:38','2018-11-21 10:51:38',NULL,1),(6,'2018/006',2,'DS','Kodikara','Dunara Sasindi Kodikara','1987-06-24','879022345V',2,2,'No 55,\r\n1 Lane,\r\nColombo 8','0779865378','0115473576','dsk@i3cubes.com',8,'2014-11-04','img/users\\006.jpg','2018-11-21 11:13:23','2018-11-21 11:13:23',NULL,1),(7,'2018/008',3,'TGA','Dewmini','Thudugala Gamage Amavi Dewmini','1989-09-20','893456345V',2,2,'No 99,\r\nMalabe.','0728763452','0120835627','tga@i3cubes.com',1,'2018-11-02','img/users\\008.jpg','2018-11-21 11:18:14','2018-11-21 11:18:14',NULL,6),(8,'2018/007',1,'LADH','Premaratne','Lekam Appuhamilage Dona Hansika Premaratne','1986-09-30','860923456V',1,1,'No 67,\r\nGamage road,\r\nColombo 5.','0711880209','0354720511','usk@i3cubes.com',9,'2016-10-03','img/users\\007.jpg','2018-11-21 11:26:38','2018-11-22 01:14:01',NULL,6),(9,'2019/009',1,'SPAJCB','Samarakoon','Samarakoon Perumbulli Arachchilage Janaka Chamodh Bandara Samarakoon','1974-12-17','749802356V',1,1,'No 67,\r\nGolden road,\r\nMalabe.','0716745321','0563456278','spa@i3cubes.com',1,'2012-11-07','img/users\\009.jpg','2018-11-21 11:31:06','2018-11-21 11:31:06',NULL,7),(10,'2018/010',2,'TNA','Akmeemana','Thanusha Nadeeshan Akmeemana','1988-10-04','889034567V',2,1,'No 45,\r\nNaligama,\r\nVeyangoda.','0777456610','0459845234','tna@i3cubes.com',4,'2016-10-04','img/users\\010.jpg','2018-11-21 11:37:53','2018-11-21 11:37:53',NULL,1),(11,'2018/011',2,'JS','Wijesekara','Januki Sihara Wijesekara','1992-10-14','920123364V',2,1,'No 367,\r\nMiriswaththa,\r\nGampaha.','0718136805','0557878352','usm@i3cubes.com',10,'2018-11-01','img/users\\011.jpg','2018-11-21 11:40:49','2018-11-22 01:14:29',NULL,6),(12,'2018/012',2,'HJP','Perera','Hettige Janith Prasanga Perera','1992-11-06','928765432V',2,1,'No 22,\r\nColombo.','0715633451','0114536721','hjp@i3cubes.com',1,'2018-11-07','img/users\\012.JPG','2018-11-21 12:24:34','2018-11-21 12:24:34',NULL,8);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inventory_product1_idx` (`product_id`),
  KEY `fk_inventory_stock1_idx` (`stock_id`),
  CONSTRAINT `fk_inventory_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_inventory_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (31,20,69,90),(32,28,69,100),(33,25,69,50),(34,23,69,9),(35,24,69,4),(36,15,69,500),(37,14,69,500);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type_id` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `users_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_log_type1_idx` (`log_type_id`),
  KEY `fk_log_users1_idx` (`users_id`),
  CONSTRAINT `fk_log_log_type1` FOREIGN KEY (`log_type_id`) REFERENCES `log_type` (`id`),
  CONSTRAINT `fk_log_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (150,1,'2018-11-21 09:28:48','User Role has updated. Added new permissions.',10),(151,1,'2018-11-21 10:05:45','Employee Created - EmpID - 2018/001',10),(152,1,'2018-11-21 10:15:48','Employee Updated - EmpID - 2018/001',10),(153,1,'2018-11-21 10:15:57','Employee Updated - EmpID - 2018/001',10),(154,1,'2018-11-21 10:17:00','Employee Updated - EmpID - 2018/001',10),(155,1,'2018-11-21 10:17:09','Employee Updated - EmpID - 2018/001',10),(156,1,'2018-11-21 10:17:14','Employee Updated - EmpID - 2018/001',10),(157,1,'2018-11-21 10:17:44','Employee Updated - EmpID - 2018/001',10),(158,1,'2018-11-21 10:24:23','Employee Created - EmpID - 2018/002',10),(159,1,'2018-11-21 10:28:15','Employee Created - EmpID - 2018/003',10),(160,1,'2018-11-21 10:38:02','Employee Updated - EmpID - 2018/001',10),(161,1,'2018-11-21 10:41:43','Employee Updated - EmpID - 2018/002',10),(162,1,'2018-11-21 10:46:59','Employee Created - EmpID - 2018/004',10),(163,1,'2018-11-21 10:51:38','Employee Created - EmpID - 2018/005',10),(164,1,'2018-11-21 11:13:23','Employee Created - EmpID - 2018/006',10),(165,1,'2018-11-21 11:18:02','Employee Created - EmpID - 2018/007',10),(166,1,'2018-11-21 11:18:14','Employee Created - EmpID - 2018/008',10),(167,1,'2018-11-21 11:18:39','Employee Deleted - EmpID - 2018/007',10),(168,1,'2018-11-21 11:26:38','Employee Created - EmpID - 2018/007',10),(169,1,'2018-11-21 11:31:06','Employee Created - EmpID - 2019/009',10),(170,1,'2018-11-21 11:34:11','Employee Created - EmpID - 2018/010',10),(171,1,'2018-11-21 11:37:53','Employee Created - EmpID - 2018/010',10),(172,1,'2018-11-21 11:40:49','Employee Created - EmpID - 2018/011',10),(173,1,'2018-11-21 11:42:54','Employee Updated - EmpID - 2018/007',10),(174,1,'2018-11-21 11:50:46','Employee Updated - EmpID - 19912298',10),(175,1,'2018-11-21 12:24:34','Employee Created - EmpID - 2018/012',10),(176,1,'2018-11-21 12:48:44','User account updated',10),(177,1,'2018-11-21 12:51:32','New Role created.',10),(178,1,'2018-11-21 12:53:03','New Role created.',10),(179,1,'2018-11-21 12:55:00','New Role created.',10),(180,1,'2018-11-21 12:55:54','New Role created.',10),(181,1,'2018-11-21 12:58:10','New Role created.',10),(182,1,'2018-11-21 13:07:43','User account updated',10),(183,1,'2018-11-21 13:08:28','User Role has updated. Changed permissions.',10),(184,1,'2018-11-21 13:08:39','User Role has updated. Deleted permissions.',10),(185,1,'2018-11-21 13:08:41','User Role has updated. Deleted permissions.',10),(186,1,'2018-11-21 13:08:42','User Role has updated. Deleted permissions.',10),(187,1,'2018-11-21 13:08:43','User Role has updated. Deleted permissions.',10),(188,1,'2018-11-21 13:08:45','User Role has updated. Deleted permissions.',10),(189,1,'2018-11-21 13:08:47','User Role has updated. Deleted permissions.',10),(190,1,'2018-11-21 13:08:48','User Role has updated. Deleted permissions.',10),(191,1,'2018-11-21 13:08:49','User Role has updated. Deleted permissions.',10),(192,1,'2018-11-21 13:09:10','User Role has updated. Changed permissions.',10),(193,1,'2018-11-21 14:09:39','User account created',10),(194,1,'2018-11-21 14:14:21','Employee Updated - EmpID - 2018/011',10),(195,1,'2018-11-21 14:15:52','User account created',10),(196,1,'2018-11-21 23:00:29','Product Created - Product Code - CON/SPI/001',10),(197,1,'2018-11-21 23:03:12','Product Created - Product Code - ASS/ELO/001',10),(198,1,'2018-11-21 23:05:25','Product Created - Product Code - ASS/ELO/002',10),(199,1,'2018-11-21 23:06:27','Product Updated - Product Code - CON/SPI/001',10),(200,1,'2018-11-21 23:07:48','Product Updated - Product Code - CON/SPI/001',10),(201,1,'2018-11-21 23:17:19','Product Updated - Product Code - CON-SPI-001',10),(202,1,'2018-11-21 23:21:50','Product Created - Product Code - CON-SPI-002',10),(203,1,'2018-11-21 23:23:07','Product Updated - Product Code - ASS-ELO-001',10),(204,1,'2018-11-21 23:23:25','Product Updated - Product Code - ASS-ELO-002',10),(205,1,'2018-11-21 23:28:24','Product Created - Product Code - ASS-ELO-003',10),(206,1,'2018-11-21 23:31:31','Product Created - Product Code - ASS-ELO-003',10),(207,1,'2018-11-21 23:34:14','Product Created - Product Code - ASS-ELO-004',10),(208,1,'2018-11-21 23:35:30','Product Created - Product Code - ASS-ELO-005',10),(209,1,'2018-11-21 23:37:31','Product Created - Product Code - ASS-ELO-006',10),(210,1,'2018-11-21 23:41:18','Product Created - Product Code - CON-STA-001',10),(211,1,'2018-11-21 23:42:18','Product Created - Product Code - CON-STA-002',10),(212,1,'2018-11-21 23:45:22','Product Created - Product Code - CON-STA-003',10),(213,1,'2018-11-21 23:55:56','Employee Updated - EmpID - 2018/008',10),(214,1,'2018-11-22 00:43:33','Product Updated - Product Code - CON-STA-003',10),(215,1,'2018-11-22 00:44:51','Product Created - Product Code - CON-STA-004',10),(216,1,'2018-11-22 00:46:34','Product Created - Product Code - CON-STA-005',10),(217,1,'2018-11-22 00:48:07','Product Created - Product Code - CON-STA-006',10),(218,1,'2018-11-22 00:49:09','Product Created - Product Code - CON-STA-007',10),(219,1,'2018-11-22 00:53:22','Product Created - Product Code - ASS-FER-002',10),(220,1,'2018-11-22 00:55:00','Product Created - Product Code - ASS-FER-044',10),(221,1,'2018-11-22 00:56:12','Product Created - Product Code - ASS-FER-003',10),(222,1,'2018-11-22 00:58:37','Product Created - Product Code - ASS-KTH-001',10),(223,1,'2018-11-22 01:01:53','Product Created - Product Code - CON-CLE-001',10),(224,1,'2018-11-22 01:02:49','Product Created - Product Code - CON-CLE-002',10),(225,1,'2018-11-22 01:05:24','Product Created - Product Code - CON-SPI-003',10),(226,1,'2018-11-22 01:05:24','Product Created - Product Code - CON-SPI-003',10),(227,1,'2018-11-22 01:06:44','Product Created - Product Code - CON-SPI-004',10),(228,1,'2018-11-22 01:08:19','Product Created - Product Code - CON-ELT-001',10),(229,1,'2018-11-22 01:10:48','User account created',10),(230,1,'2018-11-22 01:11:27','User account created',10),(231,1,'2018-11-22 01:13:04','Employee Updated - EmpID - 2018/004',10),(232,1,'2018-11-22 01:13:34','Employee Updated - EmpID - 2018/003',10),(233,1,'2018-11-22 01:14:01','Employee Updated - EmpID - 2018/007',10),(234,1,'2018-11-22 01:14:29','Employee Updated - EmpID - 2018/011',10),(235,1,'2018-11-22 01:22:21','User account updated',10),(236,1,'2018-11-22 01:22:39','User account updated',10),(237,1,'2018-11-22 01:23:10','User account updated',10),(238,1,'2018-11-22 01:23:23','User account updated',10),(239,1,'2018-11-22 01:26:38','User Role has updated. Changed permissions.',10),(240,1,'2018-11-22 01:29:39','User Role has updated. Changed permissions.',10),(241,1,'2018-11-22 01:31:00','User Role has updated. Deleted permissions.',10),(242,1,'2018-11-22 01:40:00','Product Updated - Product Code - ASS-ELO-066',10),(243,1,'2018-11-22 01:41:08','Stock request added - stock request number - SRN0001',15),(244,1,'2018-11-22 01:44:37','User Role has updated. Changed permissions.',10),(245,1,'2018-11-22 02:03:38','Stock request added - stock request number - SRN0002',15),(246,1,'2018-11-22 02:13:36','Stock request added - stock request approved - SRN0001',16),(247,1,'2018-11-22 06:02:48','New stock added - Stock number - SN001',15),(248,1,'2018-11-22 06:08:33','Requested new products - Request number - RQ181122001',17),(249,1,'2018-11-22 06:10:12','User Role has updated. Changed permissions.',10),(250,1,'2018-11-22 06:15:11','Requested new products - Request number - RQ181122002',17),(251,1,'2018-11-22 06:16:20','User Role has updated. Changed permissions.',10),(252,1,'2018-11-22 06:16:37','User Role has updated. Deleted permissions.',10),(253,1,'2018-11-22 06:19:20','User Role has updated. Changed permissions.',10),(254,1,'2018-11-22 06:33:44','Product request approved - Request number - RQ181122002',18),(255,1,'2018-11-22 06:35:57','Product request confirmed - Request number - RQ181122002',16),(256,1,'2018-11-22 06:37:05','Products Issued - request ID - 24',15),(257,1,'2018-11-22 12:30:32','Requested new products - Request number - RQ181122003',17),(258,1,'2018-11-22 12:30:48','Product request approved - Request number - RQ181122003',18),(259,1,'2018-11-22 12:31:11','Product request confirmed - Request number - RQ181122003',16),(260,1,'2018-11-22 12:32:01','Products Issued - request ID - 25',15),(261,1,'2018-11-22 12:32:21','Products Issued - request ID - 25',15),(262,1,'2018-11-22 13:00:00','Requested new products - Request number - RQ181122004',17),(263,1,'2018-11-22 13:00:24','Product request approved - Request number - RQ181122004',18),(264,1,'2018-11-22 13:01:14','Product request confirmed - Request number - RQ181122004',16),(265,1,'2018-11-22 13:01:32','Products Issued - request ID - 26',15),(266,1,'2018-11-22 14:16:04','Product Updated - Product Code - CON-STA-007',10),(267,1,'2018-11-22 14:23:04','Stock request added - stock request number - SRN0004',15);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_type`
--

DROP TABLE IF EXISTS `log_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_type`
--

LOCK TABLES `log_type` WRITE;
/*!40000 ALTER TABLE `log_type` DISABLE KEYS */;
INSERT INTO `log_type` VALUES (1,'ACTIVITY'),(2,'ERROR'),(3,'WARNING');
/*!40000 ALTER TABLE `log_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marital_status`
--

DROP TABLE IF EXISTS `marital_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marital_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marital_status`
--

LOCK TABLES `marital_status` WRITE;
/*!40000 ALTER TABLE `marital_status` DISABLE KEYS */;
INSERT INTO `marital_status` VALUES (1,'Married'),(2,'Not Married');
/*!40000 ALTER TABLE `marital_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'User'),(2,'Role'),(3,'Employee'),(4,'Log'),(5,'Supplier'),(6,'Product'),(7,'Stock'),(8,'Inventory'),(10,'Admin');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_has_permissions`
--

DROP TABLE IF EXISTS `module_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `module_has_permissions` (
  `module_id` int(11) NOT NULL,
  `permissions_id` int(11) NOT NULL,
  PRIMARY KEY (`module_id`,`permissions_id`),
  KEY `fk_module_has_permissions_permissions1_idx` (`permissions_id`),
  KEY `fk_module_has_permissions_module1_idx` (`module_id`),
  CONSTRAINT `fk_module_has_permissions_module1` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`),
  CONSTRAINT `fk_module_has_permissions_permissions1` FOREIGN KEY (`permissions_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_has_permissions`
--

LOCK TABLES `module_has_permissions` WRITE;
/*!40000 ALTER TABLE `module_has_permissions` DISABLE KEYS */;
INSERT INTO `module_has_permissions` VALUES (1,1),(2,1),(3,1),(5,1),(6,1),(7,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(1,3),(2,3),(3,3),(5,3),(6,3),(2,4),(3,4),(6,5),(6,6),(6,7),(6,8),(6,9),(7,10),(7,11),(7,12),(7,13),(10,14);
/*!40000 ALTER TABLE `module_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nature_of_business`
--

DROP TABLE IF EXISTS `nature_of_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nature_of_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nature_of_business`
--

LOCK TABLES `nature_of_business` WRITE;
/*!40000 ALTER TABLE `nature_of_business` DISABLE KEYS */;
INSERT INTO `nature_of_business` VALUES (1,'Sole Proprietorship'),(2,'Partnership'),(3,'Corporation'),(4,'Limited Liability Company'),(5,'Cooperative');
/*!40000 ALTER TABLE `nature_of_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Create'),(2,'View'),(3,'Edit'),(4,'Delete'),(5,'Approve Product Request'),(6,'Confirm Product Request'),(7,'Issue Products'),(8,'View Product Request'),(9,'Create Product Request'),(10,'Approve Stock Request'),(11,'Create Stock Request'),(12,'View Stock Request'),(13,'Download Stock Request'),(14,'Admin');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_privileges_role1_idx` (`role_id`),
  KEY `fk_privileges_module1_idx` (`module_id`),
  CONSTRAINT `fk_privileges_module1` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_privileges_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (16,1,6),(34,7,6),(35,8,1),(36,8,3),(37,8,5),(38,8,6),(39,8,7),(40,8,8),(41,9,1),(43,9,5),(44,9,6),(45,9,7),(46,9,8),(47,10,6),(48,11,1),(49,11,2),(50,11,3),(51,11,4),(52,11,5),(53,11,6),(54,11,7),(55,11,8),(56,11,10);
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges_has_permissions`
--

DROP TABLE IF EXISTS `privileges_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `privileges_has_permissions` (
  `privileges_id` int(11) NOT NULL,
  `permissions_id` int(11) NOT NULL,
  PRIMARY KEY (`privileges_id`,`permissions_id`),
  KEY `fk_privileges_has_permissions_permissions1_idx` (`permissions_id`),
  KEY `fk_privileges_has_permissions_privileges1_idx` (`privileges_id`),
  CONSTRAINT `fk_privileges_has_permissions_permissions1` FOREIGN KEY (`permissions_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_privileges_has_permissions_privileges1` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges_has_permissions`
--

LOCK TABLES `privileges_has_permissions` WRITE;
/*!40000 ALTER TABLE `privileges_has_permissions` DISABLE KEYS */;
INSERT INTO `privileges_has_permissions` VALUES (36,1),(37,1),(38,1),(39,1),(43,1),(44,1),(45,1),(48,1),(49,1),(50,1),(52,1),(53,1),(54,1),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(43,2),(44,2),(45,2),(46,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(36,3),(37,3),(38,3),(43,3),(44,3),(48,3),(49,3),(50,3),(52,3),(53,3),(49,4),(50,4),(34,5),(38,5),(53,5),(38,6),(53,6),(38,7),(44,7),(53,7),(38,8),(44,8),(53,8),(16,9),(47,9),(53,9),(39,10),(54,10),(39,11),(45,11),(54,11),(39,12),(45,12),(54,12),(39,13),(45,13),(54,13),(56,14);
/*!40000 ALTER TABLE `privileges_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `product_sub_category_id` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `product_status_id` int(11) NOT NULL,
  `product_code` varchar(45) DEFAULT NULL,
  `asset_code` varchar(255) DEFAULT NULL,
  `barcode` varchar(45) DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `critical_reorder_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_product_sub_category1_idx` (`product_sub_category_id`),
  KEY `fk_product_product_type1_idx` (`product_type_id`),
  KEY `fk_product_product_status1_idx` (`product_status_id`),
  CONSTRAINT `fk_product_product_status1` FOREIGN KEY (`product_status_id`) REFERENCES `product_status` (`id`),
  CONSTRAINT `fk_product_product_sub_category1` FOREIGN KEY (`product_sub_category_id`) REFERENCES `product_sub_category` (`id`),
  CONSTRAINT `fk_product_product_type1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5,'Portable Hard Disk',20,1,'CON-SPI-001','Western Digital 1 TB','img/products\\CON-SPI-001.jpg',1,NULL,NULL,'00121',5,2),(6,'Moniter',20,2,'ASS-ELO-001','14 inch','img/products\\ASS-ELO-001.jpg',1,NULL,'ASS/2018-01/001','80001',10,3),(7,'Moniter',20,2,'ASS-ELO-002','HP 21\"','img/products\\002.jpg',1,NULL,'ASS/2018-2/001','23345',15,10),(8,'Portable Hard Disk',25,1,'CON-SPI-002','Transcend 500GB','img/products\\CON-SPI-002.jpg',1,NULL,NULL,'01123',8,4),(9,'All In One',20,2,'ASS-ELO-003','DELL','img/products\\ASS-ELO-003.jpg',2,NULL,'ASS/2018-03/002','12345',2,1),(10,'All In One Dell',20,2,'ASS-ELO-066','DeLL','img/products\\ASS-ELO-003.jpg',1,NULL,'ASS/2018-03/003','45678',3,1),(11,'Laptop',20,2,'ASS-ELO-004','I5, 15.5 inch','img/products\\ASS-ELO-004.jpg',1,NULL,'ASS/2018-03/004','34523',2,1),(12,'Laptop',20,2,'ASS-ELO-005','I7 , 14 inch','img/products\\ASS-ELO-005.jpg',1,NULL,'ASS/2018-03/005','23533',2,1),(13,'MAC',20,2,'ASS-ELO-006','I7 , 24 inch','img/products\\ASS-ELO-006.jpg',1,NULL,'ASS/2018-3/006','67855',5,2),(14,'A3 Paper',8,1,'CON-STA-001','White A3 Paper Packets','img/products\\CON-STA-001.jpg',1,NULL,NULL,'90001',100,50),(15,'A4 Paper',8,1,'CON-STA-002','White A4 Paper Packets','img/products\\CON-STA-002.jpg',1,NULL,NULL,'90023',200,50),(16,'Glue Pen',27,1,'CON-STA-003','Attles','img/products\\CON-STA-003.jpg',1,NULL,NULL,'90022',200,20),(17,'Pencile',9,1,'CON-STA-004','HP','img/products\\CON-STA-004.jpg',1,NULL,NULL,'45345',300,100),(18,'Scissor',27,1,'CON-STA-005',NULL,'img/products\\CON-STA-005.jpg',1,NULL,NULL,'12344',20,5),(19,'Stapler Machine',27,1,'CON-STA-006','Small','img/products\\CON-STA-006.jpg',1,NULL,NULL,'55667',50,10),(20,'Sticky Notes',27,1,'CON-STA-007','Small','img/products\\CON-STA-007.jpg',1,NULL,NULL,'34545',200,100),(21,'Fiber Chair',14,2,'ASS-FER-002','2 Arms with wheels','img/products\\ASS-FER-002.jpg',1,NULL,'ASS/2018-05/005','93000',1,0),(22,'Steal Chair',14,1,'ASS-FER-044','Steal Chair','img/products\\ASS-FER-044.jpg',1,NULL,NULL,'90123',1,0),(23,'Chair',14,2,'ASS-FER-003','Black Chair without Arms','img/products\\ASS-FER-003.jpg',1,NULL,'ASS/2018-05/006','90144',5,2),(24,'Boiller',29,2,'ASS-KTH-001','Steal','img/products\\ASS-KTH-001.jpg',1,NULL,'ASS/2018-03/025','90678',1,0),(25,'Dust Pan',17,1,'CON-CLE-001',NULL,'img/products\\CON-CLE-001.jpg',1,NULL,NULL,'87634',2,1),(26,'Soap',17,1,'CON-CLE-002','Dettol','img/products\\CON-CLE-002.jpg',1,NULL,NULL,'67354',20,5),(27,'Printer Cartridge',33,1,'CON-SPI-003','For 5580 Printer','img/products\\CON-SPI-003.jpg',1,NULL,NULL,'34345',4,2),(28,'Printer Cartridge',33,1,'CON-SPI-003','For 5580 Printer','img/products\\CON-SPI-003.jpg',1,NULL,NULL,'34345',4,2),(29,'Printer Toner',33,1,'CON-SPI-004','for HP 1320','img/products\\CON-SPI-004.jpg',1,NULL,NULL,'45670',5,1),(30,'Power Extention Code',23,1,'CON-ELT-001','5M','img/products\\CON-ELT-001.jpg',1,NULL,NULL,'45465',10,8);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (6,'Stationary'),(7,'Furniture'),(8,'Other'),(9,'Kitchenware'),(10,'Cleaning Item'),(11,'Electronic Item'),(12,'Electric item'),(13,'Spare Parts');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_issue`
--

DROP TABLE IF EXISTS `product_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_request_id` int(11) NOT NULL,
  `issued_at` timestamp NULL DEFAULT NULL,
  `issued_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_issue_product_request1_idx` (`product_request_id`),
  KEY `fk_product_issue_employee1_idx` (`issued_by`),
  CONSTRAINT `fk_product_issue_employee1` FOREIGN KEY (`issued_by`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_product_issue_product_request1` FOREIGN KEY (`product_request_id`) REFERENCES `product_request` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_issue`
--

LOCK TABLES `product_issue` WRITE;
/*!40000 ALTER TABLE `product_issue` DISABLE KEYS */;
INSERT INTO `product_issue` VALUES (41,24,'2018-11-22 06:37:05',8),(42,25,'2018-11-22 12:32:01',8),(43,25,'2018-11-22 12:32:20',8),(44,26,'2018-11-22 13:01:31',8);
/*!40000 ALTER TABLE `product_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_issue_items`
--

DROP TABLE IF EXISTS `product_issue_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_issue_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_issue_id` int(11) NOT NULL,
  `product_request_items_id` int(11) NOT NULL,
  `stock_items_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_issue_items_product_issue1_idx` (`product_issue_id`),
  KEY `fk_product_issue_items_product_request_items1_idx` (`product_request_items_id`),
  KEY `fk_product_issue_items_stock_items1_idx` (`stock_items_id`),
  CONSTRAINT `fk_product_issue_items_product_issue1` FOREIGN KEY (`product_issue_id`) REFERENCES `product_issue` (`id`),
  CONSTRAINT `fk_product_issue_items_product_request_items1` FOREIGN KEY (`product_request_items_id`) REFERENCES `product_request_items` (`id`),
  CONSTRAINT `fk_product_issue_items_stock_items1` FOREIGN KEY (`stock_items_id`) REFERENCES `stock_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_issue_items`
--

LOCK TABLES `product_issue_items` WRITE;
/*!40000 ALTER TABLE `product_issue_items` DISABLE KEYS */;
INSERT INTO `product_issue_items` VALUES (43,41,39,NULL,1,50.00,3.00),(44,42,40,NULL,8,400.00,24.00),(45,43,40,NULL,2,100.00,6.00),(46,44,41,NULL,1,50.00,3.00);
/*!40000 ALTER TABLE `product_issue_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_issue_items_stocks`
--

DROP TABLE IF EXISTS `product_issue_items_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_issue_items_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_issue_items_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_issue_items_stocks_product_issue_items1_idx` (`product_issue_items_id`),
  KEY `fk_product_issue_items_stocks_stock1_idx` (`stock_id`),
  CONSTRAINT `fk_product_issue_items_stocks_product_issue_items1` FOREIGN KEY (`product_issue_items_id`) REFERENCES `product_issue_items` (`id`),
  CONSTRAINT `fk_product_issue_items_stocks_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_issue_items_stocks`
--

LOCK TABLES `product_issue_items_stocks` WRITE;
/*!40000 ALTER TABLE `product_issue_items_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_issue_items_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_request`
--

DROP TABLE IF EXISTS `product_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_request_number` varchar(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `requested_at` timestamp NULL DEFAULT NULL,
  `requested_by` int(11) DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `confirmed_by` int(11) DEFAULT NULL,
  `last_issued_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `divisional_head_id` int(11) DEFAULT NULL,
  `requested_division_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_request_employee1_idx` (`requested_by`),
  KEY `fk_product_request_employee2_idx` (`approved_by`),
  KEY `fk_product_request_employee3_idx` (`confirmed_by`),
  KEY `fk_product_request_employee4_idx` (`divisional_head_id`),
  KEY `fk_product_request_division1_idx` (`requested_division_id`),
  CONSTRAINT `fk_product_request_division1` FOREIGN KEY (`requested_division_id`) REFERENCES `division` (`id`),
  CONSTRAINT `fk_product_request_employee1` FOREIGN KEY (`requested_by`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_product_request_employee2` FOREIGN KEY (`approved_by`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_product_request_employee3` FOREIGN KEY (`confirmed_by`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_product_request_employee4` FOREIGN KEY (`divisional_head_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_request`
--

LOCK TABLES `product_request` WRITE;
/*!40000 ALTER TABLE `product_request` DISABLE KEYS */;
INSERT INTO `product_request` VALUES (23,'RQ181122001',NULL,'2018-11-22 06:08:33',4,NULL,NULL,NULL,NULL,NULL,NULL,3,9),(24,'RQ181122002',NULL,'2018-11-22 06:15:11',4,'2018-11-22 06:33:44',3,'2018-11-22 06:35:57',11,NULL,'2018-11-22 06:37:05',3,9),(25,'RQ181122003',NULL,'2018-11-22 12:30:32',4,'2018-11-22 12:30:48',3,'2018-11-22 12:31:11',11,NULL,'2018-11-22 12:32:21',3,9),(26,'RQ181122004',NULL,'2018-11-22 13:00:00',4,'2018-11-22 13:00:24',3,'2018-11-22 13:01:14',11,NULL,'2018-11-22 13:01:32',3,9);
/*!40000 ALTER TABLE `product_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_request_items`
--

DROP TABLE IF EXISTS `product_request_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_request_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_request_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `received_quantity` int(11) DEFAULT NULL,
  `last_received_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_request_items_product_request1_idx` (`product_request_id`),
  KEY `fk_product_request_items_product1_idx` (`product_id`),
  CONSTRAINT `fk_product_request_items_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_product_request_items_product_request1` FOREIGN KEY (`product_request_id`) REFERENCES `product_request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_request_items`
--

LOCK TABLES `product_request_items` WRITE;
/*!40000 ALTER TABLE `product_request_items` DISABLE KEYS */;
INSERT INTO `product_request_items` VALUES (38,23,23,2,NULL,NULL),(39,24,23,1,1,'2018-11-22 06:37:05'),(40,25,20,10,10,'2018-11-22 12:32:21'),(41,26,24,1,1,'2018-11-22 13:01:32');
/*!40000 ALTER TABLE `product_request_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_status`
--

DROP TABLE IF EXISTS `product_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_status`
--

LOCK TABLES `product_status` WRITE;
/*!40000 ALTER TABLE `product_status` DISABLE KEYS */;
INSERT INTO `product_status` VALUES (1,'Active'),(2,'Discontinued');
/*!40000 ALTER TABLE `product_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sub_category`
--

DROP TABLE IF EXISTS `product_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_sub_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `product_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_sub_category_product_category1_idx` (`product_category_id`),
  CONSTRAINT `fk_product_sub_category_product_category1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sub_category`
--

LOCK TABLES `product_sub_category` WRITE;
/*!40000 ALTER TABLE `product_sub_category` DISABLE KEYS */;
INSERT INTO `product_sub_category` VALUES (8,'Plain paper (for printer)',6),(9,'Pencil',6),(10,'Pen',6),(11,'Book',6),(12,'Table',7),(13,'Other',8),(14,'Chairs',7),(15,'Cupboard',7),(16,'Liquid',10),(17,'Solid',10),(18,'Plates',9),(19,'Mugs',9),(20,'Computer',11),(21,'Printer',11),(22,'Scaner',11),(23,'Power Code',12),(24,'Hard Disk',13),(25,'Peripheral Devices',11),(26,'Airconditioner',12),(27,'Other',6),(28,'Other',7),(29,'Other',9),(30,'Other',10),(31,'Other',11),(32,'Other',12),(33,'Other',13);
/*!40000 ALTER TABLE `product_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,'consumable'),(2,'assets');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'User'),(7,'Department Heads'),(8,'Store Manager'),(9,'Store Keeper'),(10,'Department Cleark'),(11,'System Administrator');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_number` varchar(45) DEFAULT NULL,
  `invoice_number` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `stock_request_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_supplier1_idx` (`supplier_id`),
  KEY `fk_stock_stock_request1_idx` (`stock_request_id`),
  KEY `fk_stock_employee1_idx` (`created_by`),
  CONSTRAINT `fk_stock_employee1` FOREIGN KEY (`created_by`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_stock_stock_request1` FOREIGN KEY (`stock_request_id`) REFERENCES `stock_request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stock_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (69,'SN001','SM-3000','2018-11-22',7,22,8);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_items`
--

DROP TABLE IF EXISTS `stock_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stock_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `stock_request_items_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `tax` decimal(6,2) DEFAULT NULL,
  `asset_code` varchar(255) DEFAULT NULL,
  `barcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_items_stock1_idx` (`stock_id`),
  KEY `fk_stock_items_stock_request_items1_idx` (`stock_request_items_id`),
  CONSTRAINT `fk_stock_items_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stock_items_stock_request_items1` FOREIGN KEY (`stock_request_items_id`) REFERENCES `stock_request_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_items`
--

LOCK TABLES `stock_items` WRITE;
/*!40000 ALTER TABLE `stock_items` DISABLE KEYS */;
INSERT INTO `stock_items` VALUES (107,69,116,50.00,100,3.00,NULL,NULL),(108,69,117,100.00,100,2.00,NULL,NULL),(109,69,118,20.00,50,0.00,NULL,NULL),(110,69,119,3000.00,10,10.00,NULL,NULL),(111,69,120,500.00,5,0.00,NULL,NULL),(112,69,121,400.00,500,0.00,NULL,NULL),(113,69,122,450.00,500,0.00,NULL,NULL);
/*!40000 ALTER TABLE `stock_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_request`
--

DROP TABLE IF EXISTS `stock_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stock_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_request_number` varchar(100) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `requested_by` int(11) DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_request_employee1_idx` (`requested_by`),
  KEY `fk_stock_request_employee2_idx` (`approved_by`),
  CONSTRAINT `fk_stock_request_employee1` FOREIGN KEY (`requested_by`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stock_request_employee2` FOREIGN KEY (`approved_by`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_request`
--

LOCK TABLES `stock_request` WRITE;
/*!40000 ALTER TABLE `stock_request` DISABLE KEYS */;
INSERT INTO `stock_request` VALUES (22,'SRN0001','2018-11-22 01:41:08',8,'2018-11-22 02:13:36',11,'2018-11-22 06:02:48',NULL),(23,'SRN0002','2018-11-22 02:03:38',8,NULL,NULL,NULL,NULL),(24,'SRN0004','2018-11-22 14:23:04',8,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stock_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_request_items`
--

DROP TABLE IF EXISTS `stock_request_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stock_request_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `stock_request_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `received_quantity` int(11) DEFAULT NULL,
  `last_recieved_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_request_items_product1_idx` (`product_id`),
  KEY `fk_stock_request_items_stock_request1_idx` (`stock_request_id`),
  CONSTRAINT `fk_stock_request_items_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stock_request_items_stock_request1` FOREIGN KEY (`stock_request_id`) REFERENCES `stock_request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_request_items`
--

LOCK TABLES `stock_request_items` WRITE;
/*!40000 ALTER TABLE `stock_request_items` DISABLE KEYS */;
INSERT INTO `stock_request_items` VALUES (115,8,23,10,NULL,NULL),(116,20,22,400,100,'2018-11-22'),(117,28,22,100,100,'2018-11-22'),(118,25,22,50,50,'2018-11-22'),(119,23,22,10,10,'2018-11-22'),(120,24,22,5,5,'2018-11-22'),(121,15,22,500,500,'2018-11-22'),(122,14,22,500,500,'2018-11-22'),(123,5,24,100,NULL,NULL);
/*!40000 ALTER TABLE `stock_request_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(45) DEFAULT NULL,
  `reciept_no` varchar(45) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `phone_1` varchar(15) DEFAULT NULL,
  `phone_2` varchar(15) DEFAULT NULL,
  `fax_1` varchar(15) DEFAULT NULL,
  `fax_2` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `business_reg_no` varchar(45) DEFAULT NULL,
  `business_reg_date` date DEFAULT NULL,
  `vat_no` varchar(45) DEFAULT NULL,
  `nature_of_business` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nature_of_business_id` int(11) NOT NULL,
  `is_active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_supplier_nature_of_business1_idx` (`nature_of_business_id`),
  CONSTRAINT `fk_supplier_nature_of_business1` FOREIGN KEY (`nature_of_business_id`) REFERENCES `nature_of_business` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (7,'DOC/2018/001','51381','Easyhome','0112078169',NULL,'0112078169',NULL,'easyhome.lk@gmail.com','PV99461','2012-07-20','700098765',NULL,NULL,NULL,'2018-11-21 15:05:57','2018-11-21 15:05:57',NULL,1,1),(8,'DOC/2018/002','18270','Asian Electricales','0112439143','0112439142','0112338023',NULL,'abc@pvt.com','PV12933','2015-07-04','520322705',NULL,'ABC Perera',NULL,'2018-11-21 21:36:35','2018-11-21 21:36:35',NULL,1,1),(9,'DOC/2018/003','51848','PVC Center','0112445099','0112432919','0112429144','0112432919','pvccenter1@gmail.com','PV56485','2015-07-04','520344705',NULL,'VP Gamage',NULL,'2018-11-21 21:41:35','2018-11-21 21:41:35',NULL,2,1),(10,'DOC/2018/004','51935','U K Electricals','0112448646','0112448633','0112471836','0112481836','ukelectricals25@hotmail.com','PV40847','1992-07-31','526664705',NULL,'GSD Rahuman',NULL,'2018-11-21 21:44:26','2018-11-21 21:44:26',NULL,2,1),(11,'DOC/2018/005','07859','Metro Electricals pvt Ltd','0112327666','0112527656','0312327656','0112327656','metroepl@sltnet.lk','PV12817','1992-09-09','520344705',NULL,'GS Silva',NULL,'2018-11-21 21:47:39','2018-11-21 21:47:39',NULL,4,1),(12,'DOC/2018/006','51820','Orel Corparation(Pvt)Ltd','0774979210','08149792000','0114979563','01141112100','lakshitha@orelcorp.com','PV72125','2013-03-01','114721255',NULL,'RR gamage',NULL,'2018-11-21 21:55:54','2018-11-21 21:55:54',NULL,5,1),(13,'DOC/2018/007','51820','Electrical Lanka(Pvt)Ltd','0742289494','0772289494','0912289494','0122289494','janith@xon-group.com','PV90996','2013-12-02','175609962',NULL,'SD Perera',NULL,'2018-11-21 22:01:44','2018-11-21 22:13:38',NULL,1,1),(14,'DOC/2018/008','51908','Ambro Electricals','0112325623','0112327923','0115007923','0112325000','ambroel@sltnet.lk','PV07256','1987-05-16','409007287',NULL,NULL,NULL,'2018-11-21 22:04:40','2018-11-21 22:04:40',NULL,5,1),(15,'DOC/2018/009','52105','M R Electricals','0115769569','0115766636','0112332900','0112332900','gdk@pvt.com','PV76110','2007-02-07','409007400',NULL,NULL,NULL,'2018-11-21 22:07:44','2018-11-21 22:07:44',NULL,2,1),(16,'DOC/2018/010','54323','CBA company Pvt Ltd.','0118156805','0114678611','0115902443','0118921405','cba@gmail.com','PV01111','1973-10-12','445677287',NULL,NULL,NULL,'2018-11-21 22:10:31','2018-11-21 22:10:31',NULL,4,1);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_address`
--

DROP TABLE IF EXISTS `supplier_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  `street_1` varchar(45) DEFAULT NULL,
  `street_2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_address_supplier1_idx` (`supplier_id`),
  CONSTRAINT `fk_supplier_address_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_address`
--

LOCK TABLES `supplier_address` WRITE;
/*!40000 ALTER TABLE `supplier_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_has_product`
--

DROP TABLE IF EXISTS `supplier_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier_has_product` (
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`,`product_id`),
  KEY `fk_supplier_has_product_product1_idx` (`product_id`),
  KEY `fk_supplier_has_product_supplier1_idx` (`supplier_id`),
  CONSTRAINT `fk_supplier_has_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_supplier_has_product_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_has_product`
--

LOCK TABLES `supplier_has_product` WRITE;
/*!40000 ALTER TABLE `supplier_has_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title`
--

DROP TABLE IF EXISTS `title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title`
--

LOCK TABLES `title` WRITE;
/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` VALUES (1,'Mr.'),(2,'Miss.'),(3,'Mrs.');
/*!40000 ALTER TABLE `title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `role_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `fk_users_role1_idx` (`role_id`),
  KEY `fk_users_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_users_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_users_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'System Administrator','pra@i3cubes.com','$2y$10$eJDmAWwf3WvOGkRVZzDU.Od80XNMcN.ML8reWAYhRuOEwfu922N0y','Xbu2CsrCjA2HzM19pakb5i2OgvIimKxaoahCusBrGnjxab4kPcZ9TzY1FJ04','2018-10-11 03:07:55','2018-11-21 13:07:43',1,11,1,NULL),(15,'Store Keeper','usk@i3cubes.com','$2y$10$4xzYVrowuwsNwhUX5UVCBO/MGCU5nyfNn6fqm8AZGp.0o3wKIhYg6',NULL,'2018-11-21 14:09:39','2018-11-22 01:22:21',1,9,8,NULL),(16,'Store Manager','usm@i3cubes.com','$2y$10$vJ2Y9MaT7D6udm83bzF1p.OL8VvZMH7Dh1iBOWPVnWFZtrdAbGeqe',NULL,'2018-11-21 14:15:52','2018-11-22 01:22:39',1,8,11,NULL),(17,'Gayani','ufc@i3cubes.com','$2y$10$eNAqI/iGS0Zebqd4.E7Sseh..QDampv/8w6LKCGkzcUizT7kRpmNu','Fisde6Sdkz7T4Bbszvi31c4yOXyUFu2CrV0SjG0IV9oyeCr31RSxZsnbeT1I','2018-11-22 01:10:48','2018-11-22 01:23:10',1,10,4,NULL),(18,'Finance Manager','ufm@i3cubes.com','$2y$10$NBIv7WOpIHSKd6sKj2OQ..6J7QDo/JbXVjrUodoPEZspi1gsZmY6S',NULL,'2018-11-22 01:11:27','2018-11-22 01:23:23',1,7,3,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-22 21:42:07
