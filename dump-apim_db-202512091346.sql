-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: apim_db
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a490b259-d14a-11f0-9878-0242ac150002:1-7325';

--
-- Table structure for table `AM_ALERT_EMAILLIST`
--

DROP TABLE IF EXISTS `AM_ALERT_EMAILLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_ALERT_EMAILLIST` (
  `EMAIL_LIST_ID` int NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `STAKE_HOLDER` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`EMAIL_LIST_ID`,`USER_NAME`,`STAKE_HOLDER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_ALERT_EMAILLIST`
--

LOCK TABLES `AM_ALERT_EMAILLIST` WRITE;
/*!40000 ALTER TABLE `AM_ALERT_EMAILLIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_ALERT_EMAILLIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_ALERT_EMAILLIST_DETAILS`
--

DROP TABLE IF EXISTS `AM_ALERT_EMAILLIST_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_ALERT_EMAILLIST_DETAILS` (
  `EMAIL_LIST_ID` int NOT NULL,
  `EMAIL` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`EMAIL_LIST_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_ALERT_EMAILLIST_DETAILS`
--

LOCK TABLES `AM_ALERT_EMAILLIST_DETAILS` WRITE;
/*!40000 ALTER TABLE `AM_ALERT_EMAILLIST_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_ALERT_EMAILLIST_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_ALERT_TYPES`
--

DROP TABLE IF EXISTS `AM_ALERT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_ALERT_TYPES` (
  `ALERT_TYPE_ID` int NOT NULL AUTO_INCREMENT,
  `ALERT_TYPE_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `STAKE_HOLDER` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ALERT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_ALERT_TYPES`
--

LOCK TABLES `AM_ALERT_TYPES` WRITE;
/*!40000 ALTER TABLE `AM_ALERT_TYPES` DISABLE KEYS */;
INSERT INTO `AM_ALERT_TYPES` VALUES (1,'AbnormalResponseTime','publisher'),(2,'AbnormalBackendTime','publisher'),(3,'AbnormalRequestsPerMin','subscriber'),(4,'AbnormalRequestPattern','subscriber'),(5,'UnusualIPAccess','subscriber'),(6,'FrequentTierLimitHitting','subscriber'),(7,'ApiHealthMonitor','publisher');
/*!40000 ALTER TABLE `AM_ALERT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_ALERT_TYPES_VALUES`
--

DROP TABLE IF EXISTS `AM_ALERT_TYPES_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_ALERT_TYPES_VALUES` (
  `ALERT_TYPE_ID` int NOT NULL,
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `STAKE_HOLDER` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ALERT_TYPE_ID`,`USER_NAME`,`STAKE_HOLDER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_ALERT_TYPES_VALUES`
--

LOCK TABLES `AM_ALERT_TYPES_VALUES` WRITE;
/*!40000 ALTER TABLE `AM_ALERT_TYPES_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_ALERT_TYPES_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API`
--

DROP TABLE IF EXISTS `AM_API`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API` (
  `API_ID` int NOT NULL AUTO_INCREMENT,
  `API_UUID` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `API_PROVIDER` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `API_NAME` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `API_VERSION` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `CONTEXT` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `CONTEXT_TEMPLATE` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `API_TIER` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `API_TYPE` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `ORGANIZATION` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `GATEWAY_VENDOR` varchar(100) COLLATE latin1_general_ci DEFAULT 'wso2',
  `CREATED_BY` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `LOG_LEVEL` varchar(255) COLLATE latin1_general_ci DEFAULT 'OFF',
  `REVISIONS_CREATED` int DEFAULT '0',
  `VERSION_COMPARABLE` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`API_ID`),
  UNIQUE KEY `API_PROVIDER` (`API_PROVIDER`,`API_NAME`,`API_VERSION`,`ORGANIZATION`),
  UNIQUE KEY `API_UUID` (`API_UUID`),
  KEY `IDX_AAI_CTX` (`CONTEXT`),
  KEY `IDX_AAI_ORG` (`ORGANIZATION`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API`
--

LOCK TABLES `AM_API` WRITE;
/*!40000 ALTER TABLE `AM_API` DISABLE KEYS */;
INSERT INTO `AM_API` VALUES (2,'7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','admin','PizzaShackAPI','1.0.0','/pizzashack/1.0.0','/pizzashack',NULL,'HTTP','carbon.super','wso2','admin','2025-12-06 23:41:22','admin','2025-12-08 18:42:58','PUBLISHED','OFF',13,'1765064481675');
/*!40000 ALTER TABLE `AM_API` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_CATEGORIES`
--

DROP TABLE IF EXISTS `AM_API_CATEGORIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_CATEGORIES` (
  `UUID` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `ORGANIZATION` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `NAME` (`NAME`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_CATEGORIES`
--

LOCK TABLES `AM_API_CATEGORIES` WRITE;
/*!40000 ALTER TABLE `AM_API_CATEGORIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_CATEGORIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_CLIENT_CERTIFICATE`
--

DROP TABLE IF EXISTS `AM_API_CLIENT_CERTIFICATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_CLIENT_CERTIFICATE` (
  `TENANT_ID` int NOT NULL,
  `ALIAS` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `API_ID` int NOT NULL,
  `CERTIFICATE` blob NOT NULL,
  `REMOVED` tinyint(1) NOT NULL DEFAULT '0',
  `TIER_NAME` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `REVISION_UUID` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Current API',
  PRIMARY KEY (`ALIAS`,`TENANT_ID`,`REMOVED`,`REVISION_UUID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_API_CLIENT_CERTIFICATE_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_CLIENT_CERTIFICATE`
--

LOCK TABLES `AM_API_CLIENT_CERTIFICATE` WRITE;
/*!40000 ALTER TABLE `AM_API_CLIENT_CERTIFICATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_CLIENT_CERTIFICATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_COMMENTS`
--

DROP TABLE IF EXISTS `AM_API_COMMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_COMMENTS` (
  `COMMENT_ID` varchar(64) COLLATE latin1_general_ci NOT NULL,
  `COMMENT_TEXT` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_BY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL,
  `UPDATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `API_ID` int DEFAULT NULL,
  `PARENT_COMMENT_ID` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `ENTRY_POINT` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `CATEGORY` varchar(20) COLLATE latin1_general_ci DEFAULT 'general',
  PRIMARY KEY (`COMMENT_ID`),
  KEY `API_ID` (`API_ID`),
  KEY `PARENT_COMMENT_ID` (`PARENT_COMMENT_ID`),
  CONSTRAINT `AM_API_COMMENTS_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE,
  CONSTRAINT `AM_API_COMMENTS_ibfk_2` FOREIGN KEY (`PARENT_COMMENT_ID`) REFERENCES `AM_API_COMMENTS` (`COMMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_COMMENTS`
--

LOCK TABLES `AM_API_COMMENTS` WRITE;
/*!40000 ALTER TABLE `AM_API_COMMENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_COMMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_DEFAULT_VERSION`
--

DROP TABLE IF EXISTS `AM_API_DEFAULT_VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_DEFAULT_VERSION` (
  `DEFAULT_VERSION_ID` int NOT NULL AUTO_INCREMENT,
  `API_NAME` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `API_PROVIDER` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `DEFAULT_API_VERSION` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `PUBLISHED_DEFAULT_API_VERSION` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `ORGANIZATION` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`DEFAULT_VERSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_DEFAULT_VERSION`
--

LOCK TABLES `AM_API_DEFAULT_VERSION` WRITE;
/*!40000 ALTER TABLE `AM_API_DEFAULT_VERSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_DEFAULT_VERSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_ENVIRONMENT_KEYS`
--

DROP TABLE IF EXISTS `AM_API_ENVIRONMENT_KEYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_ENVIRONMENT_KEYS` (
  `UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `ENVIRONMENT_ID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `API_UUID` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `PROPERTY_CONFIG` blob,
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `ENVIRONMENT_ID` (`ENVIRONMENT_ID`,`API_UUID`),
  KEY `API_UUID` (`API_UUID`),
  CONSTRAINT `AM_API_ENVIRONMENT_KEYS_ibfk_1` FOREIGN KEY (`API_UUID`) REFERENCES `AM_API` (`API_UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_ENVIRONMENT_KEYS`
--

LOCK TABLES `AM_API_ENVIRONMENT_KEYS` WRITE;
/*!40000 ALTER TABLE `AM_API_ENVIRONMENT_KEYS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_ENVIRONMENT_KEYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_LC_EVENT`
--

DROP TABLE IF EXISTS `AM_API_LC_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_LC_EVENT` (
  `EVENT_ID` int NOT NULL AUTO_INCREMENT,
  `API_ID` int NOT NULL,
  `PREVIOUS_STATE` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `NEW_STATE` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `EVENT_DATE` timestamp NOT NULL,
  PRIMARY KEY (`EVENT_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_API_LC_EVENT_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_LC_EVENT`
--

LOCK TABLES `AM_API_LC_EVENT` WRITE;
/*!40000 ALTER TABLE `AM_API_LC_EVENT` DISABLE KEYS */;
INSERT INTO `AM_API_LC_EVENT` VALUES (3,2,NULL,'CREATED','admin',-1234,'2025-12-06 23:41:22'),(4,2,'CREATED','PUBLISHED','admin',-1234,'2025-12-06 23:41:23');
/*!40000 ALTER TABLE `AM_API_LC_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_LC_PUBLISH_EVENTS`
--

DROP TABLE IF EXISTS `AM_API_LC_PUBLISH_EVENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_LC_PUBLISH_EVENTS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_DOMAIN` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `API_ID` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `EVENT_TIME` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_LC_PUBLISH_EVENTS`
--

LOCK TABLES `AM_API_LC_PUBLISH_EVENTS` WRITE;
/*!40000 ALTER TABLE `AM_API_LC_PUBLISH_EVENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_LC_PUBLISH_EVENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_OPERATION_POLICY`
--

DROP TABLE IF EXISTS `AM_API_OPERATION_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_OPERATION_POLICY` (
  `API_SPECIFIC_POLICY_ID` int NOT NULL AUTO_INCREMENT,
  `POLICY_UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `API_UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `REVISION_UUID` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `CLONED_POLICY_UUID` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`API_SPECIFIC_POLICY_ID`),
  KEY `POLICY_UUID` (`POLICY_UUID`),
  CONSTRAINT `AM_API_OPERATION_POLICY_ibfk_1` FOREIGN KEY (`POLICY_UUID`) REFERENCES `AM_OPERATION_POLICY` (`POLICY_UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_OPERATION_POLICY`
--

LOCK TABLES `AM_API_OPERATION_POLICY` WRITE;
/*!40000 ALTER TABLE `AM_API_OPERATION_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_OPERATION_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_OPERATION_POLICY_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_OPERATION_POLICY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_OPERATION_POLICY_MAPPING` (
  `OPERATION_POLICY_MAPPING_ID` int NOT NULL AUTO_INCREMENT,
  `URL_MAPPING_ID` int NOT NULL,
  `POLICY_UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `POLICY_ORDER` int NOT NULL,
  `DIRECTION` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `PARAMETERS` varchar(1024) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`OPERATION_POLICY_MAPPING_ID`),
  KEY `URL_MAPPING_ID` (`URL_MAPPING_ID`),
  KEY `POLICY_UUID` (`POLICY_UUID`),
  CONSTRAINT `AM_API_OPERATION_POLICY_MAPPING_ibfk_1` FOREIGN KEY (`URL_MAPPING_ID`) REFERENCES `AM_API_URL_MAPPING` (`URL_MAPPING_ID`) ON DELETE CASCADE,
  CONSTRAINT `AM_API_OPERATION_POLICY_MAPPING_ibfk_2` FOREIGN KEY (`POLICY_UUID`) REFERENCES `AM_OPERATION_POLICY` (`POLICY_UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_OPERATION_POLICY_MAPPING`
--

LOCK TABLES `AM_API_OPERATION_POLICY_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_API_OPERATION_POLICY_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_OPERATION_POLICY_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_POLICY_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_POLICY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_POLICY_MAPPING` (
  `API_POLICY_MAPPING_ID` int NOT NULL AUTO_INCREMENT,
  `API_UUID` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `REVISION_UUID` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `POLICY_UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `POLICY_ORDER` int NOT NULL,
  `DIRECTION` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `PARAMETERS` varchar(1024) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`API_POLICY_MAPPING_ID`),
  KEY `API_UUID` (`API_UUID`),
  KEY `POLICY_UUID` (`POLICY_UUID`),
  CONSTRAINT `AM_API_POLICY_MAPPING_ibfk_1` FOREIGN KEY (`API_UUID`) REFERENCES `AM_API` (`API_UUID`) ON DELETE CASCADE,
  CONSTRAINT `AM_API_POLICY_MAPPING_ibfk_2` FOREIGN KEY (`POLICY_UUID`) REFERENCES `AM_OPERATION_POLICY` (`POLICY_UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_POLICY_MAPPING`
--

LOCK TABLES `AM_API_POLICY_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_API_POLICY_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_POLICY_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_PRODUCT_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_PRODUCT_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_PRODUCT_MAPPING` (
  `API_PRODUCT_MAPPING_ID` int NOT NULL AUTO_INCREMENT,
  `API_ID` int DEFAULT NULL,
  `URL_MAPPING_ID` int DEFAULT NULL,
  `REVISION_UUID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`API_PRODUCT_MAPPING_ID`),
  KEY `URL_MAPPING_ID` (`URL_MAPPING_ID`),
  KEY `IDX_AAPM_AI` (`API_ID`),
  CONSTRAINT `AM_API_PRODUCT_MAPPING_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE,
  CONSTRAINT `AM_API_PRODUCT_MAPPING_ibfk_2` FOREIGN KEY (`URL_MAPPING_ID`) REFERENCES `AM_API_URL_MAPPING` (`URL_MAPPING_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_PRODUCT_MAPPING`
--

LOCK TABLES `AM_API_PRODUCT_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_API_PRODUCT_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_PRODUCT_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_RATINGS`
--

DROP TABLE IF EXISTS `AM_API_RATINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_RATINGS` (
  `RATING_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `API_ID` int DEFAULT NULL,
  `RATING` int DEFAULT NULL,
  `SUBSCRIBER_ID` int DEFAULT NULL,
  PRIMARY KEY (`RATING_ID`),
  KEY `API_ID` (`API_ID`),
  KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`),
  CONSTRAINT `AM_API_RATINGS_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AM_API_RATINGS_ibfk_2` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `AM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_RATINGS`
--

LOCK TABLES `AM_API_RATINGS` WRITE;
/*!40000 ALTER TABLE `AM_API_RATINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_RATINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_RESOURCE_SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_RESOURCE_SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_RESOURCE_SCOPE_MAPPING` (
  `SCOPE_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `URL_MAPPING_ID` int NOT NULL,
  `TENANT_ID` int NOT NULL,
  PRIMARY KEY (`SCOPE_NAME`,`URL_MAPPING_ID`),
  KEY `URL_MAPPING_ID` (`URL_MAPPING_ID`),
  CONSTRAINT `AM_API_RESOURCE_SCOPE_MAPPING_ibfk_1` FOREIGN KEY (`URL_MAPPING_ID`) REFERENCES `AM_API_URL_MAPPING` (`URL_MAPPING_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_RESOURCE_SCOPE_MAPPING`
--

LOCK TABLES `AM_API_RESOURCE_SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_API_RESOURCE_SCOPE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_RESOURCE_SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_REVISION_METADATA`
--

DROP TABLE IF EXISTS `AM_API_REVISION_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_REVISION_METADATA` (
  `API_UUID` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `REVISION_UUID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `API_TIER` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  UNIQUE KEY `API_UUID` (`API_UUID`,`REVISION_UUID`),
  KEY `REVISION_UUID` (`REVISION_UUID`),
  CONSTRAINT `AM_API_REVISION_METADATA_ibfk_1` FOREIGN KEY (`REVISION_UUID`) REFERENCES `AM_REVISION` (`REVISION_UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_REVISION_METADATA`
--

LOCK TABLES `AM_API_REVISION_METADATA` WRITE;
/*!40000 ALTER TABLE `AM_API_REVISION_METADATA` DISABLE KEYS */;
INSERT INTO `AM_API_REVISION_METADATA` VALUES ('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','ae89b6e9-c885-4841-9f53-3fcd915f8602',NULL),('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','85114c73-4359-49e5-9545-c747bec89cd3',NULL),('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','f520d828-baf6-45d6-94d1-c4bf3df90496',NULL),('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','d81397b8-baa4-4004-9cee-4961111fa0ec',NULL),('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','0952a113-1e90-472c-9f0b-d50ee95c441e',NULL);
/*!40000 ALTER TABLE `AM_API_REVISION_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_SERVICE_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_SERVICE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_SERVICE_MAPPING` (
  `API_ID` int NOT NULL,
  `SERVICE_KEY` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `MD5` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int NOT NULL,
  PRIMARY KEY (`API_ID`,`SERVICE_KEY`),
  CONSTRAINT `AM_API_SERVICE_MAPPING_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_SERVICE_MAPPING`
--

LOCK TABLES `AM_API_SERVICE_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_API_SERVICE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_SERVICE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_THROTTLE_POLICY`
--

DROP TABLE IF EXISTS `AM_API_THROTTLE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_THROTTLE_POLICY` (
  `POLICY_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_NAME` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int NOT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `DEFAULT_QUOTA_TYPE` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `DEFAULT_QUOTA` int NOT NULL,
  `DEFAULT_QUOTA_UNIT` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `DEFAULT_UNIT_TIME` int NOT NULL,
  `DEFAULT_TIME_UNIT` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `APPLICABLE_LEVEL` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `UUID` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `API_NAME_TENANT` (`NAME`,`TENANT_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_AATP_DQT` (`DEFAULT_QUOTA_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_THROTTLE_POLICY`
--

LOCK TABLES `AM_API_THROTTLE_POLICY` WRITE;
/*!40000 ALTER TABLE `AM_API_THROTTLE_POLICY` DISABLE KEYS */;
INSERT INTO `AM_API_THROTTLE_POLICY` VALUES (1,'50KPerMin','50KPerMin',-1234,'Allows 50000 requests per minute','requestCount',50000,NULL,1,'min','apiLevel',0,'c8d93500-7219-4c84-91ff-792404922596'),(2,'20KPerMin','20KPerMin',-1234,'Allows 20000 requests per minute','requestCount',20000,NULL,1,'min','apiLevel',0,'31659dc4-a310-4b87-97ed-ea6ed7d8b736'),(3,'10KPerMin','10KPerMin',-1234,'Allows 10000 requests per minute','requestCount',10000,NULL,1,'min','apiLevel',0,'6b70bd01-856e-4f70-8d54-67d88e70a41f'),(4,'Unlimited','Unlimited',-1234,'Allows unlimited requests','requestCount',2147483647,NULL,1,'min','apiLevel',0,'2a4cf0dd-4180-4cc6-9ed3-021b0dfadb4e');
/*!40000 ALTER TABLE `AM_API_THROTTLE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_URL_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_URL_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_API_URL_MAPPING` (
  `URL_MAPPING_ID` int NOT NULL AUTO_INCREMENT,
  `API_ID` int NOT NULL,
  `HTTP_METHOD` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `AUTH_SCHEME` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `URL_PATTERN` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `THROTTLING_TIER` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `MEDIATION_SCRIPT` blob,
  `REVISION_UUID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`URL_MAPPING_ID`),
  KEY `IDX_AAUM_AI` (`API_ID`),
  KEY `IDX_AAUM_TT` (`THROTTLING_TIER`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_URL_MAPPING`
--

LOCK TABLES `AM_API_URL_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_API_URL_MAPPING` DISABLE KEYS */;
INSERT INTO `AM_API_URL_MAPPING` VALUES (155,2,'DELETE','Application & Application User','/order/{orderId}','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(156,2,'GET','Application & Application User','/test2','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(157,2,'PATCH','Application & Application User','/test2','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(158,2,'HEAD','Application & Application User','/test3','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(159,2,'GET','Application & Application User','/test3','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(160,2,'DELETE','Application & Application User','/test2','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(161,2,'GET','Application & Application User','/menu','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(162,2,'POST','Application & Application User','/test2','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(163,2,'PUT','Application & Application User','/order/{orderId}','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(164,2,'GET','Application & Application User','/testResource','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(165,2,'POST','Application & Application User','/order','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(166,2,'GET','Application & Application User','/order/{orderId}','Unlimited',NULL,'ae89b6e9-c885-4841-9f53-3fcd915f8602'),(180,2,'GET','Application & Application User','/test2','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(181,2,'PATCH','Application & Application User','/test2','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(182,2,'GET','Application & Application User','/test3','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(183,2,'DELETE','Application & Application User','/delme','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(184,2,'POST','Application & Application User','/test2','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(185,2,'GET','Application & Application User','/testResource','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(186,2,'DELETE','Application & Application User','/order/{orderId}','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(187,2,'HEAD','Application & Application User','/test3','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(188,2,'DELETE','Application & Application User','/test2','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(189,2,'GET','Application & Application User','/menu','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(190,2,'PUT','Application & Application User','/order/{orderId}','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(191,2,'POST','Application & Application User','/order','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(192,2,'GET','Application & Application User','/order/{orderId}','Unlimited',NULL,'85114c73-4359-49e5-9545-c747bec89cd3'),(205,2,'DELETE','Application & Application User','/order/{orderId}','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(206,2,'GET','Application & Application User','/test2','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(207,2,'PATCH','Application & Application User','/test2','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(208,2,'HEAD','Application & Application User','/test3','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(209,2,'GET','Application & Application User','/test3','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(210,2,'DELETE','Application & Application User','/test2','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(211,2,'GET','Application & Application User','/menu','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(212,2,'POST','Application & Application User','/test2','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(213,2,'PUT','Application & Application User','/order/{orderId}','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(214,2,'GET','Application & Application User','/testResource','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(215,2,'POST','Application & Application User','/order','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(216,2,'GET','Application & Application User','/order/{orderId}','Unlimited',NULL,'f520d828-baf6-45d6-94d1-c4bf3df90496'),(228,2,'DELETE','Application & Application User','/order/{orderId}','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(229,2,'GET','Application & Application User','/test2','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(230,2,'PATCH','Application & Application User','/test2','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(231,2,'GET','Application & Application User','/test3','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(232,2,'DELETE','Application & Application User','/test2','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(233,2,'GET','Application & Application User','/menu','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(234,2,'POST','Application & Application User','/test2','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(235,2,'PUT','Application & Application User','/order/{orderId}','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(236,2,'GET','Application & Application User','/testResource','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(237,2,'POST','Application & Application User','/order','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(238,2,'GET','Application & Application User','/order/{orderId}','Unlimited',NULL,'d81397b8-baa4-4004-9cee-4961111fa0ec'),(249,2,'DELETE','Application & Application User','/order/{orderId}','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(250,2,'GET','Application & Application User','/test2','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(251,2,'PATCH','Application & Application User','/test2','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(252,2,'DELETE','Application & Application User','/test2','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(253,2,'GET','Application & Application User','/menu','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(254,2,'POST','Application & Application User','/test2','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(255,2,'PUT','Application & Application User','/order/{orderId}','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(256,2,'GET','Application & Application User','/testResource','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(257,2,'POST','Application & Application User','/order','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(258,2,'GET','Application & Application User','/order/{orderId}','Unlimited',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e'),(259,2,'POST','Application & Application User','/order','Unlimited',NULL,NULL),(260,2,'GET','Application & Application User','/menu','Unlimited',NULL,NULL),(261,2,'GET','Application & Application User','/order/{orderId}','Unlimited',NULL,NULL),(262,2,'PUT','Application & Application User','/order/{orderId}','Unlimited',NULL,NULL),(263,2,'DELETE','Application & Application User','/order/{orderId}','Unlimited',NULL,NULL),(264,2,'GET','Application & Application User','/testResource','Unlimited',NULL,NULL),(265,2,'GET','Application & Application User','/test2','Unlimited',NULL,NULL),(266,2,'POST','Application & Application User','/test2','Unlimited',NULL,NULL),(267,2,'DELETE','Application & Application User','/test2','Unlimited',NULL,NULL),(268,2,'PATCH','Application & Application User','/test2','Unlimited',NULL,NULL),(269,2,'GET','Application & Application User','/ddfdfd','Unlimited',NULL,NULL);
/*!40000 ALTER TABLE `AM_API_URL_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION`
--

DROP TABLE IF EXISTS `AM_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_APPLICATION` (
  `APPLICATION_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `SUBSCRIBER_ID` int DEFAULT NULL,
  `APPLICATION_TIER` varchar(50) COLLATE latin1_general_ci DEFAULT 'Unlimited',
  `CALLBACK_URL` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `APPLICATION_STATUS` varchar(50) COLLATE latin1_general_ci DEFAULT 'APPROVED',
  `GROUP_ID` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_BY` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT NULL,
  `UPDATED_BY` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UUID` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_TYPE` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `ORGANIZATION` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`APPLICATION_ID`),
  UNIQUE KEY `NAME` (`NAME`,`SUBSCRIBER_ID`,`ORGANIZATION`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`),
  KEY `IDX_AA_AT_CB` (`APPLICATION_TIER`,`CREATED_BY`),
  CONSTRAINT `AM_APPLICATION_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `AM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION`
--

LOCK TABLES `AM_APPLICATION` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION_ATTRIBUTES`
--

DROP TABLE IF EXISTS `AM_APPLICATION_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_APPLICATION_ATTRIBUTES` (
  `APPLICATION_ID` int NOT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `APP_ATTRIBUTE` varchar(1024) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  PRIMARY KEY (`APPLICATION_ID`,`NAME`),
  CONSTRAINT `AM_APPLICATION_ATTRIBUTES_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION_ATTRIBUTES`
--

LOCK TABLES `AM_APPLICATION_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION_ATTRIBUTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_APPLICATION_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION_GROUP_MAPPING`
--

DROP TABLE IF EXISTS `AM_APPLICATION_GROUP_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_APPLICATION_GROUP_MAPPING` (
  `APPLICATION_ID` int NOT NULL,
  `GROUP_ID` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `TENANT` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`APPLICATION_ID`,`GROUP_ID`,`TENANT`),
  CONSTRAINT `AM_APPLICATION_GROUP_MAPPING_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION_GROUP_MAPPING`
--

LOCK TABLES `AM_APPLICATION_GROUP_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION_GROUP_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_APPLICATION_GROUP_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION_KEY_MAPPING`
--

DROP TABLE IF EXISTS `AM_APPLICATION_KEY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_APPLICATION_KEY_MAPPING` (
  `UUID` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `APPLICATION_ID` int NOT NULL,
  `CONSUMER_KEY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `KEY_TYPE` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `STATE` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `CREATE_MODE` varchar(30) COLLATE latin1_general_ci DEFAULT 'CREATED',
  `KEY_MANAGER` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `APP_INFO` blob,
  PRIMARY KEY (`APPLICATION_ID`,`KEY_TYPE`,`KEY_MANAGER`),
  KEY `IDX_AAKM_CK` (`CONSUMER_KEY`),
  CONSTRAINT `AM_APPLICATION_KEY_MAPPING_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION_KEY_MAPPING`
--

LOCK TABLES `AM_APPLICATION_KEY_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION_KEY_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_APPLICATION_KEY_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION_REGISTRATION`
--

DROP TABLE IF EXISTS `AM_APPLICATION_REGISTRATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_APPLICATION_REGISTRATION` (
  `REG_ID` int NOT NULL AUTO_INCREMENT,
  `SUBSCRIBER_ID` int DEFAULT NULL,
  `WF_REF` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `APP_ID` int DEFAULT NULL,
  `TOKEN_TYPE` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_SCOPE` varchar(1500) COLLATE latin1_general_ci DEFAULT 'default',
  `INPUTS` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `ALLOWED_DOMAINS` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `VALIDITY_PERIOD` bigint DEFAULT NULL,
  `KEY_MANAGER` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`REG_ID`),
  UNIQUE KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`,`APP_ID`,`TOKEN_TYPE`,`KEY_MANAGER`),
  KEY `APP_ID` (`APP_ID`),
  CONSTRAINT `AM_APPLICATION_REGISTRATION_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `AM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `AM_APPLICATION_REGISTRATION_ibfk_2` FOREIGN KEY (`APP_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION_REGISTRATION`
--

LOCK TABLES `AM_APPLICATION_REGISTRATION` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION_REGISTRATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_APPLICATION_REGISTRATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APP_KEY_DOMAIN_MAPPING`
--

DROP TABLE IF EXISTS `AM_APP_KEY_DOMAIN_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_APP_KEY_DOMAIN_MAPPING` (
  `CONSUMER_KEY` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `AUTHZ_DOMAIN` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'ALL',
  PRIMARY KEY (`CONSUMER_KEY`,`AUTHZ_DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APP_KEY_DOMAIN_MAPPING`
--

LOCK TABLES `AM_APP_KEY_DOMAIN_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_APP_KEY_DOMAIN_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_APP_KEY_DOMAIN_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_BLOCK_CONDITIONS`
--

DROP TABLE IF EXISTS `AM_BLOCK_CONDITIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_BLOCK_CONDITIONS` (
  `CONDITION_ID` int NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `BLOCK_CONDITION` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `ENABLED` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `DOMAIN` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `UUID` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`CONDITION_ID`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_BLOCK_CONDITIONS`
--

LOCK TABLES `AM_BLOCK_CONDITIONS` WRITE;
/*!40000 ALTER TABLE `AM_BLOCK_CONDITIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_BLOCK_CONDITIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_CERTIFICATE_METADATA`
--

DROP TABLE IF EXISTS `AM_CERTIFICATE_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_CERTIFICATE_METADATA` (
  `TENANT_ID` int NOT NULL,
  `ALIAS` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `END_POINT` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CERTIFICATE` blob,
  PRIMARY KEY (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_CERTIFICATE_METADATA`
--

LOCK TABLES `AM_CERTIFICATE_METADATA` WRITE;
/*!40000 ALTER TABLE `AM_CERTIFICATE_METADATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_CERTIFICATE_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_COMMON_OPERATION_POLICY`
--

DROP TABLE IF EXISTS `AM_COMMON_OPERATION_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_COMMON_OPERATION_POLICY` (
  `COMMON_POLICY_ID` int NOT NULL AUTO_INCREMENT,
  `POLICY_UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`COMMON_POLICY_ID`),
  KEY `POLICY_UUID` (`POLICY_UUID`),
  CONSTRAINT `AM_COMMON_OPERATION_POLICY_ibfk_1` FOREIGN KEY (`POLICY_UUID`) REFERENCES `AM_OPERATION_POLICY` (`POLICY_UUID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_COMMON_OPERATION_POLICY`
--

LOCK TABLES `AM_COMMON_OPERATION_POLICY` WRITE;
/*!40000 ALTER TABLE `AM_COMMON_OPERATION_POLICY` DISABLE KEYS */;
INSERT INTO `AM_COMMON_OPERATION_POLICY` VALUES (26,'01dea00e-0336-45af-b8d8-cc1136683b16'),(18,'0b338039-981b-4fc8-b2e2-f2eb77191b2c'),(6,'0d1fc92a-3880-417f-9876-c343eee50e4b'),(11,'12d732fe-87e2-4dde-a6f6-50fb5e10aebf'),(12,'29d8211c-81d6-4a8e-a869-6d41acc7699e'),(23,'2d45ca6a-5d4c-4dfe-be70-5cfb91f1c25b'),(20,'2ec434d2-f9fc-437e-8c08-cb6b2a95edc8'),(17,'382b5f7f-dcb9-46a7-9c12-568c26da19c2'),(10,'3882f8db-44c5-42dd-9759-07d9e3c51807'),(16,'45af0606-65a8-4e5f-8ce8-bf4818b71ac2'),(8,'53cedad3-4c1e-439e-abe2-89863f0aeb16'),(3,'5abc723f-c9e0-4885-b23a-5f7e656c1b30'),(14,'6819ffde-4403-4a56-8222-6776330d38f4'),(21,'72f20e65-7ab2-4e49-a9e2-771ed82687aa'),(1,'96b3b05c-4681-4487-99b9-c55e81ef12d4'),(19,'96d82e64-fa36-4aff-89d3-df4cfa86d9ff'),(4,'b6e670eb-f478-4b24-9b60-58ee403bf39f'),(22,'bb2f3157-fed9-47b2-864d-d0944514e478'),(15,'bf72dc61-e49c-4511-8450-ec2e9d87bf73'),(25,'d348f654-cbf1-4905-a0db-85837097f9c8'),(9,'d9aa8827-6012-42fc-a0cf-003337b26d67'),(5,'df868b5b-766e-4894-bc16-ee92d068cff3'),(13,'eb20aa02-8acb-4e7c-845a-cdab5d3bb7a3'),(24,'edd51348-154b-4edb-897a-5c0874fb8fd2'),(2,'f6d680f9-9456-4d32-a400-f18bfaf62829'),(7,'ff58dde7-bd56-4ceb-ab7a-41161101ae38');
/*!40000 ALTER TABLE `AM_COMMON_OPERATION_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_CONDITION_GROUP`
--

DROP TABLE IF EXISTS `AM_CONDITION_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_CONDITION_GROUP` (
  `CONDITION_GROUP_ID` int NOT NULL AUTO_INCREMENT,
  `POLICY_ID` int NOT NULL,
  `QUOTA_TYPE` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `QUOTA` int NOT NULL,
  `QUOTA_UNIT` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `UNIT_TIME` int NOT NULL,
  `TIME_UNIT` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`CONDITION_GROUP_ID`),
  KEY `POLICY_ID` (`POLICY_ID`),
  KEY `IDX_ACG_QT` (`QUOTA_TYPE`),
  CONSTRAINT `AM_CONDITION_GROUP_ibfk_1` FOREIGN KEY (`POLICY_ID`) REFERENCES `AM_API_THROTTLE_POLICY` (`POLICY_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_CONDITION_GROUP`
--

LOCK TABLES `AM_CONDITION_GROUP` WRITE;
/*!40000 ALTER TABLE `AM_CONDITION_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_CONDITION_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_CORRELATION_CONFIGS`
--

DROP TABLE IF EXISTS `AM_CORRELATION_CONFIGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_CORRELATION_CONFIGS` (
  `COMPONENT_NAME` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `ENABLED` varchar(45) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`COMPONENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_CORRELATION_CONFIGS`
--

LOCK TABLES `AM_CORRELATION_CONFIGS` WRITE;
/*!40000 ALTER TABLE `AM_CORRELATION_CONFIGS` DISABLE KEYS */;
INSERT INTO `AM_CORRELATION_CONFIGS` VALUES ('http','false'),('jdbc','false'),('ldap','false'),('method-calls','false'),('synapse','false');
/*!40000 ALTER TABLE `AM_CORRELATION_CONFIGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_CORRELATION_PROPERTIES`
--

DROP TABLE IF EXISTS `AM_CORRELATION_PROPERTIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_CORRELATION_PROPERTIES` (
  `PROPERTY_NAME` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `COMPONENT_NAME` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `PROPERTY_VALUE` varchar(1023) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`PROPERTY_NAME`,`COMPONENT_NAME`),
  KEY `COMPONENT_NAME` (`COMPONENT_NAME`),
  CONSTRAINT `AM_CORRELATION_PROPERTIES_ibfk_1` FOREIGN KEY (`COMPONENT_NAME`) REFERENCES `AM_CORRELATION_CONFIGS` (`COMPONENT_NAME`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_CORRELATION_PROPERTIES`
--

LOCK TABLES `AM_CORRELATION_PROPERTIES` WRITE;
/*!40000 ALTER TABLE `AM_CORRELATION_PROPERTIES` DISABLE KEYS */;
INSERT INTO `AM_CORRELATION_PROPERTIES` VALUES ('deniedThreads','jdbc','MessageDeliveryTaskThreadPool,HumanTaskServer,BPELServer,CarbonDeploymentSchedulerThread');
/*!40000 ALTER TABLE `AM_CORRELATION_PROPERTIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_DEPLOYED_REVISION`
--

DROP TABLE IF EXISTS `AM_DEPLOYED_REVISION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_DEPLOYED_REVISION` (
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `VHOST` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `REVISION_UUID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DEPLOYED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`NAME`,`REVISION_UUID`),
  KEY `REVISION_UUID` (`REVISION_UUID`),
  CONSTRAINT `AM_DEPLOYED_REVISION_ibfk_1` FOREIGN KEY (`REVISION_UUID`) REFERENCES `AM_REVISION` (`REVISION_UUID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_DEPLOYED_REVISION`
--

LOCK TABLES `AM_DEPLOYED_REVISION` WRITE;
/*!40000 ALTER TABLE `AM_DEPLOYED_REVISION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_DEPLOYED_REVISION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_DEPLOYMENT_REVISION_MAPPING`
--

DROP TABLE IF EXISTS `AM_DEPLOYMENT_REVISION_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_DEPLOYMENT_REVISION_MAPPING` (
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `VHOST` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `REVISION_UUID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_ON_DEVPORTAL` tinyint(1) DEFAULT '0',
  `DEPLOYED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`NAME`,`REVISION_UUID`),
  KEY `REVISION_UUID` (`REVISION_UUID`),
  CONSTRAINT `AM_DEPLOYMENT_REVISION_MAPPING_ibfk_1` FOREIGN KEY (`REVISION_UUID`) REFERENCES `AM_REVISION` (`REVISION_UUID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_DEPLOYMENT_REVISION_MAPPING`
--

LOCK TABLES `AM_DEPLOYMENT_REVISION_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_DEPLOYMENT_REVISION_MAPPING` DISABLE KEYS */;
INSERT INTO `AM_DEPLOYMENT_REVISION_MAPPING` VALUES ('Production and Sandbox - DC1',NULL,'0952a113-1e90-472c-9f0b-d50ee95c441e',1,'2025-12-08 17:13:05');
/*!40000 ALTER TABLE `AM_DEPLOYMENT_REVISION_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_EXTERNAL_STORES`
--

DROP TABLE IF EXISTS `AM_EXTERNAL_STORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_EXTERNAL_STORES` (
  `APISTORE_ID` int NOT NULL AUTO_INCREMENT,
  `API_ID` int DEFAULT NULL,
  `STORE_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `STORE_DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `STORE_ENDPOINT` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `STORE_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `LAST_UPDATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`APISTORE_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_EXTERNAL_STORES_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_EXTERNAL_STORES`
--

LOCK TABLES `AM_EXTERNAL_STORES` WRITE;
/*!40000 ALTER TABLE `AM_EXTERNAL_STORES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_EXTERNAL_STORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_GATEWAY_ENVIRONMENT`
--

DROP TABLE IF EXISTS `AM_GATEWAY_ENVIRONMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_GATEWAY_ENVIRONMENT` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  `PROVIDER` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ORGANIZATION` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`,`ORGANIZATION`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_GATEWAY_ENVIRONMENT`
--

LOCK TABLES `AM_GATEWAY_ENVIRONMENT` WRITE;
/*!40000 ALTER TABLE `AM_GATEWAY_ENVIRONMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_GATEWAY_ENVIRONMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_GRAPHQL_COMPLEXITY`
--

DROP TABLE IF EXISTS `AM_GRAPHQL_COMPLEXITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_GRAPHQL_COMPLEXITY` (
  `UUID` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `API_ID` int NOT NULL,
  `TYPE` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `FIELD` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `COMPLEXITY_VALUE` int DEFAULT NULL,
  `REVISION_UUID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_GRAPHQL_COMPLEXITY_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_GRAPHQL_COMPLEXITY`
--

LOCK TABLES `AM_GRAPHQL_COMPLEXITY` WRITE;
/*!40000 ALTER TABLE `AM_GRAPHQL_COMPLEXITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_GRAPHQL_COMPLEXITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_GW_API_ARTIFACTS`
--

DROP TABLE IF EXISTS `AM_GW_API_ARTIFACTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_GW_API_ARTIFACTS` (
  `API_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `REVISION_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ARTIFACT` mediumblob,
  `TIME_STAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`REVISION_ID`,`API_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_GW_API_ARTIFACTS_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_GW_PUBLISHED_API_DETAILS` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_GW_API_ARTIFACTS`
--

LOCK TABLES `AM_GW_API_ARTIFACTS` WRITE;
/*!40000 ALTER TABLE `AM_GW_API_ARTIFACTS` DISABLE KEYS */;
INSERT INTO `AM_GW_API_ARTIFACTS` VALUES ('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','0952a113-1e90-472c-9f0b-d50ee95c441e',_binary 'PK\0\0¢âà[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.json\ÌXKo\„6æ\˜W>u¸ä7Ÿú™:F\„b\◊6be{h-çm\"©íî≥\ﬁ ˇΩCJî)\Ÿ[§§Ω0`iær¯ÕÉüÇñ\ﬁg–∫	Z$£≠üå`RQ¡çlwy—ø\Ë\‚ÑhÇ≤g|\∆7ö¸äƒΩ\· ∂Iü\\∑/\ﬂ\√U˚˙˙\›˚v2Ñ+\ËÆ\ÒeúXk¥\‡$µ\Û\Ã\È◊Ød±%\Òc8ü80Kö\Èr\ﬁhKUÄ?(öfT\r\÷B\÷8∞÷Å\‡år2+JÄQt|(-$\\∏qc¡5|\—fÃéUT\∆‘°\ﬁJ{\›r°(œ§\ÿ\—§•%I)w\0£k\ÌcMtÆ\Ïr~˘0Y‹çoùéï	Æ`D\‚-\Âõ1\'+Ü≠5a\nú_BDSπqn\–\Ìñ¿ñ®hõß+N(k\ÿPukí3˝©rª\ﬂ√éñÄñ9T˛RH¬åN˛uÿúπµ\Ï\rJ)\ÿU-p)˘D\≈\‰8\ˆ®T\ W&∂+ê\Ë7]\”¯î™K¬ª(öªôµ$©îÜ†?¨\»\£u÷≤/üù\Z\Ÿ(_√ÜπÆí	Fc\n5µÃûîjåLMï\‰z+$˝jùºRfAËãùÉ\n\‚\\RΩ∑4Ä?∏0\√\ÙK=\˜æ\\E\„•}\ƒb[>\¬~ôé\‘	πØ{a(_QÜcW)6j˘É{¡ä}Æ\À#dù\Î\ZíBB≠\„sè™\"<∂\Ù\¬f9L<z∏øO£e4ûÜ”®\ımãì”í$°Fá∞πH›ò˘˛ëd¶«º8ï8•FX\ƒRòrhMg\”q\ÎxD\«*W\ÿîöp\Ï©Àπgœûx\·\ﬂ\ˆí{á†\’T\∆iQê≠î\»G\–X\ÿ?˙\…E,“ÉùÜx\À1\Õ\Ÿal±\Â¡≠?v]ß\ZúH\Ïà\È\\Bs|kÍàâÖ4+_\”M.è\÷vû\ÏAMC\∆\ƒ\”L\“\r\Â~°†⁄è≠\Ú˘\Û?Xé$$¿5\≈	^1OQYçy»â\"≥@h\Ì\€\Â\0m;Bªp\’W38∫–éL3\Ò\‰ãY8c;\Ë+\Ú–ã§\·⁄Ø\„\»q˛Pù-j\Ô∑\„\„h\\\”£—ù/òÕ£\…l∫®™E\˜	VXdØŒæ\Î¢\«1é≠IÇ\›\ˆ9ß\ËÜcﬁÜlÉ$\Îmj\–\≈]ÿ´kì{á\∆\˜•Ω\ÕW\Ì\nhd°Ç\‘\ÏcvΩz7\ÏÜ\√\Îa∑[\Ì•å(˝ê%NOiífØU6z˝n\ÿ\Ó\ı\€\›\Î†wu\”\‹tááç\Zxí	\ uAOùóY∫ù\≈náïb\ﬂ]â/Kß¶<[Ñs…úç∫\Ètò¿J\›\n•o\ﬁ_^:$\Ì(bé%ﬁë¢≥\Îu∞©w\\@_™©\0ë\‰6˚\ﬁp∂ZX\‹4cïbEÿ¨âJ\"\∆\”\€˘l\‚µ\Ûõo≠uöflM¸\"\¸-\Œ~~6k\"7E∫uÑ4ô\„ax\»Z\Ÿ]¨Q$¶⁄ùOañ±\Ú`¸ôwª˝wÅ/zP\ı!\ıV\n≠\Ò\Ù∑±;ö›´˚πßx¥∂Ço…ºà\ $9B´\’{ª\Âa\Ò\ˆD\ÙWéy‹∞\ÛN~«à=∂Yq%}i&\ k	∆Ä\Êß¯m¥®3Ω\ﬂGØ\Õ\ﬂŒ≥˝õ$/g¶ˇO¶˚\Ïô\È7c˙¯\»r&˚˚\»\÷8\˜=(ë\À\Œ\›\„Mi\Óü˘˝\Ô˘=ü\„ﬁò\‡s+~˚n~éü\ˆ˛\›w .\Ã]A˝\Î\\ˆ	\'õ˙\ıMã0÷∏IMv\ÊNOÅπÅ\Û?\Õ+\‡ƒÖTF´K3ˇ\‚›Üé\'\¬ø/f˝˙=\ƒ}\"˚Oï ì.\Ót\—5PG\Ì9…î€û[\ﬂ\„\»]7c4¥à´\À\r\·\Â\’Tqâπ¸B\Â\"\„\Œ\À/PKà\˜ç\0\0P\0\0PK\0\0¢âà[\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0PizzaShackAPI-1.0.0/Definitions/swagger.json\Ì]o\‹6\Ú›øÇPã{8d%\€\Ò∏<u\„lõΩsl#ª\n§y\‡J\\ã≠D™$\Â\ı&\ø·áæ%Ø˚ö8\ÿ ±#q8\Œ\˜©\œy<#g\‘CØê\˜\“?\ÙΩ˙5ekÆ\ﬂ}ÜxTT%\ƒ¿\\\“Oü\\"\∆\·ü\”ÀπÅÖ\·à\»P\–LQ\Œ\–2¶¡_å\ﬁ\œ\À_\Ú0ZsÅ\Ãtd\Ê#\Œ\ \ Ã´à$\ÙÜà-íä\‚ˇ\Œ\n\‹!g\ná™\"\ﬁ1úZj˛\√cÜ\ﬁp\‚Äa(ââï\ ^¡f≥\Ò\ÕR/\Èá<≠@Iä©\∆\"å©\"°\ ˘πn†\Ô1	\r	ì§üòiÜ√ò†c\«\√!r∞\Ûπ∏:ú\ÕOg\Áã\Ÿ\Ê˙±Jì\Ê™¿Y∞\ˆ\»\»\Ë¿\rzí=™á>\¬*\÷˙\Ë\0\√\\Pµm@Fdç\ÛD\Ÿwk\–V±¨\…?\‡\"\"¢±\ÌåÀÜPz\‘\‡T¨h#ta0º®†˘+\'RΩ\Ê—∂â\∆~dmP¸Ä2\ŒS2®fP\‡ôEXŒ∫k†ñ0\€A||x\‘~7Hx\‰£EÜD\ 5hpÅm®äëA√Æí-\n-,\‚´?@ÅñhF#\ 4\–\n∂\Áü\Òk\‰(&àFFß)ì\Ë\Í˝\‚\Î&;ﬂØ\Ò\ i\Áv∂d∆ä˙{\ÌìKw7\ÂπIõ\0ÉI™≠sí¶YB˙`\»mñ\\»@≠q\"I\Z∞Ä\˜S´\›\Õ6sã(AŸµ◊ÅπkΩπkØ\·ùãÅëì•C5í+°ùÜ4{åü3\Z\œ-\÷xnáΩjÑ≥\\í—§\‡9®N;\Ó7^;©c∂#7Q{jl\»;9<a–ØqÑ\ﬁ[\Ô\·£9ª¡	’än^ K\ÊÖ5Q\"\„˚\⁄\\õi™ûêkGˇ\Z¡µ+&\Û,\„B{Öw$¢ik\Úë6\Á‰úâ¨‹Ä˚£L{|ÆP5\"ä\’w\»\‘\ﬁ\Ë\”jK∑Æõm√Æ∫ù\‡\\≈ì\“\Óß+\–?P˝\ÈJ6C\Í\ÌD≈Ç+y\’\ıDQ±Aå	M!Ωâö†…è\'56O\Ít7®.I.\◊\∏&\Úÿ´Sn\“Iç\n\'•ø´\ˆxPˇ]§6AJX\ﬁ\»+Æ…Æ¥\‚=Å<M+YBµ\ıÆæÅDØÇ46[M•72\„=.˛\Î£3∑$≤&µÜ\»˛~•.Å∑=AG\Á\ÔÜv\Z\∆;`\„0tm£kèq\›?ç`˛9xí)daô\“∂\Œ«π\,©qK&ZÉP\Z^g\Ôm\ˆﬁ¶\ÌmL|6ø\Ê\—\›œØDAù\nô{\"ç\€a›¢&\√\ A\’*\…\‹`Y)∫\ı\Z\n%∑”•Ws†\„é\Ùl‘ûÆmÇ\n`;Ä(ë7\Õ˚3\’{s\‘Aù\Ô\‰•-s≥1 qΩP\∆\«{\Í\"\Õ\ﬂ`˘¥°IÇV§t\ÿﬂö[x\Ú|¯d§S˝Ö\ÁJ‹ä_∫Gqb\›(πÖÄ\˜fl˚¥è@o*{ÅYæ+¿\\eëiò1k~∞´}Ñy\Ú\ÛU∫écÀå¡ÜcnT#\Í\ËÉ¡¥o\rV\ˆ≠¡˚ò\—t\Ì\ﬂX|z≠¡\Ô/®?.¥Ÿê\ıHqùjæ\ÍªO&\˜\È\–#“°à$ê\∆\Ï»à\ﬁ†}F\‰æÕö[ë\Œ\»2Å¥¡J8\ÚT<∂Zmx\Z∑\¬\ﬁ\”\Ï=M\◊\”\‘¯\Â\n\‚y°=;˙~má\Úî\÷\¬ˇ∞…Ω\\ø\\Æ\«{Å>gÅVíÓù¢ΩËûá\Ëz≥πΩ\ûá\ ˇ\r\„ΩÏûì\Ïäü\ˆhïtVÎ∫úµ!$œ§¢˙2É9\ﬂoäº∫\Â˚¶ònuQ\—\Z\Â8±=âTåJ\Ò\≈¯Ü \¬÷Ñ\Œ\√s]u \\4P\Íôx£Z˙†IÜ\Ú\Á\ÚR®\5i\¿\Àœà\0\ÊwU¨Ñhu‘≠-´M\‚\œU\œ>ãù\ró0°´\‚Üh°Pz\\w[∂µR\r ~:0àé©ñW3ÜDgoXõã0nX\0∂4\…\ıL\–p\œ˘\‘\‚˛ó¢)\Í˘/ùO\”q∫3R\Ì{\—=≤\ËΩ˘\\ìC—ô+ä0óäßDú?í\Ó Ω•c…ä\ÛÑ`6åGÑÉû≥á\ÒÑò\˜˝\›¯\ÒHB\ÿUßXD\Áy∫j\Âa∏˛ ±π\ﬁxfW\ƒQJ\ı©T\Õ6ÜTÕåó–ãª\ˆ\Ë\Ë\‰∑\ﬂ\–\€\Â\ÚIÖU.øeólw\·\–\›\”7\"]^4ó\Îª\Z\◊YmnqA˛•~@XÉÄ«àuˇ\ˆÇ!Ä§¢Éèf∑æªs±¢}. \—jãc¥¶$\È\ﬁºë7¶wT\Ï\∆\‹\·.˛√ú\Ì6M›•\'u¶>##e\ˆˇîç¥\ÁçÔñæt«ó \"\*\Ÿ\Í\Œs.kHFEä`-¯;\Ã¯†FØ\◊8Rn§g}\Ò§ø\ÌL\›$båêH∫ñ(¯\„fé:\–¸\—¯ºß\È˘\ìº\›\Ì\Ãv7ΩóuEΩ\–+µòW´\Í>≤êΩÀµk+Ææ\Èz3›≠ß!\Ìi{\Z\Ùì\·\⁄U\Ì\€.˘*0ù®\∆f%πK¯?qa ´/\ ]\»\ÿ3~kêu*º:d\»\Î∑\0<˝x\ Ÿö^\Á\¬\0œòæ\¬ïuÖc*6M{}..x2MÄ+Ç^SVT)ˇ,#A\Ë)àL\r\0¯v\„}[\›T¯\–bß<S3a\‚fLÃîâ•E7N\Ó\·yq1ΩúÜ\÷0Ü	|G`ï®X\Û\◊\ŸROΩº≤ø.\Ê\˜õ\Ÿ\Ÿl93o¶\À”∑˙?ó\À˘\≈˘¬≥\∆’πë0\ Õ≤¬¢å\”f\Ÿ˛¢X¨PçÑá8âπTØ˛}r\Ú2¿i ±>\n™è\rÉõ£\0g4®vR*Æ\∆‚µâêòE+~˚)XaI.\ı…ôÜ®\„9™æ#u†J`&\ı•∏:YnùqE\Ù®\Úπ∑pn\–\\t.&°˛≥Üû\Ù[Ü[“îÄ≥ü≥gj5\È\Â\·°\∆}p\˜?PK¡]c\n=\0\0F;\0\0PK\0\0\0¢âà[à\˜ç\0\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.jsonPK\0\0\0¢âà[¡]c\n=\0\0F;\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0f\0\0PizzaShackAPI-1.0.0/Definitions/swagger.jsonPK\0\0\0\0\0\0§\0\0\0˝\r\0\0\0\0','2025-12-08 17:13:05'),('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','85114c73-4359-49e5-9545-c747bec89cd3',_binary 'PK\0\0]Üà[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.json\ÌYKo\„6æ\ÔØt,\Í¯ë8ØSU\«h\\\Ï\⁄F¨l\Ì¬†•±MÑ\"Uír\÷\‰ø\Ôê2mJvä4E∂,\Õ7Cøyê°û>A®\◊9Ñ\◊AHr\Z˛l+êä\nnd´≥ì\ŒI´ßDî=\·3æ\—\‘\‡$iwOìnÉt\»e\„\Ï\n.\Zóó\ÁWç¥–öü&gIj≠—Çì\Ã\Œ3¶ﬂæë…í$\—x\‡¿T\"iÆ7\Û\∆K™¸#Å¢Y\Œ @\’`.d`çk\Œ(á ∑¢E\«◊Å\“B¬â7\\\√Wm\∆lZEeLÍ≠¥}\“\⁄,\Âπ+öÇ¥¥§\Â`tΩu\¬`¢â.î]\Œ˝Øì\€˛ç”ë†r¡\ÙH≤§|\—\Ád\∆¿∞5\'LÅ\ÛAài¢0Œù∂Z`ITº,≤\'î\’l®∫Å9)ò˛ºuª\n\ﬂ¡än\0-\ÿ˙SJ!çr:¯\◊as\Ê÷≤\Ì\‹ª™	.\"#ü	£ò˚mîäôâ\Ì$˙M\Á49§\Íí\6é\«nf-	G*•!\ËO+2¸hùá\ˆ\ÂãS#\Âk\ÿ0WUr¡hB°¢vèŸìQçë©®íB/Ö§ﬂ¨ì∑@6Y˘bÁ†Ç§êTØ-\r\‡.\Ã0ùçû{üŒà¢\…\‘>b±M`=\ÕG\ÍÑ\\WΩ0î\œ(√±∑)\÷}å¡ù`ÂÇæT\Â1≤\Œu\… •\÷\Ò±«ÉU[z\—\n≥é\Ï&\Ó\›\ﬂ\›\ıá\Ò4\Ó£aælqpZí¶\‘\Ë6ñ\"©k3\¬?ë\‹\Ùògßí$†TãX\nS\·p4Ïáá¿=:fÖ\¬\Ó†‘Äc\ﬂ\»\\\Œ=πà8x\Ù\»\ÀˇN∞ó\‹	\ÿ≠¢\“\œ Ç3\"@caˇ≤\Î\'\'â\»vv\Zí%\«4gª±≈í7˛\ÿUù\Ì\‡Db\œ@L\Í\„[SGL\"§Y˘ú.\nπ∑∂=\`™31&Gí.(\˜\’~\n7\œ_˛¡≤\'!Æ)N\äy\  ™\ÕCô\"k\ﬂ\ÿ–∞#4JW}5É£ç\ÿ4O>E\„(±Éæb!ü\0ΩHkÆ˝÷è˝\«\˜\’\◊—§\Ú~\”ˇÿè˚ç(\Ó\›˙Ç\—8åÜì≠Cï\Ë>\¬ãl\‚\’Ÿã±.{\Ï\„ÿö$\ÿmoósä.8\Êm\ƒH≤^fù\‹F\Ì™1π∑k|_\Àb\÷\ÿµ,î@∞Éö}\Ã\Ó°\Á\›\Œ\ÈYß{\’jm\˜RFîæ\œSßß4\…\Ú\◊*ΩN´\”m¥;ç\÷e\–>øÓ∂ÆªWªç\Zxö\ uIOïóô∫ù\≈nªïbﬂùâØSß¶<[Ñ…úç∫n6ô¿J]\n•ØØ\Œ\ŒNõ$k*bé%ﬁë¢πj7±©7]@ü∑S\·a\"-l\ˆΩ\„lï∞∏i\∆*√ä∞Yoà\Ëo∆£Å\◊\Œlæï\÷iö±5\Òã¿\Û∑<˚˘Ÿ¨â\\î\È\÷\“déá\·!kfw±Zëòjw>Ey\Œ6É‡Ø¢\’\Íúæ\Ë^Uá\‘K)¥\∆\”\ﬂ\¬\ÓhvØ\⁄\Ì\Áû\‚\ﬁ\⁄Jæ§\„2*Ét›Æ\ﬁ\€-wã∑\'¢ø\Ã„öùw\Ú\€G\Ï±Õä∑\“\Áz¢ºñ`hqà\ﬂZã:\“˚6zm˛6ü\Ï\œ }>2˝2]\€gèLø\”˚Gñ#\Ÿo#[\„\‹w†D!8vèw•πs\‰\˜\«\Û{<«Ω3¡\«V¸˛9\\ˇw¸\»\\€>=v\·\œ\Ôm?∫9¸\ﬂ	NÅeèi\«.¸\≈\ˆ\◊\›\·Ç¡\‹\'Voê`˝âp≤®^ÒÜÑ±\⁄◊ñte\Ó˝ò[z\œ\Ìp\‡\“:ß€ãuˇ„úçOÖ˛òå:’ª\ :˙H÷ü∑*èJ∏Ω¡Å.∫j™5\'πrπ|Ob\˜I\n£°E\"X\ı\ﬁL.\ﬂ\\_ó\⁄\"gÇü®Cd\‹y˛\¸PK\Â*\Ã8\0\0t\0\0PK\0\0]Üà[\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0PizzaShackAPI-1.0.0/Definitions/swagger.json\Ì]o\€8\Ú=øÇ\–\Ó\·P[Iö[\‡˙t\ﬁ‘ª\ı]öµ,\–\€Z¢c\ÓJ§ñ§\‚∏E˛˚\r?dâ˙àï&∑≠-∫uEá\√˘\Êê¸|ÑP¿3\¬pF\ÙØ\«\«\„\„\‡ïn¶l\≈u\€g¯ÄOEUB\Ã5˝\Ù	\œ\◊8˙}r=3∞\–	ö) ôZ¨©D\£\”˘\‚ß<A\0åV\\ 3ôÒà≥Ñ2Ç2\”ìÑ\ﬁ±ERqA\∆ˇe\Óà3Ö#Umßñö\Û5Co9q¿–ïã\ƒ\Ù¨ï\ ﬁÑ\·f≥õ	§ûr\Ò¥%)¶ãhMâT.»øj\‡˙¡ì–à0I⁄âôd8Zt\Íx\ÿE6`c.nCáNÜ≥\Û\È\Â|:Ç±\„µJV\‡ã,X{bdt\‰:IÑ\Ó\’]asÜ˝\Í\0£\\Pµ\ı c≤\¬y¢l€Ø\Ë´µ¨\»?\‰\"&\¬[v∆•\'î58+Z¿\»]ØJhA˛»âT?\Úx\Î„Åæø\n≤2(˛Ç2\ŒS2,GP\‡ôE∏\ı‡°ñ0\€@|z|Ro\Î$<£yED\ hpÅm®Z#ÇÜU%[YXƒóøÅ!,\–\nåFîi†%,o|¡#¨ë£5¡@42:MôD7._\’0\Ÿ\Ò\„\nØëvlcI¶Øò†≠≥\’>I1us!∞Pûãà\‘	0ò§\⁄:G iö%§\rÜ\‹g	è\r\‘\n\'í¥°Hq;µ\⁄\›l37âî\›\ròáZ\ÀC}é\‡Xå-™û\\â\Ï0§)(\ÿcDxH\Ã\æk¨	\‹\n[\’g∏$£I\·o≤Sù\ˆ\‹nºvP\√l{.¢\Ú\Â-(8;>\Óa\–?\‚}∞\ﬁcåf\Ï\'T+∫i@ñLÉ5Q\"\r\„˚\⁄\\õj™^êk\'ˇ\Ë¡µ&\Û,\„B{Ö\˜$¶ik\Z#m(\Œ\…9)Xπ\˜Gô\ˆ¯\\°r0D˛´Ôê©≠—ß-\‘\Ó8\\∏n¥\rª\Ë~Ñsµ\Ì\Ï~R≤˝\rUøn§R\ÔGj-∏RêW›éµƒò\–“õ\ÿ\›H~:™∞yT•€£∫\Ë0$π\\#\‡ö\»”†JπI\'5*ú\Ï¸]π∆£\Íoë⁄Ñ)aπóW‹í}i\≈yöV≤Ñj\Î]!|â^&ilñö †g:\–\«{\\˝gå.\‹\\ê»ö\‘V\" G¯\ÛïzßXºm	::7<\Ë¿∞\◊0\ﬁgÄ°iM\Îxé\Î˛°\Û/¡ìL Àîñ∞u>\Œ›ÄgIç[2\—\ZÑ\‚yù¡\€ﬁ¶\Óm\Ã6&¸l~f\Ò\√\œ\œD¡>2\˜D\Z∑√öõö\ÿ™⁄ñ\Ãu\Óvän~OCa\Àm˙\Ù\÷\À\Ôh∏#=\Z’ákõ†\ÿ J\‰^¢˘x¶˙hé⁄©Ûçº¥fn6\Êw$Æ\ ¯|O]§y\‡,ü64I–í\Ï\ˆ∑\Ê^<>\Î\ÈT\‚9É-n\…/]£â9±nî\‹C¿˚3∂!\r\Ëœç@ªZ`ñ\Ô07Yl\nfÃö¨jà0/aæJ’±\Ô6£≥\‡ò’à˙`0\r•¡\Úø°4¯3|\◊˛ç≈ßÉ(\r~A˝y˘£ÕÜ¨_@ä\ÎTª\U\ﬂ}29§C\œHábí@\Z≥\'#zkÄÜå\»u|õ{nΩât@\Ó\ÚH¨Ñ\„±G\≈sw´ûßq3ûf\4MOsT\·W*à\ÁÖ\ˆ\Ï©˚\’\ KZˇΩ\√&π~π\\OÅ≤@\À\nI\ÛN\— ∫\√]k67\Ô0Ñ˘o¥dwH≤k¡\◊C<dÅ\ÓåQs\—í\Ë|[ÑHò˙;å!6™LèœÇrS_\Œ\Îjûê≥\’◊ó\≈\Ã˝)_\‰\Â+ä∑•¿\ÙQe1Ω£qé[cñH≠±B)ﬁ¢5æ#àG∞4°\ÎπÆ\Í \\®´ïØ\Z\ıQìì\‡\nR\"%æ%ÇL\å`~S\≈v\O≠>5kw\Â\"\Òí\Á™eù\≈ ∫KDë´íu\—Bô\"∑\Õ#±J) ~8\Î0àÜ\˜\›]}\Îù}¡b.\Z\Z∏n\ÿ\“cOÆgÇF}x\ﬁ…ß\Z\˜øMQ/˝\“\Ò4\Ìß;=\≈qUw\“\"ã÷ó%9ïﬂæ¢àr©xJ\ƒ\Â3Y\·û4ë¯1$K\ŒÇY7\«Z\Œv˚b^4µüv\ˆG¡B®:\«\"æ\Ã\”e](O\√\ıGé\Õ\ı\Ò\«p0;K\'éùT_J\’lë∂K\’Lo\Ò»ß∏Kfè\Ê\œ~˘Ω[,ÆëTX\Â\Ú[v\…v\›#uy\“\‰Ö?]\€\’\„\∆l3sH.\¬\\ \·/k\±\Ó\ﬂ^\‡êAt£\È˝\ÿ\›\ÈÜXQ?wïhπEGk¥¢$iﬁª\Óº\Ò‹ß6ø\ÿ\ﬁ\ÿ\ÓS“ß9\€=lö∏K•(nL}«Ä\Ùî\Ÿˇ#Pzh	Œºw°_∫\‚kêxôl\ı\…^.kHFEä∂5å\˜ò±óÉ{Wvº\Ù¨-û¥ü\ı9S7â#$ñ\Ó\»	¸±ü£v.\ı8Xz\‰P\È\È7%\ˆ\’O+[YWd\—s=Sçyï}A\’G≤wπve\∆U\¬7Mo¶OCiD[é\„çÅ˙\…p\Ì¶\ÚvVæ	Më\√{¡ª\„\"w	ˇ\Á..td\ı\≈\ˆBod\Ï*kêU*Ç*dƒ´∑¨˝y\ŒŸä\ﬁ\Ê\¬\0Oôæ\"\Z\Ô\ˆé©\ÿä\Í{GÇ\'ì∏r%\Ë-e\≈.\Â\ÔªH\–z\"”Ø≠\0\ﬂ~º\Ô õ`k\Ï‘Ågbå‹àë2≤¥\Ën\Ôf|œØ&◊ì\»\ZF7Å\Ô	\Ãs˛<]\Ë°\◊7\ˆ\Ájn~\ﬂN/¶ã©iô,\Œ\ﬂ\È\\]/fWó\Û¿><Ær\"aúõiGÑ\≈ß˛∂¸E1Y°\Z	èp≤\ÊRΩ˘\Á\Ÿ\Ÿ\Îß°\ƒ˙\Ã=,sáw\'!\ŒhXÆdß∏\ZKP\'Bb/˘˝W§`â%π\÷74D\œI˘NﬂÅ*Åô‘óé´dπy˙m¢{mü[7\Œ\ÕE\Âb\ÈG\Ó\Ù§\›2ÿÇ¶ú˝å\Õ	8S´IØèè5Ó£áˇPKb\€Àπ`\0\0¶@\0\0PK\0\0\0]Üà[\Â*\Ã8\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.jsonPK\0\0\0]Üà[b\€Àπ`\0\0¶@\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0Ç\0\0PizzaShackAPI-1.0.0/Definitions/swagger.jsonPK\0\0\0\0\0\0§\0\0\0<\0\0\0\0','2025-12-08 16:51:00'),('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','ae89b6e9-c885-4841-9f53-3fcd915f8602',_binary 'PK\0\0Má[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.json\ÌY\ﬂo\‚8~ﬂø\"\‚\Òtîîñe€ß\ÀQt\Â¥®§{w+dí¨:v\ŒvhŸ™ˇ˚çùú¿ûz+u\Ô©\…|3\ˆ¯õvù\ÁwA\–\“\€Z\◊Aã\‰¥\ı≥l@**∏ëm.œ∫ga)Nâ&({\∆g|£©¡˚$9\Ô]$Ω6\Èí\Ì\À+\Ë∑?|x\’N{–ápyë\\&©µFN2;œî~˝Jfkí<D”ëSPâ§πÆ\Êç\◊T¯GE≥úAÄ™¡R\»¿\Z\÷:úQAnE)0äéo•ÖÑ37n\"∏Ü\'m\∆\ÏXEeL\Í≠\Ù¸,¨ä\Ú\\ä\rMAZZ“år0∫Ñ¡6a0\”D\ .\Á˛◊è£\Ÿ\Ì\\∆\ÈHPπ\‡\n$YSæ\Zr≤``\ÿZ¶¿˘Ö \ƒ4Q\Á.¬∞\÷D\≈\Î\"[pBY√Ü™XíÇ\È\œ;∑\Î\lhhY¿ŒüR\niî\”\—õ3∑ñWï\Ï¢f∏Üå|&åbn:T)\⁄Htõ.irL\’\Â\‡mO\›\ƒZéLJ\√œüVd\Ë\—:oŸó/Nç¨îØa£\\W\…£	Öö\⁄=&OF5¶¶J\nΩí~µN\ﬁ©í \Ú\≈\ŒAI!©\ﬁZ\Z¿\\òa∫ïû{ü/à¢\…\‹>b≠\Õ`;\œG\ÍÑ\‹÷Ω0å/(√±w6h˘É;¡\ }©\Àcdù\Î\ZíAJ≠\„Sè™2<∂\Ú¢\r&\ŸO<∏øªé\„y<G\„∏\ımã£”í4•Fá∞©9H›ò˘˛â\‰¶≈º8ï$•X\√Ròjhç\'\„a\Îx@«¢P\ÿî\ZqlôÀπgOy\·\ﬂ	∂í;˚†\’TÜYYè≠å\»\–X◊ø\Ï\€\…Y\"≤ΩùÜd\Õ1\Õ\Ÿ~l±\Ê¡ç?v]g78ë\ÿ2”ÖÑ\Ê¯\÷\‘ìiVæ§´B¨\Ì\0<⁄ÇöFåâ«â§+\ ˝BAµüZ\’\Ûó±HHÅkäºbû≤≤\Z\Ûê#EfÅ\»⁄∑´\⁄vÑvÈ™Øfpt°õf\‚\…gìh\Z%v\–W,\‰†i√µﬂÜ±?\‚\Ùæ˛:ô\’\ﬁoÜá\Ò∞¶≈É[_0ô∆£\…x∂s®\›GX`ëÕº:˚f¨\À{¿8∂&	v\◊\€Áú¢+éy±í¨◊ôAg∑\—y]Éò\‹\€7æß\ˆ∫X¥w@#%\Ï†f≥[hˇ}\Ôº\€\r{˝0\‹m•å(}üßNOií\ÂØU6z›∞\€küw\€a?ØÆ/\√\Î^øOOsAπ.\È©\ÛR\"s∑≥ÿçcøR\Ïª\Ò4wj ≥E∏ê\ÃŸ®\ÎNá	¨‘µP˙˙\Í\Ú\Ú¢C≤é\"\ÊT\‚ù(:õ\Û6\ıé\Ë\Àn*<K§ÖÕæ7ú≠7\Õ\»XeX6k‚äà\·¯f:y\Ì<¡\Ê[kù¶[ø<À£üüÕö\»Uôn!M\Êxû±vkâ©v\ÁSî\Á¨:a\ÿ}¯¢{URØ•\–\Z+ª£ŸΩjøü{äk+˘VêNÀ®å\“t∑zo∑\‹/\ﬁà˛.0èv\ﬁ¡\Ô±ß6+\ﬁI_öâ\ÚZÇ1†\≈1~-\ÍD\Ô\˜\—k\Û∑\ÛlF\ÈÀâ\Èˇì\È\∆>{b˙Õò><≤ú\»˛>≤5\Œ}J2ÅS\˜xSöª\'~<øßs\‹|j\≈oü\√\Õ\«O?\√ß.¸\„˘ΩF7\'Ç	∂ø\Ó\"Ê≤´~Ω\Ò\0\€OÑìU˝˛±Ek|\nH7\ÊRZÅπB\ˆ\‹\ﬁGnTs∫ª\ı\ı?\Ÿ\»\ÒTX\‡èŸ§[øH[°£èd˚yß\Ú®Ñk\\t\—5PGm9…ï;_∂æ\'±˚^Ç\—\–\"¨~©#WÑWw´\ÂG†Ñ»Ö\‡g™¿w^ﬁΩ¸PK®P-\0\0\0\0PK\0\0Má[\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0PizzaShackAPI-1.0.0/Definitions/swagger.json\Ìko‹∏\Òª°˝PdW∂\„\–|Íû≥wq\Î\ÿFv\rê\ﬁÆ\ƒ\ı\ÚN\"u$\Â\ı&\\Ô\°\ı\ ±{âââ\√\·p\ﬁ3§> \å0ú\—\0ΩA¡\Î\È\·\Ù0x•_S∂\Ê˙\›gxÄGEUB\Ã˝\Ù	/68˙}vuf`a8&24Sî3¥\‹Pâ\‡/F\Êã\ÂOyÇ\0≠π@f:2\Ûg	ee\ÊULzK\ƒI\≈ô˛ó∏#\ŒéTEºc8µ\‘¸õozÀâÜ°\\$fd£T\ˆ&∑\€\Ì\‘, \ıí”àß(I1µ¿XD™H§rA˛\’\07\–\˜éòÑFÑI\“M\Ã,\√—Ü†c\«\√>r∞õrq:t2<?;ù_,\Êò;›®4\ÒWæ»ÇµGFFn0êD\ËQ=\Ù±V±fh¿–Ø0\ U;2&kú\' æ˚µùaµë5˘á\\\ƒDx\€Œ∏\ÙÑ“°ßÇ`E@Ÿ¢KÉ\·U-\»9ë\ÍG\Ô|<0\ˆWA\÷\≈_BêA\∆aJÜ\’\n<≥\ÀY\˜j	sÄ±-\ƒ«áG\ÕwΩÑ\«S¥»£àHπ\r.p¢-U§@–∞´dá\"ã¯\Í7P Ñ%ZÅ—à2\r¥Ç\ÌM\œyÑ5r¥!àFFß)ì\Ë˙\√9\‚\Î&;Z\„ï!\“\Œmm…åt\rv\⁄\')ñno6\ së&ìT;\Á$M≥Ñt¡êª,·±ÅZ\„Dí.4`)\Ó¶Vªõ]\ÊQÇ≤õ†s\ﬂxs\ﬂ\\#8#\'Káj W\";\ri\n\n\ˆæ$fx\œ\r\÷náùjÑ≥\\í—§\7Ÿ´N{\Ó6^;©e∂7Q{\Ú6ú0\Ëqå>X\Ô1Eg\Ï\'T+∫yÅ ,ô\÷Dâ\\¥å\ÔksmÆ©zFÆ˝c\0◊ÆôÃ≥å\Ìﬁìòb§≠iä¥°8\'\ÁL§`\Â\‹e\⁄\„sÖ™\…˘S¨æC¶vFüÆP[r∏p\›lv\–\›\Áj3)\Ì~V±˝\r’üÆ•R\Ô&j#∏RêW\›Lµƒò\–“õ\ÿ\›J~<©±yRß€£∫0$π\\#\‡ö\»\„†NπI\'5*úî˛Æ\⁄\„A˝wë⁄Ñ)aπóW‹ê}i\≈yöV≤Ñj\Î]#|â^%il∂ö\ ``:0\ƒ{\\˛gä\Œ\›Zê»ö\‘V\" G¯\Ûï∫T,\ﬁuùø\Ù`\ÿkÔÅçgÄ°mm\Îxä\Î˛a\0\Û/¿ì\Ã Àîñ∞u>\Œ›ÄgIç[2\—\ZÑ\‚yù\—€åﬁ¶\ÈmL~6ø\Œ\‚˚G:ûüâÇ:2\˜D\Z∑\√\⁄EMÜîÉ™Qíπ¡≤Rt\Î{\Z\n%∑”•ó?\–rGz6jN\◊6A∞@î»ΩD\Û\·L\ı¡µW\Á[yi\√\‹l\Ã\ÔI\\\Ô{î\ÒÈû∫H\Û¿7X>mií†)\ˆ∑\Êû=>\ËT\‚9É∑\‚ó\Ó\—ƒúX7J\Ó \‡}á\€Å\∆\Ù\ÁF†≤ò\Â˚\ÃuõÜ≥\Êª\Z#Ã≥GòØ\“uZf\Ù6s£\ZqK¶±5X˝[É1\√w\Ì\ﬂX|z≠¡\Ô/®?-¥Ÿê\ıHqùjæ\ÍªO&\«t\Ë	\ÈPLHc\ˆdDo\r–òπÅo≥\Ê\÷E§s\0≤\Ã_ m∞éßO≠V=O\„V=\Õ\Ëi⁄û\Ê†∆Ø T\œ\Ì\Ÿ\”\˜k:î\Á¥˛{èMér˝rπè}\…≠:$\Ì;E£\Ë^Ü\Ë:≥πQx/CxêˇFõQv/Iv\Ì ¯zÇ/Y†•1\Íf\Ó(∫ó$∫É‚ßΩì]Ä’∫Æ~\ÙÑò≤P_,2wm|ëW7\Ó\ﬂV\”mg\ bzK\„\'∂)ë\⁄`ÖRºC|Kè`kB\◊ƒπ\Ó\0 \\43\ÎU±◊π¯®IéI\\n)\‘\Ó¯Üx<2¡3\"Ä˘m+\·€©h\˜y™M\‚\œU\«>ãù\ı∑\"\◊QÈ£Ö2En\⁄\«\'µ∂	@¸p\“c-K-ØI\ıâ\Œ~\Ì`.•∏~\ÿ6\’@ÆgÇFCx\ﬁÀß\˜øM\—[˚\“˘4¶;\≈q\Ÿ¸F°Cù_!\‘\‰Pt	áä\" •\‚)OdÖ˚¸Ö\ƒ!Yqû\Ã˙±\‡8Üp\–q8ú\Û\ıK\˜\…\ÿp$lÑ™S,\‚ã<]5Ö\Ú8\\\‰\ÿ\\5~≥´\Ù\‚(•˙\\™fz}™fFãBä{G\ˆ\˜\‰ó_–ª\Â\Ú\nIÖU.øeólw\·\–=\–\√%m^¯\Àu]Sm≠vfTA˛•~@XÉÄ«àuˇ\ˆ≤/Ä§¢\√\Õ\Ô¶\Ó˛/ƒä\ÊùD´\"8⁄†5%I˚én\Ô\Ì\ÿ!}\‹2`{s˚O\‘\Ál\˜∞i\Ê. ¢∏0\ıy4(≥ˇG†\Ù\–<\Ûæ!¸\“_ÅDà¿´dßOÅrëXC2*R\\\∆l0`∫«åΩ\⁄…ª\ﬁ\·•g]\Ò§˚\\»ô∫I\ƒ!±t\«\‡è˝µ\Á b¿!\ƒè?U\ﬂ¥\–<\Ÿ\Íd]ëE/\ÙJ\r\Ê\’ÍÇ∫è,d\Ôr\Ì⁄ä\ÎÑo\€\ﬁLüú—àv\›\Z\Ùì\·\⁄u\Ì;K˘&4±\˜µg\…E\Ó˛\œ}\\\Ë\…\Íã\ÚB2\ˆæç5\»:A2\‚\ı9Å~<\ÂlMoraÄ\ÁL_\'åÀ∫\¬1õ4}GE\dñ\0W.Ω°¨®R˛^FÇ\–Sô˛2\\Ì\«˚Æ∫5\Ù±¡Nxff\¬\ƒÕòò)Kã\ˆn\—¿\Û\‚rv5ã¨a\Ù¯û¿*q±\Ê\œ\Û•ûzum].\Ã\Ô∑\Û\Û˘rn\ﬁÃñß\Ô\Ù.Øñgóã¿~§Z\Á2D\¬87\ÀNã3N˝≤¸E±X°\Z	èp≤\·RΩ˘\Á\…\…\Îß°\ƒ˙|6¨>¸\roèBú—∞\⁄I©∏\ZK\–$BbØ¯\›W§`Ö%π“ß\ÿ\Z¢é\Á®˙¶€Å*Åô\‘T\ÎdπuÜ—É\ \Á\Œ\¬Ÿ£π\Ë\\L\"˝At\r=\È∂∂§)g\∆ú©’§◊áá\Z\˜¡˝ˇ\0PK¿&m/T\0\0\“>\0\0PK\0\0\0Má[®P-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.jsonPK\0\0\0Má[¿&m/T\0\0\“>\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0w\0\0PizzaShackAPI-1.0.0/Definitions/swagger.jsonPK\0\0\0\0\0\0§\0\0\0%\0\0\0\0','2025-12-07 09:40:57'),('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','d81397b8-baa4-4004-9cee-4961111fa0ec',_binary 'PK\0\0ñâà[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.json\ÌY\›o\‚8ﬂø\"\ \„\È(-m∑Oó£\Ë\ iPI\˜\ÓV\»$Xu\Ïú\Ì\–e´˛\Ô;vbp{\Í≠‘ª$$\»¸f\Ï\Òo>\Ïò\ÁwA\Ím\·MíúÜ?¡§¢Ç\Ÿ\Ê\‚¨w\÷)\≈)\—e\œ¯ühj\+ít˚\ÁIøEz\‰∫u\ÒÆZ\◊◊ó\Ô[iÆ†≥<O.í\‘Z£\'ôùgJø~%≥5I£\È»Å)®D\“\\W\Û\∆k™¸ê@\—,g†j∞2∞∆ÅµgîCê[Q\nå¢\„\€@i!\·ÃçõÆ\·ã6c∂≠¢2¶\ıV\⁄=\ÎTEy.≈Ü¶ --iFπ]\¬`õ0òi¢eó\Û\\Îá\—\Ïnx\Ît$®\\pí¨)_\r9Y00l-	S\‡¸BböÅ(ås\ÁùN¨âä\◊E∂\‡Ñ≤Ü\rU∑∞$”üvn\◊\·{\ÿ\–\n–≤Äù?•\“(ß£6gn-ªΩJ\nvU3\\DF>F19=™îäÖâ\Ì$˙Mó49¶\Íí\.éßnf-	G*•!\ËO+2¸hùá\ˆ\·≥S#+\Âk\ÿ0\◊Ur¡hB°¶\ˆÄŸìQçë©©íBØÖ§_≠ìw@™,à|±sPARH™∑ñ\fò^•\Áû\Á¢h2∑?±\ÿÊè∞ùgÑ#uBn\Î^\ î\·ÿªÑ>\∆\‡^∞rAü\Î\ÚYÁ∫ÜdêR\Î¯\‘\„¡Å™è-ΩhÉYG\ˆ\Ó\Ôá\„x\«\—8øoqtZí¶\‘\Ë6ï\"©3\√?í\‹\Ùòßí$†\‘\0ãX\nS\·x2Ü\«¿:Ö\¬\Ó†‘àc\ﬂ\»\\\Œ=ªà8x\Ú\ƒ\ÀˇN∞ó\‹\ÿ≠¶2\Ã Ç3\"Acaˇ≤\Ô\'gâ\»\ˆv\Zí5\«4g˚±≈ö∑˛\ÿuù\›\‡Db\œ@Lö\„[SGL\"§Y˘íÆ\ny∞∂\hj21&û&íÆ(\˜\’~\n´ﬂüˇ¡r !Æ)N\äy\ \ j\ÃCéô\"kﬂ™h\ŸZ•´æö¡—ÖVlöâ\'üM¢iî\ÿA_±êèÄ^§\r\◊~\∆˛à”á˙\„dV{æ~\∆√öF\Ó|¡d\Zè&\„\ŸŒ°Ztü`ÅE6\Û\ÍÏª±.{\Ï\„ÿö$\ÿmoüsäÆ8\Êm\ƒVH≤^gù\›E›∫1π∑o|_Z\Îb\—\⁄ç,î@∞Éö}\Ã\Ó°Wó˝\ﬁyø\Ÿ\Ôtv{)#J?\‰©\”Söd˘kïç^Ø\”Î∑∫ΩV\Á:\Ë^\›t{7˝˝F\r<\ÕÂ∫§ß\ŒKâ\Ã\›\Œb7é˝J±\Ô.ƒóπSSû-¬Öd\ŒF›¥\€L`•ÆÖ\“7\Ô/.\Œ\€$k+bé%ﬁë¢ΩÈ∂±©∑]@_vS\·a\"-l\ˆΩ\·lµ∞∏iF\∆*√ä∞YWD«∑\”\…\»k\Á	6\ﬂZ\Î4\Õÿö¯E\‡˘[û˝¸l\÷DÆ\ tki2\«\√êµ∞ªX£HLµ;ü¢<g\’¡ ¯´\ËtzóÅ/zP\ı!\ıZ\n≠\Ò\Ù∑≤;ö›´\ˆ˚πßx∞∂íoÈ¥å\ (=@w´\˜v\À˝\‚\Ìâ\Ë\Ô\Û∏a\Áù¸{l≥\‚ù\Ù•ô(Ø%Z\„∑—¢N\Ù˛Ω6\€\œ\ˆkîæúò˛?ôn\Ï≥\'¶ﬂå\È\√#Àâ\Ï#[\„\‹\˜†D!8uè7•πw\‚\˜ø\Á\˜té{cÇO≠¯\Ìs∏˘:~b¯\«>?u\·W\Ûkø\›{6.\Ã]L˝\Ì˚∂	\'´˙\ıXHk\‹Tßsg™¿\‹pzn\ÔÅ#~9\›]J˙l\ÿ¿\ÒTX\‡èŸ§Wø\ÁY°£Od˚ißÚ§Ñ´+∫\Ë\Z®≠∂ú\‰\ BÇ\œI\ÏÆ\Û1\ZZ$Ç\’\Ô\‰ä\\Í\ÍØ¸ì\"!r!¯ô*0D∆ùów/\ﬂ\0PKL+	î&\0\0∞\Z\0\0PK\0\0ñâà[\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0PizzaShackAPI-1.0.0/Definitions/swagger.json\Ì]s\€6\Ú›ø\√v\Ó\·&m\«◊ô\ÀSGmt\ÁÿûHû\ÈLöàÑ,¥$¿†e%\„ˇ~ãä?,:\ˆ5qÜù4\nâ\≈b±ã˝\ƒ\Ú\ÛB\œ\√\r\–+ºéÉ˙5e+Æ\ﬂ}ÜxTT%\ƒ¿\\\“Oü\|ç£?\'ó3\√1ëë†ô¢ú†≈öJ0z?ù/~\…¿h\≈2”ëôè8K(#(3Øbí\–\"∂H*.\»¯wV\‡é8S8R%1\é\·\‘R\Ûæf\Ë\r\'ÜrëòëµRŸ´0\‹l6c≥Ä\‘Ké#ûñ†$\≈\‘c≠©\"ë\ ˘πn†\Ô1	çì§ùòIÜ£5A«éá]\‰`6\Ê\‚:t\Ëdx6;ùûœß#ò;^´4\ÒWæ»ÇµGFFn0êD\ËQ=\Ù°V±fh¿\–GÂÇ™≠ì\Œe\ﬂ}¨@gX≠eE˛!1ﬁ∂3.=°¥ÉSA∞\"p\nŸ†É\·E	-\»_9ë\Í5è∑>˚QêïA\ÒC2\»8#L…∞úAÅg\·n÷ùáZ\¬`l\Ò\Ò\·Q˝]\'\·\Ò\Õ\Û(\"RÆ\‡8—Ü™5R h\ÿU≤EëÖE|˘ Ñ%ZÅ—à2\r¥Ñ\Ìç\œxÑ5r¥&àF\ÊLS&\—\’˚3\ƒW5Lv˛∏\¬+C§ù\€ÿí+hl\’OR,\›\‹lî\Á\"\"u&©∂\ŒHöf	iÉ!∑Y\¬cµ¬â$mh@R\‹N≠67\€\Ã-¢e\◊A\ÊÆ\ˆÊÆæFp\n,FéUOÆDv\Z\“\Ï1\"|N\Ã\ûk¨	\‹[è\Œ20I\Ê$Ö\»\Œ„¥á\‡vÂµì\Zj\€sï\'oC¡\…\·aÖ~çc\Ù\ﬁZè1ö±úP}\–\Õn…º∞*JÑ‡¢°|_õkSM\’r\Ì\Ë_=∏v\≈dûe\\h´\é\ƒ#≠Mc§\≈9ß\"+7`˛(\”ü+TNœüb\ı2µ\’˚¥π\⁄ák\◊Õ∂n\◊›épÆ÷£ù\ﬁOJV††\Í”ï\Ù]\Í\ÌH≠W\n\‚™Îë¢\÷cÉöBx˚†…èG6è™t{TÜ$k\\yT)7\·§FÖìùΩ+\˜xP˝-Bõ0%,\˜\‚äk≤/¨xO N”á,°Z{W\ﬂ@ áó	A\ZÇ≠¶2\Ë\Ù±ˇ£3∑≤&¥Üà˛˛CΩ;Xºmq::~7<\Ë¿∞W1\ﬁgÄ°©M\Ìxå\È˛©\Û\œ¡íL \nÀîñ∞5>\Œ‹ÄeIçY2\ﬁ\ZÑ\‚Yù¡\⁄÷¶nmL\Z~6?≥¯ÓÅÜ\ÁW¢ OÖ\»=ë\∆\Ï∞fRìaÈ†™•dnpó)∫\ıΩ\n)∑”©ó?\–0Gz6™O\◊:A∞@î»Ω@\Û˛H\ı\ﬁµ\Û\Ã7\‚“ö∫Yü\ﬂ∏\ﬁu\∆\«[\Í\"\Ã\€`˘¥°IÇñdg∞ø5≥\\‰\Ò\IO£˙\œ§∏%øtç&\ÊƒöQr\Ô;å\ÿ4x†ø\◊\ÌjÅYæ\œ¡\\e±)ò1´~∞´¡\√<πá˘*U«æiFg¡17G#núÉi(\rñˇ\r•¡˚ò\·õ\ˆo\Ã?=ã\“\‡\˜\Á\‘?\⁄h\»\⁄§∏µ[\ı\›ìC8\Ùàp(&	Ñ1{\"¢7hàà\‹¿∑ôs\Î$\“\0πã_ l∞é\«è\ÕV=K\„V,\Õ`iöñ\Ê†¬Ø T\‡œã”≥ß\ÓW7(O©-¸\œù\‰˙\Âr=˙úZVHö=EÉËûá\ËZ£πAx\œCxˇF\ÎAv\œIvM\'¯rpÇ\œ_†EcoôEî\Î∫$\ƒR`r›ùb\Z6|ëóm\€oJÅ\È\⁄%e1Ω°qé[‘íH≠±B)ﬁ¢5æ!àG∞5°´\\ßë±jjÂ•ø4…êœæ@A\n	 æ&ÇL\å`~\Ûà\Ì\‡ö\Ó6ã\Â&\Òí\Á™eü\≈Œ∫s\“»•\Â]¥P\»%Øõ5¯J\Ó\r?ùt(D\√\ˆ\Ózm∫Dg[\ÊMgìÅ\ÎÄ≠u\Ù\‰z&h‘á\Áù|™qˇK\—ö/ùO\”~gßß8.\Íç\Ó-≤hmeØ»°(5\ıEîK\≈S\"\Œ\…\n\˜\rÖ•£…í\ÛÑ`÷ç\«1∏ÉñÀ§˛ÑòO(⁄ØW˙#â`#Tùbü\Á\È≤.îá\·˙+«¶_\ı>ÃÆ“âc\'’ß:j∂*\‘u\‘\Ãh\ÒUA—ºb\ÔO~˚\rΩ],.ëTX\Â\Ú[6\…v\›=Ö@\“‰Öø\\[Øccµôπïa¯?\Â\∏5pxåX\Ûo;F$E\‡\∆hz;vM§\‡+\Í=-∑à\‡hçVî$\ÕF\œ\Œ\À>\≈¿ù\√\ˆ\Êv_\À<\Ã\ÿ\Óa\”\ƒu±°∏\·0\ı•&\È)≥ˇá£\Ù\–úy¢}\Èé/A\"D\‡e≤\’W	πH¨\"ô#Rt\Ù\’0ﬁ£\∆^\0\Ó\ıx\·Yõ?iø\\p™n1FH,]ç\Ï±£vT≥{T≤\Ô©b?¸jv}∫~=\“ ∫\"äû\ÎïjÃ´\‰UY\»\ﬁ\≈⁄ïW	\ﬂ4≠ôæ~°m©ˇ\Z\Ùì\·\⁄U\Âc=˘*4Yï\˜\…\‡éã\‹¸üª∏\–\’\ÈÖNdl”ÜU\»*A2\‚’∂é@?ûr∂¢◊π0¿S¶{\“\‚]^·òä\Õ-ånt<ô$¿ïAØ)+≤î\Ó<A\Ë)àL\ﬁ¯\ˆ\„}[∂û|®±S;ûâô0r3Ff\ \»“¢áΩVxû_L.\'ëUån\ﬂX%.\÷¸u∫\–S/Ø\Ï\œ\≈\‹¸æôûMS\Ûf≤8}´ˇqqπò]ú\œ˚•cï\À\‡	\„\‹,;\",\Œ8\ı\”.∞\≈b\≈\—HxÑì5ó\Í’øON^Ü8\r%÷ó|a˘\ıhxs‚åÜ\ÂNvWc	\ÍDH\Ã\‚%ø˝ä,±$ó˙*TCT\Òï;P%0ì∫À±Jñ[ß_\›+}nMú=öã\ \≈(\“_\’V–ìv\Õ0`ö0\ˆ36\'`L\ÌIzyx®q\‹˝PK2Q\„\–G\0\0=\0\0PK\0\0\0ñâà[L+	î&\0\0∞\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.jsonPK\0\0\0ñâà[2Q\„\–G\0\0=\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0p\0\0PizzaShackAPI-1.0.0/Definitions/swagger.jsonPK\0\0\0\0\0\0§\0\0\0\0\0\0\0','2025-12-08 17:12:45'),('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','f520d828-baf6-45d6-94d1-c4bf3df90496',_binary 'PK\0\0nÜà[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.json\ÌYKo\„6æ\ÔØt,\Í¯ëó7ß™é—∏ÿµçX\Ÿ⁄ÖAKcõE™$\Â¨7\»\ÔêmJ\ˆ\È\Ÿ^∞4\ﬂ9¸\ÊAÜz~°\ﬁ\Ê\ﬁ!\…i¯≥l@**∏ëm.\ŒzgùRúMP\ˆå\œ¯FSÉ_ì§{yû\\∂Hè\Ù[\Ô\·∫\’\Ô_Ωo•óp\rù\Âyrë§\÷\Z-8\…\Ï<S˙\ı+ô≠I\ÚMGLA%íÊ∫ö7^S\‡	\Õr™K!kX\Î@pF9π•¿(:æ\rî\Œ‹∏â\‡\Zæh3f\€**c\ÍPo•›≥NµPî\ÁRlh\n\““ífî;Ä\—%∂	Éô&∫Pv9ø~\ÕÓÜ∑NGÇ\ W0 …ö\Ú’êì\√÷í0\Œ/!¶à\¬8w\ﬁ\ÈT¿ö®x]dN(k\ÿPuKR0˝i\Ávæá\r≠\0-\ÿ˘SJ!çr:˙\œas\Ê÷≤€≠§`W5\√Ed\‰aì\„–£J©Xò\ÿ.@¢\ﬂtIìc™.	\Ô\‚x\Íf÷íp§R\ZÇ˛¥\"√è\÷yh_>;5≤RæÜ\rs]%å&jjò=\’ôö*)\ÙZH˙\’:y§ Ç\»;$Ö§zki\0paÜ\ÈUz\Ó}æ ä&s˚à\≈6Ñ\Ì<#©r[\˜\¬Pæ†\«ﬁ•\ÿ \Ù1\˜Çï˙\\ó\«\»:\◊5$ÉîZ«ßTexl\ÈE\Ã:≤üx\p?\«\Ûx8é\∆q¯mã£”í4•Fá∞©9H›ò˘˛ë\‰¶«º8ï$•X\ƒRòr«ì\Ò0<–±(v•F˚F\Êr\Ó\ŸE\ƒ¡ì\'^F¯wÇΩ\‰^¿>h5ïaVdò˘\Z˚ó}?9KD∂∑”ê¨9¶9€è-\÷<∏\ı«Æ\Î\Ï\'{b∫ê\–ﬂö:b!\Õ ótU»ÉµÄG{Pì¡à1\Ò4ëtEπ_(®\ˆSX=˛ÀÅÑ∏¶8¡+\Ê)+´19Rdà¨}´\Z†eGhïÆ˙jGZ±i&û|6â¶Qb}\≈B>zë6\\˚m˚#NÍØìY\Ì˝v¯ak\ZQ<∏\Ûìi<öåg;áj\—}Ç\ŸÃ´≥o∆∫\Ï±åckí`∑Ω}\Œ)∫‚ò∑[!\…zùtvu\Î\Z\ƒ\‰ﬁæ\Ò}i≠ãEk4≤P¡j\ˆ1ªá^_]\ˆ\Œ/z˝~ß≥\€KQ˙!Oùû\“$\À_´l\Ùzù\ﬁe´\€ku˙A\˜\Í\Ê≤{\”\Î\Ô7j\‡i.(\◊%=u^Jd\Óvªq\ÏWä}w!æÃùö\Úl.$s6\Í¶\›f+u-îæyqq\ﬁ&Y[s,\Òé\ÌM∑çMΩ\Ì˙≤õ\nia≥\Ô\rg´Ö\≈M32VVÑÕö∏\"b8æùNF^;O∞˘\÷Zßi\∆\÷\ƒ/\œ\ﬂ\Ú\Ï\Ág≥&rU¶[[Hì9Üá¨Ö\›\≈\ZEb™\›˘\Â9´¡_Eß”ª\n|—É™©\◊Rhçßøï\›\—\Ï^µ\ﬂ\œ=≈Éµï|+HßeTF\È∫[Ω∑[\ÓoODò\«\r;\Ô\‰wà\ÿcõ\Ô§/\ÕDy-¡\–\‚øçu¢\˜˚\Ëµ˘\€~∂?£\Ù\Â\ƒ\Ùˇ\…tcü=1˝fLYNd\Ÿ\Z\Áæ%\nô¿©{º)ÕΩø?û\ﬂ\”9\Óç	>µ\‚∑\œ\·\Êø\„\'Üøü\·\ÛS˛\Ò¸\ﬁ\r£\€¡á\€_wëÅs\ŸUø\ﬁxÑ\ÌG\¬…™~ˇ\∆\Zü“çπîV`Æê=∑\˜¿ë’ú\Ón}˝/G6r<¯c6\È\’/\“V\Ë\Ë\Ÿ~⁄©<)\·\Zó]t\r\‘V[Nr\ÂŒó!¡\˜$v\ﬂK0\ZZ$Ç\’/u\‰ä\\Ínµ¸\nîπ¸L\"\„\ŒÀªó\0PKfˇH;.\0\0\0\0PK\0\0nÜà[\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0PizzaShackAPI-1.0.0/Definitions/swagger.json\Ìko‹∏\Òª°˝PdW∂\„\–|Íû≥wq\Î\ÿFv\rê\ﬁÆ\ƒ\ı\ÚN\"u$\Â\ı&\\Ô\°\ı\ ±{âââ\√\·p\ﬁ3§> \å0ú\—\0ΩA¡\Î\È\·\Ù0x•_S∂\Ê˙\›gxÄGEUB\Ã˝\Ù	/68˙}vuf`a8&24Sî3¥\‹Pâ\‡/F\Êã\ÂOyÇ\0≠π@f:2\Ûg	ee\ÊULzK\ƒI\≈ô˛ó∏#\ŒéTEºc8µ\‘¸õozÀâÜ°\\$fd£T\ˆ&∑\€\Ì\‘, \ıí”àß(I1µ¿XD™H§rA˛\’\07\–\˜éòÑFÑI\“M\Ã,\√—Ü†c\«\√>r∞õrq:t2<?;ù_,\Êò;›®4\ÒWæ»ÇµGFFn0êD\ËQ=\Ù±V±fh¿–Ø0\ U;2&kú\' æ˚µùaµë5˘á\\\ƒDx\€Œ∏\ÙÑ“°ßÇ`E@Ÿ¢KÉ\·U-\»9ë\ÍG\Ô|<0\ˆWA\÷\≈_BêA\∆aJÜ\’\n<≥\ÀY\˜j	sÄ±-\ƒ«áG\ÕwΩÑ\«S¥»£àHπ\r.p¢-U§@–∞´dá\"ã¯\Í7P Ñ%ZÅ—à2\r¥Ç\ÌM\œyÑ5r¥!àFFß)ì\Ë˙\√9\‚\Î&;Z\„ï!\“\Œmm…åt\rv\⁄\')ñno6\ së&ìT;\Á$M≥Ñt¡êª,·±ÅZ\„Dí.4`)\Ó¶Vªõ]\ÊQÇ≤õ†s\ﬂxs\ﬂ\\#8#\'Káj W\";\ri\n\n\ˆæ$fx\œ\r\÷náùjÑ≥\\í—§\7Ÿ´N{\Ó6^;©e∂7Q{\Ú6ú0\Ëqå>X\Ô1Eg\Ï\'T+∫yÅ ,ô\÷Dâ\\¥å\ÔksmÆ©zFÆ˝c\0◊ÆôÃ≥å\Ìﬁìòb§≠iä¥°8\'\ÁL§`\Â\‹e\⁄\„sÖ™\…˘S¨æC¶vFüÆP[r∏p\›lv\–\›\Áj3)\Ì~V±˝\r’üÆ•R\Ô&j#∏RêW\›Lµƒò\–“õ\ÿ\›J~<©±yRß€£∫0$π\\#\‡ö\»\„†NπI\'5*úî˛Æ\⁄\„A˝wë⁄Ñ)aπóW‹ê}i\≈yöV≤Ñj\Î]#|â^%il∂ö\ ``:0\ƒ{\\˛gä\Œ\›Zê»ö\‘V\" G¯\Ûï∫T,\ﬁuùø\Ù`\ÿkÔÅçgÄ°mm\Îxä\Î˛a\0\Û/¿ì\Ã Àîñ∞u>\Œ›ÄgIç[2\—\ZÑ\‚yù\—€åﬁ¶\ÈmL~6ø\Œ\‚˚G:ûüâÇ:2\˜D\Z∑\√\⁄EMÜîÉ™Qíπ¡≤Rt\Î{\Z\n%∑”•ó?\–rGz6jN\◊6A∞@î»ΩD\Û\·L\ı¡µW\Á[yi\√\‹l\Ã\ÔI\\\Ô{î\ÒÈû∫H\Û¿7X>mií†)\ˆ∑\Êû=>\ËT\‚9É∑\‚ó\Ó\—ƒúX7J\Ó \‡}á\€Å\∆\Ù\ÁF†≤ò\Â˚\ÃuõÜ≥\Êª\Z#Ã≥GòØ\“uZf\Ù6s£\ZqK¶±5X˝[É1\√w\Ì\ﬂX|z≠¡\Ô/®?-¥Ÿê\ıHqùjæ\ÍªO&\«t\Ë	\ÈPLHc\ˆdDo\r–òπÅo≥\Ê\÷E§s\0≤\Ã_ m∞éßO≠V=O\„V=\Õ\Ëi⁄û\Ê†∆Ø T\œ\Ì\Ÿ\”\˜k:î\Á¥˛{èMér˝rπè}\…≠:$\Ì;E£\Ë^Ü\Ë:≥πQx/CxêˇFõQv/Iv\Ì ¯zÇ/Y†•1\Íf\Ó(∫ó$∫É‚ßΩì]Ä’∫Æ~\ÙÑò≤P_,2wm|ëW7\Ó\ﬂV\”mg\ bzK\„\'∂)ë\⁄`ÖRºC|Kè`kB\◊ƒπ\Ó\0 \\43\ÎU±◊π¯®IéI\\n)\‘\Ó¯Üx<2¡3\"Ä˘m+\·€©h\˜y™M\‚\œU\«>ãù\ı∑\"\◊QÈ£Ö2En\⁄\«\'µ∂	@¸p\“c-K-ØI\ıâ\Œ~\Ì`.•∏~\ÿ6\’@ÆgÇFCx\ﬁÀß\˜øM\—[˚\“˘4¶;\≈q\Ÿ¸F°Cù_!\‘\‰Pt	áä\" •\‚)OdÖ˚¸Ö\ƒ!Yqû\Ã˙±\‡8Üp\–q8ú\Û\ıK\˜\…\ÿp$lÑ™S,\‚ã<]5Ö\Ú8\\\‰\ÿ\\5~≥´\Ù\‚(•˙\\™fz}™fFãBä{G\ˆ\˜\‰ó_–ª\Â\Ú\nIÖU.øeólw\·\–=\–\√%m^¯\Àu]Sm≠vfTA˛•~@XÉÄ«àuˇ\ˆ≤/Ä§¢\√\Õ\Ô¶\Ó˛/ƒä\ÊùD´\"8⁄†5%I˚én\Ô\Ì\ÿ!}\‹2`{s˚O\‘\Ál\˜∞i\Ê. ¢∏0\ıy4(≥ˇG†\Ù\–<\Ûæ!¸\“_ÅDà¿´dßOÅrëXC2*R\\\∆l0`∫«åΩ\⁄…ª\ﬁ\·•g]\Ò§˚\\»ô∫I\ƒ!±t\«\‡è˝µ\Á b¿!\ƒè?U\ﬂ¥\–<\Ÿ\Íd]ëE/\ÙJ\r\Ê\’ÍÇ∫è,d\Ôr\Ì⁄ä\ÎÑo\€\ﬁLüú—àv\›\Z\Ùì\·\⁄u\Ì;K˘&4±\˜µg\…E\Ó˛\œ}\\\Ë\…\Íã\ÚB2\ˆæç5\»:A2\‚\ı9Å~<\ÂlMoraÄ\ÁL_\'åÀ∫\¬1õ4}GE\dñ\0W.Ω°¨®R˛^FÇ\–Sô˛2\\Ì\«˚Æ∫5\Ù±¡Nxff\¬\ƒÕòò)Kã\ˆn\—¿\Û\‚rv5ã¨a\Ù¯û¿*q±\Ê\œ\Û•ûzum].\Ã\Ô∑\Û\Û˘rn\ﬁÃñß\Ô\Ù.Øñgóã¿~§Z\Á2D\¬87\ÀNã3N˝≤¸E±X°\Z	èp≤\·RΩ˘\Á\…\…\Îß°\ƒ˙|6¨>¸\roèBú—∞\⁄I©∏\ZK\–$BbØ¯\›W§`Ö%π“ß\ÿ\Z¢é\Á®˙¶€Å*Åô\‘T\ÎdπuÜ—É\ \Á\Œ\¬Ÿ£π\Ë\\L\"˝At\r=\È∂∂§)g\∆ú©’§◊áá\Z\˜¡˝ˇ\0PK¿&m/T\0\0\“>\0\0PK\0\0\0nÜà[fˇH;.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0PizzaShackAPI-1.0.0/api.jsonPK\0\0\0nÜà[¿&m/T\0\0\“>\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0x\0\0PizzaShackAPI-1.0.0/Definitions/swagger.jsonPK\0\0\0\0\0\0§\0\0\0&\0\0\0\0','2025-12-08 16:51:28');
/*!40000 ALTER TABLE `AM_GW_API_ARTIFACTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_GW_API_DEPLOYMENTS`
--

DROP TABLE IF EXISTS `AM_GW_API_DEPLOYMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_GW_API_DEPLOYMENTS` (
  `API_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `REVISION_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `LABEL` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `VHOST` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`REVISION_ID`,`API_ID`,`LABEL`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_GW_API_DEPLOYMENTS_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_GW_PUBLISHED_API_DETAILS` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_GW_API_DEPLOYMENTS`
--

LOCK TABLES `AM_GW_API_DEPLOYMENTS` WRITE;
/*!40000 ALTER TABLE `AM_GW_API_DEPLOYMENTS` DISABLE KEYS */;
INSERT INTO `AM_GW_API_DEPLOYMENTS` VALUES ('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','0952a113-1e90-472c-9f0b-d50ee95c441e','Production and Sandbox - DC1',NULL);
/*!40000 ALTER TABLE `AM_GW_API_DEPLOYMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_GW_PUBLISHED_API_DETAILS`
--

DROP TABLE IF EXISTS `AM_GW_PUBLISHED_API_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_GW_PUBLISHED_API_DETAILS` (
  `API_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_DOMAIN` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `API_PROVIDER` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `API_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `API_VERSION` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `API_TYPE` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`API_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_GW_PUBLISHED_API_DETAILS`
--

LOCK TABLES `AM_GW_PUBLISHED_API_DETAILS` WRITE;
/*!40000 ALTER TABLE `AM_GW_PUBLISHED_API_DETAILS` DISABLE KEYS */;
INSERT INTO `AM_GW_PUBLISHED_API_DETAILS` VALUES ('7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','carbon.super',NULL,'PizzaShackAPI','1.0.0','http');
/*!40000 ALTER TABLE `AM_GW_PUBLISHED_API_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_GW_VHOST`
--

DROP TABLE IF EXISTS `AM_GW_VHOST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_GW_VHOST` (
  `GATEWAY_ENV_ID` int NOT NULL,
  `HOST` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `HTTP_CONTEXT` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `HTTP_PORT` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `HTTPS_PORT` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `WS_PORT` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `WSS_PORT` varchar(5) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`GATEWAY_ENV_ID`,`HOST`),
  CONSTRAINT `AM_GW_VHOST_ibfk_1` FOREIGN KEY (`GATEWAY_ENV_ID`) REFERENCES `AM_GATEWAY_ENVIRONMENT` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_GW_VHOST`
--

LOCK TABLES `AM_GW_VHOST` WRITE;
/*!40000 ALTER TABLE `AM_GW_VHOST` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_GW_VHOST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_HEADER_FIELD_CONDITION`
--

DROP TABLE IF EXISTS `AM_HEADER_FIELD_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_HEADER_FIELD_CONDITION` (
  `HEADER_FIELD_ID` int NOT NULL AUTO_INCREMENT,
  `CONDITION_GROUP_ID` int NOT NULL,
  `HEADER_FIELD_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `HEADER_FIELD_VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_HEADER_FIELD_MAPPING` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`HEADER_FIELD_ID`),
  KEY `CONDITION_GROUP_ID` (`CONDITION_GROUP_ID`),
  CONSTRAINT `AM_HEADER_FIELD_CONDITION_ibfk_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_HEADER_FIELD_CONDITION`
--

LOCK TABLES `AM_HEADER_FIELD_CONDITION` WRITE;
/*!40000 ALTER TABLE `AM_HEADER_FIELD_CONDITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_HEADER_FIELD_CONDITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_IP_CONDITION`
--

DROP TABLE IF EXISTS `AM_IP_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_IP_CONDITION` (
  `AM_IP_CONDITION_ID` int NOT NULL AUTO_INCREMENT,
  `STARTING_IP` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `ENDING_IP` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `SPECIFIC_IP` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `WITHIN_IP_RANGE` tinyint(1) DEFAULT '1',
  `CONDITION_GROUP_ID` int DEFAULT NULL,
  PRIMARY KEY (`AM_IP_CONDITION_ID`),
  KEY `fk_AM_IP_CONDITION_1_idx` (`CONDITION_GROUP_ID`),
  CONSTRAINT `fk_AM_IP_CONDITION_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_IP_CONDITION`
--

LOCK TABLES `AM_IP_CONDITION` WRITE;
/*!40000 ALTER TABLE `AM_IP_CONDITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_IP_CONDITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_JWT_CLAIM_CONDITION`
--

DROP TABLE IF EXISTS `AM_JWT_CLAIM_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_JWT_CLAIM_CONDITION` (
  `JWT_CLAIM_ID` int NOT NULL AUTO_INCREMENT,
  `CONDITION_GROUP_ID` int NOT NULL,
  `CLAIM_URI` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `CLAIM_ATTRIB` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_CLAIM_MAPPING` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`JWT_CLAIM_ID`),
  KEY `CONDITION_GROUP_ID` (`CONDITION_GROUP_ID`),
  CONSTRAINT `AM_JWT_CLAIM_CONDITION_ibfk_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_JWT_CLAIM_CONDITION`
--

LOCK TABLES `AM_JWT_CLAIM_CONDITION` WRITE;
/*!40000 ALTER TABLE `AM_JWT_CLAIM_CONDITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_JWT_CLAIM_CONDITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_KEY_MANAGER`
--

DROP TABLE IF EXISTS `AM_KEY_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_KEY_MANAGER` (
  `UUID` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `NAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `TYPE` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `CONFIGURATION` blob,
  `ENABLED` tinyint(1) DEFAULT '1',
  `ORGANIZATION` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_TYPE` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `EXTERNAL_REFERENCE_ID` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `NAME` (`NAME`,`ORGANIZATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_KEY_MANAGER`
--

LOCK TABLES `AM_KEY_MANAGER` WRITE;
/*!40000 ALTER TABLE `AM_KEY_MANAGER` DISABLE KEYS */;
INSERT INTO `AM_KEY_MANAGER` VALUES ('03df8283-78d1-4e72-804d-7f9b30989d29','Resident Key Manager',NULL,'This is Resident Key Manager','default',_binary '{\"token_format_string\":\"[{\\\"enable\\\":true,\\\"type\\\":\\\"REFERENCE\\\",\\\"value\\\":\\\"[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}\\\"}]\"}',1,'carbon.super','DIRECT',NULL);
/*!40000 ALTER TABLE `AM_KEY_MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_MONETIZATION_USAGE`
--

DROP TABLE IF EXISTS `AM_MONETIZATION_USAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_MONETIZATION_USAGE` (
  `ID` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `STATE` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `STATUS` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `STARTED_TIME` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `PUBLISHED_TIME` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_MONETIZATION_USAGE`
--

LOCK TABLES `AM_MONETIZATION_USAGE` WRITE;
/*!40000 ALTER TABLE `AM_MONETIZATION_USAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_MONETIZATION_USAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_NOTIFICATION_SUBSCRIBER`
--

DROP TABLE IF EXISTS `AM_NOTIFICATION_SUBSCRIBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_NOTIFICATION_SUBSCRIBER` (
  `UUID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CATEGORY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `NOTIFICATION_METHOD` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SUBSCRIBER_ADDRESS` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`UUID`,`SUBSCRIBER_ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_NOTIFICATION_SUBSCRIBER`
--

LOCK TABLES `AM_NOTIFICATION_SUBSCRIBER` WRITE;
/*!40000 ALTER TABLE `AM_NOTIFICATION_SUBSCRIBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_NOTIFICATION_SUBSCRIBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_OPERATION_POLICY`
--

DROP TABLE IF EXISTS `AM_OPERATION_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_OPERATION_POLICY` (
  `POLICY_UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `POLICY_NAME` varchar(300) COLLATE latin1_general_ci NOT NULL,
  `POLICY_VERSION` varchar(45) COLLATE latin1_general_ci DEFAULT 'v1',
  `DISPLAY_NAME` varchar(300) COLLATE latin1_general_ci NOT NULL,
  `POLICY_DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `APPLICABLE_FLOWS` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `GATEWAY_TYPES` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `API_TYPES` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `POLICY_PARAMETERS` blob,
  `ORGANIZATION` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `POLICY_CATEGORY` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `POLICY_MD5` varchar(45) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`POLICY_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_OPERATION_POLICY`
--

LOCK TABLES `AM_OPERATION_POLICY` WRITE;
/*!40000 ALTER TABLE `AM_OPERATION_POLICY` DISABLE KEYS */;
INSERT INTO `AM_OPERATION_POLICY` VALUES ('01dea00e-0336-45af-b8d8-cc1136683b16','jsonToXML','v1','JSON to XML','This policy allows you to change the payload from JSON to XML','[request, response]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','d5707ada4614c348ddc78e95fb784dbb'),('0b338039-981b-4fc8-b2e2-f2eb77191b2c','ccRemoveHeader','v2','Remove Header','This policy allows you to remove a header from the request','[request, response]','[ChoreoConnect]','[HTTP]',_binary '[\n  {\n    \"name\": \"headerName\",\n    \"displayName\": \"Header Name\",\n    \"description\": \"Name of the header to be removed\",\n    \"validationRegex\": \"^([a-zA-Z_\\\\:][a-zA-Z\\\\d_\\\\-\\\\ ]*)$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  }\n]','carbon.super','Mediation','144b2adb34d1ee6232bb4ca2d8218dd6'),('0d1fc92a-3880-417f-9876-c343eee50e4b','applyAcceptHeader','v1','Apply Accept Header','This policy allows you to apply the Accept header','[request]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','b84c6cd3870a35269869a1bd23c95a04'),('12d732fe-87e2-4dde-a6f6-50fb5e10aebf','xmlValidator','v1','XML Validator','This policy validates the request body of the XML message','[request]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','6096f235f102b175377aed40cc373f3e'),('29d8211c-81d6-4a8e-a869-6d41acc7699e','regexPolicy','v1','Regex Policy','This is a predefined Regular Expression policy that validates content based on the pattern you define. The regex policy builds the entire message and performs string processing to find potentially harmful constructs underneath the message body. This drops the performance of 10KB messages for 300 concurrent users by 3.6 times than the normal flow. The performance decrease may accelerate along with the message size','[request]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','a4c812ab5f1118d8e8aecc5f01ce1b06'),('2d45ca6a-5d4c-4dfe-be70-5cfb91f1c25b','removeHeader','v1','Remove Header','This policy allows you to remove a header from the request','[request, response, fault]','[Synapse]','[HTTP]',_binary '[\n  {\n    \"name\": \"headerName\",\n    \"displayName\": \"Header Name\",\n    \"description\": \"Name of the header to be removed\",\n    \"validationRegex\": \"^([a-zA-Z_][a-zA-Z\\\\d_\\\\-\\\\ ]*)$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  }\n]','carbon.super','Mediation','39132cf460be5083812821457ba8b520'),('2ec434d2-f9fc-437e-8c08-cb6b2a95edc8','rewriteResourcePath','v3','Rewrite Resource Path','This policy allows you to rewrite the resource path of a request','[request]','[Synapse, ChoreoConnect]','[HTTP]',_binary '[\n  {\n    \"name\": \"newResourcePath\",\n    \"displayName\": \"New Resource Path\",\n    \"description\": \"Name of the new resource path\",\n    \"validationRegex\": \"^/?([a-zA-Z0-9!@#\\\\$%\\\\^\\\\\\u0026*\\\\)\\\\(+\\u003d._\\\\-~:,\\\\?{}/]*)$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  },\n  {\n    \"name\": \"includeQueryParams\",\n    \"displayName\": \"Include Query Parameters\",\n    \"description\": \"Select whether to include exiting query params to the new resource path\",\n    \"validationRegex\": \"^(true|false)$\",\n    \"type\": \"Boolean\",\n    \"defaultValue\": \"true\",\n    \"allowedValues\": [],\n    \"required\": false\n  }\n]','carbon.super','Mediation','95204978651ce101b9e58a484f3370b7'),('382b5f7f-dcb9-46a7-9c12-568c26da19c2','addHeader','v2','Add Header','This policy allows you to add a new header to the request','[request, response, fault]','[Synapse]','[HTTP]',_binary '[\n  {\n    \"name\": \"headerName\",\n    \"displayName\": \"Header Name\",\n    \"description\": \"Name of the header to be added\",\n    \"validationRegex\": \"^.+$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  },\n  {\n    \"name\": \"headerValue\",\n    \"displayName\": \"Header Value\",\n    \"description\": \"Value of the header\",\n    \"validationRegex\": \"^.+$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  }\n]','carbon.super','Mediation','976eb48df78f6bcc899db7de7d5b4c79'),('3882f8db-44c5-42dd-9759-07d9e3c51807','ccAddHeader','v2','Add Header','This policy allows you to add a new header to the request','[request, response]','[ChoreoConnect]','[HTTP]',_binary '[\n  {\n    \"name\": \"headerName\",\n    \"displayName\": \"Header Name\",\n    \"description\": \"Name of the header to be added\",\n    \"validationRegex\": \"^([a-zA-Z_\\\\:][a-zA-Z\\\\d_\\\\-\\\\ ]*)$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  },\n  {\n    \"name\": \"headerValue\",\n    \"displayName\": \"Header Value\",\n    \"description\": \"Value of the header\",\n    \"validationRegex\": \"^.+$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  }\n]','carbon.super','Mediation','a8a53dd2189dcedaa0fe17dced49d8a1'),('45af0606-65a8-4e5f-8ce8-bf4818b71ac2','ccCallInterceptorService','v1','Call Interceptor Service','This policy allows you to call an interceptor service for a request message','[request, response]','[ChoreoConnect]','[HTTP]',_binary '[\n  {\n    \"name\": \"interceptorServiceURL\",\n    \"displayName\": \"Service URL\",\n    \"description\": \"Interceptor Service URL\",\n    \"validationRegex\": \"^(([\\\\w+]+\\\\:\\\\/\\\\/)?([\\\\w\\\\d-]+\\\\.)*[\\\\w-]+([\\\\.\\\\:]\\\\w+)*([\\\\/\\\\?\\\\\\u003d\\\\\\u0026\\\\#\\\\.]?[\\\\w-]+)*\\\\/?)$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  },\n  {\n    \"name\": \"includes\",\n    \"displayName\": \"Includes to Payload\",\n    \"description\": \"Includes a comma separated list of items (for example: request_header, request_body, response_header, response_body) to the request payload of interceptor service\",\n    \"validationRegex\": \"^(([a-zA-Z\\\\d_][a-zA-Z\\\\d_\\\\-]*)(,[a-zA-Z\\\\d_][a-zA-Z\\\\d_\\\\-]*)*)$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  }\n]','carbon.super','Mediation','15c0695864c47421b1377a05479c1f51'),('53cedad3-4c1e-439e-abe2-89863f0aeb16','addQueryParam','v1','Add Query Param','This policy allows you to add a query parameter to the request','[request]','[Synapse, ChoreoConnect]','[HTTP]',_binary '[\n  {\n    \"name\": \"paramKey\",\n    \"displayName\": \"Parameter Key\",\n    \"description\": \"Query parameter\\u0027s key in URL encoded format\",\n    \"validationRegex\": \"^([a-zA-Z_\\\\%][a-zA-Z\\\\d_\\\\-\\\\ \\\\%]*)$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  },\n  {\n    \"name\": \"paramValue\",\n    \"displayName\": \"Parameter Value\",\n    \"description\": \"Query parameter\\u0027s value in URL encoded format\",\n    \"validationRegex\": \"^([a-zA-Z\\\\d_\\\\%][a-zA-Z\\\\d_\\\\-\\\\ \\\\%]*)$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  }\n]','carbon.super','Mediation','68d7953fa0f3c9394d9fb5150d62b67d'),('5abc723f-c9e0-4885-b23a-5f7e656c1b30','disableChunking','v1','Disable Chunking','This policy disables chunking of the payload','[request, response]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','f00340cf71d5f294d957b2817aaf9a11'),('6819ffde-4403-4a56-8222-6776330d38f4','debugJsonFault','v1','Debug JSON Fault','This policy allows you to debug the fault payload in JSON format','[fault]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','11c8c70eda6750e3a3c63f45cc422053'),('72f20e65-7ab2-4e49-a9e2-771ed82687aa','preserveAcceptHeader','v1','Preserve Accept Header','This policy allows you to preserve the Accept header','[request]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','cdf9f6415858ac80a91d67879eced0dc'),('96b3b05c-4681-4487-99b9-c55e81ef12d4','xmlToJson','v1','XML to JSON','This policy allows the user to change the payload from XML to JSON','[request, response]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','63478d64f250ef4ade262382c24ea783'),('96d82e64-fa36-4aff-89d3-df4cfa86d9ff','addLogMessage','v1','Log Policy','This policy allows you to log the important details of the request','[request, response, fault]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','2e5a48736d4d9b5fb6c53c6d61ef2348'),('b6e670eb-f478-4b24-9b60-58ee403bf39f','opaPolicy','v1','Validate Request with OPA','This policy allows you to validate requests based on the response from OPA policy engine. The Open Policy Agent is an open source, general-purpose policy engine that unifies policy enforcement across different technologies and systems. Before applying the policy, please make sure that the OPA policy engine is configured properly. Once a gateway receives a request, gateway will extract a predefined set of meta-data from the request and query OPA via HTTP/HTTPS. OPA Policy engine will evaluate the request meta-data against the configured policy and return it\'s validation response.Based on the response, gateway will allow or block the request.','[request]','[Synapse, ChoreoConnect]','[HTTP]',_binary '[\n  {\n    \"name\": \"serverUrl\",\n    \"displayName\": \"OPA server URL\",\n    \"description\": \"OPA server\\u0027s URL. Sample URL: https://opa-server-host:8181/v1/data. This can be an HTTP or HTTPS endpoint. If you are using a HTTPS endpoint, make sure the relevant certificates are added to the trust-store.\",\n    \"validationRegex\": \"([\\\\w+]+\\\\://)?([\\\\w\\\\d-]+\\\\.)*[\\\\w-]+[\\\\.\\\\:]?\\\\w+([/\\\\?\\\\\\u003d\\\\\\u0026\\\\#\\\\.]?[\\\\w-]+)*/?\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  },\n  {\n    \"name\": \"accessKey\",\n    \"displayName\": \"Access Key\",\n    \"description\": \"Access key for the validation request. This is required only if the the token authentication mode is enabled at OPA server. This token will be sent along the OPA validation request as the Authorization header.\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"policy\",\n    \"displayName\": \"Policy\",\n    \"description\": \"Policy to be validated\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  },\n  {\n    \"name\": \"rule\",\n    \"displayName\": \"Rule\",\n    \"description\": \"Rule to validate the policy\",\n    \"type\": \"String\",\n    \"defaultValue\": \"allow\",\n    \"allowedValues\": [],\n    \"required\": true\n  },\n  {\n    \"name\": \"sendAccessToken\",\n    \"displayName\": \"Send access token\",\n    \"description\": \"Select whether to send access token to the OPA payload.\",\n    \"validationRegex\": \"^(true|false)$\",\n    \"type\": \"Boolean\",\n    \"defaultValue\": \"false\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"additionalProperties\",\n    \"displayName\": \"Additional properties\",\n    \"description\": \"Additional message context (request context) properties to be included in the OPA input. Add these properties in a comma separated list. Provided properties will be added to the OPA input payload after retrieving the values from the message context.\",\n    \"validationRegex\": \"^(([a-zA-Z\\\\d_][a-zA-Z\\\\d_\\\\-]*)(,[a-zA-Z\\\\d_][a-zA-Z\\\\d_\\\\-]*)*)$\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"maxOpenConnections\",\n    \"displayName\": \"Max open connections\",\n    \"description\": \"Maximum number of open HTTP connections between the OPA server and gateway.\",\n    \"validationRegex\": \"^\\\\d{1,3}$\",\n    \"type\": \"Integer\",\n    \"defaultValue\": \"500\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"connectionTimeout\",\n    \"displayName\": \"Connection timeout\",\n    \"description\": \"Connection timeout in seconds for the connection between the OPA server and gateway.\",\n    \"validationRegex\": \"^\\\\d{1,3}$\",\n    \"type\": \"Integer\",\n    \"defaultValue\": \"30\",\n    \"allowedValues\": [],\n    \"required\": false\n  }\n]','carbon.super','Security','70bdbf2a13fea6899c3ba2761a14f8e9'),('bb2f3157-fed9-47b2-864d-d0944514e478','setToHeader','v1','Set To Header','This policy allows the user to set the To header','[request]','[Synapse]','[HTTP]',_binary '[\n  {\n    \"name\": \"value\",\n    \"displayName\": \"To Header Value\",\n    \"description\": \"This is the value of the To header\",\n    \"validationRegex\": \"(.*?)\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  }\n]','carbon.super','Mediation','b61b2987ce3f3ec7a360ae09754d4cc2'),('bf72dc61-e49c-4511-8450-ec2e9d87bf73','debugRequestFlow','v1','Debug Request Flow','This policy allows you to log the special properties of the request message for debugging purposes','[request]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','a604b27ccd150f6fa615a40571f4c5dc'),('d348f654-cbf1-4905-a0db-85837097f9c8','debugResponseFlow','v1','Debug Response Flow','This policy allows you to log the special properties of the response message for debugging purposes','[response]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','532a53263c874ad18e82272e4b8ad945'),('d9aa8827-6012-42fc-a0cf-003337b26d67','changeHTTPMethod','v1','Change HTTP Method','This policy allows you to change the HTTP Method','[request]','[Synapse]','[HTTP]',_binary '[\n  {\n    \"name\": \"httpMethod\",\n    \"displayName\": \"HTTP Method\",\n    \"description\": \"Method of the HTTP request\",\n    \"validationRegex\": \"^(GET|PUT|POST|PATCH|DELETE|HEAD|OPTIONS)$\",\n    \"type\": \"Enum\",\n    \"allowedValues\": [\n      \"GET\",\n      \"PUT\",\n      \"POST\",\n      \"PATCH\",\n      \"DELETE\",\n      \"HEAD\",\n      \"OPTIONS\"\n    ],\n    \"required\": true\n  }\n]','carbon.super','Mediation','9a4227d56d2b1c983bcb660eb889caef'),('df868b5b-766e-4894-bc16-ee92d068cff3','ccChangeHTTPMethod','v2','Change HTTP Method','This policy allows you to change the HTTP Method','[request]','[ChoreoConnect]','[HTTP]',_binary '[\n  {\n    \"name\": \"updatedMethod\",\n    \"displayName\": \"Updated HTTP Method\",\n    \"description\": \"New updated method of the HTTP request\",\n    \"validationRegex\": \"^(GET|PUT|POST|PATCH|DELETE|HEAD|OPTIONS)$\",\n    \"type\": \"Enum\",\n    \"allowedValues\": [\n      \"GET\",\n      \"PUT\",\n      \"POST\",\n      \"PATCH\",\n      \"DELETE\",\n      \"HEAD\",\n      \"OPTIONS\"\n    ],\n    \"required\": true\n  }\n]','carbon.super','Mediation','c3d9c314a2542fcefe995683ce0a628d'),('eb20aa02-8acb-4e7c-845a-cdab5d3bb7a3','jsonFault','v1','JSON Fault','This policy allows you to get an output of the fault message in JSON','[fault]','[Synapse]','[HTTP]',_binary '[]','carbon.super','Mediation','9323959311bb0ae77add3ad039765e7a'),('edd51348-154b-4edb-897a-5c0874fb8fd2','revokeOneTimeToken','v1','Revoke One Time Token','This policy is used to revoke one time tokens. Attach the policy to the required resource and add the \'scope\' defined in the policy to the JWT token to identify the token as a one time token ','[request]','[Synapse]','[HTTP]',_binary '[\n  {\n    \"name\": \"scope\",\n    \"displayName\": \"Scope\",\n    \"description\": \"The designated scope name for the JWT token in order to identify the token as a One Time Token\",\n    \"validationRegex\": \"^([a-zA-Z_][a-zA-Z\\\\d_\\\\-\\\\ ]*)$\",\n    \"type\": \"String\",\n    \"defaultValue\": \"OTT\",\n    \"allowedValues\": [],\n    \"required\": true\n  }\n]','carbon.super','Mediation','ca7c85289a0482ddccc3a2249c190fe3'),('f6d680f9-9456-4d32-a400-f18bfaf62829','jsonValidator','v1','JSON Validator','This policy validates the request body of the JSON message','[request]','[Synapse]','[HTTP]',_binary '[\n  {\n    \"name\": \"maxPropertyCount\",\n    \"displayName\": \"Max Property Count\",\n    \"description\": \"Maximum number of properties allowed in the json payload\",\n    \"validationRegex\": \"^\\\\d{1,3}$\",\n    \"type\": \"Integer\",\n    \"defaultValue\": \"100\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"maxStringLength\",\n    \"displayName\": \"Max String Length\",\n    \"description\": \"Maximum length of a string in the json payload\",\n    \"validationRegex\": \"^\\\\d{1,3}$\",\n    \"type\": \"Integer\",\n    \"defaultValue\": \"100\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"maxArrayElementCount\",\n    \"displayName\": \"Max Array Element Count\",\n    \"description\": \"Maximum number of array elements allowed in the json payload\",\n    \"validationRegex\": \"^\\\\d{1,3}$\",\n    \"type\": \"Integer\",\n    \"defaultValue\": \"100\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"maxKeyLength\",\n    \"displayName\": \"Max Key Length\",\n    \"description\": \"Maximum length of a key allowed in the json payload\",\n    \"validationRegex\": \"^\\\\d{1,3}$\",\n    \"type\": \"Integer\",\n    \"defaultValue\": \"100\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"maxJsonDepth\",\n    \"displayName\": \"Max Json Depth\",\n    \"description\": \"Maximum depth of the json payload\",\n    \"validationRegex\": \"^\\\\d{1,3}$\",\n    \"type\": \"Integer\",\n    \"defaultValue\": \"100\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"requestMessageBufferSize\",\n    \"displayName\": \"Request message buffer size\",\n    \"description\": \"Request message buffer size\",\n    \"validationRegex\": \"^\\\\d{1,4}$\",\n    \"type\": \"Integer\",\n    \"defaultValue\": \"1024\",\n    \"allowedValues\": [],\n    \"required\": false\n  },\n  {\n    \"name\": \"jsonSchemaValidator\",\n    \"displayName\": \"Json schema validator\",\n    \"description\": \"Json schema validator implementation class\",\n    \"validationRegex\": \"^([a-zA-Z_$][a-zA-Z\\\\d_$.]*)$\",\n    \"type\": \"String\",\n    \"defaultValue\": \"org.wso2.carbon.apimgt.gateway.mediators.JsonSchemaValidator\",\n    \"allowedValues\": [],\n    \"required\": false\n  }\n]','carbon.super','Mediation','9a8e9d6af5e8ecef3cacc0e6f0078900'),('ff58dde7-bd56-4ceb-ab7a-41161101ae38','setToHeaderWS','v1','Set To Header for Websocket','This policy allows the user to set the To header for a websocket API','[request]','[Synapse]','[WS]',_binary '[\n  {\n    \"name\": \"value\",\n    \"displayName\": \"To Header Value\",\n    \"description\": \"This is the value of the To header\",\n    \"validationRegex\": \"(.*?)\",\n    \"type\": \"String\",\n    \"allowedValues\": [],\n    \"required\": true\n  }\n]','carbon.super','Mediation','2e18928acb733705854679e4e4e53464');
/*!40000 ALTER TABLE `AM_OPERATION_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_OPERATION_POLICY_DEFINITION`
--

DROP TABLE IF EXISTS `AM_OPERATION_POLICY_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_OPERATION_POLICY_DEFINITION` (
  `DEFINITION_ID` int NOT NULL AUTO_INCREMENT,
  `POLICY_UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `POLICY_DEFINITION` mediumblob NOT NULL,
  `GATEWAY_TYPE` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `DEFINITION_MD5` varchar(45) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`DEFINITION_ID`),
  UNIQUE KEY `POLICY_UUID` (`POLICY_UUID`,`GATEWAY_TYPE`),
  CONSTRAINT `AM_OPERATION_POLICY_DEFINITION_ibfk_1` FOREIGN KEY (`POLICY_UUID`) REFERENCES `AM_OPERATION_POLICY` (`POLICY_UUID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_OPERATION_POLICY_DEFINITION`
--

LOCK TABLES `AM_OPERATION_POLICY_DEFINITION` WRITE;
/*!40000 ALTER TABLE `AM_OPERATION_POLICY_DEFINITION` DISABLE KEYS */;
INSERT INTO `AM_OPERATION_POLICY_DEFINITION` VALUES (1,'96b3b05c-4681-4487-99b9-c55e81ef12d4',_binary '<property name=\"messageType\" value=\"application/json\" scope=\"axis2\"/>','Synapse','ddc72c0f58ad54d3f4b74e591cb2546e'),(2,'f6d680f9-9456-4d32-a400-f18bfaf62829',_binary '<log level=\"custom\">\n    <property name=\"MESSAGE\" value=\"json_validator\"/>\n</log>\n<property name=\"maxPropertyCount\"  value = \"{{maxPropertyCount}}\"/>\n<property name=\"maxStringLength\"  value = \"{{maxStringLength}}\"/>\n<property name=\"maxArrayElementCount\"  value = \"{{maxArrayElementCount}}\"/>\n<property name=\"maxKeyLength\"  value = \"{{maxKeyLength}}\"/>\n<property name=\"maxJsonDepth\"  value = \"{{maxJsonDepth}}\"/>\n<property name=\"RequestMessageBufferSize\" value=\"{{requestMessageBufferSize}}\"/>\n<class name=\"{{jsonSchemaValidator}}\"/>','Synapse','754b587bb88848a05ae72ef33f5ceb65'),(3,'5abc723f-c9e0-4885-b23a-5f7e656c1b30',_binary '<property name=\"DISABLE_CHUNKING\" value=\"true\" scope=\"axis2\" />\n','Synapse','7b53c9ddd06ea5eb8061f459afbb7b4f'),(4,'b6e670eb-f478-4b24-9b60-58ee403bf39f',_binary '<opa>\n   <serverUrl>{{serverUrl}}</serverUrl>\n   {% if accessKey %}\n   <accessKey>{{accessKey}}</accessKey>\n   {% endif %}\n   <policy>{{policy}}</policy>\n   <rule>{{rule}}</rule>\n   <requestGenerator>org.wso2.carbon.apimgt.gateway.opa.APIMOPARequestGenerator</requestGenerator>\n   <additionalParameters>\n      {% if sendAccessToken %}\n      <parameter name=\"sendAccessToken\">{{sendAccessToken}}</parameter>\n      {% endif %}\n      {% if maxOpenConnections %}\n      <parameter name=\"maxOpenConnections\">{{maxOpenConnections}}</parameter>\n      <parameter name=\"maxPerRoute\">{{maxOpenConnections}}</parameter>\n      {% endif %}\n      {% if connectionTimeout %}\n      <parameter name=\"connectionTimeout\">{{connectionTimeout}}</parameter>\n      {% endif %}\n      {% if additionalProperties %}\n      <parameter name=\"additionalMCProperties\">{{additionalProperties}}</parameter>\n      {% endif %}\n   </additionalParameters>\n</opa>\n','Synapse','90174e1a542f846d34aabbdb70499cb8'),(5,'b6e670eb-f478-4b24-9b60-58ee403bf39f',_binary 'definition:\n  action: OPA\n  parameters:\n    requestGenerator: \"\"\n    serverURL: {{ .serverUrl }}\n    {{- if isParamExists . \"accessKey\" }}\n    accessKey: {{ .accessKey }}\n    {{- end }}\n    policy: {{ .policy }}\n    rule: {{ .rule }}\n    {{- if isParamExists . \"sendAccessToken\" }}\n    sendAccessToken: {{ .sendAccessToken }}\n    {{- end }}\n    {{- if isParamExists . \"additionalProperties\" }}\n    additionalProperties: {{ .additionalProperties }}\n    {{- end }}\n    {{- if isParamExists . \"maxOpenConnections\" }}\n    maxOpenConnections: {{ .maxOpenConnections }}\n    maxPerRoute: {{ .maxOpenConnections }}\n    {{- end }}\n    {{- if isParamExists . \"connectionTimeout\" }}\n    connectionTimeout: {{ .connectionTimeout }}\n    {{- end }}\n','ChoreoConnect','79f16d883ed7b7cadd79e0ccdffb099e'),(6,'df868b5b-766e-4894-bc16-ee92d068cff3',_binary 'definition:\n  action: REWRITE_RESOURCE_METHOD\n  parameters:\n    updatedMethod: {{ .updatedMethod }}\n','ChoreoConnect','314d7c99c7c1f9eb973a486ceeb38368'),(7,'0d1fc92a-3880-417f-9876-c343eee50e4b',_binary '<property name=\"messageType\" expression=\"get-property(\'default\', \'WSO2_AM_API_ACCEPT_MESSAGE_TYPE\')\" scope=\"axis2\"/>','Synapse','fa3e296a4c6ba240db70c8c4f8dfbd7b'),(8,'ff58dde7-bd56-4ceb-ab7a-41161101ae38',_binary '<header name=\"To\" expression=\"concat(\'{{value}}\', get-property(\'API_ELECTED_RESOURCE\'))\"/>\n','Synapse','bab3e6729236e32b5ad64cd910e7793b'),(9,'53cedad3-4c1e-439e-abe2-89863f0aeb16',_binary '<property name=\"rest_postfix\" expression=\"get-property(\'axis2\', \'REST_URL_POSTFIX\')\"/>\n<filter regex=\".*\\?.*\" source=\"get-property(\'rest_postfix\')\">\n		<!-- if there are query params already defined -->\n		<then>\n			<property name=\"REST_URL_POSTFIX\" expression=\"fn:concat(get-property(\'rest_postfix\'), \'&amp;{{paramKey}}={{paramValue}}\')\" scope=\"axis2\" type=\"STRING\"/>\n		</then>\n\n		<!-- if there are no query params defined -->\n		<else>\n			<property name=\"REST_URL_POSTFIX\" expression=\"fn:concat(get-property(\'rest_postfix\'), \'?{{paramKey}}={{paramValue}}\')\" scope=\"axis2\" type=\"STRING\"/>\n		</else>\n</filter>\n','Synapse','eb13c1506a59eb766c50a59da335d1f6'),(10,'53cedad3-4c1e-439e-abe2-89863f0aeb16',_binary 'definition:\n  action: ADD_QUERY\n  parameters:\n    queryParamName: {{ .paramKey }}\n    queryParamValue: {{ .paramValue }}\n','ChoreoConnect','af9dea72e0364f80b5ac539e29cf450d'),(11,'d9aa8827-6012-42fc-a0cf-003337b26d67',_binary '<property name=\"HTTP_METHOD\" value=\"{{httpMethod}}\" scope=\"axis2\"/>\n','Synapse','ef351eb8a0784bfc420fcef785a64277'),(12,'3882f8db-44c5-42dd-9759-07d9e3c51807',_binary 'definition:\n  action: SET_HEADER\n  parameters:\n    headerName: {{ .headerName }}\n    headerValue: {{ .headerValue }}\n','ChoreoConnect','8ae19bd0a866f1072247f7fd750321ce'),(13,'12d732fe-87e2-4dde-a6f6-50fb5e10aebf',_binary '<log level=\"custom\">\n    <property name=\"IN_MESSAGE\" value=\"xml_validator\"/>\n</log>\n<property name=\"xmlValidation\" value=\"true\"/>\n<property name=\"dtdEnabled\" value=\"false\"/>\n<property name=\"externalEntitiesEnabled\" value=\"true\"/>\n<property name=\"maxXMLDepth\" value=\"100\"/>\n<property name=\"maxElementCount\" value=\"100\"/>\n<property name=\"maxAttributeCount\" value=\"100\"/>\n<property name=\"maxAttributeLength\" value=\"100\"/>\n<property name=\"maxChildrenPerElement\" value=\"100\"/>\n<property name=\"entityExpansionLimit\" value=\"100\"/>\n<property name=\"schemaValidation\" value=\"false\"/>\n<switch source=\"get-property(\'To\')\">\n        <!--<case regex=\".*/addResource.*\">-->\n            <!--<property name=\"xsdURL\" value=\"<insert XSD_URL>\"/>-->\n        <!--</case>-->\n        <!--<case regex=\".*/update.*\">-->\n            <!--<property name=\"xsdURL\" value=\"<insert XSD_URL>\"/>-->\n        <!--</case>-->\n        <!--<case regex=\".*/delete.*\">-->\n            <!--<property name=\"xsdURL\" value=\"<insert XSD_URL>d\"/>-->\n        <!--</case>-->\n</switch>\n<property name=\"RequestMessageBufferSize\" value=\"1024\"/>\n<class name=\"org.wso2.carbon.apimgt.gateway.mediators.XMLSchemaValidator\"/>','Synapse','1a2a682ce591b3dc3dbbb8ac8b9752bc'),(14,'29d8211c-81d6-4a8e-a869-6d41acc7699e',_binary '<log level=\"custom\">\n    <property name=\"IN_MESSAGE\" value=\"Regular_expression_policy\"/>\n</log>\n<property name=\"threatType\" expression=\"get-property(\'threatType\')\" value=\"SQL-Injection\"/>\n<property name=\"regex\" expression=\"get-property(\'regex\')\" value=\".*\'.*|.*alter.*|.*alter \\s*table.*|.*alter\\s*view.*|\n    .*create\\s*database.*|.*create\\s*procedure.*|.*create\\s*schema.*|.*create\\s*table.*|.*create\\s*view.*|\n    .*delete\\s*from.*|.*drop\\s*database.*|.*drop\\s*procedure.*|.*drop\\s*table.*|.*select\\s*.*\\s*from.*|\n    .*truncate\\s*table.*|.*insert\\s*into.*\"/>\n<property name=\"enabledCheckBody\" expression=\"get-property(\'checkBodyEnable\')\" value=\"true\"/>\n<property name=\"enabledCheckHeaders\" expression=\"get-property(\'enabledCheckHeaders\')\" value=\"true\"/>\n<property name=\"enabledCheckPathParams\" expression=\"get-property(\'enabledCheckPathParams\')\" value=\"true\"/>\n<class name=\"org.wso2.carbon.apimgt.gateway.mediators.RegularExpressionProtector\"/>','Synapse','25ae7e6d355e6efdc5ebdff2d8bf949c'),(15,'eb20aa02-8acb-4e7c-845a-cdab5d3bb7a3',_binary '<log level=\"custom\">\n    <property name=\"STATUS\" value=\"Executing custom \'fault\' sequence\"/>\n    <property name=\"ERROR_CODE\" expression=\"get-property(\'ERROR_CODE\')\"/>\n    <property name=\"ERROR_MESSAGE\" expression=\"get-property(\'ERROR_MESSAGE\')\"/>\n</log>\n<payloadFactory>\n    <format>\n        <am:fault xmlns:am=\"http://wso2.org/apimanager\">\n            <am:code>$1</am:code>\n            <am:type>Status report</am:type>\n            <am:message>Runtime Error</am:message>\n            <am:description>$2</am:description>\n        </am:fault>\n    </format>\n    <args>\n        <arg expression=\"$ctx:ERROR_CODE\"/>\n        <arg expression=\"$ctx:ERROR_MESSAGE\"/>\n    </args>\n</payloadFactory>\n<filter xpath=\"$ctx:CUSTOM_HTTP_SC\">\n    <then>\n        <property name=\"HTTP_SC\" expression=\"$ctx:CUSTOM_HTTP_SC\" scope=\"axis2\"/>\n    </then>\n    <else>\n        <property name=\"HTTP_SC\" value=\"500\" scope=\"axis2\"/>\n    </else>\n</filter>\n<property name=\"RESPONSE\" value=\"true\"/>\n<header name=\"To\" action=\"remove\"/>\n<property name=\"NO_ENTITY_BODY\" scope=\"axis2\" action=\"remove\"/>\n<property name=\"ContentType\" scope=\"axis2\" action=\"remove\"/>\n<property name=\"Authorization\" scope=\"transport\" action=\"remove\"/>\n<property name=\"Host\" scope=\"transport\" action=\"remove\"/>\n<property name=\"Accept\" scope=\"transport\" action=\"remove\"/>\n<property name=\"X-JWT-Assertion\" scope=\"transport\" action=\"remove\"/>\n<property name=\"messageType\" value=\"application/json\" scope=\"axis2\"/>\n<send/>\n<drop/>','Synapse','8f24a6ea66f17d6a28ed164414d52a65'),(16,'6819ffde-4403-4a56-8222-6776330d38f4',_binary '<log level=\"custom\">\n    <property name=\"STATUS\" value=\"Executing custom \'fault\' sequence\"/>\n    <property name=\"ERROR_CODE\" expression=\"get-property(\'ERROR_CODE\')\"/>\n    <property name=\"ERROR_MESSAGE\" expression=\"get-property(\'ERROR_MESSAGE\')\"/>\n    <property name=\"ERROR_DETAIL\" expression=\"get-property(\'ERROR_DETAIL\')\"/>\n    <property name=\"ERROR_EXCEPTION\" expression=\"get-property(\'ERROR_EXCEPTION\')\"/>\n    <property name=\"Endpoint\" expression=\"get-property(\'ENDPOINT_PREFIX\')\"/>\n    <property name=\"Content-Type\" expression=\"get-property(\'transport\', \'Content-Type\')\"/>\n    <property name=\"Correlation_Id\" expression=\"get-property(\'msgID\')\" scope=\"axis2\" />\n</log>\n<payloadFactory>\n    <format>\n        <am:fault xmlns:am=\"http://wso2.org/apimanager\">\n            <am:code>$1</am:code>\n            <am:type>Status report</am:type>\n            <am:message>Runtime Error</am:message>\n            <am:description>$2</am:description>\n        </am:fault>\n    </format>\n    <args>\n        <arg expression=\"$ctx:ERROR_CODE\"/>\n        <arg expression=\"$ctx:ERROR_MESSAGE\"/>\n    </args>\n</payloadFactory>\n<filter xpath=\"$ctx:CUSTOM_HTTP_SC\">\n    <then>\n        <property name=\"HTTP_SC\" expression=\"$ctx:CUSTOM_HTTP_SC\" scope=\"axis2\"/>\n    </then>\n    <else>\n        <property name=\"HTTP_SC\" value=\"500\" scope=\"axis2\"/>\n    </else>\n</filter>\n<property name=\"RESPONSE\" value=\"true\"/>\n<header name=\"To\" action=\"remove\"/>\n<property name=\"NO_ENTITY_BODY\" scope=\"axis2\" action=\"remove\"/>\n<property name=\"ContentType\" scope=\"axis2\" action=\"remove\"/>\n<property name=\"Authorization\" scope=\"transport\" action=\"remove\"/>\n<property name=\"Host\" scope=\"transport\" action=\"remove\"/>\n<property name=\"Accept\" scope=\"transport\" action=\"remove\"/>\n<property name=\"X-JWT-Assertion\" scope=\"transport\" action=\"remove\"/>\n<property name=\"messageType\" value=\"application/json\" scope=\"axis2\"/>\n<send/>\n<drop/>','Synapse','681131e9db31e46f22be9b5e3ccb2d18'),(17,'bf72dc61-e49c-4511-8450-ec2e9d87bf73',_binary '<log level=\"full\">\n    <property name=\"IN_MESSAGE\" value=\"IN_MESSAGE\"/>\n</log>\n<property name=\"msgID\" expression=\"get-property(\'MessageID\')\"/>\n<log level=\"custom\">\n    <property name=\"Host\" expression=\"get-property(\'transport\', \'Host\')\"/>\n    <property name=\"Context\" expression=\"get-property(\'To\')\"/>\n    <property name=\"Http_Method\" expression=\"get-property(\'axis2\', \'HTTP_METHOD\')\"/>\n    <property name=\"Resource\" expression=\"get-property(\'axis2\', \'REST_URL_POSTFIX\')\"/>\n    <property name=\"Origin\" expression=\"get-property(\'transport\', \'Origin\')\"/>\n    <property name=\"Content-Type\" expression=\"get-property(\'transport\', \'Content-Type\')\"/>\n    <property name=\"Message_Id\" expression=\"get-property(\'msgID\')\"/>\n</log>\n','Synapse','46ea5218814a53a11555031cc5b33951'),(18,'45af0606-65a8-4e5f-8ce8-bf4818b71ac2',_binary 'definition:\n  action: CALL_INTERCEPTOR_SERVICE\n  parameters:\n    interceptorServiceURL: {{ .interceptorServiceURL }}\n    includes: {{ .includes }}\n','ChoreoConnect','805d244e1f689a6b87ea5324ed61225e'),(19,'382b5f7f-dcb9-46a7-9c12-568c26da19c2',_binary '<property action=\"set\" name=\"{{headerName}}\" value=\"{{headerValue}}\" scope=\"transport\" />','Synapse','563684c3978b5ece77d440ca05b39c52'),(20,'0b338039-981b-4fc8-b2e2-f2eb77191b2c',_binary 'definition:\n  action: REMOVE_HEADER\n  parameters:\n    headerName: {{ .headerName }}\n','ChoreoConnect','93ac1a2cb49b1e3053d83bed23e183c8'),(21,'96d82e64-fa36-4aff-89d3-df4cfa86d9ff',_binary '<log level=\"full\">\n    <property name=\"MESSAGE\" value=\"MESSAGE\"/>\n</log>','Synapse','f38cb7c1597d4901ff86b6970d9943c5'),(22,'2ec434d2-f9fc-437e-8c08-cb6b2a95edc8',_binary '{% if includeQueryParams %}\n<property name=\"URL_POSTFIX\" expression=\"get-property(\'axis2\',\'REST_URL_POSTFIX\')\" />\n<rewrite inProperty=\"URL_POSTFIX\" outProperty=\"URL_POSTFIX\">\n    <rewriterule>\n        <action value=\"{{newResourcePath}}\" type=\"set\" fragment=\"path\" />\n    </rewriterule>\n</rewrite>\n<property name=\"REST_URL_POSTFIX\" expression=\"get-property(\'URL_POSTFIX\')\" scope=\"axis2\" />\n{% else %}\n    <property name=\"REST_URL_POSTFIX\" value=\"{{newResourcePath}}\" scope=\"axis2\"/>\n{% endif %}','Synapse','d918a37e25809db37492489ef6cdae96'),(23,'2ec434d2-f9fc-437e-8c08-cb6b2a95edc8',_binary 'definition:\n  action: REWRITE_RESOURCE_PATH\n  parameters:\n    resourcePath: {{ .newResourcePath }}\n    {{- if isParamExists . \"includeQueryParams\" }}\n    includeQueryParams: {{ .includeQueryParams }}\n    {{- end }}\n','ChoreoConnect','49b2e8f65409622e8cc7e9fc6c4020f4'),(24,'72f20e65-7ab2-4e49-a9e2-771ed82687aa',_binary '<property name=\"WSO2_AM_API_ACCEPT_MESSAGE_TYPE\" expression=\"get-property(\'transport\', \'Accept\')\" scope=\"default\"/>\n<property name=\"Accept\" scope=\"transport\" action=\"remove\"/>','Synapse','37d6675d461bb8c497aacf6f3719c082'),(25,'bb2f3157-fed9-47b2-864d-d0944514e478',_binary '    <header name=\"To\" value=\"{{value}}\"/>','Synapse','433230c3a229b7b087acd8bbcb014fcf'),(26,'2d45ca6a-5d4c-4dfe-be70-5cfb91f1c25b',_binary '<property action=\"remove\" name=\"{{headerName}}\" scope=\"transport\" />\n','Synapse','380063d4594b2b0e2e39b8316aad4a2a'),(27,'edd51348-154b-4edb-897a-5c0874fb8fd2',_binary '<class name=\"org.wso2.carbon.apimgt.gateway.mediators.OneTimeTokenRevocationMediator\">\n    <property name=\"scope\" value=\"OTT\"/>\n</class>\n','Synapse','ad55a4606cc4dc31d7aed94a54454ca5'),(28,'d348f654-cbf1-4905-a0db-85837097f9c8',_binary '<log level=\"full\">\n	<property name=\"OUT_MESSAGE\" value=\"OUT_MESSAGE\"/>\n</log>\n<log level=\"custom\">\n	<property name=\"Endpoint\" expression=\"get-property(\'ENDPOINT_PREFIX\')\"/>\n    <property name=\"Content-Type\" expression=\"get-property(\'transport\', \'Content-Type\')\"/>\n    <property name=\"Correlation_Id\" expression=\"get-property(\'msgID\')\" scope=\"axis2\" />\n</log>','Synapse','3628ec17f55f69d87358e6f806267e95'),(29,'01dea00e-0336-45af-b8d8-cc1136683b16',_binary '<property name=\"messageType\" value=\"application/xml\" scope=\"axis2\"/>\n','Synapse','9cd17b89e64d6766a09a4d23af9f3dda');
/*!40000 ALTER TABLE `AM_OPERATION_POLICY_DEFINITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_POLICY_APPLICATION`
--

DROP TABLE IF EXISTS `AM_POLICY_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_POLICY_APPLICATION` (
  `POLICY_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_NAME` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int NOT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `QUOTA_TYPE` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `QUOTA` int NOT NULL,
  `QUOTA_UNIT` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `UNIT_TIME` int NOT NULL,
  `TIME_UNIT` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `CUSTOM_ATTRIBUTES` blob,
  `UUID` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `APP_NAME_TENANT` (`NAME`,`TENANT_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_APA_QT` (`QUOTA_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_POLICY_APPLICATION`
--

LOCK TABLES `AM_POLICY_APPLICATION` WRITE;
/*!40000 ALTER TABLE `AM_POLICY_APPLICATION` DISABLE KEYS */;
INSERT INTO `AM_POLICY_APPLICATION` VALUES (1,'50PerMin','50PerMin',-1234,'Allows 50 request per minute','requestCount',50,NULL,1,'min',0,NULL,'769801f4-11c9-457b-8233-e455d786e484'),(2,'20PerMin','20PerMin',-1234,'Allows 20 request per minute','requestCount',20,NULL,1,'min',0,NULL,'5b0b2bb6-0088-4cce-b0d2-d205145facda'),(3,'10PerMin','10PerMin',-1234,'Allows 10 request per minute','requestCount',10,NULL,1,'min',0,NULL,'b3a2a15b-7dd2-4bb2-b6e1-696e8314099c'),(4,'Unlimited','Unlimited',-1234,'Allows unlimited requests','requestCount',2147483647,NULL,1,'min',0,NULL,'2f99c2b1-46ee-42b7-88da-746b195b9c0b');
/*!40000 ALTER TABLE `AM_POLICY_APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_POLICY_GLOBAL`
--

DROP TABLE IF EXISTS `AM_POLICY_GLOBAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_POLICY_GLOBAL` (
  `POLICY_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `KEY_TEMPLATE` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `SIDDHI_QUERY` blob,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `UUID` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_POLICY_GLOBAL`
--

LOCK TABLES `AM_POLICY_GLOBAL` WRITE;
/*!40000 ALTER TABLE `AM_POLICY_GLOBAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_POLICY_GLOBAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_POLICY_HARD_THROTTLING`
--

DROP TABLE IF EXISTS `AM_POLICY_HARD_THROTTLING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_POLICY_HARD_THROTTLING` (
  `POLICY_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `QUOTA_TYPE` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `QUOTA` int NOT NULL,
  `QUOTA_UNIT` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `UNIT_TIME` int NOT NULL,
  `TIME_UNIT` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `POLICY_HARD_NAME_TENANT` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_POLICY_HARD_THROTTLING`
--

LOCK TABLES `AM_POLICY_HARD_THROTTLING` WRITE;
/*!40000 ALTER TABLE `AM_POLICY_HARD_THROTTLING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_POLICY_HARD_THROTTLING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_POLICY_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `AM_POLICY_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_POLICY_SUBSCRIPTION` (
  `POLICY_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_NAME` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int NOT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `QUOTA_TYPE` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `QUOTA` int NOT NULL,
  `QUOTA_UNIT` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `UNIT_TIME` int NOT NULL,
  `TIME_UNIT` varchar(25) COLLATE latin1_general_ci NOT NULL,
  `RATE_LIMIT_COUNT` int DEFAULT NULL,
  `RATE_LIMIT_TIME_UNIT` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `CUSTOM_ATTRIBUTES` blob,
  `STOP_ON_QUOTA_REACH` tinyint(1) NOT NULL DEFAULT '0',
  `BILLING_PLAN` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `UUID` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `MONETIZATION_PLAN` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `FIXED_RATE` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `BILLING_CYCLE` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `PRICE_PER_REQUEST` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `CURRENCY` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `MAX_COMPLEXITY` int NOT NULL DEFAULT '0',
  `MAX_DEPTH` int NOT NULL DEFAULT '0',
  `CONNECTIONS_COUNT` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `AM_POLICY_SUBSCRIPTION_NAME_TENANT` (`NAME`,`TENANT_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_APS_QT` (`QUOTA_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_POLICY_SUBSCRIPTION`
--

LOCK TABLES `AM_POLICY_SUBSCRIPTION` WRITE;
/*!40000 ALTER TABLE `AM_POLICY_SUBSCRIPTION` DISABLE KEYS */;
INSERT INTO `AM_POLICY_SUBSCRIPTION` VALUES (1,'Gold','Gold',-1234,'Allows 5000 requests per minute','requestCount',5000,NULL,1,'min',0,NULL,0,NULL,1,'FREE','3ca60788-425f-43d5-976e-fb9cb48fc28d',NULL,NULL,NULL,NULL,NULL,0,0,0),(2,'Silver','Silver',-1234,'Allows 2000 requests per minute','requestCount',2000,NULL,1,'min',0,NULL,0,NULL,1,'FREE','a82d9f4c-680e-46b2-a95b-357028cbc8f6',NULL,NULL,NULL,NULL,NULL,0,0,0),(3,'Bronze','Bronze',-1234,'Allows 1000 requests per minute','requestCount',1000,NULL,1,'min',0,NULL,0,NULL,1,'FREE','f43f9928-d49c-4dec-9744-1ab98fc06953',NULL,NULL,NULL,NULL,NULL,0,0,0),(4,'Unauthenticated','Unauthenticated',-1234,'Allows 500 request(s) per minute','requestCount',500,NULL,1,'min',0,NULL,0,NULL,1,'FREE','42a3fa32-647e-4050-8d1a-79aceb840737',NULL,NULL,NULL,NULL,NULL,0,0,0),(5,'Unlimited','Unlimited',-1234,'Allows unlimited requests','requestCount',2147483647,NULL,1,'min',0,NULL,0,NULL,1,'FREE','e905c645-aced-49cc-b68e-2b36c79cfab7',NULL,NULL,NULL,NULL,NULL,0,0,0),(6,'AsyncGold','AsyncGold',-1234,'Allows 50000 events per day','eventCount',50000,NULL,1,'days',0,NULL,1,NULL,1,'FREE','489d6076-23a9-4e8f-861a-63146efcdbde',NULL,NULL,NULL,NULL,NULL,0,0,0),(7,'AsyncSilver','AsyncSilver',-1234,'Allows 25000 events per day','eventCount',25000,NULL,1,'days',0,NULL,1,NULL,1,'FREE','aa4e6a1e-5537-49b7-9d42-9fd436251051',NULL,NULL,NULL,NULL,NULL,0,0,0),(8,'AsyncBronze','AsyncBronze',-1234,'Allows 5000 events per day','eventCount',5000,NULL,1,'days',0,NULL,1,NULL,1,'FREE','e2f57fc3-70f8-4b2f-98eb-f9d34f8ab311',NULL,NULL,NULL,NULL,NULL,0,0,0),(9,'AsyncUnlimited','AsyncUnlimited',-1234,'Allows unlimited events','eventCount',2147483647,NULL,1,'days',0,NULL,1,NULL,1,'FREE','5c51ff5c-4dda-42ab-a557-40584adda53d',NULL,NULL,NULL,NULL,NULL,0,0,0),(10,'AsyncWHGold','AsyncWHGold',-1234,'Allows 10000 events per month and 1000 active subscriptions','eventCount',10000,NULL,1,'months',0,NULL,1,NULL,1,'FREE','059523e8-65e4-4d86-b0f3-46550cefed9c',NULL,NULL,NULL,NULL,NULL,0,0,1000),(11,'AsyncWHSilver','AsyncWHSilver',-1234,'Allows 5000 events per month and 500 active subscriptions','eventCount',5000,NULL,1,'months',0,NULL,1,NULL,1,'FREE','742b41d3-8d02-416c-b632-ebd67453be52',NULL,NULL,NULL,NULL,NULL,0,0,500),(12,'AsyncWHBronze','AsyncWHBronze',-1234,'Allows 1000 events per month and 500 active subscriptions','eventCount',1000,NULL,1,'months',0,NULL,1,NULL,1,'FREE','c67fe018-3960-40d2-95e1-2c358026bf25',NULL,NULL,NULL,NULL,NULL,0,0,100),(13,'AsyncWHUnlimited','AsyncWHUnlimited',-1234,'Allows unlimited events and unlimited active subscriptions','eventCount',2147483647,NULL,1,'months',0,NULL,1,NULL,1,'FREE','9733360c-5f21-4190-b637-0258822141a5',NULL,NULL,NULL,NULL,NULL,0,0,2147483647);
/*!40000 ALTER TABLE `AM_POLICY_SUBSCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_QUERY_PARAMETER_CONDITION`
--

DROP TABLE IF EXISTS `AM_QUERY_PARAMETER_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_QUERY_PARAMETER_CONDITION` (
  `QUERY_PARAMETER_ID` int NOT NULL AUTO_INCREMENT,
  `CONDITION_GROUP_ID` int NOT NULL,
  `PARAMETER_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `PARAMETER_VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_PARAM_MAPPING` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`QUERY_PARAMETER_ID`),
  KEY `CONDITION_GROUP_ID` (`CONDITION_GROUP_ID`),
  CONSTRAINT `AM_QUERY_PARAMETER_CONDITION_ibfk_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_QUERY_PARAMETER_CONDITION`
--

LOCK TABLES `AM_QUERY_PARAMETER_CONDITION` WRITE;
/*!40000 ALTER TABLE `AM_QUERY_PARAMETER_CONDITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_QUERY_PARAMETER_CONDITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_REVISION`
--

DROP TABLE IF EXISTS `AM_REVISION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_REVISION` (
  `ID` int NOT NULL,
  `API_UUID` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `REVISION_UUID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`,`API_UUID`),
  UNIQUE KEY `REVISION_UUID` (`REVISION_UUID`),
  KEY `API_UUID` (`API_UUID`),
  CONSTRAINT `AM_REVISION_ibfk_1` FOREIGN KEY (`API_UUID`) REFERENCES `AM_API` (`API_UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_REVISION`
--

LOCK TABLES `AM_REVISION` WRITE;
/*!40000 ALTER TABLE `AM_REVISION` DISABLE KEYS */;
INSERT INTO `AM_REVISION` VALUES (9,'7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','ae89b6e9-c885-4841-9f53-3fcd915f8602','','2025-12-07 09:40:57',NULL),(10,'7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','85114c73-4359-49e5-9545-c747bec89cd3','','2025-12-08 16:50:59',NULL),(11,'7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','f520d828-baf6-45d6-94d1-c4bf3df90496','','2025-12-08 16:51:28',NULL),(12,'7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','d81397b8-baa4-4004-9cee-4961111fa0ec','','2025-12-08 17:12:45',NULL),(13,'7ac153c5-a2a8-49e7-8869-d5e7e0f3c4cd','0952a113-1e90-472c-9f0b-d50ee95c441e','','2025-12-08 17:13:05',NULL);
/*!40000 ALTER TABLE `AM_REVISION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_REVOKED_JWT`
--

DROP TABLE IF EXISTS `AM_REVOKED_JWT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_REVOKED_JWT` (
  `UUID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SIGNATURE` varchar(2048) COLLATE latin1_general_ci NOT NULL,
  `EXPIRY_TIMESTAMP` bigint NOT NULL,
  `TENANT_ID` int DEFAULT '-1',
  `TOKEN_TYPE` varchar(15) COLLATE latin1_general_ci DEFAULT 'DEFAULT',
  `TIME_CREATED` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_REVOKED_JWT`
--

LOCK TABLES `AM_REVOKED_JWT` WRITE;
/*!40000 ALTER TABLE `AM_REVOKED_JWT` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_REVOKED_JWT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SCOPE`
--

DROP TABLE IF EXISTS `AM_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_SCOPE` (
  `SCOPE_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '-1',
  `SCOPE_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SCOPE`
--

LOCK TABLES `AM_SCOPE` WRITE;
/*!40000 ALTER TABLE `AM_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SCOPE_BINDING`
--

DROP TABLE IF EXISTS `AM_SCOPE_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_SCOPE_BINDING` (
  `SCOPE_ID` int NOT NULL,
  `SCOPE_BINDING` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `BINDING_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  KEY `SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `AM_SCOPE_BINDING_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `AM_SCOPE` (`SCOPE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SCOPE_BINDING`
--

LOCK TABLES `AM_SCOPE_BINDING` WRITE;
/*!40000 ALTER TABLE `AM_SCOPE_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SCOPE_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SECURITY_AUDIT_UUID_MAPPING`
--

DROP TABLE IF EXISTS `AM_SECURITY_AUDIT_UUID_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_SECURITY_AUDIT_UUID_MAPPING` (
  `API_ID` int NOT NULL,
  `AUDIT_UUID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`API_ID`),
  CONSTRAINT `AM_SECURITY_AUDIT_UUID_MAPPING_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SECURITY_AUDIT_UUID_MAPPING`
--

LOCK TABLES `AM_SECURITY_AUDIT_UUID_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_SECURITY_AUDIT_UUID_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SECURITY_AUDIT_UUID_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SERVICE_CATALOG`
--

DROP TABLE IF EXISTS `AM_SERVICE_CATALOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_SERVICE_CATALOG` (
  `UUID` varchar(36) COLLATE latin1_general_ci NOT NULL,
  `SERVICE_KEY` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `MD5` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `SERVICE_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SERVICE_VERSION` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `SERVICE_URL` varchar(2048) COLLATE latin1_general_ci NOT NULL,
  `DEFINITION_TYPE` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `DEFINITION_URL` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `SECURITY_TYPE` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `MUTUAL_SSL_ENABLED` tinyint(1) DEFAULT '0',
  `CREATED_TIME` timestamp NULL DEFAULT NULL,
  `LAST_UPDATED_TIME` timestamp NULL DEFAULT NULL,
  `CREATED_BY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_BY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SERVICE_DEFINITION` blob NOT NULL,
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `SERVICE_NAME` (`SERVICE_NAME`,`SERVICE_VERSION`,`TENANT_ID`),
  UNIQUE KEY `SERVICE_KEY` (`SERVICE_KEY`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SERVICE_CATALOG`
--

LOCK TABLES `AM_SERVICE_CATALOG` WRITE;
/*!40000 ALTER TABLE `AM_SERVICE_CATALOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SERVICE_CATALOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SHARED_SCOPE`
--

DROP TABLE IF EXISTS `AM_SHARED_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_SHARED_SCOPE` (
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `UUID` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SHARED_SCOPE`
--

LOCK TABLES `AM_SHARED_SCOPE` WRITE;
/*!40000 ALTER TABLE `AM_SHARED_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SHARED_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SUBSCRIBER`
--

DROP TABLE IF EXISTS `AM_SUBSCRIBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_SUBSCRIBER` (
  `SUBSCRIBER_ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `EMAIL_ADDRESS` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `DATE_SUBSCRIBED` timestamp NOT NULL,
  `CREATED_BY` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SUBSCRIBER_ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SUBSCRIBER`
--

LOCK TABLES `AM_SUBSCRIBER` WRITE;
/*!40000 ALTER TABLE `AM_SUBSCRIBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SUBSCRIBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `AM_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_SUBSCRIPTION` (
  `SUBSCRIPTION_ID` int NOT NULL AUTO_INCREMENT,
  `TIER_ID` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TIER_ID_PENDING` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `API_ID` int DEFAULT NULL,
  `LAST_ACCESSED` timestamp NULL DEFAULT NULL,
  `APPLICATION_ID` int DEFAULT NULL,
  `SUB_STATUS` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `SUBS_CREATE_STATE` varchar(50) COLLATE latin1_general_ci DEFAULT 'SUBSCRIBE',
  `CREATED_BY` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UUID` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`SUBSCRIPTION_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_SUB_APP_ID` (`APPLICATION_ID`,`SUBSCRIPTION_ID`),
  KEY `IDX_AS_AITIAI` (`API_ID`,`TIER_ID`,`APPLICATION_ID`),
  CONSTRAINT `AM_SUBSCRIPTION_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AM_SUBSCRIPTION_ibfk_2` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SUBSCRIPTION`
--

LOCK TABLES `AM_SUBSCRIPTION` WRITE;
/*!40000 ALTER TABLE `AM_SUBSCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SUBSCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SYSTEM_APPS`
--

DROP TABLE IF EXISTS `AM_SYSTEM_APPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_SYSTEM_APPS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `CONSUMER_KEY` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `CONSUMER_SECRET` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `TENANT_DOMAIN` varchar(255) COLLATE latin1_general_ci DEFAULT 'carbon.super',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONSUMER_KEY` (`CONSUMER_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SYSTEM_APPS`
--

LOCK TABLES `AM_SYSTEM_APPS` WRITE;
/*!40000 ALTER TABLE `AM_SYSTEM_APPS` DISABLE KEYS */;
INSERT INTO `AM_SYSTEM_APPS` VALUES (1,'apim_publisher','FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','u3sjFAEFqxGQ8Hf939VgJnl_5fga','2025-12-06 22:49:58','carbon.super');
/*!40000 ALTER TABLE `AM_SYSTEM_APPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SYSTEM_CONFIGS`
--

DROP TABLE IF EXISTS `AM_SYSTEM_CONFIGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_SYSTEM_CONFIGS` (
  `ORGANIZATION` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `CONFIG_TYPE` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `CONFIGURATION` blob NOT NULL,
  PRIMARY KEY (`ORGANIZATION`,`CONFIG_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SYSTEM_CONFIGS`
--

LOCK TABLES `AM_SYSTEM_CONFIGS` WRITE;
/*!40000 ALTER TABLE `AM_SYSTEM_CONFIGS` DISABLE KEYS */;
INSERT INTO `AM_SYSTEM_CONFIGS` VALUES ('carbon.super','TENANT',_binary '{\n  \"EnableMonetization\": false,\n  \"EnableRecommendation\": false,\n  \"IsUnlimitedTierPaid\": false,\n  \"ExtensionHandlerPosition\": \"bottom\",\n  \"RESTAPIScopes\": {\n    \"Scope\": [\n      {\n        \"Name\": \"apim:api_publish\",\n        \"Roles\": \"admin,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:api_create\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:api_generate_key\",\n        \"Roles\": \"admin,Internal/creator,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:api_view\",\n        \"Roles\": \"admin,Internal/publisher,Internal/creator,Internal/analytics,Internal/observer\"\n      },\n      {\n        \"Name\": \"apim:api_delete\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:api_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:subscribe\",\n        \"Roles\": \"admin,Internal/subscriber,Internal/devops\"\n      },\n      {\n        \"Name\": \"apim:tier_view\",\n        \"Roles\": \"admin,Internal/publisher,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:tier_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:bl_view\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:bl_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:subscription_view\",\n        \"Roles\": \"admin,Internal/creator,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:subscription_block\",\n        \"Roles\": \"admin,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:subscription_manage\",\n        \"Roles\": \"admin,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:mediation_policy_view\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:mediation_policy_create\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:api_mediation_policy_manage\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:api_workflow_view\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:api_workflow_approve\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:admin\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:app_owner_change\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:app_import_export\",\n        \"Roles\": \"admin,Internal/devops\"\n      },\n      {\n        \"Name\": \"apim:api_import_export\",\n        \"Roles\": \"admin,Internal/devops\"\n      },\n      {\n        \"Name\": \"apim:api_product_import_export\",\n        \"Roles\": \"admin,Internal/devops\"\n      },\n      {\n        \"Name\": \"apim:label_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:label_read\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:app_update\",\n        \"Roles\": \"admin,Internal/subscriber\"\n      },\n      {\n        \"Name\": \"apim:app_manage\",\n        \"Roles\": \"admin,Internal/subscriber,Internal/devops\"\n      },\n      {\n        \"Name\": \"apim:sub_manage\",\n        \"Roles\": \"admin,Internal/subscriber,Internal/devops\"\n      },\n      {\n        \"Name\": \"apim:monetization_usage_publish\",\n        \"Roles\": \"admin, Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:document_create\",\n        \"Roles\": \"admin, Internal/creator,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:ep_certificates_update\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:client_certificates_update\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:client_certificates_manage\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:threat_protection_policy_manage\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:document_manage\",\n        \"Roles\": \"admin, Internal/creator,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:client_certificates_add\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:publisher_settings\",\n        \"Roles\": \"admin,Internal/creator,Internal/publisher,Internal/observer\"\n      },\n      {\n        \"Name\": \"apim:store_settings\",\n        \"Roles\": \"admin,Internal/subscriber\"\n      },\n      {\n        \"Name\": \"apim:admin_settings\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:client_certificates_view\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:mediation_policy_manage\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:threat_protection_policy_create\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:ep_certificates_add\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:ep_certificates_view\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:ep_certificates_manage\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:api_key\",\n        \"Roles\": \"admin,Internal/subscriber\"\n      },\n      {\n        \"Name\": \"apim_analytics:admin\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim_analytics:monitoring_dashboard:own\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim_analytics:monitoring_dashboard:edit\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim_analytics:monitoring_dashboard:view\",\n        \"Roles\": \"admin,Internal/analytics\"\n      },\n      {\n        \"Name\": \"apim_analytics:business_analytics:own\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim_analytics:business_analytics:edit\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim_analytics:business_analytics:view\",\n        \"Roles\": \"admin,Internal/analytics\"\n      },\n      {\n        \"Name\": \"apim_analytics:api_analytics:own\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim_analytics:api_analytics:edit\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim_analytics:api_analytics:view\",\n        \"Roles\": \"admin,Internal/creator,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim_analytics:application_analytics:own\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim_analytics:application_analytics:edit\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim_analytics:application_analytics:view\",\n        \"Roles\": \"admin,Internal/subscriber\"\n      },\n      {\n        \"Name\": \"apim:pub_alert_manage\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:sub_alert_manage\",\n        \"Roles\": \"admin,Internal/subscriber\"\n      },\n      {\n        \"Name\": \"apim:tenantInfo\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:tenant_theme_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:admin_operations\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:shared_scope_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:admin_alert_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:bot_data\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:scope_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:role_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:environment_manage\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:environment_read\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"service_catalog:service_view\",\n        \"Roles\": \"admin,Internal/creator,Internal/publisher\"\n      },\n      {\n        \"Name\": \"service_catalog:service_write\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:comment_view\",\n        \"Roles\": \"admin,Internal/creator,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:comment_write\",\n        \"Roles\": \"admin,Internal/creator,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:comment_manage\",\n        \"Roles\": \"admin,Internal/creator,Internal/publisher\"\n      },\n      {\n        \"Name\": \"apim:throttling_policy_manage\",\n        \"Roles\": \"admin,Internal/publisher,Internal/creator,Internal/analytics\"\n      },\n      {\n        \"Name\": \"apim:admin_application_view\",\n        \"Roles\": \"admin\"\n      },\n      {\n        \"Name\": \"apim:api_list_view\",\n        \"Roles\": \"Internal/integration_dev\"\n      },\n      {\n        \"Name\": \"apim:api_definition_view\",\n        \"Roles\": \"Internal/integration_dev\"\n      },\n      {\n        \"Name\": \"apim:common_operation_policy_view\",\n        \"Roles\": \"admin,Internal/creator,Internal/publisher,Internal/observer\"\n      },\n      {\n        \"Name\": \"apim:common_operation_policy_manage\",\n        \"Roles\": \"admin,Internal/creator\"\n      },\n      {\n        \"Name\": \"apim:policies_import_export\",\n        \"Roles\": \"admin,Internal/devops\"\n      }\n    ]\n  },\n  \"Meta\": {\n    \"Migration\": {\n      \"3.0.0\": true\n    }\n  },\n  \"NotificationsEnabled\": \"false\",\n  \"Notifications\": [\n    {\n      \"Type\": \"new_api_version\",\n      \"Notifiers\": [\n        {\n          \"Class\": \"org.wso2.carbon.apimgt.impl.notification.NewAPIVersionEmailNotifier\",\n          \"ClaimsRetrieverImplClass\": \"org.wso2.carbon.apimgt.impl.token.DefaultClaimsRetriever\",\n          \"Title\": \"Version $2 of $1 Released\",\n          \"Template\": \" \\u003chtml\\u003e \\u003cbody\\u003e \\u003ch3 style\\u003d\\\"color:Black;\\\"\\u003eWe‚Äôre happy to announce the arrival of the next major version $2 of $1 API which is now available in Our API Store.\\u003c/h3\\u003e\\u003ca href\\u003d\\\"https://localhost:9443/store\\\"\\u003eClick here to Visit WSO2 API Store\\u003c/a\\u003e\\u003c/body\\u003e\\u003c/html\\u003e\"\n        }\n      ]\n    }\n  ],\n  \"DefaultRoles\": {\n    \"PublisherRole\": {\n      \"CreateOnTenantLoad\": true,\n      \"RoleName\": \"Internal/publisher\"\n    },\n    \"CreatorRole\": {\n      \"CreateOnTenantLoad\": true,\n      \"RoleName\": \"Internal/creator\"\n    },\n    \"SubscriberRole\": {\n      \"CreateOnTenantLoad\": true\n    },\n    \"DevOpsRole\": {\n      \"CreateOnTenantLoad\": true,\n      \"RoleName\": \"Internal/devops\"\n    },\n    \"ObserverRole\": {\n      \"CreateOnTenantLoad\": true,\n      \"RoleName\": \"Internal/observer\"\n    },\n    \"IntegrationDeveloperRole\": {\n      \"CreateOnTenantLoad\": true,\n      \"RoleName\": \"Internal/integration_dev\"\n    }\n  },\n  \"SelfSignUp\": {\n    \"SignUpRoles\": [\n      \"Internal/subscriber\"\n    ]\n  }\n}');
/*!40000 ALTER TABLE `AM_SYSTEM_CONFIGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_TENANT_THEMES`
--

DROP TABLE IF EXISTS `AM_TENANT_THEMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_TENANT_THEMES` (
  `TENANT_ID` int NOT NULL,
  `THEME` mediumblob NOT NULL,
  PRIMARY KEY (`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_TENANT_THEMES`
--

LOCK TABLES `AM_TENANT_THEMES` WRITE;
/*!40000 ALTER TABLE `AM_TENANT_THEMES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_TENANT_THEMES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_THROTTLE_TIER_PERMISSIONS`
--

DROP TABLE IF EXISTS `AM_THROTTLE_TIER_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_THROTTLE_TIER_PERMISSIONS` (
  `THROTTLE_TIER_PERMISSIONS_ID` int NOT NULL AUTO_INCREMENT,
  `TIER` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `PERMISSIONS_TYPE` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `ROLES` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  PRIMARY KEY (`THROTTLE_TIER_PERMISSIONS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_THROTTLE_TIER_PERMISSIONS`
--

LOCK TABLES `AM_THROTTLE_TIER_PERMISSIONS` WRITE;
/*!40000 ALTER TABLE `AM_THROTTLE_TIER_PERMISSIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_THROTTLE_TIER_PERMISSIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_TIER_PERMISSIONS`
--

DROP TABLE IF EXISTS `AM_TIER_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_TIER_PERMISSIONS` (
  `TIER_PERMISSIONS_ID` int NOT NULL AUTO_INCREMENT,
  `TIER` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `PERMISSIONS_TYPE` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `ROLES` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  PRIMARY KEY (`TIER_PERMISSIONS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_TIER_PERMISSIONS`
--

LOCK TABLES `AM_TIER_PERMISSIONS` WRITE;
/*!40000 ALTER TABLE `AM_TIER_PERMISSIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_TIER_PERMISSIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_USAGE_UPLOADED_FILES`
--

DROP TABLE IF EXISTS `AM_USAGE_UPLOADED_FILES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_USAGE_UPLOADED_FILES` (
  `TENANT_DOMAIN` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `FILE_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `FILE_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FILE_PROCESSED` tinyint(1) DEFAULT '0',
  `FILE_CONTENT` mediumblob,
  PRIMARY KEY (`TENANT_DOMAIN`,`FILE_NAME`,`FILE_TIMESTAMP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_USAGE_UPLOADED_FILES`
--

LOCK TABLES `AM_USAGE_UPLOADED_FILES` WRITE;
/*!40000 ALTER TABLE `AM_USAGE_UPLOADED_FILES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_USAGE_UPLOADED_FILES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_USER`
--

DROP TABLE IF EXISTS `AM_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_USER` (
  `USER_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_USER`
--

LOCK TABLES `AM_USER` WRITE;
/*!40000 ALTER TABLE `AM_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_WEBHOOKS_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `AM_WEBHOOKS_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_WEBHOOKS_SUBSCRIPTION` (
  `WH_SUBSCRIPTION_ID` int NOT NULL AUTO_INCREMENT,
  `API_UUID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `APPLICATION_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `TENANT_DOMAIN` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `HUB_CALLBACK_URL` varchar(1024) COLLATE latin1_general_ci NOT NULL,
  `HUB_TOPIC` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `HUB_SECRET` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `HUB_LEASE_SECONDS` int DEFAULT NULL,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXPIRY_AT` bigint DEFAULT NULL,
  `DELIVERED_AT` timestamp NULL DEFAULT NULL,
  `DELIVERY_STATE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`WH_SUBSCRIPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_WEBHOOKS_SUBSCRIPTION`
--

LOCK TABLES `AM_WEBHOOKS_SUBSCRIPTION` WRITE;
/*!40000 ALTER TABLE `AM_WEBHOOKS_SUBSCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_WEBHOOKS_SUBSCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_WEBHOOKS_UNSUBSCRIPTION`
--

DROP TABLE IF EXISTS `AM_WEBHOOKS_UNSUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_WEBHOOKS_UNSUBSCRIPTION` (
  `API_UUID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `APPLICATION_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `TENANT_DOMAIN` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `HUB_CALLBACK_URL` varchar(1024) COLLATE latin1_general_ci NOT NULL,
  `HUB_TOPIC` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `HUB_SECRET` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `HUB_LEASE_SECONDS` int DEFAULT NULL,
  `ADDED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_WEBHOOKS_UNSUBSCRIPTION`
--

LOCK TABLES `AM_WEBHOOKS_UNSUBSCRIPTION` WRITE;
/*!40000 ALTER TABLE `AM_WEBHOOKS_UNSUBSCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_WEBHOOKS_UNSUBSCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_WORKFLOWS`
--

DROP TABLE IF EXISTS `AM_WORKFLOWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AM_WORKFLOWS` (
  `WF_ID` int NOT NULL AUTO_INCREMENT,
  `WF_REFERENCE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `WF_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `WF_STATUS` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `WF_CREATED_TIME` timestamp NULL DEFAULT NULL,
  `WF_UPDATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `WF_STATUS_DESC` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `TENANT_DOMAIN` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `WF_EXTERNAL_REFERENCE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `WF_METADATA` blob,
  `WF_PROPERTIES` blob,
  PRIMARY KEY (`WF_ID`),
  UNIQUE KEY `WF_EXTERNAL_REFERENCE` (`WF_EXTERNAL_REFERENCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_WORKFLOWS`
--

LOCK TABLES `AM_WORKFLOWS` WRITE;
/*!40000 ALTER TABLE `AM_WORKFLOWS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_WORKFLOWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_CONSENT_RECEIPT_PROPERTY`
--

DROP TABLE IF EXISTS `CM_CONSENT_RECEIPT_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_CONSENT_RECEIPT_PROPERTY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CONSENT_RECEIPT_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `VALUE` varchar(1023) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONSENT_RECEIPT_ID` (`CONSENT_RECEIPT_ID`,`NAME`),
  CONSTRAINT `CM_CONSENT_RECEIPT_PRT_fk0` FOREIGN KEY (`CONSENT_RECEIPT_ID`) REFERENCES `CM_RECEIPT` (`CONSENT_RECEIPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_CONSENT_RECEIPT_PROPERTY`
--

LOCK TABLES `CM_CONSENT_RECEIPT_PROPERTY` WRITE;
/*!40000 ALTER TABLE `CM_CONSENT_RECEIPT_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_CONSENT_RECEIPT_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_PII_CATEGORY`
--

DROP TABLE IF EXISTS `CM_PII_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_PII_CATEGORY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_SENSITIVE` int NOT NULL,
  `TENANT_ID` int DEFAULT '-1234',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_PII_CATEGORY`
--

LOCK TABLES `CM_PII_CATEGORY` WRITE;
/*!40000 ALTER TABLE `CM_PII_CATEGORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_PII_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_PURPOSE`
--

DROP TABLE IF EXISTS `CM_PURPOSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_PURPOSE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  `PURPOSE_GROUP` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `GROUP_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int DEFAULT '-1234',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_ID`,`PURPOSE_GROUP`,`GROUP_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_PURPOSE`
--

LOCK TABLES `CM_PURPOSE` WRITE;
/*!40000 ALTER TABLE `CM_PURPOSE` DISABLE KEYS */;
INSERT INTO `CM_PURPOSE` VALUES (1,'DEFAULT','For core functionalities of the product','DEFAULT','SP',-1234);
/*!40000 ALTER TABLE `CM_PURPOSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_PURPOSE_CATEGORY`
--

DROP TABLE IF EXISTS `CM_PURPOSE_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_PURPOSE_CATEGORY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1234',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_PURPOSE_CATEGORY`
--

LOCK TABLES `CM_PURPOSE_CATEGORY` WRITE;
/*!40000 ALTER TABLE `CM_PURPOSE_CATEGORY` DISABLE KEYS */;
INSERT INTO `CM_PURPOSE_CATEGORY` VALUES (1,'DEFAULT','For core functionalities of the product',-1234);
/*!40000 ALTER TABLE `CM_PURPOSE_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_PURPOSE_PII_CAT_ASSOC`
--

DROP TABLE IF EXISTS `CM_PURPOSE_PII_CAT_ASSOC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_PURPOSE_PII_CAT_ASSOC` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PURPOSE_ID` int NOT NULL,
  `CM_PII_CATEGORY_ID` int NOT NULL,
  `IS_MANDATORY` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PURPOSE_ID` (`PURPOSE_ID`,`CM_PII_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_PURPOSE_PII_CAT_ASSOC`
--

LOCK TABLES `CM_PURPOSE_PII_CAT_ASSOC` WRITE;
/*!40000 ALTER TABLE `CM_PURPOSE_PII_CAT_ASSOC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_PURPOSE_PII_CAT_ASSOC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_RECEIPT`
--

DROP TABLE IF EXISTS `CM_RECEIPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_RECEIPT` (
  `CONSENT_RECEIPT_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `VERSION` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `JURISDICTION` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CONSENT_TIMESTAMP` timestamp NOT NULL,
  `COLLECTION_METHOD` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `LANGUAGE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PII_PRINCIPAL_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PRINCIPAL_TENANT_ID` int DEFAULT '-1234',
  `POLICY_URL` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `STATE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PII_CONTROLLER` varchar(2048) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`CONSENT_RECEIPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_RECEIPT`
--

LOCK TABLES `CM_RECEIPT` WRITE;
/*!40000 ALTER TABLE `CM_RECEIPT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_RECEIPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_RECEIPT_SP_ASSOC`
--

DROP TABLE IF EXISTS `CM_RECEIPT_SP_ASSOC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_RECEIPT_SP_ASSOC` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CONSENT_RECEIPT_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SP_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SP_DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SP_DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `SP_TENANT_ID` int DEFAULT '-1234',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONSENT_RECEIPT_ID` (`CONSENT_RECEIPT_ID`,`SP_NAME`,`SP_TENANT_ID`),
  CONSTRAINT `CM_RECEIPT_SP_ASSOC_fk0` FOREIGN KEY (`CONSENT_RECEIPT_ID`) REFERENCES `CM_RECEIPT` (`CONSENT_RECEIPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_RECEIPT_SP_ASSOC`
--

LOCK TABLES `CM_RECEIPT_SP_ASSOC` WRITE;
/*!40000 ALTER TABLE `CM_RECEIPT_SP_ASSOC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_RECEIPT_SP_ASSOC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_SP_PURPOSE_ASSOC`
--

DROP TABLE IF EXISTS `CM_SP_PURPOSE_ASSOC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_SP_PURPOSE_ASSOC` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RECEIPT_SP_ASSOC` int NOT NULL,
  `PURPOSE_ID` int NOT NULL,
  `CONSENT_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IS_PRIMARY_PURPOSE` int NOT NULL,
  `TERMINATION` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `THIRD_PARTY_DISCLOSURE` int NOT NULL,
  `THIRD_PARTY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RECEIPT_SP_ASSOC` (`RECEIPT_SP_ASSOC`,`PURPOSE_ID`),
  KEY `CM_SP_PURPOSE_ASSOC_fk1` (`PURPOSE_ID`),
  CONSTRAINT `CM_SP_PURPOSE_ASSOC_fk0` FOREIGN KEY (`RECEIPT_SP_ASSOC`) REFERENCES `CM_RECEIPT_SP_ASSOC` (`ID`),
  CONSTRAINT `CM_SP_PURPOSE_ASSOC_fk1` FOREIGN KEY (`PURPOSE_ID`) REFERENCES `CM_PURPOSE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_SP_PURPOSE_ASSOC`
--

LOCK TABLES `CM_SP_PURPOSE_ASSOC` WRITE;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_ASSOC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_ASSOC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_SP_PURPOSE_PII_CAT_ASSOC`
--

DROP TABLE IF EXISTS `CM_SP_PURPOSE_PII_CAT_ASSOC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_SP_PURPOSE_PII_CAT_ASSOC` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SP_PURPOSE_ASSOC_ID` int NOT NULL,
  `PII_CATEGORY_ID` int NOT NULL,
  `VALIDITY` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_CONSENTED` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SP_PURPOSE_ASSOC_ID` (`SP_PURPOSE_ASSOC_ID`,`PII_CATEGORY_ID`),
  KEY `CM_SP_P_PII_CAT_ASSOC_fk1` (`PII_CATEGORY_ID`),
  CONSTRAINT `CM_SP_P_PII_CAT_ASSOC_fk0` FOREIGN KEY (`SP_PURPOSE_ASSOC_ID`) REFERENCES `CM_SP_PURPOSE_ASSOC` (`ID`),
  CONSTRAINT `CM_SP_P_PII_CAT_ASSOC_fk1` FOREIGN KEY (`PII_CATEGORY_ID`) REFERENCES `CM_PII_CATEGORY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_SP_PURPOSE_PII_CAT_ASSOC`
--

LOCK TABLES `CM_SP_PURPOSE_PII_CAT_ASSOC` WRITE;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_PII_CAT_ASSOC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_PII_CAT_ASSOC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_SP_PURPOSE_PURPOSE_CAT_ASSC`
--

DROP TABLE IF EXISTS `CM_SP_PURPOSE_PURPOSE_CAT_ASSC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CM_SP_PURPOSE_PURPOSE_CAT_ASSC` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SP_PURPOSE_ASSOC_ID` int NOT NULL,
  `PURPOSE_CATEGORY_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SP_PURPOSE_ASSOC_ID` (`SP_PURPOSE_ASSOC_ID`,`PURPOSE_CATEGORY_ID`),
  KEY `CM_SP_P_P_CAT_ASSOC_fk1` (`PURPOSE_CATEGORY_ID`),
  CONSTRAINT `CM_SP_P_P_CAT_ASSOC_fk0` FOREIGN KEY (`SP_PURPOSE_ASSOC_ID`) REFERENCES `CM_SP_PURPOSE_ASSOC` (`ID`),
  CONSTRAINT `CM_SP_P_P_CAT_ASSOC_fk1` FOREIGN KEY (`PURPOSE_CATEGORY_ID`) REFERENCES `CM_PURPOSE_CATEGORY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_SP_PURPOSE_PURPOSE_CAT_ASSC`
--

LOCK TABLES `CM_SP_PURPOSE_PURPOSE_CAT_ASSC` WRITE;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_PURPOSE_CAT_ASSC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_PURPOSE_CAT_ASSC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIDO2_DEVICE_STORE`
--

DROP TABLE IF EXISTS `FIDO2_DEVICE_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FIDO2_DEVICE_STORE` (
  `TENANT_ID` int DEFAULT NULL,
  `DOMAIN_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_NAME` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `TIME_REGISTERED` timestamp NULL DEFAULT NULL,
  `USER_HANDLE` varchar(64) COLLATE latin1_general_ci NOT NULL,
  `CREDENTIAL_ID` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `PUBLIC_KEY_COSE` varchar(1024) COLLATE latin1_general_ci NOT NULL,
  `SIGNATURE_COUNT` bigint DEFAULT NULL,
  `USER_IDENTITY` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_USERNAMELESS_SUPPORTED` char(1) COLLATE latin1_general_ci DEFAULT '0',
  PRIMARY KEY (`CREDENTIAL_ID`,`USER_HANDLE`),
  KEY `IDX_FIDO2_STR` (`USER_NAME`,`TENANT_ID`,`DOMAIN_NAME`,`CREDENTIAL_ID`,`USER_HANDLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIDO2_DEVICE_STORE`
--

LOCK TABLES `FIDO2_DEVICE_STORE` WRITE;
/*!40000 ALTER TABLE `FIDO2_DEVICE_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIDO2_DEVICE_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIDO_DEVICE_STORE`
--

DROP TABLE IF EXISTS `FIDO_DEVICE_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FIDO_DEVICE_STORE` (
  `TENANT_ID` int NOT NULL,
  `DOMAIN_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_NAME` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `TIME_REGISTERED` timestamp NULL DEFAULT NULL,
  `KEY_HANDLE` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `DEVICE_DATA` varchar(2048) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`DOMAIN_NAME`,`USER_NAME`,`KEY_HANDLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIDO_DEVICE_STORE`
--

LOCK TABLES `FIDO_DEVICE_STORE` WRITE;
/*!40000 ALTER TABLE `FIDO_DEVICE_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIDO_DEVICE_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_ASSOCIATED_ID`
--

DROP TABLE IF EXISTS `IDN_ASSOCIATED_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_ASSOCIATED_ID` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDP_USER_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int DEFAULT '-1234',
  `IDP_ID` int NOT NULL,
  `DOMAIN_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ASSOCIATION_ID` char(36) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_USER_ID` (`IDP_USER_ID`,`TENANT_ID`,`IDP_ID`),
  KEY `IDP_ID` (`IDP_ID`),
  KEY `IDX_AI_DN_UN_AI` (`DOMAIN_NAME`,`USER_NAME`,`ASSOCIATION_ID`),
  CONSTRAINT `IDN_ASSOCIATED_ID_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_ASSOCIATED_ID`
--

LOCK TABLES `IDN_ASSOCIATED_ID` WRITE;
/*!40000 ALTER TABLE `IDN_ASSOCIATED_ID` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_ASSOCIATED_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_SESSION_APP_INFO`
--

DROP TABLE IF EXISTS `IDN_AUTH_SESSION_APP_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_AUTH_SESSION_APP_INFO` (
  `SESSION_ID` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `SUBJECT` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `APP_ID` int NOT NULL,
  `INBOUND_AUTH_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`SESSION_ID`,`SUBJECT`,`APP_ID`,`INBOUND_AUTH_TYPE`),
  KEY `IDX_AUTH_SAI_UN_AID_SID` (`APP_ID`,`SUBJECT`,`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_SESSION_APP_INFO`
--

LOCK TABLES `IDN_AUTH_SESSION_APP_INFO` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_APP_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_APP_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_SESSION_META_DATA`
--

DROP TABLE IF EXISTS `IDN_AUTH_SESSION_META_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_AUTH_SESSION_META_DATA` (
  `SESSION_ID` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `PROPERTY_TYPE` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `VALUE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`SESSION_ID`,`PROPERTY_TYPE`,`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_SESSION_META_DATA`
--

LOCK TABLES `IDN_AUTH_SESSION_META_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_META_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_META_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_SESSION_STORE`
--

DROP TABLE IF EXISTS `IDN_AUTH_SESSION_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_AUTH_SESSION_STORE` (
  `SESSION_ID` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `SESSION_TYPE` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `OPERATION` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `SESSION_OBJECT` blob,
  `TIME_CREATED` bigint NOT NULL,
  `TENANT_ID` int DEFAULT '-1',
  `EXPIRY_TIME` bigint DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`,`SESSION_TYPE`,`TIME_CREATED`,`OPERATION`),
  KEY `IDX_IDN_AUTH_SESSION_TIME` (`TIME_CREATED`),
  KEY `IDX_IDN_AUTH_SSTR_ST_OP_ID_TM` (`OPERATION`,`SESSION_TYPE`,`SESSION_ID`,`TIME_CREATED`),
  KEY `IDX_IDN_AUTH_SSTR_ET_ID` (`EXPIRY_TIME`,`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_SESSION_STORE`
--

LOCK TABLES `IDN_AUTH_SESSION_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_STORE` DISABLE KEYS */;
INSERT INTO `IDN_AUTH_SESSION_STORE` VALUES ('0578ef7ba8caffaae161d7fc42f00d999d1e6ba295b82ad3fbfdf22045bd62f0','AppAuthFrameworkSessionContextCache','DELETE',NULL,1765107237695418845,-1,1766316837695418845),('0ef2e912-92df-4f25-8025-64afb934b57c','OIDCSessionParticipantCache','STORE',_binary '¨\Ì\0sr\0Lorg.wso2.carbon.identity.oidc.session.cache.OIDCSessionParticipantCacheEntry\∆\÷W}\Ê\ıZ\0L\0sessionStatet\08Lorg/wso2/carbon/identity/oidc/session/OIDCSessionState;L\0tenantDomaint\0Ljava/lang/String;xr\0.org.wso2.carbon.identity.core.cache.CacheEntryö£|Mf,\0J\0validityPeriodxp\0\0\0\0\0\0\0\0sr\06org.wso2.carbon.identity.oidc.session.OIDCSessionState\¬cØ,ë∑Ω\Z\0Z\0addSessionStateZ\0isAuthenticatedL\0authenticatedUserq\0~\0L\0sessionParticipantst\0Ljava/util/Set;L\0sidClaimq\0~\0xpt\0adminsr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0FLUlPcQ9ItxfRZuoB5BxAHBrtSQaxt\0$5462fa67-199a-44d6-811e-618e58bb2a33t\0carbon.super',1765063200917306144,-1,1766272800917306144),('1700af24-0ac4-4f63-bdae-ee8c73ba1cef','OIDCSessionParticipantCache','STORE',_binary '¨\Ì\0sr\0Lorg.wso2.carbon.identity.oidc.session.cache.OIDCSessionParticipantCacheEntry\∆\÷W}\Ê\ıZ\0L\0sessionStatet\08Lorg/wso2/carbon/identity/oidc/session/OIDCSessionState;L\0tenantDomaint\0Ljava/lang/String;xr\0.org.wso2.carbon.identity.core.cache.CacheEntryö£|Mf,\0J\0validityPeriodxp\0\0\0\0\0\0\0\0sr\06org.wso2.carbon.identity.oidc.session.OIDCSessionState\¬cØ,ë∑Ω\Z\0Z\0addSessionStateZ\0isAuthenticatedL\0authenticatedUserq\0~\0L\0sessionParticipantst\0Ljava/util/Set;L\0sidClaimq\0~\0xpt\0adminsr\0java.util.HashSet∫DÖïñ∏∑4\0\0xpw\0\0\0?@\0\0\0\0\0t\0FLUlPcQ9ItxfRZuoB5BxAHBrtSQaxt\0$e7c450f1-c942-40aa-a073-d0845eeea714t\0carbon.super',1765101298355292181,-1,1766310898355292181),('1f893a2d33bc56b22440a1f2f06120169a411e307ed5bf029a19755537a4e576','AppAuthFrameworkSessionContextCache','DELETE',NULL,1765112068344692000,-1,1766321668344692000),('27f322fa-8c49-4b64-b41d-35bc38198297','AuthorizationGrantCache','DELETE',NULL,1765063201059354088,-1,1766272801059354088),('4545a621-8b2b-4959-9279-cb803034cbef','AuthorizationGrantCache','DELETE',NULL,1765122022489044092,-1,1766331622489044092),('4986145b64dbcd35b50838d8024f6c0693733a8a3b67060d72b64e11fd517086','AppAuthFrameworkSessionContextCache','DELETE',NULL,1765122014157390500,-1,1766331614157390500),('5dff590c-2613-4a73-a536-026e3302a6b1','AuthorizationGrantCache','DELETE',NULL,1765101298453082381,-1,1766310898453082381),('832e340e-f1db-40c1-8139-67ceaf614285','AuthorizationGrantCache','DELETE',NULL,1765240957257245126,-1,1766450557257245126),('9cb86ebd9b230fa77f252083ca47d2b9aca7fe907b903c9df50222b6a1eff970','AppAuthFrameworkSessionContextCache','DELETE',NULL,1765101173210962182,-1,1766310773210962182),('b9320739-f201-4bc5-b82b-b2680189ad19','AuthorizationGrantCache','DELETE',NULL,1765101178226962972,-1,1766310778226962972),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','AuthorizationGrantCache','DELETE',NULL,1765112082920087163,-1,1766321682920087163),('e8c28a97-2f5f-423e-bade-e24d820ba13d','AuthorizationGrantCache','DELETE',NULL,1765233924748425999,-1,1766443524748425999),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','AuthorizationGrantCache','DELETE',NULL,1765107263447686931,-1,1766316863447686931),('f67442a74994d525d02dea72bdf7dc2fab1f89df2c32eaaffdd3d0ab060e5246','AppAuthFrameworkSessionContextCache','DELETE',NULL,1765240952784168835,-1,1766450552784168835);
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_TEMP_SESSION_STORE`
--

DROP TABLE IF EXISTS `IDN_AUTH_TEMP_SESSION_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_AUTH_TEMP_SESSION_STORE` (
  `SESSION_ID` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `SESSION_TYPE` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `OPERATION` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `SESSION_OBJECT` blob,
  `TIME_CREATED` bigint NOT NULL,
  `TENANT_ID` int DEFAULT '-1',
  `EXPIRY_TIME` bigint DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`,`SESSION_TYPE`,`TIME_CREATED`,`OPERATION`),
  KEY `IDX_IDN_AUTH_TMP_SESSION_TIME` (`TIME_CREATED`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_TEMP_SESSION_STORE`
--

LOCK TABLES `IDN_AUTH_TEMP_SESSION_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_TEMP_SESSION_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_TEMP_SESSION_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_USER`
--

DROP TABLE IF EXISTS `IDN_AUTH_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_AUTH_USER` (
  `USER_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `DOMAIN_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IDP_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_STORE_CONSTRAINT` (`USER_NAME`,`TENANT_ID`,`DOMAIN_NAME`,`IDP_ID`),
  KEY `IDX_AUTH_USER_UN_TID_DN` (`USER_NAME`,`TENANT_ID`,`DOMAIN_NAME`),
  KEY `IDX_AUTH_USER_DN_TOD` (`DOMAIN_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_USER`
--

LOCK TABLES `IDN_AUTH_USER` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_USER_SESSION_MAPPING`
--

DROP TABLE IF EXISTS `IDN_AUTH_USER_SESSION_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_AUTH_USER_SESSION_MAPPING` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SESSION_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_SESSION_STORE_CONSTRAINT` (`USER_ID`,`SESSION_ID`),
  KEY `IDX_USER_ID` (`USER_ID`),
  KEY `IDX_SESSION_ID` (`SESSION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_USER_SESSION_MAPPING`
--

LOCK TABLES `IDN_AUTH_USER_SESSION_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_USER_SESSION_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_USER_SESSION_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_WAIT_STATUS`
--

DROP TABLE IF EXISTS `IDN_AUTH_WAIT_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_AUTH_WAIT_STATUS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `LONG_WAIT_KEY` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `WAIT_STATUS` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '1',
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXPIRE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDN_AUTH_WAIT_STATUS_KEY` (`LONG_WAIT_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_WAIT_STATUS`
--

LOCK TABLES `IDN_AUTH_WAIT_STATUS` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_WAIT_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_WAIT_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_BASE_TABLE`
--

DROP TABLE IF EXISTS `IDN_BASE_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_BASE_TABLE` (
  `PRODUCT_NAME` varchar(20) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`PRODUCT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_BASE_TABLE`
--

LOCK TABLES `IDN_BASE_TABLE` WRITE;
/*!40000 ALTER TABLE `IDN_BASE_TABLE` DISABLE KEYS */;
INSERT INTO `IDN_BASE_TABLE` VALUES ('WSO2 Identity Server');
/*!40000 ALTER TABLE `IDN_BASE_TABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CERTIFICATE`
--

DROP TABLE IF EXISTS `IDN_CERTIFICATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CERTIFICATE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `CERTIFICATE_IN_PEM` blob,
  `TENANT_ID` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CERTIFICATE_UNIQUE_KEY` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CERTIFICATE`
--

LOCK TABLES `IDN_CERTIFICATE` WRITE;
/*!40000 ALTER TABLE `IDN_CERTIFICATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_CERTIFICATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM`
--

DROP TABLE IF EXISTS `IDN_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CLAIM` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DIALECT_ID` int NOT NULL,
  `CLAIM_URI` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CLAIM_URI_CONSTRAINT` (`DIALECT_ID`,`CLAIM_URI`,`TENANT_ID`),
  CONSTRAINT `IDN_CLAIM_ibfk_1` FOREIGN KEY (`DIALECT_ID`) REFERENCES `IDN_CLAIM_DIALECT` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM`
--

LOCK TABLES `IDN_CLAIM` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM` VALUES (92,1,'http://wso2.org/claims/active',-1234),(13,1,'http://wso2.org/claims/addresses',-1234),(51,1,'http://wso2.org/claims/addresses.formatted',-1234),(43,1,'http://wso2.org/claims/addresses.locality',-1234),(56,1,'http://wso2.org/claims/challengeQuestion1',-1234),(63,1,'http://wso2.org/claims/challengeQuestion2',-1234),(27,1,'http://wso2.org/claims/challengeQuestionUris',-1234),(25,1,'http://wso2.org/claims/costCenter',-1234),(3,1,'http://wso2.org/claims/country',-1234),(104,1,'http://wso2.org/claims/created',-1234),(33,1,'http://wso2.org/claims/department',-1234),(4,1,'http://wso2.org/claims/displayName',-1234),(85,1,'http://wso2.org/claims/dob',-1234),(37,1,'http://wso2.org/claims/emailaddress',-1234),(88,1,'http://wso2.org/claims/emails.home',-1234),(32,1,'http://wso2.org/claims/emails.other',-1234),(41,1,'http://wso2.org/claims/emails.work',-1234),(80,1,'http://wso2.org/claims/entitlements',-1234),(73,1,'http://wso2.org/claims/extendedDisplayName',-1234),(20,1,'http://wso2.org/claims/extendedExternalId',-1234),(103,1,'http://wso2.org/claims/extendedRef',-1234),(55,1,'http://wso2.org/claims/externalid',-1234),(59,1,'http://wso2.org/claims/formattedName',-1234),(10,1,'http://wso2.org/claims/fullname',-1234),(107,1,'http://wso2.org/claims/gender',-1234),(71,1,'http://wso2.org/claims/givenname',-1234),(76,1,'http://wso2.org/claims/groups',-1234),(75,1,'http://wso2.org/claims/gtalk',-1234),(11,1,'http://wso2.org/claims/honorificPrefix',-1234),(48,1,'http://wso2.org/claims/honorificSuffix',-1234),(100,1,'http://wso2.org/claims/identity/accountConfirmedTime',-1234),(70,1,'http://wso2.org/claims/identity/accountDisabled',-1234),(31,1,'http://wso2.org/claims/identity/accountLocked',-1234),(109,1,'http://wso2.org/claims/identity/accountState',-1234),(101,1,'http://wso2.org/claims/identity/adminForcedPasswordReset',-1234),(62,1,'http://wso2.org/claims/identity/askPassword',-1234),(45,1,'http://wso2.org/claims/identity/backupCodeEnabled',-1234),(79,1,'http://wso2.org/claims/identity/backupCodes',-1234),(69,1,'http://wso2.org/claims/identity/emailaddress.pendingValue',-1234),(29,1,'http://wso2.org/claims/identity/emailotp_disabled',-1234),(95,1,'http://wso2.org/claims/identity/emailVerified',-1234),(28,1,'http://wso2.org/claims/identity/enabledAuthenticators',-1234),(30,1,'http://wso2.org/claims/identity/failedBackupCodeAttempts',-1234),(47,1,'http://wso2.org/claims/identity/failedEmailOtpAttempts',-1234),(74,1,'http://wso2.org/claims/identity/failedLoginAttempts',-1234),(82,1,'http://wso2.org/claims/identity/failedLoginAttemptsBeforeSuccess',-1234),(5,1,'http://wso2.org/claims/identity/failedLoginLockoutCount',-1234),(65,1,'http://wso2.org/claims/identity/failedPasswordRecoveryAttempts',-1234),(106,1,'http://wso2.org/claims/identity/failedSmsOtpAttempts',-1234),(105,1,'http://wso2.org/claims/identity/failedTotpAttempts',-1234),(72,1,'http://wso2.org/claims/identity/isLiteUser',-1234),(60,1,'http://wso2.org/claims/identity/isReadOnlyUser',-1234),(23,1,'http://wso2.org/claims/identity/lastLoginTime',-1234),(17,1,'http://wso2.org/claims/identity/lastLogonTime',-1234),(81,1,'http://wso2.org/claims/identity/lastPasswordUpdateTime',-1234),(9,1,'http://wso2.org/claims/identity/lockedReason',-1234),(94,1,'http://wso2.org/claims/identity/mobileNumber.pendingValue',-1234),(49,1,'http://wso2.org/claims/identity/phoneVerified',-1234),(24,1,'http://wso2.org/claims/identity/preferredChannel',-1234),(53,1,'http://wso2.org/claims/identity/secretkey',-1234),(61,1,'http://wso2.org/claims/identity/smsotp_disabled',-1234),(39,1,'http://wso2.org/claims/identity/tenantAdminAskPassword',-1234),(15,1,'http://wso2.org/claims/identity/totpEnabled',-1234),(44,1,'http://wso2.org/claims/identity/unlockTime',-1234),(7,1,'http://wso2.org/claims/identity/userSourceId',-1234),(54,1,'http://wso2.org/claims/identity/verifyEmail',-1234),(52,1,'http://wso2.org/claims/identity/verifyMobile',-1234),(89,1,'http://wso2.org/claims/identity/verifySecretkey',-1234),(35,1,'http://wso2.org/claims/im',-1234),(22,1,'http://wso2.org/claims/lastname',-1234),(1,1,'http://wso2.org/claims/local',-1234),(2,1,'http://wso2.org/claims/locality',-1234),(26,1,'http://wso2.org/claims/location',-1234),(96,1,'http://wso2.org/claims/metadata.version',-1234),(16,1,'http://wso2.org/claims/middleName',-1234),(6,1,'http://wso2.org/claims/mobile',-1234),(58,1,'http://wso2.org/claims/modified',-1234),(8,1,'http://wso2.org/claims/nickname',-1234),(91,1,'http://wso2.org/claims/oneTimePassword',-1234),(40,1,'http://wso2.org/claims/organization',-1234),(98,1,'http://wso2.org/claims/otherphone',-1234),(84,1,'http://wso2.org/claims/phoneNumbers',-1234),(57,1,'http://wso2.org/claims/phoneNumbers.fax',-1234),(64,1,'http://wso2.org/claims/phoneNumbers.home',-1234),(86,1,'http://wso2.org/claims/phoneNumbers.other',-1234),(110,1,'http://wso2.org/claims/phoneNumbers.pager',-1234),(46,1,'http://wso2.org/claims/phoneNumbers.work',-1234),(78,1,'http://wso2.org/claims/photos',-1234),(34,1,'http://wso2.org/claims/photourl',-1234),(36,1,'http://wso2.org/claims/postalcode',-1234),(19,1,'http://wso2.org/claims/preferredLanguage',-1234),(50,1,'http://wso2.org/claims/primaryChallengeQuestion',-1234),(14,1,'http://wso2.org/claims/region',-1234),(93,1,'http://wso2.org/claims/resourceType',-1234),(108,1,'http://wso2.org/claims/role',-1234),(38,1,'http://wso2.org/claims/roles',-1234),(12,1,'http://wso2.org/claims/skype',-1234),(90,1,'http://wso2.org/claims/stateorprovince',-1234),(67,1,'http://wso2.org/claims/streetaddress',-1234),(68,1,'http://wso2.org/claims/telephone',-1234),(99,1,'http://wso2.org/claims/thumbnail',-1234),(21,1,'http://wso2.org/claims/timeZone',-1234),(102,1,'http://wso2.org/claims/title',-1234),(42,1,'http://wso2.org/claims/url',-1234),(66,1,'http://wso2.org/claims/userid',-1234),(18,1,'http://wso2.org/claims/username',-1234),(87,1,'http://wso2.org/claims/userprincipal',-1234),(97,1,'http://wso2.org/claims/userType',-1234),(83,1,'http://wso2.org/claims/websiteurl',-1234),(77,1,'http://wso2.org/claims/x509Certificates',-1234),(322,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/country',-1234),(201,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/dateofbirth',-1234),(320,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress',-1234),(195,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/gender',-1234),(193,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname',-1234),(265,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/homephone',-1234),(157,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/locality',-1234),(189,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobile',-1234),(177,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nickname',-1234),(290,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/otherphone',-1234),(245,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/postalcode',-1234),(228,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/privatepersonalidentifier',-1234),(171,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/stateorprovince',-1234),(112,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/streetaddress',-1234),(227,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname',-1234),(139,3,'urn:scim:schemas:core:1.0:active',-1234),(238,3,'urn:scim:schemas:core:1.0:addresses',-1234),(220,3,'urn:scim:schemas:core:1.0:addresses.country',-1234),(167,3,'urn:scim:schemas:core:1.0:addresses.formatted',-1234),(279,3,'urn:scim:schemas:core:1.0:addresses.locality',-1234),(254,3,'urn:scim:schemas:core:1.0:addresses.postalCode',-1234),(196,3,'urn:scim:schemas:core:1.0:addresses.region',-1234),(271,3,'urn:scim:schemas:core:1.0:addresses.streetAddress',-1234),(283,3,'urn:scim:schemas:core:1.0:displayName',-1234),(300,3,'urn:scim:schemas:core:1.0:emails',-1234),(198,3,'urn:scim:schemas:core:1.0:emails.home',-1234),(222,3,'urn:scim:schemas:core:1.0:emails.other',-1234),(301,3,'urn:scim:schemas:core:1.0:emails.work',-1234),(281,3,'urn:scim:schemas:core:1.0:entitlements',-1234),(154,3,'urn:scim:schemas:core:1.0:externalId',-1234),(151,3,'urn:scim:schemas:core:1.0:groups',-1234),(272,3,'urn:scim:schemas:core:1.0:id',-1234),(205,3,'urn:scim:schemas:core:1.0:ims',-1234),(253,3,'urn:scim:schemas:core:1.0:ims.gtalk',-1234),(182,3,'urn:scim:schemas:core:1.0:ims.skype',-1234),(118,3,'urn:scim:schemas:core:1.0:locale',-1234),(208,3,'urn:scim:schemas:core:1.0:meta.created',-1234),(148,3,'urn:scim:schemas:core:1.0:meta.lastModified',-1234),(233,3,'urn:scim:schemas:core:1.0:meta.location',-1234),(202,3,'urn:scim:schemas:core:1.0:name.familyName',-1234),(327,3,'urn:scim:schemas:core:1.0:name.formatted',-1234),(121,3,'urn:scim:schemas:core:1.0:name.givenName',-1234),(277,3,'urn:scim:schemas:core:1.0:name.honorificPrefix',-1234),(143,3,'urn:scim:schemas:core:1.0:name.honorificSuffix',-1234),(280,3,'urn:scim:schemas:core:1.0:name.middleName',-1234),(309,3,'urn:scim:schemas:core:1.0:nickName',-1234),(123,3,'urn:scim:schemas:core:1.0:phoneNumbers',-1234),(329,3,'urn:scim:schemas:core:1.0:phoneNumbers.fax',-1234),(152,3,'urn:scim:schemas:core:1.0:phoneNumbers.home',-1234),(229,3,'urn:scim:schemas:core:1.0:phoneNumbers.mobile',-1234),(184,3,'urn:scim:schemas:core:1.0:phoneNumbers.other',-1234),(140,3,'urn:scim:schemas:core:1.0:phoneNumbers.pager',-1234),(226,3,'urn:scim:schemas:core:1.0:phoneNumbers.work',-1234),(144,3,'urn:scim:schemas:core:1.0:photos',-1234),(115,3,'urn:scim:schemas:core:1.0:photos.photo',-1234),(133,3,'urn:scim:schemas:core:1.0:photos.thumbnail',-1234),(183,3,'urn:scim:schemas:core:1.0:preferredLanguage',-1234),(200,3,'urn:scim:schemas:core:1.0:profileUrl',-1234),(155,3,'urn:scim:schemas:core:1.0:roles',-1234),(113,3,'urn:scim:schemas:core:1.0:timeZone',-1234),(263,3,'urn:scim:schemas:core:1.0:title',-1234),(176,3,'urn:scim:schemas:core:1.0:userName',-1234),(137,3,'urn:scim:schemas:core:1.0:userType',-1234),(204,3,'urn:scim:schemas:core:1.0:x509Certificates',-1234),(231,4,'urn:ietf:params:scim:schemas:core:2.0:User:active',-1234),(160,4,'urn:ietf:params:scim:schemas:core:2.0:User:addresses',-1234),(276,4,'urn:ietf:params:scim:schemas:core:2.0:User:addresses.home',-1234),(188,4,'urn:ietf:params:scim:schemas:core:2.0:User:addresses.work',-1234),(145,4,'urn:ietf:params:scim:schemas:core:2.0:User:displayName',-1234),(129,4,'urn:ietf:params:scim:schemas:core:2.0:User:emails',-1234),(138,4,'urn:ietf:params:scim:schemas:core:2.0:User:emails.home',-1234),(268,4,'urn:ietf:params:scim:schemas:core:2.0:User:emails.other',-1234),(219,4,'urn:ietf:params:scim:schemas:core:2.0:User:emails.work',-1234),(156,4,'urn:ietf:params:scim:schemas:core:2.0:User:entitlements.default',-1234),(275,4,'urn:ietf:params:scim:schemas:core:2.0:User:groups',-1234),(288,4,'urn:ietf:params:scim:schemas:core:2.0:User:ims.gtalk',-1234),(211,4,'urn:ietf:params:scim:schemas:core:2.0:User:ims.skype',-1234),(252,4,'urn:ietf:params:scim:schemas:core:2.0:User:locale',-1234),(131,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.familyName',-1234),(150,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.formatted',-1234),(318,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.givenName',-1234),(251,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.honorificPrefix',-1234),(170,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.honorificSuffix',-1234),(187,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.middleName',-1234),(296,4,'urn:ietf:params:scim:schemas:core:2.0:User:nickName',-1234),(130,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers',-1234),(314,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.home',-1234),(321,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.mobile',-1234),(270,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.other',-1234),(217,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.work',-1234),(274,4,'urn:ietf:params:scim:schemas:core:2.0:User:photos',-1234),(132,4,'urn:ietf:params:scim:schemas:core:2.0:User:photos.photo',-1234),(247,4,'urn:ietf:params:scim:schemas:core:2.0:User:photos.thumbnail',-1234),(260,4,'urn:ietf:params:scim:schemas:core:2.0:User:preferredLanguage',-1234),(325,4,'urn:ietf:params:scim:schemas:core:2.0:User:profileUrl',-1234),(299,4,'urn:ietf:params:scim:schemas:core:2.0:User:roles.default',-1234),(169,4,'urn:ietf:params:scim:schemas:core:2.0:User:timezone',-1234),(136,4,'urn:ietf:params:scim:schemas:core:2.0:User:title',-1234),(168,4,'urn:ietf:params:scim:schemas:core:2.0:User:userName',-1234),(292,4,'urn:ietf:params:scim:schemas:core:2.0:User:userType',-1234),(149,4,'urn:ietf:params:scim:schemas:core:2.0:User:x509Certificates.default',-1234),(223,5,'address',-1234),(315,5,'birthdate',-1234),(232,5,'country',-1234),(246,5,'email',-1234),(135,5,'email_verified',-1234),(267,5,'family_name',-1234),(240,5,'formatted',-1234),(111,5,'gender',-1234),(257,5,'given_name',-1234),(221,5,'groups',-1234),(286,5,'locale',-1234),(259,5,'locality',-1234),(163,5,'middle_name',-1234),(285,5,'name',-1234),(178,5,'nickname',-1234),(302,5,'phone_number',-1234),(209,5,'phone_number_verified',-1234),(147,5,'picture',-1234),(218,5,'postal_code',-1234),(162,5,'preferred_username',-1234),(206,5,'profile',-1234),(266,5,'region',-1234),(216,5,'roles',-1234),(295,5,'street_address',-1234),(324,5,'updated_at',-1234),(249,5,'upn',-1234),(308,5,'username',-1234),(298,5,'website',-1234),(141,5,'zoneinfo',-1234),(230,6,'http://eidas.europa.eu/attributes/legalperson/D-2012-17-EUIdentifier',-1234),(128,6,'http://eidas.europa.eu/attributes/legalperson/EORI',-1234),(120,6,'http://eidas.europa.eu/attributes/legalperson/LegalName',-1234),(210,6,'http://eidas.europa.eu/attributes/legalperson/LegalPersonAddress',-1234),(173,6,'http://eidas.europa.eu/attributes/legalperson/LegalPersonIdentifier',-1234),(215,6,'http://eidas.europa.eu/attributes/legalperson/LEI',-1234),(244,6,'http://eidas.europa.eu/attributes/legalperson/SEED',-1234),(317,6,'http://eidas.europa.eu/attributes/legalperson/SIC',-1234),(179,6,'http://eidas.europa.eu/attributes/legalperson/TaxReference',-1234),(287,6,'http://eidas.europa.eu/attributes/legalperson/VATRegistrationNumber',-1234),(134,7,'country',-1234),(117,7,'dob',-1234),(194,7,'email',-1234),(190,7,'fullname',-1234),(174,7,'gender',-1234),(175,7,'language',-1234),(248,7,'nickname',-1234),(127,7,'postcode',-1234),(158,7,'timezone',-1234),(213,8,'http://eidas.europa.eu/attributes/naturalperson/BirthName',-1234),(316,8,'http://eidas.europa.eu/attributes/naturalperson/CurrentAddress',-1234),(161,8,'http://eidas.europa.eu/attributes/naturalperson/CurrentFamilyName',-1234),(186,8,'http://eidas.europa.eu/attributes/naturalperson/CurrentGivenName',-1234),(291,8,'http://eidas.europa.eu/attributes/naturalperson/DateOfBirth',-1234),(303,8,'http://eidas.europa.eu/attributes/naturalperson/Gender',-1234),(256,8,'http://eidas.europa.eu/attributes/naturalperson/PersonIdentifier',-1234),(122,8,'http://eidas.europa.eu/attributes/naturalperson/PlaceOfBirth',-1234),(165,9,'urn:ietf:params:scim:schemas:core:2.0:externalId',-1234),(307,9,'urn:ietf:params:scim:schemas:core:2.0:id',-1234),(284,9,'urn:ietf:params:scim:schemas:core:2.0:meta.created',-1234),(199,9,'urn:ietf:params:scim:schemas:core:2.0:meta.lastModified',-1234),(197,9,'urn:ietf:params:scim:schemas:core:2.0:meta.location',-1234),(181,9,'urn:ietf:params:scim:schemas:core:2.0:meta.resourceType',-1234),(203,9,'urn:ietf:params:scim:schemas:core:2.0:meta.version',-1234),(172,9,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.fax',-1234),(328,9,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.pager',-1234),(323,10,'http://axschema.org/birthDate',-1234),(214,10,'http://axschema.org/contact/country/home',-1234),(289,10,'http://axschema.org/contact/email',-1234),(180,10,'http://axschema.org/contact/postalCode/home',-1234),(258,10,'http://axschema.org/namePerson/first',-1234),(191,10,'http://axschema.org/namePerson/last',-1234),(261,10,'http://axschema.org/person/gender',-1234),(166,10,'http://axschema.org/pref/language',-1234),(262,10,'http://axschema.org/pref/timezone',-1234),(306,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:accountDisabled',-1234),(294,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:accountLocked',-1234),(250,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:accountState',-1234),(239,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:askPassword',-1234),(192,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:backupCodeEnabled',-1234),(269,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:costCenter',-1234),(225,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:country',-1234),(207,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:dateOfBirth',-1234),(310,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:department',-1234),(242,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:division',-1234),(125,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:emailOTPDisabled',-1234),(255,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:emailVerified',-1234),(164,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:employeeNumber',-1234),(264,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:failedBackupCodeAttempts',-1234),(273,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:failedEmailOTPAttempts',-1234),(236,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:failedLoginAttempts',-1234),(241,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:failedLoginAttemptsBeforeSuccess',-1234),(311,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:failedLoginLockoutCount',-1234),(313,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:failedPasswordRecoveryAttempts',-1234),(312,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:failedSMSOTPAttempts',-1234),(304,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:failedTOTPAttempts',-1234),(116,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:forcePasswordReset',-1234),(237,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:isLiteUser',-1234),(124,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:isReadOnlyUser',-1234),(282,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:lastLoginTime',-1234),(146,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:lastLogonTime',-1234),(319,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:lastPasswordUpdateTime',-1234),(119,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:lockedReason',-1234),(234,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:manager.$ref',-1234),(293,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:manager.displayName',-1234),(114,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:manager.value',-1234),(185,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:oneTimePassword',-1234),(126,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:organization',-1234),(305,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:pendingEmails.value',-1234),(243,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:pendingMobileNumber',-1234),(297,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:phoneVerified',-1234),(159,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:preferredChannel',-1234),(326,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:smsOTPDisabled',-1234),(224,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:tenantAdminAskPassword',-1234),(212,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:totpEnabled',-1234),(278,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:unlockTime',-1234),(153,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:userSourceId',-1234),(235,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:verifyEmail',-1234),(142,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:verifyMobile',-1234);
/*!40000 ALTER TABLE `IDN_CLAIM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM_DIALECT`
--

DROP TABLE IF EXISTS `IDN_CLAIM_DIALECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CLAIM_DIALECT` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DIALECT_URI` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DIALECT_URI_CONSTRAINT` (`DIALECT_URI`,`TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM_DIALECT`
--

LOCK TABLES `IDN_CLAIM_DIALECT` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM_DIALECT` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM_DIALECT` VALUES (10,'http://axschema.org',-1234),(6,'http://eidas.europa.eu/attributes/legalperson',-1234),(8,'http://eidas.europa.eu/attributes/naturalperson',-1234),(7,'http://schema.openid.net/2007/05/claims',-1234),(2,'http://schemas.xmlsoap.org/ws/2005/05/identity',-1234),(1,'http://wso2.org/claims',-1234),(5,'http://wso2.org/oidc/claim',-1234),(9,'urn:ietf:params:scim:schemas:core:2.0',-1234),(4,'urn:ietf:params:scim:schemas:core:2.0:User',-1234),(11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User',-1234),(3,'urn:scim:schemas:core:1.0',-1234);
/*!40000 ALTER TABLE `IDN_CLAIM_DIALECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM_MAPPED_ATTRIBUTE`
--

DROP TABLE IF EXISTS `IDN_CLAIM_MAPPED_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CLAIM_MAPPED_ATTRIBUTE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LOCAL_CLAIM_ID` int DEFAULT NULL,
  `USER_STORE_DOMAIN_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ATTRIBUTE_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_STORE_DOMAIN_CONSTRAINT` (`LOCAL_CLAIM_ID`,`USER_STORE_DOMAIN_NAME`,`TENANT_ID`),
  CONSTRAINT `IDN_CLAIM_MAPPED_ATTRIBUTE_ibfk_1` FOREIGN KEY (`LOCAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM_MAPPED_ATTRIBUTE`
--

LOCK TABLES `IDN_CLAIM_MAPPED_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM_MAPPED_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM_MAPPED_ATTRIBUTE` VALUES (1,1,'PRIMARY','local',-1234),(2,2,'PRIMARY','localityAddress',-1234),(3,3,'PRIMARY','country',-1234),(4,4,'PRIMARY','displayName',-1234),(5,5,'PRIMARY','failedLockoutCount',-1234),(6,6,'PRIMARY','mobile',-1234),(7,7,'PRIMARY','userSourceId',-1234),(8,8,'PRIMARY','nickName',-1234),(9,9,'PRIMARY','lockedReason',-1234),(10,10,'PRIMARY','cn',-1234),(11,11,'PRIMARY','honoricPrefix',-1234),(12,12,'PRIMARY','imSkype',-1234),(13,13,'PRIMARY','addresses',-1234),(14,14,'PRIMARY','region',-1234),(15,15,'PRIMARY','totpEnabled',-1234),(16,16,'PRIMARY','middleName',-1234),(17,17,'PRIMARY','lastLogonTime',-1234),(18,18,'PRIMARY','uid',-1234),(19,19,'PRIMARY','preferredLanguage',-1234),(20,20,'PRIMARY','extendedExternalId',-1234),(21,21,'PRIMARY','timeZone',-1234),(22,22,'PRIMARY','sn',-1234),(23,23,'PRIMARY','lastLoginTime',-1234),(24,24,'PRIMARY','preferredChannel',-1234),(25,25,'PRIMARY','costCenter',-1234),(26,26,'PRIMARY','location',-1234),(27,27,'PRIMARY','challengeQuestionUris',-1234),(28,28,'PRIMARY','enabledAuthenticators',-1234),(29,29,'PRIMARY','emailOTPDisabled',-1234),(30,30,'PRIMARY','failedBackupCodeAttempts',-1234),(31,31,'PRIMARY','accountLock',-1234),(32,32,'PRIMARY','otherEmail',-1234),(33,33,'PRIMARY','departmentNumber',-1234),(34,34,'PRIMARY','photoUrl',-1234),(35,35,'PRIMARY','im',-1234),(36,36,'PRIMARY','postalcode',-1234),(37,37,'PRIMARY','mail',-1234),(38,38,'PRIMARY','roles',-1234),(39,39,'PRIMARY','tenantAdminAskPassword',-1234),(40,40,'PRIMARY','organizationName',-1234),(41,41,'PRIMARY','workEmail',-1234),(42,42,'PRIMARY','url',-1234),(43,43,'PRIMARY','localityAddress',-1234),(44,44,'PRIMARY','unlockTime',-1234),(45,45,'PRIMARY','backupCodeEnabled',-1234),(46,46,'PRIMARY','workPhone',-1234),(47,47,'PRIMARY','failedEmailOtpAttempts',-1234),(48,48,'PRIMARY','honoricSuffix',-1234),(49,49,'PRIMARY','phoneVerified',-1234),(50,50,'PRIMARY','primaryChallengeQuestion',-1234),(51,51,'PRIMARY','formattedAddress',-1234),(52,52,'PRIMARY','verifyMobile',-1234),(53,53,'PRIMARY','totpSecretkey',-1234),(54,54,'PRIMARY','verifyEmail',-1234),(55,55,'PRIMARY','externalId',-1234),(56,56,'PRIMARY','firstChallenge',-1234),(57,57,'PRIMARY','fax',-1234),(58,58,'PRIMARY','lastModifiedDate',-1234),(59,59,'PRIMARY','formattedName',-1234),(60,60,'PRIMARY','isReadOnlyUser',-1234),(61,61,'PRIMARY','smsOTPDisabled',-1234),(62,62,'PRIMARY','askPassword',-1234),(63,63,'PRIMARY','secondChallenge',-1234),(64,64,'PRIMARY','homePhone',-1234),(65,65,'PRIMARY','failedRecoveryAttempts',-1234),(66,66,'PRIMARY','scimId',-1234),(67,67,'PRIMARY','streetAddress',-1234),(68,68,'PRIMARY','telephoneNumber',-1234),(69,69,'PRIMARY','pendingEmailAddress',-1234),(70,70,'PRIMARY','accountDisabled',-1234),(71,71,'PRIMARY','givenName',-1234),(72,72,'PRIMARY','isLiteUser',-1234),(73,73,'PRIMARY','extendedDisplayName',-1234),(74,74,'PRIMARY','failedLoginAttempts',-1234),(75,75,'PRIMARY','imGtalk',-1234),(76,76,'PRIMARY','groups',-1234),(77,77,'PRIMARY','x509Certificates',-1234),(78,78,'PRIMARY','photos',-1234),(79,79,'PRIMARY','backupCodes',-1234),(80,80,'PRIMARY','entitlements',-1234),(81,81,'PRIMARY','lastPasswordUpdate',-1234),(82,82,'PRIMARY','failedLoginAttemptsBeforeSuccess',-1234),(83,83,'PRIMARY','websiteUrl',-1234),(84,84,'PRIMARY','phoneNumbers',-1234),(85,85,'PRIMARY','dateOfBirth',-1234),(86,86,'PRIMARY','otherPhoneNumber',-1234),(87,87,'PRIMARY','uid',-1234),(88,88,'PRIMARY','homeEmail',-1234),(89,89,'PRIMARY','verifySecretkey',-1234),(90,90,'PRIMARY','stateOrProvinceName',-1234),(91,91,'PRIMARY','oneTimePassword',-1234),(92,92,'PRIMARY','active',-1234),(93,93,'PRIMARY','resourceType',-1234),(94,94,'PRIMARY','pendingMobileNumber',-1234),(95,95,'PRIMARY','emailVerified',-1234),(96,96,'PRIMARY','meta.version',-1234),(97,97,'PRIMARY','userType',-1234),(98,98,'PRIMARY','otherPhone',-1234),(99,99,'PRIMARY','thumbnail',-1234),(100,100,'PRIMARY','confirmedTime',-1234),(101,101,'PRIMARY','forcePasswordReset',-1234),(102,102,'PRIMARY','title',-1234),(103,103,'PRIMARY','extendedRef',-1234),(104,104,'PRIMARY','createdDate',-1234),(105,105,'PRIMARY','failedTotpAttempts',-1234),(106,106,'PRIMARY','failedSmsOtpAttempts',-1234),(107,107,'PRIMARY','gender',-1234),(108,108,'PRIMARY','role',-1234),(109,109,'PRIMARY','accountState',-1234),(110,110,'PRIMARY','pager',-1234);
/*!40000 ALTER TABLE `IDN_CLAIM_MAPPED_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `IDN_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CLAIM_MAPPING` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EXT_CLAIM_ID` int NOT NULL,
  `MAPPED_LOCAL_CLAIM_ID` int NOT NULL,
  `TENANT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EXT_TO_LOC_MAPPING_CONSTRN` (`EXT_CLAIM_ID`,`TENANT_ID`),
  KEY `MAPPED_LOCAL_CLAIM_ID` (`MAPPED_LOCAL_CLAIM_ID`),
  CONSTRAINT `IDN_CLAIM_MAPPING_ibfk_1` FOREIGN KEY (`EXT_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_CLAIM_MAPPING_ibfk_2` FOREIGN KEY (`MAPPED_LOCAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM_MAPPING`
--

LOCK TABLES `IDN_CLAIM_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM_MAPPING` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM_MAPPING` VALUES (1,111,107,-1234),(2,112,67,-1234),(3,113,21,-1234),(4,114,107,-1234),(5,115,34,-1234),(6,116,101,-1234),(7,117,85,-1234),(8,118,1,-1234),(9,119,9,-1234),(10,120,73,-1234),(11,121,71,-1234),(12,122,3,-1234),(13,123,84,-1234),(14,124,60,-1234),(15,125,29,-1234),(16,126,40,-1234),(17,127,36,-1234),(18,128,33,-1234),(19,129,37,-1234),(20,130,84,-1234),(21,131,22,-1234),(22,132,34,-1234),(23,133,99,-1234),(24,134,3,-1234),(25,135,95,-1234),(26,136,102,-1234),(27,137,97,-1234),(28,138,88,-1234),(29,139,92,-1234),(30,140,110,-1234),(31,141,21,-1234),(32,142,52,-1234),(33,143,48,-1234),(34,144,78,-1234),(35,145,4,-1234),(36,146,17,-1234),(37,147,34,-1234),(38,148,58,-1234),(39,149,77,-1234),(40,150,59,-1234),(41,151,76,-1234),(42,152,64,-1234),(43,153,7,-1234),(44,154,55,-1234),(45,155,108,-1234),(46,156,80,-1234),(47,157,2,-1234),(48,158,21,-1234),(49,159,24,-1234),(50,160,13,-1234),(51,161,22,-1234),(52,162,4,-1234),(53,163,16,-1234),(54,164,20,-1234),(55,165,55,-1234),(56,166,19,-1234),(57,167,51,-1234),(58,168,18,-1234),(59,169,21,-1234),(60,170,48,-1234),(61,171,90,-1234),(62,172,57,-1234),(63,173,20,-1234),(64,174,107,-1234),(65,175,19,-1234),(66,176,18,-1234),(67,177,8,-1234),(68,178,8,-1234),(69,179,36,-1234),(70,180,36,-1234),(71,181,93,-1234),(72,182,12,-1234),(73,183,19,-1234),(74,184,86,-1234),(75,185,91,-1234),(76,186,71,-1234),(77,187,16,-1234),(78,188,14,-1234),(79,189,6,-1234),(80,190,10,-1234),(81,191,22,-1234),(82,192,45,-1234),(83,193,71,-1234),(84,194,37,-1234),(85,195,107,-1234),(86,196,14,-1234),(87,197,26,-1234),(88,198,88,-1234),(89,199,58,-1234),(90,200,42,-1234),(91,201,85,-1234),(92,202,22,-1234),(93,203,96,-1234),(94,204,77,-1234),(95,205,35,-1234),(96,206,42,-1234),(97,207,85,-1234),(98,208,104,-1234),(99,209,49,-1234),(100,210,13,-1234),(101,211,12,-1234),(102,212,15,-1234),(103,213,18,-1234),(104,214,3,-1234),(105,215,103,-1234),(106,216,38,-1234),(107,217,46,-1234),(108,218,36,-1234),(109,219,41,-1234),(110,220,3,-1234),(111,221,76,-1234),(112,222,32,-1234),(113,223,13,-1234),(114,224,39,-1234),(115,225,3,-1234),(116,226,46,-1234),(117,227,22,-1234),(118,228,35,-1234),(119,229,6,-1234),(120,230,55,-1234),(121,231,92,-1234),(122,232,3,-1234),(123,233,26,-1234),(124,234,103,-1234),(125,235,54,-1234),(126,236,74,-1234),(127,237,72,-1234),(128,238,13,-1234),(129,239,62,-1234),(130,240,51,-1234),(131,241,82,-1234),(132,242,90,-1234),(133,243,94,-1234),(134,244,8,-1234),(135,245,36,-1234),(136,246,37,-1234),(137,247,99,-1234),(138,248,8,-1234),(139,249,87,-1234),(140,250,109,-1234),(141,251,11,-1234),(142,252,1,-1234),(143,253,75,-1234),(144,254,36,-1234),(145,255,95,-1234),(146,256,66,-1234),(147,257,71,-1234),(148,258,71,-1234),(149,259,2,-1234),(150,260,19,-1234),(151,261,107,-1234),(152,262,21,-1234),(153,263,102,-1234),(154,264,30,-1234),(155,265,64,-1234),(156,266,14,-1234),(157,267,22,-1234),(158,268,32,-1234),(159,269,25,-1234),(160,270,86,-1234),(161,271,67,-1234),(162,272,66,-1234),(163,273,47,-1234),(164,274,78,-1234),(165,275,76,-1234),(166,276,43,-1234),(167,277,11,-1234),(168,278,44,-1234),(169,279,43,-1234),(170,280,16,-1234),(171,281,80,-1234),(172,282,23,-1234),(173,283,4,-1234),(174,284,104,-1234),(175,285,10,-1234),(176,286,1,-1234),(177,287,35,-1234),(178,288,75,-1234),(179,289,37,-1234),(180,290,98,-1234),(181,291,85,-1234),(182,292,97,-1234),(183,293,73,-1234),(184,294,31,-1234),(185,295,67,-1234),(186,296,8,-1234),(187,297,49,-1234),(188,298,83,-1234),(189,299,38,-1234),(190,300,37,-1234),(191,301,41,-1234),(192,302,68,-1234),(193,303,107,-1234),(194,304,105,-1234),(195,305,69,-1234),(196,306,70,-1234),(197,307,66,-1234),(198,308,18,-1234),(199,309,8,-1234),(200,310,33,-1234),(201,311,5,-1234),(202,312,106,-1234),(203,313,65,-1234),(204,314,64,-1234),(205,315,85,-1234),(206,316,13,-1234),(207,317,8,-1234),(208,318,71,-1234),(209,319,81,-1234),(210,320,37,-1234),(211,321,6,-1234),(212,322,3,-1234),(213,323,85,-1234),(214,324,58,-1234),(215,325,42,-1234),(216,326,61,-1234),(217,327,59,-1234),(218,328,110,-1234),(219,329,57,-1234);
/*!40000 ALTER TABLE `IDN_CLAIM_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM_PROPERTY`
--

DROP TABLE IF EXISTS `IDN_CLAIM_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CLAIM_PROPERTY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LOCAL_CLAIM_ID` int DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PROPERTY_VALUE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PROPERTY_NAME_CONSTRAINT` (`LOCAL_CLAIM_ID`,`PROPERTY_NAME`,`TENANT_ID`),
  CONSTRAINT `IDN_CLAIM_PROPERTY_ibfk_1` FOREIGN KEY (`LOCAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1432 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM_PROPERTY`
--

LOCK TABLES `IDN_CLAIM_PROPERTY` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM_PROPERTY` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM_PROPERTY` VALUES (1,1,'Description','Local',-1234),(2,1,'DisplayName','Local',-1234),(3,2,'Description','Locality',-1234),(4,2,'DisplayName','Locality',-1234),(5,3,'Description','Country',-1234),(6,3,'DisplayOrder','5',-1234),(7,3,'SupportedByDefault','true',-1234),(8,3,'DisplayName','Country',-1234),(9,4,'Description','Display Name',-1234),(10,4,'DisplayName','Display Name',-1234),(11,5,'Description','Failed Lockout Count',-1234),(12,5,'DisplayName','Failed Lockout Count',-1234),(13,6,'Description','Mobile',-1234),(14,6,'DisplayOrder','8',-1234),(15,6,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(16,6,'SupportedByDefault','true',-1234),(17,6,'DisplayName','Mobile',-1234),(18,7,'Description','Claim to represent the provisioned IDP ID of the user.',-1234),(19,7,'DisplayName','User Source ID',-1234),(20,8,'Description','Nick Name',-1234),(21,8,'DisplayName','Nick Name',-1234),(22,9,'Description','Locked Reason',-1234),(23,9,'DisplayName','Locked Reason',-1234),(24,10,'Description','Full Name',-1234),(25,10,'DisplayName','Full Name',-1234),(26,11,'Description','Honoric Prefix',-1234),(27,11,'DisplayName','Name - Honoric Prefix',-1234),(28,12,'Description','IM - Skype',-1234),(29,12,'DisplayName','IM - Skype',-1234),(30,13,'Description','Address',-1234),(31,13,'DisplayName','Address',-1234),(32,14,'Description','Region',-1234),(33,14,'DisplayName','Region',-1234),(34,15,'Description','Claim to represent whether user has configured TOTP Authenticator',-1234),(35,15,'DisplayName','TOTP Enabled',-1234),(36,16,'Description','Middle Name',-1234),(37,16,'DisplayName','Middle Name',-1234),(38,17,'Description','Last Logon Time',-1234),(39,17,'DisplayName','Last Logon',-1234),(40,18,'Description','Username',-1234),(41,18,'DisplayName','Username',-1234),(42,19,'Description','Preferred Language',-1234),(43,19,'DisplayName','Preferred Language',-1234),(44,20,'Description','Extended External ID',-1234),(45,20,'DisplayName','Extended External ID',-1234),(46,21,'Description','Time Zone',-1234),(47,21,'DisplayName','Time Zone',-1234),(48,22,'Description','Last Name',-1234),(49,22,'DisplayOrder','2',-1234),(50,22,'Required','true',-1234),(51,22,'SupportedByDefault','true',-1234),(52,22,'DisplayName','Last Name',-1234),(53,23,'Description','Last Login Time',-1234),(54,23,'DisplayName','Last Login',-1234),(55,24,'Description','Preferred Notification Channel',-1234),(56,24,'DisplayName','Preferred Channel',-1234),(57,25,'Description','Cost Center',-1234),(58,25,'DisplayName','Cost Center',-1234),(59,26,'Description','Location',-1234),(60,26,'DisplayName','Location',-1234),(61,27,'Description','Challenge Question',-1234),(62,27,'DisplayName','Challenge Question',-1234),(63,28,'Description','Claim to represent enabled second factor authenticators in My Account.',-1234),(64,28,'DisplayName','Enabled Authenticators',-1234),(65,29,'Description','Claim to disable EmailOTP',-1234),(66,29,'DisplayName','Disable EmailOTP',-1234),(67,30,'Description','Claim to store failed Backup Code Attempts',-1234),(68,30,'DisplayName','Failed Backup Code Attempts',-1234),(69,31,'Description','Account Locked',-1234),(70,31,'DisplayName','Account Locked',-1234),(71,32,'Description','Other Email',-1234),(72,32,'DisplayName','Emails - Other Email',-1234),(73,33,'ReadOnly','true',-1234),(74,33,'Description','Department',-1234),(75,33,'SupportedByDefault','true',-1234),(76,33,'DisplayName','Department',-1234),(77,34,'Description','Photo URL',-1234),(78,34,'DisplayName','Photo URIL',-1234),(79,35,'Description','IM',-1234),(80,35,'DisplayOrder','9',-1234),(81,35,'DisplayName','IM',-1234),(82,36,'Description','Postal Code',-1234),(83,36,'DisplayName','Postal Code',-1234),(84,37,'Description','Email Address',-1234),(85,37,'DisplayOrder','6',-1234),(86,37,'Required','true',-1234),(87,37,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(88,37,'SupportedByDefault','true',-1234),(89,37,'DisplayName','Email',-1234),(90,38,'ReadOnly','true',-1234),(91,38,'Description','Roles',-1234),(92,38,'SupportedByDefault','true',-1234),(93,38,'DisplayName','Roles',-1234),(94,39,'Description','Temporary claim to invoke email tenant admin ask Password feature',-1234),(95,39,'DisplayName','Tenant Admin Ask Password',-1234),(96,40,'Description','Organization',-1234),(97,40,'DisplayOrder','3',-1234),(98,40,'SupportedByDefault','true',-1234),(99,40,'DisplayName','Organization',-1234),(100,41,'Description','Work Email',-1234),(101,41,'DisplayName','Emails - Work Email',-1234),(102,42,'Description','URL',-1234),(103,42,'DisplayOrder','10',-1234),(104,42,'SupportedByDefault','true',-1234),(105,42,'DisplayName','URL',-1234),(106,43,'Description','Address - Locality',-1234),(107,43,'DisplayName','Address - Locality',-1234),(108,44,'Description','Unlock Time',-1234),(109,44,'DisplayName','Unlock Time',-1234),(110,45,'Description','Claim to represent whether user has configured Backup Code authenticator',-1234),(111,45,'DisplayName','Backup Code Enabled',-1234),(112,46,'Description','Work Phone',-1234),(113,46,'DisplayName','Phone Numbers - Work Phone Number',-1234),(114,47,'Description','Failed Email OTP Attempts',-1234),(115,47,'DisplayName','Failed Email OTP Attempts',-1234),(116,48,'Description','Honoric Suffix',-1234),(117,48,'DisplayName','Name - Honoric Suffix',-1234),(118,49,'Description','Phone Verified',-1234),(119,49,'DisplayName','Phone Verified',-1234),(120,50,'Description','Primary Challenge Question',-1234),(121,50,'DisplayName','Primary Challenge Question',-1234),(122,51,'Description','Address - Formatted',-1234),(123,51,'DisplayName','Address - Formatted',-1234),(124,52,'Description','Temporary claim to invoke mobile verification feature',-1234),(125,52,'DisplayName','Verify Mobile',-1234),(126,53,'Description','Claim to store the secret key',-1234),(127,53,'DisplayName','Secret Key',-1234),(128,54,'Description','Temporary claim to invoke email verified feature',-1234),(129,54,'DisplayName','Verify Email',-1234),(130,55,'ReadOnly','true',-1234),(131,55,'Description','Unique ID of the user used in external systems',-1234),(132,55,'DisplayName','External User ID',-1234),(133,56,'Description','Challenge Question1',-1234),(134,56,'DisplayName','Challenge Question1',-1234),(135,57,'Description','Fax Number',-1234),(136,57,'DisplayName','Phone Numbers - Fax Number',-1234),(137,58,'ReadOnly','true',-1234),(138,58,'Description','Last Modified timestamp of the user',-1234),(139,58,'DisplayName','Last Modified Time',-1234),(140,59,'Description','Formatted Name',-1234),(141,59,'DisplayName','Name - Formatted Name',-1234),(142,60,'Description','Claim to store if the user is read only',-1234),(143,60,'DisplayName','Read Only User',-1234),(144,61,'Description','Claim to disable SMSOTP',-1234),(145,61,'DisplayName','Disable SMSOTP',-1234),(146,62,'Description','Temporary claim to invoke email ask Password feature',-1234),(147,62,'DisplayName','Ask Password',-1234),(148,63,'Description','Challenge Question2',-1234),(149,63,'DisplayName','Challenge Question2',-1234),(150,64,'Description','Home Phone',-1234),(151,64,'DisplayName','Phone Numbers - Home Phone Number',-1234),(152,65,'Description','Number of consecutive failed attempts done for password recovery',-1234),(153,65,'DisplayName','Failed Password Recovery Attempts',-1234),(154,66,'ReadOnly','true',-1234),(155,66,'Description','Unique ID of the user',-1234),(156,66,'DisplayName','User ID',-1234),(157,67,'Description','Address - Street',-1234),(158,67,'DisplayOrder','5',-1234),(159,67,'DisplayName','Address - Street',-1234),(160,68,'Description','Telephone',-1234),(161,68,'DisplayOrder','7',-1234),(162,68,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(163,68,'SupportedByDefault','true',-1234),(164,68,'DisplayName','Telephone',-1234),(165,69,'ReadOnly','true',-1234),(166,69,'Description','Claim to store newly updated email address until the new email address is verified.',-1234),(167,69,'DisplayName','Verification Pending Email',-1234),(168,70,'Description','Account Disabled',-1234),(169,70,'DisplayName','Account Disabled',-1234),(170,71,'Description','First Name',-1234),(171,71,'DisplayOrder','1',-1234),(172,71,'Required','true',-1234),(173,71,'SupportedByDefault','true',-1234),(174,71,'DisplayName','First Name',-1234),(175,72,'Description','Claim to store if this is a lite user account.',-1234),(176,72,'DisplayName','Lite User',-1234),(177,73,'Description','Extended Display Name',-1234),(178,73,'DisplayName','Extended Display Name',-1234),(179,74,'Description','Failed Login Attempts',-1234),(180,74,'DisplayName','Failed Login Attempts',-1234),(181,75,'Description','IM - Gtalk',-1234),(182,75,'DisplayName','IM - Gtalk',-1234),(183,76,'ReadOnly','true',-1234),(184,76,'Description','Groups',-1234),(185,76,'SupportedByDefault','true',-1234),(186,76,'DisplayName','Groups',-1234),(187,77,'Description','X509Certificates',-1234),(188,77,'DisplayName','X509Certificates',-1234),(189,78,'Description','Photo',-1234),(190,78,'DisplayName','Photo',-1234),(191,79,'Description','Claim to store Backup Codes of the user',-1234),(192,79,'DisplayName','Backup Codes',-1234),(193,80,'Description','Entitlements',-1234),(194,80,'DisplayName','Entitlements',-1234),(195,81,'Description','Last Password Update Time',-1234),(196,81,'DisplayName','Last Password Update',-1234),(197,82,'Description','Failed Attempts Before Success',-1234),(198,82,'DisplayName','Failed Attempts Before Success',-1234),(199,83,'Description','Website URL',-1234),(200,83,'DisplayName','Website URL',-1234),(201,84,'Description','Phone Numbers',-1234),(202,84,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(203,84,'DisplayName','Phone Numbers',-1234),(204,85,'Description','Birth Date',-1234),(205,85,'RegEx','^\\d{4}-\\d{2}-\\d{2}$',-1234),(206,85,'RegExValidationError','Date of Birth is not in the correct format of YYYY-MM-DD',-1234),(207,85,'DisplayName','Birth Date',-1234),(208,86,'Description','Other Phone Number',-1234),(209,86,'DisplayName','Phone Numbers - Other',-1234),(210,87,'Description','User Principal',-1234),(211,87,'DisplayName','User Principal',-1234),(212,88,'Description','Home Email',-1234),(213,88,'DisplayName','Emails - Home Email',-1234),(214,89,'Description','Claim to store the secret key until verified',-1234),(215,89,'DisplayName','Verify Secret Key',-1234),(216,90,'Description','State',-1234),(217,90,'DisplayName','State',-1234),(218,91,'Description','One Time Password',-1234),(219,91,'DisplayName','One Time Password',-1234),(220,92,'Description','Status of the account',-1234),(221,92,'DisplayName','Active',-1234),(222,93,'Description','Resource Type',-1234),(223,93,'DisplayName','Resource Type',-1234),(224,94,'ReadOnly','true',-1234),(225,94,'Description','To store newly updated mobile number until it is verified.',-1234),(226,94,'DisplayName','Verification Pending Mobile Number',-1234),(227,95,'Description','Email Verified',-1234),(228,95,'DisplayName','Email Verified',-1234),(229,96,'ReadOnly','true',-1234),(230,96,'Description','User Account Metadata - Version',-1234),(231,96,'DisplayName','User Metadata - Version',-1234),(232,97,'Description','User Type',-1234),(233,97,'DisplayName','User Type',-1234),(234,98,'Description','Other Phone',-1234),(235,98,'DisplayName','Other Phone',-1234),(236,99,'Description','Photo - Thumbnail',-1234),(237,99,'DisplayName','Photo - Thumbnail',-1234),(238,100,'Description','Account confirmed timestamp of the user',-1234),(239,100,'DisplayName','Confirmed Time',-1234),(240,101,'Description','Temporary claim to invoke email force password feature',-1234),(241,101,'DisplayName','Force Password Reset',-1234),(242,102,'Description','Title',-1234),(243,102,'DisplayName','Title',-1234),(244,103,'Description','Extended Ref',-1234),(245,103,'DisplayName','Extended Ref',-1234),(246,104,'ReadOnly','true',-1234),(247,104,'Description','Created timestamp of the user',-1234),(248,104,'DisplayName','Created Time',-1234),(249,105,'Description','Failed TOTP Attempts',-1234),(250,105,'DisplayName','Failed TOTP Attempts',-1234),(251,106,'Description','Failed SMS OTP Attempts',-1234),(252,106,'DisplayName','Failed SMS OTP Attempts',-1234),(253,107,'Description','Gender',-1234),(254,107,'DisplayName','Gender',-1234),(255,108,'ReadOnly','true',-1234),(256,108,'Description','Include both userstore groups and internal roles',-1234),(257,108,'DisplayName','Roles and groups',-1234),(258,109,'ReadOnly','true',-1234),(259,109,'Description','Account State',-1234),(260,109,'DisplayName','Account State',-1234),(261,110,'Description','Pager Number',-1234),(262,110,'DisplayName','Phone Numbers - Pager Number',-1234),(263,111,'ReadOnly','true',-1234),(264,111,'Description','End-User\'s gender. Values defined by this specification are female and male. Other values MAY be used when neither of the defined values are applicable.',-1234),(265,111,'SupportedByDefault','true',-1234),(266,111,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(267,111,'DisplayName','Gender',-1234),(268,112,'Description','Street Address',-1234),(269,112,'MappedLocalClaim','http://wso2.org/claims/streetaddress',-1234),(270,112,'DisplayName','Street Address',-1234),(271,113,'Description','Time Zone',-1234),(272,113,'DisplayOrder','2',-1234),(273,113,'Required','true',-1234),(274,113,'SupportedByDefault','true',-1234),(275,113,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(276,113,'DisplayName','Time Zone',-1234),(277,114,'Description','Manager - home',-1234),(278,114,'DisplayOrder','1',-1234),(279,114,'Required','true',-1234),(280,114,'SupportedByDefault','true',-1234),(281,114,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(282,114,'DisplayName','Manager - home',-1234),(283,115,'Description','Photo',-1234),(284,115,'DisplayOrder','5',-1234),(285,115,'SupportedByDefault','true',-1234),(286,115,'MappedLocalClaim','http://wso2.org/claims/photourl',-1234),(287,115,'DisplayName','Photo',-1234),(288,116,'Description','Temporary claim to invoke forced password reset feature',-1234),(289,116,'DisplayOrder','1',-1234),(290,116,'Required','true',-1234),(291,116,'SupportedByDefault','true',-1234),(292,116,'MappedLocalClaim','http://wso2.org/claims/identity/adminForcedPasswordReset',-1234),(293,116,'DisplayName','Force Password Reset',-1234),(294,117,'Description','Date of Birth',-1234),(295,117,'DisplayOrder','6',-1234),(296,117,'SupportedByDefault','true',-1234),(297,117,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(298,117,'DisplayName','DOB',-1234),(299,118,'Description','Locality',-1234),(300,118,'DisplayOrder','2',-1234),(301,118,'Required','true',-1234),(302,118,'SupportedByDefault','true',-1234),(303,118,'MappedLocalClaim','http://wso2.org/claims/local',-1234),(304,118,'DisplayName','Locality',-1234),(305,119,'Description','The reason why the user account is locked',-1234),(306,119,'DisplayOrder','1',-1234),(307,119,'Required','true',-1234),(308,119,'SupportedByDefault','true',-1234),(309,119,'MappedLocalClaim','http://wso2.org/claims/identity/lockedReason',-1234),(310,119,'DisplayName','Locked Reason',-1234),(311,120,'Description','Legal Person Name',-1234),(312,120,'DisplayOrder','1',-1234),(313,120,'Required','true',-1234),(314,120,'SupportedByDefault','true',-1234),(315,120,'MappedLocalClaim','http://wso2.org/claims/extendedDisplayName',-1234),(316,120,'DisplayName','Legal Person Name',-1234),(317,121,'Description','Given Name',-1234),(318,121,'DisplayOrder','1',-1234),(319,121,'Required','true',-1234),(320,121,'SupportedByDefault','true',-1234),(321,121,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(322,121,'DisplayName','Name - Given Name',-1234),(323,122,'Description','Place of Birth',-1234),(324,122,'DisplayOrder','1',-1234),(325,122,'Required','true',-1234),(326,122,'SupportedByDefault','true',-1234),(327,122,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(328,122,'DisplayName','Place of Birth',-1234),(329,123,'Description','Phone Numbers',-1234),(330,123,'DisplayOrder','3',-1234),(331,123,'Required','true',-1234),(332,123,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(333,123,'SupportedByDefault','true',-1234),(334,123,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers',-1234),(335,123,'DisplayName','Phone Numbers',-1234),(336,124,'Description','Claim to store if the user is read only',-1234),(337,124,'DisplayOrder','1',-1234),(338,124,'Required','true',-1234),(339,124,'SupportedByDefault','true',-1234),(340,124,'MappedLocalClaim','http://wso2.org/claims/identity/isReadOnlyUser',-1234),(341,124,'DisplayName','Read Only User',-1234),(342,125,'Description','Store whether email OTP is enabled or disabled',-1234),(343,125,'DisplayOrder','1',-1234),(344,125,'Required','true',-1234),(345,125,'SupportedByDefault','true',-1234),(346,125,'MappedLocalClaim','http://wso2.org/claims/identity/emailotp_disabled',-1234),(347,125,'DisplayName','Disable email OTP',-1234),(348,126,'Description','Organization -division',-1234),(349,126,'DisplayOrder','1',-1234),(350,126,'Required','true',-1234),(351,126,'SupportedByDefault','true',-1234),(352,126,'MappedLocalClaim','http://wso2.org/claims/organization',-1234),(353,126,'DisplayName','Organization -division',-1234),(354,127,'Description','Postalcode',-1234),(355,127,'DisplayOrder','4',-1234),(356,127,'SupportedByDefault','true',-1234),(357,127,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(358,127,'DisplayName','Postalcode',-1234),(359,128,'Description','Economic Operator Registration and Identification',-1234),(360,128,'DisplayOrder','1',-1234),(361,128,'Required','true',-1234),(362,128,'SupportedByDefault','true',-1234),(363,128,'MappedLocalClaim','http://wso2.org/claims/department',-1234),(364,128,'DisplayName','Economic Operator Registration and Identification',-1234),(365,129,'Description','Email Addresses',-1234),(366,129,'DisplayOrder','5',-1234),(367,129,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(368,129,'SupportedByDefault','true',-1234),(369,129,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(370,129,'DisplayName','Emails',-1234),(371,130,'Description','Phone Numbers',-1234),(372,130,'DisplayOrder','5',-1234),(373,130,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(374,130,'SupportedByDefault','true',-1234),(375,130,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers',-1234),(376,130,'DisplayName','Phone Numbers',-1234),(377,131,'Description','Family Name',-1234),(378,131,'DisplayOrder','2',-1234),(379,131,'Required','true',-1234),(380,131,'SupportedByDefault','true',-1234),(381,131,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(382,131,'DisplayName','Name - Family Name',-1234),(383,132,'Description','Photo',-1234),(384,132,'DisplayOrder','5',-1234),(385,132,'SupportedByDefault','true',-1234),(386,132,'MappedLocalClaim','http://wso2.org/claims/photourl',-1234),(387,132,'DisplayName','Photo',-1234),(388,133,'Description','Photo - Thumbnail',-1234),(389,133,'DisplayOrder','5',-1234),(390,133,'SupportedByDefault','true',-1234),(391,133,'MappedLocalClaim','http://wso2.org/claims/thumbnail',-1234),(392,133,'DisplayName','Photo - Thumbnail',-1234),(393,134,'Description','Country',-1234),(394,134,'DisplayOrder','5',-1234),(395,134,'SupportedByDefault','true',-1234),(396,134,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(397,134,'DisplayName','Country',-1234),(398,135,'Description','True if the End-User\'s e-mail address has been verified; otherwise false. ',-1234),(399,135,'MappedLocalClaim','http://wso2.org/claims/identity/emailVerified',-1234),(400,135,'DisplayName','Email Verified',-1234),(401,136,'Description','Title',-1234),(402,136,'DisplayOrder','2',-1234),(403,136,'Required','true',-1234),(404,136,'SupportedByDefault','true',-1234),(405,136,'MappedLocalClaim','http://wso2.org/claims/title',-1234),(406,136,'DisplayName','Title',-1234),(407,137,'Description','User Type',-1234),(408,137,'DisplayOrder','2',-1234),(409,137,'Required','true',-1234),(410,137,'SupportedByDefault','true',-1234),(411,137,'MappedLocalClaim','http://wso2.org/claims/userType',-1234),(412,137,'DisplayName','User Type',-1234),(413,138,'Description','Home Email',-1234),(414,138,'DisplayOrder','5',-1234),(415,138,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(416,138,'SupportedByDefault','true',-1234),(417,138,'MappedLocalClaim','http://wso2.org/claims/emails.home',-1234),(418,138,'DisplayName','Emails - Home Email',-1234),(419,139,'Description','Active',-1234),(420,139,'DisplayOrder','2',-1234),(421,139,'Required','true',-1234),(422,139,'SupportedByDefault','true',-1234),(423,139,'MappedLocalClaim','http://wso2.org/claims/active',-1234),(424,139,'DisplayName','Active',-1234),(425,140,'Description','Pager Number',-1234),(426,140,'DisplayOrder','5',-1234),(427,140,'SupportedByDefault','true',-1234),(428,140,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.pager',-1234),(429,140,'DisplayName','Phone Numbers - Pager Number',-1234),(430,141,'Description','String from zoneinfo time zone database representing the End-User\'s time zone. For example, Europe/Paris or America/Los_Angeles.',-1234),(431,141,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(432,141,'DisplayName','Zone Info',-1234),(433,142,'Description','Temporary claim to invoke mobile verification feature',-1234),(434,142,'DisplayOrder','1',-1234),(435,142,'Required','true',-1234),(436,142,'SupportedByDefault','true',-1234),(437,142,'MappedLocalClaim','http://wso2.org/claims/identity/verifyMobile',-1234),(438,142,'DisplayName','Verify Mobile',-1234),(439,143,'Description','Honoric Suffix',-1234),(440,143,'DisplayOrder','2',-1234),(441,143,'Required','true',-1234),(442,143,'SupportedByDefault','true',-1234),(443,143,'MappedLocalClaim','http://wso2.org/claims/honorificSuffix',-1234),(444,143,'DisplayName','Name - Honoric Suffix',-1234),(445,144,'Description','Photo',-1234),(446,144,'DisplayOrder','5',-1234),(447,144,'SupportedByDefault','true',-1234),(448,144,'MappedLocalClaim','http://wso2.org/claims/photos',-1234),(449,144,'DisplayName','Photo',-1234),(450,145,'Description','Display Name',-1234),(451,145,'DisplayOrder','2',-1234),(452,145,'Required','true',-1234),(453,145,'SupportedByDefault','true',-1234),(454,145,'MappedLocalClaim','http://wso2.org/claims/displayName',-1234),(455,145,'DisplayName','Display Name',-1234),(456,146,'Description','Last logon time',-1234),(457,146,'DisplayOrder','1',-1234),(458,146,'Required','true',-1234),(459,146,'SupportedByDefault','true',-1234),(460,146,'MappedLocalClaim','http://wso2.org/claims/identity/lastLogonTime',-1234),(461,146,'DisplayName','Last Logon Time',-1234),(462,147,'Description','URL of the End-User\'s profile picture. This URL MUST refer to an image file (for example, a PNG, JPEG, or GIF image file)',-1234),(463,147,'DisplayOrder','9',-1234),(464,147,'SupportedByDefault','true',-1234),(465,147,'MappedLocalClaim','http://wso2.org/claims/photourl',-1234),(466,147,'DisplayName','Picture',-1234),(467,148,'Description','Meta - Last Modified',-1234),(468,148,'DisplayOrder','1',-1234),(469,148,'Required','true',-1234),(470,148,'SupportedByDefault','true',-1234),(471,148,'MappedLocalClaim','http://wso2.org/claims/modified',-1234),(472,148,'DisplayName','Meta - Last Modified',-1234),(473,149,'Description','X509Certificates',-1234),(474,149,'DisplayOrder','5',-1234),(475,149,'SupportedByDefault','true',-1234),(476,149,'MappedLocalClaim','http://wso2.org/claims/x509Certificates',-1234),(477,149,'DisplayName','X509Certificates',-1234),(478,150,'Description','Formatted Name',-1234),(479,150,'DisplayOrder','2',-1234),(480,150,'Required','true',-1234),(481,150,'SupportedByDefault','true',-1234),(482,150,'MappedLocalClaim','http://wso2.org/claims/formattedName',-1234),(483,150,'DisplayName','Name - Formatted Name',-1234),(484,151,'Description','Groups',-1234),(485,151,'DisplayOrder','5',-1234),(486,151,'SupportedByDefault','true',-1234),(487,151,'MappedLocalClaim','http://wso2.org/claims/groups',-1234),(488,151,'DisplayName','Groups',-1234),(489,152,'Description','Home Phone',-1234),(490,152,'DisplayOrder','5',-1234),(491,152,'SupportedByDefault','true',-1234),(492,152,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.home',-1234),(493,152,'DisplayName','Phone Numbers - Home Phone Number',-1234),(494,153,'Description','User Provisioned IDP ID',-1234),(495,153,'DisplayOrder','1',-1234),(496,153,'Required','true',-1234),(497,153,'SupportedByDefault','true',-1234),(498,153,'MappedLocalClaim','http://wso2.org/claims/identity/userSourceId',-1234),(499,153,'DisplayName','User Source ID',-1234),(500,154,'Description','External Id',-1234),(501,154,'DisplayOrder','1',-1234),(502,154,'Required','true',-1234),(503,154,'SupportedByDefault','true',-1234),(504,154,'MappedLocalClaim','http://wso2.org/claims/externalid',-1234),(505,154,'DisplayName','External Id',-1234),(506,155,'Description','Roles',-1234),(507,155,'DisplayOrder','5',-1234),(508,155,'SupportedByDefault','true',-1234),(509,155,'MappedLocalClaim','http://wso2.org/claims/role',-1234),(510,155,'DisplayName','Roles',-1234),(511,156,'Description','Entitlements',-1234),(512,156,'DisplayOrder','5',-1234),(513,156,'SupportedByDefault','true',-1234),(514,156,'MappedLocalClaim','http://wso2.org/claims/entitlements',-1234),(515,156,'DisplayName','Entitlements',-1234),(516,157,'Description','Locality',-1234),(517,157,'MappedLocalClaim','http://wso2.org/claims/locality',-1234),(518,157,'DisplayName','Locality',-1234),(519,158,'Description','Time Zone',-1234),(520,158,'DisplayOrder','9',-1234),(521,158,'SupportedByDefault','true',-1234),(522,158,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(523,158,'DisplayName','Time Zone',-1234),(524,159,'Description','Preferred Notification Channel',-1234),(525,159,'DisplayOrder','1',-1234),(526,159,'Required','true',-1234),(527,159,'SupportedByDefault','true',-1234),(528,159,'MappedLocalClaim','http://wso2.org/claims/identity/preferredChannel',-1234),(529,159,'DisplayName','Preferred Channel',-1234),(530,160,'Description','Address',-1234),(531,160,'DisplayOrder','5',-1234),(532,160,'SupportedByDefault','true',-1234),(533,160,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(534,160,'DisplayName','Address',-1234),(535,161,'Description','Current Family Name',-1234),(536,161,'DisplayOrder','1',-1234),(537,161,'Required','true',-1234),(538,161,'SupportedByDefault','true',-1234),(539,161,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(540,161,'DisplayName','Current Family Name',-1234),(541,162,'Description','Shorthand name by which the End-User wishes to be referred to at the RP, such as janedoe or j.doe.',-1234),(542,162,'DisplayOrder','7',-1234),(543,162,'SupportedByDefault','true',-1234),(544,162,'MappedLocalClaim','http://wso2.org/claims/displayName',-1234),(545,162,'DisplayName','Preferred Username',-1234),(546,163,'Description','Middle name(s) of the End-User. Note that in some cultures, people can have multiple middle names; all can be present, with the names being separated by space characters. Also note that in some cultures, middle names are not used.',-1234),(547,163,'DisplayOrder','5',-1234),(548,163,'SupportedByDefault','true',-1234),(549,163,'MappedLocalClaim','http://wso2.org/claims/middleName',-1234),(550,163,'DisplayName','Middle Name',-1234),(551,164,'Description','Employee Number',-1234),(552,164,'DisplayOrder','1',-1234),(553,164,'Required','true',-1234),(554,164,'SupportedByDefault','true',-1234),(555,164,'MappedLocalClaim','http://wso2.org/claims/extendedExternalId',-1234),(556,164,'DisplayName','Employee Number',-1234),(557,165,'Description','External Id',-1234),(558,165,'DisplayOrder','1',-1234),(559,165,'Required','true',-1234),(560,165,'SupportedByDefault','true',-1234),(561,165,'MappedLocalClaim','http://wso2.org/claims/externalid',-1234),(562,165,'DisplayName','External Id',-1234),(563,166,'Description','Language',-1234),(564,166,'SupportedByDefault','true',-1234),(565,166,'MappedLocalClaim','http://wso2.org/claims/preferredLanguage',-1234),(566,166,'DisplayName','Language',-1234),(567,167,'Description','Address - Formatted',-1234),(568,167,'DisplayOrder','5',-1234),(569,167,'SupportedByDefault','true',-1234),(570,167,'MappedLocalClaim','http://wso2.org/claims/addresses.formatted',-1234),(571,167,'DisplayName','Address - Formatted',-1234),(572,168,'Description','User Name',-1234),(573,168,'DisplayOrder','2',-1234),(574,168,'Required','true',-1234),(575,168,'SupportedByDefault','true',-1234),(576,168,'MappedLocalClaim','http://wso2.org/claims/username',-1234),(577,168,'DisplayName','User Name',-1234),(578,169,'Description','Time Zone',-1234),(579,169,'DisplayOrder','2',-1234),(580,169,'Required','true',-1234),(581,169,'SupportedByDefault','true',-1234),(582,169,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(583,169,'DisplayName','Time Zone',-1234),(584,170,'Description','Honoric Suffix',-1234),(585,170,'DisplayOrder','2',-1234),(586,170,'Required','true',-1234),(587,170,'SupportedByDefault','true',-1234),(588,170,'MappedLocalClaim','http://wso2.org/claims/honorificSuffix',-1234),(589,170,'DisplayName','Name - Honoric Suffix',-1234),(590,171,'Description','State',-1234),(591,171,'MappedLocalClaim','http://wso2.org/claims/stateorprovince',-1234),(592,171,'DisplayName','State',-1234),(593,172,'Description','Fax Phone Number',-1234),(594,172,'DisplayOrder','5',-1234),(595,172,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(596,172,'SupportedByDefault','true',-1234),(597,172,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.fax',-1234),(598,172,'DisplayName','Phone Numbers - Fax Phone Number',-1234),(599,173,'Description','Legal Person Identifier',-1234),(600,173,'DisplayOrder','1',-1234),(601,173,'Required','true',-1234),(602,173,'SupportedByDefault','true',-1234),(603,173,'MappedLocalClaim','http://wso2.org/claims/extendedExternalId',-1234),(604,173,'DisplayName','Legal Person Identifier',-1234),(605,174,'Description','Gender',-1234),(606,174,'DisplayOrder','8',-1234),(607,174,'SupportedByDefault','true',-1234),(608,174,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(609,174,'DisplayName','Gender',-1234),(610,175,'Description','Language',-1234),(611,175,'DisplayOrder','7',-1234),(612,175,'SupportedByDefault','true',-1234),(613,175,'MappedLocalClaim','http://wso2.org/claims/preferredLanguage',-1234),(614,175,'DisplayName','Language',-1234),(615,176,'Description','User Name',-1234),(616,176,'DisplayOrder','2',-1234),(617,176,'Required','true',-1234),(618,176,'SupportedByDefault','true',-1234),(619,176,'MappedLocalClaim','http://wso2.org/claims/username',-1234),(620,176,'DisplayName','User Name',-1234),(621,177,'Description','Nick Name',-1234),(622,177,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(623,177,'DisplayName','Nick Name',-1234),(624,178,'Description','Casual name of the End-User that may or may not be the same as the given_name. For instance, a nickname value of Mike might be returned alongside a given_name value of Michael.',-1234),(625,178,'DisplayOrder','6',-1234),(626,178,'Required','true',-1234),(627,178,'SupportedByDefault','true',-1234),(628,178,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(629,178,'DisplayName','Nickname',-1234),(630,179,'Description','Tax Reference',-1234),(631,179,'DisplayOrder','1',-1234),(632,179,'Required','true',-1234),(633,179,'SupportedByDefault','true',-1234),(634,179,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(635,179,'DisplayName','Tax Reference',-1234),(636,180,'Description','Postalcode',-1234),(637,180,'SupportedByDefault','true',-1234),(638,180,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(639,180,'DisplayName','Postalcode',-1234),(640,181,'Description','Meta - Location',-1234),(641,181,'DisplayOrder','1',-1234),(642,181,'Required','true',-1234),(643,181,'SupportedByDefault','true',-1234),(644,181,'MappedLocalClaim','http://wso2.org/claims/resourceType',-1234),(645,181,'DisplayName','Meta - Location',-1234),(646,182,'Description','IM - Skype',-1234),(647,182,'DisplayOrder','5',-1234),(648,182,'SupportedByDefault','true',-1234),(649,182,'MappedLocalClaim','http://wso2.org/claims/skype',-1234),(650,182,'DisplayName','IM - Skype',-1234),(651,183,'Description','Preferred Language',-1234),(652,183,'DisplayOrder','2',-1234),(653,183,'Required','true',-1234),(654,183,'SupportedByDefault','true',-1234),(655,183,'MappedLocalClaim','http://wso2.org/claims/preferredLanguage',-1234),(656,183,'DisplayName','Preferred Language',-1234),(657,184,'Description','Other Phone Number',-1234),(658,184,'DisplayOrder','5',-1234),(659,184,'SupportedByDefault','true',-1234),(660,184,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.other',-1234),(661,184,'DisplayName','Phone Numbers - Other',-1234),(662,185,'Description','One Time Password',-1234),(663,185,'DisplayOrder','1',-1234),(664,185,'Required','true',-1234),(665,185,'SupportedByDefault','true',-1234),(666,185,'MappedLocalClaim','http://wso2.org/claims/oneTimePassword',-1234),(667,185,'DisplayName','One Time Password',-1234),(668,186,'Description','Current Given Name',-1234),(669,186,'DisplayOrder','1',-1234),(670,186,'Required','true',-1234),(671,186,'SupportedByDefault','true',-1234),(672,186,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(673,186,'DisplayName','Current Given Name',-1234),(674,187,'Description','Middle Name',-1234),(675,187,'DisplayOrder','2',-1234),(676,187,'Required','true',-1234),(677,187,'SupportedByDefault','true',-1234),(678,187,'MappedLocalClaim','http://wso2.org/claims/middleName',-1234),(679,187,'DisplayName','Name - Middle Name',-1234),(680,188,'Description','Address - Work',-1234),(681,188,'DisplayOrder','5',-1234),(682,188,'SupportedByDefault','true',-1234),(683,188,'MappedLocalClaim','http://wso2.org/claims/region',-1234),(684,188,'DisplayName','Address - Work',-1234),(685,189,'Description','Mobile',-1234),(686,189,'MappedLocalClaim','http://wso2.org/claims/mobile',-1234),(687,189,'DisplayName','Mobile',-1234),(688,190,'Description','Full Name',-1234),(689,190,'DisplayOrder','2',-1234),(690,190,'Required','true',-1234),(691,190,'SupportedByDefault','true',-1234),(692,190,'MappedLocalClaim','http://wso2.org/claims/fullname',-1234),(693,190,'DisplayName','Full Name',-1234),(694,191,'Description','Last Name',-1234),(695,191,'Required','true',-1234),(696,191,'SupportedByDefault','true',-1234),(697,191,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(698,191,'DisplayName','Last Name',-1234),(699,192,'Description','Whether user has configured backup code authenticator or not.',-1234),(700,192,'DisplayOrder','1',-1234),(701,192,'Required','true',-1234),(702,192,'SupportedByDefault','true',-1234),(703,192,'MappedLocalClaim','http://wso2.org/claims/identity/backupCodeEnabled',-1234),(704,192,'DisplayName','Backup Code Enabled',-1234),(705,193,'Description','First Name',-1234),(706,193,'Required','true',-1234),(707,193,'SupportedByDefault','true',-1234),(708,193,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(709,193,'DisplayName','First Name',-1234),(710,194,'Description','Email Address',-1234),(711,194,'DisplayOrder','3',-1234),(712,194,'Required','true',-1234),(713,194,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(714,194,'SupportedByDefault','true',-1234),(715,194,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(716,194,'DisplayName','Email',-1234),(717,195,'Description','Gender',-1234),(718,195,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(719,195,'DisplayName','Gender',-1234),(720,196,'Description','Address - Region',-1234),(721,196,'DisplayOrder','5',-1234),(722,196,'SupportedByDefault','true',-1234),(723,196,'MappedLocalClaim','http://wso2.org/claims/region',-1234),(724,196,'DisplayName','Address - Region',-1234),(725,197,'Description','Meta - Location',-1234),(726,197,'DisplayOrder','1',-1234),(727,197,'Required','true',-1234),(728,197,'SupportedByDefault','true',-1234),(729,197,'MappedLocalClaim','http://wso2.org/claims/location',-1234),(730,197,'DisplayName','Meta - Location',-1234),(731,198,'Description','Home Email',-1234),(732,198,'DisplayOrder','5',-1234),(733,198,'SupportedByDefault','true',-1234),(734,198,'MappedLocalClaim','http://wso2.org/claims/emails.home',-1234),(735,198,'DisplayName','Emails - Home Email',-1234),(736,199,'Description','Meta - Last Modified',-1234),(737,199,'DisplayOrder','1',-1234),(738,199,'Required','true',-1234),(739,199,'SupportedByDefault','true',-1234),(740,199,'MappedLocalClaim','http://wso2.org/claims/modified',-1234),(741,199,'DisplayName','Meta - Last Modified',-1234),(742,200,'Description','Profile URL',-1234),(743,200,'DisplayOrder','2',-1234),(744,200,'Required','true',-1234),(745,200,'SupportedByDefault','true',-1234),(746,200,'MappedLocalClaim','http://wso2.org/claims/url',-1234),(747,200,'DisplayName','Profile URL',-1234),(748,201,'Description','Date of Birth',-1234),(749,201,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(750,201,'DisplayName','DOB',-1234),(751,202,'Description','Family Name',-1234),(752,202,'DisplayOrder','2',-1234),(753,202,'Required','true',-1234),(754,202,'SupportedByDefault','true',-1234),(755,202,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(756,202,'DisplayName','Name - Family Name',-1234),(757,203,'Description','Meta - Version',-1234),(758,203,'DisplayOrder','1',-1234),(759,203,'Required','true',-1234),(760,203,'SupportedByDefault','true',-1234),(761,203,'MappedLocalClaim','http://wso2.org/claims/metadata.version',-1234),(762,203,'DisplayName','Meta - Version',-1234),(763,204,'Description','X509Certificates',-1234),(764,204,'DisplayOrder','5',-1234),(765,204,'SupportedByDefault','true',-1234),(766,204,'MappedLocalClaim','http://wso2.org/claims/x509Certificates',-1234),(767,204,'DisplayName','X509Certificates',-1234),(768,205,'Description','IM',-1234),(769,205,'DisplayOrder','5',-1234),(770,205,'SupportedByDefault','true',-1234),(771,205,'MappedLocalClaim','http://wso2.org/claims/im',-1234),(772,205,'DisplayName','IMS',-1234),(773,206,'Description','URL of the End-User\'s profile page. The contents of this Web page SHOULD be about the End-User.',-1234),(774,206,'DisplayOrder','8',-1234),(775,206,'SupportedByDefault','true',-1234),(776,206,'MappedLocalClaim','http://wso2.org/claims/url',-1234),(777,206,'DisplayName','Profile',-1234),(778,207,'Description','Date of birth',-1234),(779,207,'DisplayOrder','1',-1234),(780,207,'Required','true',-1234),(781,207,'SupportedByDefault','true',-1234),(782,207,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(783,207,'DisplayName','Date Of Birth',-1234),(784,208,'Description','Meta - Created',-1234),(785,208,'DisplayOrder','1',-1234),(786,208,'Required','true',-1234),(787,208,'SupportedByDefault','true',-1234),(788,208,'MappedLocalClaim','http://wso2.org/claims/created',-1234),(789,208,'DisplayName','Meta - Created',-1234),(790,209,'Description','True if the End-User\'s phone number has been verified; otherwise false.',-1234),(791,209,'MappedLocalClaim','http://wso2.org/claims/identity/phoneVerified',-1234),(792,209,'DisplayName','Phone Number Verified',-1234),(793,210,'Description','Legal Person Address',-1234),(794,210,'DisplayOrder','1',-1234),(795,210,'Required','true',-1234),(796,210,'SupportedByDefault','true',-1234),(797,210,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(798,210,'DisplayName','Legal Person Address',-1234),(799,211,'Description','IM - Skype',-1234),(800,211,'DisplayOrder','5',-1234),(801,211,'SupportedByDefault','true',-1234),(802,211,'MappedLocalClaim','http://wso2.org/claims/skype',-1234),(803,211,'DisplayName','IM - Skype',-1234),(804,212,'Description','TOTP Authenticator Enabled',-1234),(805,212,'DisplayOrder','1',-1234),(806,212,'Required','true',-1234),(807,212,'SupportedByDefault','true',-1234),(808,212,'MappedLocalClaim','http://wso2.org/claims/identity/totpEnabled',-1234),(809,212,'DisplayName','TOTP Enabled',-1234),(810,213,'Description','Birth Name',-1234),(811,213,'DisplayOrder','1',-1234),(812,213,'Required','true',-1234),(813,213,'SupportedByDefault','true',-1234),(814,213,'MappedLocalClaim','http://wso2.org/claims/username',-1234),(815,213,'DisplayName','Birth Name',-1234),(816,214,'Description','Country',-1234),(817,214,'SupportedByDefault','true',-1234),(818,214,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(819,214,'DisplayName','Country',-1234),(820,215,'Description','LEI',-1234),(821,215,'DisplayOrder','1',-1234),(822,215,'Required','true',-1234),(823,215,'SupportedByDefault','true',-1234),(824,215,'MappedLocalClaim','http://wso2.org/claims/extendedRef',-1234),(825,215,'DisplayName','LEI',-1234),(826,216,'Description','List of role names that have been assigned to the principal. This typically will require a mapping at the application container level to application deployment roles.',-1234),(827,216,'DisplayOrder','13',-1234),(828,216,'SupportedByDefault','true',-1234),(829,216,'MappedLocalClaim','http://wso2.org/claims/roles',-1234),(830,216,'DisplayName','User Roles',-1234),(831,217,'Description','Work Phone',-1234),(832,217,'DisplayOrder','5',-1234),(833,217,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(834,217,'SupportedByDefault','true',-1234),(835,217,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.work',-1234),(836,217,'DisplayName','Phone Numbers - Work Phone Number',-1234),(837,218,'Description','Zip code or postal code component.',-1234),(838,218,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(839,218,'DisplayName','Postal Code',-1234),(840,219,'Description','Work Email',-1234),(841,219,'DisplayOrder','5',-1234),(842,219,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(843,219,'SupportedByDefault','true',-1234),(844,219,'MappedLocalClaim','http://wso2.org/claims/emails.work',-1234),(845,219,'DisplayName','Emails - Work Email',-1234),(846,220,'Description','Address - Country',-1234),(847,220,'DisplayOrder','5',-1234),(848,220,'SupportedByDefault','true',-1234),(849,220,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(850,220,'DisplayName','Address - Country',-1234),(851,221,'Description','List of group names that have been assigned to the principal. This typically will require a mapping at the application container level to application deployment roles.',-1234),(852,221,'DisplayOrder','12',-1234),(853,221,'SupportedByDefault','true',-1234),(854,221,'MappedLocalClaim','http://wso2.org/claims/groups',-1234),(855,221,'DisplayName','User Groups',-1234),(856,222,'Description','Other Email',-1234),(857,222,'DisplayOrder','5',-1234),(858,222,'SupportedByDefault','true',-1234),(859,222,'MappedLocalClaim','http://wso2.org/claims/emails.other',-1234),(860,222,'DisplayName','Emails - Other Email',-1234),(861,223,'Description','True if the End-User\'s phone number has been verified; otherwise false. ',-1234),(862,223,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(863,223,'DisplayName','Address',-1234),(864,224,'Description','Temporary claim to invoke email tenant admin ask Password feature',-1234),(865,224,'DisplayOrder','1',-1234),(866,224,'Required','true',-1234),(867,224,'SupportedByDefault','true',-1234),(868,224,'MappedLocalClaim','http://wso2.org/claims/identity/tenantAdminAskPassword',-1234),(869,224,'DisplayName','Tenant Admin Ask Password',-1234),(870,225,'Description','Country',-1234),(871,225,'DisplayOrder','1',-1234),(872,225,'Required','true',-1234),(873,225,'SupportedByDefault','true',-1234),(874,225,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(875,225,'DisplayName','Country',-1234),(876,226,'Description','Work Phone',-1234),(877,226,'DisplayOrder','5',-1234),(878,226,'SupportedByDefault','true',-1234),(879,226,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.work',-1234),(880,226,'DisplayName','Phone Numbers - Work Phone Number',-1234),(881,227,'Description','Last Name',-1234),(882,227,'Required','true',-1234),(883,227,'SupportedByDefault','true',-1234),(884,227,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(885,227,'DisplayName','Last Name',-1234),(886,228,'Description','PPID',-1234),(887,228,'Required','true',-1234),(888,228,'SupportedByDefault','true',-1234),(889,228,'MappedLocalClaim','http://wso2.org/claims/im',-1234),(890,228,'DisplayName','0',-1234),(891,229,'Description','Mobile Number',-1234),(892,229,'DisplayOrder','5',-1234),(893,229,'SupportedByDefault','true',-1234),(894,229,'MappedLocalClaim','http://wso2.org/claims/mobile',-1234),(895,229,'DisplayName','Phone Numbers - Mobile Number',-1234),(896,230,'Description','EU Identifier',-1234),(897,230,'DisplayOrder','1',-1234),(898,230,'Required','true',-1234),(899,230,'SupportedByDefault','true',-1234),(900,230,'MappedLocalClaim','http://wso2.org/claims/externalid',-1234),(901,230,'DisplayName','EU Identifier',-1234),(902,231,'Description','Active',-1234),(903,231,'DisplayOrder','2',-1234),(904,231,'Required','true',-1234),(905,231,'SupportedByDefault','true',-1234),(906,231,'MappedLocalClaim','http://wso2.org/claims/active',-1234),(907,231,'DisplayName','Active',-1234),(908,232,'Description','Country name component',-1234),(909,232,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(910,232,'DisplayName','Country',-1234),(911,233,'Description','Meta - Location',-1234),(912,233,'DisplayOrder','1',-1234),(913,233,'Required','true',-1234),(914,233,'SupportedByDefault','true',-1234),(915,233,'MappedLocalClaim','http://wso2.org/claims/location',-1234),(916,233,'DisplayName','Meta - Location',-1234),(917,234,'Description','Manager - home',-1234),(918,234,'DisplayOrder','1',-1234),(919,234,'Required','true',-1234),(920,234,'SupportedByDefault','true',-1234),(921,234,'MappedLocalClaim','http://wso2.org/claims/extendedRef',-1234),(922,234,'DisplayName','Manager - home',-1234),(923,235,'Description','Temporary claim to invoke email verified feature',-1234),(924,235,'DisplayOrder','1',-1234),(925,235,'Required','true',-1234),(926,235,'SupportedByDefault','true',-1234),(927,235,'MappedLocalClaim','http://wso2.org/claims/identity/verifyEmail',-1234),(928,235,'DisplayName','Verify Email',-1234),(929,236,'Description','Number of failed login attempts',-1234),(930,236,'DisplayOrder','1',-1234),(931,236,'Required','true',-1234),(932,236,'SupportedByDefault','true',-1234),(933,236,'MappedLocalClaim','http://wso2.org/claims/identity/failedLoginAttempts',-1234),(934,236,'DisplayName','Faliled Login Attempts',-1234),(935,237,'Description','Store whether the account is a lite user account',-1234),(936,237,'DisplayOrder','1',-1234),(937,237,'Required','true',-1234),(938,237,'SupportedByDefault','true',-1234),(939,237,'MappedLocalClaim','http://wso2.org/claims/identity/isLiteUser',-1234),(940,237,'DisplayName','Lite User',-1234),(941,238,'Description','Address',-1234),(942,238,'DisplayOrder','5',-1234),(943,238,'SupportedByDefault','true',-1234),(944,238,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(945,238,'DisplayName','Address',-1234),(946,239,'Description','Temporary claim to invoke email ask Password feature',-1234),(947,239,'DisplayOrder','1',-1234),(948,239,'Required','true',-1234),(949,239,'SupportedByDefault','true',-1234),(950,239,'MappedLocalClaim','http://wso2.org/claims/identity/askPassword',-1234),(951,239,'DisplayName','Ask Password',-1234),(952,240,'Description','Full mailing address, formatted for display or use on a mailing label. This field MAY contain multiple lines, separated by newlines.',-1234),(953,240,'MappedLocalClaim','http://wso2.org/claims/addresses.formatted',-1234),(954,240,'DisplayName','Address Formatted',-1234),(955,241,'Description','Number of failed attempts before a success login',-1234),(956,241,'DisplayOrder','1',-1234),(957,241,'Required','true',-1234),(958,241,'SupportedByDefault','true',-1234),(959,241,'MappedLocalClaim','http://wso2.org/claims/identity/failedLoginAttemptsBeforeSuccess',-1234),(960,241,'DisplayName','Faliled Login Attempts Before Success',-1234),(961,242,'Description','Manager - home',-1234),(962,242,'DisplayOrder','1',-1234),(963,242,'Required','true',-1234),(964,242,'SupportedByDefault','true',-1234),(965,242,'MappedLocalClaim','http://wso2.org/claims/stateorprovince',-1234),(966,242,'DisplayName','Manager - home',-1234),(967,243,'Description','To store newly updated mobile number until it is verified',-1234),(968,243,'DisplayOrder','1',-1234),(969,243,'Required','true',-1234),(970,243,'SupportedByDefault','true',-1234),(971,243,'MappedLocalClaim','http://wso2.org/claims/identity/mobileNumber.pendingValue',-1234),(972,243,'DisplayName','Verification Pending Mobile',-1234),(973,244,'Description','System for Exchange of Excise Data Identifier',-1234),(974,244,'DisplayOrder','1',-1234),(975,244,'Required','true',-1234),(976,244,'SupportedByDefault','true',-1234),(977,244,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(978,244,'DisplayName','System for Exchange of Excise Data Identifier',-1234),(979,245,'Description','Postalcode',-1234),(980,245,'SupportedByDefault','true',-1234),(981,245,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(982,245,'DisplayName','Postalcode',-1234),(983,246,'Description','End-User\'s preferred e-mail address.',-1234),(984,246,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(985,246,'DisplayName','Email',-1234),(986,247,'Description','Photo - Thumbnail',-1234),(987,247,'DisplayOrder','5',-1234),(988,247,'SupportedByDefault','true',-1234),(989,247,'MappedLocalClaim','http://wso2.org/claims/thumbnail',-1234),(990,247,'DisplayName','Photo - Thumbnail',-1234),(991,248,'Description','Nick Name',-1234),(992,248,'DisplayOrder','1',-1234),(993,248,'Required','true',-1234),(994,248,'SupportedByDefault','true',-1234),(995,248,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(996,248,'DisplayName','Nick Name',-1234),(997,249,'Description','The user principal name',-1234),(998,249,'DisplayOrder','11',-1234),(999,249,'SupportedByDefault','true',-1234),(1000,249,'MappedLocalClaim','http://wso2.org/claims/userprincipal',-1234),(1001,249,'DisplayName','User Principal',-1234),(1002,250,'Description','Account state',-1234),(1003,250,'DisplayOrder','1',-1234),(1004,250,'Required','true',-1234),(1005,250,'SupportedByDefault','true',-1234),(1006,250,'MappedLocalClaim','http://wso2.org/claims/identity/accountState',-1234),(1007,250,'DisplayName','Account State',-1234),(1008,251,'Description','Honoric Prefix',-1234),(1009,251,'DisplayOrder','2',-1234),(1010,251,'Required','true',-1234),(1011,251,'SupportedByDefault','true',-1234),(1012,251,'MappedLocalClaim','http://wso2.org/claims/honorificPrefix',-1234),(1013,251,'DisplayName','Name - Honoric Prefix',-1234),(1014,252,'Description','Locality',-1234),(1015,252,'DisplayOrder','2',-1234),(1016,252,'Required','true',-1234),(1017,252,'SupportedByDefault','true',-1234),(1018,252,'MappedLocalClaim','http://wso2.org/claims/local',-1234),(1019,252,'DisplayName','Locality',-1234),(1020,253,'Description','IM - Gtalk',-1234),(1021,253,'DisplayOrder','5',-1234),(1022,253,'SupportedByDefault','true',-1234),(1023,253,'MappedLocalClaim','http://wso2.org/claims/gtalk',-1234),(1024,253,'DisplayName','IM - Gtalk',-1234),(1025,254,'Description','Address - Postal Code',-1234),(1026,254,'DisplayOrder','5',-1234),(1027,254,'SupportedByDefault','true',-1234),(1028,254,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(1029,254,'DisplayName','Address - Postal Code',-1234),(1030,255,'Description','True if the End-User\'s e-mail address has been verified; otherwise false',-1234),(1031,255,'DisplayOrder','1',-1234),(1032,255,'Required','true',-1234),(1033,255,'SupportedByDefault','true',-1234),(1034,255,'MappedLocalClaim','http://wso2.org/claims/identity/emailVerified',-1234),(1035,255,'DisplayName','Email Verified',-1234),(1036,256,'Description','Person Identifier',-1234),(1037,256,'DisplayOrder','1',-1234),(1038,256,'Required','true',-1234),(1039,256,'SupportedByDefault','true',-1234),(1040,256,'MappedLocalClaim','http://wso2.org/claims/userid',-1234),(1041,256,'DisplayName','Person Identifier',-1234),(1042,257,'Description','Given name(s) or first name(s) of the End-User. Note that in some cultures, people can have multiple given names; all can be present, with the names being separated by space characters.',-1234),(1043,257,'DisplayOrder','3',-1234),(1044,257,'SupportedByDefault','true',-1234),(1045,257,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(1046,257,'DisplayName','Given Name',-1234),(1047,258,'Description','First Name',-1234),(1048,258,'Required','true',-1234),(1049,258,'SupportedByDefault','true',-1234),(1050,258,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(1051,258,'DisplayName','First Name',-1234),(1052,259,'Description','City or locality component.',-1234),(1053,259,'MappedLocalClaim','http://wso2.org/claims/locality',-1234),(1054,259,'DisplayName','Locality',-1234),(1055,260,'Description','Preferred Language',-1234),(1056,260,'DisplayOrder','2',-1234),(1057,260,'Required','true',-1234),(1058,260,'SupportedByDefault','true',-1234),(1059,260,'MappedLocalClaim','http://wso2.org/claims/preferredLanguage',-1234),(1060,260,'DisplayName','Preferred Language',-1234),(1061,261,'Description','Gender',-1234),(1062,261,'SupportedByDefault','true',-1234),(1063,261,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(1064,261,'DisplayName','Gender',-1234),(1065,262,'Description','Time Zone',-1234),(1066,262,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(1067,262,'DisplayName','Time Zone',-1234),(1068,263,'Description','Title',-1234),(1069,263,'DisplayOrder','2',-1234),(1070,263,'Required','true',-1234),(1071,263,'SupportedByDefault','true',-1234),(1072,263,'MappedLocalClaim','http://wso2.org/claims/title',-1234),(1073,263,'DisplayName','Title',-1234),(1074,264,'Description','Number of failed backup code attempts',-1234),(1075,264,'DisplayOrder','1',-1234),(1076,264,'Required','true',-1234),(1077,264,'SupportedByDefault','true',-1234),(1078,264,'MappedLocalClaim','http://wso2.org/claims/identity/failedBackupCodeAttempts',-1234),(1079,264,'DisplayName','Failed Backup Code Attempts',-1234),(1080,265,'Description','Home Phone',-1234),(1081,265,'SupportedByDefault','true',-1234),(1082,265,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.home',-1234),(1083,265,'DisplayName','Home Phone',-1234),(1084,266,'Description','State, province, prefecture, or region component.',-1234),(1085,266,'MappedLocalClaim','http://wso2.org/claims/region',-1234),(1086,266,'DisplayName','One Time Password',-1234),(1087,267,'Description','Surname(s) or last name(s) of the End-User. Note that in some cultures, people can have multiple family names or no family name; all can be present, with the names being separated by space characters.',-1234),(1088,267,'DisplayOrder','4',-1234),(1089,267,'SupportedByDefault','true',-1234),(1090,267,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(1091,267,'DisplayName','Surname',-1234),(1092,268,'Description','Other Email',-1234),(1093,268,'DisplayOrder','5',-1234),(1094,268,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(1095,268,'SupportedByDefault','true',-1234),(1096,268,'MappedLocalClaim','http://wso2.org/claims/emails.other',-1234),(1097,268,'DisplayName','Emails - Other Email',-1234),(1098,269,'Description','Cost Center',-1234),(1099,269,'DisplayOrder','1',-1234),(1100,269,'Required','true',-1234),(1101,269,'SupportedByDefault','true',-1234),(1102,269,'MappedLocalClaim','http://wso2.org/claims/costCenter',-1234),(1103,269,'DisplayName','Cost Center',-1234),(1104,270,'Description','Other Phone Number',-1234),(1105,270,'DisplayOrder','5',-1234),(1106,270,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(1107,270,'SupportedByDefault','true',-1234),(1108,270,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.other',-1234),(1109,270,'DisplayName','Phone Numbers - Other',-1234),(1110,271,'Description','Address - Street',-1234),(1111,271,'DisplayOrder','5',-1234),(1112,271,'SupportedByDefault','true',-1234),(1113,271,'MappedLocalClaim','http://wso2.org/claims/streetaddress',-1234),(1114,271,'DisplayName','Address - Street',-1234),(1115,272,'Description','Id',-1234),(1116,272,'DisplayOrder','1',-1234),(1117,272,'Required','true',-1234),(1118,272,'SupportedByDefault','true',-1234),(1119,272,'MappedLocalClaim','http://wso2.org/claims/userid',-1234),(1120,272,'DisplayName','Id',-1234),(1121,273,'Description','Number of failed email OTP attempts',-1234),(1122,273,'DisplayOrder','1',-1234),(1123,273,'Required','true',-1234),(1124,273,'SupportedByDefault','true',-1234),(1125,273,'MappedLocalClaim','http://wso2.org/claims/identity/failedEmailOtpAttempts',-1234),(1126,273,'DisplayName','Account State',-1234),(1127,274,'Description','Photo',-1234),(1128,274,'DisplayOrder','5',-1234),(1129,274,'SupportedByDefault','true',-1234),(1130,274,'MappedLocalClaim','http://wso2.org/claims/photos',-1234),(1131,274,'DisplayName','Photo',-1234),(1132,275,'Description','Groups',-1234),(1133,275,'DisplayOrder','5',-1234),(1134,275,'SupportedByDefault','true',-1234),(1135,275,'MappedLocalClaim','http://wso2.org/claims/groups',-1234),(1136,275,'DisplayName','Groups',-1234),(1137,276,'Description','Address - Home',-1234),(1138,276,'DisplayOrder','5',-1234),(1139,276,'SupportedByDefault','true',-1234),(1140,276,'MappedLocalClaim','http://wso2.org/claims/addresses.locality',-1234),(1141,276,'DisplayName','Address - Home',-1234),(1142,277,'Description','Honoric Prefix',-1234),(1143,277,'DisplayOrder','2',-1234),(1144,277,'Required','true',-1234),(1145,277,'SupportedByDefault','true',-1234),(1146,277,'MappedLocalClaim','http://wso2.org/claims/honorificPrefix',-1234),(1147,277,'DisplayName','Name - Honoric Prefix',-1234),(1148,278,'Description','Unlock time',-1234),(1149,278,'DisplayOrder','1',-1234),(1150,278,'Required','true',-1234),(1151,278,'SupportedByDefault','true',-1234),(1152,278,'MappedLocalClaim','http://wso2.org/claims/identity/unlockTime',-1234),(1153,278,'DisplayName','Unlock Time',-1234),(1154,279,'Description','Address - Locality',-1234),(1155,279,'DisplayOrder','5',-1234),(1156,279,'SupportedByDefault','true',-1234),(1157,279,'MappedLocalClaim','http://wso2.org/claims/addresses.locality',-1234),(1158,279,'DisplayName','Address - Locality',-1234),(1159,280,'Description','Middle Name',-1234),(1160,280,'DisplayOrder','2',-1234),(1161,280,'Required','true',-1234),(1162,280,'SupportedByDefault','true',-1234),(1163,280,'MappedLocalClaim','http://wso2.org/claims/middleName',-1234),(1164,280,'DisplayName','Name - Middle Name',-1234),(1165,281,'Description','Entitlements',-1234),(1166,281,'DisplayOrder','5',-1234),(1167,281,'SupportedByDefault','true',-1234),(1168,281,'MappedLocalClaim','http://wso2.org/claims/entitlements',-1234),(1169,281,'DisplayName','Entitlements',-1234),(1170,282,'Description','Last login time',-1234),(1171,282,'DisplayOrder','1',-1234),(1172,282,'Required','true',-1234),(1173,282,'SupportedByDefault','true',-1234),(1174,282,'MappedLocalClaim','http://wso2.org/claims/identity/lastLoginTime',-1234),(1175,282,'DisplayName','Last Login Time',-1234),(1176,283,'Description','Display Name',-1234),(1177,283,'DisplayOrder','2',-1234),(1178,283,'Required','true',-1234),(1179,283,'SupportedByDefault','true',-1234),(1180,283,'MappedLocalClaim','http://wso2.org/claims/displayName',-1234),(1181,283,'DisplayName','Display Name',-1234),(1182,284,'Description','Meta - Created',-1234),(1183,284,'DisplayOrder','1',-1234),(1184,284,'Required','true',-1234),(1185,284,'SupportedByDefault','true',-1234),(1186,284,'MappedLocalClaim','http://wso2.org/claims/created',-1234),(1187,284,'DisplayName','Meta - Created',-1234),(1188,285,'Description','End-User\'s full name in displayable form including all name parts, possibly including titles and suffixes, ordered according to the End-User\'s locale and preferences',-1234),(1189,285,'DisplayOrder','2',-1234),(1190,285,'Required','true',-1234),(1191,285,'SupportedByDefault','true',-1234),(1192,285,'MappedLocalClaim','http://wso2.org/claims/fullname',-1234),(1193,285,'DisplayName','Full Name',-1234),(1194,286,'Description','End-User\'s locale, For example, en-US or fr-CA, en_US',-1234),(1195,286,'MappedLocalClaim','http://wso2.org/claims/local',-1234),(1196,286,'DisplayName','Locale',-1234),(1197,287,'Description','VAT Registration Number',-1234),(1198,287,'DisplayOrder','1',-1234),(1199,287,'Required','true',-1234),(1200,287,'SupportedByDefault','true',-1234),(1201,287,'MappedLocalClaim','http://wso2.org/claims/im',-1234),(1202,287,'DisplayName','VAT Registration Number',-1234),(1203,288,'Description','IM - Gtalk',-1234),(1204,288,'DisplayOrder','5',-1234),(1205,288,'SupportedByDefault','true',-1234),(1206,288,'MappedLocalClaim','http://wso2.org/claims/gtalk',-1234),(1207,288,'DisplayName','IM - Gtalk',-1234),(1208,289,'Description','Email Address',-1234),(1209,289,'Required','true',-1234),(1210,289,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(1211,289,'SupportedByDefault','true',-1234),(1212,289,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(1213,289,'DisplayName','Email',-1234),(1214,290,'Description','Other Phone',-1234),(1215,290,'MappedLocalClaim','http://wso2.org/claims/otherphone',-1234),(1216,290,'DisplayName','Other Phone',-1234),(1217,291,'Description','Date of birth',-1234),(1218,291,'DisplayOrder','1',-1234),(1219,291,'Required','true',-1234),(1220,291,'SupportedByDefault','true',-1234),(1221,291,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(1222,291,'DisplayName','Date of birth',-1234),(1223,292,'Description','User Type',-1234),(1224,292,'DisplayOrder','2',-1234),(1225,292,'Required','true',-1234),(1226,292,'SupportedByDefault','true',-1234),(1227,292,'MappedLocalClaim','http://wso2.org/claims/userType',-1234),(1228,292,'DisplayName','User Type',-1234),(1229,293,'Description','Manager - Display Name',-1234),(1230,293,'DisplayOrder','1',-1234),(1231,293,'Required','true',-1234),(1232,293,'SupportedByDefault','true',-1234),(1233,293,'MappedLocalClaim','http://wso2.org/claims/extendedDisplayName',-1234),(1234,293,'DisplayName','Manager - Display Name',-1234),(1235,294,'Description','Account locked',-1234),(1236,294,'DisplayOrder','1',-1234),(1237,294,'Required','true',-1234),(1238,294,'SupportedByDefault','true',-1234),(1239,294,'MappedLocalClaim','http://wso2.org/claims/identity/accountLocked',-1234),(1240,294,'DisplayName','Account Locked',-1234),(1241,295,'Description','Full street address component, which MAY include house number, street name, Post Office Box, and multi-line extended street address information.',-1234),(1242,295,'MappedLocalClaim','http://wso2.org/claims/streetaddress',-1234),(1243,295,'DisplayName','Street Address',-1234),(1244,296,'Description','Nick Name',-1234),(1245,296,'DisplayOrder','2',-1234),(1246,296,'Required','true',-1234),(1247,296,'SupportedByDefault','true',-1234),(1248,296,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(1249,296,'DisplayName','Nick Name',-1234),(1250,297,'Description','True if the End-User\'s phone number has been verified; otherwise false',-1234),(1251,297,'DisplayOrder','1',-1234),(1252,297,'Required','true',-1234),(1253,297,'SupportedByDefault','true',-1234),(1254,297,'MappedLocalClaim','http://wso2.org/claims/identity/phoneVerified',-1234),(1255,297,'DisplayName','Phone Verified',-1234),(1256,298,'Description','URL of the End-User\'s Web page or blog. This Web page SHOULD contain information published by the End-User or an organization that the End-User is affiliated with.',-1234),(1257,298,'DisplayOrder','10',-1234),(1258,298,'SupportedByDefault','true',-1234),(1259,298,'MappedLocalClaim','http://wso2.org/claims/websiteurl',-1234),(1260,298,'DisplayName','Website URL',-1234),(1261,299,'Description','Roles',-1234),(1262,299,'DisplayOrder','5',-1234),(1263,299,'SupportedByDefault','true',-1234),(1264,299,'MappedLocalClaim','http://wso2.org/claims/roles',-1234),(1265,299,'DisplayName','Roles',-1234),(1266,300,'Description','Email Addresses',-1234),(1267,300,'DisplayOrder','3',-1234),(1268,300,'Required','true',-1234),(1269,300,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(1270,300,'SupportedByDefault','true',-1234),(1271,300,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(1272,300,'DisplayName','Emails',-1234),(1273,301,'Description','Work Email',-1234),(1274,301,'DisplayOrder','5',-1234),(1275,301,'SupportedByDefault','true',-1234),(1276,301,'MappedLocalClaim','http://wso2.org/claims/emails.work',-1234),(1277,301,'DisplayName','Emails - Work Email',-1234),(1278,302,'Description','End-User\'s preferred telephone number. For example, +1 (425) 555-1212 or +56 (2) 687 2400., +1 (604) 555-1234;ext=5678.',-1234),(1279,302,'MappedLocalClaim','http://wso2.org/claims/telephone',-1234),(1280,302,'DisplayName','Phone Number',-1234),(1281,303,'Description','Gender',-1234),(1282,303,'DisplayOrder','1',-1234),(1283,303,'Required','true',-1234),(1284,303,'SupportedByDefault','true',-1234),(1285,303,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(1286,303,'DisplayName','Gender',-1234),(1287,304,'Description','Number of failed TOTP attempts',-1234),(1288,304,'DisplayOrder','1',-1234),(1289,304,'Required','true',-1234),(1290,304,'SupportedByDefault','true',-1234),(1291,304,'MappedLocalClaim','http://wso2.org/claims/identity/failedTotpAttempts',-1234),(1292,304,'DisplayName','Failed TOTP Attempts',-1234),(1293,305,'Description','Claim to store newly updated email address until the new email address is verified',-1234),(1294,305,'DisplayOrder','1',-1234),(1295,305,'Required','true',-1234),(1296,305,'SupportedByDefault','true',-1234),(1297,305,'MappedLocalClaim','http://wso2.org/claims/identity/emailaddress.pendingValue',-1234),(1298,305,'DisplayName','Verification Pending Email',-1234),(1299,306,'Description','Store whether the user account is disabled or not',-1234),(1300,306,'DisplayOrder','1',-1234),(1301,306,'Required','true',-1234),(1302,306,'SupportedByDefault','true',-1234),(1303,306,'MappedLocalClaim','http://wso2.org/claims/identity/accountDisabled',-1234),(1304,306,'DisplayName','Account Disabled',-1234),(1305,307,'Description','Id',-1234),(1306,307,'DisplayOrder','1',-1234),(1307,307,'Required','true',-1234),(1308,307,'SupportedByDefault','true',-1234),(1309,307,'MappedLocalClaim','http://wso2.org/claims/userid',-1234),(1310,307,'DisplayName','Id',-1234),(1311,308,'Description','Username of the End-User',-1234),(1312,308,'DisplayOrder','1',-1234),(1313,308,'Required','true',-1234),(1314,308,'SupportedByDefault','true',-1234),(1315,308,'MappedLocalClaim','http://wso2.org/claims/username',-1234),(1316,308,'DisplayName','Username',-1234),(1317,309,'Description','Nick Name',-1234),(1318,309,'DisplayOrder','2',-1234),(1319,309,'Required','true',-1234),(1320,309,'SupportedByDefault','true',-1234),(1321,309,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(1322,309,'DisplayName','Nick Name',-1234),(1323,310,'Description','Organization -department',-1234),(1324,310,'DisplayOrder','1',-1234),(1325,310,'Required','true',-1234),(1326,310,'SupportedByDefault','true',-1234),(1327,310,'MappedLocalClaim','http://wso2.org/claims/department',-1234),(1328,310,'DisplayName','Organization -department',-1234),(1329,311,'Description','Failed lockout count',-1234),(1330,311,'DisplayOrder','1',-1234),(1331,311,'Required','true',-1234),(1332,311,'SupportedByDefault','true',-1234),(1333,311,'MappedLocalClaim','http://wso2.org/claims/identity/failedLoginLockoutCount',-1234),(1334,311,'DisplayName','Failed Lockout Count',-1234),(1335,312,'Description','Number of failed SMS OTP attempts',-1234),(1336,312,'DisplayOrder','1',-1234),(1337,312,'Required','true',-1234),(1338,312,'SupportedByDefault','true',-1234),(1339,312,'MappedLocalClaim','http://wso2.org/claims/identity/failedSmsOtpAttempts',-1234),(1340,312,'DisplayName','Failed SMS OTP attempts',-1234),(1341,313,'Description','Number of consecutive failed attempts done for password recovery',-1234),(1342,313,'DisplayOrder','1',-1234),(1343,313,'Required','true',-1234),(1344,313,'SupportedByDefault','true',-1234),(1345,313,'MappedLocalClaim','http://wso2.org/claims/identity/failedPasswordRecoveryAttempts',-1234),(1346,313,'DisplayName','Failed Password Recovery Attempts',-1234),(1347,314,'Description','Home Phone',-1234),(1348,314,'DisplayOrder','5',-1234),(1349,314,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(1350,314,'SupportedByDefault','true',-1234),(1351,314,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.home',-1234),(1352,314,'DisplayName','Phone Numbers - Home Phone Number',-1234),(1353,315,'Description','End-User\'s birthday, represented as an ISO 8601:2004 [ISO8601-2004] YYYY-MM-DD format. The year MAY be 0000, indicating that it is omitted. To represent only the year, YYYY format is allowed.',-1234),(1354,315,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(1355,315,'DisplayName','Birth Date',-1234),(1356,316,'Description','Current Address',-1234),(1357,316,'DisplayOrder','1',-1234),(1358,316,'Required','true',-1234),(1359,316,'SupportedByDefault','true',-1234),(1360,316,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(1361,316,'DisplayName','Current Address',-1234),(1362,317,'Description','Standard Industrial Classification',-1234),(1363,317,'DisplayOrder','1',-1234),(1364,317,'Required','true',-1234),(1365,317,'SupportedByDefault','true',-1234),(1366,317,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(1367,317,'DisplayName','Standard Industrial Classification',-1234),(1368,318,'Description','Given Name',-1234),(1369,318,'DisplayOrder','1',-1234),(1370,318,'Required','true',-1234),(1371,318,'SupportedByDefault','true',-1234),(1372,318,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(1373,318,'DisplayName','Name - Given Name',-1234),(1374,319,'Description','Last password update time',-1234),(1375,319,'DisplayOrder','1',-1234),(1376,319,'Required','true',-1234),(1377,319,'SupportedByDefault','true',-1234),(1378,319,'MappedLocalClaim','http://wso2.org/claims/identity/lastPasswordUpdateTime',-1234),(1379,319,'DisplayName','Last Password Update Time',-1234),(1380,320,'Description','Email Address',-1234),(1381,320,'Required','true',-1234),(1382,320,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(1383,320,'SupportedByDefault','true',-1234),(1384,320,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(1385,320,'DisplayName','Email',-1234),(1386,321,'Description','Mobile Number',-1234),(1387,321,'DisplayOrder','5',-1234),(1388,321,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(1389,321,'SupportedByDefault','true',-1234),(1390,321,'MappedLocalClaim','http://wso2.org/claims/mobile',-1234),(1391,321,'DisplayName','Phone Numbers - Mobile Number',-1234),(1392,322,'Description','Country',-1234),(1393,322,'SupportedByDefault','true',-1234),(1394,322,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(1395,322,'DisplayName','Country',-1234),(1396,323,'Description','Date of Birth',-1234),(1397,323,'SupportedByDefault','true',-1234),(1398,323,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(1399,323,'DisplayName','DOB',-1234),(1400,324,'Description','Time the End-User\'s information was last updated. Its value is a JSON number representing the number of seconds from 1970-01-01T0:0:0Z as measured in UTC until the date/time.',-1234),(1401,324,'MappedLocalClaim','http://wso2.org/claims/modified',-1234),(1402,324,'DisplayName','Updated At',-1234),(1403,325,'Description','Profile URL',-1234),(1404,325,'DisplayOrder','2',-1234),(1405,325,'Required','true',-1234),(1406,325,'SupportedByDefault','true',-1234),(1407,325,'MappedLocalClaim','http://wso2.org/claims/url',-1234),(1408,325,'DisplayName','Profile URL',-1234),(1409,326,'Description','Store whether SMS OTP is enabled or disabled',-1234),(1410,326,'DisplayOrder','1',-1234),(1411,326,'Required','true',-1234),(1412,326,'SupportedByDefault','true',-1234),(1413,326,'MappedLocalClaim','http://wso2.org/claims/identity/smsotp_disabled',-1234),(1414,326,'DisplayName','Disable SMS OTP',-1234),(1415,327,'Description','Formatted Name',-1234),(1416,327,'DisplayOrder','2',-1234),(1417,327,'Required','true',-1234),(1418,327,'SupportedByDefault','true',-1234),(1419,327,'MappedLocalClaim','http://wso2.org/claims/formattedName',-1234),(1420,327,'DisplayName','Name - Formatted Name',-1234),(1421,328,'Description','Pager Phone Number',-1234),(1422,328,'DisplayOrder','5',-1234),(1423,328,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{2,3})[-. )]*(\\d{3})[-. ]*(\\d{4,6})(?: *x(\\d+))?\\s*$',-1234),(1424,328,'SupportedByDefault','true',-1234),(1425,328,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.pager',-1234),(1426,328,'DisplayName','Phone Numbers - Pager Phone Number',-1234),(1427,329,'Description','Fax Number',-1234),(1428,329,'DisplayOrder','5',-1234),(1429,329,'SupportedByDefault','true',-1234),(1430,329,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.fax',-1234),(1431,329,'DisplayName','Phone Numbers - Fax Number',-1234);
/*!40000 ALTER TABLE `IDN_CLAIM_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CONFIG_ATTRIBUTE`
--

DROP TABLE IF EXISTS `IDN_CONFIG_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CONFIG_ATTRIBUTE` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `RESOURCE_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ATTR_KEY` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ATTR_VALUE` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RESOURCE_KEY_VAL_CONSTRAINT` (`RESOURCE_ID`(64),`ATTR_KEY`),
  KEY `RESOURCE_ID_ATTRIBUTE_FOREIGN_CONSTRAINT` (`RESOURCE_ID`),
  CONSTRAINT `RESOURCE_ID_ATTRIBUTE_FOREIGN_CONSTRAINT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `IDN_CONFIG_RESOURCE` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CONFIG_ATTRIBUTE`
--

LOCK TABLES `IDN_CONFIG_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `IDN_CONFIG_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_CONFIG_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CONFIG_FILE`
--

DROP TABLE IF EXISTS `IDN_CONFIG_FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CONFIG_FILE` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `VALUE` blob,
  `RESOURCE_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RESOURCE_ID_FILE_FOREIGN_CONSTRAINT` (`RESOURCE_ID`),
  CONSTRAINT `RESOURCE_ID_FILE_FOREIGN_CONSTRAINT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `IDN_CONFIG_RESOURCE` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CONFIG_FILE`
--

LOCK TABLES `IDN_CONFIG_FILE` WRITE;
/*!40000 ALTER TABLE `IDN_CONFIG_FILE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_CONFIG_FILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CONFIG_RESOURCE`
--

DROP TABLE IF EXISTS `IDN_CONFIG_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CONFIG_RESOURCE` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_MODIFIED` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `HAS_FILE` tinyint(1) NOT NULL,
  `HAS_ATTRIBUTE` tinyint(1) NOT NULL,
  `TYPE_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME_TENANT_TYPE_CONSTRAINT` (`NAME`,`TENANT_ID`,`TYPE_ID`),
  KEY `TYPE_ID_FOREIGN_CONSTRAINT` (`TYPE_ID`),
  CONSTRAINT `TYPE_ID_FOREIGN_CONSTRAINT` FOREIGN KEY (`TYPE_ID`) REFERENCES `IDN_CONFIG_TYPE` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CONFIG_RESOURCE`
--

LOCK TABLES `IDN_CONFIG_RESOURCE` WRITE;
/*!40000 ALTER TABLE `IDN_CONFIG_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_CONFIG_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CONFIG_TYPE`
--

DROP TABLE IF EXISTS `IDN_CONFIG_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CONFIG_TYPE` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TYPE_NAME_CONSTRAINT` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CONFIG_TYPE`
--

LOCK TABLES `IDN_CONFIG_TYPE` WRITE;
/*!40000 ALTER TABLE `IDN_CONFIG_TYPE` DISABLE KEYS */;
INSERT INTO `IDN_CONFIG_TYPE` VALUES ('3c4ac3d0-5903-4e3d-aaca-38df65b33bfd','APPLICATION_TEMPLATE','Template type to uniquely identify Application templates'),('669b99ca-cdb0-44a6-8cae-babed3b585df','Publisher','A resource type to keep the event publisher configurations'),('73f6d9ca-62f4-4566-bab9-2a930ae51ba8','BRANDING_PREFERENCES','A resource type to keep the tenant branding preferences'),('899c69b2-8bf7-46b5-9666-f7f99f90d6cc','fido-config','A resource type to store FIDO authenticator related preferences'),('8ec6dbf1-218a-49bf-bc34-0d2db52d151c','CORS_CONFIGURATION','A resource type to keep the tenant CORS configurations'),('9ab0ef95-13e9-4ed5-afaf-d29bed62f7bd','IDP_TEMPLATE','Template type to uniquely identify IDP templates');
/*!40000 ALTER TABLE `IDN_CONFIG_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CORS_ASSOCIATION`
--

DROP TABLE IF EXISTS `IDN_CORS_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CORS_ASSOCIATION` (
  `IDN_CORS_ORIGIN_ID` int NOT NULL,
  `SP_APP_ID` int NOT NULL,
  PRIMARY KEY (`IDN_CORS_ORIGIN_ID`,`SP_APP_ID`),
  KEY `IDX_CORS_SP_APP_ID` (`SP_APP_ID`),
  KEY `IDX_CORS_ORIGIN_ID` (`IDN_CORS_ORIGIN_ID`),
  CONSTRAINT `IDN_CORS_ASSOCIATION_ibfk_1` FOREIGN KEY (`IDN_CORS_ORIGIN_ID`) REFERENCES `IDN_CORS_ORIGIN` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_CORS_ASSOCIATION_ibfk_2` FOREIGN KEY (`SP_APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CORS_ASSOCIATION`
--

LOCK TABLES `IDN_CORS_ASSOCIATION` WRITE;
/*!40000 ALTER TABLE `IDN_CORS_ASSOCIATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_CORS_ASSOCIATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CORS_ORIGIN`
--

DROP TABLE IF EXISTS `IDN_CORS_ORIGIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_CORS_ORIGIN` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `ORIGIN` varchar(2048) COLLATE latin1_general_ci NOT NULL,
  `UUID` char(36) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CORS_ORIGIN`
--

LOCK TABLES `IDN_CORS_ORIGIN` WRITE;
/*!40000 ALTER TABLE `IDN_CORS_ORIGIN` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_CORS_ORIGIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_FED_AUTH_SESSION_MAPPING`
--

DROP TABLE IF EXISTS `IDN_FED_AUTH_SESSION_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_FED_AUTH_SESSION_MAPPING` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDP_SESSION_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SESSION_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IDP_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `AUTHENTICATOR_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `PROTOCOL_TYPE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TENANT_ID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_SESSION_ID` (`IDP_SESSION_ID`,`TENANT_ID`),
  KEY `IDX_FEDERATED_AUTH_SESSION_ID` (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_FED_AUTH_SESSION_MAPPING`
--

LOCK TABLES `IDN_FED_AUTH_SESSION_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDN_FED_AUTH_SESSION_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_FED_AUTH_SESSION_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_FUNCTION_LIBRARY`
--

DROP TABLE IF EXISTS `IDN_FUNCTION_LIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_FUNCTION_LIBRARY` (
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `DATA` blob NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_FUNCTION_LIBRARY`
--

LOCK TABLES `IDN_FUNCTION_LIBRARY` WRITE;
/*!40000 ALTER TABLE `IDN_FUNCTION_LIBRARY` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_FUNCTION_LIBRARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_IDENTITY_META_DATA`
--

DROP TABLE IF EXISTS `IDN_IDENTITY_META_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_IDENTITY_META_DATA` (
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '-1234',
  `METADATA_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `METADATA` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `VALID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`USER_NAME`,`METADATA_TYPE`,`METADATA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_IDENTITY_META_DATA`
--

LOCK TABLES `IDN_IDENTITY_META_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_IDENTITY_META_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_IDENTITY_META_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_IDENTITY_USER_DATA`
--

DROP TABLE IF EXISTS `IDN_IDENTITY_USER_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_IDENTITY_USER_DATA` (
  `TENANT_ID` int NOT NULL DEFAULT '-1234',
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DATA_KEY` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DATA_VALUE` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`TENANT_ID`,`USER_NAME`,`DATA_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_IDENTITY_USER_DATA`
--

LOCK TABLES `IDN_IDENTITY_USER_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_IDENTITY_USER_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_IDENTITY_USER_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH1A_ACCESS_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH1A_ACCESS_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH1A_ACCESS_TOKEN` (
  `ACCESS_TOKEN` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ACCESS_TOKEN_SECRET` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `CONSUMER_KEY_ID` int DEFAULT NULL,
  `SCOPE` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `AUTHZ_USER` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`ACCESS_TOKEN`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  CONSTRAINT `IDN_OAUTH1A_ACCESS_TOKEN_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH1A_ACCESS_TOKEN`
--

LOCK TABLES `IDN_OAUTH1A_ACCESS_TOKEN` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH1A_ACCESS_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH1A_ACCESS_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH1A_REQUEST_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH1A_REQUEST_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH1A_REQUEST_TOKEN` (
  `REQUEST_TOKEN` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `REQUEST_TOKEN_SECRET` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `CONSUMER_KEY_ID` int DEFAULT NULL,
  `CALLBACK_URL` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `SCOPE` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `AUTHORIZED` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `OAUTH_VERIFIER` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `AUTHZ_USER` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`REQUEST_TOKEN`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  CONSTRAINT `IDN_OAUTH1A_REQUEST_TOKEN_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH1A_REQUEST_TOKEN`
--

LOCK TABLES `IDN_OAUTH1A_REQUEST_TOKEN` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH1A_REQUEST_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH1A_REQUEST_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_ACCESS_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_ACCESS_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_ACCESS_TOKEN` (
  `TOKEN_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ACCESS_TOKEN` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `CONSUMER_KEY_ID` int DEFAULT NULL,
  `AUTHZ_USER` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `USER_DOMAIN` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `USER_TYPE` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `GRANT_TYPE` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `REFRESH_TOKEN_TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VALIDITY_PERIOD` bigint DEFAULT NULL,
  `REFRESH_TOKEN_VALIDITY_PERIOD` bigint DEFAULT NULL,
  `TOKEN_SCOPE_HASH` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_STATE` varchar(25) COLLATE latin1_general_ci DEFAULT 'ACTIVE',
  `TOKEN_STATE_ID` varchar(128) COLLATE latin1_general_ci DEFAULT 'NONE',
  `SUBJECT_IDENTIFIER` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ACCESS_TOKEN_HASH` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `REFRESH_TOKEN_HASH` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `IDP_ID` int NOT NULL DEFAULT '-1',
  `TOKEN_BINDING_REF` varchar(32) COLLATE latin1_general_ci DEFAULT 'NONE',
  `CONSENTED_TOKEN` varchar(6) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`TOKEN_ID`),
  UNIQUE KEY `CON_APP_KEY` (`CONSUMER_KEY_ID`,`AUTHZ_USER`,`TENANT_ID`,`USER_DOMAIN`,`USER_TYPE`,`TOKEN_SCOPE_HASH`,`TOKEN_STATE`,`TOKEN_STATE_ID`,`IDP_ID`,`TOKEN_BINDING_REF`),
  KEY `IDX_TC` (`TIME_CREATED`),
  KEY `IDX_ATH` (`ACCESS_TOKEN_HASH`),
  KEY `IDX_AT_TI_UD` (`AUTHZ_USER`,`TENANT_ID`,`TOKEN_STATE`,`USER_DOMAIN`),
  KEY `IDX_AT_RTH` (`REFRESH_TOKEN_HASH`),
  KEY `IDX_AT_CKID_AU_TID_UD_TSH_TS` (`CONSUMER_KEY_ID`,`AUTHZ_USER`,`TENANT_ID`,`USER_DOMAIN`,`TOKEN_SCOPE_HASH`,`TOKEN_STATE`),
  KEY `IDX_IOAT_UT` (`USER_TYPE`),
  KEY `IDX_IOAT_TSH_TS` (`TOKEN_SCOPE_HASH`,`TOKEN_STATE`),
  CONSTRAINT `IDN_OAUTH2_ACCESS_TOKEN_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_ACCESS_TOKEN`
--

LOCK TABLES `IDN_OAUTH2_ACCESS_TOKEN` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_ACCESS_TOKEN` VALUES ('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','4067c785-f60f-3c97-93c9-bcf763d74e68','8bdf3c39-9d47-38e9-819d-9cda38185a34',1,'admin',-1234,'PRIMARY','APPLICATION_USER','authorization_code','2025-12-09 00:42:37','2025-12-08 22:45:25',3600000,86400000,'7b75b409acb761024f2611596511498c','ACTIVE','NONE','admin','{\"hash\":\"fe3afbd58b91dd00b9924e97331a29d954b609eb175bd1e7960473db5cc524e1\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"7436e33d36b4e008c59aaaad49bd4a8c1eaeae48492e17b7233d3156caa48235\",\"algorithm\":\"SHA-256\"}',1,'NONE','true');
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_ACCESS_TOKEN_AUDIT`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_ACCESS_TOKEN_AUDIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_ACCESS_TOKEN_AUDIT` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TOKEN_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ACCESS_TOKEN` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `CONSUMER_KEY_ID` int DEFAULT NULL,
  `AUTHZ_USER` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `USER_DOMAIN` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `USER_TYPE` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `GRANT_TYPE` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TIME_CREATED` timestamp NULL DEFAULT NULL,
  `REFRESH_TOKEN_TIME_CREATED` timestamp NULL DEFAULT NULL,
  `VALIDITY_PERIOD` bigint DEFAULT NULL,
  `REFRESH_TOKEN_VALIDITY_PERIOD` bigint DEFAULT NULL,
  `TOKEN_SCOPE_HASH` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_STATE` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_STATE_ID` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `SUBJECT_IDENTIFIER` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ACCESS_TOKEN_HASH` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `REFRESH_TOKEN_HASH` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `INVALIDATED_TIME` timestamp NULL DEFAULT NULL,
  `IDP_ID` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_ACCESS_TOKEN_AUDIT`
--

LOCK TABLES `IDN_OAUTH2_ACCESS_TOKEN_AUDIT` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN_AUDIT` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN_AUDIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_ACCESS_TOKEN_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_ACCESS_TOKEN_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` (
  `TOKEN_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TOKEN_SCOPE` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`TOKEN_ID`,`TOKEN_SCOPE`),
  KEY `IDX_ATS_TID` (`TOKEN_ID`),
  CONSTRAINT `IDN_OAUTH2_ACCESS_TOKEN_SCOPE_ibfk_1` FOREIGN KEY (`TOKEN_ID`) REFERENCES `IDN_OAUTH2_ACCESS_TOKEN` (`TOKEN_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_ACCESS_TOKEN_SCOPE`
--

LOCK TABLES `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` VALUES ('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:admin',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_create',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_definition_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_delete',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_generate_key',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_import_export',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_list_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_mediation_policy_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_product_import_export',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_publish',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:api_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:app_import_export',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:client_certificates_add',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:client_certificates_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:client_certificates_update',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:client_certificates_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:comment_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:comment_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:comment_write',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:common_operation_policy_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:common_operation_policy_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:document_create',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:document_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:ep_certificates_add',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:ep_certificates_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:ep_certificates_update',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:ep_certificates_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:mediation_policy_create',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:mediation_policy_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:mediation_policy_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:policies_import_export',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:publisher_settings',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:pub_alert_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:shared_scope_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:subscription_block',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:subscription_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:subscription_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:threat_protection_policy_create',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:threat_protection_policy_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:tier_manage',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','apim:tier_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','openid',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','service_catalog:service_view',-1234),('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','service_catalog:service_write',-1234);
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_AUTHORIZATION_CODE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_AUTHORIZATION_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_AUTHORIZATION_CODE` (
  `CODE_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `AUTHORIZATION_CODE` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `CONSUMER_KEY_ID` int DEFAULT NULL,
  `CALLBACK_URL` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `SCOPE` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `AUTHZ_USER` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `USER_DOMAIN` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VALIDITY_PERIOD` bigint DEFAULT NULL,
  `STATE` varchar(25) COLLATE latin1_general_ci DEFAULT 'ACTIVE',
  `TOKEN_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SUBJECT_IDENTIFIER` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `PKCE_CODE_CHALLENGE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `PKCE_CODE_CHALLENGE_METHOD` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `AUTHORIZATION_CODE_HASH` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `IDP_ID` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`CODE_ID`),
  KEY `IDX_AUTHORIZATION_CODE_HASH` (`AUTHORIZATION_CODE_HASH`,`CONSUMER_KEY_ID`),
  KEY `IDX_AUTHORIZATION_CODE_AU_TI` (`AUTHZ_USER`,`TENANT_ID`,`USER_DOMAIN`,`STATE`),
  KEY `IDX_AC_CKID` (`CONSUMER_KEY_ID`),
  KEY `IDX_AC_TID` (`TOKEN_ID`),
  CONSTRAINT `IDN_OAUTH2_AUTHORIZATION_CODE_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_AUTHORIZATION_CODE`
--

LOCK TABLES `IDN_OAUTH2_AUTHORIZATION_CODE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_AUTHORIZATION_CODE` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_AUTHORIZATION_CODE` VALUES ('27f322fa-8c49-4b64-b41d-35bc38198297','c84df22a-e277-3000-9bac-a5421bbdd31b',1,'https://localhost:9443/publisher/services/auth/callback/login','','admin',-1234,'PRIMARY','2025-12-06 23:20:01',300000,'INACTIVE','a7af705a-d0e8-4673-80b7-2d1ed4dd61fd','admin',NULL,NULL,'{\"hash\":\"26f3fe69a0d7ee2681e9b1cc8c73dbf90f54d1cfbcdbc8d98019c0044bcc69bb\",\"algorithm\":\"SHA-256\"}',1),('4545a621-8b2b-4959-9279-cb803034cbef','0439dfa9-3d1a-351d-b39c-ea18a9415fe7',1,'https://localhost:9443/publisher/services/auth/callback/login','','admin',-1234,'PRIMARY','2025-12-07 15:40:22',300000,'INACTIVE','ed41cb8b-582d-41ae-ae50-7ad7c1436696','admin',NULL,NULL,'{\"hash\":\"246e0162f5db4e4b5f05375a46b798446fc29df877f3626d6691ede447b37465\",\"algorithm\":\"SHA-256\"}',1),('5dff590c-2613-4a73-a536-026e3302a6b1','551f4636-4287-3d72-aeb9-bffc169c8b1e',1,'https://localhost:9443/publisher/services/auth/callback/login','','admin',-1234,'PRIMARY','2025-12-07 09:54:58',300000,'INACTIVE','9e65203f-c96a-49f0-92f7-16b983f0d772','admin',NULL,NULL,'{\"hash\":\"887a648480fe54ab8276239a6c7caeed8209cf81278cf69eecaf3d0ec3c7ab66\",\"algorithm\":\"SHA-256\"}',1),('832e340e-f1db-40c1-8139-67ceaf614285','83b8f068-8634-34e3-bacd-7d6ac33f7540',1,'https://localhost:9443/publisher/services/auth/callback/login','','admin',-1234,'PRIMARY','2025-12-09 00:42:37',300000,'INACTIVE','74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','admin',NULL,NULL,'{\"hash\":\"4e08ec4b591b444c28a4e71a749468989b3006b4cb4dd203841ba5f87aed27ac\",\"algorithm\":\"SHA-256\"}',1),('b9320739-f201-4bc5-b82b-b2680189ad19','6ad3ecab-e29a-3b97-a315-7d7dca2d3a2a',1,'https://localhost:9443/publisher/services/auth/callback/login','','admin',-1234,'PRIMARY','2025-12-07 09:52:58',300000,'INACTIVE','9e65203f-c96a-49f0-92f7-16b983f0d772','admin',NULL,NULL,'{\"hash\":\"6502039564ade8f378de125afe4d97c122d0e1f132794c73d53de5aca7651691\",\"algorithm\":\"SHA-256\"}',1),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','19c7e6b8-bb6f-355f-8819-04f6bd8bcd50',1,'https://localhost:9443/publisher/services/auth/callback/login','','admin',-1234,'PRIMARY','2025-12-07 12:54:43',300000,'INACTIVE','8eeaf7d6-c983-46de-a049-2c714f3f6f47','admin',NULL,NULL,'{\"hash\":\"7c6f75be0fdd0724d60479d9d09fc734c2f10a011dae494198b6d977d83488b8\",\"algorithm\":\"SHA-256\"}',1),('e8c28a97-2f5f-423e-bade-e24d820ba13d','720f7775-aa72-39aa-8d54-36dab9ddedb5',1,'https://localhost:9443/publisher/services/auth/callback/login','','admin',-1234,'PRIMARY','2025-12-08 22:45:25',300000,'INACTIVE','d2c7550c-6d6e-4e8b-a603-9886ac403441','admin',NULL,NULL,'{\"hash\":\"bd4876398b7a7e39679a0e08b2946ebbc95cc31e9b8bbef08379072cc2b43526\",\"algorithm\":\"SHA-256\"}',1),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','a151a329-b0a6-3fd4-910b-000b271455e1',1,'https://localhost:9443/publisher/services/auth/callback/login','','admin',-1234,'PRIMARY','2025-12-07 11:34:23',300000,'INACTIVE','6582d23e-e6b0-4404-8b23-3dc7e146d46d','admin',NULL,NULL,'{\"hash\":\"eb0f8de193e3dc32611479b9eb0e3f6b34b990b37056c0122a537e32cb2b3279\",\"algorithm\":\"SHA-256\"}',1);
/*!40000 ALTER TABLE `IDN_OAUTH2_AUTHORIZATION_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_AUTHZ_CODE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_AUTHZ_CODE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_AUTHZ_CODE_SCOPE` (
  `CODE_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SCOPE` varchar(60) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`CODE_ID`,`SCOPE`),
  CONSTRAINT `IDN_OAUTH2_AUTHZ_CODE_SCOPE_ibfk_1` FOREIGN KEY (`CODE_ID`) REFERENCES `IDN_OAUTH2_AUTHORIZATION_CODE` (`CODE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_AUTHZ_CODE_SCOPE`
--

LOCK TABLES `IDN_OAUTH2_AUTHZ_CODE_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_AUTHZ_CODE_SCOPE` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_AUTHZ_CODE_SCOPE` VALUES ('27f322fa-8c49-4b64-b41d-35bc38198297','apim:admin',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_create',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_definition_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_delete',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_generate_key',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_import_export',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_list_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_mediation_policy_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_product_import_export',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_publish',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:api_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:app_import_export',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:client_certificates_add',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:client_certificates_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:client_certificates_update',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:client_certificates_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:comment_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:comment_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:comment_write',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:common_operation_policy_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:common_operation_policy_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:document_create',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:document_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:ep_certificates_add',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:ep_certificates_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:ep_certificates_update',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:ep_certificates_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:mediation_policy_create',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:mediation_policy_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:mediation_policy_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:policies_import_export',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:publisher_settings',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:pub_alert_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:shared_scope_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:subscription_block',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:subscription_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:subscription_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:threat_protection_policy_create',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:threat_protection_policy_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:tier_manage',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','apim:tier_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','openid',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','service_catalog:service_view',-1234),('27f322fa-8c49-4b64-b41d-35bc38198297','service_catalog:service_write',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:admin',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_create',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_definition_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_delete',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_generate_key',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_import_export',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_list_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_mediation_policy_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_product_import_export',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_publish',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:api_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:app_import_export',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:client_certificates_add',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:client_certificates_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:client_certificates_update',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:client_certificates_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:comment_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:comment_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:comment_write',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:common_operation_policy_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:common_operation_policy_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:document_create',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:document_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:ep_certificates_add',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:ep_certificates_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:ep_certificates_update',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:ep_certificates_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:mediation_policy_create',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:mediation_policy_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:mediation_policy_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:policies_import_export',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:publisher_settings',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:pub_alert_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:shared_scope_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:subscription_block',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:subscription_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:subscription_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:threat_protection_policy_create',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:threat_protection_policy_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:tier_manage',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','apim:tier_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','openid',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','service_catalog:service_view',-1234),('4545a621-8b2b-4959-9279-cb803034cbef','service_catalog:service_write',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:admin',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_create',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_definition_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_delete',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_generate_key',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_import_export',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_list_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_mediation_policy_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_product_import_export',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_publish',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:api_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:app_import_export',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:client_certificates_add',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:client_certificates_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:client_certificates_update',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:client_certificates_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:comment_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:comment_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:comment_write',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:common_operation_policy_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:common_operation_policy_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:document_create',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:document_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:ep_certificates_add',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:ep_certificates_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:ep_certificates_update',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:ep_certificates_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:mediation_policy_create',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:mediation_policy_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:mediation_policy_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:policies_import_export',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:publisher_settings',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:pub_alert_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:shared_scope_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:subscription_block',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:subscription_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:subscription_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:threat_protection_policy_create',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:threat_protection_policy_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:tier_manage',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','apim:tier_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','openid',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','service_catalog:service_view',-1234),('5dff590c-2613-4a73-a536-026e3302a6b1','service_catalog:service_write',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:admin',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_create',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_definition_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_delete',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_generate_key',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_import_export',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_list_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_mediation_policy_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_product_import_export',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_publish',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:api_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:app_import_export',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:client_certificates_add',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:client_certificates_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:client_certificates_update',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:client_certificates_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:comment_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:comment_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:comment_write',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:common_operation_policy_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:common_operation_policy_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:document_create',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:document_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:ep_certificates_add',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:ep_certificates_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:ep_certificates_update',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:ep_certificates_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:mediation_policy_create',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:mediation_policy_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:mediation_policy_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:policies_import_export',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:publisher_settings',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:pub_alert_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:shared_scope_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:subscription_block',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:subscription_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:subscription_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:threat_protection_policy_create',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:threat_protection_policy_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:tier_manage',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','apim:tier_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','openid',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','service_catalog:service_view',-1234),('832e340e-f1db-40c1-8139-67ceaf614285','service_catalog:service_write',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:admin',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_create',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_definition_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_delete',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_generate_key',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_import_export',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_list_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_mediation_policy_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_product_import_export',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_publish',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:api_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:app_import_export',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:client_certificates_add',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:client_certificates_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:client_certificates_update',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:client_certificates_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:comment_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:comment_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:comment_write',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:common_operation_policy_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:common_operation_policy_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:document_create',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:document_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:ep_certificates_add',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:ep_certificates_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:ep_certificates_update',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:ep_certificates_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:mediation_policy_create',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:mediation_policy_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:mediation_policy_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:policies_import_export',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:publisher_settings',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:pub_alert_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:shared_scope_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:subscription_block',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:subscription_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:subscription_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:threat_protection_policy_create',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:threat_protection_policy_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:tier_manage',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','apim:tier_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','openid',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','service_catalog:service_view',-1234),('b9320739-f201-4bc5-b82b-b2680189ad19','service_catalog:service_write',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:admin',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_create',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_definition_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_delete',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_generate_key',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_import_export',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_list_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_mediation_policy_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_product_import_export',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_publish',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:api_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:app_import_export',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:client_certificates_add',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:client_certificates_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:client_certificates_update',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:client_certificates_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:comment_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:comment_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:comment_write',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:common_operation_policy_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:common_operation_policy_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:document_create',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:document_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:ep_certificates_add',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:ep_certificates_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:ep_certificates_update',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:ep_certificates_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:mediation_policy_create',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:mediation_policy_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:mediation_policy_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:policies_import_export',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:publisher_settings',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:pub_alert_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:shared_scope_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:subscription_block',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:subscription_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:subscription_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:threat_protection_policy_create',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:threat_protection_policy_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:tier_manage',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','apim:tier_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','openid',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','service_catalog:service_view',-1234),('d4be12b7-01ab-4cb5-85b0-b9dd505bd147','service_catalog:service_write',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:admin',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_create',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_definition_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_delete',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_generate_key',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_import_export',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_list_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_mediation_policy_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_product_import_export',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_publish',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:api_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:app_import_export',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:client_certificates_add',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:client_certificates_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:client_certificates_update',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:client_certificates_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:comment_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:comment_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:comment_write',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:common_operation_policy_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:common_operation_policy_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:document_create',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:document_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:ep_certificates_add',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:ep_certificates_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:ep_certificates_update',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:ep_certificates_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:mediation_policy_create',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:mediation_policy_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:mediation_policy_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:policies_import_export',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:publisher_settings',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:pub_alert_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:shared_scope_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:subscription_block',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:subscription_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:subscription_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:threat_protection_policy_create',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:threat_protection_policy_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:tier_manage',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','apim:tier_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','openid',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','service_catalog:service_view',-1234),('e8c28a97-2f5f-423e-bade-e24d820ba13d','service_catalog:service_write',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:admin',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_create',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_definition_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_delete',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_generate_key',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_import_export',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_list_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_mediation_policy_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_product_import_export',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_publish',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:api_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:app_import_export',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:client_certificates_add',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:client_certificates_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:client_certificates_update',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:client_certificates_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:comment_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:comment_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:comment_write',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:common_operation_policy_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:common_operation_policy_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:document_create',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:document_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:ep_certificates_add',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:ep_certificates_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:ep_certificates_update',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:ep_certificates_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:mediation_policy_create',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:mediation_policy_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:mediation_policy_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:policies_import_export',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:publisher_settings',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:pub_alert_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:shared_scope_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:subscription_block',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:subscription_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:subscription_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:threat_protection_policy_create',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:threat_protection_policy_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:tier_manage',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','apim:tier_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','openid',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','service_catalog:service_view',-1234),('f4619a55-059a-4f19-88ea-b5fe89f4dd08','service_catalog:service_write',-1234);
/*!40000 ALTER TABLE `IDN_OAUTH2_AUTHZ_CODE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_CIBA_AUTH_CODE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_CIBA_AUTH_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_CIBA_AUTH_CODE` (
  `AUTH_CODE_KEY` char(36) COLLATE latin1_general_ci NOT NULL,
  `AUTH_REQ_ID` char(36) COLLATE latin1_general_ci DEFAULT NULL,
  `ISSUED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CONSUMER_KEY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `LAST_POLLED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `POLLING_INTERVAL` int DEFAULT NULL,
  `EXPIRES_IN` int DEFAULT NULL,
  `AUTHENTICATED_USER_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `USER_STORE_DOMAIN` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `AUTH_REQ_STATUS` varchar(100) COLLATE latin1_general_ci DEFAULT 'REQUESTED',
  `IDP_ID` int DEFAULT NULL,
  PRIMARY KEY (`AUTH_CODE_KEY`),
  UNIQUE KEY `AUTH_REQ_ID` (`AUTH_REQ_ID`),
  KEY `CONSUMER_KEY` (`CONSUMER_KEY`),
  CONSTRAINT `IDN_OAUTH2_CIBA_AUTH_CODE_ibfk_1` FOREIGN KEY (`CONSUMER_KEY`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`CONSUMER_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_CIBA_AUTH_CODE`
--

LOCK TABLES `IDN_OAUTH2_CIBA_AUTH_CODE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_CIBA_AUTH_CODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_CIBA_AUTH_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_CIBA_REQUEST_SCOPES`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_CIBA_REQUEST_SCOPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_CIBA_REQUEST_SCOPES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AUTH_CODE_KEY` char(36) COLLATE latin1_general_ci DEFAULT NULL,
  `SCOPE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AUTH_CODE_KEY` (`AUTH_CODE_KEY`),
  CONSTRAINT `IDN_OAUTH2_CIBA_REQUEST_SCOPES_ibfk_1` FOREIGN KEY (`AUTH_CODE_KEY`) REFERENCES `IDN_OAUTH2_CIBA_AUTH_CODE` (`AUTH_CODE_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_CIBA_REQUEST_SCOPES`
--

LOCK TABLES `IDN_OAUTH2_CIBA_REQUEST_SCOPES` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_CIBA_REQUEST_SCOPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_CIBA_REQUEST_SCOPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_DEVICE_FLOW`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_DEVICE_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_DEVICE_FLOW` (
  `CODE_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `DEVICE_CODE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_CODE` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `QUANTIFIER` int NOT NULL DEFAULT '0',
  `CONSUMER_KEY_ID` int DEFAULT NULL,
  `LAST_POLL_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXPIRY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `POLL_TIME` bigint DEFAULT NULL,
  `STATUS` varchar(25) COLLATE latin1_general_ci DEFAULT 'PENDING',
  `AUTHZ_USER` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `USER_DOMAIN` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `IDP_ID` int DEFAULT NULL,
  PRIMARY KEY (`DEVICE_CODE`),
  UNIQUE KEY `CODE_ID` (`CODE_ID`),
  UNIQUE KEY `USRCDE_QNTFR_CONSTRAINT` (`USER_CODE`,`QUANTIFIER`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  CONSTRAINT `IDN_OAUTH2_DEVICE_FLOW_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_DEVICE_FLOW`
--

LOCK TABLES `IDN_OAUTH2_DEVICE_FLOW` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_DEVICE_FLOW` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_DEVICE_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_DEVICE_FLOW_SCOPES`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_DEVICE_FLOW_SCOPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_DEVICE_FLOW_SCOPES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCOPE_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SCOPE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `IDN_OAUTH2_DEVICE_FLOW_SCOPES_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_DEVICE_FLOW` (`CODE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_DEVICE_FLOW_SCOPES`
--

LOCK TABLES `IDN_OAUTH2_DEVICE_FLOW_SCOPES` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_DEVICE_FLOW_SCOPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_DEVICE_FLOW_SCOPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_RESOURCE_SCOPE` (
  `RESOURCE_PATH` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SCOPE_ID` int NOT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`RESOURCE_PATH`),
  KEY `SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `IDN_OAUTH2_RESOURCE_SCOPE_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_SCOPE` (`SCOPE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_RESOURCE_SCOPE`
--

LOCK TABLES `IDN_OAUTH2_RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_SCOPE` (
  `SCOPE_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '-1',
  `SCOPE_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_ID`),
  KEY `IDX_SC_TID` (`TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_SCOPE`
--

LOCK TABLES `IDN_OAUTH2_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_SCOPE` VALUES (1,'openid','Open ID','Indicate the use of OpenID Connect protocol.',-1234,'OIDC'),(2,'email','Email','View information related to email address of the user.',-1234,'OIDC'),(3,'profile','Profile','Retrieve profile information of the user.',-1234,'OIDC'),(4,'phone','Phone','View information related to phone number of the user.',-1234,'OIDC'),(5,'address','Address','View the address of the user.',-1234,'OIDC');
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_SCOPE_BINDING`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_SCOPE_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_SCOPE_BINDING` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCOPE_ID` int NOT NULL,
  `SCOPE_BINDING` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `BINDING_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SCOPE_ID` (`SCOPE_ID`,`SCOPE_BINDING`,`BINDING_TYPE`),
  KEY `IDX_SB_SCPID` (`SCOPE_ID`),
  CONSTRAINT `IDN_OAUTH2_SCOPE_BINDING_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_SCOPE` (`SCOPE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_SCOPE_BINDING`
--

LOCK TABLES `IDN_OAUTH2_SCOPE_BINDING` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_SCOPE_VALIDATORS`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_SCOPE_VALIDATORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_SCOPE_VALIDATORS` (
  `APP_ID` int NOT NULL,
  `SCOPE_VALIDATOR` varchar(128) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`APP_ID`,`SCOPE_VALIDATOR`),
  CONSTRAINT `IDN_OAUTH2_SCOPE_VALIDATORS_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_SCOPE_VALIDATORS`
--

LOCK TABLES `IDN_OAUTH2_SCOPE_VALIDATORS` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE_VALIDATORS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE_VALIDATORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_TOKEN_BINDING`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_TOKEN_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_TOKEN_BINDING` (
  `TOKEN_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_BINDING_TYPE` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_BINDING_REF` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_BINDING_VALUE` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1',
  UNIQUE KEY `TOKEN_ID` (`TOKEN_ID`,`TOKEN_BINDING_TYPE`,`TOKEN_BINDING_VALUE`),
  KEY `IDX_IDN_AUTH_BIND` (`TOKEN_BINDING_REF`),
  KEY `IDX_TK_VALUE_TYPE` (`TOKEN_BINDING_VALUE`,`TOKEN_BINDING_TYPE`),
  CONSTRAINT `IDN_OAUTH2_TOKEN_BINDING_ibfk_1` FOREIGN KEY (`TOKEN_ID`) REFERENCES `IDN_OAUTH2_ACCESS_TOKEN` (`TOKEN_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_TOKEN_BINDING`
--

LOCK TABLES `IDN_OAUTH2_TOKEN_BINDING` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_TOKEN_BINDING` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_TOKEN_BINDING` VALUES ('74a6ad48-f3dc-4d1f-ba37-4f4221b3c880','DEFAULT','dc54617ade1c32f325eec0481f662cf2','acad479a7a89ed86986a5a574bc60e67935bfad783dfd3165ff59f7796950b7b',-1234);
/*!40000 ALTER TABLE `IDN_OAUTH2_TOKEN_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_USER_CONSENT`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_USER_CONSENT` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `APP_ID` char(36) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '-1',
  `CONSENT_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`,`APP_ID`,`TENANT_ID`),
  UNIQUE KEY `CONSENT_ID` (`CONSENT_ID`),
  KEY `APP_ID` (`APP_ID`),
  CONSTRAINT `IDN_OAUTH2_USER_CONSENT_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_USER_CONSENT`
--

LOCK TABLES `IDN_OAUTH2_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_USER_CONSENTED_SCOPES`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_USER_CONSENTED_SCOPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH2_USER_CONSENTED_SCOPES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CONSENT_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '-1',
  `SCOPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CONSENT` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONSENT_ID` (`CONSENT_ID`,`SCOPE`),
  CONSTRAINT `IDN_OAUTH2_USER_CONSENTED_SCOPES_ibfk_1` FOREIGN KEY (`CONSENT_ID`) REFERENCES `IDN_OAUTH2_USER_CONSENT` (`CONSENT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_USER_CONSENTED_SCOPES`
--

LOCK TABLES `IDN_OAUTH2_USER_CONSENTED_SCOPES` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_USER_CONSENTED_SCOPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_USER_CONSENTED_SCOPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH_CONSUMER_APPS`
--

DROP TABLE IF EXISTS `IDN_OAUTH_CONSUMER_APPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OAUTH_CONSUMER_APPS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CONSUMER_KEY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `CONSUMER_SECRET` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `USERNAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '0',
  `USER_DOMAIN` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `APP_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `OAUTH_VERSION` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `CALLBACK_URL` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `GRANT_TYPES` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `PKCE_MANDATORY` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `PKCE_SUPPORT_PLAIN` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `APP_STATE` varchar(25) COLLATE latin1_general_ci DEFAULT 'ACTIVE',
  `USER_ACCESS_TOKEN_EXPIRE_TIME` bigint DEFAULT '3600',
  `APP_ACCESS_TOKEN_EXPIRE_TIME` bigint DEFAULT '3600',
  `REFRESH_TOKEN_EXPIRE_TIME` bigint DEFAULT '84600',
  `ID_TOKEN_EXPIRE_TIME` bigint DEFAULT '3600',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONSUMER_KEY_CONSTRAINT` (`CONSUMER_KEY`),
  KEY `IDX_OCA_UM_TID_UD_APN` (`USERNAME`,`TENANT_ID`,`USER_DOMAIN`,`APP_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH_CONSUMER_APPS`
--

LOCK TABLES `IDN_OAUTH_CONSUMER_APPS` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH_CONSUMER_APPS` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH_CONSUMER_APPS` VALUES (1,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','u3sjFAEFqxGQ8Hf939VgJnl_5fga','admin',-1234,'PRIMARY','apim_publisher','OAuth-2.0','regexp=(https://localhost:9443/publisher/services/auth/callback/login|https://localhost:9443/publisher/services/auth/callback/logout)','refresh_token authorization_code ','0','0','ACTIVE',3600,3600,86400,3600);
/*!40000 ALTER TABLE `IDN_OAUTH_CONSUMER_APPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_JTI`
--

DROP TABLE IF EXISTS `IDN_OIDC_JTI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OIDC_JTI` (
  `JWT_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `EXP_TIME` timestamp NOT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`JWT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_JTI`
--

LOCK TABLES `IDN_OIDC_JTI` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_JTI` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OIDC_JTI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_PROPERTY`
--

DROP TABLE IF EXISTS `IDN_OIDC_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OIDC_PROPERTY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PROPERTY_VALUE` varchar(2047) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_IOP_CK` (`CONSUMER_KEY`),
  CONSTRAINT `IDN_OIDC_PROPERTY_ibfk_1` FOREIGN KEY (`CONSUMER_KEY`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`CONSUMER_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_PROPERTY`
--

LOCK TABLES `IDN_OIDC_PROPERTY` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_PROPERTY` DISABLE KEYS */;
INSERT INTO `IDN_OIDC_PROPERTY` VALUES (1,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','requestObjectSigned','false'),(2,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','idTokenEncrypted','false'),(3,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','idTokenEncryptionAlgorithm','null'),(4,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','idTokenEncryptionMethod','null'),(5,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','backChannelLogoutURL',NULL),(6,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','frontchannelLogoutURL',NULL),(7,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','tokenType','Default'),(8,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','bypassClientCredentials','false'),(9,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','renewRefreshToken','true'),(10,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','tokenBindingType',NULL),(11,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','tokenRevocationWithIDPSessionTermination','false'),(12,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','tokenBindingValidation','false');
/*!40000 ALTER TABLE `IDN_OIDC_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_REQ_OBJECT_CLAIMS`
--

DROP TABLE IF EXISTS `IDN_OIDC_REQ_OBJECT_CLAIMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OIDC_REQ_OBJECT_CLAIMS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `REQ_OBJECT_ID` int DEFAULT NULL,
  `CLAIM_ATTRIBUTE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ESSENTIAL` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_USERINFO` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `REQ_OBJECT_ID` (`REQ_OBJECT_ID`),
  CONSTRAINT `IDN_OIDC_REQ_OBJECT_CLAIMS_ibfk_1` FOREIGN KEY (`REQ_OBJECT_ID`) REFERENCES `IDN_OIDC_REQ_OBJECT_REFERENCE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_REQ_OBJECT_CLAIMS`
--

LOCK TABLES `IDN_OIDC_REQ_OBJECT_CLAIMS` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJECT_CLAIMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJECT_CLAIMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_REQ_OBJECT_REFERENCE`
--

DROP TABLE IF EXISTS `IDN_OIDC_REQ_OBJECT_REFERENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OIDC_REQ_OBJECT_REFERENCE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CONSUMER_KEY_ID` int DEFAULT NULL,
  `CODE_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TOKEN_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SESSION_DATA_KEY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  KEY `CODE_ID` (`CODE_ID`),
  KEY `IDX_OROR_TID` (`TOKEN_ID`),
  CONSTRAINT `IDN_OIDC_REQ_OBJECT_REFERENCE_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_OIDC_REQ_OBJECT_REFERENCE_ibfk_2` FOREIGN KEY (`TOKEN_ID`) REFERENCES `IDN_OAUTH2_ACCESS_TOKEN` (`TOKEN_ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_OIDC_REQ_OBJECT_REFERENCE_ibfk_3` FOREIGN KEY (`CODE_ID`) REFERENCES `IDN_OAUTH2_AUTHORIZATION_CODE` (`CODE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_REQ_OBJECT_REFERENCE`
--

LOCK TABLES `IDN_OIDC_REQ_OBJECT_REFERENCE` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJECT_REFERENCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJECT_REFERENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_REQ_OBJ_CLAIM_VALUES`
--

DROP TABLE IF EXISTS `IDN_OIDC_REQ_OBJ_CLAIM_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OIDC_REQ_OBJ_CLAIM_VALUES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `REQ_OBJECT_CLAIMS_ID` int DEFAULT NULL,
  `CLAIM_VALUES` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `REQ_OBJECT_CLAIMS_ID` (`REQ_OBJECT_CLAIMS_ID`),
  CONSTRAINT `IDN_OIDC_REQ_OBJ_CLAIM_VALUES_ibfk_1` FOREIGN KEY (`REQ_OBJECT_CLAIMS_ID`) REFERENCES `IDN_OIDC_REQ_OBJECT_CLAIMS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_REQ_OBJ_CLAIM_VALUES`
--

LOCK TABLES `IDN_OIDC_REQ_OBJ_CLAIM_VALUES` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJ_CLAIM_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJ_CLAIM_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_SCOPE_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `IDN_OIDC_SCOPE_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OIDC_SCOPE_CLAIM_MAPPING` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SCOPE_ID` int NOT NULL,
  `EXTERNAL_CLAIM_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SCOPE_ID` (`SCOPE_ID`,`EXTERNAL_CLAIM_ID`),
  KEY `EXTERNAL_CLAIM_ID` (`EXTERNAL_CLAIM_ID`),
  KEY `IDX_AT_SI_ECI` (`SCOPE_ID`,`EXTERNAL_CLAIM_ID`),
  CONSTRAINT `IDN_OIDC_SCOPE_CLAIM_MAPPING_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_SCOPE` (`SCOPE_ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_OIDC_SCOPE_CLAIM_MAPPING_ibfk_2` FOREIGN KEY (`EXTERNAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_SCOPE_CLAIM_MAPPING`
--

LOCK TABLES `IDN_OIDC_SCOPE_CLAIM_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_SCOPE_CLAIM_MAPPING` DISABLE KEYS */;
INSERT INTO `IDN_OIDC_SCOPE_CLAIM_MAPPING` VALUES (1,2,135),(2,2,246),(6,3,111),(4,3,141),(12,3,147),(8,3,162),(10,3,163),(15,3,178),(7,3,206),(9,3,257),(16,3,267),(14,3,285),(11,3,286),(3,3,298),(17,3,308),(5,3,315),(13,3,324),(18,4,209),(19,4,302),(25,5,218),(22,5,223),(21,5,232),(23,5,259),(24,5,266),(20,5,295);
/*!40000 ALTER TABLE `IDN_OIDC_SCOPE_CLAIM_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OPENID_ASSOCIATIONS`
--

DROP TABLE IF EXISTS `IDN_OPENID_ASSOCIATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OPENID_ASSOCIATIONS` (
  `HANDLE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ASSOC_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `EXPIRE_IN` timestamp NOT NULL,
  `MAC_KEY` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ASSOC_STORE` varchar(128) COLLATE latin1_general_ci DEFAULT 'SHARED',
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`HANDLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OPENID_ASSOCIATIONS`
--

LOCK TABLES `IDN_OPENID_ASSOCIATIONS` WRITE;
/*!40000 ALTER TABLE `IDN_OPENID_ASSOCIATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OPENID_ASSOCIATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OPENID_REMEMBER_ME`
--

DROP TABLE IF EXISTS `IDN_OPENID_REMEMBER_ME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OPENID_REMEMBER_ME` (
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '0',
  `COOKIE_VALUE` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`USER_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OPENID_REMEMBER_ME`
--

LOCK TABLES `IDN_OPENID_REMEMBER_ME` WRITE;
/*!40000 ALTER TABLE `IDN_OPENID_REMEMBER_ME` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OPENID_REMEMBER_ME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OPENID_USER_RPS`
--

DROP TABLE IF EXISTS `IDN_OPENID_USER_RPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_OPENID_USER_RPS` (
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '0',
  `RP_URL` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TRUSTED_ALWAYS` varchar(128) COLLATE latin1_general_ci DEFAULT 'FALSE',
  `LAST_VISIT` date NOT NULL,
  `VISIT_COUNT` int DEFAULT '0',
  `DEFAULT_PROFILE_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT 'DEFAULT',
  PRIMARY KEY (`USER_NAME`,`TENANT_ID`,`RP_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OPENID_USER_RPS`
--

LOCK TABLES `IDN_OPENID_USER_RPS` WRITE;
/*!40000 ALTER TABLE `IDN_OPENID_USER_RPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OPENID_USER_RPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_PASSWORD_HISTORY_DATA`
--

DROP TABLE IF EXISTS `IDN_PASSWORD_HISTORY_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_PASSWORD_HISTORY_DATA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_DOMAIN` varchar(127) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int DEFAULT '-1',
  `SALT_VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `HASH` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_PASSWORD_HISTORY_DATA`
--

LOCK TABLES `IDN_PASSWORD_HISTORY_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_PASSWORD_HISTORY_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_PASSWORD_HISTORY_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_RECOVERY_DATA`
--

DROP TABLE IF EXISTS `IDN_RECOVERY_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_RECOVERY_DATA` (
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_DOMAIN` varchar(127) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '-1',
  `CODE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SCENARIO` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `STEP` varchar(127) COLLATE latin1_general_ci NOT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `REMAINING_SETS` varchar(2500) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`USER_NAME`,`USER_DOMAIN`,`TENANT_ID`,`SCENARIO`,`STEP`),
  UNIQUE KEY `CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_RECOVERY_DATA`
--

LOCK TABLES `IDN_RECOVERY_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_RECOVERY_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_RECOVERY_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_REMOTE_FETCH_CONFIG`
--

DROP TABLE IF EXISTS `IDN_REMOTE_FETCH_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_REMOTE_FETCH_CONFIG` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `IS_ENABLED` char(1) COLLATE latin1_general_ci NOT NULL,
  `REPO_MANAGER_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ACTION_LISTENER_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CONFIG_DEPLOYER_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `REMOTE_FETCH_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `REMOTE_RESOURCE_URI` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ATTRIBUTES_JSON` mediumtext COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UC_REMOTE_RESOURCE_TYPE` (`TENANT_ID`,`CONFIG_DEPLOYER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_REMOTE_FETCH_CONFIG`
--

LOCK TABLES `IDN_REMOTE_FETCH_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDN_REMOTE_FETCH_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_REMOTE_FETCH_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_REMOTE_FETCH_REVISIONS`
--

DROP TABLE IF EXISTS `IDN_REMOTE_FETCH_REVISIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_REMOTE_FETCH_REVISIONS` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CONFIG_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `FILE_PATH` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `FILE_HASH` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `DEPLOYED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_SYNC_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DEPLOYMENT_STATUS` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ITEM_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `DEPLOY_ERR_LOG` mediumtext COLLATE latin1_general_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UC_REVISIONS` (`CONFIG_ID`,`ITEM_NAME`),
  KEY `IDX_REMOTE_FETCH_REVISION_CONFIG_ID` (`CONFIG_ID`),
  CONSTRAINT `IDN_REMOTE_FETCH_REVISIONS_ibfk_1` FOREIGN KEY (`CONFIG_ID`) REFERENCES `IDN_REMOTE_FETCH_CONFIG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_REMOTE_FETCH_REVISIONS`
--

LOCK TABLES `IDN_REMOTE_FETCH_REVISIONS` WRITE;
/*!40000 ALTER TABLE `IDN_REMOTE_FETCH_REVISIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_REMOTE_FETCH_REVISIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_SAML2_ARTIFACT_STORE`
--

DROP TABLE IF EXISTS `IDN_SAML2_ARTIFACT_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_SAML2_ARTIFACT_STORE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `MESSAGE_HANDLER` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `AUTHN_REQ_DTO` blob NOT NULL,
  `SESSION_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `EXP_TIMESTAMP` timestamp NOT NULL,
  `INIT_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ASSERTION_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_SAML2_ARTIFACT_STORE`
--

LOCK TABLES `IDN_SAML2_ARTIFACT_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_SAML2_ARTIFACT_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_SAML2_ARTIFACT_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_SAML2_ASSERTION_STORE`
--

DROP TABLE IF EXISTS `IDN_SAML2_ASSERTION_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_SAML2_ASSERTION_STORE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SAML2_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SAML2_ISSUER` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SAML2_SUBJECT` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SAML2_SESSION_INDEX` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SAML2_AUTHN_CONTEXT_CLASS_REF` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `SAML2_ASSERTION` varchar(4096) COLLATE latin1_general_ci DEFAULT NULL,
  `ASSERTION` blob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_SAML2_ASSERTION_STORE`
--

LOCK TABLES `IDN_SAML2_ASSERTION_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_SAML2_ASSERTION_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_SAML2_ASSERTION_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_SCIM_GROUP`
--

DROP TABLE IF EXISTS `IDN_SCIM_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_SCIM_GROUP` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `ROLE_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ATTR_NAME` varchar(1024) COLLATE latin1_general_ci NOT NULL,
  `ATTR_VALUE` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`ROLE_NAME`,`ATTR_NAME`),
  KEY `IDX_IDN_SCIM_GROUP_TI_RN` (`TENANT_ID`,`ROLE_NAME`),
  KEY `IDX_IDN_SCIM_GROUP_TI_RN_AN` (`TENANT_ID`,`ROLE_NAME`,`ATTR_NAME`(500))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_SCIM_GROUP`
--

LOCK TABLES `IDN_SCIM_GROUP` WRITE;
/*!40000 ALTER TABLE `IDN_SCIM_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_SCIM_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_SECRET`
--

DROP TABLE IF EXISTS `IDN_SECRET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_SECRET` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `SECRET_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SECRET_VALUE` varchar(8000) COLLATE latin1_general_ci NOT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LAST_MODIFIED` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `TYPE_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SECRET_NAME` (`SECRET_NAME`,`TENANT_ID`,`TYPE_ID`),
  KEY `TYPE_ID` (`TYPE_ID`),
  CONSTRAINT `IDN_SECRET_ibfk_1` FOREIGN KEY (`TYPE_ID`) REFERENCES `IDN_SECRET_TYPE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_SECRET`
--

LOCK TABLES `IDN_SECRET` WRITE;
/*!40000 ALTER TABLE `IDN_SECRET` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_SECRET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_SECRET_TYPE`
--

DROP TABLE IF EXISTS `IDN_SECRET_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_SECRET_TYPE` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SECRET_TYPE_NAME_CONSTRAINT` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_SECRET_TYPE`
--

LOCK TABLES `IDN_SECRET_TYPE` WRITE;
/*!40000 ALTER TABLE `IDN_SECRET_TYPE` DISABLE KEYS */;
INSERT INTO `IDN_SECRET_TYPE` VALUES ('1358bdbf-e0cc-4268-a42c-c3e0960e13f0','ADAPTIVE_AUTH_CALL_CHOREO','Secret type to uniquely identify secrets relevant to callChoreo adaptive auth function');
/*!40000 ALTER TABLE `IDN_SECRET_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_STS_STORE`
--

DROP TABLE IF EXISTS `IDN_STS_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_STS_STORE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TOKEN_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TOKEN_CONTENT` blob NOT NULL,
  `CREATE_DATE` timestamp NOT NULL,
  `EXPIRE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATE` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_STS_STORE`
--

LOCK TABLES `IDN_STS_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_STS_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_STS_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_THRIFT_SESSION`
--

DROP TABLE IF EXISTS `IDN_THRIFT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_THRIFT_SESSION` (
  `SESSION_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CREATED_TIME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `LAST_MODIFIED_TIME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`SESSION_ID`),
  KEY `IDX_ITS_LMT` (`LAST_MODIFIED_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_THRIFT_SESSION`
--

LOCK TABLES `IDN_THRIFT_SESSION` WRITE;
/*!40000 ALTER TABLE `IDN_THRIFT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_THRIFT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_PERMISSION_TICKET`
--

DROP TABLE IF EXISTS `IDN_UMA_PERMISSION_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_UMA_PERMISSION_TICKET` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PT` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXPIRY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TICKET_STATE` varchar(25) COLLATE latin1_general_ci DEFAULT 'ACTIVE',
  `TENANT_ID` int DEFAULT '-1234',
  `TOKEN_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PT` (`PT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_PERMISSION_TICKET`
--

LOCK TABLES `IDN_UMA_PERMISSION_TICKET` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_PERMISSION_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_PERMISSION_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_PT_RESOURCE`
--

DROP TABLE IF EXISTS `IDN_UMA_PT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_UMA_PT_RESOURCE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PT_RESOURCE_ID` int NOT NULL,
  `PT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PT_ID` (`PT_ID`),
  KEY `PT_RESOURCE_ID` (`PT_RESOURCE_ID`),
  CONSTRAINT `IDN_UMA_PT_RESOURCE_ibfk_1` FOREIGN KEY (`PT_ID`) REFERENCES `IDN_UMA_PERMISSION_TICKET` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_UMA_PT_RESOURCE_ibfk_2` FOREIGN KEY (`PT_RESOURCE_ID`) REFERENCES `IDN_UMA_RESOURCE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_PT_RESOURCE`
--

LOCK TABLES `IDN_UMA_PT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_PT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_PT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_PT_RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_UMA_PT_RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_UMA_PT_RESOURCE_SCOPE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PT_RESOURCE_ID` int NOT NULL,
  `PT_SCOPE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PT_RESOURCE_ID` (`PT_RESOURCE_ID`),
  KEY `PT_SCOPE_ID` (`PT_SCOPE_ID`),
  CONSTRAINT `IDN_UMA_PT_RESOURCE_SCOPE_ibfk_1` FOREIGN KEY (`PT_RESOURCE_ID`) REFERENCES `IDN_UMA_PT_RESOURCE` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_UMA_PT_RESOURCE_SCOPE_ibfk_2` FOREIGN KEY (`PT_SCOPE_ID`) REFERENCES `IDN_UMA_RESOURCE_SCOPE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_PT_RESOURCE_SCOPE`
--

LOCK TABLES `IDN_UMA_PT_RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_PT_RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_PT_RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_RESOURCE`
--

DROP TABLE IF EXISTS `IDN_UMA_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_UMA_RESOURCE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RESOURCE_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `RESOURCE_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL,
  `RESOURCE_OWNER_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `CLIENT_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1234',
  `USER_DOMAIN` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_RID` (`RESOURCE_ID`),
  KEY `IDX_USER` (`RESOURCE_OWNER_NAME`,`USER_DOMAIN`),
  KEY `IDX_USER_RID` (`RESOURCE_ID`,`RESOURCE_OWNER_NAME`(32),`USER_DOMAIN`,`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_RESOURCE`
--

LOCK TABLES `IDN_UMA_RESOURCE` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_RESOURCE_META_DATA`
--

DROP TABLE IF EXISTS `IDN_UMA_RESOURCE_META_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_UMA_RESOURCE_META_DATA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RESOURCE_IDENTITY` int NOT NULL,
  `PROPERTY_KEY` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `PROPERTY_VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RESOURCE_IDENTITY` (`RESOURCE_IDENTITY`),
  CONSTRAINT `IDN_UMA_RESOURCE_META_DATA_ibfk_1` FOREIGN KEY (`RESOURCE_IDENTITY`) REFERENCES `IDN_UMA_RESOURCE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_RESOURCE_META_DATA`
--

LOCK TABLES `IDN_UMA_RESOURCE_META_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE_META_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE_META_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_UMA_RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_UMA_RESOURCE_SCOPE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RESOURCE_IDENTITY` int NOT NULL,
  `SCOPE_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RESOURCE_IDENTITY` (`RESOURCE_IDENTITY`),
  KEY `IDX_RS` (`SCOPE_NAME`),
  CONSTRAINT `IDN_UMA_RESOURCE_SCOPE_ibfk_1` FOREIGN KEY (`RESOURCE_IDENTITY`) REFERENCES `IDN_UMA_RESOURCE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_RESOURCE_SCOPE`
--

LOCK TABLES `IDN_UMA_RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_USER_ACCOUNT_ASSOCIATION`
--

DROP TABLE IF EXISTS `IDN_USER_ACCOUNT_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_USER_ACCOUNT_ASSOCIATION` (
  `ASSOCIATION_KEY` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `DOMAIN_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`DOMAIN_NAME`,`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_USER_ACCOUNT_ASSOCIATION`
--

LOCK TABLES `IDN_USER_ACCOUNT_ASSOCIATION` WRITE;
/*!40000 ALTER TABLE `IDN_USER_ACCOUNT_ASSOCIATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_USER_ACCOUNT_ASSOCIATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_USER_FUNCTIONALITY_MAPPING`
--

DROP TABLE IF EXISTS `IDN_USER_FUNCTIONALITY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_USER_FUNCTIONALITY_MAPPING` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `FUNCTIONALITY_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IS_FUNCTIONALITY_LOCKED` tinyint(1) NOT NULL,
  `FUNCTIONALITY_UNLOCK_TIME` bigint NOT NULL,
  `FUNCTIONALITY_LOCK_REASON` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  `FUNCTIONALITY_LOCK_REASON_CODE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDN_USER_FUNCTIONALITY_MAPPING_CONSTRAINT` (`USER_ID`,`TENANT_ID`,`FUNCTIONALITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_USER_FUNCTIONALITY_MAPPING`
--

LOCK TABLES `IDN_USER_FUNCTIONALITY_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDN_USER_FUNCTIONALITY_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_USER_FUNCTIONALITY_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_USER_FUNCTIONALITY_PROPERTY`
--

DROP TABLE IF EXISTS `IDN_USER_FUNCTIONALITY_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDN_USER_FUNCTIONALITY_PROPERTY` (
  `ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL,
  `FUNCTIONALITY_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PROPERTY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `PROPERTY_VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDN_USER_FUNCTIONALITY_PROPERTY_CONSTRAINT` (`USER_ID`,`TENANT_ID`,`FUNCTIONALITY_ID`,`PROPERTY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_USER_FUNCTIONALITY_PROPERTY`
--

LOCK TABLES `IDN_USER_FUNCTIONALITY_PROPERTY` WRITE;
/*!40000 ALTER TABLE `IDN_USER_FUNCTIONALITY_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_USER_FUNCTIONALITY_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP`
--

DROP TABLE IF EXISTS `IDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int DEFAULT NULL,
  `NAME` varchar(254) COLLATE latin1_general_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '1',
  `IS_PRIMARY` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `HOME_REALM_ID` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `IMAGE` mediumblob,
  `CERTIFICATE` blob,
  `ALIAS` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `INBOUND_PROV_ENABLED` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `INBOUND_PROV_USER_STORE_ID` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `USER_CLAIM_URI` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `ROLE_CLAIM_URI` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `DEFAULT_AUTHENTICATOR_NAME` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `DEFAULT_PRO_CONNECTOR_NAME` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `PROVISIONING_ROLE` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_FEDERATION_HUB` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `IS_LOCAL_CLAIM_DIALECT` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `IMAGE_URL` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `UUID` char(36) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UUID` (`UUID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP`
--

LOCK TABLES `IDP` WRITE;
/*!40000 ALTER TABLE `IDP` DISABLE KEYS */;
INSERT INTO `IDP` VALUES (1,-1234,'LOCAL','1','1','localhost',NULL,_binary '[]',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,'5c093383-a2fb-4a2b-a2c3-314e96424acb');
/*!40000 ALTER TABLE `IDP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_AUTHENTICATOR`
--

DROP TABLE IF EXISTS `IDP_AUTHENTICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_AUTHENTICATOR` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int DEFAULT NULL,
  `IDP_ID` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE latin1_general_ci DEFAULT '1',
  `DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`NAME`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `IDP_AUTHENTICATOR_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_AUTHENTICATOR`
--

LOCK TABLES `IDP_AUTHENTICATOR` WRITE;
/*!40000 ALTER TABLE `IDP_AUTHENTICATOR` DISABLE KEYS */;
INSERT INTO `IDP_AUTHENTICATOR` VALUES (1,-1234,1,'passivests','0',NULL),(2,-1234,1,'samlsso','0',NULL),(3,-1234,1,'openidconnect','0',NULL);
/*!40000 ALTER TABLE `IDP_AUTHENTICATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_AUTHENTICATOR_PROPERTY`
--

DROP TABLE IF EXISTS `IDP_AUTHENTICATOR_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_AUTHENTICATOR_PROPERTY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int DEFAULT NULL,
  `AUTHENTICATOR_ID` int DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PROPERTY_VALUE` varchar(2047) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_SECRET` char(1) COLLATE latin1_general_ci DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`AUTHENTICATOR_ID`,`PROPERTY_KEY`),
  KEY `AUTHENTICATOR_ID` (`AUTHENTICATOR_ID`),
  CONSTRAINT `IDP_AUTHENTICATOR_PROPERTY_ibfk_1` FOREIGN KEY (`AUTHENTICATOR_ID`) REFERENCES `IDP_AUTHENTICATOR` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_AUTHENTICATOR_PROPERTY`
--

LOCK TABLES `IDP_AUTHENTICATOR_PROPERTY` WRITE;
/*!40000 ALTER TABLE `IDP_AUTHENTICATOR_PROPERTY` DISABLE KEYS */;
INSERT INTO `IDP_AUTHENTICATOR_PROPERTY` VALUES (1,-1234,1,'IdPEntityId','localhost','0'),(2,-1234,2,'IdPEntityId','localhost','0'),(3,-1234,2,'SAMLMetadataSigningEnabled','false','0'),(4,-1234,2,'SAMLMetadataValidityPeriod','60','0'),(5,-1234,2,'samlAuthnRequestsSigningEnabled','false','0'),(6,-1234,3,'IdPEntityId','https://localhost:9443/oauth2/token','0');
/*!40000 ALTER TABLE `IDP_AUTHENTICATOR_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_CLAIM`
--

DROP TABLE IF EXISTS `IDP_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_CLAIM` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDP_ID` int DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `CLAIM` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ID` (`IDP_ID`,`CLAIM`),
  CONSTRAINT `IDP_CLAIM_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_CLAIM`
--

LOCK TABLES `IDP_CLAIM` WRITE;
/*!40000 ALTER TABLE `IDP_CLAIM` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_CLAIM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `IDP_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_CLAIM_MAPPING` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDP_CLAIM_ID` int DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `LOCAL_CLAIM` varchar(253) COLLATE latin1_general_ci DEFAULT NULL,
  `DEFAULT_VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_REQUESTED` varchar(128) COLLATE latin1_general_ci DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_CLAIM_ID` (`IDP_CLAIM_ID`,`TENANT_ID`,`LOCAL_CLAIM`),
  CONSTRAINT `IDP_CLAIM_MAPPING_ibfk_1` FOREIGN KEY (`IDP_CLAIM_ID`) REFERENCES `IDP_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_CLAIM_MAPPING`
--

LOCK TABLES `IDP_CLAIM_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDP_CLAIM_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_CLAIM_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_LOCAL_CLAIM`
--

DROP TABLE IF EXISTS `IDP_LOCAL_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_LOCAL_CLAIM` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int DEFAULT NULL,
  `IDP_ID` int DEFAULT NULL,
  `CLAIM_URI` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DEFAULT_VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_REQUESTED` varchar(128) COLLATE latin1_general_ci DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`CLAIM_URI`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `IDP_LOCAL_CLAIM_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_LOCAL_CLAIM`
--

LOCK TABLES `IDP_LOCAL_CLAIM` WRITE;
/*!40000 ALTER TABLE `IDP_LOCAL_CLAIM` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_LOCAL_CLAIM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_METADATA`
--

DROP TABLE IF EXISTS `IDP_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_METADATA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDP_ID` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `VALUE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_METADATA_CONSTRAINT` (`IDP_ID`,`NAME`),
  CONSTRAINT `IDP_METADATA_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_METADATA`
--

LOCK TABLES `IDP_METADATA` WRITE;
/*!40000 ALTER TABLE `IDP_METADATA` DISABLE KEYS */;
INSERT INTO `IDP_METADATA` VALUES (1,1,'RememberMeTimeout','20160',NULL,-1234),(2,1,'SessionIdleTimeout','15',NULL,-1234),(3,1,'PASSWORD_PROVISIONING_ENABLED','false',NULL,-1234),(4,1,'MODIFY_USERNAME_ENABLED','false',NULL,-1234),(5,1,'PROMPT_CONSENT_ENABLED','false',NULL,-1234);
/*!40000 ALTER TABLE `IDP_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_PROVISIONING_CONFIG`
--

DROP TABLE IF EXISTS `IDP_PROVISIONING_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_PROVISIONING_CONFIG` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int DEFAULT NULL,
  `IDP_ID` int DEFAULT NULL,
  `PROVISIONING_CONNECTOR_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `IS_BLOCKING` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `IS_RULES_ENABLED` char(1) COLLATE latin1_general_ci DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`PROVISIONING_CONNECTOR_TYPE`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `IDP_PROVISIONING_CONFIG_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_PROVISIONING_CONFIG`
--

LOCK TABLES `IDP_PROVISIONING_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_PROVISIONING_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_PROVISIONING_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_PROVISIONING_ENTITY`
--

DROP TABLE IF EXISTS `IDP_PROVISIONING_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_PROVISIONING_ENTITY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROVISIONING_CONFIG_ID` int DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ENTITY_LOCAL_USERSTORE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ENTITY_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ENTITY_VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `ENTITY_LOCAL_ID` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ENTITY_TYPE` (`ENTITY_TYPE`,`TENANT_ID`,`ENTITY_LOCAL_USERSTORE`,`ENTITY_NAME`,`PROVISIONING_CONFIG_ID`),
  UNIQUE KEY `PROVISIONING_CONFIG_ID` (`PROVISIONING_CONFIG_ID`,`ENTITY_TYPE`,`ENTITY_VALUE`),
  CONSTRAINT `IDP_PROVISIONING_ENTITY_ibfk_1` FOREIGN KEY (`PROVISIONING_CONFIG_ID`) REFERENCES `IDP_PROVISIONING_CONFIG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_PROVISIONING_ENTITY`
--

LOCK TABLES `IDP_PROVISIONING_ENTITY` WRITE;
/*!40000 ALTER TABLE `IDP_PROVISIONING_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_PROVISIONING_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_PROV_CONFIG_PROPERTY`
--

DROP TABLE IF EXISTS `IDP_PROV_CONFIG_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_PROV_CONFIG_PROPERTY` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int DEFAULT NULL,
  `PROVISIONING_CONFIG_ID` int DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PROPERTY_VALUE` varchar(2048) COLLATE latin1_general_ci DEFAULT NULL,
  `PROPERTY_BLOB_VALUE` blob,
  `PROPERTY_TYPE` char(32) COLLATE latin1_general_ci NOT NULL,
  `IS_SECRET` char(1) COLLATE latin1_general_ci DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`PROVISIONING_CONFIG_ID`,`PROPERTY_KEY`),
  KEY `PROVISIONING_CONFIG_ID` (`PROVISIONING_CONFIG_ID`),
  CONSTRAINT `IDP_PROV_CONFIG_PROPERTY_ibfk_1` FOREIGN KEY (`PROVISIONING_CONFIG_ID`) REFERENCES `IDP_PROVISIONING_CONFIG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_PROV_CONFIG_PROPERTY`
--

LOCK TABLES `IDP_PROV_CONFIG_PROPERTY` WRITE;
/*!40000 ALTER TABLE `IDP_PROV_CONFIG_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_PROV_CONFIG_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_ROLE`
--

DROP TABLE IF EXISTS `IDP_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_ROLE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDP_ID` int DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `ROLE` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ID` (`IDP_ID`,`ROLE`),
  CONSTRAINT `IDP_ROLE_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_ROLE`
--

LOCK TABLES `IDP_ROLE` WRITE;
/*!40000 ALTER TABLE `IDP_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `IDP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_ROLE_MAPPING` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDP_ROLE_ID` int DEFAULT NULL,
  `TENANT_ID` int DEFAULT NULL,
  `USER_STORE_ID` varchar(253) COLLATE latin1_general_ci DEFAULT NULL,
  `LOCAL_ROLE` varchar(253) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ROLE_ID` (`IDP_ROLE_ID`,`TENANT_ID`,`USER_STORE_ID`,`LOCAL_ROLE`),
  CONSTRAINT `IDP_ROLE_MAPPING_ibfk_1` FOREIGN KEY (`IDP_ROLE_ID`) REFERENCES `IDP_ROLE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_ROLE_MAPPING`
--

LOCK TABLES `IDP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_APP`
--

DROP TABLE IF EXISTS `SP_APP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_APP` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `APP_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USER_STORE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `USERNAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `ROLE_CLAIM` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `AUTH_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PROVISIONING_USERSTORE_DOMAIN` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_LOCAL_CLAIM_DIALECT` char(1) COLLATE latin1_general_ci DEFAULT '1',
  `IS_SEND_LOCAL_SUBJECT_ID` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `IS_SEND_AUTH_LIST_OF_IDPS` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `IS_USE_TENANT_DOMAIN_SUBJECT` char(1) COLLATE latin1_general_ci DEFAULT '1',
  `IS_USE_USER_DOMAIN_SUBJECT` char(1) COLLATE latin1_general_ci DEFAULT '1',
  `ENABLE_AUTHORIZATION` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `SUBJECT_CLAIM_URI` varchar(512) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_SAAS_APP` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `IS_DUMB_MODE` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `UUID` char(36) COLLATE latin1_general_ci DEFAULT NULL,
  `IMAGE_URL` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `ACCESS_URL` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_DISCOVERABLE` char(1) COLLATE latin1_general_ci DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `APPLICATION_NAME_CONSTRAINT` (`APP_NAME`,`TENANT_ID`),
  UNIQUE KEY `APPLICATION_UUID_CONSTRAINT` (`UUID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_APP`
--

LOCK TABLES `SP_APP` WRITE;
/*!40000 ALTER TABLE `SP_APP` DISABLE KEYS */;
INSERT INTO `SP_APP` VALUES (1,-1234,'apim_publisher','PRIMARY','admin','Service Provider for application apim_publisher','','default','','1','0','0','0','0','0',NULL,'1','0','f1885a14-f697-4ac3-b6b7-86e12465796c','','','0');
/*!40000 ALTER TABLE `SP_APP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_AUTH_SCRIPT`
--

DROP TABLE IF EXISTS `SP_AUTH_SCRIPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_AUTH_SCRIPT` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `APP_ID` int NOT NULL,
  `TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CONTENT` blob,
  `IS_ENABLED` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_AUTH_SCRIPT`
--

LOCK TABLES `SP_AUTH_SCRIPT` WRITE;
/*!40000 ALTER TABLE `SP_AUTH_SCRIPT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_AUTH_SCRIPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_AUTH_STEP`
--

DROP TABLE IF EXISTS `SP_AUTH_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_AUTH_STEP` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `STEP_ORDER` int DEFAULT '1',
  `APP_ID` int NOT NULL,
  `IS_SUBJECT_STEP` char(1) COLLATE latin1_general_ci DEFAULT '0',
  `IS_ATTRIBUTE_STEP` char(1) COLLATE latin1_general_ci DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `APPLICATION_ID_CONSTRAINT_STEP` (`APP_ID`),
  CONSTRAINT `APPLICATION_ID_CONSTRAINT_STEP` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_AUTH_STEP`
--

LOCK TABLES `SP_AUTH_STEP` WRITE;
/*!40000 ALTER TABLE `SP_AUTH_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_AUTH_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_CLAIM_DIALECT`
--

DROP TABLE IF EXISTS `SP_CLAIM_DIALECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_CLAIM_DIALECT` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `SP_DIALECT` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `APP_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DIALECTID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `DIALECTID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_CLAIM_DIALECT`
--

LOCK TABLES `SP_CLAIM_DIALECT` WRITE;
/*!40000 ALTER TABLE `SP_CLAIM_DIALECT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_CLAIM_DIALECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `SP_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_CLAIM_MAPPING` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `IDP_CLAIM` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `SP_CLAIM` varchar(512) COLLATE latin1_general_ci NOT NULL,
  `APP_ID` int NOT NULL,
  `IS_REQUESTED` varchar(128) COLLATE latin1_general_ci DEFAULT '0',
  `IS_MANDATORY` varchar(128) COLLATE latin1_general_ci DEFAULT '0',
  `DEFAULT_VALUE` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLAIMID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `CLAIMID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_CLAIM_MAPPING`
--

LOCK TABLES `SP_CLAIM_MAPPING` WRITE;
/*!40000 ALTER TABLE `SP_CLAIM_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_CLAIM_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_FEDERATED_IDP`
--

DROP TABLE IF EXISTS `SP_FEDERATED_IDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_FEDERATED_IDP` (
  `ID` int NOT NULL,
  `TENANT_ID` int NOT NULL,
  `AUTHENTICATOR_ID` int NOT NULL,
  PRIMARY KEY (`ID`,`AUTHENTICATOR_ID`),
  CONSTRAINT `STEP_ID_CONSTRAINT` FOREIGN KEY (`ID`) REFERENCES `SP_AUTH_STEP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_FEDERATED_IDP`
--

LOCK TABLES `SP_FEDERATED_IDP` WRITE;
/*!40000 ALTER TABLE `SP_FEDERATED_IDP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_FEDERATED_IDP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_INBOUND_AUTH`
--

DROP TABLE IF EXISTS `SP_INBOUND_AUTH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_INBOUND_AUTH` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `INBOUND_AUTH_KEY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `INBOUND_AUTH_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `INBOUND_CONFIG_TYPE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `PROP_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `PROP_VALUE` varchar(1024) COLLATE latin1_general_ci DEFAULT NULL,
  `APP_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_SPI_APP` (`APP_ID`),
  CONSTRAINT `APPLICATION_ID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_INBOUND_AUTH`
--

LOCK TABLES `SP_INBOUND_AUTH` WRITE;
/*!40000 ALTER TABLE `SP_INBOUND_AUTH` DISABLE KEYS */;
INSERT INTO `SP_INBOUND_AUTH` VALUES (3,-1234,'FLUlPcQ9ItxfRZuoB5BxAHBrtSQa','oauth2','standardAPP',NULL,NULL,1);
/*!40000 ALTER TABLE `SP_INBOUND_AUTH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_METADATA`
--

DROP TABLE IF EXISTS `SP_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_METADATA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SP_ID` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `VALUE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SP_METADATA_CONSTRAINT` (`SP_ID`,`NAME`),
  CONSTRAINT `SP_METADATA_ibfk_1` FOREIGN KEY (`SP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_METADATA`
--

LOCK TABLES `SP_METADATA` WRITE;
/*!40000 ALTER TABLE `SP_METADATA` DISABLE KEYS */;
INSERT INTO `SP_METADATA` VALUES (30,1,'isManagementApp','false','Is Management Application',-1234),(31,1,'TokenType','DEFAULT',NULL,-1234),(32,1,'skipLogoutConsent','true','Skip Logout Consent',-1234),(33,1,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(34,1,'DisplayName','apim_publisher',NULL,-1234),(35,1,'skipConsent','true','Skip Consent',-1234),(36,1,'logoutReturnUrl','.*','Logout Return URL',-1234),(37,1,'orgId','carbon.super','Organization ID',-1234);
/*!40000 ALTER TABLE `SP_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_PROVISIONING_CONNECTOR`
--

DROP TABLE IF EXISTS `SP_PROVISIONING_CONNECTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_PROVISIONING_CONNECTOR` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `IDP_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `CONNECTOR_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `APP_ID` int NOT NULL,
  `IS_JIT_ENABLED` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `BLOCKING` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `RULE_ENABLED` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PRO_CONNECTOR_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `PRO_CONNECTOR_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_PROVISIONING_CONNECTOR`
--

LOCK TABLES `SP_PROVISIONING_CONNECTOR` WRITE;
/*!40000 ALTER TABLE `SP_PROVISIONING_CONNECTOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_PROVISIONING_CONNECTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_REQ_PATH_AUTHENTICATOR`
--

DROP TABLE IF EXISTS `SP_REQ_PATH_AUTHENTICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_REQ_PATH_AUTHENTICATOR` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `AUTHENTICATOR_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `APP_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `REQ_AUTH_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `REQ_AUTH_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_REQ_PATH_AUTHENTICATOR`
--

LOCK TABLES `SP_REQ_PATH_AUTHENTICATOR` WRITE;
/*!40000 ALTER TABLE `SP_REQ_PATH_AUTHENTICATOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_REQ_PATH_AUTHENTICATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `SP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_ROLE_MAPPING` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `IDP_ROLE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `SP_ROLE` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `APP_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLEID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `ROLEID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_ROLE_MAPPING`
--

LOCK TABLES `SP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_SHARED_APP`
--

DROP TABLE IF EXISTS `SP_SHARED_APP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_SHARED_APP` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MAIN_APP_ID` char(36) COLLATE latin1_general_ci NOT NULL,
  `OWNER_ORG_ID` char(36) COLLATE latin1_general_ci NOT NULL,
  `SHARED_APP_ID` char(36) COLLATE latin1_general_ci NOT NULL,
  `SHARED_ORG_ID` char(36) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MAIN_APP_ID` (`MAIN_APP_ID`,`OWNER_ORG_ID`,`SHARED_ORG_ID`),
  UNIQUE KEY `SHARED_APP_ID` (`SHARED_APP_ID`),
  CONSTRAINT `SP_SHARED_APP_ibfk_1` FOREIGN KEY (`MAIN_APP_ID`) REFERENCES `SP_APP` (`UUID`) ON DELETE CASCADE,
  CONSTRAINT `SP_SHARED_APP_ibfk_2` FOREIGN KEY (`SHARED_APP_ID`) REFERENCES `SP_APP` (`UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_SHARED_APP`
--

LOCK TABLES `SP_SHARED_APP` WRITE;
/*!40000 ALTER TABLE `SP_SHARED_APP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_SHARED_APP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_TEMPLATE`
--

DROP TABLE IF EXISTS `SP_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SP_TEMPLATE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int NOT NULL,
  `NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  `CONTENT` blob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SP_TEMPLATE_CONSTRAINT` (`TENANT_ID`,`NAME`),
  KEY `IDX_SP_TEMPLATE` (`TENANT_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_TEMPLATE`
--

LOCK TABLES `SP_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `SP_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_TEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_BPS_PROFILE`
--

DROP TABLE IF EXISTS `WF_BPS_PROFILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WF_BPS_PROFILE` (
  `PROFILE_NAME` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `HOST_URL_MANAGER` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `HOST_URL_WORKER` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `USERNAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `PASSWORD` varchar(1023) COLLATE latin1_general_ci DEFAULT NULL,
  `CALLBACK_HOST` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `CALLBACK_USERNAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `CALLBACK_PASSWORD` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`PROFILE_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_BPS_PROFILE`
--

LOCK TABLES `WF_BPS_PROFILE` WRITE;
/*!40000 ALTER TABLE `WF_BPS_PROFILE` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_BPS_PROFILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_REQUEST`
--

DROP TABLE IF EXISTS `WF_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WF_REQUEST` (
  `UUID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `CREATED_BY` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1',
  `OPERATION_TYPE` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT NULL,
  `UPDATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `REQUEST` blob,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_REQUEST`
--

LOCK TABLES `WF_REQUEST` WRITE;
/*!40000 ALTER TABLE `WF_REQUEST` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_REQUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_REQUEST_ENTITY_RELATIONSHIP`
--

DROP TABLE IF EXISTS `WF_REQUEST_ENTITY_RELATIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WF_REQUEST_ENTITY_RELATIONSHIP` (
  `REQUEST_ID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `ENTITY_NAME` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ENTITY_TYPE` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`REQUEST_ID`,`ENTITY_NAME`,`ENTITY_TYPE`,`TENANT_ID`),
  CONSTRAINT `WF_REQUEST_ENTITY_RELATIONSHIP_ibfk_1` FOREIGN KEY (`REQUEST_ID`) REFERENCES `WF_REQUEST` (`UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_REQUEST_ENTITY_RELATIONSHIP`
--

LOCK TABLES `WF_REQUEST_ENTITY_RELATIONSHIP` WRITE;
/*!40000 ALTER TABLE `WF_REQUEST_ENTITY_RELATIONSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_REQUEST_ENTITY_RELATIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_WORKFLOW`
--

DROP TABLE IF EXISTS `WF_WORKFLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WF_WORKFLOW` (
  `ID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `WF_NAME` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `TEMPLATE_ID` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `IMPL_ID` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_WORKFLOW`
--

LOCK TABLES `WF_WORKFLOW` WRITE;
/*!40000 ALTER TABLE `WF_WORKFLOW` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_WORKFLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_WORKFLOW_ASSOCIATION`
--

DROP TABLE IF EXISTS `WF_WORKFLOW_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WF_WORKFLOW_ASSOCIATION` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ASSOC_NAME` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `EVENT_ID` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `ASSOC_CONDITION` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `WORKFLOW_ID` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `IS_ENABLED` char(1) COLLATE latin1_general_ci DEFAULT '1',
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `WORKFLOW_ID` (`WORKFLOW_ID`),
  CONSTRAINT `WF_WORKFLOW_ASSOCIATION_ibfk_1` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `WF_WORKFLOW` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_WORKFLOW_ASSOCIATION`
--

LOCK TABLES `WF_WORKFLOW_ASSOCIATION` WRITE;
/*!40000 ALTER TABLE `WF_WORKFLOW_ASSOCIATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_WORKFLOW_ASSOCIATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_WORKFLOW_CONFIG_PARAM`
--

DROP TABLE IF EXISTS `WF_WORKFLOW_CONFIG_PARAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WF_WORKFLOW_CONFIG_PARAM` (
  `WORKFLOW_ID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `PARAM_NAME` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `PARAM_VALUE` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `PARAM_QNAME` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `PARAM_HOLDER` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`WORKFLOW_ID`,`PARAM_NAME`,`PARAM_QNAME`,`PARAM_HOLDER`),
  CONSTRAINT `WF_WORKFLOW_CONFIG_PARAM_ibfk_1` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `WF_WORKFLOW` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_WORKFLOW_CONFIG_PARAM`
--

LOCK TABLES `WF_WORKFLOW_CONFIG_PARAM` WRITE;
/*!40000 ALTER TABLE `WF_WORKFLOW_CONFIG_PARAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_WORKFLOW_CONFIG_PARAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_WORKFLOW_REQUEST_RELATION`
--

DROP TABLE IF EXISTS `WF_WORKFLOW_REQUEST_RELATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WF_WORKFLOW_REQUEST_RELATION` (
  `RELATIONSHIP_ID` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `WORKFLOW_ID` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `REQUEST_ID` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATUS` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `TENANT_ID` int DEFAULT '-1',
  PRIMARY KEY (`RELATIONSHIP_ID`),
  KEY `WORKFLOW_ID` (`WORKFLOW_ID`),
  KEY `REQUEST_ID` (`REQUEST_ID`),
  CONSTRAINT `WF_WORKFLOW_REQUEST_RELATION_ibfk_1` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `WF_WORKFLOW` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `WF_WORKFLOW_REQUEST_RELATION_ibfk_2` FOREIGN KEY (`REQUEST_ID`) REFERENCES `WF_REQUEST` (`UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_WORKFLOW_REQUEST_RELATION`
--

LOCK TABLES `WF_WORKFLOW_REQUEST_RELATION` WRITE;
/*!40000 ALTER TABLE `WF_WORKFLOW_REQUEST_RELATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_WORKFLOW_REQUEST_RELATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'apim_db'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-09 13:46:13
