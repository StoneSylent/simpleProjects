-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: simpleUsers
-- ------------------------------------------------------
-- Server version	5.6.30-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,734,'6th Avenue','Pittsburg','CA','94565'),(2,732,'Cherry Lane','Los Angeles','CA','90004'),(3,51,'5th Street East','Los Angeles','CA','90063'),(4,928,'Cardinal Drive','Salinas','CA','93906'),(5,666,'Aspen Drive','La Puente','CA','91744'),(6,165,'Maple Street','Glasgow','KY','42141'),(7,317,'11th Street','East Northport','NY','11731'),(8,72,'5th Avenue','Holly Springs','NC','27540'),(9,327,'6th Street West','Tullahoma','TN','37388'),(10,201,'Mill Road','Liverpool','NY','13090'),(11,718,'Hawthorne Lane','Goodlettsville','TN','37072'),(12,420,'Linden Street','Fort Myers','FL','33905'),(13,516,'Lakeview Drive','Bedford','OH','44146'),(14,260,'Railroad Street','Flint','MI','48504'),(15,71,'Heather Lane','Uniondale','NY','11553'),(16,109,'Cambridge Court','Westminster','MD','21157'),(17,718,'Aspen Drive','Phoenixville','PA','19460'),(18,213,'Railroad Street','Methuen','MA','01844'),(19,458,'Warren Avenue','Snellville','GA','30039'),(20,610,'Grant Avenue','Meriden','CT','06450');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `State`
--

DROP TABLE IF EXISTS `State`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `State` (
  `state` varchar(2) NOT NULL,
  `stateName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `State`
--

LOCK TABLES `State` WRITE;
/*!40000 ALTER TABLE `State` DISABLE KEYS */;
INSERT INTO `State` VALUES ('AL','ALABAMA'),('AK','ALASKA'),('AZ','ARIZONA'),('AR','ARKANSAS'),('CA','CALIFORNIA'),('CO','COLORADO'),('CT','CONNECTICUT'),('DE','DELAWARE'),('FL','FLORIDA'),('GA','GEORGIA'),('HI','HAWAII'),('ID','IDAHO'),('IL','ILLINOIS'),('IN','INDIANA'),('IA','IOWA'),('KS','KANSAS'),('KY','KENTUCKY'),('LA','LOUISIANA'),('ME','MAINE'),('MD','MARYLAND'),('MA','MASSACHUSETTS'),('MI','MICHIGAN'),('MN','MINNESOTA'),('MS','MISSISSIPPI'),('MO','MISSOURI'),('MT','MONTANA'),('NE','NEBRASKA'),('NV','NEVADA'),('NH','NEW HAMPSHIRE'),('NJ','NEW JERSEY'),('NM','NEW MEXICO'),('NY','NEW YORK'),('NC','NORTH CAROLINA'),('ND','NORTH DAKOTA'),('OH','OHIO'),('OK','OKLAHOMA'),('OR','OREGON'),('PA','PENNSYLVANIA'),('RI','RHODE ISLAND'),('SC','SOUTH CAROLINA'),('SD','SOUTH DAKOTA'),('TN','TENNESSEE'),('TX','TEXAS'),('UT','UTAH'),('VT','VERMONT'),('VA','VIRGINIA'),('WA','WASHINGTON'),('WV','WEST VIRGINIA'),('WI','WISCONSIN'),('WY','WYOMING'),('GU','GUAM'),('PR','PUERTO RICO'),('VI','VIRGIN ISLANDS');
/*!40000 ALTER TABLE `State` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Bob','Salmon'),(2,'Joe','Fish'),(3,'Steve','Stan'),(4,'Ayana','Roudebush'),(5,'Sharri','Giron'),(6,'Jenniffer','Squillante'),(7,'Isela','Hurwitz'),(8,'Yajaira','Glen'),(9,'Maryjane','Pace'),(10,'Nicolas','Vanwagenen'),(11,'Ernestina','Tewksbury'),(12,'Amiee','Williford'),(13,'Oliva','Felice'),(14,'Reed','Luque'),(15,'Fernando','Metayer'),(16,'Erna','Padillo'),(17,'Mozella','Foy'),(18,'Raye','Berlin'),(19,'June','Bichrest'),(20,'Magda','Hildreth');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-07 14:04:53
