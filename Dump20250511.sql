CREATE DATABASE  IF NOT EXISTS `booking_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `booking_system`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: booking_system
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `room_id` bigint NOT NULL,
  `check_in` datetime(6) DEFAULT NULL,
  `check_out` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
REPLACE  IGNORE INTO `bookings` (`id`, `user_id`, `room_id`, `check_in`, `check_out`, `status`, `created_at`) VALUES (18,1,1,'2025-05-10 00:00:00.000000','2025-05-12 00:00:00.000000','CONFIRMED','2025-05-09 20:33:43'),(19,7,5,'2025-05-15 00:00:00.000000','2025-05-17 00:00:00.000000','PENDING','2025-05-09 20:34:06'),(20,8,3,'2025-05-20 00:00:00.000000','2025-05-22 00:00:00.000000','CANCELLED','2025-05-09 20:34:51'),(21,9,4,'2025-06-01 00:00:00.000000','2025-06-03 00:00:00.000000','CONFIRMED','2025-05-09 20:34:51'),(22,10,5,'2025-06-10 00:00:00.000000','2025-06-12 00:00:00.000000','CONFIRMED','2025-05-09 20:34:51'),(23,7,1,'2025-05-28 16:39:00.000000','2025-05-29 07:39:00.000000','BOOKED','2025-05-10 22:32:22'),(24,19,2,'2025-05-11 01:28:00.000000','2025-05-11 17:30:00.000000','BOOKED','2025-05-11 03:28:29'),(25,19,1,'2025-05-10 20:46:00.000000','2025-05-12 18:46:00.000000','BOOKED','2025-05-11 03:46:35');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_id` bigint NOT NULL,
  `amount` double DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
REPLACE  IGNORE INTO `payments` (`id`, `booking_id`, `amount`, `method`, `paid_at`, `payment_date`, `status`) VALUES (20,20,1000000,'CreditCard','2025-05-09 10:00:00',NULL,'PENDING'),(21,18,1700000,'Cash','2025-05-31 18:30:00','2025-05-31 18:30:00.000000','PAID'),(22,19,3000000,'Momo','2025-06-09 09:15:00',NULL,'FAILED');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_number` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `capacity` int DEFAULT NULL,
  `area` int DEFAULT NULL,
  `amenities` text,
  `description` text,
  `status` enum('AVAILABLE','BLOCKED') DEFAULT 'AVAILABLE',
  `is_featured` tinyint(1) DEFAULT '0',
  `floor` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `image_path` varchar(255) DEFAULT NULL,
  `is_feature` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_number` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
REPLACE  IGNORE INTO `rooms` (`id`, `room_number`, `type`, `price`, `capacity`, `area`, `amenities`, `description`, `status`, `is_featured`, `floor`, `created_at`, `image_path`, `is_feature`) VALUES (1,'A101','Standard',500000,2,NULL,NULL,'Phòng tiêu chuẩn, 2 người','AVAILABLE',1,NULL,'2025-05-09 20:15:27','325222137.jpg',NULL),(2,'A102','Standard',500000,2,NULL,'wifi, tủ lạnh, máy giặt, tv, máy sấy, có chổ gửi xe','Phòng tiêu chuẩn, 2 người','AVAILABLE',1,NULL,'2025-05-09 20:15:27','325222137.jpg',NULL),(3,'B201','Deluxe',800000,4,NULL,NULL,'Phòng Deluxe, rộng rãi','AVAILABLE',1,NULL,'2025-05-09 20:15:27','325222137.jpg',NULL),(4,'C301','VIP',1500000,6,NULL,NULL,'Phòng VIP view biển','BLOCKED',0,NULL,'2025-05-09 20:15:27','347391949.jpg',NULL),(5,'B202','Deluxe',850000,4,NULL,NULL,'Phòng có ban công','AVAILABLE',0,NULL,'2025-05-09 20:15:27','402044210.jpg',NULL),(21,'A10','VIP',1000000,4,25,NULL,'','AVAILABLE',0,NULL,'2025-05-10 12:00:27','402044210.jpg',NULL);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE  IGNORE INTO `users` (`id`, `username`, `password`, `full_name`, `email`, `role`, `created_at`, `phone`) VALUES (1,'namtran','123456','Admin User','admin@example.com','USER','2025-05-09 20:12:23','0382960850'),(7,'johndoe','pass123','John Doe','john@example.com','USER','2025-05-09 20:27:39',NULL),(8,'janedoe','pass456','Jane Doe','jane@example.com','USER','2025-05-09 20:27:39',NULL),(9,'alice','alice789','Alice Nguyen','alice@domain.com','USER','2025-05-09 20:27:39',NULL),(10,'bob','bob456','Bob Tran','bob@domain.com','USER','2025-05-09 20:27:39',NULL),(12,'viettran','$2a$10$XFJjN6dg9KL.jSA71BFrs.85r94f7igd87IyybyVS1RO4puDfN1rO',NULL,NULL,'USER','2025-05-09 18:32:19',NULL),(16,'vietran01','$2a$10$pWQ5rrFwjK5/vChXnKcdv.1dGLbTEM3RjgG7Wv3aWba2pMrltxIWG','Quốc Việt','viet.tran@example.com','USER','2025-05-10 09:53:25',NULL),(17,'admin','$2a$10$4A6Lxcx6H6BCi6r06kwS.e45JZl8JhhsY5P/UjynMvDNYVsUox7BS','Administrator','admin@example.com','ADMIN','2025-05-10 09:57:26','000000000'),(19,'quocviet08','$2a$10$1QKBPsDp62Jo1ha.61dKHeeBsfHj6abr5pDW/a9itAaqwyKdhtAQC',NULL,NULL,'USER','2025-05-10 19:26:33',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-11  5:55:39
