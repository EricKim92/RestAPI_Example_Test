-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: shop_schema
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

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

--
-- Table structure for table `tb_cart`
--

DROP TABLE IF EXISTS `tb_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cart` (
  `CART_ID` int NOT NULL AUTO_INCREMENT,
  `MEMBER_ID` varchar(30) NOT NULL,
  `PRODUCT_ID` int NOT NULL,
  `AMOUNT` int NOT NULL,
  `PRICE` int NOT NULL,
  `CART_CREATE_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`CART_ID`),
  KEY `CART_ID` (`CART_ID`),
  KEY `tb_cart_ibfk_1` (`MEMBER_ID`),
  KEY `tb_cart_ibfk_2` (`PRODUCT_ID`),
  CONSTRAINT `tb_cart_ibfk_1` FOREIGN KEY (`MEMBER_ID`) REFERENCES `tb_member` (`MEMBER_ID`) ON DELETE CASCADE,
  CONSTRAINT `tb_cart_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `tb_product` (`PD_IDX`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart`
--

LOCK TABLES `tb_cart` WRITE;
/*!40000 ALTER TABLE `tb_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categories`
--

DROP TABLE IF EXISTS `tb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categories` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_code` varchar(64) NOT NULL,
  `cat_name` varchar(120) NOT NULL,
  `up_code` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categories`
--

LOCK TABLES `tb_categories` WRITE;
/*!40000 ALTER TABLE `tb_categories` DISABLE KEYS */;
INSERT INTO `tb_categories` VALUES (1,'A100000','?????????',NULL),(2,'A100001','????????????',NULL),(3,'B100000','?????????PC','A100000'),(4,'C100001','???????????????','B100000'),(5,'C100002','????????????','B100000'),(6,'C100003','?????????','B100000'),(7,'C100004','????????? ?????????','B100000'),(8,'C100005','????????????','B100000'),(9,'C100006','?????????','B100000'),(10,'C100007','????????????','B100000');
/*!40000 ALTER TABLE `tb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_member`
--

DROP TABLE IF EXISTS `tb_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_member` (
  `IDX` int NOT NULL AUTO_INCREMENT,
  `MEMBER_ID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????? ?????????',
  `MEMBER_PW` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????? ????????????',
  `MEMBER_NM` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????? ??????',
  `MEMBER_PHONE_NUM` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????? ???????????????',
  `MEMBER_EMAIL` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????? ?????????',
  `MEMBER_ADDR` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????? ??????',
  `MEMBER_BIRTH` date NOT NULL COMMENT '?????? ????????????',
  `CREAT_TIME` timestamp NULL DEFAULT NULL COMMENT '???????????? ??????',
  `LAST_LOGIN` date DEFAULT NULL COMMENT '????????? ????????? ??????',
  `PASS_CHANGE` date DEFAULT NULL COMMENT '????????? ???????????? ?????????',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL COMMENT '????????? ?????? ?????? ?????????',
  PRIMARY KEY (`IDX`),
  UNIQUE KEY `MEMBER_ID` (`MEMBER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_member`
--

LOCK TABLES `tb_member` WRITE;
/*!40000 ALTER TABLE `tb_member` DISABLE KEYS */;
INSERT INTO `tb_member` VALUES (1,'userTest','$2a$10$eMbS1beEwGJ210BX1Ekk6Od9Kwk32oX3bqEzhDj6ulW4KTIQwiYa2','?????????','01089568304','test@naver.com','????????? ?????????','2022-01-01','2022-08-10 03:52:52',NULL,'2022-08-10',NULL),(2,'admin','$2a$10$zbho0ZIH5sImQr14kWSmBe5I.dxh/7DCIY3NDk3.BO8U58YrBBBrK','?????????','01089568304','admin@naver.com','????????? ?????????','2022-01-01','2022-08-10 03:53:23',NULL,'2022-08-10',NULL),(3,'userTest2','$2a$10$8/xoSRJjMM9PwyxafFFfsen.eVgQH8ArQKXHSEekSPb8dNyD/bC2u','?????????2','01089568304','test2@naver.com','????????? ?????????','2022-01-01','2022-08-10 04:26:21',NULL,'2022-08-10',NULL);
/*!40000 ALTER TABLE `tb_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order` (
  `ORDER_ID` int NOT NULL AUTO_INCREMENT,
  `MEMBER_ID` varchar(30) NOT NULL DEFAULT '',
  `PRODUCT_ID` int NOT NULL,
  `CART_ID` int NOT NULL,
  `TOTAL_PRICE` int NOT NULL,
  `TOTAL_AMOUNT` int NOT NULL,
  `ORDER_CREATE_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` VALUES (1,'userTest',1,0,400000,4,'2022-08-10 04:21:10');
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_product` (
  `PD_IDX` int NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `PD_SELLER_ID` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '???????????????',
  `PD_LARGE_CAT` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '1???????????????',
  `PD_MIDDLE_CAT` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '2???????????????',
  `PD_SUB_CAT` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '3???????????????',
  `PD_NAME` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????????',
  `PD_PRICE` int NOT NULL COMMENT '?????????',
  `PD_DISCOUNT` int NOT NULL COMMENT '?????????',
  `SET_SALE_PERIOD` tinyint NOT NULL DEFAULT '0' COMMENT '?????????????????? ??????',
  `PD_SALE_PERIOD` date NOT NULL COMMENT '????????????',
  `PD_STOCK` int NOT NULL COMMENT '????????????',
  `PD_DESC` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '????????????',
  `PD_DELIVERY_CHARGE` int NOT NULL COMMENT '?????????',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '????????????',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`PD_IDX`),
  KEY `PD_SELLER_ID` (`PD_SELLER_ID`),
  CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`PD_SELLER_ID`) REFERENCES `tb_seller` (`SELLER_MEMBER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'userTest','A100000','B100000','C100001','??????????????? ?????????',100000,0,0,'2099-01-01',96,'??????????????? ????????? ?????????.',2500,'2022-08-10 03:58:59',NULL),(2,'userTest','A100000','B100000','C100002','???????????? ??????',1000000,0,0,'2099-01-01',100,'???????????? ?????? ?????????.',2500,'2022-08-10 04:10:14',NULL),(3,'userTest','A100000','B100000','C100003','????????? ?????????',1300000,0,0,'2099-01-01',100,'????????? ????????? ?????????.',2500,'2022-08-10 04:10:37',NULL),(4,'userTest','A100000','B100000','C100004','????????? ????????? ?????????',600000,0,0,'2099-01-01',100,'????????? ????????? ????????? ?????????.',2500,'2022-08-10 04:11:31',NULL),(5,'userTest','A100000','B100000','C100005','?????? ????????????',50000,0,0,'2099-01-01',100,'?????? ???????????? ?????????.',2500,'2022-08-10 04:11:54',NULL),(6,'userTest','A100000','B100000','C100006','????????? ?????????',80000,0,0,'2099-01-01',100,'????????? ????????? ?????????.',2500,'2022-08-10 04:12:45',NULL),(7,'userTest','A100000','B100000','C100007','???????????? ?????? ??????????????????',10000,0,0,'2099-01-01',100,'???????????? ?????? ?????????????????? ?????????',2500,'2022-08-10 04:13:38',NULL);
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role` (
  `ROLE_MEMBER_ID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????? ?????????',
  `MEMBER_ROLE` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????? ??????',
  KEY `ROLE_MEMBER_ID` (`ROLE_MEMBER_ID`),
  CONSTRAINT `tb_role_ibfk_1` FOREIGN KEY (`ROLE_MEMBER_ID`) REFERENCES `tb_member` (`MEMBER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES ('userTest','ROLE_USER'),('admin','ROLE_USER'),('admin','ROLE_ADMIN'),('userTest','ROLE_SELLER'),('userTest2','ROLE_USER');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_seller`
--

DROP TABLE IF EXISTS `tb_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_seller` (
  `SELLER_IDX` int NOT NULL AUTO_INCREMENT,
  `SELLER_MEMBER_ID` varchar(20) NOT NULL,
  `SHOP_NAME` varchar(50) NOT NULL,
  `SHOP_ADDR` varchar(50) NOT NULL,
  `SHOP_TEL_NUM` varchar(20) NOT NULL,
  `SELLER_CREATE_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SELLER_IDX`),
  KEY `SELLER_MEMBER_ID` (`SELLER_MEMBER_ID`),
  CONSTRAINT `tb_seller_ibfk_1` FOREIGN KEY (`SELLER_MEMBER_ID`) REFERENCES `tb_member` (`MEMBER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_seller`
--

LOCK TABLES `tb_seller` WRITE;
/*!40000 ALTER TABLE `tb_seller` DISABLE KEYS */;
INSERT INTO `tb_seller` VALUES (1,'userTest','???????????????','????????? ?????????','031-123-1234','2022-08-10 03:56:30');
/*!40000 ALTER TABLE `tb_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_token`
--

DROP TABLE IF EXISTS `tb_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_token` (
  `REFRESH_TOKEN_IDX` int NOT NULL AUTO_INCREMENT COMMENT '?????? ????????? ??????',
  `REFRESH_TOKEN` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '???????????? ??????',
  `KEY_MEMBER_ID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '?????? ?????????',
  `TOKEN_CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '?????? ?????? ??????',
  PRIMARY KEY (`REFRESH_TOKEN_IDX`),
  KEY `KEY_MEMBER_ID` (`KEY_MEMBER_ID`),
  CONSTRAINT `tb_token_ibfk_1` FOREIGN KEY (`KEY_MEMBER_ID`) REFERENCES `tb_member` (`MEMBER_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_token`
--

LOCK TABLES `tb_token` WRITE;
/*!40000 ALTER TABLE `tb_token` DISABLE KEYS */;
INSERT INTO `tb_token` VALUES (2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY2MDEzNjAzMSwiZXhwIjoxNjYwMTcyMDMxfQ.17dIyGwetjluJ0qlUOCIVHTyTEFsYpPa2UtfRTEzMWs','admin','2022-08-10 03:53:51'),(3,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyVGVzdCIsImlhdCI6MTY2MDEzNjE1MiwiZXhwIjoxNjYwMTcyMTUyfQ.xyYkiPhN8f-hTvqIDNLME1KSnxkoXUIeBXGpuHHVyUc','userTest','2022-08-10 03:55:52'),(4,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyVGVzdDIiLCJpYXQiOjE2NjAxMzc5ODcsImV4cCI6MTY2MDE3Mzk4N30.MaAAks_loSA6EtJxG0gYxVp1LvMkVb9EBqRt_wqtf34','userTest2','2022-08-10 04:26:27');
/*!40000 ALTER TABLE `tb_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-11 12:55:22
