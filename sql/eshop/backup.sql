-- MySQL dump 10.19  Distrib 10.3.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: LAPTOP-VTCIFJJ4.local    Database: eshop
-- ------------------------------------------------------
-- Server version	10.6.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktura` (
  `fakturanummer` varchar(80) NOT NULL,
  `pris` int(11) DEFAULT NULL,
  `summa` int(11) DEFAULT NULL,
  PRIMARY KEY (`fakturanummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
INSERT INTO `faktura` VALUES ('fak1',NULL,NULL),('fak2',NULL,NULL),('fak3',NULL,NULL),('fak4',NULL,NULL),('fak5',NULL,NULL);
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `kategori` varchar(80) NOT NULL,
  PRIMARY KEY (`kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES ('Förbrukning'),('Kaffe'),('Mugg'),('Special'),('Te');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kund`
--

DROP TABLE IF EXISTS `kund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kund` (
  `kundnummer` varchar(80) NOT NULL,
  `namn` varchar(80) DEFAULT NULL,
  `stad` varchar(80) DEFAULT NULL,
  `telefon` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`kundnummer`),
  UNIQUE KEY `namn_unique` (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund`
--

LOCK TABLES `kund` WRITE;
/*!40000 ALTER TABLE `kund` DISABLE KEYS */;
INSERT INTO `kund` VALUES ('kund1','Stefan','Visby','+46742345782'),('kund2','Malin','Lund','+46731342555'),('kund3','Olof','Kristianstad','+46769942143'),('kund4','Julia','Stockholm','+46701232000'),('kund5','Erik','Karlskrona','+46714441122');
/*!40000 ALTER TABLE `kund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lager`
--

DROP TABLE IF EXISTS `lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lager` (
  `hylla` char(2) NOT NULL,
  `beskrivning` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`hylla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lager`
--

LOCK TABLES `lager` WRITE;
/*!40000 ALTER TABLE `lager` DISABLE KEYS */;
INSERT INTO `lager` VALUES ('K1','Hylla K, plats 1'),('T1','Hylla T, plats 1');
/*!40000 ALTER TABLE `lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logg`
--

DROP TABLE IF EXISTS `logg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `händelse` varchar(80) DEFAULT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logg`
--

LOCK TABLES `logg` WRITE;
/*!40000 ALTER TABLE `logg` DISABLE KEYS */;
INSERT INTO `logg` VALUES (1,'Produkt med produktkod \"kaffe1\" lades till','2023-04-17 12:53:28'),(2,'Produkt med produktkod \"kaffe2\" lades till','2023-04-17 12:53:28'),(3,'Produkt med produktkod \"te1\" lades till','2023-04-17 12:53:28'),(4,'Produkt med produktkod \"te2\" lades till','2023-04-17 12:53:28'),(5,'Produkt med produktkod \"2-in-1\" lades till','2023-04-17 12:53:28');
/*!40000 ALTER TABLE `logg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ordernummer` int(11) NOT NULL AUTO_INCREMENT,
  `produktkod` varchar(80) DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  `kund_id` varchar(80) DEFAULT NULL,
  `faktura_id` varchar(80) DEFAULT NULL,
  `skapades` timestamp NOT NULL DEFAULT current_timestamp(),
  `uppdaterades` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `raderades` timestamp NULL DEFAULT NULL,
  `beställdes` timestamp NULL DEFAULT NULL,
  `skickades` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ordernummer`),
  KEY `kund_id` (`kund_id`),
  KEY `faktura_id` (`faktura_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`kundnummer`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`faktura_id`) REFERENCES `faktura` (`fakturanummer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'kaffe1',4,'kund1','fak1','2023-04-17 12:53:28',NULL,NULL,NULL,NULL),(2,'kaffe2',14,'kund2','fak2','2023-04-17 12:53:28','2023-04-17 12:53:28',NULL,NULL,NULL),(3,'te1',6,'kund3','fak3','2023-04-17 12:53:28','2023-04-17 12:53:28','2023-04-17 12:53:28',NULL,NULL),(4,'te2',15,'kund4','fak4','2023-04-17 12:53:28','2023-04-17 12:53:28',NULL,'2023-04-17 12:53:28',NULL),(5,'2-in-1',8,'kund5','fak5','2023-04-17 12:53:28','2023-04-17 12:53:28',NULL,'2023-04-17 12:53:28','2023-04-17 12:53:28'),(6,NULL,NULL,'kund1',NULL,'2023-04-17 12:56:00','2023-04-17 12:56:44',NULL,'2023-04-17 12:56:22','2023-04-17 12:56:44');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_till_produkt`
--

DROP TABLE IF EXISTS `order_till_produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_till_produkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `produkt_id` varchar(80) DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `produkt_id` (`produkt_id`),
  CONSTRAINT `order_till_produkt_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`ordernummer`),
  CONSTRAINT `order_till_produkt_ibfk_2` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produktkod`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_till_produkt`
--

LOCK TABLES `order_till_produkt` WRITE;
/*!40000 ALTER TABLE `order_till_produkt` DISABLE KEYS */;
INSERT INTO `order_till_produkt` VALUES (1,1,'kaffe1',4),(2,2,'kaffe2',12),(3,3,'te1',6),(4,4,'te2',15),(5,5,'2-in-1',8),(6,6,'2-in-1',17);
/*!40000 ALTER TABLE `order_till_produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt` (
  `produktkod` varchar(80) NOT NULL,
  `namn` varchar(80) DEFAULT NULL,
  `beskrivning` varchar(80) DEFAULT NULL,
  `pris` int(11) DEFAULT NULL,
  PRIMARY KEY (`produktkod`),
  UNIQUE KEY `namn_unique` (`namn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES ('2-in-1','Specialmix','Det bästa av två världar, kaffepulver blandat med teblad',99),('kaffe1','Kaffemugg','Elegant snövit handgjord kaffemugg',49),('kaffe2','Kaffebönor','Kraftfulla bönor av yttersta kvalité',89),('te1','Temugg','Högklassig temugg i extra stort format',59),('te2','Tepåsar','Tepåsar med tongivande smak från björnbär och hallon',39);
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`%`*/ /*!50003 TRIGGER `logg_produkt_insert`
AFTER INSERT
ON produkt FOR EACH ROW
    INSERT INTO `logg` (händelse) VALUES
    (CONCAT('Produkt med produktkod "', NEW.produktkod, '" lades till')) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`%`*/ /*!50003 TRIGGER `logg_produkt_update`
AFTER UPDATE
ON produkt FOR EACH ROW
    INSERT INTO `logg` (händelse) VALUES
    (CONCAT('Produkt med produktkod "', NEW.produktkod, '" uppdaterades')) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produkt_till_kategori`
--

DROP TABLE IF EXISTS `produkt_till_kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt_till_kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produkt_id` varchar(80) DEFAULT NULL,
  `kategori_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produkt_id` (`produkt_id`),
  KEY `kategori_id` (`kategori_id`),
  CONSTRAINT `produkt_till_kategori_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produktkod`),
  CONSTRAINT `produkt_till_kategori_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt_till_kategori`
--

LOCK TABLES `produkt_till_kategori` WRITE;
/*!40000 ALTER TABLE `produkt_till_kategori` DISABLE KEYS */;
INSERT INTO `produkt_till_kategori` VALUES (1,'kaffe1','Kaffe'),(2,'kaffe1','Mugg'),(3,'kaffe2','Kaffe'),(4,'kaffe2','Förbrukning'),(5,'te1','Te'),(6,'te1','Mugg'),(7,'te2','Te'),(8,'te2','Förbrukning'),(9,'2-in-1','Kaffe'),(10,'2-in-1','Te'),(11,'2-in-1','Förbrukning'),(12,'2-in-1','Special');
/*!40000 ALTER TABLE `produkt_till_kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt_till_lager`
--

DROP TABLE IF EXISTS `produkt_till_lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt_till_lager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `antal` int(11) DEFAULT NULL,
  `produkt_id` varchar(80) DEFAULT NULL,
  `lager_id` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produkt_id` (`produkt_id`),
  KEY `lager_id` (`lager_id`),
  CONSTRAINT `produkt_till_lager_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produktkod`),
  CONSTRAINT `produkt_till_lager_ibfk_2` FOREIGN KEY (`lager_id`) REFERENCES `lager` (`hylla`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt_till_lager`
--

LOCK TABLES `produkt_till_lager` WRITE;
/*!40000 ALTER TABLE `produkt_till_lager` DISABLE KEYS */;
INSERT INTO `produkt_till_lager` VALUES (1,20,'kaffe1','K1'),(2,25,'kaffe2','K1'),(3,30,'te1','T1'),(4,35,'te2','T1'),(5,40,'2-in-1','K1');
/*!40000 ALTER TABLE `produkt_till_lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_inv`
--

DROP TABLE IF EXISTS `v_inv`;
/*!50001 DROP VIEW IF EXISTS `v_inv`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_inv` AS SELECT
 1 AS `produktkod`,
  1 AS `namn`,
  1 AS `hylla`,
  1 AS `antal` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_plocklista`
--

DROP TABLE IF EXISTS `v_plocklista`;
/*!50001 DROP VIEW IF EXISTS `v_plocklista`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_plocklista` AS SELECT
 1 AS `ordernummer`,
  1 AS `produktkod`,
  1 AS `antal`,
  1 AS `hylla`,
  1 AS `beskrivning`,
  1 AS `lagersaldo` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_produktinfo`
--

DROP TABLE IF EXISTS `v_produktinfo`;
/*!50001 DROP VIEW IF EXISTS `v_produktinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_produktinfo` AS SELECT
 1 AS `produktkod`,
  1 AS `namn`,
  1 AS `beskrivning`,
  1 AS `pris`,
  1 AS `antal`,
  1 AS `kategori` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'eshop'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_lager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` FUNCTION `func_lager`(antal INT,
    lagersaldo INT
) RETURNS varchar(40) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
    DETERMINISTIC
BEGIN
    IF antal > lagersaldo THEN
        RETURN 'OBS! Antal överstiger lagersaldo';
    END IF;
    RETURN "Ok";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `order_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` FUNCTION `order_date`(skapad VARCHAR(80),
    uppdaterad VARCHAR(80)
) RETURNS char(20) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
    DETERMINISTIC
BEGIN
    IF uppdaterad IS NOT NULL THEN
        RETURN uppdaterad;
    END IF;
    RETURN skapad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` FUNCTION `order_status`(skapad VARCHAR(80),
    uppdaterad VARCHAR(80),
    raderad VARCHAR(80),
    beställd VARCHAR(80),
    skickad VARCHAR(80)
) RETURNS char(20) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
    DETERMINISTIC
BEGIN
    IF raderad IS NOT NULL THEN
        RETURN 'raderad';
    ELSEIF skickad IS NOT NULL THEN
        RETURN 'skickad';
    ELSEIF beställd IS NOT NULL THEN
        RETURN 'beställd';
    ELSEIF uppdaterad IS NOT NULL THEN
        RETURN 'uppdaterad';
    ELSEIF skapad IS NOT NULL THEN
        RETURN 'skapad';
    END IF;
    RETURN "Can't find order status";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_to_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `add_to_order`(
    a_order_id INT,
    a_produkt_id VARCHAR(80),
    a_antal INT
)
BEGIN
    DECLARE product_in_order INT;
    SET product_in_order = (SELECT EXISTS(
        SELECT *
        FROM v_plocklista
        WHERE
            (ordernummer = a_order_id AND produktkod = a_produkt_id))
        );
    IF product_in_order = 1 THEN
        UPDATE order_till_produkt SET
            antal = antal + a_antal
        WHERE 
            (order_id = a_order_id AND produkt_id = a_produkt_id)
    ;
    ELSEIF product_in_order = 0 THEN
        INSERT INTO order_till_produkt (order_id, produkt_id, antal)
            VALUES (a_order_id, a_produkt_id, a_antal)
    ;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bestall_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `bestall_order`(
    a_ordernummer INT
)
BEGIN
    UPDATE `order` SET
        `beställdes` = CURRENT_TIMESTAMP
    WHERE
        (ordernummer = a_ordernummer)
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `create_order`(
    a_kund_id VARCHAR(80)
)
BEGIN
    INSERT INTO `order` (kund_id)
        VALUES (a_kund_id)
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `create_product`(
    a_produktkod VARCHAR(80),
    a_namn VARCHAR(80),
    a_beskrivning VARCHAR(80),
    a_pris INT,
    a_antal INT,
    a_kategori VARCHAR (80)
)
BEGIN
    INSERT INTO produkt (produktkod, namn, beskrivning, pris)
        VALUES (a_produktkod, a_namn, a_beskrivning, a_pris);
    INSERT INTO produkt_till_lager (produkt_id, antal)
        VALUES (a_produktkod, a_antal);
    INSERT INTO kategori (kategori)
        VALUES (a_kategori);
    INSERT INTO produkt_till_kategori (produkt_id, kategori_id)
        VALUES (a_produktkod, a_kategori);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `delete_product`(
    a_produktkod VARCHAR(80)
)
BEGIN
    DELETE FROM produkt_till_kategori
    WHERE
        `produkt_id` = a_produktkod;
    DELETE FROM produkt_till_lager
    WHERE
        `produkt_id` = a_produktkod;
    DELETE FROM produkt
    WHERE
        `produktkod` = a_produktkod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `edit_product`(
    a_produktkod VARCHAR(80),
    a_namn VARCHAR(80),
    a_beskrivning VARCHAR(80),
    a_pris INT
)
BEGIN
    UPDATE produkt SET
        `namn` = a_namn,
        `beskrivning` = a_beskrivning,
        `pris` = a_pris
    WHERE
        `produktkod` = a_produktkod
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inv_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `inv_add`(
    a_produktkod VARCHAR(80),
    a_hylla CHAR(2),
    a_antal INT
)
BEGIN
    INSERT INTO produkt_till_lager (produkt_id, lager_id, antal)
        VALUES (a_produktkod, a_hylla, a_antal)
            ON DUPLICATE KEY UPDATE antal = antal + a_antal
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inv_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `inv_del`(
    a_produktkod VARCHAR(80),
    a_hylla CHAR(2),
    a_antal INT
)
BEGIN
    DECLARE produkt_antal INT;
    SET produkt_antal = (SELECT antal FROM produkt_till_lager WHERE produkt_id = a_produktkod AND lager_id = a_hylla);

    IF produkt_antal - a_antal > 0 THEN
        UPDATE produkt_till_lager SET
            antal = antal - a_antal
        WHERE
            (produkt_id = a_produktkod AND lager_id = a_hylla)
        ;
    ELSE
        DELETE FROM produkt_till_lager 
        WHERE
            (produkt_id = a_produktkod AND lager_id = a_hylla)
        ;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `order_add_page` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `order_add_page`(
    a_ordernummer INT
)
BEGIN
    SELECT
        ordernummer
    FROM `order`
    WHERE
        (ordernummer = a_ordernummer)
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pick_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `pick_list`(
    a_ordernummer INT
)
BEGIN
    SELECT
        *,
        func_lager(antal, lagersaldo) AS 'meddelande'
    FROM
        v_plocklista
    WHERE
        ordernummer = a_ordernummer
    GROUP BY 
        produktkod
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_inv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `search_inv`(
    a_input VARCHAR(80)
)
BEGIN
    SELECT *
    FROM v_inv
    WHERE
        produktkod LIKE CONCAT('%', a_input, '%')
        OR namn LIKE CONCAT('%', a_input, '%')
        OR hylla LIKE CONCAT('%', a_input, '%')
    ORDER BY hylla
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `search_order`(
    a_input VARCHAR(80)
)
BEGIN
    SELECT
        o.ordernummer,
        order_date(o.skapades, o.uppdaterades) AS 'datum',
        o.kund_id AS kundnummer,
        COUNT(otp.produkt_id) AS orderrader,
        order_status(o.skapades, o.uppdaterades, o.raderades, o.beställdes, o.skickades) AS 'status'
    FROM `order` AS o
        JOIN `order_till_produkt` AS otp
            ON otp.order_id = o.ordernummer
        JOIN `produkt` AS p
            ON p.produktkod = otp.produkt_id
    WHERE
        o.ordernummer LIKE CONCAT('%', a_input, '%')
        OR o.kund_id LIKE CONCAT('%', a_input, '%')
    GROUP BY 
        o.ordernummer
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ship_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `ship_order`(
    a_ordernummer INT
)
BEGIN
    UPDATE `order` SET
        `skickades` = CURRENT_TIMESTAMP
    WHERE
        (ordernummer = a_ordernummer)
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_categories`()
BEGIN
    SELECT * 
    FROM kategori
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_customers`()
BEGIN
    SELECT * 
    FROM kund
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_inv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_inv`(
)
BEGIN
    SELECT *
    FROM v_inv
    ORDER BY hylla
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_log`(
    a_number INT
)
BEGIN
    SELECT *
    FROM logg
    ORDER BY id DESC
    LIMIT a_number
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_orders`()
BEGIN
    SELECT
        o.ordernummer,
        order_date(o.skapades, o.uppdaterades) AS 'datum',
        o.kund_id AS kundnummer,
        COUNT(otp.produkt_id) AS orderrader,
        order_status(o.skapades, o.uppdaterades, o.raderades, o.beställdes, o.skickades) AS 'status'
    FROM `order` AS o
        LEFT JOIN `order_till_produkt` AS otp
            ON otp.order_id = o.ordernummer
    GROUP BY 
        o.ordernummer
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_products`()
BEGIN
    SELECT * FROM v_produktinfo
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_shelfs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_shelfs`(
)
BEGIN
    SELECT *
    FROM lager
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_single_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_single_customer`(
    a_kundnummer VARCHAR(80)
)
BEGIN
    SELECT * FROM kund
    WHERE kundnummer = a_kundnummer
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_single_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_single_order`(
    a_order_id VARCHAR(80)
)
BEGIN
    SELECT
        o.ordernummer,
        order_status(o.skapades, o.uppdaterades, o.raderades, o.beställdes, o.skickades) AS 'status',
        otp.produkt_id,
        p.namn,
        otp.antal,
        p.pris,
        (p.pris * otp.antal) AS 'summa'
    FROM `order` AS o
        JOIN `order_till_produkt` AS otp
            ON otp.order_id = o.ordernummer
        JOIN `produkt` AS p
            ON p.produktkod = otp.produkt_id
    WHERE
        order_id = a_order_id
    GROUP BY 
        otp.produkt_id
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_single_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`%` PROCEDURE `show_single_product`(
    a_produktkod VARCHAR(80)
)
BEGIN
    SELECT * FROM v_produktinfo
    WHERE produktkod = a_produktkod
    GROUP BY produktkod
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_inv`
--

/*!50001 DROP VIEW IF EXISTS `v_inv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`maria`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_inv` AS select `p`.`produktkod` AS `produktkod`,`p`.`namn` AS `namn`,`l`.`hylla` AS `hylla`,`ptl`.`antal` AS `antal` from ((`produkt_till_lager` `ptl` join `lager` `l` on(`ptl`.`lager_id` = `l`.`hylla`)) join `produkt` `p` on(`p`.`produktkod` = `ptl`.`produkt_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_plocklista`
--

/*!50001 DROP VIEW IF EXISTS `v_plocklista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`maria`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_plocklista` AS select `otp`.`order_id` AS `ordernummer`,`otp`.`produkt_id` AS `produktkod`,`otp`.`antal` AS `antal`,`l`.`hylla` AS `hylla`,`l`.`beskrivning` AS `beskrivning`,`ptl`.`antal` AS `lagersaldo` from (((`order_till_produkt` `otp` join `produkt` `p` on(`p`.`produktkod` = `otp`.`produkt_id`)) join `produkt_till_lager` `ptl` on(`ptl`.`produkt_id` = `p`.`produktkod`)) join `lager` `l` on(`l`.`hylla` = `ptl`.`lager_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_produktinfo`
--

/*!50001 DROP VIEW IF EXISTS `v_produktinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`maria`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_produktinfo` AS select `p`.`produktkod` AS `produktkod`,`p`.`namn` AS `namn`,`p`.`beskrivning` AS `beskrivning`,`p`.`pris` AS `pris`,`ptl`.`antal` AS `antal`,group_concat(`k`.`kategori` separator ',') AS `kategori` from (((`produkt` `p` join `produkt_till_lager` `ptl` on(`ptl`.`produkt_id` = `p`.`produktkod`)) join `produkt_till_kategori` `ptk` on(`p`.`produktkod` = `ptk`.`produkt_id`)) join `kategori` `k` on(`k`.`kategori` = `ptk`.`kategori_id`)) group by `p`.`produktkod` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-17 21:56:12
