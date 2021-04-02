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
  `측정날짜` date NOT NULL,
  `배정번호` int NOT NULL,
  `측정지` varchar(100) NOT NULL,
  `측정자성명` varchar(10) NOT NULL,
  `측정자연락처` varchar(11) NOT NULL,
  `기온` float(3,1) NOT NULL,
  `기상상태` varchar(20) NOT NULL,
  `지면상태1` varchar(20) NOT NULL,
  `지면상태2` varchar(30) NOT NULL,
  `교통사항` varchar(20) NOT NULL,
  `측정시간` time NOT NULL,
  PRIMARY KEY (`측정날짜`,`배정번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES ('기존','0000-00-00',2,'어딘가','유재석','01011112222',1.0,'맑음','아스팔트','해당없음','보통','00:00:00'),('기존','2021-04-01',12,'어딘가','가가가','01011111111',2.1,'강한비','흙/모래','비나 물에 젖음','혼잡','22:19:50'),('기존','2021-04-02',1,'가','가나다','01011111111',15.2,'구름많고 흐림','흙/모래','비나 물에 젖음','보통','01:09:51'),('기존','2021-04-02',12,'어디인가','호호호','01012341234',15.6,'강한비','흙/모래','비나 물에 젖음','한산','01:24:36'),('기존','2021-04-02',124,'가나라','가이이','01000000000',15.6,'구름많고 흐림','흙/모래','비나 물에 젖음','보통','01:13:03'),('기존','2021-04-02',160,'천안시 어딘','박재현','11111234156',15.3,'구름많고 흐림','콘크리트','비나 물에 젖음','혼잡','01:14:41');
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

-- Dump completed on 2021-04-02 12:38:26
