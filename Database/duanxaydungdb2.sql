CREATE DATABASE  IF NOT EXISTS `duanxaydungdb2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `duanxaydungdb2`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: duanxaydungdb2
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci,
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `person_responsible` int DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_to_personnel_idx` (`person_responsible`),
  KEY `fk_category_to_project_idx` (`id_project`),
  KEY `fk_category_to_status_idx` (`id_status`),
  CONSTRAINT `fk_category_to_personnel` FOREIGN KEY (`person_responsible`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_category_to_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_category_to_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'L???p ph????ng ??n ti???n ????? thi c??ng','L???p ph????ng ??n ti???n ????? thi c??ng ph?? h???p','2022-10-01','2022-10-07',0,_binary '',2,1,1),(2,'Chu???n b??? c??ng tr?????ng','Chu???n b??? c??ng tr?????ng ph???c v??? thi c??ng ','2022-10-01','2022-10-07',0,_binary '',2,1,3),(3,'Thi c??ng h??? t???ng','Thi c??ng t??? s??n tr???t tr??? xu???ng','2022-10-07','2022-10-27',0,_binary '',10,1,8),(4,'Thi c??ng s??n t???ng','Thi c??ng s??n t???ng','2022-10-28','2022-11-10',0,_binary '',10,1,8),(5,'Thi c??ng x??y t?????ng','Thi c??ng t?????ng','2022-11-11','2022-12-05',0,_binary '',10,1,8),(6,'Thi c??ng t?? tr??t t?????ng','Thi c??ng t?? tr??c t?????ng','2022-12-06','2023-01-02',0,_binary '',10,1,8),(7,'Thi c??ng m??i che','Thi c??ng m??i che','2023-01-03','2023-01-23',0,_binary '',10,1,8),(8,'C??ng t??c ho??n thi???n','Thi c??ng giai ??o???n cu???i','2023-01-24','2023-03-02',0,_binary '',10,1,8),(9,'Ki???m tra c??ng tr??nh','Ki???m tra tr?????c khi b??n giao m???t b???ng','2023-03-03','2023-03-14',0,_binary '',11,1,8),(10,'Th??o d??? c??ng tr?????ng','Di d???i trang thi???t b??? x??y d???ng','2023-03-15','2023-03-22',0,_binary '',2,1,8);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change`
--

DROP TABLE IF EXISTS `change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `change` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci,
  `new_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `priority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  `id_personnel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_change_to_project_idx` (`id_project`),
  KEY `fk_change_to_personnel_idx` (`id_personnel`),
  CONSTRAINT `fk_change_to_personnel` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_change_to_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change`
--

LOCK TABLES `change` WRITE;
/*!40000 ALTER TABLE `change` DISABLE KEYS */;
/*!40000 ALTER TABLE `change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Ph??ng k??? to??n - t??i ch??nh','Qu???n l?? t??i ch??nh','2022-10-15 16:54:53',_binary ''),(2,'Ph??ng ?? t?????ng v?? cung ???ng','Qu???n l?? ?? t?????ng, thi???t k???','2022-05-01 00:00:00',_binary ''),(3,'Ph??ng t??? ch???c h??nh ch??nh','Qu???n l?? h??nh ch??nh','2022-05-01 00:00:00',_binary ''),(4,'Ph??ng qu???n l?? k??? thu???t s???n xu???t v?? thi c??ng','Qu???n l?? k??? thu???t, thi c??ng d??? ??n','2022-05-01 00:00:00',_binary ''),(5,'Ph??ng ?????u t??','Qu???n l?? ?????u t??','2022-05-01 00:00:00',_binary ''),(51,'Ph??ng ban m???i','Ph??ng ban m???i 1',NULL,_binary '\0'),(52,'Ph??ng ban m???i 2','Ph??ng ban m???i 2',NULL,_binary '\0'),(53,'Ph??ng ban demo','Ph??ng ban demo',NULL,_binary '\0'),(54,'Ph??ng ban demo','Ph??ng ban demo',NULL,_binary '\0'),(55,'Ph??ng ban demo','Ph??ng ban demo',NULL,_binary '\0'),(56,'Ph??ng k??? ho???ch ?????u t??','Qu???n l?? k??? ho???ch ?????u t??','2022-11-05 09:44:10',_binary '\0'),(57,'Ph??ng ban m???i','Demo','2022-11-30 08:13:44',_binary '\0'),(58,'Ph??ng ban ki???m tra','Ki???m tra','2022-11-30 08:14:26',_binary '');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss`
--

DROP TABLE IF EXISTS `discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discuss` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  `person_created` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_discuss_to_project_idx` (`id_project`),
  KEY `fk_discuss_to_personnel_idx` (`person_created`),
  CONSTRAINT `fk_discuss_to_personnel` FOREIGN KEY (`person_created`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_discuss_to_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invest`
--

DROP TABLE IF EXISTS `invest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invest` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `money` decimal(12,0) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  `id_personnel` int DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  `id_partner` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invest_to_project_idx` (`id_project`),
  KEY `fk_invest_to_status_idx` (`id_status`),
  KEY `fk_invest_to_personnel_idx` (`id_personnel`),
  KEY `fk_invest_to_partner_idx` (`id_partner`),
  CONSTRAINT `fk_invest_to_partner` FOREIGN KEY (`id_partner`) REFERENCES `partner` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_invest_to_personnel` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_invest_to_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_invest_to_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invest`
--

LOCK TABLES `invest` WRITE;
/*!40000 ALTER TABLE `invest` DISABLE KEYS */;
/*!40000 ALTER TABLE `invest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci,
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `priority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `id_task` int DEFAULT NULL,
  `id_personnel` int DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_issue_to_task_idx` (`id_task`),
  KEY `fk_issue_to_personnel_idx` (`id_personnel`),
  KEY `fk_issue_to_status_idx` (`id_status`),
  CONSTRAINT `fk_issue_to_personnel` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_issue_to_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_issue_to_task` FOREIGN KEY (`id_task`) REFERENCES `task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  `id_personnel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participation_to_project_idx` (`id_project`),
  KEY `fk_prticipation_to_personnel_idx` (`id_personnel`),
  CONSTRAINT `fk_participation_to_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_prticipation_to_personnel` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participation`
--

LOCK TABLES `participation` WRITE;
/*!40000 ALTER TABLE `participation` DISABLE KEYS */;
INSERT INTO `participation` VALUES (2,'2022-10-01','2022-10-14','Thi???t k??? n???i th???t',_binary '\0',1,9),(3,'2022-10-01',NULL,'Ki???n tr??c s??',_binary '',1,3),(4,'2022-10-01',NULL,'K??? s?? x??y d???ng',_binary '',1,10),(5,'2022-10-01',NULL,'K??? s?? gi??m s??t x??y d???ng',_binary '',1,11);
/*!40000 ALTER TABLE `participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` VALUES (1,'C??ng ty TNHH Th????ng M???i Green Tech','0972699926','partner@greentechco.com.vn','https://www.greentechco.com.vn','Vi???t Nam','B2, ???????ng s??? 3, khu ph??? 4, ph?????ng An Kh??nh, Tp Th??? ?????c, Tp H??? Ch?? Minh','T??? ch???c','C??ng ty v???t li???u x??y d???ng',_binary ''),(2,'C??ng ty TNHH Adal Home 123','0901189896','partner@adalhome.com.vn','https://www.adalhome.com.vn','Vi???t Nam','S??? 2, ???????ng s??? 7, khu ph??? 4, ph?????ng An Ph??, Th??? ?????c, th??nh ph??? H??? Ch?? Minh','T??? ch???c','Demo update',_binary ''),(3,'C??ng ty TNHH MTV Vina Built','0987447766','vinbuilt7777@gmail.com','https://www.vinbuilt.bizz.vn','Vi???t Nam','394/35, ??u C??, ph?????ng 10, qu???n T??n B??nh, Tp H??? Ch?? Minh','T??? ch???c','C??ng ty v???t li???u x??y d???ng',_binary ''),(4,'C??ng ty TNHH v???t li???u x??y d???ng An Nhi??n Ph??t','0868697082','sanvachtran@gmail.com','https://www.sanvachtran.com','Vi???t Nam','52, L?? Ho??ng Ph??i, ph?????ng 17, qu???n G?? V???p, Tp H??? Ch?? Minh','T??? ch???c','C??ng ty cung c???p v???t li???u x??y d???ng',_binary ''),(5,'C??ng ty TNHH MTV v???t li???u x??y d???ng Hi???p H??','0909672222','ctyhiepha@gmail.com','https://www.vlxdhiepha.com','Vi???t Nam','33/2, Cao L???, ph?????ng 4, qu???n 8, Tp H??? Ch?? Minh','T??? ch???c','C??ng ty cung c???p v???t li???u x??y d???ng',_binary '');
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `identity` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_position` int DEFAULT NULL,
  `id_department` int DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personnel_to_position_idx` (`id_position`),
  KEY `fk_personnel_to_department_idx` (`id_department`),
  CONSTRAINT `fk_personnel_to_department` FOREIGN KEY (`id_department`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_personnel_to_position` FOREIGN KEY (`id_position`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES (1,'https://res.cloudinary.com/dgqmraoge/image/upload/v1662860612/photo-1438761681033-6461ffad8d80_vkpkbo.jpg','Tr???n Ph????ng','Anh','N???','1999-01-24','107936578401','0909123564','107936578401anh@gmail.com','Qu???n 5, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STAFF',1,2,_binary ''),(2,'https://res.cloudinary.com/dgqmraoge/image/upload/v1662860902/photo-1619895862022-09114b41f16f_jyuw1s.jpg','L?? Tr???n Ph????ng','Nhi','N???','2001-01-11','107423804325','0339559723','107423804325nhi@gmail.com','Qu???n 9, Tp H??? Ch?? Minh','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_ADMIN',2,2,_binary ''),(3,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','V????ng Gia','Thanh','N???','2000-10-18','107423466831','0357070746','107423466831thanh@gmail.com','Qu???n H??c M??n, Tp H??? Ch?? Minh','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STAFF',3,4,_binary '\0'),(4,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','Nguy???n Ph????ng','Linh','N???','1999-11-28','107422175693','0961687266','107422175693linh@gmail.com','Qu???n 2, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STAFF',4,1,_binary ''),(5,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','Ph???m V??n','Nam','Nam','1999-04-19','107022201304','0339559721','107022201304nam@gmail.com','Qu???n 8, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STAFF',3,4,_binary ''),(6,'https://res.cloudinary.com/dgqmraoge/image/upload/v1662860984/photo-1557862921-37829c790f19_oqd0w4.jpg','Nguy???n Thi???n Minh','T??m','Nam','1997-06-14','106822980298','0347311331','106822980298tam@gmail.com','Qu???n B??nh Th???nh, Tp H??? Ch?? Minh','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_ADMIN',24,4,_binary ''),(7,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','Tr???n L?? Quang','Chi???n','Nam','2001-04-25','106822261393','0372405209','106822261393chien@gmail.com','Nh?? B??, Tp H??? Ch?? Minh','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_ADMIN',4,1,_binary ''),(8,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','L?? ?????c Anh','Tu???n','Nam','1999-04-19','106822126899','0342461880','106822126899tuan@gmail.com','Qu???n 7, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STAFF',3,4,_binary ''),(9,'https://res.cloudinary.com/dgqmraoge/image/upload/v1662860529/photo-1633332755192-727a05c4013d_iwfpkd.jpg','Nguy???n H???u','Minh','Nam','2000-10-01','106822059551','0392620393','106822059551minh@gmail.com','Qu???n G?? V???p, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STAFF',2,2,_binary ''),(10,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','Nguy???n ????ng Qu???c','Anh','Nam','2000-07-07','104520019506','0902902019','104520019506anh@gmail.com','Qu???n 1, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STAFF',23,4,_binary ''),(11,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','L?? ?????c','Trung','Nam','1993-01-20','104520019555','0862902019','104520019555trung@gmail.com','Qu???n 7, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_STAFF',24,4,_binary ''),(15,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','Phan ????nh','V??n','Nam','1996-07-07','107932226437','0785976966','107932226437van@gmail.com','H??c M??n, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_ADMIN',24,4,_binary ''),(16,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','Tr???n Qu???c','Th???ng','Nam','1997-10-06','101556010091','0785976696','101556010091thang@gmail.com','G?? V???p, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_ADMIN',24,4,_binary ''),(17,'https://res.cloudinary.com/dgqmraoge/image/upload/v1658919834/UserAvatar_l51jgw.png','Nguy???n V??n','H???u','Nam','1997-09-17','101651010076','0859284220','101651010076huu@gmail.com','B??nh Th???nh, Tp H??? Ch?? Minh','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','ROLE_ADMIN',24,4,_binary '');
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'K??? s?? thi???t k??? c???nh quan','Ch???u tr??ch nhi???m thi???t k??? c???nh quan',_binary ''),(2,'K??? s?? thi???t k??? n???i th???t','Ch???u tr??ch nhi???m thi???t k??? n???i th???t cho d??? ??n thi c??ng',_binary ''),(3,'Ki???n tr??c s??','Ch???u tr??ch nhi???m v??? b???n v??? x??y d???ng',_binary ''),(4,'K??? to??n t??i ch??nh','Ch???u tr??ch nhi???m v??? c??c kho???n chi cho c??ng tr??nh',_binary ''),(23,'K??? s?? x??y d???ng','Ch???u tr??ch nhi???m x??y d???ng c??ng tr??nh',_binary ''),(24,'K??? s?? gi??m s??t x??y d???ng','Ch???u tr??ch nhi???m gi??m s??t thi c??ng c??ng tr??nh',_binary ''),(25,'Demo','Demo',_binary '\0');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `max_person` int DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  `id_personnel` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_project_to_status_idx` (`id_status`),
  KEY `fk_project_to_personnel_idx` (`id_personnel`),
  CONSTRAINT `fk_project_to_personnel` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_project_to_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'D??? ??n x??y d???ng nh?? ???','X??y d???ng nh?? ??? ????n gi???n, hi???n ?????i','https://res.cloudinary.com/dgqmraoge/image/upload/v1664517641/photo-1512917774080-9991f1c4c750_pefctw.jpg','Qu???n 2, th??nh ph??? H??? Ch?? Minh','2022-10-01','2023-04-20','2022-09-30 00:00:00',120,0,_binary '',2,2),(2,'D??? ??n x??y d???ng c??n h??? cao c???p','X??y d???ng c??n h??? cho kh??ch h??ng VIP','https://res.cloudinary.com/dgqmraoge/image/upload/v1664517641/photo-1512917774080-9991f1c4c750_pefctw.jpg','Qu???n 7, th??nh ph??? H??? Ch?? Minh','2022-10-01','2023-08-20','2022-09-20 00:00:00',200,0,_binary '',1,6),(6,'D??? ??n x??y d???ng bi???t th??? cao c???p','X??y d???ng bi???t th??? cho kh??ch h??ng th??n thi???t','https://res.cloudinary.com/dgqmraoge/image/upload/v1664517641/photo-1512917774080-9991f1c4c750_pefctw.jpg','Qu???n 7, th??nh ph??? H??? Ch?? Minh','2023-01-01','2023-12-28','2022-10-24 00:00:00',100,0,_binary '',1,15),(7,'D??? ??n x??y d???ng nh?? thi ?????u','X??y d???ng nh?? thi ?????u cho b??? m??n c???u l??ng','https://res.cloudinary.com/dgqmraoge/image/upload/v1664517641/photo-1512917774080-9991f1c4c750_pefctw.jpg','Qu???n G?? V???p, th??nh ph??? H??? Ch?? Minh','2023-01-01','2023-12-28','2022-10-24 00:00:00',200,0,_binary '',1,16),(9,'X??y d???ng b???nh vi???n qu???n 4','X??y d???ng b???nh vi???n ??a khoa','https://res.cloudinary.com/dgqmraoge/image/upload/v1664517641/photo-1512917774080-9991f1c4c750_pefctw.jpg','Qu???n 4, th??nh ph??? H??? Ch?? Minh','2023-01-01','2023-12-20','2022-10-24 00:00:00',500,0,_binary '',1,17);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'L???p k??? ho???ch',NULL),(2,'???? duy???t',NULL),(3,'??ang ti???n h??nh',NULL),(4,'????ng h?????ng',NULL),(5,'???? ho??n',NULL),(6,'??ang ki???m tra',NULL),(7,'???? h???y',NULL),(8,'??ang ch???',NULL),(9,'???? ho??n t???t',NULL),(10,'???? l???p h??a ????n',NULL);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  `priority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `id_personnel` int DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_to_personnel_idx` (`id_personnel`),
  KEY `fk_task_to_status_idx` (`id_status`),
  KEY `fk_stak_to_category_idx` (`id_category`),
  CONSTRAINT `fk_stak_to_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_task_to_personnel` FOREIGN KEY (`id_personnel`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_task_to_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'L???p k??? ho???ch ti???n ????? thi c??ng','L???p k??? ho???ch chi ti???t ti???n ????? thi c??ng','2022-10-01','2022-10-07','Trung b??nh',0,_binary '',2,1,3),(2,'T??? ch???c c??ng tr?????ng, l??m l??ng tr???i cho c??ng nh??n','L??m l??n tr???i cho c??ng nh??n thi c??ng','2022-10-01','2022-10-07','Trung b??nh',0,_binary '',2,2,3),(3,'V???n chuy???n thi???t b???, v???t t??, chu???n b??? m???t b???ng thi c??ng','V???n chuy???n thi???t b??? v???t t??','2022-10-01','2022-10-07','Trung b??nh',0,_binary '',2,2,3),(4,'L???p bi??n b???n b??n giao m???t b???ng, x??c ?????nh ng??y kh???i c??ng','B??n giao, x??c ?????nh ng??y kh???i c??ng','2022-10-01','2022-10-07','Trung b??nh',0,_binary '',2,2,3),(5,'Ki???m tra hi???n tr???ng ?????t, ??o ?????c, d???n d???p m???t b???ng thi c??ng','Ki???m tra ?????t, ??o ?????c, d???n d???p m???t b???ng','2022-10-01','2022-10-06','Trung b??nh',0,_binary '',2,2,3);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-30 11:17:47
