CREATE DATABASE  IF NOT EXISTS `silab_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `silab_db`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: silab_db
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `TBL_ACCESORIOS`
--

DROP TABLE IF EXISTS `TBL_ACCESORIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ACCESORIOS` (
  `ACCE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCE_SERIAL` varchar(45) NOT NULL,
  `ACCE_MODELO` varchar(45) DEFAULT NULL,
  `ITNC_ID` int(11) NOT NULL,
  PRIMARY KEY (`ACCE_ID`),
  KEY `fk_accesorios_itemCualitativo_id_idx` (`ITNC_ID`),
  CONSTRAINT `fk_accesorios_itemCualitativo_id` FOREIGN KEY (`ITNC_ID`) REFERENCES `TBL_ITEMSNOCONSUMIBLES` (`ITNC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_ACCESORIOS`
--

LOCK TABLES `TBL_ACCESORIOS` WRITE;
/*!40000 ALTER TABLE `TBL_ACCESORIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_ACCESORIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_AUDITORIALOG`
--

DROP TABLE IF EXISTS `TBL_AUDITORIALOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_AUDITORIALOG` (
  `AULOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AULOG_TABLENAME` varchar(100) DEFAULT NULL,
  `AULOG_FECHA` timestamp NULL DEFAULT NULL,
  `USUA_ID` int(11) DEFAULT NULL,
  `LOTI_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AULOG_ID`),
  KEY `FK_AUDITORIALOG_USUA_ID_idx` (`USUA_ID`),
  KEY `FK_AUDITORIALOG_LOTI_ID_idx` (`LOTI_ID`),
  CONSTRAINT `FK_AUDITORIALOG_LOTI_ID` FOREIGN KEY (`LOTI_ID`) REFERENCES `TBL_LOGTIPO` (`LOTI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_AUDITORIALOG_USUA_ID` FOREIGN KEY (`USUA_ID`) REFERENCES `TBL_USUARIOS` (`USUA_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_AUDITORIALOG`
--

LOCK TABLES `TBL_AUDITORIALOG` WRITE;
/*!40000 ALTER TABLE `TBL_AUDITORIALOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_AUDITORIALOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_CADUCIDADES`
--

DROP TABLE IF EXISTS `TBL_CADUCIDADES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_CADUCIDADES` (
  `CADU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CADU_NOMBRE` varchar(45) NOT NULL,
  `CADU_MIN` int(11) NOT NULL DEFAULT '0',
  `CADU_MAX` int(11) DEFAULT '0',
  PRIMARY KEY (`CADU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_CADUCIDADES`
--

LOCK TABLES `TBL_CADUCIDADES` WRITE;
/*!40000 ALTER TABLE `TBL_CADUCIDADES` DISABLE KEYS */;
INSERT INTO `TBL_CADUCIDADES` VALUES (1,'VIGENTE',50,NULL),(2,'PROXIMO A VENCER',1,50),(3,'VENCIDO',-1,0);
/*!40000 ALTER TABLE `TBL_CADUCIDADES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_COORDINADORES`
--

DROP TABLE IF EXISTS `TBL_COORDINADORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_COORDINADORES` (
  `COOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERS_ID` int(11) NOT NULL,
  PRIMARY KEY (`COOR_ID`),
  KEY `fk_coordinadores_persona_id_idx` (`PERS_ID`),
  CONSTRAINT `fk_coordinadores_persona_id` FOREIGN KEY (`PERS_ID`) REFERENCES `TBL_PERSONAS` (`PERS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_COORDINADORES`
--

LOCK TABLES `TBL_COORDINADORES` WRITE;
/*!40000 ALTER TABLE `TBL_COORDINADORES` DISABLE KEYS */;
INSERT INTO `TBL_COORDINADORES` VALUES (1,1),(2,3);
/*!40000 ALTER TABLE `TBL_COORDINADORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_DETALLESOLICITUDES`
--

DROP TABLE IF EXISTS `TBL_DETALLESOLICITUDES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_DETALLESOLICITUDES` (
  `DESO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESO_CANTIDAD` double DEFAULT NULL,
  `SOLI_ID` int(11) NOT NULL,
  `STOC_ID` int(11) NOT NULL,
  `DESO_VALIDO` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`DESO_ID`),
  KEY `FK_DETALLESOLICITUDES_STOC_ID_idx` (`STOC_ID`),
  KEY `FK_DETALLESOLICITUDES_SOLI_ID_idx` (`SOLI_ID`),
  CONSTRAINT `FK_DETALLESOLICITUDES_SOLI_ID` FOREIGN KEY (`SOLI_ID`) REFERENCES `TBL_SOLICITUDES` (`SOLI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DETALLESOLICITUDES_STOC_ID` FOREIGN KEY (`STOC_ID`) REFERENCES `TBL_STOCK` (`STOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_DETALLESOLICITUDES`
--

LOCK TABLES `TBL_DETALLESOLICITUDES` WRITE;
/*!40000 ALTER TABLE `TBL_DETALLESOLICITUDES` DISABLE KEYS */;
INSERT INTO `TBL_DETALLESOLICITUDES` VALUES (6,1,1,5,''),(7,58,1,7,''),(8,458,1,8,'');
/*!40000 ALTER TABLE `TBL_DETALLESOLICITUDES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_EDIFICIOS`
--

DROP TABLE IF EXISTS `TBL_EDIFICIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_EDIFICIOS` (
  `EDIF_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EDIF_NOMBRE` varchar(100) NOT NULL,
  `EDIF_CODIGO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EDIF_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_EDIFICIOS`
--

LOCK TABLES `TBL_EDIFICIOS` WRITE;
/*!40000 ALTER TABLE `TBL_EDIFICIOS` DISABLE KEYS */;
INSERT INTO `TBL_EDIFICIOS` VALUES (1,'BLOQUE SILAB','BLOQ-SILAB');
/*!40000 ALTER TABLE `TBL_EDIFICIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_EQUIPOS`
--

DROP TABLE IF EXISTS `TBL_EQUIPOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_EQUIPOS` (
  `EQUI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EQUI_SERIAL` varchar(100) NOT NULL,
  `ITNC_ID` int(11) NOT NULL,
  PRIMARY KEY (`EQUI_ID`),
  KEY `fk_equipos_itemCualitativo_id_idx` (`ITNC_ID`),
  CONSTRAINT `fk_equipos_itemCualitativo_id` FOREIGN KEY (`ITNC_ID`) REFERENCES `TBL_ITEMSNOCONSUMIBLES` (`ITNC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_EQUIPOS`
--

LOCK TABLES `TBL_EQUIPOS` WRITE;
/*!40000 ALTER TABLE `TBL_EQUIPOS` DISABLE KEYS */;
INSERT INTO `TBL_EQUIPOS` VALUES (1,'9K 80901',1);
/*!40000 ALTER TABLE `TBL_EQUIPOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_ESTADOSCONSUMIBLE`
--

DROP TABLE IF EXISTS `TBL_ESTADOSCONSUMIBLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ESTADOSCONSUMIBLE` (
  `ESCO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ESCO_NOMBRE` varchar(45) NOT NULL,
  `ESCO_MIN` int(11) NOT NULL DEFAULT '0',
  `ESCO_MAX` int(11) DEFAULT '0',
  PRIMARY KEY (`ESCO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_ESTADOSCONSUMIBLE`
--

LOCK TABLES `TBL_ESTADOSCONSUMIBLE` WRITE;
/*!40000 ALTER TABLE `TBL_ESTADOSCONSUMIBLE` DISABLE KEYS */;
INSERT INTO `TBL_ESTADOSCONSUMIBLE` VALUES (1,'AGOTADO',-1,0),(2,'REPONER',1,50),(3,'MINIMAS',51,100),(4,'SUFICIENTE',101,-1);
/*!40000 ALTER TABLE `TBL_ESTADOSCONSUMIBLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_ESTADOSNOCONSUMIBLE`
--

DROP TABLE IF EXISTS `TBL_ESTADOSNOCONSUMIBLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ESTADOSNOCONSUMIBLE` (
  `ESNC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ESNC_NOMBRE` varchar(100) NOT NULL,
  `ESNC_CODIGO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ESNC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_ESTADOSNOCONSUMIBLE`
--

LOCK TABLES `TBL_ESTADOSNOCONSUMIBLE` WRITE;
/*!40000 ALTER TABLE `TBL_ESTADOSNOCONSUMIBLE` DISABLE KEYS */;
INSERT INTO `TBL_ESTADOSNOCONSUMIBLE` VALUES (1,'BUENO','GOOD'),(2,'DAÑADO','WARNING'),(3,'AGOTADO','DANGER');
/*!40000 ALTER TABLE `TBL_ESTADOSNOCONSUMIBLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_ESTADOSOLICITUD`
--

DROP TABLE IF EXISTS `TBL_ESTADOSOLICITUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ESTADOSOLICITUD` (
  `ESSO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ESSO_NOMBRE` varchar(45) NOT NULL,
  `ESSO_ORDEN` int(11) DEFAULT NULL,
  `ESSO_PARENT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ESSO_ID`),
  KEY `REF_ESTADOSOLICITUD_ESSO_PARENT_idx` (`ESSO_PARENT`),
  CONSTRAINT `REF_ESTADOSOLICITUD_ESSO_PARENT` FOREIGN KEY (`ESSO_PARENT`) REFERENCES `TBL_ESTADOSOLICITUD` (`ESSO_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_ESTADOSOLICITUD`
--

LOCK TABLES `TBL_ESTADOSOLICITUD` WRITE;
/*!40000 ALTER TABLE `TBL_ESTADOSOLICITUD` DISABLE KEYS */;
INSERT INTO `TBL_ESTADOSOLICITUD` VALUES (1,'PENDIENTE',0,NULL),(2,'COMPLETADO',1,1),(3,'PENDIENTE',0,NULL);
/*!40000 ALTER TABLE `TBL_ESTADOSOLICITUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_FACTURAS`
--

DROP TABLE IF EXISTS `TBL_FACTURAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FACTURAS` (
  `FACT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FACT_CODIGO` varchar(100) NOT NULL,
  `FACT_FECHA` datetime DEFAULT NULL,
  `FACT_IMAGEPATH` text,
  `PROV_ID` int(11) NOT NULL,
  `PEDI_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FACT_ID`),
  KEY `fk_facturas_provedor_id_idx` (`PROV_ID`),
  KEY `FK_FACTURAS_PEDI_ID_idx` (`PEDI_ID`),
  CONSTRAINT `FK_FACTURAS_PEDI_ID` FOREIGN KEY (`PEDI_ID`) REFERENCES `TBL_PEDIDOS` (`SOLI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_facturas_provedor_id` FOREIGN KEY (`PROV_ID`) REFERENCES `TBL_PROVEDORES` (`PROV_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_FACTURAS`
--

LOCK TABLES `TBL_FACTURAS` WRITE;
/*!40000 ALTER TABLE `TBL_FACTURAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_FACTURAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_FLUJOS`
--

DROP TABLE IF EXISTS `TBL_FLUJOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FLUJOS` (
  `FLUJ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FLUJ_CANTIDAD` double NOT NULL,
  `MOVI_ID` int(11) DEFAULT NULL,
  `STOC_ID` int(11) NOT NULL,
  `TIFU_ID` int(11) DEFAULT NULL,
  `FLUJ_FECHA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PERI_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FLUJ_ID`),
  KEY `FK_FLUJOS_STOC_ID_idx` (`STOC_ID`),
  KEY `FK_FLUJOS_TIFU_ID_idx` (`TIFU_ID`),
  KEY `FK_FLUJOS_MOVI_ID_idx` (`MOVI_ID`),
  KEY `FK_FLUJOS_PERI_ID_idx` (`PERI_ID`),
  CONSTRAINT `FK_FLUJOS_MOVI_ID` FOREIGN KEY (`MOVI_ID`) REFERENCES `TBL_MOVIMIENTOS` (`MOVI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FLUJOS_PERI_ID` FOREIGN KEY (`PERI_ID`) REFERENCES `TBL_PERIODOS` (`PERI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FLUJOS_STOC_ID` FOREIGN KEY (`STOC_ID`) REFERENCES `TBL_STOCK` (`STOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FLUJOS_TIFU_ID` FOREIGN KEY (`TIFU_ID`) REFERENCES `TBL_TIPOFLUJO` (`TIFL_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_FLUJOS`
--

LOCK TABLES `TBL_FLUJOS` WRITE;
/*!40000 ALTER TABLE `TBL_FLUJOS` DISABLE KEYS */;
INSERT INTO `TBL_FLUJOS` VALUES (1,80,NULL,2,1,'2017-02-11 09:01:06',5),(3,800,NULL,4,1,'2017-02-11 12:07:04',5),(4,1,NULL,5,1,'2017-02-11 19:05:37',5),(6,80,NULL,7,1,'2017-02-12 01:06:25',5),(7,500,NULL,8,1,'2017-02-12 01:27:40',5),(8,80,NULL,9,1,'2017-02-12 01:28:20',5),(9,50,NULL,2,1,'2017-02-12 13:04:55',5),(10,1,NULL,10,1,'2017-02-12 13:47:38',5),(11,80,NULL,11,1,'2017-02-12 13:53:22',5),(12,84,NULL,18,1,'2017-03-05 07:37:25',5),(13,51,NULL,19,1,'2017-03-05 09:51:36',5),(14,51,NULL,20,1,'2017-03-05 09:56:26',5),(15,481,NULL,21,1,'2017-03-05 13:32:17',5),(16,58,NULL,22,1,'2017-03-05 17:21:18',5),(18,58,NULL,24,1,'2017-03-05 17:31:51',5),(19,88,NULL,15,1,'2017-03-05 17:32:11',5);
/*!40000 ALTER TABLE `TBL_FLUJOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `silab_db`.`TBL_FLUJOS_BEFORE_INSERT` BEFORE INSERT ON `TBL_FLUJOS` FOR EACH ROW
BEGIN
	SET NEW.PERI_ID = IF( NEW.PERI_ID IS NULL, getCurrentPeriod(), NEW.PERI_ID );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `silab_db`.`TBL_FLUJOS_BEFORE_UPDATE` BEFORE UPDATE ON `TBL_FLUJOS` FOR EACH ROW
BEGIN
	SET NEW.PERI_ID = IF( NEW.PERI_ID IS NULL, getCurrentPeriod(), NEW.PERI_ID );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TBL_FUNCIONALABORATORIO`
--

DROP TABLE IF EXISTS `TBL_FUNCIONALABORATORIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FUNCIONALABORATORIO` (
  `FULA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FUNC_ID` int(11) DEFAULT NULL,
  `LABO_ID` int(11) DEFAULT NULL,
  `FULA_ISBOSS` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FULA_ID`),
  KEY `FK_FUNCIONALABORATORIO_FUNC_ID_idx` (`FUNC_ID`),
  KEY `FK_FUNCIONALABORATORIO_LABO__ID_idx` (`LABO_ID`),
  CONSTRAINT `FK_FUNCIONALABORATORIO_FUNC_ID` FOREIGN KEY (`FUNC_ID`) REFERENCES `TBL_FUNCIONARIOS` (`FUNC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FUNCIONALABORATORIO_LABO__ID` FOREIGN KEY (`LABO_ID`) REFERENCES `TBL_LABORATORIOS` (`LABO_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_FUNCIONALABORATORIO`
--

LOCK TABLES `TBL_FUNCIONALABORATORIO` WRITE;
/*!40000 ALTER TABLE `TBL_FUNCIONALABORATORIO` DISABLE KEYS */;
INSERT INTO `TBL_FUNCIONALABORATORIO` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `TBL_FUNCIONALABORATORIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_FUNCIONARIOS`
--

DROP TABLE IF EXISTS `TBL_FUNCIONARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FUNCIONARIOS` (
  `FUNC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERS_ID` int(11) NOT NULL,
  PRIMARY KEY (`FUNC_ID`),
  KEY `fk_funcionarios_persona_id_idx` (`PERS_ID`),
  CONSTRAINT `fk_funcionarios_persona_id` FOREIGN KEY (`PERS_ID`) REFERENCES `TBL_PERSONAS` (`PERS_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_FUNCIONARIOS`
--

LOCK TABLES `TBL_FUNCIONARIOS` WRITE;
/*!40000 ALTER TABLE `TBL_FUNCIONARIOS` DISABLE KEYS */;
INSERT INTO `TBL_FUNCIONARIOS` VALUES (1,2);
/*!40000 ALTER TABLE `TBL_FUNCIONARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_GENEROS`
--

DROP TABLE IF EXISTS `TBL_GENEROS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_GENEROS` (
  `GENE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GENE_NOMBRE` varchar(45) NOT NULL,
  PRIMARY KEY (`GENE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_GENEROS`
--

LOCK TABLES `TBL_GENEROS` WRITE;
/*!40000 ALTER TABLE `TBL_GENEROS` DISABLE KEYS */;
INSERT INTO `TBL_GENEROS` VALUES (1,'FEMENINO'),(2,'MASCULINO');
/*!40000 ALTER TABLE `TBL_GENEROS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_HERRAMIENTAS`
--

DROP TABLE IF EXISTS `TBL_HERRAMIENTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_HERRAMIENTAS` (
  `HERR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `HERR_CANTIDAD` int(11) NOT NULL,
  `ITNC_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`HERR_ID`),
  KEY `fk_herramienta_itemCualitativo_id_idx` (`ITNC_ID`),
  CONSTRAINT `fk_herramienta_itemCualitativo_id` FOREIGN KEY (`ITNC_ID`) REFERENCES `TBL_ITEMSNOCONSUMIBLES` (`ITNC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_HERRAMIENTAS`
--

LOCK TABLES `TBL_HERRAMIENTAS` WRITE;
/*!40000 ALTER TABLE `TBL_HERRAMIENTAS` DISABLE KEYS */;
INSERT INTO `TBL_HERRAMIENTAS` VALUES (1,1,2);
/*!40000 ALTER TABLE `TBL_HERRAMIENTAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_INVENTARIOS`
--

DROP TABLE IF EXISTS `TBL_INVENTARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_INVENTARIOS` (
  `INVE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INVE_NOMBRE` varchar(200) DEFAULT NULL,
  `INVE_DESCRIPCION` text,
  `INVE_ALIAS` varchar(255) DEFAULT NULL,
  `INVE_CANTIDAD` float DEFAULT NULL COMMENT 'Cantidad de Elementos Actuales',
  `LABO_ID` int(11) DEFAULT NULL,
  `INVE_ESSINGLETON` bit(1) NOT NULL DEFAULT b'0',
  `TIIT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`INVE_ID`),
  UNIQUE KEY `INVE_ALIAS_UNIQUE` (`INVE_ALIAS`),
  KEY `fk_inventarios_laboratorio_id_idx` (`LABO_ID`),
  KEY `FK_INVENTARIOS_TIIT_ID_idx` (`TIIT_ID`),
  CONSTRAINT `FK_INVENTARIOS_TIIT_ID` FOREIGN KEY (`TIIT_ID`) REFERENCES `TBL_TIPOSITEMS` (`TIIT_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_inventarios_laboratorio_id` FOREIGN KEY (`LABO_ID`) REFERENCES `TBL_LABORATORIOS` (`LABO_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_INVENTARIOS`
--

LOCK TABLES `TBL_INVENTARIOS` WRITE;
/*!40000 ALTER TABLE `TBL_INVENTARIOS` DISABLE KEYS */;
INSERT INTO `TBL_INVENTARIOS` VALUES (2,'MATERIALES','Materiales de SILAB','materiales',NULL,NULL,'',4),(6,'REACTIVOS','Reactivos para las practicas de SILAB','reactivos',NULL,NULL,'',3),(7,'EQUIPOS','EQUIPOS de SILAB','equipos',NULL,NULL,'',5),(8,'ACCESORIOS','Accesorios para SILAB IONIC','accesorios',NULL,NULL,'',6),(9,'HERRAMIENTAS','Herramientas, y utensilios  para los laboratorios en SILAB IONIC','herramientas',NULL,NULL,'',7);
/*!40000 ALTER TABLE `TBL_INVENTARIOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `silab_db`.`TBL_INVENTARIOS_BEFORE_INSERT` BEFORE INSERT ON `TBL_INVENTARIOS` FOR EACH ROW
BEGIN
	IF( NEW.INVE_ESSINGLETON = 1 ) THEN
		SET NEW.LABO_ID = NULL;
    ELSE 
		IF( NEW.LABO_ID IS NULL ) THEN 
			SET @msg = concat('ERROR_TRIGGER: Se debe especificar un laboratorio para el inventario, si no es singlenton');
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `silab_db`.`TBL_INVENTARIOS_BEFORE_UPDATE` BEFORE UPDATE ON `TBL_INVENTARIOS` FOR EACH ROW
BEGIN
	IF( NEW.INVE_ESSINGLETON = 1 ) THEN
		SET NEW.LABO_ID = NULL;
    ELSE 
		IF( NEW.LABO_ID IS NULL ) THEN 
			SET @msg = concat('ERROR_TRIGGER: Se debe especificar un laboratorio para el inventario, si no es singlenton');
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TBL_INVENTARIOSCOMPARTIDOS`
--

DROP TABLE IF EXISTS `TBL_INVENTARIOSCOMPARTIDOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_INVENTARIOSCOMPARTIDOS` (
  `INCO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INVE_ID` int(11) NOT NULL,
  `LABO_ID` int(11) NOT NULL,
  PRIMARY KEY (`INCO_ID`),
  UNIQUE KEY `UNIQUE_INVENTARIOSCOMPARTIDOS_INVE_LABO` (`INVE_ID`,`LABO_ID`),
  KEY `FK_INVETARIOSCOMPARTIDOS_INVE_ID_idx` (`INVE_ID`),
  KEY `FK_INVENTARIOSCOMPARTIDOS_LABO_ID_idx` (`LABO_ID`),
  CONSTRAINT `FK_INVENTARIOSCOMPARTIDOS_INVE_ID` FOREIGN KEY (`INVE_ID`) REFERENCES `TBL_INVENTARIOS` (`INVE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INVENTARIOSCOMPARTIDOS_LABO_ID` FOREIGN KEY (`LABO_ID`) REFERENCES `TBL_LABORATORIOS` (`LABO_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_INVENTARIOSCOMPARTIDOS`
--

LOCK TABLES `TBL_INVENTARIOSCOMPARTIDOS` WRITE;
/*!40000 ALTER TABLE `TBL_INVENTARIOSCOMPARTIDOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_INVENTARIOSCOMPARTIDOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_ITEMS`
--

DROP TABLE IF EXISTS `TBL_ITEMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ITEMS` (
  `ITEM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_NOMBRE` varchar(200) NOT NULL,
  `ITEM_OBSERVACION` text,
  `MARC_ID` int(11) NOT NULL,
  `TIIT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`),
  KEY `fk_items_marca_id_idx` (`MARC_ID`),
  KEY `FK_ITEMS_TIIT_ID_idx` (`TIIT_ID`),
  CONSTRAINT `FK_ITEMS_TIIT_ID` FOREIGN KEY (`TIIT_ID`) REFERENCES `TBL_TIPOSITEMS` (`TIIT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_items_marca_id` FOREIGN KEY (`MARC_ID`) REFERENCES `TBL_MARCAS` (`MARC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_ITEMS`
--

LOCK TABLES `TBL_ITEMS` WRITE;
/*!40000 ALTER TABLE `TBL_ITEMS` DISABLE KEYS */;
INSERT INTO `TBL_ITEMS` VALUES (29,'Manganeso Sulfatoso','',1,3),(30,'1-Hexanol','',8,3),(31,'Aceite de Imersión ','',8,3),(32,'Acetona','',8,3),(33,'Acido Acetico 100%','',8,3),(34,'Extrato de Levadura ','Extracto que te llena el alma',2,3),(35,'Etanol Cetona','Etanol Cetona',1,3),(36,'AGITADOR GRANDE','AGITADOR GRANDE',8,4),(37,'Microscopio binocular','Microscopio binocular so cool',5,5),(38,'Peroxido de Hidrogeno','',1,3),(39,'Cartulina Crisppy','Cartulina moldeable y crisppy',7,4),(40,'COMPRESOR BALISTICO','EL MEJOR COMPRESOR',7,7),(41,'AVEC','AVEC el mejor ♥',2,3),(42,'Azanoeta','La mejora azanoeta',2,4),(43,'Pintura acrilica','La mejor pintura acrilica do mund',2,4),(44,'Hojas acrilicas','',2,4),(45,'ASS','',2,4),(46,'hjasd','dasdasd',1,4),(47,'Acido etilopubreno','Muy buen reactivo',1,3),(48,'Monoxodio Petirilico','Especial para reacciones :v',3,3),(49,'Acido Capriciano','Excelente para comer cosas',1,3),(51,'JEANCARLINO','Alcalino JEANCIFUSO',2,3),(52,'CARTULINA GIANINO','LA MEJOR CARTULINA DEL MUNDO',5,4),(53,'ADELINO','ADELINO MATERIAL',8,4);
/*!40000 ALTER TABLE `TBL_ITEMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_ITEMSCONSUMIBLES`
--

DROP TABLE IF EXISTS `TBL_ITEMSCONSUMIBLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ITEMSCONSUMIBLES` (
  `ITCO_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es un item, el cual, su estado es descrito de manera cualitatitva y no es relativa a un rango',
  `ITEM_ID` int(11) NOT NULL,
  `ITCO_MIN` double NOT NULL,
  `ITCO_MAX` double DEFAULT NULL,
  PRIMARY KEY (`ITCO_ID`),
  KEY `fk_items_cualitativos_item_id_idx` (`ITEM_ID`),
  CONSTRAINT `fk_items_cuantitativos_item_id` FOREIGN KEY (`ITEM_ID`) REFERENCES `TBL_ITEMS` (`ITEM_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_ITEMSCONSUMIBLES`
--

LOCK TABLES `TBL_ITEMSCONSUMIBLES` WRITE;
/*!40000 ALTER TABLE `TBL_ITEMSCONSUMIBLES` DISABLE KEYS */;
INSERT INTO `TBL_ITEMSCONSUMIBLES` VALUES (15,29,50,2000),(16,30,50,3000),(17,31,80,300),(18,32,20,3000),(19,33,450,550),(20,34,50,450),(21,35,80,800),(22,36,700,3000),(23,38,50,3000),(24,39,50,200),(25,41,50,3000),(26,42,50,3000),(27,43,80,100),(28,44,50,60),(29,45,480,500),(30,46,50,3000),(31,47,20,100),(32,48,48,25),(33,49,10,65),(35,51,50,70),(36,52,50,3000),(37,53,50,3000);
/*!40000 ALTER TABLE `TBL_ITEMSCONSUMIBLES` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `silab_db`.`TBL_ITEMSCONSUMIBLES_BEFORE_INSERT` BEFORE INSERT ON `TBL_ITEMSCONSUMIBLES` FOR EACH ROW
BEGIN
	IF(NEW.ITCO_MIN IS NULL) THEN
		SET NEW.ITCO_MIN = defaultStockMin();
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TBL_ITEMSNOCONSUMIBLES`
--

DROP TABLE IF EXISTS `TBL_ITEMSNOCONSUMIBLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ITEMSNOCONSUMIBLES` (
  `ITNC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es un item, el cual, su estado es descrito de manera cualitatitva y no es relativa a un rango',
  `ITEM_ID` int(11) NOT NULL,
  `ESNC_ID` int(11) NOT NULL,
  `MODE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITNC_ID`),
  KEY `fk_items_cualitativos_item_id_idx` (`ITEM_ID`),
  KEY `fk_items_cualitativos_estadoCualitativo_id_idx` (`ESNC_ID`),
  KEY `fk_items_cualitativos_modelo_id_idx` (`MODE_ID`),
  CONSTRAINT `fk_items_cualitativos_estadoCualitativo_id` FOREIGN KEY (`ESNC_ID`) REFERENCES `TBL_ESTADOSNOCONSUMIBLE` (`ESNC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_items_cualitativos_item_id` FOREIGN KEY (`ITEM_ID`) REFERENCES `TBL_ITEMS` (`ITEM_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_items_cualitativos_modelo_id` FOREIGN KEY (`MODE_ID`) REFERENCES `TBL_MODELO` (`MODE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_ITEMSNOCONSUMIBLES`
--

LOCK TABLES `TBL_ITEMSNOCONSUMIBLES` WRITE;
/*!40000 ALTER TABLE `TBL_ITEMSNOCONSUMIBLES` DISABLE KEYS */;
INSERT INTO `TBL_ITEMSNOCONSUMIBLES` VALUES (1,37,1,1),(2,40,1,1);
/*!40000 ALTER TABLE `TBL_ITEMSNOCONSUMIBLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_LABORATORIOCONFIGS`
--

DROP TABLE IF EXISTS `TBL_LABORATORIOCONFIGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LABORATORIOCONFIGS` (
  `LACO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERI_ID` int(11) NOT NULL,
  `LACO_STOCKMIN` double DEFAULT NULL,
  `LACO_STOCKMAX` double DEFAULT NULL,
  `LABO_ID` int(11) NOT NULL,
  `TIIT_ID` int(11) DEFAULT NULL COMMENT 'Tipo de item al que se le agrega el stock minimo.',
  `LACO_MAXINVENTARIOS` int(11) DEFAULT NULL,
  `LACO_EXTRADATA` text,
  PRIMARY KEY (`LACO_ID`),
  UNIQUE KEY `UNIQUE_PERI_ID_LABO_ID` (`LABO_ID`,`PERI_ID`),
  KEY `FK_LABORATORIOCONFIGS_LABO_ID_idx` (`LABO_ID`),
  KEY `FK_LABORATORIOCONFIGS_TIIT_ID_idx` (`TIIT_ID`),
  CONSTRAINT `FK_LABORATORIOCONFIGS_LABO_ID` FOREIGN KEY (`LABO_ID`) REFERENCES `TBL_LABORATORIOS` (`LABO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_LABORATORIOCONFIGS_TIIT_ID` FOREIGN KEY (`TIIT_ID`) REFERENCES `TBL_TIPOSITEMS` (`TIIT_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_LABORATORIOCONFIGS`
--

LOCK TABLES `TBL_LABORATORIOCONFIGS` WRITE;
/*!40000 ALTER TABLE `TBL_LABORATORIOCONFIGS` DISABLE KEYS */;
INSERT INTO `TBL_LABORATORIOCONFIGS` VALUES (4,5,40,500,1,NULL,5,NULL);
/*!40000 ALTER TABLE `TBL_LABORATORIOCONFIGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_LABORATORIOS`
--

DROP TABLE IF EXISTS `TBL_LABORATORIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LABORATORIOS` (
  `LABO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABO_NOMBRE` varchar(100) NOT NULL,
  `LABO_NIVEL` int(11) NOT NULL DEFAULT '0',
  `EDIF_ID` int(11) NOT NULL,
  `COOR_ID` int(11) NOT NULL,
  `TILA_ID` int(11) NOT NULL,
  PRIMARY KEY (`LABO_ID`),
  KEY `fk_laboratorios_coordinador_id_idx` (`COOR_ID`),
  KEY `fk_laboratorios_edificio_id_idx` (`EDIF_ID`),
  KEY `fk_LABoratorios_tila_id_idx` (`TILA_ID`),
  CONSTRAINT `FK_LABORATORIOS_TILA_ID` FOREIGN KEY (`TILA_ID`) REFERENCES `TBL_TIPOLABORATORIOS` (`TILA_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_laboratorios_coordinador_id` FOREIGN KEY (`COOR_ID`) REFERENCES `TBL_COORDINADORES` (`COOR_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_laboratorios_edificio_id` FOREIGN KEY (`EDIF_ID`) REFERENCES `TBL_EDIFICIOS` (`EDIF_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_LABORATORIOS`
--

LOCK TABLES `TBL_LABORATORIOS` WRITE;
/*!40000 ALTER TABLE `TBL_LABORATORIOS` DISABLE KEYS */;
INSERT INTO `TBL_LABORATORIOS` VALUES (1,'LAB BIOLOGIA',0,1,1,2),(2,'LAB LUDOTECA',0,1,1,1);
/*!40000 ALTER TABLE `TBL_LABORATORIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_LOGTIPO`
--

DROP TABLE IF EXISTS `TBL_LOGTIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LOGTIPO` (
  `LOTI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOTI_DESCRIPCION` int(11) DEFAULT NULL,
  PRIMARY KEY (`LOTI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_LOGTIPO`
--

LOCK TABLES `TBL_LOGTIPO` WRITE;
/*!40000 ALTER TABLE `TBL_LOGTIPO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_LOGTIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_MARCAS`
--

DROP TABLE IF EXISTS `TBL_MARCAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_MARCAS` (
  `MARC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `MARC_NOMBRE` varchar(200) NOT NULL,
  PRIMARY KEY (`MARC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_MARCAS`
--

LOCK TABLES `TBL_MARCAS` WRITE;
/*!40000 ALTER TABLE `TBL_MARCAS` DISABLE KEYS */;
INSERT INTO `TBL_MARCAS` VALUES (1,'CASPI LABS'),(2,'MARXWOLL'),(3,'DOPENGANGER'),(4,'HEWLETT PACKARD'),(5,'SAMSUNG'),(6,'BLACK AND DECKER'),(7,'WOODCORPS'),(8,'SIN MARCA');
/*!40000 ALTER TABLE `TBL_MARCAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_MATERIALES`
--

DROP TABLE IF EXISTS `TBL_MATERIALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_MATERIALES` (
  `MATE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MATE_MEDIDA` varchar(45) DEFAULT NULL,
  `ITCO_ID` int(11) NOT NULL,
  PRIMARY KEY (`MATE_ID`),
  KEY `fk_materiales_itemCualitativo_id_idx` (`ITCO_ID`),
  CONSTRAINT `fk_materiales_itemCualitativo_id` FOREIGN KEY (`ITCO_ID`) REFERENCES `TBL_ITEMSCONSUMIBLES` (`ITCO_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_MATERIALES`
--

LOCK TABLES `TBL_MATERIALES` WRITE;
/*!40000 ALTER TABLE `TBL_MATERIALES` DISABLE KEYS */;
INSERT INTO `TBL_MATERIALES` VALUES (1,'UND',22),(2,'metro',24),(3,'metris',26),(4,'4m',27),(5,'3456',28),(6,'ass',29),(7,'asd',30),(8,'',36),(9,'45',37);
/*!40000 ALTER TABLE `TBL_MATERIALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_MODELO`
--

DROP TABLE IF EXISTS `TBL_MODELO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_MODELO` (
  `MODE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODE_CODIGO` varchar(200) NOT NULL,
  `MODE_EMPTY` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MODE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_MODELO`
--

LOCK TABLES `TBL_MODELO` WRITE;
/*!40000 ALTER TABLE `TBL_MODELO` DISABLE KEYS */;
INSERT INTO `TBL_MODELO` VALUES (1,'SIN MODELO',1);
/*!40000 ALTER TABLE `TBL_MODELO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_MOVIMIENTOS`
--

DROP TABLE IF EXISTS `TBL_MOVIMIENTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_MOVIMIENTOS` (
  `MOVI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MOVI_FECHA` datetime DEFAULT NULL,
  `MOVI_CODIGO` varchar(100) DEFAULT NULL,
  `TIMO_ID` int(11) NOT NULL,
  `SOLID_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MOVI_ID`),
  KEY `FK_MOVIMIENTOS_TIMO_ID_idx` (`TIMO_ID`),
  KEY `FK_MOVIMIENTOS_SOLI_ID_idx` (`SOLID_ID`),
  CONSTRAINT `FK_MOVIMIENTOS_SOLI_ID` FOREIGN KEY (`SOLID_ID`) REFERENCES `TBL_SOLICITUDES` (`SOLI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MOVIMIENTOS_TIMO_ID` FOREIGN KEY (`TIMO_ID`) REFERENCES `TBL_TIPOMOVIMIENTOS` (`TIMO_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_MOVIMIENTOS`
--

LOCK TABLES `TBL_MOVIMIENTOS` WRITE;
/*!40000 ALTER TABLE `TBL_MOVIMIENTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_MOVIMIENTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PERFILESROLES`
--

DROP TABLE IF EXISTS `TBL_PERFILESROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PERFILESROLES` (
  `PERO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROL_ID` int(11) NOT NULL,
  `PERM_ID` int(11) NOT NULL,
  `PERO_PADRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`PERO_ID`),
  UNIQUE KEY `UNIQUE_ROLES_PERMISOS` (`ROL_ID`,`PERM_ID`),
  KEY `FK_ROLES_ROL_ID_idx` (`ROL_ID`),
  KEY `FK_PERFILESROLES_PERM_ID_idx` (`PERM_ID`),
  KEY `FK_PERFILESROLES_PERO_PADRE_idx` (`PERO_PADRE`),
  CONSTRAINT `FK_PERFILESROLES_PERM_ID` FOREIGN KEY (`PERM_ID`) REFERENCES `TBL_PERMISOS` (`PERM_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PERFILROLES_ROL_ID` FOREIGN KEY (`ROL_ID`) REFERENCES `TBL_ROLES` (`ROL_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `REF_PERFILESROLES_PERO_PADRE` FOREIGN KEY (`PERO_PADRE`) REFERENCES `TBL_PERFILESROLES` (`PERO_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PERFILESROLES`
--

LOCK TABLES `TBL_PERFILESROLES` WRITE;
/*!40000 ALTER TABLE `TBL_PERFILESROLES` DISABLE KEYS */;
INSERT INTO `TBL_PERFILESROLES` VALUES (1,2,1,2),(2,2,2,NULL);
/*!40000 ALTER TABLE `TBL_PERFILESROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PERIODOS`
--

DROP TABLE IF EXISTS `TBL_PERIODOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PERIODOS` (
  `PERI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERI_SEMESTRE` int(11) NOT NULL,
  `PERI_FECHA` date DEFAULT NULL,
  PRIMARY KEY (`PERI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PERIODOS`
--

LOCK TABLES `TBL_PERIODOS` WRITE;
/*!40000 ALTER TABLE `TBL_PERIODOS` DISABLE KEYS */;
INSERT INTO `TBL_PERIODOS` VALUES (1,1,'2016-01-01'),(2,2,'2016-07-01'),(3,1,'2015-01-01'),(4,2,'2015-07-01'),(5,1,'2017-01-01'),(6,2,'2017-07-01');
/*!40000 ALTER TABLE `TBL_PERIODOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PERMISOS`
--

DROP TABLE IF EXISTS `TBL_PERMISOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PERMISOS` (
  `PERM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERM_ACCION` varchar(45) DEFAULT NULL,
  `PERM_CONTROLADOR` varchar(45) DEFAULT NULL,
  `PERM_MODULO` varchar(45) DEFAULT NULL,
  `PERM_PADRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`PERM_ID`),
  KEY `FK_PERMISOS_PERM_PADRE_idx` (`PERM_PADRE`),
  CONSTRAINT `REF_PERMISOS_PERM_PADRE` FOREIGN KEY (`PERM_PADRE`) REFERENCES `TBL_PERMISOS` (`PERM_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PERMISOS`
--

LOCK TABLES `TBL_PERMISOS` WRITE;
/*!40000 ALTER TABLE `TBL_PERMISOS` DISABLE KEYS */;
INSERT INTO `TBL_PERMISOS` VALUES (1,'index','rol','admin',2),(2,'all','rol','admin',NULL);
/*!40000 ALTER TABLE `TBL_PERMISOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PERSONAS`
--

DROP TABLE IF EXISTS `TBL_PERSONAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PERSONAS` (
  `PERS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `PERS_NOMBRE` varchar(100) NOT NULL COMMENT 'Nombre',
  `PERS_IDENTIFICACION` bigint(20) NOT NULL COMMENT 'Documento de identidad',
  `GENE_ID` int(11) NOT NULL COMMENT 'Genero',
  `TIID_ID` int(11) NOT NULL COMMENT 'Tipo de documento',
  PRIMARY KEY (`PERS_ID`),
  KEY `fk_personas_tipoId_id_idx` (`TIID_ID`),
  KEY `fk_personas_genero_id_idx` (`GENE_ID`),
  CONSTRAINT `fk_personas_genero_id` FOREIGN KEY (`GENE_ID`) REFERENCES `TBL_GENEROS` (`GENE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_personas_tipoId_id` FOREIGN KEY (`TIID_ID`) REFERENCES `TBL_TIPOIDENTIFICACIONES` (`TIID_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PERSONAS`
--

LOCK TABLES `TBL_PERSONAS` WRITE;
/*!40000 ALTER TABLE `TBL_PERSONAS` DISABLE KEYS */;
INSERT INTO `TBL_PERSONAS` VALUES (1,'LOIDA HORTENCIA GIMENEZ GOMEZ',1552487524,1,1),(2,'PAOLO G. HERNANDEZ',11584621,2,1),(3,'ANGELICA HORTIZ',11825448,1,1);
/*!40000 ALTER TABLE `TBL_PERSONAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PROVEDORES`
--

DROP TABLE IF EXISTS `TBL_PROVEDORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PROVEDORES` (
  `PROV_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROV_NOMBRE` varchar(100) NOT NULL,
  `PROV_NIT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PROV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PROVEDORES`
--

LOCK TABLES `TBL_PROVEDORES` WRITE;
/*!40000 ALTER TABLE `TBL_PROVEDORES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_PROVEDORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_RANGOSCONSUMIBLE`
--

DROP TABLE IF EXISTS `TBL_RANGOSCONSUMIBLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RANGOSCONSUMIBLE` (
  `RACO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITCO_ID` int(11) NOT NULL,
  `ESCO_ID` int(11) NOT NULL,
  `RACO_MIN` double NOT NULL,
  `RACO_MAX` double DEFAULT NULL,
  `RACO_ALIAS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RACO_ID`),
  UNIQUE KEY `UNIQUE_ITCO_ESCO_ID` (`ITCO_ID`,`ESCO_ID`),
  KEY `FK_RANGOCONSUMIBLE_ITCO_ID_idx` (`ITCO_ID`),
  KEY `FK_RANGOCONSUMIBLE_ESCO_ID_idx` (`ESCO_ID`),
  CONSTRAINT `FK_RANGOCONSUMIBLE_ESCO_ID` FOREIGN KEY (`ESCO_ID`) REFERENCES `TBL_ESTADOSCONSUMIBLE` (`ESCO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RANGOCONSUMIBLE_ITCO_ID` FOREIGN KEY (`ITCO_ID`) REFERENCES `TBL_ITEMSCONSUMIBLES` (`ITCO_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_RANGOSCONSUMIBLE`
--

LOCK TABLES `TBL_RANGOSCONSUMIBLE` WRITE;
/*!40000 ALTER TABLE `TBL_RANGOSCONSUMIBLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_RANGOSCONSUMIBLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_REACTIVOS`
--

DROP TABLE IF EXISTS `TBL_REACTIVOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REACTIVOS` (
  `REAC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REAC_CODIGO` varchar(100) NOT NULL,
  `REAC_FECHA_VENCIMIENTO` date NOT NULL,
  `ITCO_ID` int(11) NOT NULL,
  `UBIC_ID` int(11) NOT NULL,
  `CADU_ID` int(11) NOT NULL,
  `SIMB_ID` int(11) NOT NULL,
  `UNID_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`REAC_ID`),
  KEY `fk_reactivos_caducidad_id_idx` (`CADU_ID`),
  KEY `fk_reactivos_ubicacion_id_idx` (`UBIC_ID`),
  KEY `fk_reactivos_simbolo_id_idx` (`SIMB_ID`),
  KEY `fk_reactivos_itemCuantitativo_id_idx` (`ITCO_ID`),
  KEY `FK_REACTIVOS_UNID_ID_idx` (`UNID_ID`),
  CONSTRAINT `FK_REACTIVOS_UNID_ID` FOREIGN KEY (`UNID_ID`) REFERENCES `TBL_UNIDADES` (`UNID_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_reactivos_caducidad_id` FOREIGN KEY (`CADU_ID`) REFERENCES `TBL_CADUCIDADES` (`CADU_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reactivos_itemCuantitativo_id` FOREIGN KEY (`ITCO_ID`) REFERENCES `TBL_ITEMSCONSUMIBLES` (`ITCO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reactivos_simbolo_id` FOREIGN KEY (`SIMB_ID`) REFERENCES `TBL_SIMBOLOS` (`SIMB_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reactivos_ubicacion_id` FOREIGN KEY (`UBIC_ID`) REFERENCES `TBL_UBICACIONES` (`UBIC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_REACTIVOS`
--

LOCK TABLES `TBL_REACTIVOS` WRITE;
/*!40000 ALTER TABLE `TBL_REACTIVOS` DISABLE KEYS */;
INSERT INTO `TBL_REACTIVOS` VALUES (8,'460307','2020-01-01',15,1,1,1,3),(9,'483007','2020-01-01',16,1,1,1,3),(10,'482957','2020-06-11',17,1,1,2,3),(11,'TR0423','2020-01-17',18,1,1,3,3),(12,'340402','2020-01-01',19,2,1,3,3),(13,'CA100507','2020-08-27',20,1,1,4,2),(14,'10765','2017-02-23',21,2,2,6,3),(15,'428658','2020-10-29',23,1,1,3,3),(16,'AVEss','2017-02-16',25,2,2,2,3),(17,'R12S','2017-02-27',31,2,2,2,3),(18,'MPeti','2017-02-24',32,2,2,4,3),(19,'ACapri','2020-07-23',33,2,1,3,3),(21,'JLINO','2017-02-14',35,1,3,7,3);
/*!40000 ALTER TABLE `TBL_REACTIVOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_ROLES`
--

DROP TABLE IF EXISTS `TBL_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ROLES` (
  `ROL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROL_NOMBRE` varchar(45) NOT NULL,
  `ROL_ORDEN` int(11) NOT NULL,
  PRIMARY KEY (`ROL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_ROLES`
--

LOCK TABLES `TBL_ROLES` WRITE;
/*!40000 ALTER TABLE `TBL_ROLES` DISABLE KEYS */;
INSERT INTO `TBL_ROLES` VALUES (1,'COORDINADOR',1),(2,'ADMINISTRADOR',2),(3,'FUNCIONARIO',3),(4,'DOCENTE',4);
/*!40000 ALTER TABLE `TBL_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_SILABCONFIGS`
--

DROP TABLE IF EXISTS `TBL_SILABCONFIGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SILABCONFIGS` (
  `SILAB_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SILAB_VERSION` double DEFAULT '1',
  `SILAB_PATH` double DEFAULT '1',
  `SILAB_NAME` varchar(45) NOT NULL,
  `SILAB_STOCK_MIN` double NOT NULL DEFAULT '50',
  `SILAB_STOCK_MAX` double DEFAULT '2000',
  `SILAB_MAX_INVENTARIOS` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SILAB_ID`),
  UNIQUE KEY `SILAB_VERSION_UNIQUE` (`SILAB_VERSION`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_SILABCONFIGS`
--

LOCK TABLES `TBL_SILABCONFIGS` WRITE;
/*!40000 ALTER TABLE `TBL_SILABCONFIGS` DISABLE KEYS */;
INSERT INTO `TBL_SILABCONFIGS` VALUES (1,1,1,'SILAB IONIC',50,3000,5,'2017-02-03 17:12:41');
/*!40000 ALTER TABLE `TBL_SILABCONFIGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_SIMBOLOS`
--

DROP TABLE IF EXISTS `TBL_SIMBOLOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SIMBOLOS` (
  `SIMB_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SIMB_NOMBRE` varchar(100) NOT NULL,
  `SIMB_CODIGO` varchar(45) DEFAULT '',
  PRIMARY KEY (`SIMB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_SIMBOLOS`
--

LOCK TABLES `TBL_SIMBOLOS` WRITE;
/*!40000 ALTER TABLE `TBL_SIMBOLOS` DISABLE KEYS */;
INSERT INTO `TBL_SIMBOLOS` VALUES (1,'NOCIVO','NC'),(2,'CORROSIVO','CRR'),(3,'IRRITANTE','IRR'),(4,'INFLAMABLE','INF'),(5,'LIGERO','LGR'),(6,'TOXICO','TXC'),(7,'RIESGO NULO','RGNL'),(8,'TOXICO - INFLAMABLE','TXC-INF'),(9,'NOCIVO - PELIGRO PARA AMBIENTE','NCV-PAMB');
/*!40000 ALTER TABLE `TBL_SIMBOLOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_SOLICITUDES`
--

DROP TABLE IF EXISTS `TBL_SOLICITUDES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SOLICITUDES` (
  `SOLI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOLI_FECHA` datetime DEFAULT CURRENT_TIMESTAMP,
  `SOLI_CODIGO` varchar(100) DEFAULT NULL,
  `TISO_ID` int(11) NOT NULL,
  `ESSO_ID` int(11) NOT NULL,
  PRIMARY KEY (`SOLI_ID`),
  KEY `FK_SOLICITUDES_ESSO_ID_idx` (`ESSO_ID`),
  KEY `FK_SOLICTUDES_TISO_ID_idx` (`TISO_ID`),
  CONSTRAINT `FK_SOLICITUDES_ESSO_ID` FOREIGN KEY (`ESSO_ID`) REFERENCES `TBL_ESTADOSOLICITUD` (`ESSO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SOLICITUDES_TISO_ID` FOREIGN KEY (`TISO_ID`) REFERENCES `TBL_TIPOSOLICITUD` (`TISO_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_SOLICITUDES`
--

LOCK TABLES `TBL_SOLICITUDES` WRITE;
/*!40000 ALTER TABLE `TBL_SOLICITUDES` DISABLE KEYS */;
INSERT INTO `TBL_SOLICITUDES` VALUES (1,'2017-02-14 12:19:49','SOL-A1',1,1);
/*!40000 ALTER TABLE `TBL_SOLICITUDES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_STOCK`
--

DROP TABLE IF EXISTS `TBL_STOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_STOCK` (
  `STOC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) NOT NULL,
  `INVE_ID` int(11) NOT NULL,
  `STOC_CANTIDAD` double NOT NULL,
  `PERI_ID` int(11) NOT NULL,
  `CADU_ID` int(11) DEFAULT NULL,
  `STOC_ESCONSUMIBLE` bit(1) DEFAULT NULL,
  `LABO_ID` int(11) DEFAULT NULL,
  `STOC_MIN` double DEFAULT NULL,
  `STOC_MAX` double DEFAULT NULL,
  PRIMARY KEY (`STOC_ID`),
  KEY `FK_ITEMSSTOCK_ITEM_ID_idx` (`ITEM_ID`),
  KEY `FK_ITEMSSTOCK_INVE_ID_idx` (`INVE_ID`),
  KEY `FK_ITEMSSTOCK_PERI_ID_idx` (`PERI_ID`),
  KEY `FK_ITEMSSTOC_CADU_ID_idx` (`CADU_ID`),
  KEY `FK_ITEMSSTOC_CADU_ID_idx1` (`LABO_ID`),
  CONSTRAINT `FK_ITEMSSTOCK_INVE_ID` FOREIGN KEY (`INVE_ID`) REFERENCES `TBL_INVENTARIOS` (`INVE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ITEMSSTOCK_ITEM_ID` FOREIGN KEY (`ITEM_ID`) REFERENCES `TBL_ITEMS` (`ITEM_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ITEMSSTOCK_PERI_ID` FOREIGN KEY (`PERI_ID`) REFERENCES `TBL_PERIODOS` (`PERI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ITEMSSTOC_CADU_ID` FOREIGN KEY (`CADU_ID`) REFERENCES `TBL_CADUCIDADES` (`CADU_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_ITEMSSTOC_LABO_ID` FOREIGN KEY (`LABO_ID`) REFERENCES `TBL_LABORATORIOS` (`LABO_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_STOCK`
--

LOCK TABLES `TBL_STOCK` WRITE;
/*!40000 ALTER TABLE `TBL_STOCK` DISABLE KEYS */;
INSERT INTO `TBL_STOCK` VALUES (2,29,6,130,5,NULL,'',1,50,2000),(4,36,2,800,5,NULL,'',1,700,3000),(5,37,7,1,5,NULL,'\0',1,1,1),(7,38,6,80,5,NULL,'',1,50,3000),(8,33,6,500,5,NULL,'',1,450,550),(9,34,6,80,5,NULL,'',1,50,450),(10,40,9,1,5,NULL,'\0',1,1,1),(11,39,2,80,5,NULL,'',1,50,200),(14,43,2,90,5,NULL,'',1,80,100),(15,44,2,55,5,NULL,'',1,50,60),(18,51,6,0,5,NULL,'',1,50,70),(19,52,2,51,5,NULL,'',1,50,3000),(20,42,2,51,5,NULL,'',1,50,3000),(21,45,2,481,5,NULL,'',1,480,500),(22,53,2,58,5,NULL,'',1,50,3000),(24,46,2,58,5,NULL,'',1,50,3000);
/*!40000 ALTER TABLE `TBL_STOCK` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `silab_db`.`TBL_STOCK_BEFORE_INSERT` BEFORE INSERT ON `TBL_STOCK` FOR EACH ROW
BEGIN

    DECLARE isSingleton BIT;
    DECLARE isConsumible BIT;

	IF( alreadyInStock(NEW.ITEM_ID, NEW.INVE_ID, NEW.LABO_ID) = 1 ) THEN
		SET @msg = concat('1062: Ya existe en stock del laboratorio, el item ' );
        SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = @msg;
    END IF; 
    
    SET isConsumible = isConsumible(NEW.ITEM_ID);
    -- Let's check is this sweetie is single 
    SET isSingleton = isSingletonInventory( NEW.INVE_ID );
    
	SET NEW.STOC_ESCONSUMIBLE = isConsumible(NEW.ITEM_ID);
    
    -- Check if the inventory is singleto and the laboratory isn't null
    IF( isSingletonInventory( NEW.INVE_ID ) = 1 AND NEW.LABO_ID IS NULL ) THEN 
		SET @msg = concat('ERROR_TRIGGER: El Inventario ''', getInventoryName( NEW.INVE_ID ), ''' es singlenton, por tanto, los stocks deben especificar la localizacion del laboratorio' );
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	
    -- Single?
    ELSEIF( isSingleton = 1 AND NEW.LABO_ID IS NOT NULL AND isConsumible = 1 ) THEN
		-- 1. Need you so badly!
		IF( NEW.STOC_MIN IS NULL ) THEN
			SET NEW.STOC_MIN = defaultStockMaxByLaboratory(LABO_ID);
		END IF;
        
		-- 2. But also, I need a limit
		IF( NEW.STOC_MAX IS NULL ) THEN
			SET NEW.STOC_MAX = defaultStockMaxByLaboratory(LABO_ID);
		END IF;
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `silab_db`.`TBL_STOCK_BEFORE_UPDATE` BEFORE UPDATE ON `TBL_STOCK` FOR EACH ROW
BEGIN
	DECLARE isSingleton BIT;
    DECLARE isConsumible BIT;
    
    IF( alreadyInStock(NEW.ITEM_ID, NEW.INVE_ID, NEW.LABO_ID) = 1 ) THEN
		SET @msg = concat('1062: Ya existe en stock del laboratorio, el item ' );
        SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = @msg;
    END IF; 
    
    SET isConsumible = isConsumible(NEW.ITEM_ID);
    -- Let's check is this sweetie is single 
    SET isSingleton = isSingletonInventory( NEW.INVE_ID );
    
	SET NEW.STOC_ESCONSUMIBLE = isConsumible(NEW.ITEM_ID);
    
    -- Check if the inventory is singleto and the laboratory isn't null
    IF( isSingletonInventory( NEW.INVE_ID ) = 1 AND NEW.LABO_ID IS NULL ) THEN 
		SET @msg = concat('ERROR_TRIGGER: El Inventario ''', getInventoryName( NEW.INVE_ID ), ''' es singlenton, por tanto, los stocks deben especificar la localizacion del laboratorio' );
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	
    -- Single?
    ELSEIF( isSingleton = 1 AND NEW.LABO_ID IS NOT NULL AND isConsumible = 1 ) THEN
		-- 1. Need you so badly!
		IF( NEW.STOC_MIN IS NULL ) THEN
			SET NEW.STOC_MIN = defaultStockMaxByLaboratory(LABO_ID);
		END IF;
        
		-- 2. But also, I need a limit
		IF( NEW.STOC_MAX IS NULL ) THEN
			SET NEW.STOC_MAX = defaultStockMaxByLaboratory(LABO_ID);
		END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TBL_STOCKVENCIMIENTOS`
--

DROP TABLE IF EXISTS `TBL_STOCKVENCIMIENTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_STOCKVENCIMIENTOS` (
  `STVE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FLUJ_ID` int(11) NOT NULL,
  `STVE_VENCIDO` bit(1) NOT NULL DEFAULT b'0',
  `STVE_FECHAVENCIMIENTO` date NOT NULL,
  PRIMARY KEY (`STVE_ID`),
  KEY `FK_STOCKVENCIMIENTO_FLUJ_ID_idx` (`FLUJ_ID`),
  CONSTRAINT `FK_STOCKVENCIMIENTO_FLUJ_ID` FOREIGN KEY (`FLUJ_ID`) REFERENCES `TBL_FLUJOS` (`FLUJ_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_STOCKVENCIMIENTOS`
--

LOCK TABLES `TBL_STOCKVENCIMIENTOS` WRITE;
/*!40000 ALTER TABLE `TBL_STOCKVENCIMIENTOS` DISABLE KEYS */;
INSERT INTO `TBL_STOCKVENCIMIENTOS` VALUES (1,1,'\0','2017-03-09'),(2,8,'\0','2020-08-27'),(3,9,'\0','2017-02-15');
/*!40000 ALTER TABLE `TBL_STOCKVENCIMIENTOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `silab_db`.`TBL_STOCKVENCIMIENTOS_BEFORE_INSERT` BEFORE INSERT ON `TBL_STOCKVENCIMIENTOS` FOR EACH ROW
BEGIN
	IF( isEntryFlow( NEW.FLUJ_ID ) = 0 ) THEN
		SET @msg = concat('ERROR_TRIGGER: Solo se admiten entradas');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	END IF;
    
    IF ( isConsumibleFlow( NEW.FLUJ_ID ) = 0 ) THEN
		SET @msg = concat('ERROR_TRIGGER: Solo se admiten items vencibles o consumibles');
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	END IF;
    
    IF ( isExpirableFlow( NEW.FLUJ_ID ) = 0 ) THEN
		SET @msg = concat('ERROR_TRIGGER: Solo se admiten items que tengan fecha de caducidad');
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	END IF;
    
    SET NEW.STVE_VENCIDO = estaVencido(NEW.STVE_FECHAVENCIMIENTO);
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `silab_db`.`TBL_STOCKVENCIMIENTOS_BEFORE_UPDATE` BEFORE UPDATE ON `TBL_STOCKVENCIMIENTOS` FOR EACH ROW
BEGIN
	IF( isEntryFlow( NEW.FLUJ_ID ) = 0 ) THEN
		SET @msg = concat('ERROR_TRIGGER: Solo se admiten entradas');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	END IF;
    
    IF ( isConsumibleFlow( NEW.FLUJ_ID ) = 0 ) THEN
		SET @msg = concat('ERROR_TRIGGER: Solo se admiten items vencibles o consumibles');
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	END IF;
    
    IF ( isExpirableFlow( NEW.FLUJ_ID ) = 0 ) THEN
		SET @msg = concat('ERROR_TRIGGER: Solo se admiten items que tengan fecha de caducidad');
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	END IF;
    
    SET NEW.STVE_VENCIDO = estaVencido(NEW.STVE_FECHAVENCIMIENTO);
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TBL_TIPOFLUJO`
--

DROP TABLE IF EXISTS `TBL_TIPOFLUJO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TIPOFLUJO` (
  `TIFL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIFL_NOMBRE` varchar(45) DEFAULT NULL,
  `TIFL_CONSTANTE` double DEFAULT NULL,
  PRIMARY KEY (`TIFL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_TIPOFLUJO`
--

LOCK TABLES `TBL_TIPOFLUJO` WRITE;
/*!40000 ALTER TABLE `TBL_TIPOFLUJO` DISABLE KEYS */;
INSERT INTO `TBL_TIPOFLUJO` VALUES (1,'ENTRADA',1),(2,'SALIDA',-1);
/*!40000 ALTER TABLE `TBL_TIPOFLUJO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_TIPOIDENTIFICACIONES`
--

DROP TABLE IF EXISTS `TBL_TIPOIDENTIFICACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TIPOIDENTIFICACIONES` (
  `TIID_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIID_NOMBRE` varchar(45) NOT NULL,
  PRIMARY KEY (`TIID_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_TIPOIDENTIFICACIONES`
--

LOCK TABLES `TBL_TIPOIDENTIFICACIONES` WRITE;
/*!40000 ALTER TABLE `TBL_TIPOIDENTIFICACIONES` DISABLE KEYS */;
INSERT INTO `TBL_TIPOIDENTIFICACIONES` VALUES (1,'CEDULA'),(2,'TARJETA DE IDENTIDAD');
/*!40000 ALTER TABLE `TBL_TIPOIDENTIFICACIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_TIPOLABORATORIOS`
--

DROP TABLE IF EXISTS `TBL_TIPOLABORATORIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TIPOLABORATORIOS` (
  `TILA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tipo de Laboratorio',
  `TILA_NOMBRE` varchar(70) NOT NULL,
  PRIMARY KEY (`TILA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_TIPOLABORATORIOS`
--

LOCK TABLES `TBL_TIPOLABORATORIOS` WRITE;
/*!40000 ALTER TABLE `TBL_TIPOLABORATORIOS` DISABLE KEYS */;
INSERT INTO `TBL_TIPOLABORATORIOS` VALUES (1,'DOCENCIA'),(2,'INVESTIGACION');
/*!40000 ALTER TABLE `TBL_TIPOLABORATORIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_TIPOMOVIMIENTOS`
--

DROP TABLE IF EXISTS `TBL_TIPOMOVIMIENTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TIPOMOVIMIENTOS` (
  `TIMO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMO_NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TIMO_ID`),
  UNIQUE KEY `TIMO_NOMBRE_UNIQUE` (`TIMO_NOMBRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_TIPOMOVIMIENTOS`
--

LOCK TABLES `TBL_TIPOMOVIMIENTOS` WRITE;
/*!40000 ALTER TABLE `TBL_TIPOMOVIMIENTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_TIPOMOVIMIENTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_TIPOSITEMS`
--

DROP TABLE IF EXISTS `TBL_TIPOSITEMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TIPOSITEMS` (
  `TIIT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIIT_NOMBRE` varchar(45) NOT NULL,
  `TIIT_PADRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`TIIT_ID`),
  KEY `REF_TIPOSITEMS_TIIT_PADRE_ID_idx` (`TIIT_PADRE`),
  CONSTRAINT `REF_TIPOSITEMS_TIIT_PADRE_ID` FOREIGN KEY (`TIIT_PADRE`) REFERENCES `TBL_TIPOSITEMS` (`TIIT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_TIPOSITEMS`
--

LOCK TABLES `TBL_TIPOSITEMS` WRITE;
/*!40000 ALTER TABLE `TBL_TIPOSITEMS` DISABLE KEYS */;
INSERT INTO `TBL_TIPOSITEMS` VALUES (1,'CONSUMIBLE',NULL),(2,'NOCONSUMIBLE',NULL),(3,'REACTIVO',1),(4,'MATERIAL',1),(5,'EQUIPO',2),(6,'ACCESORIO',2),(7,'HERRAMIENTA',2);
/*!40000 ALTER TABLE `TBL_TIPOSITEMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_TIPOSOLICITUD`
--

DROP TABLE IF EXISTS `TBL_TIPOSOLICITUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TIPOSOLICITUD` (
  `TISO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TISO_NOMBRE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TISO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_TIPOSOLICITUD`
--

LOCK TABLES `TBL_TIPOSOLICITUD` WRITE;
/*!40000 ALTER TABLE `TBL_TIPOSOLICITUD` DISABLE KEYS */;
INSERT INTO `TBL_TIPOSOLICITUD` VALUES (1,'REPOSICION'),(2,'EXTRACCION');
/*!40000 ALTER TABLE `TBL_TIPOSOLICITUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_UBICACIONES`
--

DROP TABLE IF EXISTS `TBL_UBICACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_UBICACIONES` (
  `UBIC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UBIC_ESTANTE` int(11) NOT NULL,
  `UBIC_NIVEL` int(11) NOT NULL,
  `UBIC_CODIGO` varchar(45) DEFAULT NULL COMMENT 'Codigo para agregar facilibilidad de memorizacion del estante y su nivel',
  PRIMARY KEY (`UBIC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_UBICACIONES`
--

LOCK TABLES `TBL_UBICACIONES` WRITE;
/*!40000 ALTER TABLE `TBL_UBICACIONES` DISABLE KEYS */;
INSERT INTO `TBL_UBICACIONES` VALUES (1,1,1,'A1'),(2,1,2,'B1');
/*!40000 ALTER TABLE `TBL_UBICACIONES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_UNIDADES`
--

DROP TABLE IF EXISTS `TBL_UNIDADES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_UNIDADES` (
  `UNID_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UNID_NOMBRE` varchar(45) NOT NULL,
  `UNID_DESCRIPCION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UNID_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_UNIDADES`
--

LOCK TABLES `TBL_UNIDADES` WRITE;
/*!40000 ALTER TABLE `TBL_UNIDADES` DISABLE KEYS */;
INSERT INTO `TBL_UNIDADES` VALUES (1,'M','Metro (M)'),(2,'Kg','Kilogramo (Kg)'),(3,'g','Gramo (g)');
/*!40000 ALTER TABLE `TBL_UNIDADES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_USUARIOS`
--

DROP TABLE IF EXISTS `TBL_USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USUARIOS` (
  `USUA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USUA_USUARIO` varchar(45) NOT NULL,
  `USUA_PASSWORD` varchar(45) NOT NULL,
  `USUA_ES_ACTIVO` tinyint(1) DEFAULT '1',
  `USUA_TOKEN` varchar(250) DEFAULT NULL,
  `PERS_ID` int(11) NOT NULL,
  `ROL_ID` int(11) NOT NULL,
  PRIMARY KEY (`USUA_ID`),
  KEY `FK_USUARIOS_PERS_ID_idx` (`PERS_ID`),
  KEY `FK_USUARIOS_ROL_ID_idx` (`ROL_ID`),
  CONSTRAINT `FK_USUARIOS_PERS_ID` FOREIGN KEY (`PERS_ID`) REFERENCES `TBL_PERSONAS` (`PERS_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USUARIOS_ROL_ID` FOREIGN KEY (`ROL_ID`) REFERENCES `TBL_ROLES` (`ROL_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_USUARIOS`
--

LOCK TABLES `TBL_USUARIOS` WRITE;
/*!40000 ALTER TABLE `TBL_USUARIOS` DISABLE KEYS */;
INSERT INTO `TBL_USUARIOS` VALUES (1,'loida','202cb962ac59075b964b07152d234b70',1,'7baee7d86b4149f38711355eca1c21ac',1,1),(2,'angel18','14e1b600b1fd579f47433b88e8d85291',1,'YxhXvtNfGf7Qc9hHXtF8cDDaWnzZA7tA',3,1);
/*!40000 ALTER TABLE `TBL_USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1485093199),('m151008_162401_create_notification_table',1485093218),('m160921_171124_alter_notification_table',1485093221);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `key_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'empty_items','1','warning',1,1,'2017-01-22 10:25:08'),(2,'empty_items','2','warning',1,1,'2017-01-22 10:26:07'),(3,'empty_items','3','warning',1,1,'2017-01-22 10:37:25'),(4,'empty_items','2','warning',1,1,'2017-01-22 11:24:08'),(5,'empty_items','2','warning',1,1,'2017-01-22 12:11:04'),(6,'empty_items','2','warning',1,1,'2017-01-22 18:09:53');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vm_coordinadores_laboratorios`
--

DROP TABLE IF EXISTS `vm_coordinadores_laboratorios`;
/*!50001 DROP VIEW IF EXISTS `vm_coordinadores_laboratorios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_coordinadores_laboratorios` AS SELECT 
 1 AS `PERS_ID`,
 1 AS `PERS_NOMBRE`,
 1 AS `PERS_IDENTIFICACION`,
 1 AS `GENE_ID`,
 1 AS `TIID_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_entradas_items_consumibles_vencibles`
--

DROP TABLE IF EXISTS `vm_entradas_items_consumibles_vencibles`;
/*!50001 DROP VIEW IF EXISTS `vm_entradas_items_consumibles_vencibles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_entradas_items_consumibles_vencibles` AS SELECT 
 1 AS `FLUJ_ID`,
 1 AS `FLUJ_CANTIDAD`,
 1 AS `MOVI_ID`,
 1 AS `STOC_ID`,
 1 AS `TIFU_ID`,
 1 AS `FLUJ_FECHA`,
 1 AS `EXPIRABLE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_expiration_dates`
--

DROP TABLE IF EXISTS `vm_expiration_dates`;
/*!50001 DROP VIEW IF EXISTS `vm_expiration_dates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_expiration_dates` AS SELECT 
 1 AS `STVE_ID`,
 1 AS `FLUJ_ID`,
 1 AS `STVE_VENCIDO`,
 1 AS `STVE_FECHAVENCIMIENTO`,
 1 AS `STOC_ID`,
 1 AS `FLUJ_FECHA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_funcionarios_laboratorios`
--

DROP TABLE IF EXISTS `vm_funcionarios_laboratorios`;
/*!50001 DROP VIEW IF EXISTS `vm_funcionarios_laboratorios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_funcionarios_laboratorios` AS SELECT 
 1 AS `PERS_ID`,
 1 AS `PERS_NOMBRE`,
 1 AS `PERS_IDENTIFICACION`,
 1 AS `GENE_ID`,
 1 AS `TIID_ID`,
 1 AS `LABO_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_items`
--

DROP TABLE IF EXISTS `vm_items`;
/*!50001 DROP VIEW IF EXISTS `vm_items`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_items` AS SELECT 
 1 AS `ITEM_ID`,
 1 AS `ITEM_NOMBRE`,
 1 AS `ITEM_OBSERVACION`,
 1 AS `MARC_ID`,
 1 AS `MARC_NOMBRE`,
 1 AS `TIIT_ID`,
 1 AS `TIIT_NOMBRE`,
 1 AS `TIIT_PADRE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_items_consumibles`
--

DROP TABLE IF EXISTS `vm_items_consumibles`;
/*!50001 DROP VIEW IF EXISTS `vm_items_consumibles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_items_consumibles` AS SELECT 
 1 AS `ITEM_ID`,
 1 AS `ITEM_NOMBRE`,
 1 AS `ITEM_OBSERVACION`,
 1 AS `MARC_ID`,
 1 AS `MARC_NOMBRE`,
 1 AS `TIIT_ID`,
 1 AS `TIIT_NOMBRE`,
 1 AS `TIIT_PADRE`,
 1 AS `ITCO_ID`,
 1 AS `ITCO_MIN`,
 1 AS `ITCO_MAX`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_items_no_consumibles`
--

DROP TABLE IF EXISTS `vm_items_no_consumibles`;
/*!50001 DROP VIEW IF EXISTS `vm_items_no_consumibles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_items_no_consumibles` AS SELECT 
 1 AS `ITEM_ID`,
 1 AS `ITEM_NOMBRE`,
 1 AS `ITEM_OBSERVACION`,
 1 AS `MARC_ID`,
 1 AS `MARC_NOMBRE`,
 1 AS `TIIT_ID`,
 1 AS `TIIT_NOMBRE`,
 1 AS `TIIT_PADRE`,
 1 AS `ITNC_ID`,
 1 AS `ESNC_ID`,
 1 AS `ESNC_NOMBRE`,
 1 AS `ESNC_CODIGO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_items_no_stock`
--

DROP TABLE IF EXISTS `vm_items_no_stock`;
/*!50001 DROP VIEW IF EXISTS `vm_items_no_stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_items_no_stock` AS SELECT 
 1 AS `ITEM_ID`,
 1 AS `ITEM_NOMBRE`,
 1 AS `ITEM_OBSERVACION`,
 1 AS `MARC_ID`,
 1 AS `MARC_NOMBRE`,
 1 AS `TIIT_ID`,
 1 AS `TIIT_NOMBRE`,
 1 AS `TIIT_PADRE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_singletons_inventories`
--

DROP TABLE IF EXISTS `vm_singletons_inventories`;
/*!50001 DROP VIEW IF EXISTS `vm_singletons_inventories`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_singletons_inventories` AS SELECT 
 1 AS `INVE_ID`,
 1 AS `INVE_NOMBRE`,
 1 AS `INVE_DESCRIPCION`,
 1 AS `INVE_ALIAS`,
 1 AS `INVE_CANTIDAD`,
 1 AS `LABO_ID`,
 1 AS `INVE_ESSINGLETON`,
 1 AS `TIIT_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_stocks_actuales`
--

DROP TABLE IF EXISTS `vm_stocks_actuales`;
/*!50001 DROP VIEW IF EXISTS `vm_stocks_actuales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_stocks_actuales` AS SELECT 
 1 AS `STOC_ID`,
 1 AS `ITEM_ID`,
 1 AS `INVE_ID`,
 1 AS `STOC_CANTIDAD`,
 1 AS `PERI_ID`,
 1 AS `STOC_MIN`,
 1 AS `STOC_MAX`,
 1 AS `LABO_ID`,
 1 AS `STOC_ESCONSUMIBLE`,
 1 AS `ITEM_NOMBRE`,
 1 AS `TIIT_ID`,
 1 AS `TIIT_NOMBRE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vm_users`
--

DROP TABLE IF EXISTS `vm_users`;
/*!50001 DROP VIEW IF EXISTS `vm_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vm_users` AS SELECT 
 1 AS `USUA_ID`,
 1 AS `USUA_USUARIO`,
 1 AS `USUA_PASSWORD`,
 1 AS `USUA_ES_ACTIVO`,
 1 AS `USUA_TOKEN`,
 1 AS `ROL_ID`,
 1 AS `ROL_NOMBRE`,
 1 AS `ROL_ORDEN`,
 1 AS `PERS_ID`,
 1 AS `PERS_NOMBRE`,
 1 AS `PERS_IDENTIFICACION`,
 1 AS `GENE_ID`,
 1 AS `TIID_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_count_type_items`
--

DROP TABLE IF EXISTS `vw_count_type_items`;
/*!50001 DROP VIEW IF EXISTS `vw_count_type_items`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_count_type_items` AS SELECT 
 1 AS `type`,
 1 AS `count`,
 1 AS `inventory`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'silab_db'
--
/*!50003 DROP FUNCTION IF EXISTS `alreadyInStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `alreadyInStock`(_item_id INT, inventory_id INT, laboratory_id INT) RETURNS int(11)
BEGIN
	/**
    * @description Checks the constrait if there's already a combination
    * @author Jeancarlo Fontalvo
    * @param item_id the Item Id to check
    * @param inventaory_id the Inventory Id to check
    * @param laboratory_id the Laboratory Id to check 
    */
	DECLARE already BIT;
    DECLARE laboratory INT;
    
    IF( isSingletonInventory(inventory_id) = 1 ) THEN
		IF( EXISTS( SELECT INVE_ID FROM vm_stocks_actuales WHERE ITEM_ID = _item_id AND LABO_ID = laboratory_id ) ) THEN
			SET already = 1;        
        ELSE
			SET already = 0;
		END IF;
    ELSEIF( EXISTS( SELECT INVE_ID FROM vm_stocks_actuales WHERE ITEM_ID = _item_id AND INVE_ID = inventory_id ) ) THEN
        SET already = 1; 
	ELSE 
		SET already = 0;
    END IF;
    
RETURN already;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calculateStockAmount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CALCULATESTOCKAMOUNT`(id INT) RETURNS double
BEGIN
	DECLARE stock_amount DOUBLE;
    
	SELECT SUM(IF(TIFU_ID = 1, FLUJ_CANTIDAD, FLUJ_CANTIDAD * -1 ) ) INTO stock_amount 
    FROM TBL_FLUJOS
	WHERE STOC_ID = id;
    
RETURN stock_amount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `defaultStockMax` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `defaultStockMax`() RETURNS double
BEGIN
	DECLARE stockMax DOUBLE;
	SELECT SILAB_STOCK_MAX INTO stockMax FROM TBL_SILABCONFIGS ORDER BY SILAB_ID DESC LIMIT 1;
    
RETURN stockMax;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `defaultStockMaxByLaboratory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `defaultStockMaxByLaboratory`(id INT) RETURNS double
BEGIN

	DECLARE stockMax DOUBLE DEFAULT 0;
	
    SELECT LACO_STOCKMAX INTO stockMax FROM TBL_LABORATORIOCONFIGS WHERE LABO_ID = id AND PERI_ID = getCurrentPeriod();
    
RETURN stockMax;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `defaultStockMin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `defaultStockMin`() RETURNS double
BEGIN
	DECLARE stockMin DOUBLE;
	SELECT SILAB_STOCK_MIN INTO stockMin FROM TBL_SILABCONFIGS ORDER BY SILAB_ID DESC LIMIT 1;
    
RETURN stockMin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `defaultStockMinByLaboratory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `defaultStockMinByLaboratory`(id INT) RETURNS double
BEGIN

	DECLARE stockMin DOUBLE DEFAULT 0;
	
    SELECT LACO_STOCKMIN INTO stockMin FROM TBL_LABORATORIOCONFIGS WHERE LABO_ID = id AND PERI_ID = getCurrentPeriod();
    
RETURN stockMin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `estaVencido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `estaVencido`(fecha DATE) RETURNS bit(1)
BEGIN
	DECLARE estaVencido BIT DEFAULT 0;

	SET @estaVencido = ( SELECT IF(datediff( fecha, NOW() ) < 1, 1, 0) );
    
RETURN @estaVencido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getCaducidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCaducidad`(fechaVencimiento DATE) RETURNS int(11)
BEGIN
    
    DECLARE cant INT DEFAULT 0;
    DECLARE id   INT;
    SET cant = DATEDIFF(fechaVencimiento, NOW());
    
	SET id = (
		SELECT 	CADU_ID 
		FROM 	TBL_CADUCIDADES
		WHERE 	( CADU_MIN < cant 	AND CADU_MAX IS NULL ) 							OR 
				( CADU_MIN = 1 		AND (CADU_MAX >= cant AND cant >= CADU_MIN)) 	OR
				( CADU_MIN = -1 	AND (cant <= 0))
	);
		
RETURN id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getConsumibleState` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getConsumibleState`(amount DOUBLE) RETURNS int(11)
BEGIN
	
	DECLARE state INT DEFAULT -1;
	
    SET state = ( 
		SELECT ESCO_ID
		FROM TBL_ESTADOSCONSUMIBLE
		WHERE ESCO_MIN < amount AND ESCO_MAX > amount 
	);
    
    IF( state IS NULL ) 
    THEN
		SET state = ( 
			SELECT ESCO_ID
			FROM TBL_ESTADOSCONSUMIBLE
			WHERE ESCO_MIN <= amount AND (ESCO_MAX >= amount OR ESCO_MAX = -1)
		);
        
		IF( state IS NULL ) 
		THEN
			SET state = ( 
				SELECT ESCO_ID
				FROM TBL_ESTADOSCONSUMIBLE
				WHERE (ESCO_MIN = -1 OR  ESCO_MIN <= amount) AND (ESCO_MAX > amount)
			);
		END IF;
    END IF;
    
RETURN state;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getCurrentPeriod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GETCURRENTPERIOD`() RETURNS int(11)
BEGIN
	DECLARE dates 		DATE;
    DECLARE periodId 	INT;
    -- - - - - - - - - - - - 
    SET 	dates = NOW();
    
	SET periodId = ( 
		SELECT PERI_ID 
		FROM TBL_PERIODOS 
			WHERE 	PERI_SEMESTRE 		= getSemester(dates) AND 
					YEAR(PERI_FECHA) 	= YEAR(dates)
	);
    
RETURN periodId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getInventoryName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getInventoryName`(id INT) RETURNS varchar(200) CHARSET utf8
BEGIN
	DECLARE _name VARCHAR(200);
    
    SELECT INVE_NOMBRE INTO _name FROM TBL_INVENTARIOS WHERE INVE_ID = id;
    
RETURN _name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getItemTableType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getItemTableType`(id INT) RETURNS varchar(45) CHARSET utf8
BEGIN
	
    DECLARE typeName VARCHAR(45);
    
    SELECT TIIT_NOMBRE INTO typeName FROM vm_items WHERE ITEM_ID = id;
    
    IF( typeName IS NOT NULL ) THEN
		RETURN CONCAT(typeName, 'S');
	END IF;
    
RETURN 'ITEMS';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getSemester` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getSemester`(fecha DATE) RETURNS int(11)
BEGIN
	DECLARE mont INT;
    
    SET mont = MONTH(fecha);
    
    IF ( mont <= 6 ) THEN 
		RETURN 1;
    END IF;
    
	RETURN 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUserIdByPersonId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getUserIdByPersonId`(id INT) RETURNS int(11)
BEGIN
	DECLARE user_id INT;
	SET user_id = ( SELECT USUA_ID FROM TBL_USUARIOS WHERE PERS_ID = id );
    
RETURN user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `hasExpirationDateField` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `hasExpirationDateField`(tableName CHAR(255)) RETURNS bit(1)
BEGIN
	DECLARE _exists BIT;
    call fieldExists(_exists, tableName, 'FECHAVENCIMIENTO', 'silab_db');
	
    IF( _exists = 0 ) THEN
		call fieldExists(_exists, tableName, 'EXPIRATIONDATE', 'silab_db');
        
		IF( _exists = 0 ) THEN
			call fieldExists(_exists, tableName, 'VENCIMIENTO', 'silab_db');		
		END IF;
        
        IF( _exists = 0 ) THEN
			call fieldExists(_exists, tableName, 'FECHA_VENCIMIENTO', 'silab_db');		
		END IF;
        
    END IF;
	
    
RETURN _exists;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `hasItemID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `hasItemID`(tableName CHAR(255)) RETURNS bit(1)
BEGIN
	DECLARE _exists BIT;
    call fieldExists(_exists, tableName, 'ITEM_ID', 'silab_db');
	 
RETURN _exists;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isConsumible` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isConsumible`(id INT) RETURNS int(11)
BEGIN
	IF EXISTS( SELECT ITEM_ID FROM vm_items WHERE (TIIT_PADRE = 1 OR TIIT_ID = 1) AND ITEM_ID = id ) THEN
		RETURN 1;
    ELSE
		RETURN 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isConsumibleFlow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isConsumibleFlow`(id INT) RETURNS bit(1)
BEGIN
	DECLARE isConsumible BIT;
    
	SELECT ST.STOC_ESCONSUMIBLE INTO isConsumible
    FROM 	TBL_FLUJOS 				AS FL
			INNER JOIN TBL_STOCK 	AS ST ON FL.STOC_ID = ST.STOC_ID
	WHERE FL.FLUJ_ID = id;
    
RETURN isConsumible;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isEntryFlow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isEntryFlow`(id INT) RETURNS bit(1)
BEGIN
	DECLARE isEntry BIT;
    
    SELECT IF(FLOW.TIFU_ID = 1, 1, 0) INTO isEntry 
    FROM TBL_FLUJOS AS FLOW 
    WHERE FLOW.FLUJ_ID = id;
    
RETURN isEntry;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isExpirableFlow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isExpirableFlow`(id INT) RETURNS bit(1)
BEGIN
	DECLARE isExpirable BIT;
    
	SELECT isExpirableItem(ST.ITEM_ID) INTO isExpirable
    FROM 	TBL_FLUJOS 				AS FL
			INNER JOIN TBL_STOCK 	AS ST ON FL.STOC_ID = ST.STOC_ID
	WHERE FL.FLUJ_ID = id;
    
RETURN isExpirable;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isExpirableItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isExpirableItem`(id INT) RETURNS bit(1)
BEGIN
	DECLARE tableName VARCHAR(255);
    DECLARE hasExpirableField BIT;
    
    SET tableName 			= getItemTableType(id);
    SET hasExpirableField 	= hasExpirationDateField( CONCAT( 'TBL_', tableName ) );
    
RETURN hasExpirableField;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isInStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isInStock`(_item_id INT, _inventory_id INT) RETURNS bit(1)
BEGIN
	DECLARE inStock BIT DEFAULT 0;
    
    if EXISTS( SELECT STOC_ID FROM vm_stocks_actuales WHERE ITEM_ID = _item_id AND INVE_ID = _inventory_id ) THEN
		SET inStock = 1;
    END IF;
    
RETURN inStock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isSingletonInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isSingletonInventory`(id INT) RETURNS bit(1)
BEGIN
	DECLARE isSingleton BIT;
    
    SELECT INVE_ESSINGLETON INTO isSingleton FROM TBL_INVENTARIOS WHERE INVE_ID = id;
    
RETURN isSingleton;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkItem`(item INT, laboratory_id INT)
BEGIN
	 SELECT *  FROM TBL_STOCK WHERE ITEM_ID = item AND LABO_ID = laboratory_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fieldExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fieldExists`(
OUT _exists BOOLEAN,      -- return value
IN tableName CHAR(255),   -- name of table to look for
IN columnName CHAR(255),  -- name of column to look for
IN dbName CHAR(255)       -- optional specific db
)
BEGIN
	-- try to lookup db if none provided
	SET @_dbName := IF(dbName IS NULL, database(), dbName);

	IF CHAR_LENGTH(@_dbName) = 0
	THEN -- no specific or current db to check against
	  SELECT FALSE INTO _exists;
	ELSE -- we have a db to work with
	  SELECT IF(count(*) > 0, TRUE, FALSE) INTO _exists
	  FROM information_schema.COLUMNS c
	  WHERE 
	  c.TABLE_SCHEMA    = @_dbName
	  AND c.TABLE_NAME  = tableName
	  AND c.COLUMN_NAME LIKE CONCAT('%',columnName); 
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findItem`(id INT)
BEGIN
    DECLARE typeItem 	VARCHAR(255);
    DECLARE parentType 	INT;
    
    
    SELECT TIIT_NOMBRE, TIIT_PADRE INTO typeItem, parentType FROM silab_db.vm_items WHERE ITEM_ID = id;
    
    IF( parentType = 1 ) THEN
	
		IF( typeItem = 'REACTIVO' ) THEN
			SELECT * FROM vm_items_consumibles AS IC INNER JOIN TBL_REACTIVOS  AS R ON IC.ITCO_ID = R.ITCO_ID WHERE IC.ITEM_ID = id;
		ELSE
        	SELECT * FROM vm_items_consumibles AS IC INNER JOIN TBL_MATERIALES AS M ON IC.ITCO_ID = M.ITCO_ID WHERE IC.ITEM_ID = id;
		END IF;
        
    ELSE 
        IF( typeItem = 'EQUIPO' ) THEN
			SELECT * FROM vm_items_no_consumibles AS INC INNER JOIN TBL_EQUIPOS  		AS E ON INC.ITNC_ID = E.ITNC_ID WHERE INC.ITEM_ID = id;
		ELSEIF( typeItem = 'HERRAMIENTA' ) THEN
        	SELECT * FROM vm_items_no_consumibles AS INC INNER JOIN TBL_HERRAMIENTAS 	AS H ON INC.ITNC_ID = H.ITNC_ID WHERE INC.ITEM_ID = id;
		ELSE
        	SELECT * FROM vm_items_no_consumibles AS INC INNER JOIN TBL_ACCESORIOS 		AS A ON INC.ITNC_ID = A.ITNC_ID WHERE INC.ITEM_ID = id;
		END IF;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEmptyItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmptyItems`()
BEGIN
	SELECT *
	FROM vm_stocks_actuales
	WHERE STOC_CANTIDAD = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExpirationDatesByStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExpirationDatesByStock`(id INT)
BEGIN
	SELECT *
    FROM vm_expiration_dates
    WHERE STOC_ID = id AND estaVencido( STVE_FECHAVENCIMIENTO ) = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorkersByLaboratoryId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getWorkersByLaboratoryId`(laboratory_id INT)
BEGIN
	SELECT 	PERS_ID, 
			PERS_NOMBRE, 
            PERS_IDENTIFICACION, 
            GENE_ID, 
            TIID_ID, 
            LABO_ID, 
			getUserIdByPersonId( PERS_ID ) AS USUA_ID
	FROM silab_db.vm_funcionarios_laboratorios
	WHERE LABO_ID = laboratory_id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `itemsNoInStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `itemsNoInStock`(inventory INT, laboratory INT)
BEGIN
	SET laboratory = IF( laboratory IS NOT NULL, laboratory, NULL );
	
    SELECT * FROM vm_items WHERE ITEM_ID NOT IN( SELECT ITEM_ID FROM vm_stocks_actuales WHERE INVE_ID = inventory AND LABO_ID = laboratory ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registerAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registerAccount`(
        usua_usuario 	VARCHAR(45), 
        usua_password 	VARCHAR(45),
        usua_token    	VARCHAR(250),
        pers_id INT, 
        rol_id INT
)
BEGIN
	
	INSERT INTO silab_db.TBL_USUARIOS
	(	
		USUA_USUARIO,
		USUA_PASSWORD,
		USUA_ES_ACTIVO,
		USUA_TOKEN,
		PERS_ID,
		ROL_ID
	)
	VALUES
	(
		usua_usuario,
		usua_password,
        1,
		usua_token,
		PERS_ID,
		ROL_ID
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vm_coordinadores_laboratorios`
--

/*!50001 DROP VIEW IF EXISTS `vm_coordinadores_laboratorios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_coordinadores_laboratorios` AS select `PERS`.`PERS_ID` AS `PERS_ID`,`PERS`.`PERS_NOMBRE` AS `PERS_NOMBRE`,`PERS`.`PERS_IDENTIFICACION` AS `PERS_IDENTIFICACION`,`PERS`.`GENE_ID` AS `GENE_ID`,`PERS`.`TIID_ID` AS `TIID_ID` from (`tbl_coordinadores` `COORD` join `tbl_personas` `PERS` on((`COORD`.`PERS_ID` = `PERS`.`PERS_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_entradas_items_consumibles_vencibles`
--

/*!50001 DROP VIEW IF EXISTS `vm_entradas_items_consumibles_vencibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_entradas_items_consumibles_vencibles` AS select `tbl_flujos`.`FLUJ_ID` AS `FLUJ_ID`,`tbl_flujos`.`FLUJ_CANTIDAD` AS `FLUJ_CANTIDAD`,`tbl_flujos`.`MOVI_ID` AS `MOVI_ID`,`tbl_flujos`.`STOC_ID` AS `STOC_ID`,`tbl_flujos`.`TIFU_ID` AS `TIFU_ID`,`tbl_flujos`.`FLUJ_FECHA` AS `FLUJ_FECHA`,`isExpirableFlow`(`tbl_flujos`.`FLUJ_ID`) AS `EXPIRABLE` from `tbl_flujos` where ((`isConsumibleFlow`(`tbl_flujos`.`FLUJ_ID`) = 1) and (`tbl_flujos`.`TIFU_ID` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_expiration_dates`
--

/*!50001 DROP VIEW IF EXISTS `vm_expiration_dates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_expiration_dates` AS select `SV`.`STVE_ID` AS `STVE_ID`,`SV`.`FLUJ_ID` AS `FLUJ_ID`,`estaVencido`(`SV`.`STVE_FECHAVENCIMIENTO`) AS `STVE_VENCIDO`,`SV`.`STVE_FECHAVENCIMIENTO` AS `STVE_FECHAVENCIMIENTO`,`FL`.`STOC_ID` AS `STOC_ID`,`FL`.`FLUJ_FECHA` AS `FLUJ_FECHA` from (`tbl_stockvencimientos` `SV` join `tbl_flujos` `FL` on((`SV`.`FLUJ_ID` = `FL`.`FLUJ_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_funcionarios_laboratorios`
--

/*!50001 DROP VIEW IF EXISTS `vm_funcionarios_laboratorios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_funcionarios_laboratorios` AS select `PERS`.`PERS_ID` AS `PERS_ID`,`PERS`.`PERS_NOMBRE` AS `PERS_NOMBRE`,`PERS`.`PERS_IDENTIFICACION` AS `PERS_IDENTIFICACION`,`PERS`.`GENE_ID` AS `GENE_ID`,`PERS`.`TIID_ID` AS `TIID_ID`,`FLAB`.`LABO_ID` AS `LABO_ID` from ((`tbl_funcionalaboratorio` `FLAB` join `tbl_funcionarios` `FUNC` on((`FLAB`.`FUNC_ID` = `FUNC`.`FUNC_ID`))) join `tbl_personas` `PERS` on((`FUNC`.`PERS_ID` = `PERS`.`PERS_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_items`
--

/*!50001 DROP VIEW IF EXISTS `vm_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_items` AS select `ITEM`.`ITEM_ID` AS `ITEM_ID`,`ITEM`.`ITEM_NOMBRE` AS `ITEM_NOMBRE`,`ITEM`.`ITEM_OBSERVACION` AS `ITEM_OBSERVACION`,`MARC`.`MARC_ID` AS `MARC_ID`,`MARC`.`MARC_NOMBRE` AS `MARC_NOMBRE`,`TIIT`.`TIIT_ID` AS `TIIT_ID`,`TIIT`.`TIIT_NOMBRE` AS `TIIT_NOMBRE`,`TIIT`.`TIIT_PADRE` AS `TIIT_PADRE` from ((`tbl_items` `ITEM` join `tbl_marcas` `MARC` on((`ITEM`.`MARC_ID` = `MARC`.`MARC_ID`))) join `tbl_tipositems` `TIIT` on((`ITEM`.`TIIT_ID` = `TIIT`.`TIIT_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_items_consumibles`
--

/*!50001 DROP VIEW IF EXISTS `vm_items_consumibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_items_consumibles` AS select `item`.`ITEM_ID` AS `ITEM_ID`,`item`.`ITEM_NOMBRE` AS `ITEM_NOMBRE`,`item`.`ITEM_OBSERVACION` AS `ITEM_OBSERVACION`,`item`.`MARC_ID` AS `MARC_ID`,`item`.`MARC_NOMBRE` AS `MARC_NOMBRE`,`item`.`TIIT_ID` AS `TIIT_ID`,`item`.`TIIT_NOMBRE` AS `TIIT_NOMBRE`,`item`.`TIIT_PADRE` AS `TIIT_PADRE`,`ITCO`.`ITCO_ID` AS `ITCO_ID`,`ITCO`.`ITCO_MIN` AS `ITCO_MIN`,`ITCO`.`ITCO_MAX` AS `ITCO_MAX` from (`vm_items` `item` join `tbl_itemsconsumibles` `ITCO` on((`ITCO`.`ITEM_ID` = `item`.`ITEM_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_items_no_consumibles`
--

/*!50001 DROP VIEW IF EXISTS `vm_items_no_consumibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_items_no_consumibles` AS select `item`.`ITEM_ID` AS `ITEM_ID`,`item`.`ITEM_NOMBRE` AS `ITEM_NOMBRE`,`item`.`ITEM_OBSERVACION` AS `ITEM_OBSERVACION`,`item`.`MARC_ID` AS `MARC_ID`,`item`.`MARC_NOMBRE` AS `MARC_NOMBRE`,`item`.`TIIT_ID` AS `TIIT_ID`,`item`.`TIIT_NOMBRE` AS `TIIT_NOMBRE`,`item`.`TIIT_PADRE` AS `TIIT_PADRE`,`ITNC`.`ITNC_ID` AS `ITNC_ID`,`ESNC`.`ESNC_ID` AS `ESNC_ID`,`ESNC`.`ESNC_NOMBRE` AS `ESNC_NOMBRE`,`ESNC`.`ESNC_CODIGO` AS `ESNC_CODIGO` from ((`vm_items` `item` join `tbl_itemsnoconsumibles` `ITNC` on((`ITNC`.`ITEM_ID` = `item`.`ITEM_ID`))) join `tbl_estadosnoconsumible` `ESNC` on((`ITNC`.`ESNC_ID` = `ESNC`.`ESNC_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_items_no_stock`
--

/*!50001 DROP VIEW IF EXISTS `vm_items_no_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_items_no_stock` AS select `vm_items`.`ITEM_ID` AS `ITEM_ID`,`vm_items`.`ITEM_NOMBRE` AS `ITEM_NOMBRE`,`vm_items`.`ITEM_OBSERVACION` AS `ITEM_OBSERVACION`,`vm_items`.`MARC_ID` AS `MARC_ID`,`vm_items`.`MARC_NOMBRE` AS `MARC_NOMBRE`,`vm_items`.`TIIT_ID` AS `TIIT_ID`,`vm_items`.`TIIT_NOMBRE` AS `TIIT_NOMBRE`,`vm_items`.`TIIT_PADRE` AS `TIIT_PADRE` from `vm_items` where (not(`vm_items`.`ITEM_ID` in (select `vm_stocks_actuales`.`ITEM_ID` from `vm_stocks_actuales`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_singletons_inventories`
--

/*!50001 DROP VIEW IF EXISTS `vm_singletons_inventories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_singletons_inventories` AS select `INV`.`INVE_ID` AS `INVE_ID`,`INV`.`INVE_NOMBRE` AS `INVE_NOMBRE`,`INV`.`INVE_DESCRIPCION` AS `INVE_DESCRIPCION`,`INV`.`INVE_ALIAS` AS `INVE_ALIAS`,`INV`.`INVE_CANTIDAD` AS `INVE_CANTIDAD`,`INV`.`LABO_ID` AS `LABO_ID`,`INV`.`INVE_ESSINGLETON` AS `INVE_ESSINGLETON`,`INV`.`TIIT_ID` AS `TIIT_ID` from `tbl_inventarios` `INV` where (`INV`.`INVE_ESSINGLETON` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_stocks_actuales`
--

/*!50001 DROP VIEW IF EXISTS `vm_stocks_actuales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_stocks_actuales` AS select `ST`.`STOC_ID` AS `STOC_ID`,`ST`.`ITEM_ID` AS `ITEM_ID`,`ST`.`INVE_ID` AS `INVE_ID`,ifnull(`CALCULATESTOCKAMOUNT`(`ST`.`STOC_ID`),0) AS `STOC_CANTIDAD`,`ST`.`PERI_ID` AS `PERI_ID`,`ST`.`STOC_MIN` AS `STOC_MIN`,`ST`.`STOC_MAX` AS `STOC_MAX`,`ST`.`LABO_ID` AS `LABO_ID`,`ST`.`STOC_ESCONSUMIBLE` AS `STOC_ESCONSUMIBLE`,`IT`.`ITEM_NOMBRE` AS `ITEM_NOMBRE`,`IT`.`TIIT_ID` AS `TIIT_ID`,`TI`.`TIIT_NOMBRE` AS `TIIT_NOMBRE` from ((`tbl_stock` `ST` join `tbl_items` `IT` on((`ST`.`ITEM_ID` = `IT`.`ITEM_ID`))) join `tbl_tipositems` `TI` on((`IT`.`TIIT_ID` = `TI`.`TIIT_ID`))) where (`ST`.`PERI_ID` = `GETCURRENTPERIOD`()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vm_users`
--

/*!50001 DROP VIEW IF EXISTS `vm_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vm_users` AS select `US`.`USUA_ID` AS `USUA_ID`,`US`.`USUA_USUARIO` AS `USUA_USUARIO`,`US`.`USUA_PASSWORD` AS `USUA_PASSWORD`,`US`.`USUA_ES_ACTIVO` AS `USUA_ES_ACTIVO`,`US`.`USUA_TOKEN` AS `USUA_TOKEN`,`ROL`.`ROL_ID` AS `ROL_ID`,`ROL`.`ROL_NOMBRE` AS `ROL_NOMBRE`,`ROL`.`ROL_ORDEN` AS `ROL_ORDEN`,`PERS`.`PERS_ID` AS `PERS_ID`,`PERS`.`PERS_NOMBRE` AS `PERS_NOMBRE`,`PERS`.`PERS_IDENTIFICACION` AS `PERS_IDENTIFICACION`,`PERS`.`GENE_ID` AS `GENE_ID`,`PERS`.`TIID_ID` AS `TIID_ID` from ((`tbl_usuarios` `US` join `tbl_roles` `ROL` on((`US`.`ROL_ID` = `ROL`.`ROL_ID`))) join `tbl_personas` `PERS` on((`PERS`.`PERS_ID` = `US`.`PERS_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_count_type_items`
--

/*!50001 DROP VIEW IF EXISTS `vw_count_type_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_count_type_items` AS select `TIT`.`TIIT_NOMBRE` AS `type`,count(`IT`.`TIIT_ID`) AS `count`,`ST`.`INVE_ID` AS `inventory` from ((`tbl_stock` `ST` join `tbl_items` `IT` on((`ST`.`ITEM_ID` = `IT`.`ITEM_ID`))) join `tbl_tipositems` `TIT` on((`IT`.`TIIT_ID` = `TIT`.`TIIT_ID`))) group by `TIT`.`TIIT_NOMBRE`,`ST`.`INVE_ID` */;
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

-- Dump completed on 2017-03-06 10:36:29
