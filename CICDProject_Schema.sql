CREATE DATABASE  IF NOT EXISTS `gymprogressapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gymprogressapp`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gymprogressapp
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `experience_level`
--

DROP TABLE IF EXISTS `experience_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience_level` (
  `exp_id` bigint NOT NULL AUTO_INCREMENT,
  `level` varchar(255) DEFAULT NULL,
  `exp_level` varchar(255) DEFAULT NULL,
  `multiplier` double DEFAULT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_level`
--

LOCK TABLES `experience_level` WRITE;
/*!40000 ALTER TABLE `experience_level` DISABLE KEYS */;
INSERT INTO `experience_level` VALUES (1,'Beginner','Beginner',0.5),(2,'Intermediate','Intermediate',0.7),(3,'Experienced','Experienced',1);
/*!40000 ALTER TABLE `experience_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_goal`
--

DROP TABLE IF EXISTS `gym_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_goal` (
  `goal_id` bigint NOT NULL AUTO_INCREMENT,
  `goal` varchar(255) DEFAULT NULL,
  `reps` varchar(255) DEFAULT NULL,
  `sets` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_goal`
--

LOCK TABLES `gym_goal` WRITE;
/*!40000 ALTER TABLE `gym_goal` DISABLE KEYS */;
INSERT INTO `gym_goal` VALUES (1,'Maintain','8-10','2'),(2,'Gain','3-6','2'),(3,'Lose','12-15','4');
/*!40000 ALTER TABLE `gym_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_selections`
--

DROP TABLE IF EXISTS `user_selections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_selections` (
  `select_id` bigint NOT NULL AUTO_INCREMENT,
  `exp_id` bigint DEFAULT NULL,
  `goal_id` bigint DEFAULT NULL,
  `weight_id` bigint DEFAULT NULL,
  PRIMARY KEY (`select_id`),
  KEY `weight_id_idx` (`weight_id`),
  KEY `goal_id_idx` (`goal_id`),
  KEY `exp_id_idx` (`exp_id`),
  CONSTRAINT `exp_id` FOREIGN KEY (`exp_id`) REFERENCES `experience_level` (`exp_id`),
  CONSTRAINT `goal_id` FOREIGN KEY (`goal_id`) REFERENCES `gym_goal` (`goal_id`),
  CONSTRAINT `weight_id` FOREIGN KEY (`weight_id`) REFERENCES `weight_class` (`weight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_selections`
--

LOCK TABLES `user_selections` WRITE;
/*!40000 ALTER TABLE `user_selections` DISABLE KEYS */;
INSERT INTO `user_selections` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,2,1,1),(5,2,2,1),(6,2,3,1),(7,3,1,1),(8,3,2,1),(9,3,3,1),(10,1,1,2),(11,1,2,2),(12,1,3,2),(13,2,1,2),(14,2,2,2),(15,2,3,2),(16,3,1,2),(17,3,2,2),(18,3,3,2),(19,1,1,3),(20,1,2,3),(21,1,3,3),(22,2,1,3),(23,2,2,3),(24,2,3,3),(25,3,1,3),(26,3,2,3),(27,3,3,3),(28,1,1,4),(29,1,2,4),(30,1,3,4),(31,2,1,4),(32,2,2,4),(33,2,3,4),(34,3,1,4),(35,3,2,4),(36,3,3,4),(37,1,1,5),(38,1,2,5),(39,1,3,5),(40,2,1,5),(41,2,2,5),(42,2,3,5),(43,3,1,5),(44,3,2,5),(45,3,3,5),(46,1,1,6),(47,1,2,6),(48,1,3,6),(49,2,1,6),(50,2,2,6),(51,2,3,6),(52,3,1,6),(53,3,2,6),(54,3,3,6),(55,1,1,7),(56,1,2,7),(57,1,3,7),(58,2,1,7),(59,2,2,7),(60,2,3,7),(61,3,1,7),(62,3,2,7),(63,3,3,7),(64,1,1,8),(65,1,2,8),(66,1,3,8),(67,2,1,8),(68,2,2,8),(69,2,3,8),(70,3,1,8),(71,3,2,8),(72,3,3,8);
/*!40000 ALTER TABLE `user_selections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weight_class`
--

DROP TABLE IF EXISTS `weight_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weight_class` (
  `weight_id` bigint NOT NULL AUTO_INCREMENT,
  `weight_range` varchar(255) DEFAULT NULL,
  `curls` int NOT NULL,
  `db_bench` int NOT NULL,
  `deadlift` int NOT NULL,
  `hst_curl` int NOT NULL,
  `lat_raise` int NOT NULL,
  `pulldown` int NOT NULL,
  `quad_ext` int NOT NULL,
  `rdl` int NOT NULL,
  `squat` int NOT NULL,
  PRIMARY KEY (`weight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weight_class`
--

LOCK TABLES `weight_class` WRITE;
/*!40000 ALTER TABLE `weight_class` DISABLE KEYS */;
INSERT INTO `weight_class` VALUES (1,'60-65kg',15,30,160,65,10,100,75,90,120),(2,'66-70kg',18,33,170,70,13,105,80,95,130),(3,'71-75kg',20,35,180,75,15,110,85,100,140),(4,'76-80kg',23,38,190,80,18,115,90,105,150),(5,'81-85kg',25,40,200,85,20,120,95,110,160),(6,'86-90kg',28,43,210,90,23,125,100,115,170),(7,'91-95kg',30,45,220,95,25,130,105,120,180),(8,'96-100kg',33,48,230,100,28,135,110,125,190);
/*!40000 ALTER TABLE `weight_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-08 23:59:14
