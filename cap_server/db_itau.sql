-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: 172.16.128.128    Database: db_itau
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `celldata`
--

DROP TABLE IF EXISTS `celldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celldata` (
  `id_celldata` int(11) NOT NULL AUTO_INCREMENT,
  `id_cap` int(11) DEFAULT NULL,
  `MCC` varchar(10) DEFAULT NULL,
  `MNC` varchar(10) DEFAULT NULL,
  `LAC` varchar(10) DEFAULT NULL,
  `CELLID` varchar(10) DEFAULT NULL,
  `RSSI` int(11) DEFAULT NULL,
  `TA` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_celldata`),
  KEY `id_cap` (`id_cap`),
  CONSTRAINT `celldata_ibfk_1` FOREIGN KEY (`id_cap`) REFERENCES `remotecaptures` (`id_cap`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celldata`
--

LOCK TABLES `celldata` WRITE;
/*!40000 ALTER TABLE `celldata` DISABLE KEYS */;
INSERT INTO `celldata` VALUES (1,1,'724','11','849','43d7',18,'2'),(2,2,'724','11','849','43d7',18,'2'),(3,3,'724','11','849','43d7',18,'2'),(4,4,'724','11','849','43d7',18,'2');
/*!40000 ALTER TABLE `celldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwrdevices`
--

DROP TABLE IF EXISTS `dwrdevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dwrdevices` (
  `id_device` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `MSISDN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwrdevices`
--

LOCK TABLES `dwrdevices` WRITE;
/*!40000 ALTER TABLE `dwrdevices` DISABLE KEYS */;
INSERT INTO `dwrdevices` VALUES (10,'Itau Prototipe','5514976003367'),(11,'Itau Prototipe','55998899887');
/*!40000 ALTER TABLE `dwrdevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remotecaptures`
--

DROP TABLE IF EXISTS `remotecaptures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remotecaptures` (
  `id_cap` int(11) NOT NULL AUTO_INCREMENT,
  `id_device` int(11) NOT NULL,
  `imei` varchar(20) DEFAULT NULL,
  `temperature` varchar(10) DEFAULT NULL,
  `pwr` int(11) DEFAULT NULL,
  `move` int(11) DEFAULT NULL,
  `comm_period` int(11) DEFAULT NULL,
  `timestp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cap`),
  KEY `id_device` (`id_device`),
  CONSTRAINT `remotecaptures_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `dwrdevices` (`id_device`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remotecaptures`
--

LOCK TABLES `remotecaptures` WRITE;
/*!40000 ALTER TABLE `remotecaptures` DISABLE KEYS */;
INSERT INTO `remotecaptures` VALUES (1,10,'35214005098519','28.5',0,0,60,'2016-07-10 20:33:26'),(2,10,'35214005098519','28.5',0,0,60,'2016-07-10 20:33:28'),(3,11,'35214005098519','28.5',0,0,60,'2016-07-10 20:33:57'),(4,11,'35214005098519','28.5',0,0,60,'2016-07-10 20:33:59');
/*!40000 ALTER TABLE `remotecaptures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-10 17:39:13
