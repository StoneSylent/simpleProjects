-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gridPlay
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
-- Table structure for table `changesQueue`
--

DROP TABLE IF EXISTS `changesQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesQueue` (
  `xValue` int(10) unsigned NOT NULL,
  `yValue` int(10) unsigned NOT NULL,
  `color` varchar(6) NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesQueue`
--

LOCK TABLES `changesQueue` WRITE;
/*!40000 ALTER TABLE `changesQueue` DISABLE KEYS */;
INSERT INTO `changesQueue` VALUES (0,0,'0131e2',1),(2,4,'e25dfe',2),(5,7,'e2ab89',3),(4,3,'af159c',4),(3,8,'c37c07',5),(8,4,'2965e1',6);
/*!40000 ALTER TABLE `changesQueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currentGrid`
--

DROP TABLE IF EXISTS `currentGrid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currentGrid` (
  `xValue` int(10) unsigned NOT NULL,
  `yValue` int(10) unsigned NOT NULL,
  `color` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currentGrid`
--

LOCK TABLES `currentGrid` WRITE;
/*!40000 ALTER TABLE `currentGrid` DISABLE KEYS */;
/*!40000 ALTER TABLE `currentGrid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastGrid`
--

DROP TABLE IF EXISTS `pastGrid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastGrid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `startTime` datetime DEFAULT NULL,
  `completeTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `steps` int(10) unsigned DEFAULT NULL,
  `grid` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastGrid`
--

LOCK TABLES `pastGrid` WRITE;
/*!40000 ALTER TABLE `pastGrid` DISABLE KEYS */;
/*!40000 ALTER TABLE `pastGrid` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-12 15:17:08
