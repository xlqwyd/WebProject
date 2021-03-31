-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: testing1
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `참가자유형` varchar(10) NOT NULL,
  `배정번호` int NOT NULL,
  `측정지` varchar(100) NOT NULL,
  `측정자성명` varchar(10) NOT NULL,
  `측정자연락처` varchar(11) NOT NULL,
  `기온` int NOT NULL,
  `기상상태` varchar(20) NOT NULL,
  `지면상태1` varchar(20) NOT NULL,
  `지면상태2` varchar(30) NOT NULL,
  `교통사항` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES ('기존',1,'어딘가','박재현','01000000000',10,'맑음','콘크리트','비나 물에 젖음','한산');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `배정번호` int NOT NULL,
  `측정지` varchar(100) NOT NULL,
  PRIMARY KEY (`배정번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'동남구 광덕면 광풍로 천안광덕쉼터캠핑장'),(2,'동남구 광덕면 보산원리 보산원초등학교'),(3,'동남구 광덕면 신흥리 광덕면행정복지센터'),(4,'동남구 광덕면 신흥리 광덕초등학교'),(5,'동남구 광덕면 행정리 행정초등학교'),(6,'동남구 구룡동 구룡3동 마을회관'),(7,'동남구 구룡동 구룡동성당'),(8,'동남구 구룡동 뚜쥬루과자점'),(9,'동남구 구룡동 백향목 유치원'),(10,'동남구 구룡동 사랑의 집');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-29 20:05:05
