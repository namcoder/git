-- MySQL dump 10.13  Distrib 5.6.38-83.0, for Linux (x86_64)
--
-- Host: 10.10.10.97    Database: wb_theme_fruitshop2_loveitop_com
-- ------------------------------------------------------
-- Server version	5.6.38-83.0-log

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
-- Table structure for table `wb_activity_log`
--

DROP TABLE IF EXISTS `wb_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_activity_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_activity_log`
--

LOCK TABLES `wb_activity_log` WRITE;
/*!40000 ALTER TABLE `wb_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_addon`
--

DROP TABLE IF EXISTS `wb_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_addon` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_addon`
--

LOCK TABLES `wb_addon` WRITE;
/*!40000 ALTER TABLE `wb_addon` DISABLE KEYS */;
INSERT INTO `wb_addon` VALUES ('advanced_sales_reports','0'),('affiliate','0'),('analytics_google','0'),('buy_X_gave_Y','0'),('coupon','1'),('CRM','0'),('kiotviet','0'),('multi_languages','0'),('order_sms','0'),('product_filter','0'),('smart_search','0'),('ssl','0'),('stamped_photos','0'),('store_order_cancel','1'),('vip_sales_reports','1');
/*!40000 ALTER TABLE `wb_addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_admin`
--

DROP TABLE IF EXISTS `wb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `remember_token` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_admin`
--

LOCK TABLES `wb_admin` WRITE;
/*!40000 ALTER TABLE `wb_admin` DISABLE KEYS */;
INSERT INTO `wb_admin` VALUES (61,'admin@imgroup.vn','admin','$2y$10$KlfvJ//ZKMpRvtN.lmda6.rSBiVTNhwDd/MDf9dpOUAss94f0kQma',1,0,'BWrWXOS1zajpYlP3UXJLd5ux6aoiatJ8P3CdSLBJsF2kMTo8haZZHt12uvjv',NULL,'2018-06-14 07:08:50');
/*!40000 ALTER TABLE `wb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_admin_group`
--

DROP TABLE IF EXISTS `wb_admin_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_admin_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `role_ids` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_admin_group`
--

LOCK TABLES `wb_admin_group` WRITE;
/*!40000 ALTER TABLE `wb_admin_group` DISABLE KEYS */;
INSERT INTO `wb_admin_group` VALUES (48,'Nhóm Admin','[\"contact\",\"post\",\"product\",\"partner\",\"order\",\"menu\",\"page\",\"widget\",\"setting\",\"omnichannel\",\"gallery_image\",\"slider\",\"testimonials\",\"subscriber\",\"comment\",\"custom_css\",\"affiliate\"]','2018-06-26 01:13:03','2018-06-26 03:40:36'),(49,'Nhóm nội dung','[\"post\",\"product\",\"partner\",\"menu\",\"page\",\"widget\",\"gallery_image\",\"slider\",\"testimonials\",\"comment\"]','2018-06-26 03:40:24','2018-06-26 03:40:24');
/*!40000 ALTER TABLE `wb_admin_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_advert`
--

DROP TABLE IF EXISTS `wb_advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `advert_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `advert_for` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_advert`
--

LOCK TABLES `wb_advert` WRITE;
/*!40000 ALTER TABLE `wb_advert` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_advert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_advert_description`
--

DROP TABLE IF EXISTS `wb_advert_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_advert_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advert_id` int(11) NOT NULL,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_advert_description`
--

LOCK TABLES `wb_advert_description` WRITE;
/*!40000 ALTER TABLE `wb_advert_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_advert_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_advert_items`
--

DROP TABLE IF EXISTS `wb_advert_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_advert_items` (
  `advert_id` int(11) NOT NULL,
  `advert_item_id` int(11) NOT NULL,
  `advert_item_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`advert_id`,`advert_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_advert_items`
--

LOCK TABLES `wb_advert_items` WRITE;
/*!40000 ALTER TABLE `wb_advert_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_advert_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_affiliate`
--

DROP TABLE IF EXISTS `wb_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_affiliate` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `referal_id` int(11) DEFAULT NULL,
  `affiliate_code` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `total_balance` double(14,2) unsigned zerofill NOT NULL DEFAULT '00000000000.00',
  `avaiable_balance` double(14,2) DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_affiliate`
--

LOCK TABLES `wb_affiliate` WRITE;
/*!40000 ALTER TABLE `wb_affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_affiliate_transaction`
--

DROP TABLE IF EXISTS `wb_affiliate_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_affiliate_transaction` (
  `id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '1: Chuyển affiiliate profit từ order_id\n2: Rút tiền',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(14,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_affiliate_transaction`
--

LOCK TABLES `wb_affiliate_transaction` WRITE;
/*!40000 ALTER TABLE `wb_affiliate_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_affiliate_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_category`
--

DROP TABLE IF EXISTS `wb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `taxonomy` varchar(191) COLLATE utf8_unicode_ci NOT NULL COMMENT '3:page, 4: post, 5:product',
  `thumbnail` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `icon` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  `is_published` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_category`
--

LOCK TABLES `wb_category` WRITE;
/*!40000 ALTER TABLE `wb_category` DISABLE KEYS */;
INSERT INTO `wb_category` VALUES (1,0,'product','','',0,1,'2017-12-04 06:50:31','2017-12-04 06:50:31'),(5,0,'post','2017/12/04/722-furniture-category.jpg','',0,1,'2017-12-04 07:16:49','2017-12-04 07:18:22'),(7,0,'product','','',0,1,'2017-12-21 15:25:53','2017-12-21 15:25:53'),(8,1,'product','','',0,1,'2017-12-21 15:27:22','2017-12-21 15:27:22'),(9,1,'product','','',0,1,'2017-12-21 15:28:14','2017-12-21 15:28:14'),(10,0,'product','','',0,1,'2018-01-23 08:55:48','2018-01-23 08:55:48'),(11,1,'product','','',0,1,'2018-02-28 02:00:47','2018-02-28 02:00:47'),(12,1,'product','','',0,1,'2018-02-28 07:46:23','2018-02-28 07:46:23'),(13,1,'product','','',0,1,'2018-02-28 07:47:22','2018-02-28 07:47:22');
/*!40000 ALTER TABLE `wb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_category_description`
--

DROP TABLE IF EXISTS `wb_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_category_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `lang_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `h1` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cat_id` (`cat_id`,`lang_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_category_description`
--

LOCK TABLES `wb_category_description` WRITE;
/*!40000 ALTER TABLE `wb_category_description` DISABLE KEYS */;
INSERT INTO `wb_category_description` VALUES (1,1,'vi','Sản phẩm','Sản phẩm','Sản phẩm'),(5,5,'vi','Tin nội thất ','Tin nội thất','Tin nội thất '),(7,7,'vi','Sản phẩm ',NULL,'Sản phẩm '),(8,8,'vi','Phòng Khách','Phòng Khách','Phòng Khách'),(9,9,'vi','Kệ Tủ Sách','Kệ Tủ Sách','Kệ Tủ Sách'),(10,10,'vi','abc','abc','abc'),(11,11,'vi','BÀN GHÉ,','BÀN GHÉ,','BÀN GHÉ,'),(12,12,'vi','bàn ghế','bàn ghế','bàn ghế'),(13,13,'vi','Bàn Ghế','Bàn Ghế','Bàn Ghế');
/*!40000 ALTER TABLE `wb_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_comment`
--

DROP TABLE IF EXISTS `wb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(10) unsigned NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `censorship` tinyint(1) DEFAULT NULL,
  `review` int(5) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `comments_commentable_id_commentable_type_index` (`commentable_id`,`commentable_type`) USING BTREE,
  KEY `comments__lft__rgt_parent_id_index` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_comment`
--

LOCK TABLES `wb_comment` WRITE;
/*!40000 ALTER TABLE `wb_comment` DISABLE KEYS */;
INSERT INTO `wb_comment` VALUES (1,'vanminh@imgroup.vn','Huỳnh Văn Minh','qssad',163,'post',0,1,NULL,'2018-03-02 13:03:06','2018-03-02 13:03:06'),(2,'huynhminh009@gmail.com','Huỳnh Minh','Sản phẩm đẹp, ngồi thoải mái',224,'product',0,1,NULL,'2018-03-07 02:01:52','2018-03-07 02:01:52');
/*!40000 ALTER TABLE `wb_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_config`
--

DROP TABLE IF EXISTS `wb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_config`
--

LOCK TABLES `wb_config` WRITE;
/*!40000 ALTER TABLE `wb_config` DISABLE KEYS */;
INSERT INTO `wb_config` VALUES (106,'website_name','web builder'),(107,'logo','/images-2.png'),(108,'icon','/images-2.png'),(112,'phone','1900636040'),(113,'maps','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.5212389954095!2d106.66915026422619!3d10.771332792324984!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752ede5d3d8e67%3A0x327d8ec7d2f6f41c!2zQ8O0bmcgdHkgQ-G7lSBwaOG6p24gdsOgIMSQ4bqndSB0xrAgcGjDoXQgdHJp4buDbiBJTSAtIElNIEdyb3Vw!5e0!3m2!1svi!2s!4v1505099779069\" width=\"100%\" height=\"380\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>'),(114,'web_status','1'),(115,'web_status_notice','<h1>kinh doanh lỗ qu&aacute; m&eacute;o sử dụng nữa</h1>\r\n'),(121,'currency','{\"code\":\"vnd\",\"unit\":\"\\u0111\",\"prefix\":\"4\",\"number_format\":\"0\"}'),(122,'order_code_format','{\"pre_code\":\"#\",\"suf_code\":\"\"}'),(123,'weight_unit','kg'),(124,'dimensions_unit','m'),(125,'send_order_email','{\"name\":\"C\\u00f4ng Ty C\\u1ed5 Ph\\u1ea7n \\u0110\\u1ea7u T\\u01b0 V\\u00e0 Ph\\u00e1t Tri\\u1ec3n IM\",\"email\":\"ngochien@imgroup.vn\",\"password\":\"gxumyhjjcnlcqjxp\",\"mail_host\":\"smtp.gmail.com\",\"mail_port\":\"587\"}'),(126,'receive_order_email','ngochien@imgroup.vn'),(129,'structure_email_send_new_order','{\"title\":\"[Website] Th\\u00f4ng b\\u00e1o \\u0111\\u1eb7t h\\u00e0ng th\\u00e0nh c\\u00f4ng\",\"body\":\"<p>C\\u1ea3m \\u01a1n qu&yacute; kh&aacute;ch <strong>[fullname]<\\/strong> \\u0111&atilde; \\u0111\\u1eb7t h&agrave;ng t\\u1ea1i Website.<br \\/>\\r\\n\\u0110\\u01a1n h&agrave;ng <strong>[code]<\\/strong> c\\u1ee7a qu&yacute; kh&aacute;ch \\u0111&atilde; \\u0111\\u01b0\\u1ee3c ti\\u1ebfp nh\\u1eadn, ch&uacute;ng t&ocirc;i s\\u1ebd x\\u1eed l&yacute; trong kho\\u1ea3ng th\\u1eddi gian s\\u1edbm nh\\u1ea5t. Sau \\u0111&acirc;y l&agrave; th&ocirc;ng tin \\u0111\\u01a1n h&agrave;ng.<br \\/>\\r\\n<strong>[order-info]<\\/strong><br \\/>\\r\\n<strong>[order-detail]<\\/strong><br \\/>\\r\\n<i>L\\u01b0u &yacute;: \\u0111\\u01a1n h&agrave;ng s\\u1ebd \\u0111\\u01b0\\u1ee3c giao \\u0111\\u1ebfn \\u0111\\u1ecba ch\\u1ec9 <strong>[address]<\\/strong> sau 3 - 5 ng&agrave;y k\\u1ec3 t\\u1eeb khi ti\\u1ebfp nh\\u1eadn \\u0111\\u01a1n h&agrave;ng, \\u0111\\u1ed1i v\\u1edbi v&ugrave;ng s&acirc;u v&ugrave;ng xa, th\\u1eddi gian giao h&agrave;ng c&oacute; th\\u1ec3 k&eacute;o d&agrave;i \\u0111\\u1ebfn 15 ng&agrave;y.<\\/i><br \\/>\\r\\nN\\u1ebfu b\\u1ea1n c&oacute; b\\u1ea5t k\\u1ef3 th\\u1eafc m\\u1eafc n&agrave;o, vui l&ograve;ng g\\u1ecdi \\u0111\\u1ebfn s\\u1ed1 0123456789, nh&acirc;n vi&ecirc;n t\\u01b0 v\\u1ea5n c\\u1ee7a ch&uacute;ng t&ocirc;i lu&ocirc;n s\\u1eb5n l&ograve;ng h\\u1ed7 tr\\u1ee3 b\\u1ea1n<br \\/>\\r\\nM\\u1ed9t l\\u1ea7n n\\u1eefa, Website xin c\\u1ea3m \\u01a1n qu&yacute; kh&aacute;ch<\\/p>\\r\\n\"}'),(130,'structure_email_send_cancel_order','{\"title\":\"h\\u1eb9n b\\u1ea1n d\\u1ecbp kh\\u00e1c gh\\u00e9 th\\u0103m web m\\u00ecnh nh\\u00e9\",\"body\":\"<p>h\\u1eb9n b\\u1ea1n d\\u1ecbp kh&aacute;c gh&eacute; th\\u0103m web m&igrave;nh nh&eacute;<\\/p>\\r\\n\"}'),(149,'seo_default','{\"meta_title\":\"N\\u1ed9i th\\u1ea5t\",\"meta_description\":\"C\\u0103n h\\u1ed9 v\\u1edbi h\\u00e0ng lo\\u1ea1t n\\u1ed9i th\\u1ea5t h\\u00e0ng hi\\u1ec7u s\\u1ebd l\\u00e0 n\\u01a1i d\\u1eebng ch\\u00e2n c\\u1ee7a moi ng\\u01b0\\u1eddi\",\"meta_keyword\":\"\",\"robots\":\"1\"}'),(150,'address','18 Trần Thiện Chánh P12 Quận 10 HCM'),(151,'style','{\"wb-body-background-image\":\"\",\"wb-body-background-color\":\"\",\"wb-link-color\":\"\",\"wb-link-color-active\":\"\",\"wb-price-color\":\"\",\"wb-header-top-background-image\":\"\",\"wb-header-top-background-color\":\"\",\"wb-header-main-background-image\":\"\",\"wb-header-main-background-color\":\"\",\"wb-header-menu-background-image\":\"\",\"wb-header-menu-background-color\":\"\",\"wb-header-menu-item-color\":\"\",\"wb-header-menu-item-active-background-color\":\"\",\"wb-header-menu-item-active-color\":\"\",\"wb-footer-main-background-image\":\"\",\"wb-footer-main-background-color\":\"\",\"wb-footer-main-title-color\":\"\",\"wb-footer-bottom-background-image\":\"\",\"wb-footer-bottom-background-color\":\"\",\"style_advance\":\".main-nav > ul > li:hover > a, .search-form::after {\\r\\n    color: #fff;\\r\\n}\\r\\n.gal-content3 .btn-gal:hover, .product-extra-link .addcart-link:hover, .product-extra-link .addcart_link_contact:hover, .product-thumb > .quickview-link:hover {\\r\\n    background: #15b9ad;\\r\\n    color: #fff;\\r\\n}\"}'),(153,'file_style','1516695915'),(163,'url_detail','asp'),(164,'url','{\"category\":\"all\",\"detail\":{\"url_category\":\"0\",\"extension\":\"html\"}}'),(165,'style_sheet_fruitshop','color11.css'),(167,'social','{\"facebook\":\"https:\\/\\/vi-vn.facebook.com\\/IMGroupVietnam\\/\",\"google\":\"https:\\/\\/www.google.com\\/maps\\/d\\/viewer?mid=1LuaG7_bwBkwTWhcguxwG5R7P5AM&hl=en_US&ll=10.779297615545467%2C106.68153211920162&z=16\",\"twitter\":\"https:\\/\\/twitter.com\\/hashtag\\/imgroup\",\"youtube\":\"https:\\/\\/www.youtube.com\\/watch?v=ltYuOscH_Mg\"}'),(168,'email','info@imgroup.vn'),(169,'tag_html','{\"tag_head\":\"\",\"tag_header\":\"\",\"tag_footer\":\"\"}'),(170,'effect_loading','{\"active\":\"1\",\"type\":\"circle\",\"bg-color\":\"#15b9ad\",\"color\":\"#ffffff\"}'),(171,'payment_method','[\"paypal\",\"master_card\",\"visa\"]'),(172,'comment','{\"type\":\"system\",\"page\":[\"0\",\"post\",\"product\"],\"censorship\":\"0\",\"avatar\":\"avatar.png\"}'),(173,'order_is_contact','0'),(174,'hide_price','0'),(175,'button','{\"hotline\":{\"value\":\"\",\"position\":\"right\",\"size\":\"small\",\"active\":\"0\"},\"email\":{\"value\":\"\",\"position\":\"left\",\"size\":\"big\",\"active\":\"0\"},\"facebook\":{\"value\":\"\",\"position\":\"left\",\"size\":\"big\",\"active\":\"0\"}}'),(176,'main_color_fruitshop','#00bac0'),(177,'datetime_format','d/m/Y H:i'),(178,'main_color','#15b9ad'),(179,'font','Sans-Serif'),(180,'style_color_version','1529384121'),(181,'shop_address','[{\"name\":\"C\\u00f4ng Ty C\\u1ed5 Ph\\u1ea7n \\u0110\\u1ea7u T\\u01b0 V\\u00e0 Ph\\u00e1t Tri\\u1ec3n IM\",\"fullname\":\"C\\u00f4ng Ty C\\u1ed5 Ph\\u1ea7n \\u0110\\u1ea7u T\\u01b0 V\\u00e0 Ph\\u00e1t Tri\\u1ec3n IM\",\"email\":\"support@imgroup.vn\",\"phone\":\"1900636040\",\"province\":\"TP. H\\u1ed3 Ch\\u00ed Minh\",\"district\":\"Qu\\u1eadn 10\",\"address\":\"18 Tr\\u1ea7n Thi\\u1ec7n Ch\\u00e1nh, Ph\\u01b0\\u1eddng 12\"}]'),(182,'notice_order_success','<p style=\"text-align: center;\">Qu&yacute; kh&aacute;ch&nbsp;đ&atilde; đặt h&agrave;ng th&agrave;nh c&ocirc;ng sản phẩm của cửa h&agrave;ng. Xin cảm ơn qu&yacute; kh&aacute;ch.</p>\r\n\r\n<p style=\"text-align: center;\"><img alt=\"Image result for thank you\" height=\"141\" src=\"http://www.sosseafest.org/wp-content/uploads/2018/02/Briliant-Animated-Thank-You-Images-17-For-Your-Animations-with-Animated-Thank-You-Images.jpg\" width=\"250\" /></p>\r\n'),(183,'comment_time','2018-05-04 09:35:31'),(185,'seo_url','{\"full_category\":\"1\",\"detail\":{\"url_category\":\"1\",\"extension\":\"html\"}}'),(186,'contact_time','2018-06-22 10:05:53'),(187,'order_input','{\"name\":{\"text\":\"H\\u1eb9 t\\u00ean\",\"hidden\":\"0\",\"required\":\"0\"},\"phone\":{\"text\":\"Phone\",\"hidden\":\"1\",\"required\":\"0\"},\"email\":{\"text\":\"Email\",\"hidden\":\"1\",\"required\":\"0\"},\"address\":{\"hidden\":\"0\",\"required\":\"0\"},\"note\":{\"text\":\"Note\",\"hidden\":\"0\",\"required\":\"0\"}}'),(188,'website_info','{\"start_date\":\"2018-06-03\",\"expire_date\":\"2019-06-15\",\"package_name\":\"Gói khởi nghiệp\",\"capacity\":300}'),(189,'wb_checkout_rules','{\"minimum\":\"\",\"note\":\"\"}'),(190,'exit_popup','{\"version\":\"1529310285\",\"active\":\"0\"}'),(191,'thankyou_page',NULL),(192,'structure_email_send_order_status','{\"title\":\"\",\"body\":\"\"}'),(193,'popup','{\"version\":\"1529310291\",\"active\":\"0\",\"display_after\":\"1\"}'),(194,'active_layout','{\"header\":\"style2\",\"homepage\":\"\",\"sidebar\":\"\",\"footer\":\"\"}');
/*!40000 ALTER TABLE `wb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_config_description`
--

DROP TABLE IF EXISTS `wb_config_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_config_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_id` (`config_id`,`lang_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_config_description`
--

LOCK TABLES `wb_config_description` WRITE;
/*!40000 ALTER TABLE `wb_config_description` DISABLE KEYS */;
INSERT INTO `wb_config_description` VALUES (1,190,'vi',''),(2,191,'vi','{\"title\":\"\\u0110\\u1eb7t h\\u00e0ng th\\u00e0nh c\\u00f4ng\",\"content\":\"<p>C&aacute;m \\u01a1n b\\u1ea1n \\u0111&atilde; \\u0111\\u1eb7t h&agrave;ng t\\u1ea1i website. Ch&uacute;ng t&ocirc;i s\\u1ebd li&ecirc;n h\\u1ec7 b\\u1ea1n trong th\\u1eddi gian s\\u1edbm nh\\u1ea5t.<\\/p>\\r\\n\"}'),(3,193,'vi','');
/*!40000 ALTER TABLE `wb_config_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_contact`
--

DROP TABLE IF EXISTS `wb_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_contact`
--

LOCK TABLES `wb_contact` WRITE;
/*!40000 ALTER TABLE `wb_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_coupon`
--

DROP TABLE IF EXISTS `wb_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `limit` int(11) DEFAULT '0',
  `used` int(11) NOT NULL DEFAULT '0',
  `value` double DEFAULT '0' COMMENT '3:page, 4: post, 5:product',
  `apply_for` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_ids` text COLLATE utf8_unicode_ci,
  `max_discount` double DEFAULT '0',
  `min_order_price` double DEFAULT '0',
  `individual_use_only` tinyint(4) DEFAULT '0',
  `exclude_sale_items` tinyint(4) DEFAULT '0',
  `is_stopped` tinyint(4) DEFAULT '0',
  `start_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_coupon`
--

LOCK TABLES `wb_coupon` WRITE;
/*!40000 ALTER TABLE `wb_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_district`
--

DROP TABLE IF EXISTS `wb_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=717 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_district`
--

LOCK TABLES `wb_district` WRITE;
/*!40000 ALTER TABLE `wb_district` DISABLE KEYS */;
INSERT INTO `wb_district` VALUES (1,1,'01','Quận Ba Đình'),(2,1,'02','Quận Hoàn Kiếm'),(3,1,'03','Quận Hai Bà Trưng'),(4,1,'04','Quận Đống Đa'),(5,1,'05','Quận Tây Hồ'),(6,1,'06','Quận Cầu Giấy'),(7,1,'07','Quận Thanh Xuân'),(8,1,'08','Quận Hoàng Mai'),(9,1,'09','Quận Long Biên'),(10,1,'10','Quận Bắc Từ Liêm'),(11,1,'11','Huyện Thanh Trì'),(12,1,'12','Huyện Gia Lâm'),(13,1,'13','Huyện Đông Anh'),(14,1,'14','Huyện Sóc Sơn'),(15,1,'15','Quận Hà Đông'),(16,1,'16','Thị xã Sơn Tây'),(17,1,'17','Huyện Ba Vì'),(18,1,'18','Huyện Phúc Thọ'),(19,1,'19','Huyện Thạch Thất'),(20,1,'20','Huyện Quốc Oai'),(21,1,'21','Huyện Chương Mỹ'),(22,1,'22','Huyện Đan Phượng'),(23,1,'23','Huyện Hoài Đức'),(24,1,'24','Huyện Thanh Oai'),(25,1,'25','Huyện Mỹ Đức'),(26,1,'26','Huyện Ứng Hòa'),(27,1,'27','Huyện Thường Tín'),(28,1,'28','Huyện Phú Xuyên'),(29,1,'29','Huyện Mê Linh'),(30,1,'30','Quận Nam Từ Liêm'),(31,2,'01','Quận 1'),(32,2,'02','Quận 2'),(33,2,'03','Quận 3'),(34,2,'04','Quận 4'),(35,2,'05','Quận 5'),(36,2,'06','Quận 6'),(37,2,'07','Quận 7'),(38,2,'08','Quận 8'),(39,2,'09','Quận 9'),(40,2,'10','Quận 10'),(41,2,'11','Quận 11'),(42,2,'12','Quận 12'),(43,2,'13','Quận Gò Vấp'),(44,2,'14','Quận Tân Bình'),(45,2,'15','Quận Tân Phú'),(46,2,'16','Quận Bình Thạnh'),(47,2,'17','Quận Phú Nhuận'),(48,2,'18','Quận Thủ Đức'),(49,2,'19','Quận Bình Tân'),(50,2,'20','Huyện Bình Chánh'),(51,2,'21','Huyện Củ Chi'),(52,2,'22','Huyện Hóc Môn'),(53,2,'23','Huyện Nhà Bè'),(54,2,'24','Huyện Cần Giờ'),(55,3,'01','Quận Hồng Bàng'),(56,3,'02','Quận Lê Chân'),(57,3,'03','Quận Ngô Quyền'),(58,3,'04','Quận Kiến An'),(59,3,'05','Quận Hải An'),(60,3,'06','Quận Đồ Sơn'),(61,3,'07','Huyện An Lão'),(62,3,'08','Huyện Kiến Thụy'),(63,3,'09','Huyện Thủy Nguyên'),(64,3,'10','Huyện An Dương'),(65,3,'11','Huyện Tiên Lãng'),(66,3,'12','Huyện Vĩnh Bảo'),(67,3,'13','Huyện Cát Hải'),(68,3,'14','Huyện Bạch Long Vĩ'),(69,3,'15','Quận Dương Kinh'),(70,4,'01','Quận Hải Châu'),(71,4,'02','Quận Thanh Khê'),(72,4,'03','Quận Sơn Trà'),(73,4,'04','Quận Ngũ Hành Sơn'),(74,4,'05','Quận Liên Chiểu'),(75,4,'06','Huyện Hòa Vang'),(76,4,'07','Quận Cẩm Lệ'),(77,4,'08','Huyện Hoàng Sa'),(78,5,'01','Thành phố Hà Giang'),(79,5,'02','Huyện Đồng Văn'),(80,5,'03','Huyện Mèo Vạc'),(81,5,'04','Huyện Yên Minh'),(82,5,'05','Huyện Quản Bạ'),(83,5,'06','Huyện Vị Xuyên'),(84,5,'07','Huyện Bắc Mê'),(85,5,'08','Huyện Hoàng Su Phì'),(86,5,'09','Huyện Xín Mần'),(87,5,'10','Huyện Bắc Quang'),(88,5,'11','Huyện Quang Bình'),(89,5,'12','Huyện Bắc Mê'),(90,6,'01','Thành phố Cao Bằng'),(91,6,'02','Huyện Bảo Lạc'),(92,6,'03','Huyện Thông Nông'),(93,6,'04','Huyện Hà Quảng'),(94,6,'05','Huyện Trà Lĩnh'),(95,6,'06','Huyện Trùng Khánh'),(96,6,'07','Huyện Nguyên Bình'),(97,6,'08','Huyện Hòa An'),(98,6,'09','Huyện Quảng Uyên'),(99,6,'10','Huyện Thạch An'),(100,6,'11','Huyện Hạ Lang'),(101,6,'12','Huyện Bảo Lâm'),(102,6,'13','Huyện Phục Hòa'),(103,6,'14','Huyện Hòa An'),(104,7,'01','Thành Phố Lai Châu'),(105,7,'02','Huyện Tam Đường'),(106,7,'03','Huyện Phong Thổ'),(107,7,'04','Huyện Sìn Hồ'),(108,7,'05','Huyện Mường Tè'),(109,7,'06','Huyện Than Uyên'),(110,7,'07','Huyện Tân Uyên'),(111,7,'08','Huyện Nậm Nhùn'),(112,8,'01','Huyện Bảo Thắng'),(113,8,'02','Huyện Bảo Yên'),(114,8,'03','Huyện Bát Xát'),(115,8,'04','Huyện Bắc Hà'),(116,8,'05','Thành phố Lào Cai'),(117,8,'06','Huyện Mường Khương'),(118,8,'07','Huyện Sa Pa'),(119,8,'08','Huyện Si Ma Cai'),(120,8,'09','Huyện Văn Bàn'),(121,9,'01','Thành phố Tuyên Quang'),(122,9,'02','Huyện Lâm Bình'),(123,9,'03','Huyện Na Hang'),(124,9,'04','Huyện Chiêm Hóa'),(125,9,'05','Huyện Hàm Yên'),(126,9,'06','Huyện Yên Sơn'),(127,9,'07','Huyện Sơn Dương'),(128,10,'01','Thành phố Lạng Sơn'),(129,10,'02','Huyện Tràng Định'),(130,10,'03','Huyện Bình Gia'),(131,10,'04','Huyện Văn Lãng'),(132,10,'05','Huyện Bắc Sơn'),(133,10,'06','Huyện Văn Quan'),(134,10,'07','Huyện Cao Lộc'),(135,10,'08','Huyện Lộc Bình'),(136,10,'09','Huyện Chi Lăng'),(137,10,'10','Huyện Đình Lập'),(138,10,'11','Huyện Hữu Lũng'),(139,11,'01','Thành phố Bắc Kạn'),(140,11,'02','Huyện Chợ Đồn'),(141,11,'03','Huyện Bạch Thông'),(142,11,'04','Huyện Na Rì'),(143,11,'05','Huyện Ngân Sơn'),(144,11,'06','Huyện Ba Bể'),(145,11,'07','Huyện Chợ Mới'),(146,11,'08','Huyện Pác Nặm'),(147,12,'01','Thành phố Thái Nguyên'),(148,12,'02','Thành phố Sông Công'),(149,12,'03','Huyện Định Hóa'),(150,12,'04','Huyện Phú Lương'),(151,12,'05','Huyện Võ Nhai'),(152,12,'06','Huyện Đại Từ'),(153,12,'07','Huyện Đồng Hỷ'),(154,12,'08','Huyện Phú Bình'),(155,12,'09','Thị xã Phổ Yên'),(156,13,'01','Thành phố Yên Bái'),(157,13,'02','Thị xã Nghĩa Lộ'),(158,13,'03','Huyện Văn Yên'),(159,13,'04','Huyện Yên Bình'),(160,13,'05','Huyện Mù Cang Chải'),(161,13,'06','Huyện Văn Chấn'),(162,13,'07','Huyện Trấn Yên'),(163,13,'08','Huyện Trạm Tấu'),(164,13,'09','Huyện Lục Yên'),(165,14,'01','Thành phố Sơn La'),(166,14,'02','Huyện Quỳnh Nhai'),(167,14,'03','Huyện Mường La'),(168,14,'04','Huyện Thuận Châu'),(169,14,'05','Huyện Bắc Yên'),(170,14,'06','Huyện Phù Yên'),(171,14,'07','Huyện Mai Sơn'),(172,14,'08','Huyện Yên Châu'),(173,14,'09','Huyện Sông Mã'),(174,14,'10','Huyện Mộc Châu'),(175,14,'11','Huyện Sốp Cộp'),(176,14,'12','Huyện Vân Hồ'),(177,15,'01','Thành phố Việt Trì'),(178,15,'02','Thị xã Phú Thọ'),(179,15,'03','Huyện Đoan Hùng'),(180,15,'04','Huyện Thanh Ba'),(181,15,'05','Huyện Hạ Hòa'),(182,15,'06','Huyện Cẩm Khê'),(183,15,'07','Huyện Yên Lập'),(184,15,'08','Huyện Thanh Sơn'),(185,15,'09','Huyện Phù Ninh'),(186,15,'10','Huyện Lâm Thao'),(187,15,'11','Huyện Tam Nông'),(188,15,'12','Huyện Thanh Thủy'),(189,15,'13','Huyện Tân Sơn'),(190,16,'01','Thành phố Vĩnh Yên'),(191,16,'02','Huyện Tam Dương'),(192,16,'03','Huyện Lập Thạch'),(193,16,'04','Huyện Vĩnh Tường'),(194,16,'05','Huyện Yên Lạc'),(195,16,'06','Huyện Bình Xuyên'),(196,16,'07','Huyện Sông Lô'),(197,16,'08','Thị xã Phúc Yên'),(198,16,'09','Huyện Tam Đảo'),(199,17,'01','Thành phố Hạ Long'),(200,17,'02','Thành phố Cẩm Phả'),(201,17,'03','Thành phố Uông Bí'),(202,17,'04','Thành phố Móng Cái'),(203,17,'05','Huyện Bình Liêu'),(204,17,'06','Huyện Đầm Hà'),(205,17,'07','Huyện Hải Hà'),(206,17,'08','Huyện Tiên Yên'),(207,17,'09','Huyện Ba Chẽ'),(208,17,'10','Thị xã Đông Triều'),(209,17,'11','Thị xã Quảng Yên'),(210,17,'12','Huyện Hoành Bồ'),(211,17,'13','Huyện Vân Đồn'),(212,17,'14','Huyện Cô Tô'),(213,18,'01','Thành phố Bắc Giang'),(214,18,'02','Huyện Yên Thế'),(215,18,'03','Huyện Lục Ngạn'),(216,18,'04','Huyện Sơn Động'),(217,18,'05','Huyện Lục Nam'),(218,18,'06','Huyện Tân Yên'),(219,18,'07','Huyện Hiệp Hòa'),(220,18,'08','Huyện Lạng Giang'),(221,18,'09','Huyện Việt Yên'),(222,18,'10','Huyện Yên Dũng'),(223,19,'01','Thành phố Bắc Ninh'),(224,19,'02','Huyện Yên Phong'),(225,19,'03','Huyện Quế Võ'),(226,19,'04','Huyện Tiên Du'),(227,19,'05','Thị xã Từ Sơn'),(228,19,'06','Huyện Thuận Thành'),(229,19,'07','Huyện Gia Bình'),(230,19,'08','Huyện Lương Tài'),(231,20,'01','Thành phố Hải Dương'),(232,20,'02','Thị xã Chí Linh'),(233,20,'03','Huyện Nam Sách'),(234,20,'04','Huyện Kinh Môn'),(235,20,'05','Huyện Gia Lộc'),(236,20,'06','Huyện Tứ Kỳ'),(237,20,'07','Huyện Thanh Miện'),(238,20,'08','Huyện Ninh Giang'),(239,20,'09','Huyện Cẩm Giàng'),(240,20,'10','Huyện Thanh Hà'),(241,20,'11','Huyện Kim Thành'),(242,20,'12','Huyện Bình Giang'),(243,21,'01','Thành phố Hưng Yên'),(244,21,'02','Huyện Kim Động'),(245,21,'03','Huyện Ân Thi'),(246,21,'04','Huyện KHóai Châu'),(247,21,'05','Huyện Yên Mỹ'),(248,21,'06','Huyện Tiên Lữ'),(249,21,'07','Huyện Phù Cừ'),(250,21,'08','Huyện Mỹ Hào'),(251,21,'09','Huyện Văn Lâm'),(252,21,'10','Huyện Văn Giang'),(253,22,'01','Thành phố Hòa Bình'),(254,22,'02','Huyện Đà Bắc'),(255,22,'03','Huyện Mai Châu'),(256,22,'04','Huyện Tân Lạc'),(257,22,'05','Huyện Lạc Sơn'),(258,22,'06','Huyện Kỳ Sơn'),(259,22,'07','Huyện Lương Sơn'),(260,22,'08','Huyện Kim Bôi'),(261,22,'09','Huyện Lạc Thủy'),(262,22,'10','Huyện Yên Thủy'),(263,22,'11','Huyện Cao Phong'),(264,23,'01','Thành phố Phủ Lý'),(265,23,'02','Huyện Duy Tiên'),(266,23,'03','Huyện Kim Bảng'),(267,23,'04','Huyện Lý Nhân'),(268,23,'05','Huyện Thanh Liêm'),(269,23,'06','Huyện Bình Lục'),(270,24,'01','Thành phố Nam Định'),(271,24,'02','Huyện Mỹ Lộc'),(272,24,'03','Huyện Xuân Trường'),(273,24,'04','Huyện Giao Thủy'),(274,24,'05','Huyện ý Yên'),(275,24,'06','Huyện Vụ Bản'),(276,24,'07','Huyện Nam Trực'),(277,24,'08','Huyện Trực Ninh'),(278,24,'09','Huyện Nghĩa Hưng'),(279,24,'10','Huyện Hải Hậu'),(280,25,'01','Thành phố Thái Bình'),(281,25,'02','Huyện Quỳnh Phụ'),(282,25,'03','Huyện Hưng Hà'),(283,25,'04','Huyện Đông Hưng'),(284,25,'05','Huyện Vũ Thư'),(285,25,'06','Huyện Kiến Xương'),(286,25,'07','Huyện Tiền Hải'),(287,25,'08','Huyện Thái Thụy'),(288,26,'01','Thành phố Ninh Bình'),(289,26,'02','Thành phố Tam Điệp'),(290,26,'03','Huyện Nho Quan'),(291,26,'04','Huyện Gia Viễn'),(292,26,'05','Huyện Hoa Lư'),(293,26,'06','Huyện Yên Mô'),(294,26,'07','Huyện Kim Sơn'),(295,26,'08','Huyện Yên Khánh'),(296,27,'01','Thành phố Thanh Hóa'),(297,27,'02','Thị xã Bỉm Sơn'),(298,27,'03','Thị xã Sầm Sơn'),(299,27,'04','Huyện Quan Hóa'),(300,27,'05','Huyện Quan Sơn'),(301,27,'06','Huyện Mường Lát'),(302,27,'07','Huyện Bá Thước'),(303,27,'08','Huyện Thường Xuân'),(304,27,'09','Huyện Như Xuân'),(305,27,'10','Huyện Như Thanh'),(306,27,'11','Huyện Lang Chánh'),(307,27,'12','Huyện Ngọc Lặc'),(308,27,'13','Huyện Thạch Thành'),(309,27,'14','Huyện Cẩm Thủy'),(310,27,'15','Huyện Thọ Xuân'),(311,27,'16','Huyện Vĩnh Lộc'),(312,27,'17','Huyện Thiệu Hóa'),(313,27,'18','Huyện Triệu Sơn'),(314,27,'19','Huyện Nông Cống'),(315,27,'20','Huyện Đông Sơn'),(316,27,'21','Huyện Hà Trung'),(317,27,'22','Huyện Hoằng Hóa'),(318,27,'23','Huyện Nga Sơn'),(319,27,'24','Huyện Hậu Lộc'),(320,27,'25','Huyện Quảng Xương'),(321,27,'26','Huyện Tĩnh Gia'),(322,27,'27','Huyện Yên Định'),(323,28,'01','Thành phố Vinh'),(324,28,'02','Thị xã Cửa Lò'),(325,28,'03','Huyện Quỳ Châu'),(326,28,'04','Huyện Quỳ Hợp'),(327,28,'05','Huyện Nghĩa Đàn'),(328,28,'06','Huyện Quỳnh Lưu'),(329,28,'07','Huyện Kỳ Sơn'),(330,28,'08','Huyện Tương Dương'),(331,28,'09','Huyện Con Cuông'),(332,28,'10','Huyện Tân Kỳ'),(333,28,'11','Huyện Yên Thành'),(334,28,'12','Huyện Diễn Châu'),(335,28,'13','Huyện Anh Sơn'),(336,28,'14','Huyện Đô Lương'),(337,28,'15','Huyện Thanh Chương'),(338,28,'16','Huyện Nghi Lộc'),(339,28,'17','Huyện Nam Đàn'),(340,28,'18','Huyện Hưng Nguyên'),(341,28,'19','Huyện Quế Phong'),(342,28,'20','Thị Xã Thái Hòa'),(343,28,'21','Thị Xã Hoàng Mai'),(344,29,'01','Thành phố Hà Tĩnh'),(345,29,'02','Thị xã Hồng Lĩnh'),(346,29,'03','Huyện Hương Sơn'),(347,29,'04','Huyện Đức Thọ'),(348,29,'05','Huyện Nghi Xuân'),(349,29,'06','Huyện Can Lộc'),(350,29,'07','Huyện Hương Khê'),(351,29,'08','Huyện Thạch Hà'),(352,29,'09','Huyện Cẩm Xuyên'),(353,29,'10','Huyện Kỳ Anh'),(354,29,'11','Huyện Vũ Quang'),(355,29,'12','Huyện Lộc Hà'),(356,29,'13','Thị xã Kỳ Anh'),(357,30,'01','Thành phố Đồng Hới'),(358,30,'02','Huyện Tuyên Hóa'),(359,30,'03','Huyện Minh Hóa'),(360,30,'04','Huyện Quảng Trạch'),(361,30,'05','Huyện Bố Trạch'),(362,30,'06','Huyện Quảng Ninh'),(363,30,'07','Huyện Lệ Thủy'),(364,30,'08','Thị xã Ba Đồn'),(365,31,'01','Thành phố Đông Hà'),(366,31,'02','Thị xã Quảng Trị'),(367,31,'03','Huyện Vĩnh Linh'),(368,31,'04','Huyện Gio Linh'),(369,31,'05','Huyện Cam Lộ'),(370,31,'06','Huyện Triệu Phong'),(371,31,'07','Huyện Hải Lăng'),(372,31,'08','Huyện Hướng Hóa'),(373,31,'09','Huyện Đakrông'),(374,31,'10','Huyện đảo Cồn Cỏ'),(375,32,'01','Thành phố Huế'),(376,32,'02','Huyện Phong Điền'),(377,32,'03','Huyện Quảng Điền'),(378,32,'04','Thị xã Hương Trà'),(379,32,'05','Huyện Phú Vang'),(380,32,'06','Thị xã Hương Thủy'),(381,32,'07','Huyện Phú Lộc'),(382,32,'08','Huyện Nam Đông'),(383,32,'09','Huyện A Lưới'),(384,33,'01','Thành phố Tam Kỳ'),(385,33,'02','Thành phố Hội An'),(386,33,'03','Huyện Duy Xuyên'),(387,33,'04','Thị xã Điện Bàn'),(388,33,'05','Huyện Đại Lộc'),(389,33,'06','Huyện Quế Sơn'),(390,33,'07','Huyện Hiệp Đức'),(391,33,'08','Huyện Thăng Bình'),(392,33,'09','Huyện Núi Thành'),(393,33,'10','Huyện Tiên Phước'),(394,33,'11','Huyện Bắc Trà My'),(395,33,'12','Huyện Đông Giang'),(396,33,'13','Huyện Nam Giang'),(397,33,'14','Huyện Phước Sơn'),(398,33,'15','Huyện Nam Trà My'),(399,33,'16','Huyện Tây Giang'),(400,33,'17','Huyện Phú Ninh'),(401,33,'18','Huyện Nông Sơn'),(402,34,'01','Huyện Bình Sơn'),(403,34,'02','Huyện Sơn Tịnh'),(404,34,'03','Thành phố Quảng Ngãi'),(405,34,'04','Huyện Tư Nghĩa'),(406,34,'05','Huyện Nghĩa Hành'),(407,34,'06','Huyện Mộ Đức'),(408,34,'07','Huyện Đức Phổ'),(409,34,'08','Huyện Ba Tơ'),(410,34,'09','Huyện Minh Long'),(411,34,'10','Huyện Sơn Hà'),(412,34,'11','Huyện Sơn Tây'),(413,34,'12','Huyện Trà Bồng'),(414,34,'13','Huyện Tây Trà'),(415,34,'14','Huyện Lý Sơn'),(416,35,'01','Thành phố Kon Tum'),(417,35,'02','Huyện ĐĂK GLEI'),(418,35,'03','Huyện Ngọc Hồi'),(419,35,'04','Huyện Đăk Tô'),(420,35,'05','Huyện Sa Thầy'),(421,35,'06','Huyện Kon Plông'),(422,35,'07','Huyện Đăk Hà'),(423,35,'08','Huyện Kon Rẫy'),(424,35,'09','Huyện Tu Mơ Rông'),(425,35,'10','Huyện IA H\'DRAI'),(426,36,'01','Thành phố Quy Nhơn'),(427,36,'02','Huyện An Lão'),(428,36,'03','Huyện Hoài Ân'),(429,36,'04','Huyện Hoài Nhơn'),(430,36,'05','Huyện Phù Mỹ'),(431,36,'06','Huyện Phù Cát'),(432,36,'07','Huyện Vĩnh Thạnh'),(433,36,'08','Huyện Tây Sơn'),(434,36,'09','Huyện Vân Canh'),(435,36,'10','Thị xã An Nhơn'),(436,36,'11','Huyện Tuy Phước'),(437,37,'01','Thành phố Pleiku'),(438,37,'02','Huyện Chư Păh'),(439,37,'03','Huyện Mang Yang'),(440,37,'04','Huyện KBang'),(441,37,'05','Thị xã An Khê'),(442,37,'06','Huyện Kông Chro'),(443,37,'07','Huyện Đức Cơ'),(444,37,'08','Huyện Chư Prông'),(445,37,'09','Huyện Chư Sê'),(446,37,'10','Thị xã Ayun Pa'),(447,37,'11','Huyện Krông Pa'),(448,37,'12','Huyện Ia Grai'),(449,37,'13','Huyện Đak Đoa'),(450,37,'14','Huyện Ia Pa'),(451,37,'15','Huyện Đak Pơ'),(452,37,'16','Huyện Phú Thiện'),(453,37,'17','Huyện Chư Pưh'),(454,38,'01','Thành phố Tuy Hòa'),(455,38,'02','Huyện Đồng Xuân'),(456,38,'03','Thị Xã Sông Cầu'),(457,38,'04','Huyện Tuy An'),(458,38,'05','Huyện Sơn Hòa'),(459,38,'06','Huyện Sông Hinh'),(460,38,'07','Huyện Đông Hòa'),(461,38,'08','Huyện Phú Hòa'),(462,38,'09','Huyện Tây Hòa'),(463,39,'01','Th.phố Buôn Ma Thuột'),(464,39,'02','Huyện Ea H\'Leo'),(465,39,'03','Huyện Krông Buk'),(466,39,'04','Huyện Krông Năng'),(467,39,'05','Huyện Ea Súp'),(468,39,'06','Huyện Cư M\'gar'),(469,39,'07','Huyện Krông Pắc'),(470,39,'08','Huyện Ea Kar'),(471,39,'09','Huyện M\'Đrắk'),(472,39,'10','Huyện Krông Ana'),(473,39,'11','Huyện Krông Bông'),(474,39,'12','Huyện Lắk'),(475,39,'13','Huyện Buôn Đôn'),(476,39,'14','Huyện Cư Kuin'),(477,39,'15','Thị Xã Buôn Hồ'),(478,40,'01','Thành phố Nha Trang'),(479,40,'02','Huyện Vạn Ninh'),(480,40,'03','Thị xã Ninh Hòa'),(481,40,'04','Huyện Diên Khánh'),(482,40,'05','Huyện Khánh Vĩnh'),(483,40,'06','Thành phố Cam Ranh'),(484,40,'07','Huyện Khánh Sơn'),(485,40,'08','Huyện đảo Trường Sa'),(486,40,'09','Huyện Cam Lâm'),(487,41,'01','Thành phố Đà Lạt'),(488,41,'02','Thành phố Bảo Lộc'),(489,41,'03','Huyện Đức Trọng'),(490,41,'04','Huyện Di Linh'),(491,41,'05','Huyện Đơn Dương'),(492,41,'06','Huyện Lạc Dương'),(493,41,'07','Huyện Đạ Huoai'),(494,41,'08','Huyện Đạ Tẻh'),(495,41,'09','Huyện Cát Tiên'),(496,41,'10','Huyện Lâm Hà'),(497,41,'11','Huyện Bảo Lâm'),(498,41,'12','Huyện Đam Rông'),(499,42,'01','Thị xã Đồng Xoài'),(500,42,'02','Huyện Đồng Phú'),(501,42,'03','Huyện Chơn Thành'),(502,42,'04','Thị xã Bình Long'),(503,42,'05','Huyện Lộc Ninh'),(504,42,'06','Huyện Bù Đốp'),(505,42,'07','Thị xã Phước Long'),(506,42,'08','Huyện Bù Đăng'),(507,42,'09','Huyện Hớn Quản'),(508,42,'10','Huyện Bù Gia Mập'),(509,42,'11','Huyện Phú Riềng'),(510,43,'01','Th. phố Thủ Dầu Một'),(511,43,'02','Thị xã Bến Cát'),(512,43,'03','Thị xã Tân Uyên'),(513,43,'04','Thị xã Thuận An'),(514,43,'05','Thị xã Dĩ An'),(515,43,'06','Huyện Phú Giáo'),(516,43,'07','Huyện Dầu Tiếng'),(517,43,'08','Huyện Bắc Tân Uyên'),(518,43,'09','Huyện Bàu Bàng'),(519,43,'10','Huyện Phú Giáo'),(520,44,'01','Thành phố Phan Rang - Tháp Chàm'),(521,44,'02','Huyện Ninh Sơn'),(522,44,'03','Huyện Ninh Hải'),(523,44,'04','Huyện Ninh Phước'),(524,44,'05','Huyện Bác Ái'),(525,44,'06','Huyện Thuận Bắc'),(526,44,'07','Huyện Thuận Nam'),(527,45,'01','Thành phố Tây Ninh'),(528,45,'02','Huyện Tân Biên'),(529,45,'03','Huyện Tân Châu'),(530,45,'04','Huyện Dương Minh Châu'),(531,45,'05','Huyện Châu Thành'),(532,45,'06','Huyện Hòa Thành'),(533,45,'07','Huyện Bến Cầu'),(534,45,'08','Huyện Gò Dầu'),(535,45,'09','Huyện Trảng Bàng'),(536,46,'01','Thành phố Phan Thiết'),(537,46,'02','Huyện Tuy Phong'),(538,46,'03','Huyện Bắc Bình'),(539,46,'04','Huyện Hàm Thuận Bắc'),(540,46,'05','Huyện Hàm Thuận Nam'),(541,46,'06','Huyện Hàm Tân'),(542,46,'07','Huyện Đức Linh'),(543,46,'08','Huyện Tánh Linh'),(544,46,'09','Huyện đảo Phú Quý'),(545,46,'10','Thị xã La Gi'),(546,47,'01','Thành phố Biên Hòa'),(547,47,'02','Huyện Vĩnh Cửu'),(548,47,'03','Huyện Tân Phú'),(549,47,'04','Huyện Định Quán'),(550,47,'05','Huyện Thống Nhất'),(551,47,'06','Thị xã Long Khánh'),(552,47,'07','Huyện Xuân Lộc'),(553,47,'08','Huyện Long Thành'),(554,47,'09','Huyện Nhơn Trạch'),(555,47,'10','Huyện Trảng Bom'),(556,47,'11','Huyện Cẩm Mỹ'),(557,48,'01','Thành phố Tân An'),(558,48,'02','Huyện Vĩnh Hưng'),(559,48,'03','Huyện Mộc Hóa'),(560,48,'04','Huyện Tân Thạnh'),(561,48,'05','Huyện Thạnh Hóa'),(562,48,'06','Huyện Đức Huệ'),(563,48,'07','Huyện Đức Hòa'),(564,48,'08','Huyện Bến Lức'),(565,48,'09','Huyện Thủ Thừa'),(566,48,'10','Huyện Châu Thành'),(567,48,'11','Huyện Tân Trụ'),(568,48,'12','Huyện Cần Đước'),(569,48,'13','Huyện Cần Giuộc'),(570,48,'14','Huyện Tân Hưng'),(571,48,'15','Thị xã Kiến Tường'),(572,49,'01','Huyện Châu Thành'),(573,49,'02','Huyện Lai Vung'),(574,49,'03','Huyện Lấp Vò'),(575,49,'04','Thành phố Sa Đéc'),(576,49,'05','Thành phố Cao Lãnh'),(577,49,'06','Huyện Cao Lãnh'),(578,49,'07','Huyện Tháp Mười'),(579,49,'08','Huyện Tam Nông'),(580,49,'09','Huyện Thanh Bình'),(581,49,'10','Thị xã Hồng Ngự'),(582,49,'11','Huyện Hồng Ngự'),(583,49,'12','Huyện Tân Hồng'),(584,50,'01','Thành phố Long Xuyên'),(585,50,'02','Thành phố Châu Đốc'),(586,50,'03','Huyện An Phú'),(587,50,'04','Thị xã Tân Châu'),(588,50,'05','Huyện Phú Tân'),(589,50,'06','Huyện Tịnh Biên'),(590,50,'07','Huyện Tri Tôn'),(591,50,'08','Huyện Châu Phú'),(592,50,'09','Huyện Chợ Mới'),(593,50,'10','Huyện Châu Thành'),(594,50,'11','Huyện Thoại Sơn'),(595,51,'01','Thành phố Vũng Tàu'),(596,51,'02','Thành phố Bà Rịa'),(597,51,'03','Huyện Xuyên Mộc'),(598,51,'04','Huyện Long Điền'),(599,51,'05','Huyện Côn Đảo'),(600,51,'06','Huyện Tân Thành'),(601,51,'07','Huyện Châu Đức'),(602,51,'08','Huyện Đất Đỏ'),(603,52,'01','Thành phố Mỹ Tho'),(604,52,'02','Thị xã Gò Công'),(605,52,'03','Huyện Cái Bè'),(606,52,'04','Huyện Cai Lậy'),(607,52,'05','Huyện Châu Thành'),(608,52,'06','Huyện Chợ Gạo'),(609,52,'07','Huyện Gò Công Tây'),(610,52,'08','Huyện Gò Công Đông'),(611,52,'09','Huyện Tân Phước'),(612,52,'10','Huyện Tân Phú Đông'),(613,52,'11','Thị xã Cai Lậy'),(614,53,'01','Thành phố Rạch Giá'),(615,53,'02','Thị xã Hà Tiên'),(616,53,'03','Huyện Kiên Lương'),(617,53,'04','Huyện Hòn Đất'),(618,53,'05','Huyện Tân Hiệp'),(619,53,'06','Huyện Châu Thành'),(620,53,'07','Huyện Giồng Riềng'),(621,53,'08','Huyện Gò Quao'),(622,53,'09','Huyện An Biên'),(623,53,'10','Huyện An Minh'),(624,53,'11','Huyện Vĩnh Thuận'),(625,53,'12','Huyện Phú Quốc'),(626,53,'13','Huyện Kiên Hải'),(627,53,'14','Huyện U Minh Thượng'),(628,53,'15','Huyện Giang Thành'),(629,54,'01','Quận Ninh Kiều'),(630,54,'02','Quận Bình Thủy'),(631,54,'03','Quận Cái Răng'),(632,54,'04','Quận Ô Môn'),(633,54,'05','Huyện Phong Điền'),(634,54,'06','Huyện Cờ Đỏ'),(635,54,'07','Huyện Vĩnh Thạnh'),(636,54,'08','Quận Thốt Nốt'),(637,54,'09','Huyện Thới Lai'),(638,55,'01','Thành phố Bến Tre'),(639,55,'02','Huyện Châu Thành'),(640,55,'03','Huyện Chợ Lách'),(641,55,'04','Huyện Mỏ Cày Bắc'),(642,55,'05','Huyện Giồng Trôm'),(643,55,'06','Huyện Bình Đại'),(644,55,'07','Huyện Ba Tri'),(645,55,'08','Huyện Thạnh Phú'),(646,55,'09','Huyện Mỏ Cày Nam'),(647,56,'01','Thành phố Vĩnh Long'),(648,56,'02','Huyện Long Hồ'),(649,56,'03','Huyện Mang Thít'),(650,56,'04','Thị xã Bình Minh'),(651,56,'05','Huyện Tam Bình'),(652,56,'06','Huyện Trà Ôn'),(653,56,'07','Huyện Vũng Liêm'),(654,56,'08','Huyện Bình Tân'),(655,57,'01','Thành phố Trà Vinh'),(656,57,'02','Huyện Càng Long'),(657,57,'03','Huyện Cầu Kè'),(658,57,'04','Huyện Tiểu Cần'),(659,57,'05','Huyện Châu Thành'),(660,57,'06','Huyện Trà Cú'),(661,57,'07','Huyện Cầu Ngang'),(662,57,'08','Huyện Duyên Hải'),(663,57,'09','Thị xã Duyên Hải'),(664,58,'01','Thành phố Sóc Trăng'),(665,58,'02','Huyện Kế Sách'),(666,58,'03','Huyện Mỹ Tú'),(667,58,'04','Huyện Mỹ Xuyên'),(668,58,'05','Huyện Thạnh Trị'),(669,58,'06','Huyện Long Phú'),(670,58,'07','Thị xã Vĩnh Châu'),(671,58,'08','Huyện Cù Lao Dung'),(672,58,'09','Thị xã Ngã Năm'),(673,58,'10','Huyện Châu Thành'),(674,58,'11','Huyện Trần Đề'),(675,59,'01','Thành phố Bạc Liêu'),(676,59,'02','Huyện Vĩnh Lợi'),(677,59,'03','Huyện Hồng Dân'),(678,59,'04','Thị xã Giá Rai'),(679,59,'05','Huyện Phước Long'),(680,59,'06','Huyện Đông Hải'),(681,59,'07','Huyện Hòa Bình'),(682,60,'01','Thành phố Cà Mau'),(683,60,'02','Huyện Thới Bình'),(684,60,'03','Huyện U Minh'),(685,60,'04','Huyện Trần Văn Thời'),(686,60,'05','Huyện Cái Nước'),(687,60,'06','Huyện Đầm Dơi'),(688,60,'07','Huyện Ngọc Hiển'),(689,60,'08','Huyện Năm Căn'),(690,60,'09','Huyện Phú Tân'),(691,61,'01','Thành phố Điện Biên Phủ'),(692,61,'02','Thị xã Mường Lay'),(693,61,'03','Huyện Điện Biên'),(694,61,'04','Huyện Tuần Giáo'),(695,61,'05','Huyện Mường Chà'),(696,61,'06','Huyện Tủa Chùa'),(697,61,'07','Huyện Điện Biên Đông'),(698,61,'08','Huyện Mường Nhé'),(699,61,'09','Huyện Mường ảng'),(700,61,'10','Huyện Nậm Pồ'),(701,62,'01','Thị xã Gia Nghĩa'),(702,62,'02','Huyện Đăk R\'Lấp'),(703,62,'03','Huyện Đăk Mil'),(704,62,'04','Huyện Cư Jút'),(705,62,'05','Huyện Đăk Song'),(706,62,'06','Huyện Krông Nô'),(707,62,'07','Huyện Đăk GLong'),(708,62,'08','Huyện Tuy Đức'),(709,63,'01','Thành phố Vị Thanh'),(710,63,'02','Huyện Vị Thủy'),(711,63,'03','Huyện Long Mỹ'),(712,63,'04','Huyện Phụng Hiệp'),(713,63,'05','Huyện Châu Thành'),(714,63,'06','Huyện Châu Thành A'),(715,63,'07','Thị xã Ngã Bảy'),(716,63,'08','Thị xã Long Mỹ');
/*!40000 ALTER TABLE `wb_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_gallery_image`
--

DROP TABLE IF EXISTS `wb_gallery_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_gallery_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `is_published` tinyint(1) DEFAULT '1',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_gallery_image`
--

LOCK TABLES `wb_gallery_image` WRITE;
/*!40000 ALTER TABLE `wb_gallery_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_gallery_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_gallery_image_description`
--

DROP TABLE IF EXISTS `wb_gallery_image_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_gallery_image_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_image_id` int(11) NOT NULL,
  `lang_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET ucs2 COLLATE ucs2_unicode_ci NOT NULL,
  `alt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_gallery_image_description`
--

LOCK TABLES `wb_gallery_image_description` WRITE;
/*!40000 ALTER TABLE `wb_gallery_image_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_gallery_image_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_group_feature`
--

DROP TABLE IF EXISTS `wb_group_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_group_feature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `taxonomy` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `is_condition` tinyint(1) NOT NULL,
  `config` text COLLATE utf8_unicode_ci,
  `thumb` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_group_feature`
--

LOCK TABLES `wb_group_feature` WRITE;
/*!40000 ALTER TABLE `wb_group_feature` DISABLE KEYS */;
INSERT INTO `wb_group_feature` VALUES (1,'Tin mới nhất','post',1,1,'{\"and_condition\":null,\"conditions\":[]}','','2017-12-18 06:52:31','2017-12-18 06:52:31'),(2,'Tin tức xem nhiều nhất','post',5,1,'{\"and_condition\":null,\"conditions\":[]}','','2017-12-18 06:59:01','2017-12-18 06:59:01'),(3,'Sản phẩm mới nhất','product',2,1,'{\"and_condition\":\"0\",\"conditions\":[]}','','2017-12-18 07:04:17','2018-01-20 08:51:11'),(4,'Sản phẩm xem nhiều nhất','product',7,1,'{\"and_condition\":\"0\",\"conditions\":[]}','','2017-12-18 07:08:18','2017-12-18 07:08:18'),(5,'Sản phẩm bán chạy','product',1,0,'{\"and_condition\":\"0\",\"conditions\":[]}','','2017-12-18 07:12:48','2017-12-18 07:12:48'),(6,'Sản phẩm khuyến mãi','product',2,1,'{\"and_condition\":\"2\",\"conditions\":[]}','','2017-12-18 07:14:05','2018-01-20 08:31:20'),(7,'Sản phẩm mới về','product',1,0,'{\"and_condition\":\"0\",\"conditions\":[[\"product.price\",\"=\",\"\"]]}','','2017-12-18 07:56:48','2017-12-18 07:56:48'),(8,'Sản phẩm đề xuất','product',1,0,'{\"and_condition\":\"0\",\"conditions\":[[\"product.price\",\"=\",\"\"]]}','','2017-12-18 07:57:21','2017-12-18 07:57:21'),(118,'Nhóm tùy chọn 1','post',1,0,NULL,'','2018-04-17 01:51:35','2018-04-17 01:51:35'),(119,'Nhóm tùy chọn 2','post',1,0,NULL,'','2018-04-17 01:51:55','2018-04-17 01:51:55'),(120,'Nhóm tùy chọn 3','post',1,0,NULL,'','2018-04-17 01:52:12','2018-04-17 01:52:12'),(121,'Nhóm tùy chọn 1','post',1,0,NULL,'','2018-04-16 18:51:35','2018-04-16 18:51:35'),(122,'Nhóm tùy chọn 2','post',1,0,NULL,'','2018-04-16 18:51:55','2018-04-16 18:51:55'),(123,'Nhóm tùy chọn 3','post',1,0,NULL,'','2018-04-16 18:52:12','2018-04-16 18:52:12');
/*!40000 ALTER TABLE `wb_group_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_group_feature_item`
--

DROP TABLE IF EXISTS `wb_group_feature_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_group_feature_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_feature_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_group_feature_item`
--

LOCK TABLES `wb_group_feature_item` WRITE;
/*!40000 ALTER TABLE `wb_group_feature_item` DISABLE KEYS */;
INSERT INTO `wb_group_feature_item` VALUES (5,3,205,0),(6,3,206,0),(7,3,207,0),(8,3,210,0),(9,3,209,0),(10,3,208,0),(18,3,211,0),(19,3,211,0),(20,3,212,0),(22,3,212,0),(25,3,214,0),(28,3,214,0),(29,3,212,0),(30,3,211,0),(31,3,211,0),(32,3,208,0),(33,3,209,0),(34,3,210,0),(35,3,211,0),(36,3,212,0),(38,3,214,0),(39,3,205,0),(40,3,206,0),(41,3,207,0),(47,2,169,0),(59,3,205,0),(60,3,205,0),(61,3,205,0),(62,3,205,0),(63,3,205,0),(64,3,205,0),(65,3,205,0),(66,3,205,0),(67,3,205,0),(68,3,205,0),(69,3,205,0),(70,3,205,0),(71,3,206,0),(72,3,206,0),(73,3,207,0),(74,3,207,0),(75,3,208,0),(76,3,208,0),(77,3,208,0),(78,3,209,0),(79,3,209,0),(80,3,210,0),(81,3,211,0),(82,3,211,0),(83,3,211,0),(84,3,212,0),(86,3,214,0),(87,3,214,0),(88,3,214,0),(90,3,211,0),(91,3,214,0),(92,3,215,0),(93,3,215,0),(95,3,217,0),(96,3,218,0),(97,3,219,0),(98,3,219,0),(99,3,219,0),(100,3,219,0),(101,3,219,0),(102,3,219,0),(103,3,219,0),(104,3,219,0),(105,3,219,0),(106,3,219,0),(107,3,219,0),(108,3,217,0),(109,3,218,0),(110,3,215,0),(119,3,221,0),(120,3,221,0),(121,3,219,0),(122,3,218,0),(123,3,217,0),(124,3,222,0),(125,3,222,0),(126,3,222,0),(127,3,221,0),(128,3,221,0),(129,3,221,0),(130,3,221,0),(131,3,218,0),(132,3,222,0),(133,3,222,0),(134,3,223,0),(135,3,215,0),(136,3,223,0),(137,3,223,0),(138,3,223,0),(139,3,223,0),(140,3,223,0),(141,3,223,0),(142,3,221,0),(143,3,221,0),(144,3,221,0),(145,3,221,0),(146,3,221,0),(147,3,221,0),(148,3,221,0),(149,3,221,0),(150,3,223,0),(151,3,222,0),(152,3,221,0),(153,3,224,0),(154,2,166,0),(155,2,164,0),(156,2,163,0),(157,3,218,0),(158,3,218,0),(160,2,167,0),(162,2,168,0),(163,2,170,0),(164,3,212,0),(165,3,218,0),(166,3,219,0),(167,3,214,0),(170,3,212,0),(171,3,211,0),(172,3,225,0),(173,3,225,0),(174,3,225,0),(175,3,211,0),(176,3,225,0),(177,2,165,0),(179,3,205,0),(180,3,205,0),(181,3,205,0),(182,3,205,0),(183,3,205,0),(184,3,205,0),(185,3,205,0),(186,3,205,0),(187,3,205,0);
/*!40000 ALTER TABLE `wb_group_feature_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_language`
--

DROP TABLE IF EXISTS `wb_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_language` (
  `code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_language`
--

LOCK TABLES `wb_language` WRITE;
/*!40000 ALTER TABLE `wb_language` DISABLE KEYS */;
INSERT INTO `wb_language` VALUES ('vi','Tiếng Việt',1,1);
/*!40000 ALTER TABLE `wb_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_manufacturer`
--

DROP TABLE IF EXISTS `wb_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_manufacturer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_manufacturer`
--

LOCK TABLES `wb_manufacturer` WRITE;
/*!40000 ALTER TABLE `wb_manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_media`
--

DROP TABLE IF EXISTS `wb_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `title` varchar(500) NOT NULL,
  `caption` varchar(5000) NOT NULL,
  `url` varchar(5000) NOT NULL,
  `thumb` varchar(5000) NOT NULL,
  `time` int(11) NOT NULL,
  `uid` varchar(1000) NOT NULL DEFAULT '',
  `size` int(20) NOT NULL DEFAULT '0',
  `disk` varchar(20) DEFAULT NULL,
  `folder_id` int(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=278 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_media`
--

LOCK TABLES `wb_media` WRITE;
/*!40000 ALTER TABLE `wb_media` DISABLE KEYS */;
INSERT INTO `wb_media` VALUES (269,'jpg','557 banner 1 1','557 banner 1 1','/2018/03/02/557-banner-1-1.jpg','',1519987711,'',393603,'ftp',0,'2018-03-02 17:48:31','2018-03-02 17:48:31'),(268,'jpg','88 slider 5','88 slider 5','/2018/03/02/88-slider-5.jpg','',1519987540,'',322122,'ftp',0,'2018-03-02 17:45:40','2018-03-02 17:45:40'),(267,'png','801 face 3','801 face 3','/2018/03/02/801-face-3.png','',1519987440,'',2250228,'ftp',0,'2018-03-02 17:44:00','2018-03-02 17:44:00'),(265,'jpg','222 slider 2','222 slider 2','/2018/03/02/222-slider-2.jpg','',1519987224,'',257054,'ftp',0,'2018-03-02 17:40:24','2018-03-02 17:40:24'),(266,'jpg','735 slider 1','735 slider 1','/2018/03/02/735-slider-1.jpg','',1519987324,'',274770,'ftp',0,'2018-03-02 17:42:04','2018-03-02 17:42:04'),(264,'jpg','746 912 ph ng kh ch','746 912 ph ng kh ch','/2018/03/02/746-912-ph-ng-kh-ch.jpg','',1519986922,'',325385,'ftp',0,'2018-03-02 17:35:22','2018-03-02 17:35:22'),(263,'jpg','582 744 unnamed','582 744 unnamed','/2018/03/02/582-744-unnamed.jpg','',1519986921,'',437311,'ftp',0,'2018-03-02 17:35:21','2018-03-02 17:35:21'),(262,'jpg','507 335 1','507 335 1','/2018/03/02/507-335-1.jpg','',1519986921,'',306010,'ftp',0,'2018-03-02 17:35:21','2018-03-02 17:35:21'),(261,'jpg','354 577 cover 3','354 577 cover 3','/2018/03/02/354-577-cover-3.jpg','',1519986921,'',343467,'ftp',0,'2018-03-02 17:35:21','2018-03-02 17:35:21'),(260,'jpg','122 257 srt1','122 257 srt1','/2018/03/02/122-257-srt1.jpg','',1519986920,'',226738,'ftp',0,'2018-03-02 17:35:20','2018-03-02 17:35:20'),(259,'jpg','335 1','335 1','/2018/03/02/335-1.jpg','',1519986245,'',396280,'ftp',0,'2018-03-02 17:24:05','2018-03-02 17:24:05'),(258,'jpg','912 ph ng kh ch','912 ph ng kh ch','/2018/03/02/912-ph-ng-kh-ch.jpg','',1519986031,'',416976,'ftp',0,'2018-03-02 17:20:31','2018-03-02 17:20:31'),(257,'jpg','744 unnamed','744 unnamed','/2018/03/02/744-unnamed.jpg','',1519985985,'',546958,'ftp',0,'2018-03-02 17:19:45','2018-03-02 17:19:45'),(256,'jpg','257 srt1','257 srt1','/2018/03/02/257-srt1.jpg','',1519985728,'',296257,'ftp',0,'2018-03-02 17:15:28','2018-03-02 17:15:28'),(255,'jpg','577 cover 3','577 cover 3','/2018/03/02/577-cover-3.jpg','',1519985582,'',424189,'ftp',0,'2018-03-02 17:13:02','2018-03-02 17:13:02'),(254,'jpg','868 hinh nen noi that dep full hd so 43 0','868 hinh nen noi that dep full hd so 43 0','/2018/03/02/868-hinh-nen-noi-that-dep-full-hd-so-43-0.jpg','',1519985537,'',362451,'ftp',0,'2018-03-02 17:12:17','2018-03-02 17:12:17'),(253,'jpg','276 615 782 mitssy website banner september 1','276 615 782 mitssy website banner september 1','/2018/03/02/276-615-782-mitssy-website-banner-september-1.jpg','',1519966171,'',171840,'ftp',0,'2018-03-02 11:49:31','2018-03-02 11:49:31'),(252,'jpg','636 169 bannerforweb 2','636 169 bannerforweb 2','/2018/03/02/636-169-bannerforweb-2.jpg','',1519966043,'',243819,'ftp',0,'2018-03-02 11:47:23','2018-03-02 11:47:23'),(249,'jpg','748 1437538022 doi tra hang hoa','748 1437538022 doi tra hang hoa','/2018/03/01/748-1437538022-doi-tra-hang-hoa.jpg','thumbs/748-1437538022-doi-tra-hang-hoa-150x150.jpg',1519879035,'',56142,'local',0,'2018-03-01 11:37:15','2018-03-01 11:37:15'),(247,'jpg','838 23954075 alt01','838 23954075 alt01','/2018/03/01/838-23954075-alt01.jpg','thumbs/838-23954075-alt01-150x150.jpg',1519876743,'',170323,'local',0,'2018-03-01 10:59:03','2018-03-01 10:59:03'),(248,'jpg','328 article 1481598439 170','328 article 1481598439 170','/2018/03/01/328-article-1481598439-170.jpg','thumbs/328-article-1481598439-170-150x150.jpg',1519878080,'',29325,'local',0,'2018-03-01 11:21:20','2018-03-01 11:21:20'),(245,'jpg','726 alo 2793','726 alo 2793','/2018/03/01/726-alo-2793.jpg','thumbs/726-alo-2793-150x150.jpg',1519876503,'',73648,'local',0,'2018-03-01 10:55:03','2018-03-01 10:55:03'),(244,'jpg','130 ke sach trang 2793 master','130 ke sach trang 2793 master','/2018/03/01/130-ke-sach-trang-2793-master.jpg','thumbs/130-ke-sach-trang-2793-master-150x150.jpg',1519876487,'',74875,'local',0,'2018-03-01 10:54:47','2018-03-01 10:54:47'),(243,'jpg','314 2739','314 2739','/2018/03/01/314-2739.jpg','thumbs/314-2739-150x150.jpg',1519876464,'',140599,'local',0,'2018-03-01 10:54:24','2018-03-01 10:54:24'),(242,'jpg','448 k s ch ayako shirai 2','448 k s ch ayako shirai 2','/2018/03/01/448-k-s-ch-ayako-shirai-2.jpg','thumbs/448-k-s-ch-ayako-shirai-2-150x150.jpg',1519875801,'',100882,'local',0,'2018-03-01 10:43:21','2018-03-01 10:43:21'),(238,'jpg','104 k s ch ayako shirai 3','104 k s ch ayako shirai 3','/2018/03/01/104-k-s-ch-ayako-shirai-3.jpg','thumbs/104-k-s-ch-ayako-shirai-3-150x150.jpg',1519875599,'',117571,'local',0,'2018-03-01 10:39:59','2018-03-01 10:39:59'),(239,'jpg','645 k s ch ayako shirai 7','645 k s ch ayako shirai 7','/2018/03/01/645-k-s-ch-ayako-shirai-7.jpg','thumbs/645-k-s-ch-ayako-shirai-7-150x150.jpg',1519875612,'',84403,'local',0,'2018-03-01 10:40:12','2018-03-01 10:40:12'),(240,'jpg','718 k s ch ayako shirai 4','718 k s ch ayako shirai 4','/2018/03/01/718-k-s-ch-ayako-shirai-4.jpg','thumbs/718-k-s-ch-ayako-shirai-4-150x150.jpg',1519875625,'',94161,'local',0,'2018-03-01 10:40:25','2018-03-01 10:40:25'),(241,'jpg','279 k s ch ayako shirai 6','279 k s ch ayako shirai 6','/2018/03/01/279-k-s-ch-ayako-shirai-6.jpg','thumbs/279-k-s-ch-ayako-shirai-6-150x150.jpg',1519875782,'',69047,'local',0,'2018-03-01 10:43:02','2018-03-01 10:43:02'),(234,'jpg','157 272180','157 272180','/2018/03/01/157-272180.jpg','thumbs/157-272180-150x150.jpg',1519875427,'',84403,'local',0,'2018-03-01 10:37:07','2018-03-01 10:37:07'),(64,'png','941 20140530090558 logo nem web','941 20140530090558 logo nem web','/2017/10/27/941-20140530090558-logo-nem-web.png','thumbs/941-20140530090558-logo-nem-web-150x150.png',1509067245,'',3201,'local',NULL,'2017-10-27 08:20:45','2017-10-27 08:20:45'),(65,'jpg','354 201411223440 logo den nho','354 201411223440 logo den nho','/2017/10/27/354-201411223440-logo-den-nho.jpg','thumbs/354-201411223440-logo-den-nho-150x150.jpg',1509067245,'',13155,'local',NULL,'2017-10-27 08:20:45','2017-10-27 08:20:45'),(66,'png','820 logo','820 logo','/2017/10/27/820-logo.png','thumbs/820-logo-150x150.png',1509067245,'',15887,'local',NULL,'2017-10-27 08:20:45','2017-10-27 08:20:45'),(67,'jpg','21 newscustomers 17','21 newscustomers 17','/2017/10/27/21-newscustomers-17.jpg','thumbs/21-newscustomers-17-150x150.jpg',1509067245,'',13663,'local',NULL,'2017-10-27 08:20:45','2017-10-27 08:20:45'),(68,'jpg','693 thoitrang nam','693 thoitrang nam','/2017/10/27/693-thoitrang-nam.jpg','thumbs/693-thoitrang-nam-150x150.jpg',1509067245,'',16070,'local',NULL,'2017-10-27 08:20:45','2017-10-27 08:20:45'),(69,'png','991 logo 1','991 logo 1','/2017/10/27/991-logo-1.png','thumbs/991-logo-1-150x150.png',1509067543,'',20030,'local',NULL,'2017-10-27 08:25:43','2017-10-27 08:25:43'),(233,'jpg','955 ninjutsu','955 ninjutsu','/2018/03/01/955-ninjutsu.jpg','thumbs/955-ninjutsu-150x150.jpg',1519874679,'',13575,'local',0,'2018-03-01 10:24:39','2018-03-01 10:24:39'),(232,'jpg','234 71wezdtr9sl sl1500','234 71wezdtr9sl sl1500','/2018/03/01/234-71wezdtr9sl-sl1500.jpg','thumbs/234-71wezdtr9sl-sl1500-150x150.jpg',1519874335,'',97546,'local',0,'2018-03-01 10:18:55','2018-03-01 10:18:55'),(231,'jpg','852 26105652 1533736413407184 1101671622 n','852 26105652 1533736413407184 1101671622 n','/2018/03/01/852-26105652-1533736413407184-1101671622-n.jpg','thumbs/852-26105652-1533736413407184-1101671622-n-150x150.jpg',1519873894,'',76045,'local',0,'2018-03-01 10:11:34','2018-03-01 10:11:34'),(230,'jpg','830 26102871 1535432199904272 1799696208 n','830 26102871 1535432199904272 1799696208 n','/2018/03/01/830-26102871-1535432199904272-1799696208-n.jpg','thumbs/830-26102871-1535432199904272-1799696208-n-150x150.jpg',1519873861,'',267621,'local',0,'2018-03-01 10:11:01','2018-03-01 10:11:01'),(229,'jpg','25 ban tra ma vang mat da2012','25 ban tra ma vang mat da2012','/2018/03/01/25-ban-tra-ma-vang-mat-da2012.jpg','thumbs/25-ban-tra-ma-vang-mat-da2012-150x150.jpg',1519873824,'',45299,'local',0,'2018-03-01 10:10:24','2018-03-01 10:10:24'),(227,'jpg','167 q5 600x519','167 q5 600x519','/2018/03/01/167-q5-600x519.jpg','thumbs/167-q5-600x519-150x150.jpg',1519873780,'',64227,'local',0,'2018-03-01 10:09:40','2018-03-01 10:09:40'),(228,'jpg','467 ban tra ma vang mat da207','467 ban tra ma vang mat da207','/2018/03/01/467-ban-tra-ma-vang-mat-da207.jpg','thumbs/467-ban-tra-ma-vang-mat-da207-150x150.jpg',1519873802,'',65105,'local',0,'2018-03-01 10:10:02','2018-03-01 10:10:02'),(226,'jpg','200 ban tra ma vang mat da205','200 ban tra ma vang mat da205','/2018/03/01/200-ban-tra-ma-vang-mat-da205.jpg','thumbs/200-ban-tra-ma-vang-mat-da205-150x150.jpg',1519873735,'',139670,'local',0,'2018-03-01 10:08:55','2018-03-01 10:08:55'),(223,'jpg','807 img02 2','807 img02 2','/2018/03/01/807-img02-2.jpg','thumbs/807-img02-2-150x150.jpg',1519873400,'',154991,'local',0,'2018-03-01 10:03:20','2018-03-01 10:03:20'),(224,'jpg','853 img04 2','853 img04 2','/2018/03/01/853-img04-2.jpg','thumbs/853-img04-2-150x150.jpg',1519873422,'',101894,'local',0,'2018-03-01 10:03:42','2018-03-01 10:03:42'),(225,'jpg','880 img07 1','880 img07 1','/2018/03/01/880-img07-1.jpg','thumbs/880-img07-1-150x150.jpg',1519873433,'',141762,'local',0,'2018-03-01 10:03:53','2018-03-01 10:03:53'),(78,'png','295 favicon digital k','295 favicon digital k','/2017/10/29/295-favicon-digital-k.png','thumbs/295-favicon-digital-k-150x150.png',1509291891,'',17790,'local',NULL,'2017-10-29 22:44:51','2017-10-29 22:44:51'),(80,'jpg','722 furniture category','722 furniture category','/2017/12/04/722-furniture-category.jpg','thumbs/722-furniture-category-150x150.jpg',1512369544,'',215706,'local',NULL,'2017-12-04 13:39:05','2017-12-04 13:39:05'),(86,'jpg','489 photo 4 1505207980167','489 photo 4 1505207980167','/2017/12/04/489-photo-4-1505207980167.jpg','thumbs/489-photo-4-1505207980167-150x150.jpg',1512372637,'',157128,'local',NULL,'2017-12-04 14:30:37','2017-12-04 14:30:37'),(87,'jpg','307 photo 12 1505456177631','307 photo 12 1505456177631','/2017/12/04/307-photo-12-1505456177631.jpg','thumbs/307-photo-12-1505456177631-150x150.jpg',1512372805,'',87673,'local',NULL,'2017-12-04 14:33:25','2017-12-04 14:33:25'),(83,'jpg','762 photo 1 1511755939508','762 photo 1 1511755939508','/2017/12/04/762-photo-1-1511755939508.jpg','thumbs/762-photo-1-1511755939508-150x150.jpg',1512372073,'',67360,'local',NULL,'2017-12-04 14:21:13','2017-12-04 14:21:13'),(84,'jpg','859 photo 0 1509528908257','859 photo 0 1509528908257','/2017/12/04/859-photo-0-1509528908257.jpg','thumbs/859-photo-0-1509528908257-150x150.jpg',1512372182,'',177293,'local',NULL,'2017-12-04 14:23:02','2017-12-04 14:23:02'),(85,'jpg','967 photo 14 1509441583303','967 photo 14 1509441583303','/2017/12/04/967-photo-14-1509441583303.jpg','thumbs/967-photo-14-1509441583303-150x150.jpg',1512372310,'',93928,'local',NULL,'2017-12-04 14:25:10','2017-12-04 14:25:10'),(104,'jpg','615 782 mitssy website banner september 1','615 782 mitssy website banner september 1','/2017/12/04/615-782-mitssy-website-banner-september-1.jpg','thumbs/615-782-mitssy-website-banner-september-1-150x150.jpg',1512400964,'',97788,'local',NULL,'2017-12-04 22:22:44','2017-12-04 22:22:44'),(95,'jpg','111 furniture category','111 furniture category','/2017/12/04/111-furniture-category.jpg','thumbs/111-furniture-category-150x150.jpg',1512375932,'',224776,'local',NULL,'2017-12-04 15:25:32','2017-12-04 15:25:32'),(94,'jpg','169 bannerforweb 2','169 bannerforweb 2','/2017/12/04/169-bannerforweb-2.jpg','thumbs/169-bannerforweb-2-150x150.jpg',1512375068,'',131315,'local',NULL,'2017-12-04 15:11:08','2017-12-04 15:11:08'),(96,'jpg','615 mitssy sinh hoat 1','615 mitssy sinh hoat 1','/2017/12/04/615-mitssy-sinh-hoat-1.jpg','thumbs/615-mitssy-sinh-hoat-1-150x150.jpg',1512377959,'',184605,'local',NULL,'2017-12-04 15:59:19','2017-12-04 15:59:19'),(97,'jpg','269 mitssy sinh hoat 2 1','269 mitssy sinh hoat 2 1','/2017/12/04/269-mitssy-sinh-hoat-2-1.jpg','thumbs/269-mitssy-sinh-hoat-2-1-150x150.jpg',1512377978,'',184377,'local',NULL,'2017-12-04 15:59:38','2017-12-04 15:59:38'),(98,'jpg','525 minimalism 01 1','525 minimalism 01 1','/2017/12/04/525-minimalism-01-1.jpg','thumbs/525-minimalism-01-1-150x150.jpg',1512378472,'',149418,'local',NULL,'2017-12-04 16:07:52','2017-12-04 16:07:52'),(99,'jpg','331 portsmouth','331 portsmouth','/2017/12/04/331-portsmouth.jpg','thumbs/331-portsmouth-150x150.jpg',1512378603,'',146082,'local',NULL,'2017-12-04 16:10:03','2017-12-04 16:10:03'),(100,'jpg','402 malibu','402 malibu','/2017/12/04/402-malibu.jpg','thumbs/402-malibu-150x150.jpg',1512378812,'',140184,'local',NULL,'2017-12-04 16:13:32','2017-12-04 16:13:32'),(101,'jpg','490 norway','490 norway','/2017/12/04/490-norway.jpg','thumbs/490-norway-150x150.jpg',1512378878,'',142561,'local',NULL,'2017-12-04 16:14:38','2017-12-04 16:14:38'),(102,'jpg','651 mid century linng room 1 1 1','651 mid century linng room 1 1 1','/2017/12/04/651-mid-century-linng-room-1-1-1.jpg','thumbs/651-mid-century-linng-room-1-1-1-150x150.jpg',1512378937,'',187633,'local',NULL,'2017-12-04 16:15:37','2017-12-04 16:15:37'),(103,'png','984 picture13434275381130','984 picture13434275381130','/2017/12/04/984-picture13434275381130.png','thumbs/984-picture13434275381130-150x150.png',1512379467,'',15869,'local',NULL,'2017-12-04 16:24:27','2017-12-04 16:24:27'),(105,'jpg','503 thiet ke noi that phong cach phap pho bien 1','503 thiet ke noi that phong cach phap pho bien 1','/2017/12/06/503-thiet-ke-noi-that-phong-cach-phap-pho-bien-1.jpg','thumbs/503-thiet-ke-noi-that-phong-cach-phap-pho-bien-1-150x150.jpg',1512531069,'',271169,'local',NULL,'2017-12-06 10:31:09','2017-12-06 10:31:09'),(106,'jpg','275 phong cach scandinavian tinh te trong thiet ke noi that 1','275 phong cach scandinavian tinh te trong thiet ke noi that 1','/2017/12/06/275-phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-1.jpg','thumbs/275-phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-1-150x150.jpg',1512531202,'',224431,'local',NULL,'2017-12-06 10:33:22','2017-12-06 10:33:22'),(107,'jpg','414 thiet ke noi that phong khach biet thu sang trong 1','414 thiet ke noi that phong khach biet thu sang trong 1','/2017/12/06/414-thiet-ke-noi-that-phong-khach-biet-thu-sang-trong-1.jpg','thumbs/414-thiet-ke-noi-that-phong-khach-biet-thu-sang-trong-1-150x150.jpg',1512531297,'',222566,'local',NULL,'2017-12-06 10:34:57','2017-12-06 10:34:57'),(108,'jpg','784 thiet ke noi that phong cach co dien 6','784 thiet ke noi that phong cach co dien 6','/2017/12/06/784-thiet-ke-noi-that-phong-cach-co-dien-6.jpg','thumbs/784-thiet-ke-noi-that-phong-cach-co-dien-6-150x150.jpg',1512531395,'',274715,'local',NULL,'2017-12-06 10:36:35','2017-12-06 10:36:35'),(109,'jpg','708 1494509108 sep 1575arna','708 1494509108 sep 1575arna','/2017/12/06/708-1494509108-sep-1575arna.jpg','thumbs/708-1494509108-sep-1575arna-150x150.jpg',1512532467,'',63912,'local',NULL,'2017-12-06 10:54:27','2017-12-06 10:54:27'),(110,'jpg','114 k s ch ayako shirai 2','114 k s ch ayako shirai 2','/2017/12/06/114-k-s-ch-ayako-shirai-2.jpg','thumbs/114-k-s-ch-ayako-shirai-2-150x150.jpg',1512532486,'',2684,'local',NULL,'2017-12-06 10:54:46','2017-12-06 10:54:46'),(111,'jpg','563 k s ch ayako shirai 3','563 k s ch ayako shirai 3','/2017/12/06/563-k-s-ch-ayako-shirai-3.jpg','thumbs/563-k-s-ch-ayako-shirai-3-150x150.jpg',1512532486,'',2345,'local',NULL,'2017-12-06 10:54:46','2017-12-06 10:54:46'),(112,'jpg','500 k s ch ayako shirai 4','500 k s ch ayako shirai 4','/2017/12/06/500-k-s-ch-ayako-shirai-4.jpg','thumbs/500-k-s-ch-ayako-shirai-4-150x150.jpg',1512532486,'',2423,'local',NULL,'2017-12-06 10:54:46','2017-12-06 10:54:46'),(113,'jpg','505 k s ch ayako shirai 6','505 k s ch ayako shirai 6','/2017/12/06/505-k-s-ch-ayako-shirai-6.jpg','thumbs/505-k-s-ch-ayako-shirai-6-150x150.jpg',1512532486,'',2164,'local',NULL,'2017-12-06 10:54:46','2017-12-06 10:54:46'),(114,'jpg','251 k s ch ayako shirai 7','251 k s ch ayako shirai 7','/2017/12/06/251-k-s-ch-ayako-shirai-7.jpg','thumbs/251-k-s-ch-ayako-shirai-7-150x150.jpg',1512532486,'',2857,'local',NULL,'2017-12-06 10:54:47','2017-12-06 10:54:47'),(222,'jpg','647 img01 2','647 img01 2','/2018/03/01/647-img01-2.jpg','thumbs/647-img01-2-150x150.jpg',1519873256,'',73367,'local',0,'2018-03-01 10:00:56','2018-03-01 10:00:56'),(118,'jpg','446 img01 2','446 img01 2','/2017/12/06/446-img01-2.jpg','thumbs/446-img01-2-150x150.jpg',1512532932,'',73367,'local',NULL,'2017-12-06 11:02:12','2017-12-06 11:02:12'),(123,'png','991 k trang tr harris','991 k trang tr harris','/2017/12/06/991-k-trang-tr-harris.png','thumbs/991-k-trang-tr-harris-150x150.png',1512533177,'',6944,'local',NULL,'2017-12-06 11:06:17','2017-12-06 11:06:17'),(122,'png','503 k trang tr harris 2','503 k trang tr harris 2','/2017/12/06/503-k-trang-tr-harris-2.png','thumbs/503-k-trang-tr-harris-2-150x150.png',1512533161,'',8456,'local',NULL,'2017-12-06 11:06:01','2017-12-06 11:06:01'),(124,'png','466 k trang tr harris 1','466 k trang tr harris 1','/2017/12/06/466-k-trang-tr-harris-1.png','thumbs/466-k-trang-tr-harris-1-150x150.png',1512533178,'',469424,'local',NULL,'2017-12-06 11:06:18','2017-12-06 11:06:18'),(125,'jpg','841 tu tivi toshihiro 1','841 tu tivi toshihiro 1','/2017/12/06/841-tu-tivi-toshihiro-1.jpg','thumbs/841-tu-tivi-toshihiro-1-150x150.jpg',1512533328,'',41905,'local',NULL,'2017-12-06 11:08:48','2017-12-06 11:08:48'),(126,'jpg','489 tu tivi toshihiro','489 tu tivi toshihiro','/2017/12/06/489-tu-tivi-toshihiro.jpg','thumbs/489-tu-tivi-toshihiro-150x150.jpg',1512533328,'',184570,'local',NULL,'2017-12-06 11:08:48','2017-12-06 11:08:48'),(127,'jpg','951 ninshu','951 ninshu','/2017/12/06/951-ninshu.jpg','thumbs/951-ninshu-150x150.jpg',1512533597,'',71072,'local',NULL,'2017-12-06 11:13:17','2017-12-06 11:13:17'),(129,'png','703 984 picture13434275381130','703 984 picture13434275381130','/2017/12/12/703-984-picture13434275381130.png','thumbs/703-984-picture13434275381130-150x150.png',1513045149,'',14208,'local',NULL,'2017-12-12 09:19:09','2017-12-12 09:19:09'),(130,'jpg','416 tuyet chieu gia tang thoi gian su dung cho do go noi that 1','416 tuyet chieu gia tang thoi gian su dung cho do go noi that 1','/2017/12/21/416-tuyet-chieu-gia-tang-thoi-gian-su-dung-cho-do-go-noi-that-1.jpg','thumbs/416-tuyet-chieu-gia-tang-thoi-gian-su-dung-cho-do-go-noi-that-1-150x150.jpg',1513830726,'',61069,'local',NULL,'2017-12-21 11:32:06','2017-12-21 11:32:06'),(131,'jpeg','427 20120314 115147 1 bao quan do go noi that','427 20120314 115147 1 bao quan do go noi that','/2017/12/21/427-20120314-115147-1-bao-quan-do-go-noi-that.jpeg','thumbs/427-20120314-115147-1-bao-quan-do-go-noi-that-150x150.jpeg',1513830787,'',49687,'local',NULL,'2017-12-21 11:33:07','2017-12-21 11:33:07'),(132,'png','811 coco logo','811 coco logo','/2018/01/23/811-coco-logo.png','thumbs/811-coco-logo-150x150.png',1516695875,'',14950,'local',NULL,'2018-01-23 15:24:35','2018-01-23 15:24:35'),(133,'jpg','919 slider 2','919 slider 2','/2018/02/27/919-slider-2.jpg','thumbs/919-slider-2-150x150.jpg',1519725953,'',257054,'local',0,'2018-02-27 17:05:53','2018-02-27 17:05:53'),(134,'jpg','194 thietke noithat 1','194 thietke noithat 1','/2018/02/27/194-thietke-noithat-1.jpg','thumbs/194-thietke-noithat-1-150x150.jpg',1519725998,'',279279,'local',0,'2018-02-27 17:06:38','2018-02-27 17:06:38'),(135,'jpg','700 slider31','700 slider31','/2018/02/27/700-slider31.jpg','thumbs/700-slider31-150x150.jpg',1519726050,'',361085,'local',0,'2018-02-27 17:07:30','2018-02-27 17:07:30'),(136,'jpg','829 k gi y d p kiyoshi nh shirai','829 k gi y d p kiyoshi nh shirai','/2018/02/28/829-k-gi-y-d-p-kiyoshi-nh-shirai.jpg','thumbs/829-k-gi-y-d-p-kiyoshi-nh-shirai-150x150.jpg',1519781445,'',81390,'local',0,'2018-02-28 08:30:45','2018-02-28 08:30:45'),(189,'jpg','688 lum s2 h1061 6','688 lum s2 h1061 6','/2018/02/28/688-lum-s2-h1061-6.jpg','thumbs/688-lum-s2-h1061-6-150x150.jpg',1519802051,'',47138,'local',0,'2018-02-28 14:14:11','2018-02-28 14:14:11'),(188,'jpg','928 lum s2 h1061 3','928 lum s2 h1061 3','/2018/02/28/928-lum-s2-h1061-3.jpg','thumbs/928-lum-s2-h1061-3-150x150.jpg',1519802026,'',47962,'local',0,'2018-02-28 14:13:46','2018-02-28 14:13:46'),(187,'jpg','417 k gi y d p kiyoshi nh shirai 8','417 k gi y d p kiyoshi nh shirai 8','/2018/02/28/417-k-gi-y-d-p-kiyoshi-nh-shirai-8.jpg','thumbs/417-k-gi-y-d-p-kiyoshi-nh-shirai-8-150x150.jpg',1519801918,'',152298,'local',0,'2018-02-28 14:11:58','2018-02-28 14:11:58'),(186,'jpg','708 k gi y d p kiyoshi nh shirai 3','708 k gi y d p kiyoshi nh shirai 3','/2018/02/28/708-k-gi-y-d-p-kiyoshi-nh-shirai-3.jpg','thumbs/708-k-gi-y-d-p-kiyoshi-nh-shirai-3-150x150.jpg',1519801903,'',184310,'local',0,'2018-02-28 14:11:43','2018-02-28 14:11:43'),(185,'jpg','681 k gi y d p kiyoshi nh shirai 2','681 k gi y d p kiyoshi nh shirai 2','/2018/02/28/681-k-gi-y-d-p-kiyoshi-nh-shirai-2.jpg','thumbs/681-k-gi-y-d-p-kiyoshi-nh-shirai-2-150x150.jpg',1519801889,'',152259,'local',0,'2018-02-28 14:11:29','2018-02-28 14:11:29'),(184,'jpg','315 k gi y d p kiyoshi nh shirai 7','315 k gi y d p kiyoshi nh shirai 7','/2018/02/28/315-k-gi-y-d-p-kiyoshi-nh-shirai-7.jpg','thumbs/315-k-gi-y-d-p-kiyoshi-nh-shirai-7-150x150.jpg',1519801875,'',204052,'local',0,'2018-02-28 14:11:15','2018-02-28 14:11:15'),(183,'jpg','308 k gi y d p kiyoshi nh shirai 4','308 k gi y d p kiyoshi nh shirai 4','/2018/02/28/308-k-gi-y-d-p-kiyoshi-nh-shirai-4.jpg','thumbs/308-k-gi-y-d-p-kiyoshi-nh-shirai-4-150x150.jpg',1519801856,'',154612,'local',0,'2018-02-28 14:10:56','2018-02-28 14:10:56'),(182,'jpg','651 k gi y d p kiyoshi nh shirai','651 k gi y d p kiyoshi nh shirai','/2018/02/28/651-k-gi-y-d-p-kiyoshi-nh-shirai.jpg','thumbs/651-k-gi-y-d-p-kiyoshi-nh-shirai-150x150.jpg',1519801830,'',81390,'local',0,'2018-02-28 14:10:30','2018-02-28 14:10:30'),(181,'jpg','551 k gi y d p kiyoshi nh shirai 6','551 k gi y d p kiyoshi nh shirai 6','/2018/02/28/551-k-gi-y-d-p-kiyoshi-nh-shirai-6.jpg','thumbs/551-k-gi-y-d-p-kiyoshi-nh-shirai-6-150x150.jpg',1519801814,'',296766,'local',0,'2018-02-28 14:10:14','2018-02-28 14:10:14'),(180,'jpg','370 k gi y d p kiyoshi nh shirai 9','370 k gi y d p kiyoshi nh shirai 9','/2018/02/28/370-k-gi-y-d-p-kiyoshi-nh-shirai-9.jpg','thumbs/370-k-gi-y-d-p-kiyoshi-nh-shirai-9-150x150.jpg',1519801783,'',134067,'local',0,'2018-02-28 14:09:43','2018-02-28 14:09:43'),(179,'jpg','654 k gi y d p kiyoshi nh shirai 5','654 k gi y d p kiyoshi nh shirai 5','/2018/02/28/654-k-gi-y-d-p-kiyoshi-nh-shirai-5.jpg','thumbs/654-k-gi-y-d-p-kiyoshi-nh-shirai-5-150x150.jpg',1519801744,'',232497,'local',0,'2018-02-28 14:09:04','2018-02-28 14:09:04'),(178,'jpg','709 k gi y d p kiyoshi nh shirai','709 k gi y d p kiyoshi nh shirai','/2018/02/28/709-k-gi-y-d-p-kiyoshi-nh-shirai.jpg','thumbs/709-k-gi-y-d-p-kiyoshi-nh-shirai-150x150.jpg',1519801703,'',81390,'local',0,'2018-02-28 14:08:23','2018-02-28 14:08:23'),(177,'jpg','669 marvin','669 marvin','/2018/02/28/669-marvin.jpg','thumbs/669-marvin-150x150.jpg',1519801262,'',52885,'local',0,'2018-02-28 14:01:02','2018-02-28 14:01:02'),(176,'jpg','521 marvin 3','521 marvin 3','/2018/02/28/521-marvin-3.jpg','thumbs/521-marvin-3-150x150.jpg',1519801227,'',57110,'local',0,'2018-02-28 14:00:27','2018-02-28 14:00:27'),(175,'jpg','101 marvin 1','101 marvin 1','/2018/02/28/101-marvin-1.jpg','thumbs/101-marvin-1-150x150.jpg',1519801216,'',61816,'local',0,'2018-02-28 14:00:16','2018-02-28 14:00:16'),(174,'jpg','981 marvin 4','981 marvin 4','/2018/02/28/981-marvin-4.jpg','thumbs/981-marvin-4-150x150.jpg',1519801207,'',78766,'local',0,'2018-02-28 14:00:07','2018-02-28 14:00:07'),(173,'jpg','891 mitssy ban marvin','891 mitssy ban marvin','/2018/02/28/891-mitssy-ban-marvin.jpg','thumbs/891-mitssy-ban-marvin-150x150.jpg',1519801196,'',170199,'local',0,'2018-02-28 13:59:56','2018-02-28 13:59:56'),(172,'jpg','633 marvin 2 1','633 marvin 2 1','/2018/02/28/633-marvin-2-1.jpg','thumbs/633-marvin-2-1-150x150.jpg',1519801151,'',42685,'local',0,'2018-02-28 13:59:11','2018-02-28 13:59:11'),(171,'jpg','880 randy 1','880 randy 1','/2018/02/28/880-randy-1.jpg','thumbs/880-randy-1-150x150.jpg',1519801088,'',77751,'local',0,'2018-02-28 13:58:08','2018-02-28 13:58:08'),(170,'jpg','699 randy','699 randy','/2018/02/28/699-randy.jpg','thumbs/699-randy-150x150.jpg',1519801074,'',54595,'local',0,'2018-02-28 13:57:54','2018-02-28 13:57:54'),(169,'png','54 randy','54 randy','/2018/02/28/54-randy.png','thumbs/54-randy-150x150.png',1519801012,'',562544,'local',0,'2018-02-28 13:56:52','2018-02-28 13:56:52'),(168,'jpg','695 1475849504 150x150','695 1475849504 150x150','/2018/02/28/695-1475849504-150x150.jpg','thumbs/695-1475849504-150x150-150x150.jpg',1519800779,'',4033,'local',0,'2018-02-28 13:52:59','2018-02-28 13:52:59'),(167,'jpg','16 21687742 1857647367898480 6108368590558190388 n 650x650','16 21687742 1857647367898480 6108368590558190388 n 650x650','/2018/02/28/16-21687742-1857647367898480-6108368590558190388-n-650x650.jpg','thumbs/16-21687742-1857647367898480-6108368590558190388-n-650x650-150x150.jpg',1519800689,'',129840,'local',0,'2018-02-28 13:51:29','2018-02-28 13:51:29'),(190,'jpg','293 lum s2 h1061 11','293 lum s2 h1061 11','/2018/02/28/293-lum-s2-h1061-11.jpg','thumbs/293-lum-s2-h1061-11-150x150.jpg',1519802062,'',93619,'local',0,'2018-02-28 14:14:22','2018-02-28 14:14:22'),(191,'jpg','763 lum s2 h1061 5','763 lum s2 h1061 5','/2018/02/28/763-lum-s2-h1061-5.jpg','thumbs/763-lum-s2-h1061-5-150x150.jpg',1519802075,'',37843,'local',0,'2018-02-28 14:14:35','2018-02-28 14:14:35'),(192,'jpg','699 lum s2 h1061 4','699 lum s2 h1061 4','/2018/02/28/699-lum-s2-h1061-4.jpg','thumbs/699-lum-s2-h1061-4-150x150.jpg',1519802087,'',46402,'local',0,'2018-02-28 14:14:47','2018-02-28 14:14:47'),(193,'jpg','980 lum s2 h1061 7','980 lum s2 h1061 7','/2018/02/28/980-lum-s2-h1061-7.jpg','thumbs/980-lum-s2-h1061-7-150x150.jpg',1519802100,'',48154,'local',0,'2018-02-28 14:15:00','2018-02-28 14:15:00'),(194,'jpg','62 lum s2 h1061 1','62 lum s2 h1061 1','/2018/02/28/62-lum-s2-h1061-1.jpg','thumbs/62-lum-s2-h1061-1-150x150.jpg',1519802116,'',40520,'local',0,'2018-02-28 14:15:16','2018-02-28 14:15:16'),(195,'jpg','573 lum s2 h1061 9','573 lum s2 h1061 9','/2018/02/28/573-lum-s2-h1061-9.jpg','thumbs/573-lum-s2-h1061-9-150x150.jpg',1519802138,'',81777,'local',0,'2018-02-28 14:15:38','2018-02-28 14:15:38'),(196,'jpg','457 lum s2 h1061 12','457 lum s2 h1061 12','/2018/02/28/457-lum-s2-h1061-12.jpg','thumbs/457-lum-s2-h1061-12-150x150.jpg',1519802153,'',172565,'local',0,'2018-02-28 14:15:53','2018-02-28 14:15:53'),(197,'jpg','83 lum s2 h1061 10','83 lum s2 h1061 10','/2018/02/28/83-lum-s2-h1061-10.jpg','thumbs/83-lum-s2-h1061-10-150x150.jpg',1519802171,'',88147,'local',0,'2018-02-28 14:16:11','2018-02-28 14:16:11'),(198,'jpg','903 lum s2 h1061 8','903 lum s2 h1061 8','/2018/02/28/903-lum-s2-h1061-8.jpg','thumbs/903-lum-s2-h1061-8-150x150.jpg',1519802183,'',69244,'local',0,'2018-02-28 14:16:23','2018-02-28 14:16:23'),(199,'jpg','975 lum s2 h1061 2','975 lum s2 h1061 2','/2018/02/28/975-lum-s2-h1061-2.jpg','thumbs/975-lum-s2-h1061-2-150x150.jpg',1519802194,'',92667,'local',0,'2018-02-28 14:16:34','2018-02-28 14:16:34'),(201,'jpg','278 lix 4052 1','278 lix 4052 1','/2018/02/28/278-lix-4052-1.jpg','thumbs/278-lix-4052-1-150x150.jpg',1519803809,'',58308,'local',0,'2018-02-28 14:43:29','2018-02-28 14:43:29'),(202,'jpg','873 lix 4052 2','873 lix 4052 2','/2018/02/28/873-lix-4052-2.jpg','thumbs/873-lix-4052-2-150x150.jpg',1519803824,'',68104,'local',0,'2018-02-28 14:43:44','2018-02-28 14:43:44'),(203,'jpg','702 lix 4052 3','702 lix 4052 3','/2018/02/28/702-lix-4052-3.jpg','thumbs/702-lix-4052-3-150x150.jpg',1519803837,'',61986,'local',0,'2018-02-28 14:43:57','2018-02-28 14:43:57'),(204,'jpg','15 lix 4052 5','15 lix 4052 5','/2018/02/28/15-lix-4052-5.jpg','thumbs/15-lix-4052-5-150x150.jpg',1519803853,'',108442,'local',0,'2018-02-28 14:44:13','2018-02-28 14:44:13'),(205,'jpg','782 ac cd003','782 ac cd003','/2018/02/28/782-ac-cd003.jpg','thumbs/782-ac-cd003-150x150.jpg',1519804214,'',50037,'local',0,'2018-02-28 14:50:14','2018-02-28 14:50:14'),(206,'jpg','799 ac cd003 1','799 ac cd003 1','/2018/02/28/799-ac-cd003-1.jpg','thumbs/799-ac-cd003-1-150x150.jpg',1519804226,'',50565,'local',0,'2018-02-28 14:50:26','2018-02-28 14:50:26'),(207,'jpg','328 ac cd003 2','328 ac cd003 2','/2018/02/28/328-ac-cd003-2.jpg','thumbs/328-ac-cd003-2-150x150.jpg',1519804239,'',51668,'local',0,'2018-02-28 14:50:39','2018-02-28 14:50:39'),(208,'jpg','179 ac cd003 3','179 ac cd003 3','/2018/02/28/179-ac-cd003-3.jpg','thumbs/179-ac-cd003-3-150x150.jpg',1519804250,'',49133,'local',0,'2018-02-28 14:50:50','2018-02-28 14:50:50'),(209,'jpg','977 ac cd003 4','977 ac cd003 4','/2018/02/28/977-ac-cd003-4.jpg','thumbs/977-ac-cd003-4-150x150.jpg',1519804261,'',39469,'local',0,'2018-02-28 14:51:01','2018-02-28 14:51:01'),(210,'jpg','286 thiet ke noi that vinhomes thang long anh linh 1','286 thiet ke noi that vinhomes thang long anh linh 1','/2018/02/28/286-thiet-ke-noi-that-vinhomes-thang-long-anh-linh-1.jpg','thumbs/286-thiet-ke-noi-that-vinhomes-thang-long-anh-linh-1-150x150.jpg',1519804887,'',209329,'local',0,'2018-02-28 15:01:27','2018-02-28 15:01:27'),(211,'jpg','49 img 8175 1','49 img 8175 1','/2018/02/28/49-img-8175-1.jpg','thumbs/49-img-8175-1-150x150.jpg',1519805439,'',121730,'local',0,'2018-02-28 15:10:39','2018-02-28 15:10:39'),(212,'png','882 untitled 1 1 2','882 untitled 1 1 2','/2018/02/28/882-untitled-1-1-2.png','thumbs/882-untitled-1-1-2-150x150.png',1519805453,'',534321,'local',0,'2018-02-28 15:10:53','2018-02-28 15:10:53'),(213,'png','868 png sp2b2 1','868 png sp2b2 1','/2018/02/28/868-png-sp2b2-1.png','thumbs/868-png-sp2b2-1-150x150.png',1519805467,'',592021,'local',0,'2018-02-28 15:11:07','2018-02-28 15:11:07'),(214,'jpg','698 logodesign for medical 500x500','698 logodesign for medical 500x500','/2018/02/28/698-logodesign-for-medical-500x500.jpg','thumbs/698-logodesign-for-medical-500x500-150x150.jpg',1519811393,'',25544,'local',0,'2018-02-28 16:49:53','2018-02-28 16:49:53'),(215,'jpg','31 ghe luoi cao cap gl318 48761 zoom','31 ghe luoi cao cap gl318 48761 zoom','/2018/03/01/31-ghe-luoi-cao-cap-gl318-48761-zoom.jpg','thumbs/31-ghe-luoi-cao-cap-gl318-48761-zoom-150x150.jpg',1519867543,'',22234,'local',0,'2018-03-01 08:25:43','2018-03-01 08:25:43'),(216,'jpg','533 photo 5 1505456177619','533 photo 5 1505456177619','/2018/03/01/533-photo-5-1505456177619.jpg','thumbs/533-photo-5-1505456177619-150x150.jpg',1519869201,'',102281,'local',0,'2018-03-01 08:53:21','2018-03-01 08:53:21'),(217,'jpg','645 photo 3 1509441583279','645 photo 3 1509441583279','/2018/03/01/645-photo-3-1509441583279.jpg','thumbs/645-photo-3-1509441583279-150x150.jpg',1519869597,'',99171,'local',0,'2018-03-01 08:59:57','2018-03-01 08:59:57'),(218,'jpg','983 photo 1 1509528908242','983 photo 1 1509528908242','/2018/03/01/983-photo-1-1509528908242.jpg','thumbs/983-photo-1-1509528908242-150x150.jpg',1519870025,'',99988,'local',0,'2018-03-01 09:07:05','2018-03-01 09:07:05'),(219,'jpg','767 thiet ke noi that phong cach phap pho bien 1','767 thiet ke noi that phong cach phap pho bien 1','/2018/03/01/767-thiet-ke-noi-that-phong-cach-phap-pho-bien-1.jpg','thumbs/767-thiet-ke-noi-that-phong-cach-phap-pho-bien-1-150x150.jpg',1519870611,'',271169,'local',0,'2018-03-01 09:16:51','2018-03-01 09:16:51'),(220,'jpg','275 small living room decorating ideas with sectional foyer basement industrial expansive wall coverings home builders home services','275 small living room decorating ideas with sectional foyer basement industrial expansive wall coverings home builders home services','/2018/03/01/275-small-living-room-decorating-ideas-with-sectional-foyer-basement-industrial-expansive-wall-coverings-home-builders-home-services.jpg','thumbs/275-small-living-room-decorating-ideas-with-sectional-foyer-basement-industrial-expansive-wall-coverings-home-builders-home-services-150x150.jpg',1519871037,'',288839,'local',0,'2018-03-01 09:23:57','2018-03-01 09:23:57'),(221,'jpg','443 thiet ke noi that phong cach co dien 6','443 thiet ke noi that phong cach co dien 6','/2018/03/01/443-thiet-ke-noi-that-phong-cach-co-dien-6.jpg','thumbs/443-thiet-ke-noi-that-phong-cach-co-dien-6-150x150.jpg',1519871189,'',274715,'local',0,'2018-03-01 09:26:29','2018-03-01 09:26:29'),(270,'jpg','thi?p t?t','thi?p t?t','/2018/03/21/65-27720938-1353989201414121-1579204782-n.jpg','',1521623982,'',186591,'ftp',NULL,'2018-03-21 16:19:42','2018-04-12 15:10:01'),(271,'jpg','944 218 giuong ngu 1a','944 218 giuong ngu 1a','/2018/05/18/944-218-giuong-ngu-1a.jpg','',1526644431,'',57584,'ftp',0,'2018-05-18 18:53:51','2018-05-18 18:53:51'),(277,'png','images 2','images 2','/images-2.png','',1529381754,'',7138,'ftp',0,'2018-06-19 11:15:54','2018-06-19 11:15:54');
/*!40000 ALTER TABLE `wb_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_media_folders`
--

DROP TABLE IF EXISTS `wb_media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_media_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_media_folders`
--

LOCK TABLES `wb_media_folders` WRITE;
/*!40000 ALTER TABLE `wb_media_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_menu`
--

DROP TABLE IF EXISTS `wb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_menu`
--

LOCK TABLES `wb_menu` WRITE;
/*!40000 ALTER TABLE `wb_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_menu_item`
--

DROP TABLE IF EXISTS `wb_menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_menu_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `taxonomy` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'nav_menu, direct_link, category, page, post, product',
  `taxonomy_item` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taxonomy_id` int(11) DEFAULT NULL,
  `link` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `is_new_tab` tinyint(4) DEFAULT '0',
  `menu_id` int(11) DEFAULT '0',
  `sort_order` int(11) DEFAULT '0',
  `is_published` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_menu_item`
--

LOCK TABLES `wb_menu_item` WRITE;
/*!40000 ALTER TABLE `wb_menu_item` DISABLE KEYS */;
INSERT INTO `wb_menu_item` VALUES (2,0,'page',NULL,53,'',0,0,0,1,'2017-11-27 08:53:49','2018-03-07 04:25:54'),(3,0,'page',NULL,55,'',0,0,1,1,'2017-11-27 08:53:49','2018-03-07 04:25:54'),(6,0,'category','post',5,'',0,0,6,1,'2017-12-07 01:32:10','2018-03-07 04:25:54'),(7,0,'category','product',1,'',0,0,2,1,'2017-12-07 01:32:13','2018-03-07 04:25:54'),(12,7,'category','product',8,'',0,0,4,1,'2018-01-02 14:10:21','2018-03-07 04:25:54'),(13,7,'category','product',9,'',0,0,3,1,'2018-01-02 14:10:22','2018-03-07 04:25:54'),(19,7,'category','product',13,'',0,0,5,1,'2018-02-28 07:47:22','2018-03-07 04:25:54'),(47,0,'page','',54,'',0,0,9,1,'2018-03-06 07:46:23','2018-03-07 04:25:54'),(48,0,'page','',62,'',1,0,7,1,'2018-03-06 07:46:24','2018-03-07 04:25:54');
/*!40000 ALTER TABLE `wb_menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_menu_item_description`
--

DROP TABLE IF EXISTS `wb_menu_item_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_menu_item_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_item_id` int(11) NOT NULL,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `menu_id` (`menu_item_id`,`lang_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_menu_item_description`
--

LOCK TABLES `wb_menu_item_description` WRITE;
/*!40000 ALTER TABLE `wb_menu_item_description` DISABLE KEYS */;
INSERT INTO `wb_menu_item_description` VALUES (2,2,'vi','Trang chủ'),(3,3,'vi','Về chúng tôi'),(6,6,'vi','Tin nội thất '),(7,7,'vi','Sản phẩm'),(12,12,'vi','Phòng Khách'),(13,13,'vi','Kệ Tủ Sách'),(19,19,'vi','Bàn Ghế'),(47,47,'vi','Liên hệ'),(48,48,'vi','Quà tặng');
/*!40000 ALTER TABLE `wb_menu_item_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_migrations`
--

DROP TABLE IF EXISTS `wb_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_migrations`
--

LOCK TABLES `wb_migrations` WRITE;
/*!40000 ALTER TABLE `wb_migrations` DISABLE KEYS */;
INSERT INTO `wb_migrations` VALUES (3,'2017_07_25_033043_insert_core_db',1),(4,'2017_08_08_103806_add_id_seo',2),(5,'2017_08_30_134800_order_table_update',3),(6,'2017_08_31_104129_create_sessions_table',4),(12,'2017_09_08_161404_create_table_contact',5),(13,'2017_09_25_043631_create_province',5),(14,'2017_10_17_134212_menu_item',6),(15,'2017_10_17_134843_create_menu',7);
/*!40000 ALTER TABLE `wb_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_option`
--

DROP TABLE IF EXISTS `wb_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'color, text',
  `thumb` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  `is_published` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_option`
--

LOCK TABLES `wb_option` WRITE;
/*!40000 ALTER TABLE `wb_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_option_description`
--

DROP TABLE IF EXISTS `wb_option_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_option_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_code` (`lang_code`,`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_option_description`
--

LOCK TABLES `wb_option_description` WRITE;
/*!40000 ALTER TABLE `wb_option_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_option_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_order`
--

DROP TABLE IF EXISTS `wb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `address` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `district` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `note` text COLLATE utf8_unicode_ci,
  `coupon` text COLLATE utf8_unicode_ci,
  `payment_id` int(11) DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `payment_status` tinyint(1) NOT NULL DEFAULT '0',
  `payment_note` text COLLATE utf8_unicode_ci,
  `shipping_method` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `shipping_fee` double DEFAULT '0',
  `shipping_note` text COLLATE utf8_unicode_ci,
  `total` double NOT NULL DEFAULT '0',
  `currency` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `lang_code` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_send_mail` tinyint(1) DEFAULT '0',
  `admin_note` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_order`
--

LOCK TABLES `wb_order` WRITE;
/*!40000 ALTER TABLE `wb_order` DISABLE KEYS */;
INSERT INTO `wb_order` VALUES (1,'#1525399945909',167,'Nguyen Minh Tan','1212313','home, home','Quận 1','TP. Hồ Chí Minh','thanhnm.dev@gmail.com','',NULL,1,'Thanh toán tại cửa hàng',0,'{\"order_id\":\"1\"}','',10000,NULL,9166000,'VND','vi',1,1,NULL,'2018-05-04 02:12:25','2018-05-04 02:12:32'),(2,'#1526637856834',168,'Nguyen Minh Tan','123123','home, home','Quận 1','TP. Hồ Chí Minh','thanhnm.dev@gmail.com','',NULL,1,'Thanh toán tại cửa hàng',0,'{\"order_id\":\"2\"}','',10000,NULL,2000000,'VND','vi',1,0,NULL,'2018-05-18 10:04:16','2018-05-18 10:04:16'),(3,'#1526642691984',169,'Nguyen Minh Tan','123','home, home','Huyện Tân Biên','Tây Ninh','thanhnm.dev@gmail.com','',NULL,1,'Thanh toán tại cửa hàng',0,'{\"order_id\":\"3\"}','',0,NULL,3870000,'VND','vi',1,0,NULL,'2018-05-18 11:24:51','2018-05-18 11:24:51'),(4,'#1526644117734',170,'Nguyen Minh Tan','112','home, home','Thành phố Tây Ninh','Tây Ninh','thanhnm.dev@gmail.com','',NULL,1,'Thanh toán tại cửa hàng',0,'{\"order_id\":\"4\"}','',0,NULL,2000000,'VND','vi',1,0,NULL,'2018-05-18 11:48:37','2018-05-18 11:48:37'),(5,'#1526644291535',171,'Nguyen Minh Tan','1231','home, home','Huyện Châu Thành','Tây Ninh','thanhnm.dev@gmail.com','',NULL,1,'Thanh toán tại cửa hàng',0,'{\"order_id\":\"5\"}','',0,NULL,32500000,'VND','vi',1,1,NULL,'2018-05-18 11:51:31','2018-05-18 11:51:41');
/*!40000 ALTER TABLE `wb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_order_product`
--

DROP TABLE IF EXISTS `wb_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `product_option` text COLLATE utf8_unicode_ci,
  `price` double DEFAULT '0',
  `original_price` double DEFAULT '0',
  `quantity` int(11) DEFAULT '0',
  `subtotal` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_order_product`
--

LOCK TABLES `wb_order_product` WRITE;
/*!40000 ALTER TABLE `wb_order_product` DISABLE KEYS */;
INSERT INTO `wb_order_product` VALUES (1,1,211,'KỆ SÁCH AYAKO - SHIRAI','[]',4583000,4583000,2,9166000),(2,2,225,'KỆ SÁCH CHỮ X CHAKALUKA','[]',2000000,2000000,1,2000000),(3,3,215,'KỆ GIÀY DÉP KIYOSHI, NHỎ - SHIRAI','[]',3870000,3870000,1,3870000),(4,4,225,'KỆ SÁCH CHỮ X CHAKALUKA','[]',2000000,2000000,1,2000000),(5,5,207,'PHÒNG KHÁCH PORTSMOUTH','[]',32500000,32500000,1,32500000);
/*!40000 ALTER TABLE `wb_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_page`
--

DROP TABLE IF EXISTS `wb_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `layout` varchar(20) COLLATE utf8_unicode_ci DEFAULT '1',
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `is_published` tinyint(1) DEFAULT '1',
  `published_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_page`
--

LOCK TABLES `wb_page` WRITE;
/*!40000 ALTER TABLE `wb_page` DISABLE KEYS */;
INSERT INTO `wb_page` VALUES (28,'post','default',NULL,NULL,1,'2017-09-29 00:00:00','2017-09-29 10:55:55','2017-09-29 10:55:55'),(32,'post','default',NULL,NULL,1,'2017-10-02 00:00:00','2017-10-02 09:27:33','2017-10-02 09:27:33'),(33,'contact','default',NULL,NULL,1,'2017-10-02 00:00:00','2017-10-02 09:30:19','2017-10-02 09:30:19'),(34,'post','default',NULL,NULL,1,'2017-10-02 00:00:00','2017-10-02 09:31:49','2017-10-02 09:31:49'),(35,'post','default',NULL,NULL,1,'2017-10-03 00:00:00','2017-10-03 08:34:31','2017-10-03 08:36:28'),(36,'post','default',NULL,NULL,1,'2017-10-06 00:00:00','2017-10-06 17:00:14','2017-10-06 17:00:14'),(40,'contact','salepage',NULL,NULL,1,'2017-10-20 00:00:00','2017-10-20 09:22:56','2017-10-20 09:22:56'),(41,'contact','default',NULL,NULL,1,'2017-10-20 05:00:00','2017-10-20 11:54:38','2017-10-20 11:58:18'),(53,'homepage','default','2018/03/02/335-1.jpg',NULL,0,'2018-03-04 22:47:28','2017-11-09 09:27:37','2018-03-04 22:47:28'),(54,'contact','default','',NULL,0,'2017-11-22 10:25:27','2017-11-09 09:33:41','2017-11-22 10:25:28'),(55,'post','default','',NULL,0,'2017-12-04 16:37:50','2017-11-22 14:35:24','2017-12-04 16:37:50'),(56,'post','default','',NULL,0,NULL,'2017-12-21 11:28:13','2017-12-21 11:28:13'),(57,'post','salepage','2018/03/01/328-article-1481598439-170.jpg',NULL,0,'2018-03-06 11:47:49','2018-03-01 11:19:45','2018-03-06 11:47:49'),(58,'post','default','2018/03/01/748-1437538022-doi-tra-hang-hoa.jpg',NULL,0,NULL,'2018-03-01 11:37:22','2018-03-01 11:37:22'),(59,'post','default','',NULL,0,NULL,'2018-03-01 16:07:11','2018-03-01 16:07:11'),(60,'post','salepage','2018/03/01/328-article-1481598439-170.jpg',NULL,0,'2018-03-06 11:47:02','2018-03-01 16:27:13','2018-03-06 11:47:02'),(62,'post','salepage','2018/03/01/838-23954075-alt01.jpg',NULL,0,'2018-03-06 14:46:16','2018-03-06 14:45:47','2018-03-06 14:46:16'),(95,'post','default','/2018/05/18/944-218-giuong-ngu-1a.jpg',NULL,0,'2018-06-15 16:45:15','2018-03-08 10:09:27','2018-06-15 16:45:15');
/*!40000 ALTER TABLE `wb_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_page_description`
--

DROP TABLE IF EXISTS `wb_page_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_page_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `title` varbinary(255) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `lang_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `lang_code` (`lang_code`,`page_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_page_description`
--

LOCK TABLES `wb_page_description` WRITE;
/*!40000 ALTER TABLE `wb_page_description` DISABLE KEYS */;
INSERT INTO `wb_page_description` VALUES (53,53,'Trang chủ','Căn hộ với hàng loạt nội thất hàng hiệu sẽ là nơi dừng chân của mọi người.','','vi'),(54,54,'Liên hệ','liên hệ chúng tôi','','vi'),(55,55,'Giới thiệu','Giới thiệu','<h3 style=\"text-align: center;\"><strong>VỀ CHÚNG TÔI</strong></h3>\r\n\r\n<p style=\"text-align: justify;\">Chúng tôi tin rằng mọi người đều có tổ ấm của riêng mình, một nơi để cảm nhận chính mình. Một ngôi nhà phù hợp với cá tính của bạn và gia đình, tạo ra một không gian dễ chịu và thoải mái. Một nơi tách biệt với thế giới bên ngoài, một nơi để thể hiện cá tính và sở thích của chủ nhân ngôi nhà. Sự ấm áp sẽ lan tỏa đến mọi người, dù khả năng kinh tế như thế nào. Đó là lý do tại sao chúng tôi muốn giúp bạn \"Biến ngôi nhà thành tổ ấm\".</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"UMA Vision\" src=\"https://uma.vn/skin/frontend/uma/default/images/cms/about-us/vision.jpg\" /></p>\r\n\r\n<h4 style=\"text-align: center;\"><strong>TẦM NHÌN</strong></h4>\r\n\r\n<p style=\"text-align: justify;\">Tầm nhìn của chúng tôi được hoàn thiện khi mỗi gia đình trên đất nước Việt Nam đều có ít nhất một sản phẩm nội thất.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"UMA Mission\" src=\"https://uma.vn/skin/frontend/uma/default/images/cms/about-us/mission.jpg\" /></p>\r\n\r\n<h4 style=\"text-align: center;\"><strong>SỨ MỆNH</strong></h4>\r\n\r\n<p style=\"text-align: justify;\">Sứ mệnh của chúng tôi&nbsp;là cung cấp các sản phẩm nội thất có thiết kế và công năng phù hợp đi kèm với giá cả phải chăng.</p>\r\n\r\n<p style=\"text-align: justify;\">Chúng tôi cũng cung cấp dịch vụ tư vấn thiết kế nội thất và vận chuyển sản phẩm đến từng gia đình Việt Nam thông qua các dịch vụ vận chuyển đa dạng.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"UMA Value\" src=\"https://uma.vn/skin/frontend/uma/default/images/cms/about-us/value.jpg\" /></p>\r\n\r\n<h4 style=\"text-align: center;\"><strong>GIÁ TRỊ CỐT LÕI</strong></h4>\r\n\r\n<p style=\"text-align: justify;\">Chúng tôi&nbsp;luôn trân trọng khách hàng và không ngừng cải tiến để mang đến những gì bạn cần. Có thể nói rằng, UMA chúng tôi là một đại gia đình và mỗi khi đón nhận một khách hàng, chúng tôi như có thêm thành viên mới.</p>\r\n','vi'),(56,56,'Hướng Dẫn ','Hướng Dẫn ','<p style=\"text-align: center;\"><span style=\"font-size:14px;\">Sản phẩm tr&ecirc;n website&nbsp;&nbsp;l&agrave; những sản phẩm chụp thật tại STUDIO của ch&uacute;ng t&ocirc;i&nbsp;&nbsp;v&agrave; sản phẩm tham khảo.&nbsp;</span></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/uploads/2017/12/21/416-tuyet-chieu-gia-tang-thoi-gian-su-dung-cho-do-go-noi-that-1.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px;\"></span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px;\">Để biết th&ocirc;ng tin chi tiết hơn về sản phẩm tr&ecirc;n website v&agrave; đặt h&agrave;ng:</span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px;\"><b>-&nbsp; Li&ecirc;n hệ với ch&uacute;ng t&ocirc;i để được tư vấn đặt h&agrave;ng: </b><strong>1900 636 040</strong><br />\r\n<b>-&nbsp; Li&ecirc;n hệ để nhận được tư vấn về kỹ thuật: </b><strong>1900 636 040</strong></span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px;\"></span></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/uploads/2017/12/21/427-20120314-115147-1-bao-quan-do-go-noi-that.jpeg\" /></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px;\"></span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"font-size:14px;\">Những sản phẩm đ&atilde; ho&agrave;n thiện sẽ được vận chuyển đến nh&agrave; kh&aacute;ch h&agrave;ng n&ecirc;n hầu hết kh&ocirc;ng c&oacute; sẵn. Để xem trực tiếp c&aacute;c sản phẩm của SOFIA mời qu&yacute; kh&aacute;ch đến Nh&agrave; xưởng&nbsp;hoặc Show room của ch&uacute;ng t&ocirc;i.</span></p>\r\n','vi'),(57,57,'CHÍNH SÁCH GIAO HÀNG','CHÍNH SÁCH GIAO HÀNG\r\n','<h3 style=\"text-align: justify;\">T&iacute;nh ph&iacute; giao h&agrave;ng như thế n&agrave;o?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Ph&iacute; giao h&agrave;ng được t&iacute;nh dựa tr&ecirc;n khối lượng/ thể t&iacute;ch của sản phẩm v&agrave; được &aacute;p dụng t&ugrave;y theo khu vực với mức ph&iacute; kh&aacute;c nhau.&nbsp;<br />\r\nHỗ trợ 100% ph&iacute; vận chuyển đối với đơn h&agrave;ng ở TP. Hồ Ch&iacute; Minh (Trừ c&aacute;c khu vực: q.12, q. H&oacute;c M&ocirc;n, huyện Củ Chi, Cần Giờ, B&igrave;nh Ch&aacute;nh, q. 9, q. Thủ Đức)</p>\r\n\r\n<h3 style=\"text-align: justify;\">Khi n&agrave;o t&ocirc;i nhận được sản phẩm?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p style=\"text-align: justify;\">Sau khi qu&yacute; kh&aacute;ch đ&atilde; đặt h&agrave;ng th&agrave;nh c&ocirc;ng, cửa h&agrave;ng&nbsp;sẽ gọi điện thoại cho qu&yacute; kh&aacute;ch x&aacute;c nhận đơn h&agrave;ng. Khi đơn h&agrave;ng được xuất kho sẽ được giao đến qu&yacute; kh&aacute;ch trong khoảng thời gian sau đ&acirc;y</p>\r\n\r\n<p style=\"text-align: justify;\">Thời gian giao h&agrave;ng&nbsp;</p>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: center; padding: 10px;\">Địa chỉ giao h&agrave;ng</th>\r\n			<th style=\"text-align: center; padding: 10px;\">H&agrave;ng c&oacute; sẵn</th>\r\n			<th style=\"text-align: center; padding: 10px;\">H&agrave;ng đặt</th>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: justify; padding: 2px;\">Hồ Ch&iacute; Minh</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">3 - 4 ng&agrave;y l&agrave;m việc</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">12 - 16 ng&agrave;y l&agrave;m việc</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: justify; padding: 2px;\">H&agrave; Nội</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">7 - 10 ng&agrave;y l&agrave;m việc</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">23 - 25 ng&agrave;y l&agrave;m việc</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: justify; padding: 2px;\">Khu vực kh&aacute;c</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Thời gian dự kiến t&ugrave;y từng địa phương</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Thời gian dự kiến t&ugrave;y từng địa phương</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3 style=\"text-align: justify;\">L&agrave;m sao để t&ocirc;i biết được ch&iacute;nh x&aacute;c khi n&agrave;o t&ocirc;i nhận được h&agrave;ng?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Trước khi giao h&agrave;ng, cửa h&agrave;ng&nbsp;sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch để hẹn ng&agrave;y v&agrave; thời gian giao h&agrave;ng.</p>\r\n\r\n<h3 style=\"text-align: justify;\">T&ocirc;i cần sản phẩm gấp, bắt buộc phải giao trong ng&agrave;y c&oacute; được kh&ocirc;ng?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Thời gian giao h&agrave;ng t&ugrave;y thuộc v&agrave;o sản phẩm đặt h&agrave;ng v&agrave; lịch giao h&agrave;ng của c&ocirc;ng ty. Mọi y&ecirc;u cầu cần xử l&yacute; gấp, xin vui l&ograve;ng gọi số Hotline 028-668-46460. Cửa h&agrave;ng sẽ hồi đ&aacute;p những kiến nghị của kh&aacute;ch h&agrave;ng trong giờ h&agrave;nh ch&iacute;nh.</p>\r\n\r\n<h3 style=\"text-align: justify;\">C&oacute; giao h&agrave;ng v&agrave;o chủ nhật hoặc ng&agrave;y lễ kh&ocirc;ng?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Cửa h&agrave;ng lu&ocirc;n hỗ trợ qu&yacute; kh&aacute;ch để sản phẩm được giao nhanh nhất. Tuy nhi&ecirc;n, cửa h&agrave;ng sẽ t&iacute;nh th&ecirc;m ph&iacute; đối với những đơn h&agrave;ng giao sau 18:00 hoặc giao v&agrave;o Chủ nhật hoặc ng&agrave;y lễ tết&nbsp;<br />\r\n10% gi&aacute; trị đơn h&agrave;ng: đối với đơn h&agrave;ng dưới 4.000.000đ&nbsp;<br />\r\n5% gi&aacute; trị đơn h&agrave;ng: đối với đơn h&agrave;ng tr&ecirc;n 4.000.000đ</p>\r\n\r\n<h3 style=\"text-align: justify;\">Giao h&agrave;ng đến l&uacute;c t&ocirc;i đi vắng th&igrave; l&agrave;m thế n&agrave;o?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Qu&yacute; kh&aacute;ch c&oacute; thể nhờ người kh&aacute;c nhận h&agrave;ng gi&uacute;p, tuy nhi&ecirc;n cửa h&agrave;ng sẽ cần một thư ủy quyền với chữ k&yacute; x&aacute;c nhận của qu&yacute; kh&aacute;ch, trong đ&oacute; n&ecirc;u r&otilde; về người được ủy quyền nhận đơn h&agrave;ng.&nbsp;<br />\r\nNgười được ủy quyền sẽ c&oacute; tr&aacute;ch kiểm tra v&agrave; k&iacute; v&agrave;o đơn h&agrave;ng x&aacute;c nhận sản phẩm ở trong điều kiện tốt, trong trường hợp người ủy quyền kh&ocirc;ng h&agrave;i l&ograve;ng về sản phẩm h&atilde;y ghi ch&uacute; v&agrave;o đơn h&agrave;ng v&agrave; th&ocirc;ng b&aacute;o cho cửa h&agrave;ng.</p>\r\n\r\n<h3 style=\"text-align: justify;\">C&oacute; khu vực n&agrave;o kh&ocirc;ng giao h&agrave;ng đến kh&ocirc;ng?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Cửa h&agrave;ng c&oacute; thể giao h&agrave;ng đến hầu hết c&aacute;c tỉnh th&agrave;nh v&agrave; khu vực trong nước.&nbsp;<br />\r\nNgo&agrave;i c&aacute;c ch&agrave;nh xe giao h&agrave;ng uy t&iacute;n, cửa h&agrave;ng c&ograve;n li&ecirc;n kết với c&aacute;c nh&agrave; vận chuyển lớn kh&aacute;c như Hỏa Xa, Bưu điện Việt Nam, Giao H&agrave;ng Nhanh, v&agrave; Viettel post để đảm bảo h&agrave;ng h&oacute;a lu&ocirc;n được lưu th&ocirc;ng nhanh ch&oacute;ng v&agrave; đảm bảo.&nbsp;<br />\r\nNgo&agrave;i ra, qu&yacute; kh&aacute;ch cũng c&oacute; thể đề xuất với cửa h&agrave;ng ch&agrave;nh xe giao h&agrave;ng quen thuộc để cửa h&agrave;ng đảm bảo hỗ trợ tốt nhất.</p>\r\n\r\n<h3 style=\"text-align: justify;\">T&ocirc;i c&oacute; thể xem hoặc mua trực tiếp tại cửa h&agrave;ng&nbsp;kh&ocirc;ng?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Hiện tại, ch&uacute;ng t&ocirc;i&nbsp;chỉ trưng b&agrave;y sản phẩm mới tại Showroom. Tất cả c&aacute;c sản phẩm kh&aacute;c đều ở kho v&agrave; xưởng sản xuất, qu&yacute; kh&aacute;ch vui l&ograve;ng chọn sản phẩm tr&ecirc;n Website, hoặc đến văn ph&ograve;ng để xem chất lượng chung v&agrave; được tư vấn kỹ hơn về sản phẩm.&nbsp;</p>\r\n\r\n<h3 style=\"text-align: justify;\">L&agrave;m thế n&agrave;o để đăng k&yacute; dịch vụ lắp đặt?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Dịch vụ lắp đặt sẽ mặc định được cho v&agrave;o giỏ h&agrave;ng của qu&yacute; kh&aacute;ch khi đặt h&agrave;ng c&aacute;c sản phẩm đang được hỗ trợ lắp đặt như: Tranh, kệ s&aacute;ch, tủ s&aacute;ch, tủ tivi.&nbsp;<br />\r\nTrong trường hợp qu&yacute; kh&aacute;ch kh&ocirc;ng muốn sử dụng dịch vụ lắp đặt, c&oacute; thể li&ecirc;n hệ trực tiếp tới cửa h&agrave;ng&nbsp;qua số Hotline: 028 - 668 - 46460. Mitssy sẽ hồi đ&aacute;p những kiến nghị của kh&aacute;ch h&agrave;ng trong giờ h&agrave;nh ch&iacute;nh.</p>\r\n\r\n<h3 style=\"text-align: justify;\">Thu ph&iacute; lắp đặt như thế n&agrave;o?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<table border=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<th style=\"text-align: center; padding: 10px;\">STT</th>\r\n			<th style=\"text-align: center; padding: 10px;\">Sản phẩm</th>\r\n			<th style=\"text-align: center; padding: 10px;\">Gi&aacute;</th>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; padding: 2px;\">1</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Tranh Canvas/ Tranh PP</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">50,0000vnđ/ sản phẩm</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; padding: 2px;\">2</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Kệ s&aacute;ch</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">50,0000vnđ/ sản phẩm</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; padding: 2px;\">3</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Giường</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Miễn ph&iacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; padding: 2px;\">4</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Tủ quần &aacute;o</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Miễn ph&iacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; padding: 2px;\">5</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Sản phẩm thuộc d&ograve;ng h&agrave;ng Shirai - nhập khẩu Nhật Bản</td>\r\n			<td style=\"text-align: justify; padding: 2px;\">Miễn ph&iacute;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3 style=\"text-align: justify;\">Sản phẩm lắp đặt rồi c&oacute; c&ograve;n được đổi trả kh&ocirc;ng?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Ch&uacute;ng t&ocirc;i&nbsp;vẫn sẽ hỗ trợ đổi trả b&igrave;nh thường theo ch&iacute;nh s&aacute;ch nếu sản phẩm ph&aacute;t sinh lỗi kỹ thuật.</p>\r\n\r\n<h3 style=\"text-align: justify;\">Chất lượng lắp đặt kh&ocirc;ng tốt th&igrave; sao?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Qu&yacute; kh&aacute;ch vui l&ograve;ng kiểm tra chất lượng thi c&ocirc;ng trước khi k&yacute; x&aacute;c nhận ho&agrave;n tất dịch vụ. Tuy nhi&ecirc;n, nếu việc lắp đặt ảnh hưởng đến chất lượng sản phẩm, Qu&yacute; kh&aacute;ch vui l&ograve;ng li&ecirc;n hệ&nbsp;qua số Hotline: 028 - 668 - 46460 để được hỗ trợ cụ thể. Ch&uacute;ng t&ocirc;i&nbsp;sẽ hồi đ&aacute;p những kiến nghị của kh&aacute;ch h&agrave;ng trong giờ h&agrave;nh ch&iacute;nh.</p>\r\n\r\n<h3 style=\"text-align: justify;\">T&ocirc;i đ&atilde; chọn lắp đặt, nhưng sau khi nhận h&agrave;ng kh&ocirc;ng cần lắp đặt nữa, t&ocirc;i c&oacute; được ho&agrave;n ph&iacute; lắp đặt kh&ocirc;ng?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Rất tiếc sẽ kh&ocirc;ng hỗ trợ việc ho&agrave;n ph&iacute; khi đơn h&agrave;ng đ&atilde; được giao th&agrave;nh c&ocirc;ng.</p>\r\n\r\n<h3 style=\"text-align: justify;\">Ch&iacute;nh s&aacute;ch đồng kiểm l&agrave; g&igrave;?<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h3>\r\n\r\n<p data-group=\"content_expand\" style=\"text-align: justify;\">Trước khi chấp nhận v&agrave; thanh to&aacute;n cho một đơn h&agrave;ng, qu&yacute; kh&aacute;ch c&oacute; quyền y&ecirc;u cầu kiểm tra sản phẩm c&oacute; đ&uacute;ng với th&ocirc;ng tin đặt h&agrave;ng hay kh&ocirc;ng. Bao gồm: số lượng, chủng loại, m&agrave;u sắc, h&igrave;nh thức, t&iacute;nh nguy&ecirc;n vẹn của h&agrave;ng h&oacute;a.&nbsp;<br />\r\nKhi đ&atilde; kiểm tra sản phẩm xong, qu&yacute; kh&aacute;ch vui l&ograve;ng k&iacute; v&agrave;o đơn h&agrave;ng x&aacute;c nhận sản phẩm ở trong điều kiện tốt. Trong trường hợp qu&yacute; kh&aacute;ch kh&ocirc;ng h&agrave;i l&ograve;ng về sản phẩm h&atilde;y ghi ch&uacute; v&agrave;o đơn h&agrave;ng v&agrave; th&ocirc;ng b&aacute;o cho cửa h&agrave;ng.</p>\r\n','vi'),(58,58,'CHÍNH SÁCH ĐỔI TRẢ','CHÍNH SÁCH ĐỔI TRẢ\r\n\r\n','<h2 style=\"text-align: justify;\">I. Kiểm tra điều kiện đổi trả sản phẩm<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h2>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Ch&uacute;ng t&ocirc;i rất tự h&agrave;o về chất lượng nội thất của cửa h&agrave;ng. Tuy nhi&ecirc;n, trong qu&aacute; tr&igrave;nh nhận h&agrave;ng nếu gặp phải bất k&igrave; l&yacute; do g&igrave; do lỗi trong qu&aacute; tr&igrave;nh sản xuất, hoặc sản phẩm gặp sự cố trong qu&aacute; tr&igrave;nh vận chuyển, ch&uacute;ng t&ocirc;i đảm bảo sẽ tiến h&agrave;nh thực hiện c&aacute;c biện ph&aacute;p khắc phục lỗi (kể cả đổi trả h&agrave;ng) cho đến khi qu&yacute; kh&aacute;ch thực sự h&agrave;i l&ograve;ng.</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Qu&yacute; kh&aacute;ch vui l&ograve;ng chắc chắn rằng sản phẩm đổi/ trả thỏa m&atilde;n y&ecirc;u cầu của cửa h&agrave;ng.</p>\r\n\r\n<table border=\"1\" style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"2\" style=\"text-align: center;\"><strong><span style=\"font-size:16px;\">SẢN PHẨM KH&Ocirc;NG &Aacute;P DỤNG ĐỔI TRẢ</span></strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\"><strong>STT</strong>&nbsp;</td>\r\n			<td style=\"text-align: center;\">&nbsp;<strong>Sản phẩm</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">&nbsp;1</td>\r\n			<td style=\"text-align: justify;\">&nbsp;Sản phẩm thuộc danh mục đồ&nbsp;trang tr&iacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">&nbsp;2</td>\r\n			<td style=\"text-align: justify;\">&nbsp;Sản phẩm đặt l&agrave;m theo y&ecirc;u cầu</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">&nbsp;3</td>\r\n			<td style=\"text-align: justify;\">&nbsp;Sản phẩm giảm gi&aacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">&nbsp;4</td>\r\n			<td style=\"text-align: justify;\">&nbsp;Sản phẩm trong chương tr&igrave;nh khuyến m&atilde;i</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">&nbsp;5</td>\r\n			<td style=\"text-align: justify;\">&nbsp;Sản phẩm đ&atilde; qua sử dụng</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<ol>\r\n	<li style=\"text-align: justify;\">\r\n	<h3>Qu&yacute; kh&aacute;ch lưu &yacute;:</h3>\r\n	</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Cửa h&agrave;ng&nbsp;kh&ocirc;ng nhận đổi trả với đơn h&agrave;ng li&ecirc;n quan đến m&agrave;u sắc v&agrave; k&iacute;ch thước sản phẩm. Do m&agrave;u sắc sản phẩm c&oacute; thể ch&ecirc;nh lệch t&ugrave;y thuộc m&agrave;n h&igrave;nh, k&iacute;ch thước sản phẩm đ&atilde; được ghi ch&iacute;nh x&aacute;c tr&ecirc;n Website n&ecirc;n những kiến nghị xuất ph&aacute;t chủ quan từ ph&iacute;a kh&aacute;ch h&agrave;ng sẽ kh&ocirc;ng được ch&uacute;ng t&ocirc;i&nbsp;giải quyết.</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Nếu nhận được sản phẩm thiếu so với đơn h&agrave;ng đ&atilde; đặt, hoặc sản phẩm bị hư hại do qu&aacute; tr&igrave;nh vận chuyển, qu&yacute; kh&aacute;ch vui l&ograve;ng phản hồi lại cho cửa h&agrave;ng&nbsp;trong v&ograve;ng 48 giờ kể từ l&uacute;c đơn h&agrave;ng giao tới.</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Trường hợp, qu&aacute; thời hạn 48 giờ hoặc qu&yacute; kh&aacute;ch đ&atilde; kiểm tra v&agrave; k&yacute; v&agrave;o bi&ecirc;n bản đồng kiểm* giữa b&ecirc;n vận chuyển v&agrave; qu&yacute; kh&aacute;ch, ch&uacute;ng t&ocirc;i&nbsp;sẽ kh&ocirc;ng xử l&yacute; khiếu nại trong mọi điều kiện.</p>\r\n\r\n<p style=\"text-align: justify;\">* Bi&ecirc;n bản đồng kiểm: Khi nhận h&agrave;ng ch&uacute;ng t&ocirc;i y&ecirc;u cầu qu&yacute; kh&aacute;ch kiểm tra v&agrave; k&iacute; v&agrave;o đơn h&agrave;ng x&aacute;c nhận sản phẩm ở trong điều kiện tốt, trong trường hợp qu&yacute; kh&aacute;ch kh&ocirc;ng h&agrave;i l&ograve;ng về sản phẩm h&atilde;y ghi ch&uacute; v&agrave;o đơn h&agrave;ng v&agrave; th&ocirc;ng b&aacute;o cho cửa h&agrave;ng.</p>\r\n\r\n<h2 style=\"text-align: justify;\">II. C&aacute;c bước thực hiện đổi - trả sản phẩm<i data-group=\"policy_expand\" data-status=\"1\">&nbsp;</i></h2>\r\n\r\n<h3 style=\"text-align: justify;\"><b>Bước 1: Cung cấp th&ocirc;ng tin</b>&nbsp;</h3>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Cung cấp th&ocirc;ng tin chi tiết về lỗi sản phẩm về thư điện tử&nbsp;support@imgroup.vn</p>\r\n\r\n<h2 dir=\"ltr\" style=\"text-align: justify;\">GỬI Y&Ecirc;U CẦU</h2>\r\n\r\n<div class=\"form-group\"><label>M&atilde; số đơn h&agrave;ng *</label> <input class=\"form-control\" name=\"code\" required=\"\" type=\"text\" /></div>\r\n\r\n<div class=\"form-group\"><label>T&ecirc;n sản phẩm</label> <input class=\"form-control\" name=\"nameProduct\" required=\"\" type=\"text\" /></div>\r\n\r\n<div class=\"form-group\"><label>Lỗi sản phẩm</label> <input class=\"form-control\" name=\"error\" required=\"\" type=\"text\" /></div>\r\n\r\n<div class=\"form-group\"><label>Tập tin đ&iacute;nh k&egrave;m</label> <input class=\"form-control\" name=\"fileErr\" required=\"\" type=\"file\" /></div>\r\n\r\n<div class=\"form-group\"><label>Nhu cầu cần hỗ trợ (đổi/trả/bảo h&agrave;nh)</label> <input class=\"form-control\" name=\"note\" required=\"\" type=\"text\" /></div>\r\n\r\n<div class=\"form-group\"><button class=\"button button-info\">Gửi th&ocirc;ng tin</button></div>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">C&ocirc;ng ty&nbsp;sẽ trả lời y&ecirc;u cầu qu&yacute; kh&aacute;ch trong v&ograve;ng 24 tiếng. Mọi y&ecirc;u cầu cần xử l&yacute; gấp, xin vui l&ograve;ng gọi số Hotline 1900 636 040. Ch&uacute;ng t&ocirc;i&nbsp;sẽ hồi đ&aacute;p những kiến nghị của kh&aacute;ch h&agrave;ng trong giờ h&agrave;nh ch&iacute;nh.</p>\r\n\r\n<h3 style=\"text-align: justify;\"><b>Bước 2: Gửi sản phẩm</b></h3>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Đối với khu vực tp. Hồ Ch&iacute; Minh, cửa h&agrave;ng&nbsp;sẽ nhận sản phẩm đổi trả tại nh&agrave; kh&aacute;ch h&agrave;ng. Đối với tỉnh th&agrave;nh kh&aacute;c, qu&yacute; kh&aacute;ch sẽ đ&oacute;ng g&oacute;i v&agrave; mang sản phẩm đến Bưu Điện gửi về <strong>C&ocirc;ng ty Cổ Phần Đầu tư v&agrave; Ph&aacute;t triển IM&nbsp;</strong>theo địa chỉ: Số 18, đường Trần Thiện Ch&aacute;nh, P12, Quận 10, TPHCM.</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Lưu &yacute;: Q&uacute;y kh&aacute;ch phải chịu tr&aacute;ch nhiệm về trạng th&aacute;i nguy&ecirc;n vẹn của sản phẩm khi gửi về ch&uacute;ng t&ocirc;i.</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Sau khi nhận được sản phẩm qu&yacute; kh&aacute;ch gửi về, ch&uacute;ng t&ocirc;i&nbsp;sẽ phản hồi qu&yacute; kh&aacute;ch qua e-mail.</p>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Nếu c&oacute; bất k&igrave; vấn đề g&igrave; ph&aacute;t sinh, qu&yacute; kh&aacute;ch c&oacute; thể li&ecirc;n hệ với IM group qua số Hotline:1900 636 040. Mitssy sẽ hồi đ&aacute;p những kiến nghị của kh&aacute;ch h&agrave;ng trong giờ h&agrave;nh ch&iacute;nh.</p>\r\n\r\n<h3 style=\"text-align: justify;\"><b>Bước 3: Nhận sản phẩm đổi/ trả</b></h3>\r\n\r\n<p dir=\"ltr\" style=\"text-align: justify;\">Ch&uacute;ng t&ocirc;i&nbsp;sẽ gửi sản phẩm được đổi đến tận nh&agrave; kh&aacute;ch h&agrave;ng.</p>\r\n','vi'),(59,59,'HƯỚNG DẪN THANH TOÁN','HƯỚNG DẪN THANH TOÁN','<p style=\"text-align: justify;\">Phương thức thanh to&aacute;n khi mua h&agrave;ng online.&nbsp;<br />\r\nNhằm mang đến qu&yacute; kh&aacute;ch những trải nghiệm mua sắm trực tuyến tuyệt vời nhất, tại Insulac, ch&uacute;ng t&ocirc;i đưa ra nhiều phương thức thanh to&aacute;n để qu&yacute; kh&aacute;ch dễ d&agrave;ng lựa chọn:</p>\r\n\r\n<ul>\r\n	<li style=\"text-align: justify;\">Thanh to&aacute;n khi nhận h&agrave;ng (COD)</li>\r\n	<li style=\"text-align: justify;\">Thanh to&aacute;n qua thẻ t&iacute;n dụng/thẻ ghi nợ/thẻ ATM nội địa</li>\r\n</ul>\r\n\r\n<p style=\"text-align: justify;\"><strong>Thanh to&aacute;n tiền mặt khi bạn nhận được h&agrave;ng COD (Cash On Delivery)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">L&agrave; c&aacute;ch thanh to&aacute;n dễ d&agrave;ng nhất, đặc biệt l&agrave; khi bạn kh&ocirc;ng quen với c&aacute;c h&igrave;nh thức thanh to&aacute;n trực tuyến.<br />\r\n<br />\r\nTrong qu&aacute; tr&igrave;nh đặt h&agrave;ng h&atilde;y th&ocirc;ng b&aacute;o cho ch&uacute;ng t&ocirc;i biết phương thức thanh to&aacute;n m&agrave; bạn chọn l&agrave; Thanh To&aacute;n Khi Nhận H&agrave;ng. Ngay sau khi nhận được đơn đặt h&agrave;ng, cửa h&agrave;ng&nbsp;sẽ x&aacute;c nhận với bạn qua điện thoại v&agrave; tiến h&agrave;nh thực hiện đơn h&agrave;ng, giao h&agrave;ng cho bạn trong thời gian quy định. Ch&uacute;ng t&ocirc;i cũng sẽ thường xuy&ecirc;n cập nhật trạng th&aacute;i đơn h&agrave;ng của bạn th&ocirc;ng qua điện thoại, hoặc tin nhắn SMS.</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Thanh to&aacute;n bằng h&igrave;nh thức chuyển khoản của ng&acirc;n h&agrave;ng/cổng th&ocirc;ng tin trực tuyến:</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Để tr&aacute;nh t&igrave;nh trạng sai s&oacute;t v&agrave; thất lạc tiền của qu&yacute; kh&aacute;ch. Khi chuyển khoản tiền mua h&agrave;ng qu&yacute; kh&aacute;ch vui l&ograve;ng điền th&ecirc;m nội dung chuyển khoản như sau:</p>\r\n\r\n<ul>\r\n	<li style=\"text-align: justify;\">Họ t&ecirc;n - Số đơn h&agrave;ng - Địa chỉ</li>\r\n	<li style=\"text-align: justify;\">Khi việc x&aacute;c nhận thanh to&aacute;n đ&atilde; ho&agrave;n tất, ch&uacute;ng t&ocirc;i&nbsp;sẽ tiến h&agrave;nh thực hiện xử l&yacute; đơn h&agrave;ng v&agrave; giao h&agrave;ng cho bạn trong thời gian quy định.</li>\r\n</ul>\r\n\r\n<p style=\"text-align: justify;\">Cửa h&agrave;ng&nbsp;cũng sẽ thường xuy&ecirc;n cập nhật trạng th&aacute;i đơn h&agrave;ng của bạn th&ocirc;ng qua điện thoại, email hoặc tin nhắn SMS.</p>\r\n','vi'),(60,60,'HƯỚNG DẪN MUA HÀNG','HƯỚNG DẪN MUA HÀNG','<p style=\"text-align: justify;\"><strong>I. HƯỚNG DẪN MUA H&Agrave;NG TRỰC TUYẾN TẠI WEBSITE </strong><a href=\"http://fruitshop2.webitop.com/\">http://fruitshop2.webitop.com/</a></p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Bước 1:</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Truy cập website&nbsp;tại địa chỉ&nbsp;<a data-mce-href=\"http://aristino.vn\" href=\"http://fruitshop2.webitop.com/\">http://fruitshop2.webitop.com/</a>. T&igrave;m kiếm tới danh mục v&agrave; sản phẩm cần mua (qua thanh t&igrave;m kiếm hoặc danh mục sản phẩm)</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" data-mce-src=\"//file.hstatic.net/1000199383/file/screenshot_1_1024x1024.png\" src=\"https://s.nimbus.everhelper.me/attachment/1515206/63r1iiofiqlxwd8ozu5w/973643-z4y3b8nkhl7UWNV0/screen.png\" /></p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Bước 2:</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Tại trang chi tiết sản phẩm, qu&yacute; kh&aacute;ch chọn size chọn m&agrave;u, số lượng v&agrave; bấm n&uacute;t Mua ngay nếu qu&yacute; kh&aacute;ch muốn thanh to&aacute;n lu&ocirc;n</p>\r\n\r\n<p style=\"text-align: justify;\">Tong trường hợp qu&yacute; kh&aacute;ch muốn mua tiếp chỉ cần th&ecirc;m v&agrave;o giỏ h&agrave;ng, v&agrave; lựa chọn c&aacute;c sản phẩm kh&aacute;c. Tại giỏ h&agrave;ng, qu&yacute; kh&aacute;ch c&oacute; thể xem lại danh s&aacute;ch c&aacute;c sản phẩm c&oacute; trong giỏ h&agrave;ng.</p>\r\n\r\n<p style=\"text-align: justify;\">Qu&yacute; kh&aacute;ch c&oacute; thể thay đổi số lượng sản phẩm hoặc x&oacute;a bỏ sản phẩm trong giỏ h&agrave;ng của m&igrave;nh.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" data-mce-src=\"//file.hstatic.net/1000199383/file/screenshot_2_1024x1024.png\" src=\"https://s.nimbus.everhelper.me/attachment/1515221/002i3zod1aicfz2kypwl/973643-QHynsR38508Vysxh/screen.png\" /></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Bước 3:</strong></p>\r\n\r\n<p style=\"text-align: justify;\">- Thực hiện thanh to&aacute;n đơn h&agrave;ng bằng c&aacute;ch nhập th&ocirc;ng tin thanh to&aacute;n -&gt;&nbsp;Phương thức thanh to&aacute;n</p>\r\n\r\n<p style=\"text-align: justify;\">-&nbsp;Nếu c&oacute; m&atilde; giảm gi&aacute; của chương tr&igrave;nh khuyến mại qu&yacute; kh&aacute;ch vui l&ograve;ng nhập v&agrave;o &ocirc;:&nbsp;&nbsp;M&atilde; giảm gi&aacute;&nbsp;v&agrave; sử dụng m&atilde; giảm gi&aacute; cho đơn h&agrave;ng</p>\r\n\r\n<p style=\"text-align: justify;\">- Chọn phương thức th&agrave;nh to&aacute;n</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" data-mce-src=\"//file.hstatic.net/1000199383/file/screenshot_4_1024x1024.png\" src=\"https://s.nimbus.everhelper.me/attachment/1515232/7rtu4u8zw1g7iz0fv93l/973643-SdsL8vQgWw8nMXWz/screen.png\" /></p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Bước 4:</strong></p>\r\n\r\n<p style=\"text-align: justify;\">click&nbsp;Đặt h&agrave;ng&nbsp;để ho&agrave;n tất qu&aacute; tr&igrave;nh mua h&agrave;ng tại website <a href=\"http://fruitshop2.webitop.com/\">http://fruitshop2.webitop.com/</a>. Click tiếp tục mua h&agrave;ng nếu muốn mua th&ecirc;m sản phẩm kh&aacute;c</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" data-mce-src=\"//file.hstatic.net/1000199383/file/screenshot_5_1024x1024.png\" src=\"https://s.nimbus.everhelper.me/attachment/1515373/gne8d04i4dzgmiqons1e/973643-SuHirhof1v8vvDKV/screen.png\" /></p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>II. Phương thức thanh to&aacute;n</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Để thuận tiện cho qu&yacute; kh&aacute;ch trong qu&aacute; tr&igrave;nh mua sắm, cửa h&agrave;ng&nbsp;thực hiện phương thức thanh to&aacute;n cụ thể như sau:</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Thanh to&aacute;n khi giao h&agrave;ng (COD)</strong></p>\r\n\r\n<p style=\"text-align: justify;\">COD (dịch vụ giao h&agrave;ng nhận tiền): Nh&acirc;n vi&ecirc;n vận chuyển thu tiền mặt khi giao h&agrave;ng cho kh&aacute;ch.</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Thanh to&aacute;n chuyển khoản</strong></p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Ng&acirc;n h&agrave;ng:</strong>&nbsp;TMCP Ngoại Thương Việt Nam (Vietcombank)<br />\r\n<strong>Số t&agrave;i khoản:</strong>&nbsp;0531000280056<br />\r\n<strong>Chủ t&agrave;i khoản:</strong>&nbsp;Nguyễn Minh Đức<br />\r\n<strong>Chi nh&aacute;nh:</strong>&nbsp;Ng&acirc;n h&agrave;ng B&igrave;nh Thạnh</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Ng&acirc;n h&agrave;ng:</strong>&nbsp;Ng&acirc;n h&agrave;ng &Aacute; Ch&acirc;u ACB<br />\r\n<strong>Số t&agrave;i khoản:&nbsp;</strong>132667059<br />\r\n<strong>Chủ t&agrave;i khoản:&nbsp;</strong>Nguyễn Minh Đức<br />\r\n<strong>Chi nh&aacute;nh:</strong>&nbsp;Ng&acirc;n h&agrave;ng H&agrave;ng Xanh</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>Ng&acirc;n h&agrave;ng:&nbsp;</strong>TMCP Ngoại Thương Việt Nam (Vietcombank)<br />\r\n<strong>Số t&agrave;i kho&agrave;n:</strong>&nbsp;0071000638187<br />\r\n<strong>Chủ t&agrave;i khoản:</strong>&nbsp;C&ocirc;ng ty Cổ Phần Đầu Tư V&agrave; Ph&aacute;t Triển IM<br />\r\n<strong>Chi nh&aacute;nh:</strong>&nbsp;TPHCM.</p>\r\n','vi'),(62,62,'Saleoage','','<p>From:&nbsp;Nguyễn Minh Đức &ndash;&nbsp;Chuy&ecirc;n gia Internet<img alt=\"\" src=\"http://www.imgroup.vn/images/head.png\" />To:&nbsp;Marketing</p>\r\n\r\n<p>RE:&nbsp;Gi&uacute;p t&ocirc;i giải quyết t&igrave;nh h&igrave;nh kinh doanh kh&oacute; khăn hiện nay !</p>\r\n\r\n<ul>\r\n	<li>\r\n	<h3>C&oacute; phải bạn đang gặp những vấn đề sau:</h3>\r\n	</li>\r\n	<li><strong>Muốn t&igrave;m c&aacute;ch b&aacute;n h&agrave;ng online nhưng kh&ocirc;ng biết phải l&agrave;m sao</strong></li>\r\n	<li>Cảm thấy kh&oacute; khăn v&igrave; rắc rối về kỹ thuật, kh&ocirc;ng biết bắt đầu tư đ&acirc;u</li>\r\n	<li><strong>Muốn bắt đầu kinh doanh m&agrave; kh&ocirc;ng cần nhiều vốn</strong></li>\r\n	<li>Muốn c&oacute; nguồn thu nhập thụ động</li>\r\n	<li><strong>Tạo một c&ocirc;ng việc kinh doanh ri&ecirc;ng cho bản th&acirc;n, an to&agrave;n, hiệu quả, đầu tư &iacute;t ?</strong></li>\r\n	<li><strong>Muốn t&igrave;m phương ph&aacute;p quảng b&aacute; sản phẩm đến nhiều kh&aacute;ch h&agrave;ng với chi ph&iacute; thấp nhất.</strong></li>\r\n	<li>\r\n	<h3>Hoặc bạn đang:</h3>\r\n	</li>\r\n	<li><strong>Tốn nhiều tiền l&agrave;m gian h&agrave;ng, đăng tin rao vặt m&agrave; kh&ocirc;ng ai mua h&agrave;ng!</strong></li>\r\n	<li>Website như hoang mạc, kh&ocirc;ng ai v&agrave;o xem</li>\r\n	<li><strong>Tốn tiền rất nhiều cho quảng c&aacute;o nhưng doanh số kh&ocirc;ng đạt y&ecirc;u cầu</strong></li>\r\n</ul>\r\n\r\n<p><strong>C&Acirc;U CHUYỆN TH&Agrave;NH C&Ocirc;NG CỦA BẠN T&Ocirc;I</strong></p>\r\n\r\n<p><strong><img alt=\"\" height=\"300\" src=\"http://www.imgroup.vn/kcfinder/upload/images/buttom-47%281%29.gif\" width=\"300\" /></strong></p>\r\n\r\n<p><img alt=\"\" src=\"http://www.imgroup.vn/kcfinder/upload/images/hoat-dong/hinh-khach-hang.png\" /></p>\r\n\r\n<p>KHỔNG PH&Uacute; ĐO&Agrave;N DUY</p>\r\n\r\n<p>&Ocirc;NG CHỦ KINH DOANH ĐỊA ỐC KIM QUANG</p>\r\n\r\n<p>C&acirc;u chuyện thực tế từ ch&iacute;nh bản th&acirc;n của m&igrave;nh từ sắp ph&aacute; sản trở th&agrave;nh 1 c&ocirc;ng ty c&oacute; tiếng trong ng&agrave;nh bất động sản</p>\r\n\r\n<p>T&ocirc;i đến với buổi hội thảo của IM Group tổ chức ng&agrave;y 14/12/2012 khi xung quanh t&ocirc;i mọi c&aacute;i gần như đ&atilde; sụp đổ, tất cả mọi người đều đ&atilde; quay lưng lại với t&ocirc;i, nh&acirc;n vi&ecirc;n, đối t&aacute;c v&agrave; kh&aacute;ch h&agrave;ng. T&ocirc;i kh&ocirc;ng biết phải cứu v&atilde;ng t&igrave;nh thế gần như l&agrave; ph&aacute; sản n&agrave;y như thế n&agrave;o ? Với t&ocirc;i l&uacute;c đ&oacute; c&oacute; rất nhiều hậu quả cần phải giải quyết đ&atilde; l&agrave;m t&ocirc;i phải rất khổ sở như nợ tiền nh&agrave;, nợ lương nh&acirc;n vi&ecirc;n, nợ bạn b&egrave; l&ecirc;n đến 520 triệu&hellip;T&agrave;i sản của t&ocirc;i l&uacute;c đ&oacute; kh&ocirc;ng c&ograve;n c&aacute;i g&igrave; c&oacute; thể b&aacute;n được, trong t&uacute;i chỉ c&ograve;n đ&uacute;ng 200 ngh&igrave;n đồng v&agrave; t&ocirc;i ho&agrave;n to&agrave;n bế tắc trước mọi chuyện. Tuy nhi&ecirc;n, suy nghĩ của t&ocirc;i l&uacute;c đ&oacute; rất đơn giản: Gia đ&igrave;nh t&ocirc;i rất ngh&egrave;o kh&oacute;, v&igrave; vậy t&ocirc;i kh&ocirc;ng thể thất bại được. T&ocirc;i tự nhủ bản th&acirc;n rằng, kh&ocirc;ng g&igrave; l&agrave; kh&ocirc;ng thể, nếu c&oacute; một tia hy vọng d&ugrave; l&agrave; rất nhỏ t&ocirc;i cũng sẽ tận dụng v&agrave; h&agrave;nh động để vực dậy.</p>\r\n\r\n<p>T&igrave;nh cờ t&ocirc;i biết đến buổi hội thảo về B&iacute; mật hệ thống kinh doanh online của IMGroup. Sau buổi hội thảo h&ocirc;m đ&oacute;, anh Nguyễn Minh Đức - diễn giả buổi hội thảo đ&atilde; đưa đến t&ocirc;i giải ph&aacute;p vực dậy con đường kinh doanh bằng onlnine. T&ocirc;i vui mừng khi nhận ra được tia hy vọng để vực dậy con đường kinh doanh của m&igrave;nh. Kh&oacute;a học c&oacute; học ph&iacute; l&agrave; 3 triệu đồng, t&ocirc;i đ&atilde; quyết định cầm 200 ngh&igrave;n c&ograve;n lại cuối c&ugrave;ng của m&igrave;nh để đặt cọc cho kh&oacute;a SEO Click sẽ tổ chức v&agrave;o 8 giờ s&aacute;ng ng&agrave;y 15/12/2012.</p>\r\n\r\n<p>V&agrave;o 23 giờ ng&agrave;y 14/12/2012 t&ocirc;i bắt đầu gọi điện thoại để mượn tiền học SEO Click v&agrave;o ng&agrave;y mai. T&ocirc;i đ&atilde; gọi cho 125 người bạn mới c&oacute; thể mượn đủ số tiền 2 triệu 700 ngh&igrave;n đ&oacute;ng học ph&iacute;. Th&agrave;nh quả sau một đ&ecirc;m vay mượn miệt m&agrave;i của t&ocirc;i l&agrave;: T&ocirc;i đ&atilde; đủ ti&ecirc;u chuẩn tham gia kh&oacute;a SEO Click của IM Group tổ chức ng&agrave;y 15/12/2012.</p>\r\n\r\n<p>H&ocirc;m nay ng&agrave;y 22 th&aacute;ng 01 năm 2014 t&ocirc;i ngồi tại c&ocirc;ng ty của m&igrave;nh v&agrave; viết về sự kỳ diệu của kh&oacute;a học SEO Click ng&agrave;y h&ocirc;m đ&oacute;.Rất cảm ơn anh Đức v&agrave; tất cả mọi người trong c&ocirc;ng ty IM Group. Sau hơn 1 năm thực h&agrave;nh kh&oacute;a học SEO Click, c&ocirc;ng việc kinh doanh tr&ecirc;n online của t&ocirc;i đ&atilde; ph&aacute;t triển rất mạnh, rất nhiều kh&aacute;ch h&agrave;ng c&oacute; nhu cầu đ&atilde; tự động t&igrave;m đến c&ocirc;ng ty của t&ocirc;i.</p>\r\n\r\n<p>Kết quả l&agrave; t&ocirc;i đ&atilde; trả được hết nợ, c&ocirc;ng ty t&ocirc;i từ kh&ocirc;ng c&ograve;n nh&acirc;n vi&ecirc;n n&agrave;o th&igrave; b&acirc;y giờ đ&atilde; l&ecirc;n đến hơn 17 nh&acirc;n vi&ecirc;n, t&ocirc;i th&agrave;nh lập được hệ thống 16 website v&agrave; một số dư kha kh&aacute; trong ng&acirc;n h&agrave;ng.</p>\r\n\r\n<p><a href=\"http://imgroup.edu.vn/kinh-doanh-online/dang-ky-web/\"><img alt=\"\" src=\"http://www.imgroup.vn/kcfinder/upload/images/dang-ky-ngay%281%29.gif\" /></a></p>\r\n\r\n<p><img alt=\"\" height=\"138\" src=\"http://www.imgroup.vn/images/b1.png\" width=\"663\" /></p>\r\n\r\n<ul>\r\n	<li><strong>Khởi nghiệp kinh doanh m&agrave; kh&ocirc;ng cần đầu tư nhiều tiền</strong></li>\r\n	<li><strong>Tiếp cận h&agrave;ng ng&agrave;n kh&aacute;ch h&agrave;ng mới mỗi th&aacute;ng với chi ph&iacute; thấp hơn 10 lần.</strong></li>\r\n	<li>Phục vụ kh&aacute;ch h&agrave;ng li&ecirc;n tục 24/7</li>\r\n	<li><strong>Tiết kiệm chi ph&iacute; về mặt bằng hơn 100 triệu/năm</strong></li>\r\n	<li>Tiết kiệm chi ph&iacute; về nh&acirc;n vi&ecirc;n tư vấn, nh&acirc;n vi&ecirc;n kinh doanh, nh&acirc;n vi&ecirc;n marketing.</li>\r\n	<li><strong>Chi ph&iacute; đầu tư marketing giảm nhưng doanh thu tăng gấp 10 lần.</strong></li>\r\n</ul>\r\n\r\n<p>&ldquo;T&Ocirc;I KH&Ocirc;NG BIẾT G&Igrave; VỀ KỸ THUẬT IT, L&Agrave;M SAO KINH DOANH TR&Ecirc;N INTERNET ĐƯỢC ? L&Agrave;M C&Aacute;CH N&Agrave;O KH&Aacute;CH H&Agrave;NG T&Igrave;M ĐẾN CỬA H&Agrave;NG ONLINE CỦA T&Ocirc;I ?&rdquo;</p>\r\n\r\n<p><img alt=\"\" height=\"55\" src=\"http://www.imgroup.vn/images/b2.png\" width=\"550\" /></p>\r\n\r\n<h3>Forum:</h3>\r\n\r\n<p>Tạo topic tr&ecirc;n forum v&agrave; bạn c&oacute; thể tận dụng được ngay lượng truy cập của c&aacute;c forum đ&oacute;. Tuy nhi&ecirc;n bạn cần phải chăm s&oacute;c li&ecirc;n tục topic của bạn, nếu kh&ocirc;ng n&oacute; sẽ &ldquo;tr&ocirc;i nhanh như vượt th&aacute;c&rdquo;.</p>\r\n\r\n<p><img alt=\"\" src=\"http://www.imgroup.vn/images/forum.png\" /></p>\r\n\r\n<h3>Social:</h3>\r\n\r\n<p>Đăng tin l&ecirc;n c&aacute;c trang mạng x&atilde; hội sẽ gi&uacute;p sản phẩm của bạn tiếp cận được h&agrave;ng ng&agrave;n th&agrave;nh vi&ecirc;n. Nội dung của bạn c&oacute; thể 1 đồn 100, 100 đồn ra 10.000 &hellip;. Nhưng th&ocirc;ng tin của bạn cũng sẽ tr&ocirc;i mất trong v&agrave;i ph&uacute;t, thậm ch&iacute; v&agrave;i gi&acirc;y.</p>\r\n\r\n<p><img alt=\"\" src=\"http://www.imgroup.vn/images/face.png\" /></p>\r\n\r\n<h3>Blog:</h3>\r\n\r\n<p>Tạo một blog ho&agrave;n to&agrave;n miễn ph&iacute; v&agrave; đưa th&ocirc;ng tin sản phẩm, dịch vụ của bạn l&ecirc;n blog để giới thiệu đến cộng đồng internet. Tuy nhi&ecirc;n, giao diện blog kh&ocirc;ng đẹp mắt, c&aacute;ch bố tr&iacute; cấu tr&uacute;c th&ocirc;ng tin kh&ocirc;ng chuy&ecirc;n nghiệp dễ l&agrave;m mất sự tin tưởng của kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p><img alt=\"\" src=\"http://www.imgroup.vn/images/blog.png\" /></p>\r\n\r\n<h3>X&acirc;y dựng website:</h3>\r\n\r\n<p>Website như 1 cửa h&agrave;ng online, nơi cung cấp th&ocirc;ng tin ch&iacute;nh thức đến kh&aacute;ch h&agrave;ng. Website chuy&ecirc;n nghiệp v&agrave; tr&igrave;nh b&agrave;y đẹp mắt sẽ gi&uacute;p bạn c&oacute; được sự tin tưởng của kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p><img alt=\"\" src=\"http://www.imgroup.vn/images/web.png\" /></p>\r\n\r\n<p><img alt=\"\" height=\"102\" src=\"http://www.imgroup.vn/images/b3.png\" width=\"580\" /></p>\r\n\r\n<p><em>T&ocirc;i xin chia sẻ B&Iacute; MẬT n&agrave;y trong chương tr&igrave;nh:</em></p>\r\n\r\n<p><img alt=\"\" height=\"80\" src=\"http://www.imgroup.vn/images/b4.png\" width=\"561\" /></p>\r\n\r\n<p><em>T&Ocirc;I CAM KẾT MANG ĐẾN BẠN TẤT CẢ C&Aacute;C B&Iacute; QUYẾT KINH DOANH ONLINE TH&Agrave;NH C&Ocirc;NG CỦA C&Aacute;C TRIỆU PH&Uacute; TR&Ecirc;N THẾ GIỚI:</em></p>\r\n\r\n<ul>\r\n	<li><strong>Kh&aacute;m ph&aacute; nhu cầu, th&oacute;i quen mua h&agrave;ng của kh&aacute;ch h&agrave;ng tr&ecirc;n internet.</strong></li>\r\n	<li>B&iacute; quyết lựa chọn đ&uacute;ng sản phẩm bạn kinh doanh v&agrave; kiếm tiền ngay lập tức.</li>\r\n	<li>Chiến lược đ&aacute;nh thẳng v&agrave;o nhu cầu của kh&aacute;ch h&agrave;ng online.</li>\r\n	<li><strong>C&aacute;ch thức x&acirc;y dựng hệ thống kinh doanh tự động dẫn dắt kh&aacute;ch h&agrave;ng mua sản phẩm v&agrave; chăm s&oacute;c kh&aacute;ch h&agrave;ng li&ecirc;n tục 24/24.</strong></li>\r\n	<li>C&aacute;ch thức tối ưu hệ thống kinh doanh m&agrave; đối thủ kh&ocirc;ng thể theo kịp.</li>\r\n	<li><strong>Tạo nguồn thu nhập thụ động m&agrave; kh&ocirc;ng cần phải l&agrave;m việc nữa.</strong></li>\r\n	<li><strong>Tiếp cận hơn 100.000 kh&aacute;ch h&agrave;ng mới mỗi th&aacute;ng.</strong></li>\r\n	<li>V&agrave; c&ograve;n rất nhiều gi&aacute; trị kh&aacute;c nữa,&hellip;</li>\r\n</ul>\r\n','vi'),(95,95,'THÔNG BÁO KHẨN CẤP','Tuyệt đối không ăn Táo, Cam, Quýt, Lê, Nho,... các loại Hoa Quả từ Trung Quốc. Bên đó, lên Ti vi lệnh Cấm Dân ăn, vì có chất gây Phá Hủy Nội Tạng. Trung Quốc lập tức đẩy Hàng sang Việt Nam bán. Tin chính xác từ Đại sứ quán Việt Nam, ở Trung Quốc báo về, mọi người tuyệt đối cảnh giác với Hoa Quả Trung Quốc. Thực tế thì khách du lịch Trung Quốc sang Việt Nam cũng không dám ăn Hoa Quả của chính nước mình sản xuất.','<p><b>Tr&aacute;i c&acirc;y Trung Quốc chứa chất độc ph&aacute; hủy nội tạng</b><br />\r\n<br />\r\nMột số nước đ&atilde; ph&aacute;t hiện tr&aacute;i c&acirc;y Trung Quốc c&oacute; thuốc trừ s&acirc;u, chất g&acirc;y ung thư, melamine. Đ&aacute;ng lo ngại l&agrave; những loại tr&aacute;i c&acirc;y n&agrave;y đang tr&agrave;n ngập thị trường Việt Nam.<br />\r\n<br />\r\nH&agrave;n Quốc mới đ&acirc;y ph&aacute;t hiện rau v&agrave; tr&aacute;i c&acirc;y nhập từ Trung Quốc c&oacute; chứa melamine. Đ&agrave;i Loan cũng cấm nấm, c&agrave; chua, cần t&acirc;y v&agrave; nhiều loại rau kh&aacute;c từ Trung Quốc. Đ&agrave;i Loan nghi ngờ trong rau c&oacute; nitrit natri, một chất g&acirc;y ung thư cho người d&ugrave;ng. Tại Th&aacute;i Lan, Bộ Y tế nước n&agrave;y ph&aacute;t hiện dư lượng thuốc trừ s&acirc;u ở mức nguy hiểm được t&igrave;m thấy trong nhiều mặt h&agrave;ng rau quả Trung Quốc.<br />\r\n<br />\r\nỞ Việt Nam, theo thống k&ecirc; của Bộ C&ocirc;ng thương, danh mục tr&aacute;i c&acirc;y nhập khẩu từ Trung Quốc về trong th&aacute;ng 10/2008 rất đa dạng. Hiện tại c&aacute;c chợ lớn, nhỏ ở TP HCM, nhiều loại tr&aacute;i c&acirc;y Trung Quốc đang &ldquo;v&agrave;o m&ugrave;a&rdquo;, b&agrave;y b&aacute;n la liệt. &ldquo;Tr&aacute;i c&acirc;y Trung Quốc về nhiều nhất l&agrave; qu&yacute;t, lựu, nho, cam đỏ, hồng&hellip; với gi&aacute; dao động 10.000 &ndash; 15.000 đồng một kg&rdquo;, chị Hồng b&aacute;n tr&aacute;i c&acirc;ytại chợ B&agrave; Chiểu cho biết.<br />\r\n<br />\r\nTr&aacute;i c&acirc;y Trung Quốc c&oacute; ưu thế l&agrave; gi&aacute; rẻ, h&igrave;nh thức đẹp. Một tiểu thương tại chợ B&igrave;nh T&acirc;y so s&aacute;nh, c&aacute;ch đ&acirc;y khoảng hai năm, gi&aacute; qu&yacute;t kh&ocirc;ng hột, lựu l&agrave; 20.000 đồng một kg th&igrave; nay chỉ c&ograve;n một nửa. Chị Hải, một tiểu thương chợ đầu mối n&ocirc;ng sản Thủ Đức, cho biết, vừa nhập về khoảng 10 tấn tr&aacute;i c&acirc;y, trong đ&oacute; hơn 70% l&agrave; h&agrave;ng Trung Quốc.<br />\r\n<br />\r\nTheo Ban quản l&yacute; Chợ đầu mối Thủ Đức, vừa qua, đo&agrave;n thanh tra li&ecirc;n ng&agrave;nh về vệ sinh an to&agrave;n thực phẩm TP HCM ph&aacute;t hiện nhiều loại tr&aacute;i c&acirc;y, rau củ tươi nhập từ Trung Quốc kh&ocirc;ng c&oacute; nh&atilde;n phụ tiếng Việt, giấy chứng minh nguồn gốc xuất xứ. Đặc biệt, c&aacute;c mẫu n&agrave;y c&ograve;n c&oacute; dư lượng thuốc bảo vệ thực vật cao hơn nhiều lần so với ti&ecirc;u chuẩn.<br />\r\n<br />\r\nMột số tiểu thương thừa nhận: &ldquo;Ch&uacute;ng t&ocirc;i biết tr&aacute;i c&acirc;y Trung Quốc c&oacute; chất l&agrave;m ngọt, chất bảo quản&hellip; nhưng kh&ocirc;ng biết r&otilde; ch&uacute;ng l&agrave; chất g&igrave;, độc hại đến mức n&agrave;o n&ecirc;n vẫn b&aacute;n&rdquo;.<br />\r\n<br />\r\nTuy nhi&ecirc;n, người ti&ecirc;u d&ugrave;ng đ&atilde; bắt đầu cảnh gi&aacute;c với tr&aacute;i c&acirc;y Trung Quốc. Kh&ocirc;ng &iacute;t người v&igrave; sợ tr&aacute;i c&acirc;y Trung Quốc c&oacute; chứa chất độc hại n&ecirc;n chuyển sang ti&ecirc;u thụ tr&aacute;i c&acirc;y nội địa. Khảo s&aacute;t tại quầy tr&aacute;i c&acirc;y Si&ecirc;u thị Co-op Mart Nguyễn Đ&igrave;nh Chiểu cho thấy, trong số 10 kh&aacute;ch h&agrave;ng chọn mua tr&aacute;i c&acirc;y ngoại, kh&ocirc;ng ai chọn mua tr&aacute;i c&acirc;y Trung Quốc. &ldquo;Từ khi nghe th&ocirc;ng tin tr&aacute;i c&acirc;y Trung Quốc c&oacute; chất độc hại, t&ocirc;i kh&ocirc;ng d&aacute;m mua nữa&rdquo;, chị V&acirc;n, một kh&aacute;ch h&agrave;ng n&oacute;i.</p>\r\n','vi');
/*!40000 ALTER TABLE `wb_page_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_partner`
--

DROP TABLE IF EXISTS `wb_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_partner`
--

LOCK TABLES `wb_partner` WRITE;
/*!40000 ALTER TABLE `wb_partner` DISABLE KEYS */;
INSERT INTO `wb_partner` VALUES (47,'Phan Nguyen','','','2017/10/27/354-201411223440-logo-den-nho.jpg',2,'2017-09-28 03:09:39','2017-10-27 08:21:49'),(49,'Fogin','','http://dev.webitop.com/','2017/10/27/820-logo.png',3,'2017-09-28 03:10:35','2017-10-27 08:22:15'),(50,'NEM','','','2017/10/27/941-20140530090558-logo-nem-web.png',1,'2017-09-28 03:11:03','2017-10-27 08:21:22'),(51,'ARNAUD','','http://dev.webitop.com/','2017/10/27/21-newscustomers-17.jpg',4,'2017-09-28 03:11:51','2017-10-27 08:23:53'),(71,'Thoi trang nam','','','2017/10/27/693-thoitrang-nam.jpg',5,'2017-10-27 08:24:32','2017-10-27 08:24:32'),(72,'Elifa','','','2017/10/27/991-logo-1.png',6,'2017-10-27 08:25:55','2017-10-27 08:25:55'),(73,'YTLH','','','2018/02/28/698-logodesign-for-medical-500x500.jpg',1,'2018-02-28 09:50:27','2018-02-28 09:50:27');
/*!40000 ALTER TABLE `wb_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_password_reset`
--

DROP TABLE IF EXISTS `wb_password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_password_reset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_password_reset`
--

LOCK TABLES `wb_password_reset` WRITE;
/*!40000 ALTER TABLE `wb_password_reset` DISABLE KEYS */;
INSERT INTO `wb_password_reset` VALUES (2,'vanminh@imgroup.vn','$2y$10$i5zgi.rn60NY4wqcMSOb1ueu1rA4gSDSr2EpceNq9Gm8jPeQUziSy','2017-10-19 10:35:47',NULL),(3,'hoangtrang@imgroup.vn','$2y$10$rdXp.REwwcGLDFAQ9sF/qe1yQkSDBfFCLYJCoUiDmJDyEsz7dESZW','2017-10-20 09:26:12',NULL);
/*!40000 ALTER TABLE `wb_password_reset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_payment_shipping`
--

DROP TABLE IF EXISTS `wb_payment_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_payment_shipping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'payment,shipping',
  `key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `config` text COLLATE utf8_unicode_ci,
  `sort_order` int(11) DEFAULT '0',
  `is_published` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_payment_shipping`
--

LOCK TABLES `wb_payment_shipping` WRITE;
/*!40000 ALTER TABLE `wb_payment_shipping` DISABLE KEYS */;
INSERT INTO `wb_payment_shipping` VALUES (1,'payment',NULL,'','',0,1,'2017-10-02 04:49:30','2017-09-15 03:09:00'),(4,'shipping','giaohangtietkiem','','{\"token\":\"88d012F490fA6853eAfe7FDb3E1863EFD88ad46c\",\"pick_name\":\"Ph\\u1ea1m Ph\\u00fa \\u0110o\\u00e0n\",\"pick_tel\":\"01655561598\",\"pick_mail\":\"nhoxtwi@gmail.com\",\"pick_address\":\"S\\u1ed1 18, Tr\\u1ea7n Thi\\u1ec7n Ch\\u00e1nh, ph\\u01b0\\u1eddng 12\",\"pick_district\":\"Qu\\u1eadn 10\",\"pick_province\":\"TP. H\\u1ed3 Ch\\u00ed Minh\"}',0,0,'2018-03-07 01:49:25','2017-10-19 09:36:04'),(5,'payment','nganluong','https://www.nganluong.vn//css/newhome/img/logos/logo-nganluong.png','{\"RECEIVER\":\"huynhminh009@gmail.com\",\"MERCHANT_ID\":\"52115\",\"MERCHANT_PASS\":\"47cd47da8b4ae86c2299b2efdc095129\"}',0,1,'2017-09-23 16:47:05','2017-09-15 03:09:00'),(8,'shipping','custom','','{\"order_from\":[\"0\",\"500000\",\"5000000\"],\"order_to\":[\"500000\",\"10000000\",\"999999999999\"],\"shipping_fee\":[\"30000\",\"50000\",\"100000\"]}',0,0,'2017-10-17 03:07:50','2017-10-17 10:07:50'),(16,'payment',NULL,'',NULL,0,1,'2017-10-17 03:04:35','2017-10-17 03:04:31'),(17,'shipping','giaohangnhanh','','{\"email\":\"coldboy6596@gmail.com\",\"password\":\"giaohangnhanh653\",\"token\":\"5a9e3d7c1070b02c4c585159\"}',0,1,'2018-03-06 07:06:03','2018-03-06 07:05:35'),(18,'payment',NULL,'fa fa-money',NULL,0,1,'2018-06-19 10:58:12','2018-06-19 10:58:10');
/*!40000 ALTER TABLE `wb_payment_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_payment_shipping_description`
--

DROP TABLE IF EXISTS `wb_payment_shipping_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_payment_shipping_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `lang_code` (`lang_code`,`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_payment_shipping_description`
--

LOCK TABLES `wb_payment_shipping_description` WRITE;
/*!40000 ALTER TABLE `wb_payment_shipping_description` DISABLE KEYS */;
INSERT INTO `wb_payment_shipping_description` VALUES (1,'vi',1,'Thanh toán tại cửa hàng','<p>Nhận hàng và thanh toán tại cửa hàng.</p>\r\n'),(2,'vi',5,'Thanh toán qua ngân lượng.',''),(11,'vi',16,'Thanh toán qua ATM','<p>ACB : 0071000000</p>\r\n\r\n<p>VCB :0071000000</p>\r\n'),(12,'',17,'Giao hàng nhanh',NULL),(13,'vi',18,'Thanh toán khi nhận hàng','');
/*!40000 ALTER TABLE `wb_payment_shipping_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_post`
--

DROP TABLE IF EXISTS `wb_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `view_count` int(11) DEFAULT '0',
  `sort_order` int(11) DEFAULT '0',
  `is_published` tinyint(1) DEFAULT '1',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_post`
--

LOCK TABLES `wb_post` WRITE;
/*!40000 ALTER TABLE `wb_post` DISABLE KEYS */;
INSERT INTO `wb_post` VALUES (162,5,'2017/12/04/762-photo-1-1511755939508.jpg',9,0,1,'2017-12-04 00:00:00','2017-12-04 07:07:51','2018-06-29 13:57:56'),(163,5,'2018/03/01/983-photo-1-1509528908242.jpg',17,0,1,'2017-12-04 00:00:00','2017-12-04 07:23:11','2018-06-30 08:39:34'),(164,5,'2018/03/01/645-photo-3-1509441583279.jpg',18,0,1,'2017-12-04 00:00:00','2017-12-04 07:25:36','2018-07-01 03:35:57'),(165,5,'2017/12/04/489-photo-4-1505207980167.jpg',5,0,1,'2017-12-04 00:00:00','2017-12-04 07:30:43','2018-06-26 14:50:34'),(166,5,'2018/03/01/533-photo-5-1505456177619.jpg',10,0,1,'2017-12-04 00:00:00','2017-12-04 07:34:04','2018-06-25 22:09:56'),(167,5,'2018/03/01/767-thiet-ke-noi-that-phong-cach-phap-pho-bien-1.jpg',3,0,1,'2017-12-06 00:00:00','2017-12-06 03:31:34','2018-06-21 08:34:16'),(168,5,'2018/03/01/275-small-living-room-decorating-ideas-with-sectional-foyer-basement-industrial-expansive-wall-coverings-home-builders-home-services.jpg',3,0,1,'2017-12-06 00:00:00','2017-12-06 03:33:27','2018-06-21 08:34:14'),(169,5,'2017/12/06/414-thiet-ke-noi-that-phong-khach-biet-thu-sang-trong-1.jpg',3,0,1,'2017-12-06 00:00:00','2017-12-06 03:35:03','2018-06-21 08:34:18'),(170,5,'2018/03/01/443-thiet-ke-noi-that-phong-cach-co-dien-6.jpg',14,0,1,'2017-12-06 00:00:00','2017-12-06 03:36:45','2018-06-28 07:21:30');
/*!40000 ALTER TABLE `wb_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_post_description`
--

DROP TABLE IF EXISTS `wb_post_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_post_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`lang_code`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_post_description`
--

LOCK TABLES `wb_post_description` WRITE;
/*!40000 ALTER TABLE `wb_post_description` DISABLE KEYS */;
INSERT INTO `wb_post_description` VALUES (63,91,'vi','Giới thiệu','Giới thiệu chuổi cửa hàng nước ép đóng chai giao tận nơi NuocEp.vn','<p><img alt=\"\" src=\"http://nuocep.vn/kcfinder/upload/images/NuocEpvn_logo-01%20RGB.jpg\" /></p>\r\n\r\n<p><strong>C&Ocirc;NG TY CỔ PHẦN NƯỚC &Eacute;P VIỆT NAM</strong></p>\r\n\r\n<p><strong><img alt=\"\" src=\"http://nuocep.vn/kcfinder/upload/images/ung-ho-nuoc-ep-viet-nam%283%29.jpg\" /></strong></p>\r\n\r\n<p><strong>Sứ mệnh</strong>:&nbsp;với th&ocirc;ng điệp &ldquo;Good Juice, Good Life&rdquo;, chuổi cửa h&agrave;ng nước &eacute;p đ&oacute;ng chai giao tận nơi NuocEp.vn mong muốn gi&uacute;p cho bạn c&oacute; 1 cơ thể khoẻ mạnh bằng Nước &Eacute;p nguy&ecirc;n chất 100%, SẠCH, nguồn gốc tr&aacute;i c&acirc;y Việt Nam. Từ đ&oacute; bạn sẽ l&agrave;m việc hiệu quả hơn, chăm lo cho người th&acirc;n tốt hơn, v&agrave;&nbsp;<strong>tận hưởng cuộc sống trọn vẹn</strong>&nbsp;thật sự. C&oacute; sức khoẻ l&agrave; c&oacute; tất cả.&nbsp;</p>\r\n\r\n<p><img alt=\"Nước ép cao cấp nguyên chất 100%\" src=\"http://nuocep.vn/kcfinder/upload/images/nuoc-ep-nguyen-chat.jpg\" /></p>\r\n\r\n<p>Nước &eacute;p cao cấp nguy&ecirc;n chất 100%</p>\r\n\r\n<p><strong>Tầm nh&igrave;n:</strong>&nbsp;<strong>NuocEp.vn&nbsp;</strong>sẽ trở&nbsp;th&agrave;nh chuổi cửa h&agrave;ng Nước &Eacute;p NHIỀU ĐỊA ĐIỂM NHẤT, v&agrave; cung cấp hơn&nbsp;<strong>20.000</strong>&nbsp;chai&nbsp;Nước &Eacute;p mỗi ng&agrave;y cho người d&acirc;n Việt Nam. Gi&uacute;p được cho thật nhiều người Việt Nam khoẻ mạnh, &ldquo;tận hưởng cuộc sống trọn vẹn&rdquo;, g&oacute;p phần x&acirc;y dựng x&atilde; hội gi&agrave;u mạnh hơn. Quan trọng nhất l&agrave; giải quyết được đầu ra cho Tr&aacute;i C&acirc;y Việt Nam gi&uacute;p cho b&agrave; con n&ocirc;ng d&acirc;n. Đội ngũ NuocEp.vn rất đau l&ograve;ng khi mỗi năm đọc c&aacute;c tin tức về &ldquo;dưa hấu bỏ cho tr&acirc;u b&ograve; ăn&rdquo;, &ldquo;n&ocirc;ng d&acirc;n thất m&ugrave;a&rdquo;, &ldquo;mọi người h&atilde;y g&oacute;p sức giải cứu dưa hấu&rdquo;, &ldquo;giải cứu vải&rdquo;, &ldquo;giải cứu &hellip;. v.v&hellip;&rdquo; . Trong khi người d&acirc;n Việt Nam phải ăn uống những thứ ĐỘC HẠI từ Trung Quốc nhập qua, c&ograve;n những tr&aacute;i c&acirc;y sạch, ngon lại đi XUẤT KHẨU nước ngo&agrave;i. KH&Ocirc;NG THỂ CHẤP NHẬN ĐƯỢC. NuocEp.vn phải l&agrave;m cho người Việt Nam được hưởng tr&aacute;i c&acirc;y&nbsp;<strong>SẠCH</strong>&nbsp;của người Việt Nam, điều hướng được n&ocirc;ng d&acirc;n trồng trọt ti&ecirc;u chuẩn&nbsp;<strong>SẠCH</strong>&nbsp;v&agrave; c&oacute; t&acirc;m. V&agrave; giải quyết được đầu ra, gi&uacute;p n&ocirc;ng d&acirc;n Việt Nam ấm no hạnh ph&uacute;c.</p>\r\n\r\n<p><img alt=\"\" src=\"http://nuocep.vn/kcfinder/upload/images/14563530_1252970824766107_6622913602510333165_n.jpg\" /></p>\r\n\r\n<p><strong>ĐIỂM KH&Aacute;C BIỆT</strong><strong>&nbsp;</strong>của chuổi cửa h&agrave;ng nước &eacute;p đ&oacute;ng chai giao tận nơi&nbsp;<strong>NuocEp.vn</strong>:</p>\r\n\r\n<p><img alt=\"Nước ép cao cấp không chất bảo quản\" src=\"http://nuocep.vn/kcfinder/upload/images/nuoc-ep-cao-cap-khong-chat-bao-quan.jpg\" /></p>\r\n\r\n<p>Nước &eacute;p cao cấp kh&ocirc;ng chất bảo quản</p>\r\n\r\n<p>1.&nbsp;&nbsp;&nbsp; C&ocirc;ng nghệ &eacute;p lạnh s&acirc;u&nbsp;<strong>Cold Pressed</strong>&nbsp;từ Mỹ: gi&uacute;p giữ trọn vẹn vitamin v&agrave; dinh dưỡng gấp 150% so với nước &eacute;p th&ocirc;ng thường. M&agrave; vị nước &eacute;p vẫn tươi ngon như mới với thời gian l&acirc;u hơn.</p>\r\n\r\n<p>2.&nbsp;&nbsp;&nbsp;&nbsp;<strong>Kh&ocirc;ng đường, kh&ocirc;ng chất bảo quản</strong>,&nbsp;&eacute;p v&agrave; b&aacute;n trong ng&agrave;y, đảm bảo hương vị tươi m&aacute;t ngon miệng, vị ngọt tinh khiết từ tr&aacute;i c&acirc;y tự nhi&ecirc;n thật sự. NuocEp.vn cam kết kh&ocirc;ng bao giờ b&aacute;n sản phẩm đ&atilde; qua 24h, ch&uacute;ng t&ocirc;i th&agrave; đổ bỏ chứ nhất định phải bảo vệ &nbsp;sức khoẻ của bạn v&agrave; uy t&iacute;n - chất lượng của Thương Hiệu NuocEp.vn</p>\r\n\r\n<p>3.&nbsp;&nbsp;&nbsp; Tr&aacute;i c&acirc;y&nbsp;<strong>SẠCH</strong>&nbsp;100% nguồn gốc ho&agrave;n to&agrave;n Việt Nam:&nbsp; tr&aacute;i c&acirc;y nguồn gốc vườn r&otilde; r&agrave;ng, của n&ocirc;ng d&acirc;n miền T&acirc;y v&agrave; miền Đ&ocirc;ng,&nbsp;<strong>NuocEp.vn&nbsp;</strong>chỉ b&aacute;n c&aacute;c sản phẩm từ tr&aacute;i c&acirc;y Việt Nam để gi&uacute;p đỡ n&ocirc;ng d&acirc;n Việt Nam, gi&uacute;p cho bạn được uống những sản phẩm ngon chất lượng từ đất mẹ Việt Nam. To&agrave;n bộ tr&aacute;i c&acirc;y được tuyển lựa kỹ, rửa sạch qua nước muối v&agrave; m&aacute;y Ozone, &nbsp;rửa lại dưới v&ograve;i nước mạnh, ướp thật LẠNH sau đ&oacute; mới &Eacute;P, đ&uacute;ng c&ocirc;ng nghệ &eacute;p lạnh s&acirc;u nhằm gi&uacute;p bạn được tận hưởng hương vị ngon miệng, dinh dưỡng v&agrave; an t&acirc;m nhất.</p>\r\n\r\n<p>4.&nbsp;&nbsp;&nbsp;&nbsp;<strong>Giao tận nơi&nbsp;</strong>trong nội th&agrave;nh dưới 30 ph&uacute;t, cực kỳ tiện lợi v&agrave; bạn kh&ocirc;ng phải đợi l&acirc;u để c&oacute; tr&ecirc;n tay 1 chai nước &eacute;p CỰC ngon miệng, CỰC sạch v&agrave; CỰC dinh dưỡng.</p>\r\n\r\n<p><img alt=\"Cửa hàng nước ép cold press\" src=\"http://nuocep.vn/kcfinder/upload/images/cua-hang-nuoc-ep.jpg\" /></p>\r\n\r\n<p>Cửa h&agrave;ng nước &eacute;p cold press</p>\r\n\r\n<p><img alt=\"\" src=\"http://nuocep.vn/kcfinder/upload/images/giay-chung-nhan-ve-sinh-an-toan-thuc-pham%281%29.jpg\" /></p>\r\n\r\n<p>N&agrave;o bạn c&ograve;n chờ g&igrave; nữa, h&atilde;y CLICK v&agrave;o đ&acirc;y</p>\r\n\r\n<p><strong>-&gt;&gt;&nbsp;<a href=\"http://nuocep.vn/nuoc-ep-cao-cap/\">Xem c&aacute;c loại nước &eacute;p Cold Pressed của NuocEp.vn&nbsp;</a>&lt;&lt;-</strong></p>\r\n\r\n<p>để đặt giao ngay cho bản th&acirc;n m&igrave;nh v&agrave; người th&acirc;n y&ecirc;u của m&igrave;nh nh&eacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"http://nuocep.vn/kcfinder/upload/images/nuoc-ep-viet-nam%282%29.jpg\" /></p>\r\n\r\n<p>NuocEp.vn, gi&uacute;p bạn&nbsp;<strong>&ldquo;tận hưởng cuộc sống trọn vẹn&rdquo;</strong>!</p>\r\n',''),(69,97,'vi','Trái cây xanh','Xanh chua','<p>Xanh xanh xanh</p>\r\n',''),(72,100,'vi','Con cò bé bé - Xuân Mai','Bài hát thiếu nhi','<p>Con c&ograve; b&eacute; b&eacute;. N&oacute; đậu c&agrave;nh tre. Đi kh&ocirc;ng hỏi mẹ. Biết đi đường n&agrave;o. Khi đi em hỏi. Khi về em ch&agrave;o. Miệng em ch&uacute;m ch&iacute;m. Mẹ y&ecirc;u kh&ocirc;ng n&agrave;o.</p>\r\n',''),(74,109,'vi','acb','','',''),(102,162,'vi','Ngỡ ngàng nội thất của ngôi nhà có vẻ ngoài thô ráp xù xì','<p>Ng&ocirc;i nh&agrave; n&agrave;y ch&iacute;nh l&agrave; minh chứng ti&ecirc;u biểu cho c&acirc;u n&oacute;i &ldquo;Đừng nh&igrave;n mặt m&agrave; bắt h&igrave;nh dong&rdquo;.</p>\r\n','<p style=\"text-align: justify;\">Ng&ocirc;i nh&agrave; n&agrave;y ch&iacute;nh l&agrave; minh chứng ti&ecirc;u biểu cho c&acirc;u n&oacute;i &ldquo;Đừng nh&igrave;n mặt m&agrave; bắt h&igrave;nh dong&rdquo;. N&agrave;o h&atilde;y c&ugrave;ng xem minh chứng c&oacute; đ&uacute;ng kh&ocirc;ng nh&eacute;:</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Căn nhà 4 tầng này là tổ ấm của một gia đình trẻ, tọa lạc ở trung tâm thủ đô Seoul, Hàn Quốc.\" src=\"http://giadinh.mediacdn.vn/2017/photo-0-1511755939522.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Căn nh&agrave; 4 tầng n&agrave;y l&agrave; tổ ấm của một gia đ&igrave;nh trẻ, tọa lạc ở trung t&acirc;m thủ đ&ocirc; Seoul, H&agrave;n Quốc.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Ngôi nhà có vẻ ngoài khá mờ nhạt, nếu không nói là xấu xí với tường gạch màu ghi xám nhàm chán và kiến trúc như một khối hộp không có gì nổi bật.\" src=\"http://giadinh.mediacdn.vn/2017/photo-1-1511755939508.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Ng&ocirc;i nh&agrave; c&oacute; vẻ ngo&agrave;i kh&aacute; mờ nhạt, nếu kh&ocirc;ng n&oacute;i l&agrave; xấu x&iacute; với tường gạch m&agrave;u ghi x&aacute;m nh&agrave;m ch&aacute;n v&agrave; kiến tr&uacute;c như một khối hộp kh&ocirc;ng c&oacute; g&igrave; nổi bật.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Tuy nhiên, chỉ cần bước qua cánh cửa chính, bất cứ ai cũng phải “há hốc mồm” với nội thất tiện nghi và đẹp hiện đại của nó.\" src=\"http://giadinh.mediacdn.vn/2017/photo-2-1511755939510.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Tuy nhi&ecirc;n, chỉ cần bước qua c&aacute;nh cửa ch&iacute;nh, bất cứ ai cũng phải &ldquo;h&aacute; hốc mồm&rdquo; với nội thất tiện nghi v&agrave; đẹp hiện đại của n&oacute;.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Hàn Quốc là một quốc gia có tốc độ phát triển nhanh và mật độ dân số cao. Từng có một thời gian, người dân ở đây chuộng “mốt” xây nhà thật hoành tráng và đầu tư thật nhiều cho mặt tiền để “nở mày nở mặt”.\" src=\"http://giadinh.mediacdn.vn/2017/photo-3-1511755939512.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">H&agrave;n Quốc l&agrave; một quốc gia c&oacute; tốc độ ph&aacute;t triển nhanh v&agrave; mật độ d&acirc;n số cao. Từng c&oacute; một thời gian, người d&acirc;n ở đ&acirc;y chuộng &ldquo;mốt&rdquo; x&acirc;y nh&agrave; thật ho&agrave;nh tr&aacute;ng v&agrave; đầu tư thật nhiều cho mặt tiền để &ldquo;nở m&agrave;y nở mặt&rdquo;.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Tuy nhiên, theo thời gian, quan điểm đó đã được thay đổi. Hiện giờ, người ta không quá tập trung chăm chút cho vẻ bên ngoài của căn hộ nữa, thay vào đó là tối ưu hóa không gian sống bên trong sao cho tiện nghi và thoải mái nhất.\" src=\"http://giadinh.mediacdn.vn/2017/photo-4-1511755939513.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Tuy nhi&ecirc;n, theo thời gian, quan điểm đ&oacute; đ&atilde; được thay đổi. Hiện giờ, người ta kh&ocirc;ng qu&aacute; tập trung chăm ch&uacute;t cho vẻ b&ecirc;n ngo&agrave;i của căn hộ nữa, thay v&agrave;o đ&oacute; l&agrave; tối ưu h&oacute;a kh&ocirc;ng gian sống b&ecirc;n trong sao cho tiện nghi v&agrave; thoải m&aacute;i nhất.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Ngôi nhà này là một ví dụ tiêu biểu cho quan điểm mới này.\" src=\"http://giadinh.mediacdn.vn/2017/photo-5-1511755939524.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Ng&ocirc;i nh&agrave; n&agrave;y l&agrave; một v&iacute; dụ ti&ecirc;u biểu cho quan điểm mới n&agrave;y.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Khi thiết kế, các kiến trúc sư đã cố gắng tạo ra một không gian sống thoáng đãng, hiện đại và phù hợp nhất với cá tính của gia chủ.\" src=\"http://giadinh.mediacdn.vn/2017/photo-6-1511755939526.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Khi thiết kế, c&aacute;c kiến tr&uacute;c sư đ&atilde; cố gắng tạo ra một kh&ocirc;ng gian sống tho&aacute;ng đ&atilde;ng, hiện đại v&agrave; ph&ugrave; hợp nhất với c&aacute; t&iacute;nh của gia chủ.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Diện tích khu đất không lớn, xung quanh lại là những ngôi nhà cao tầng, vì thế, sử dụng cầu thang bằng kính ngay dưới giếng trời để thông gió và ánh sáng là lựa chọn vô cùng hợp lý cho công trình.\" src=\"http://giadinh.mediacdn.vn/2017/photo-7-1511755939516.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Diện t&iacute;ch khu đất kh&ocirc;ng lớn, xung quanh lại l&agrave; những ng&ocirc;i nh&agrave; cao tầng, v&igrave; thế, sử dụng cầu thang bằng k&iacute;nh ngay dưới giếng trời để th&ocirc;ng gi&oacute; v&agrave; &aacute;nh s&aacute;ng l&agrave; lựa chọn v&ocirc; c&ugrave;ng hợp l&yacute; cho c&ocirc;ng tr&igrave;nh.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Các khu vực chức năng được chia theo mức độ phân bổ ánh sáng.\" src=\"http://giadinh.mediacdn.vn/2017/photo-8-1511755939517.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">C&aacute;c khu vực chức năng được chia theo mức độ ph&acirc;n bổ &aacute;nh s&aacute;ng.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Phòng khách và bếp được đặt ở tầng 3.\" src=\"http://giadinh.mediacdn.vn/2017/photo-9-1511755939519.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Ph&ograve;ng kh&aacute;ch v&agrave; bếp được đặt ở tầng 3.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Gian bếp dài hình chữ I.\" src=\"http://giadinh.mediacdn.vn/2017/photo-10-1511755939556.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Gian bếp d&agrave;i h&igrave;nh chữ I.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Phòng khách ấm cúng.\" src=\"http://giadinh.mediacdn.vn/2017/photo-11-1511755939520.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Ph&ograve;ng kh&aacute;ch ấm c&uacute;ng.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Khu vực vui chơi, sinh hoạt chung, xem tivi…của cả gia đình cũng được bố trí ở tầng này.\" src=\"http://giadinh.mediacdn.vn/2017/photo-12-1511755939545.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Khu vực vui chơi, sinh hoạt chung, xem tivi&hellip;của cả gia đ&igrave;nh cũng được bố tr&iacute; ở tầng n&agrave;y.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Tầng 2 và tầng 4 là phòng ngủ.\" src=\"http://giadinh.mediacdn.vn/2017/photo-13-1511755939536.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Tầng 2 v&agrave; tầng 4 l&agrave; ph&ograve;ng ngủ.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Phòng ngủ của bố mẹ.\" src=\"http://giadinh.mediacdn.vn/2017/photo-14-1511755939537.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Ph&ograve;ng ngủ của bố mẹ.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Phòng ngủ của trẻ em.\" src=\"http://giadinh.mediacdn.vn/2017/photo-15-1511755939542.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Ph&ograve;ng ngủ của trẻ em.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Tầng thượng là khu vực thư giãn, một ban công nhỏ được bố trí ở đây trở thành nơi tắm nắng lý tưởng.\" src=\"http://giadinh.mediacdn.vn/2017/photo-16-1511755939558.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Tầng thượng l&agrave; khu vực thư gi&atilde;n, một ban c&ocirc;ng nhỏ được bố tr&iacute; ở đ&acirc;y trở th&agrave;nh nơi tắm nắng l&yacute; tưởng.</p>\r\n',''),(103,163,'vi','Nội thất xa xỉ trong căn hộ triệu đô tại trung tâm Hà Nội của thành viên nhóm Big Bang','<p>Căn hộ với h&agrave;ng loạt nội thất h&agrave;ng hiệu sẽ l&agrave; nơi dừng ch&acirc;n của ng&ocirc;i sao H&agrave;n Quốc mỗi dịp anh đến Việt Nam.</p>\r\n','<h2 style=\"text-align: center;\"><img alt=\"Sau chuyến ghé thăm Việt Nam vào cuối năm 2016, em út Seungri của nhóm nhạc đình đám Hàn Quốc Big Bang đã nhận được món quà đầy bất ngờ từ gia đình người bạn thân - doanh nhân Denis Đỗ là một căn hộ sang trọng tại Hà Nội. Tiếp đó, anh chàng lại chuẩn bị đầu tư đưa chuỗi thương hiệu mình sở hữu tới Hà Nội bằng một nhà hàng trong năm nay.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-0-1509528908257.jpg\" /></h2>\r\n\r\n<p style=\"text-align: justify;\">Sau chuyến gh&eacute; thăm Việt Nam v&agrave;o cuối năm 2016, em &uacute;t Seungri của nh&oacute;m nhạc đ&igrave;nh đ&aacute;m H&agrave;n Quốc Big Bang đ&atilde; nhận được m&oacute;n qu&agrave; đầy bất ngờ từ gia đ&igrave;nh người bạn th&acirc;n - doanh nh&acirc;n Denis Đỗ l&agrave; một căn hộ sang trọng tại H&agrave; Nội. Tiếp đ&oacute;, anh ch&agrave;ng lại chuẩn bị đầu tư đưa chuỗi thương hiệu m&igrave;nh sở hữu tới H&agrave; Nội bằng một nh&agrave; h&agrave;ng trong năm nay.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Với công việc kinh doanh bận rộn giữa Việt Nam và Hàn Quốc, nam ca sĩ sẽ có dịp tận hưởng quãng thời gian có mặt tại thủ đô trong căn hộ đẳng cấp. Hình ảnh bên trong căn hộ của nam ca sĩ Hàn Quốc nhận được rất nhiều sự quan tâm của người hâm mộ. Dù không được tiết lộ về giá bán nhưng với vị trí tọa lạc tại tầng 22 của một trong những chung cư đắt đỏ nhất Hà Nội với diện tích 220m2, giá trị căn hộ này được ước tính lên tới triệu đô.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-1-1509528908242.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Với c&ocirc;ng việc kinh doanh bận rộn giữa Việt Nam v&agrave; H&agrave;n Quốc, nam ca sĩ sẽ c&oacute; dịp tận hưởng qu&atilde;ng thời gian c&oacute; mặt tại thủ đ&ocirc; trong căn hộ đẳng cấp. H&igrave;nh ảnh b&ecirc;n trong căn hộ của nam ca sĩ H&agrave;n Quốc nhận được rất nhiều sự quan t&acirc;m của người h&acirc;m mộ. D&ugrave; kh&ocirc;ng được tiết lộ về gi&aacute; b&aacute;n nhưng với vị tr&iacute; tọa lạc tại tầng 22 của một trong những chung cư đắt đỏ nhất H&agrave; Nội với diện t&iacute;ch 220m2, gi&aacute; trị căn hộ n&agrave;y được ước t&iacute;nh l&ecirc;n tới triệu đ&ocirc;.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Nội thất trong căn hộ hạng sang nay cũng được đầu tư tương xứng với đẳng cấp khi được đặt riêng từ những thương hiệu đắt đỏ nhất châu Âu. Có thể kể đến bộ ghế da trong phòng khách được làm thủ công bởi các nghệ nhân lành nghề nhất tại Italy.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-2-1509528908243.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Nội thất trong căn hộ hạng sang nay cũng được đầu tư tương xứng với đẳng cấp khi được đặt ri&ecirc;ng từ những thương hiệu đắt đỏ nhất ch&acirc;u &Acirc;u. C&oacute; thể kể đến bộ ghế da trong ph&ograve;ng kh&aacute;ch được l&agrave;m thủ c&ocirc;ng bởi c&aacute;c nghệ nh&acirc;n l&agrave;nh nghề nhất tại Italy.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Không gian toàn cảnh phòng khách và phòng ăn liền nhau thành một khối được bao bọc bằng cửa kính nhìn thẳng ra hồ và công viên Cầu Giấy.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-3-1509528908246.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Kh&ocirc;ng gian to&agrave;n cảnh ph&ograve;ng kh&aacute;ch v&agrave; ph&ograve;ng ăn liền nhau th&agrave;nh một khối được bao bọc bằng cửa k&iacute;nh nh&igrave;n thẳng ra hồ v&agrave; c&ocirc;ng vi&ecirc;n Cầu Giấy.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Một trong những điểm nhấn của phòng khách và phòng ăn là chiếc gương khảm da cá sấu trắng có mức giá lên tới 1 tỷ đồng.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-4-1509528908247.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Một trong những điểm nhấn của ph&ograve;ng kh&aacute;ch v&agrave; ph&ograve;ng ăn l&agrave; chiếc gương khảm da c&aacute; sấu trắng c&oacute; mức gi&aacute; l&ecirc;n tới 1 tỷ đồng.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Không gian phòng khách cũng là nơi Seungri dành vị trí trang trọng nhất cho món quà tân gia của người bạn Denis Đỗ là một chiếc tủ rượu bằng da trị giá 1 tỷ đồng.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-5-1509528908248.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Kh&ocirc;ng gian ph&ograve;ng kh&aacute;ch cũng l&agrave; nơi Seungri d&agrave;nh vị tr&iacute; trang trọng nhất cho m&oacute;n qu&agrave; t&acirc;n gia của người bạn Denis Đỗ l&agrave; một chiếc tủ rượu bằng da trị gi&aacute; 1 tỷ đồng.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Chưa dừng lại ở đó không gian bếp, phòng ăn và phòng khách còn được trang chí bởi 3 chùm đèn khác nhau được chế tác tỉ mỉ, thủ công với mức giá lên tới hơn 1 tỷ đồng cho 1 chiếc.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-6-1509528908226.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Chưa dừng lại ở đ&oacute; kh&ocirc;ng gian bếp, ph&ograve;ng ăn v&agrave; ph&ograve;ng kh&aacute;ch c&ograve;n được trang ch&iacute; bởi 3 ch&ugrave;m đ&egrave;n kh&aacute;c nhau được chế t&aacute;c tỉ mỉ, thủ c&ocirc;ng với mức gi&aacute; l&ecirc;n tới hơn 1 tỷ đồng cho 1 chiếc.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Kệ sách cũng thể hiện đẳng cấp của chủ sở hữu căn hộ với những tác phẩm trưng bày được làm từ vàng khối.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-7-1509528908259.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Kệ s&aacute;ch cũng thể hiện đẳng cấp của chủ sở hữu căn hộ với những t&aacute;c phẩm trưng b&agrave;y được l&agrave;m từ v&agrave;ng khối.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Bên trong phòng ngủ chính là các tủ được thiết kế riêng biệt cùng hệ thống rèm cửa tự động.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-8-1509528908229.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">B&ecirc;n trong ph&ograve;ng ngủ ch&iacute;nh l&agrave; c&aacute;c tủ được thiết kế ri&ecirc;ng biệt c&ugrave;ng hệ thống r&egrave;m cửa tự động.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Chiếc giường của Seungri cũng được thiết kế đồng bộ với tông màu nội thất phòng khách.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-9-1509528908231.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Chiếc giường của Seungri cũng được thiết kế đồng bộ với t&ocirc;ng m&agrave;u nội thất ph&ograve;ng kh&aacute;ch.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"2 phòng ngủ phụ có diện tích nhỏ hơn nhưng cũng được chăm chút tỉ mỉ với những món đồ tới từ các thương hiệu xa xỉ.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-10-1509528908254.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">2 ph&ograve;ng ngủ phụ c&oacute; diện t&iacute;ch nhỏ hơn nhưng cũng được chăm ch&uacute;t tỉ mỉ với những m&oacute;n đồ tới từ c&aacute;c thương hiệu xa xỉ.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Không gian các phòng ngủ nằm ở vị trí khá thoáng khi từ cửa sổ có thể nhìn thẳng xuống sảnh lớn của tòa nhà.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-11-1509528908235.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Kh&ocirc;ng gian c&aacute;c ph&ograve;ng ngủ nằm ở vị tr&iacute; kh&aacute; tho&aacute;ng khi từ cửa sổ c&oacute; thể nh&igrave;n thẳng xuống sảnh lớn của t&ograve;a nh&agrave;.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Nội thất phòng tắm là một trong những điểm độc đáo nhất của căn hộ với bồn rửa mặt và bồn vệ sinh được dát từ vàng thật.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-12-1509528908237.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Nội thất ph&ograve;ng tắm l&agrave; một trong những điểm độc đ&aacute;o nhất của căn hộ với bồn rửa mặt v&agrave; bồn vệ sinh được d&aacute;t từ v&agrave;ng thật.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Ngay cả tay nắm cửa và vòi nước cũng được mạ vàng tinh xảo cho thấy giá trị vô cùng lớn của căn hộ thượng lưu này.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-13-1509528908256.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Ngay cả tay nắm cửa v&agrave; v&ograve;i nước cũng được mạ v&agrave;ng tinh xảo cho thấy gi&aacute; trị v&ocirc; c&ugrave;ng lớn của căn hộ thượng lưu n&agrave;y.</p>\r\n',''),(104,164,'vi','Phát hoảng trước những thứ đồ nội thất quái dị ngày Halloween','<p>Liệu bạn c&oacute; d&aacute;m tậu những thứ đồ nội thất qu&aacute;i dị đầy ma mị n&agrave;y để trang tr&iacute; nh&agrave; ng&agrave;y Halloween kh&ocirc;ng?</p>\r\n','<p style=\"text-align: justify;\">Halloween đến, ngo&agrave;i những &yacute; tưởng trang tr&iacute; nh&agrave; bằng những đồ vật tự l&agrave;m , bạn ho&agrave;n to&agrave;n c&oacute; thể sắm th&ecirc;m những thứ đồ nội thất độc đ&aacute;o c&oacute; phần ma qu&aacute;i để khiến ng&ocirc;i nh&agrave; c&agrave;ng trở n&ecirc;n ấn tượng hơn.</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>1. Cửa nh&agrave;</strong></p>\r\n\r\n<p style=\"text-align: justify;\">C&aacute;nh cửa nh&agrave; l&agrave; thứ sẽ g&acirc;y ấn tượng rất mạnh đối với những người gh&eacute; thăm nh&agrave; bạn, đặc biệt l&agrave; lũ trẻ khi chơi tr&ograve; &quot;Trick or Treat&quot;, phải đến g&otilde; cửa xin kẹo từng nh&agrave;.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Lắp thêm kính có hình mạng nhện cũng là một ý tưởng khá hay.\" src=\"http://giadinh.mediacdn.vn/2017/photo-0-1509441583273.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Lắp th&ecirc;m k&iacute;nh c&oacute; h&igrave;nh mạng nhện cũng l&agrave; một &yacute; tưởng kh&aacute; hay.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Hoặc treo thêm mạng nhện giả bằng vải ở ngoài, nếu không thể tự làm, bạn có thể mua sẵn tại các cửa hàng bán đồ trang trí.\" src=\"http://giadinh.mediacdn.vn/2017/photo-1-1509441583274.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Hoặc treo th&ecirc;m mạng nhện giả bằng vải ở ngo&agrave;i, nếu kh&ocirc;ng thể tự l&agrave;m, bạn c&oacute; thể mua sẵn tại c&aacute;c cửa h&agrave;ng b&aacute;n đồ trang tr&iacute;.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Loại cửa có in hình kinh dị ở bên ngoài cũng sẽ khiến nhà bạn ấn tượng hơn rất nhiều.\" src=\"http://giadinh.mediacdn.vn/2017/photo-2-1509441583276.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Loại cửa c&oacute; in h&igrave;nh kinh dị ở b&ecirc;n ngo&agrave;i cũng sẽ khiến nh&agrave; bạn ấn tượng hơn rất nhiều.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Thảm chùi chân có đôi chân thò ra hoặc đôi chân bằng bông gắn vào tường chắc chắn sẽ khiến bạn giật mình nếu không để ý kỹ.\" src=\"http://giadinh.mediacdn.vn/2017/photo-3-1509441583279.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Thảm ch&ugrave;i ch&acirc;n c&oacute; đ&ocirc;i ch&acirc;n th&ograve; ra hoặc đ&ocirc;i ch&acirc;n bằng b&ocirc;ng gắn v&agrave;o tường chắc chắn sẽ khiến bạn giật m&igrave;nh nếu kh&ocirc;ng để &yacute; kỹ.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>2. B&agrave;n, ghế, khăn trải b&agrave;n, tủ,...</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Chắc chắn những thứ đồ n&agrave;y kh&ocirc;ng thể thiếu trong dịp Halloween khi c&oacute; người đến chơi nh&agrave; bạn. Một chiếc b&agrave;n trang tr&iacute; ma qu&aacute;i hay ghế h&igrave;nh th&ugrave; k&igrave; dị sẽ khiến mọi người &quot;kh&oacute;c th&eacute;t&quot;.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/2017/photo-4-1509441583281.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Khăn trải bàn mạng nhện hay tơ nhện là thứ đồ không thể thiếu mùa Halloween này.\" src=\"http://giadinh.mediacdn.vn/2017/photo-5-1509441583283.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Khăn trải b&agrave;n mạng nhện hay tơ nhện l&agrave; thứ đồ kh&ocirc;ng thể thiếu m&ugrave;a Halloween n&agrave;y.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Chiếc bàn có 4 chân bằng... xương thế này đã đủ kinh dị chưa?\" src=\"http://giadinh.mediacdn.vn/2017/photo-6-1509441583286.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Chiếc b&agrave;n c&oacute; 4 ch&acirc;n bằng... xương thế n&agrave;y đ&atilde; đủ kinh dị chưa?</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Ghế gỗ hình đầu lâu.\" src=\"http://giadinh.mediacdn.vn/2017/photo-7-1509441583288.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Ghế gỗ h&igrave;nh đầu l&acirc;u.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/2017/photo-8-1509441583290.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Bạn có thể sắm những chiếc ghế êm ái có in hình 3D khá chân thực này.\" src=\"http://giadinh.mediacdn.vn/2017/photo-9-1509441583293.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Bạn c&oacute; thể sắm những chiếc ghế &ecirc;m &aacute;i c&oacute; in h&igrave;nh 3D kh&aacute; ch&acirc;n thực n&agrave;y.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Một chiếc ghế vàng in hình dơi trông hơi... hiền lành mùa Halloween nhưng lại cực kì nổi bật.\" src=\"http://giadinh.mediacdn.vn/2017/photo-10-1509441583295.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Một chiếc ghế v&agrave;ng in h&igrave;nh dơi tr&ocirc;ng hơi... hiền l&agrave;nh m&ugrave;a Halloween nhưng lại cực k&igrave; nổi bật.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Thực ra đối với chiếc tủ ma búp bê này, bạn có thể tự làm với một chiếc tủ có sẵn và những bộ phận rời của búp bê đã hỏng.\" src=\"http://giadinh.mediacdn.vn/2017/photo-11-1509441583297.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Thực ra đối với chiếc tủ ma b&uacute;p b&ecirc; n&agrave;y, bạn c&oacute; thể tự l&agrave;m với một chiếc tủ c&oacute; sẵn v&agrave; những bộ phận rời của b&uacute;p b&ecirc; đ&atilde; hỏng.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\"><strong>3. Đồ d&ugrave;ng nh&agrave; vệ sinh</strong></p>\r\n\r\n<p style=\"text-align: justify;\">Cả căn nh&agrave; được trang tr&iacute; Halloween th&igrave; đương nhi&ecirc;n nh&agrave; vệ sinh cũng kh&ocirc;ng thể ngoại lệ.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Bộ rèm tắm, giá treo, khăn mặt, thậm chí... giấy vệ sinh cũng được in hình bí ngô.\" src=\"http://giadinh.mediacdn.vn/2017/photo-12-1509441583299.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Bộ r&egrave;m tắm, gi&aacute; treo, khăn mặt, thậm ch&iacute;... giấy vệ sinh cũng được in h&igrave;nh b&iacute; ng&ocirc;.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/2017/photo-13-1509441583301.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Chắc chắn bạn sẽ giật mình khi vào nhà vệ sinh và nhìn thấy những giá treo cuộn giấy vệ sinh hình zombie hay đầu lâu như thế này.\" src=\"http://giadinh.mediacdn.vn/2017/photo-14-1509441583303.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Chắc chắn bạn sẽ giật m&igrave;nh khi v&agrave;o nh&agrave; vệ sinh v&agrave; nh&igrave;n thấy những gi&aacute; treo cuộn giấy vệ sinh h&igrave;nh zombie hay đầu l&acirc;u như thế n&agrave;y.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/2017/photo-15-1509441583305.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/2017/photo-16-1509441583308.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Những thiết kế bồn cầu dọa người dùng như thế này được khá nhiều người thích thú.\" src=\"http://giadinh.mediacdn.vn/2017/photo-17-1509441583310.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Những thiết kế bồn cầu dọa người d&ugrave;ng như thế n&agrave;y được kh&aacute; nhiều người th&iacute;ch th&uacute;.</p>\r\n',''),(105,165,'vi','10 thiết kế tủ lưu trữ giúp bạn chứa cả thế giới chai lọ lỉnh kỉnh trong phòng bếp','<p style=\"text-align: justify;\">Một số đồ nội thất c&oacute; thể tạo ra sự kh&aacute;c biệt lớn cho cả kh&ocirc;ng gian nếu bạn sử dụng ch&uacute;ng. V&agrave; tr&ecirc;n hết, những thiết kế tủ lưu trữ dưới đ&acirc;y c&ograve;n gi&uacute;p bạn được nhiều hơn thế nữa.</p>\r\n','<p style=\"text-align: justify;\">Hầu hết mọi người đều cố gắng nh&eacute;t thật nhiều đồ hộp, chai lọ v&agrave; c&aacute;c gia vị phục vụ sinh hoạt h&agrave;ng ng&agrave;y của gia đ&igrave;nh v&agrave;o nh&agrave; bếp. Nơi mọi thứ đổ dồn về sẽ thật l&agrave; khủng khiếp. Đối với những ng&ocirc;i nh&agrave; c&oacute; diện t&iacute;ch nhỏ nữa th&igrave; quả l&agrave; một nỗi &aacute;m ảnh. Cần c&oacute; những giải ph&aacute;p lưu giữ v&agrave; quy hoạch đồ hộp n&agrave;y một c&aacute;ch khoa học chứ. Đ&oacute; l&agrave; điều tất nhi&ecirc;n, v&agrave; những mẫu thiết kế tủ lưu trữ cỡ lớn với chức năng v&agrave; nhiệm vụ lưu trữ đồ hộp lỉnh kỉnh đ&atilde; ra đời như thế đấy.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-0-1505207980163.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">1. Với một g&oacute;c nh&agrave; bếp đủ rộng để đặt tủ th&igrave; bạn n&ecirc;n tận dụng n&oacute;. Một ch&uacute;t kh&eacute;o l&eacute;o trong việc sắp xếp c&aacute;c đồ hộp l&agrave; bạn đ&atilde; sở hữu một kh&ocirc;ng gian lưu trữ ho&agrave;n hảo rồi. V&agrave; bạn thấy đấy, mặt b&agrave;n hay bệ bếp ga đ&atilde; ho&agrave;n to&agrave;n sạch sẽ, s&aacute;ng b&oacute;ng nhờ chiếc tủ hữu &iacute;ch n&agrave;y.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-1-1505207980157.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">2. Cứ thử tưởng tượng cả đống chai lọ, hộp t&uacute;i đựng thức ăn n&agrave;y m&agrave; nằm tr&ecirc;n kệ hoặc mặt b&agrave;n bếp th&igrave; n&oacute; sẽ lộn nhộn đến mức n&agrave;o. C&aacute;c thứ sau mỗi lần sử dụng sẽ bị vứt lộn xộn v&agrave; bừa b&atilde;i lung tung l&agrave;m bạn ph&aacute;t đi&ecirc;n l&ecirc;n mỗi lần nh&igrave;n thấy.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-2-1505207980166.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">3. Tuy nhi&ecirc;n nhờ c&oacute; tủ cỡ lớn lưu trữ th&igrave; vấn đề đ&atilde; được giải quyết dứt điểm rồi. Chỉ cần k&eacute;o nhẹ tay cầm l&agrave; đồ d&ugrave;ng hiện ra trước mắt bạn. Chỉ việc lấy v&agrave; sử dụng ch&uacute;ng nữa th&ocirc;i. Việc cất gọn những đồ d&ugrave;ng n&agrave;y sẽ trở th&agrave;nh th&oacute;i quen ngay th&ocirc;i, nếu bạn thực hiện thao t&aacute;c lặp lại 2, 3 lần.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-3-1505207980162.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">4. Nếu tủ được t&iacute;ch hợp ngay dưới b&agrave;n bếp th&igrave; c&ograve;n tuyệt vời hơn nữa. Với chức năng k&eacute;o v&agrave; trượt ra th&igrave; những kệ lưu trữ trong tủ n&agrave;y sẽ gi&uacute;p &iacute;ch v&agrave; tiết kiệm thời gian lấy đồ cho bạn kh&aacute; nhiều đấy.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-4-1505207980167.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">5. Một &yacute; tưởng lưu trữ tủ t&iacute;ch hợp dưới ch&acirc;n cầu thang kh&aacute; s&aacute;ng tạo v&agrave; th&uacute; vị. Những đồ hộp kh&ocirc;ng thường xuy&ecirc;n sử dụng, hay những hũ ng&acirc;m hoa quả uống, rượu cốt bạn đều c&oacute; thể đặt tại tủ n&agrave;y. N&oacute; cũng được xem như một hầm lưu trữ dạng mini m&agrave; những ng&ocirc;i nh&agrave; hiện đại ng&agrave;y nay thường sử dụng.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-5-1505207980160.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">6. Một ch&uacute;t chất liệu inox sẽ l&agrave;m tủ nh&agrave; bạn s&aacute;ng b&oacute;ng đi theo phong c&aacute;ch hiện đại v&agrave; c&ocirc;ng nghiệp. Những đồ thủy tinh sẽ rất th&iacute;ch hợp để lưu trữ trong chiếc tủ như thế n&agrave;y.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-6-1505207980169.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">7. C&oacute; gi&aacute;, c&oacute; kệ v&agrave; chia ngăn khoa học ch&iacute;nh l&agrave; điểm mạnh của mẫu tủ n&agrave;y. Khi đặt ch&uacute;ng trong nh&agrave; bếp tự nhi&ecirc;n bạn sẽ cảm nhận như m&igrave;nh đang sở hữu một quầy bar thật sự vậy.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-7-1505207980168.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">8. Từ đồ hộp nhỏ nhắn đến chai lọ cỡ lớn nếu sắp xếp khoa học trong chiếc tủ n&agrave;y th&igrave; con số lưu trữ được c&oacute; thể l&agrave;m bạn ngạc nhi&ecirc;n lắm đ&acirc;y.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"9. Các khung sắt thoáng và rỗng giúp bạn lưu trữ thêm cả những đồ ăn như khoai, bí đỏ … để tích trữ lâu dài.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-8-1505207980171.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">9. C&aacute;c khung sắt tho&aacute;ng v&agrave; rỗng gi&uacute;p bạn lưu trữ th&ecirc;m cả những đồ ăn như khoai, b&iacute; đỏ &hellip; để t&iacute;ch trữ l&acirc;u d&agrave;i.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"10. Và cả các loại bát đĩa nhiều như thế này nữa. Cất chúng vào tủ gọn gàng, chờ dịp cần dùng tới và để cho bệ bếp sạch sẽ đến sáng bóng như thế này.\" src=\"http://giadinh.mediacdn.vn/thumb_w/640/2017/photo-9-1505207980173.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">10. V&agrave; cả c&aacute;c loại b&aacute;t đĩa nhiều như thế n&agrave;y nữa. Cất ch&uacute;ng v&agrave;o tủ gọn g&agrave;ng, chờ dịp cần d&ugrave;ng tới v&agrave; để cho bệ bếp sạch sẽ đến s&aacute;ng b&oacute;ng như thế n&agrave;y.</p>\r\n',''),(106,166,'vi','Nhìn là muốn mua ngay những món đồ nội thất cực chất mà tiện dụng này','<p>Nếu bạn th&iacute;ch nu&ocirc;i những ch&uacute; c&aacute; b&eacute; xinh trong căn nh&agrave;, h&atilde;y tận dụng ngay chiếc tivi đen trắng thời &quot;&ocirc;ng b&agrave; anh&quot; để nu&ocirc;i nh&eacute;!</p>\r\n','<p style=\"text-align: justify;\">Kh&ocirc;ng chỉ l&agrave; s&aacute;ng tạo trong thiết kế nội thất, ph&ograve;ng ốc, đ&ocirc;i khi, những vật dụng nhỏ trong căn nh&agrave; như b&agrave;n tr&agrave;, ghế, gi&aacute; s&aacute;ch, đồng hồ, đ&egrave;n trần cũng c&oacute; thể biến tấu đầy mới lạ khiến căn nh&agrave; trở n&ecirc;n nổi bật hơn. H&atilde;y c&ugrave;ng &quot;ngh&iacute;a&quot; qua 12 &yacute; tưởng s&aacute;ng tạo với vật dụng trong nh&agrave; cực độc đ&aacute;o dưới đ&acirc;y nh&eacute;!</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Giá tưới cây chắc hẳn ý tưởng sáng tạo dễ thương từ một người yêu cây đãng trí. Một cách làm cực hay ho giúp bạn tưới cây ngay cả khi vắng nhà nhé!\" src=\"http://giadinh.mediacdn.vn/2017/photo-0-1505456177609.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Gi&aacute; tưới c&acirc;y chắc hẳn &yacute; tưởng s&aacute;ng tạo dễ thương từ một người y&ecirc;u c&acirc;y &quot;đ&atilde;ng tr&iacute;&quot;. Một c&aacute;ch l&agrave;m cực hay ho gi&uacute;p bạn tưới c&acirc;y ngay cả khi vắng nh&agrave; nh&eacute;!</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Một chiếc đèn trần đẹp lung linh đến nhường này, liệu bạn có biết rằng nó được làm từ những thứ tưởng chừng rất khô khan như...bàn phím máy tính cũ?\" src=\"http://giadinh.mediacdn.vn/2017/photo-1-1505456177611.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Một chiếc đ&egrave;n trần đẹp lung linh đến nhường n&agrave;y, liệu bạn c&oacute; biết rằng n&oacute; được l&agrave;m từ những thứ tưởng chừng rất kh&ocirc; khan như...b&agrave;n ph&iacute;m m&aacute;y t&iacute;nh cũ?</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Còn chiếc đèn trần này chắc chắn sẽ là món đồ hot nhất cho mùa Halloween năm nay với khả năng hô biến căn phòng của bạn thành một khu rừng trong nháy mắt!\" src=\"http://giadinh.mediacdn.vn/2017/photo-2-1505456177613.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">C&ograve;n chiếc đ&egrave;n trần n&agrave;y chắc chắn sẽ l&agrave; m&oacute;n đồ &quot;hot&quot; nhất cho m&ugrave;a Halloween năm nay với khả năng h&ocirc; biến căn ph&ograve;ng của bạn th&agrave;nh một khu rừng trong nh&aacute;y mắt!</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Một phong cách đèn khác cho người yêu thích những chiếc mũ!\" src=\"http://giadinh.mediacdn.vn/2017/photo-3-1505456177614.jpeg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Một phong c&aacute;ch đ&egrave;n kh&aacute;c cho người y&ecirc;u th&iacute;ch những chiếc mũ!</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Nếu bạn cần không gian lãng mạn hơn, hãy sử dụng ánh sáng nến từ những... bóng đèn nhé!\" src=\"http://giadinh.mediacdn.vn/2017/photo-4-1505456177616.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Nếu bạn cần kh&ocirc;ng gian l&atilde;ng mạn hơn, h&atilde;y sử dụng &aacute;nh s&aacute;ng nến từ những... b&oacute;ng đ&egrave;n nh&eacute;!</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Sao bạn không tận dụng bàn trà để biến thành...bàn rượu nhỉ?\" src=\"http://giadinh.mediacdn.vn/2017/photo-5-1505456177619.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Sao bạn kh&ocirc;ng tận dụng b&agrave;n tr&agrave; để biến th&agrave;nh...b&agrave;n rượu nhỉ?</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Mẫu bàn trà kết hợp chậu lan chính là thứ đồ nội thất sáng tạo mà chắc chắn ai cũng muốn mua về nhà.\" src=\"http://giadinh.mediacdn.vn/2017/photo-6-1505456177621.jpeg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Mẫu b&agrave;n tr&agrave; kết hợp chậu lan ch&iacute;nh l&agrave; thứ đồ nội thất s&aacute;ng tạo m&agrave; chắc chắn ai cũng muốn mua về nh&agrave;.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Chiếc bàn này lại mang màu sắc trẻ trung với phong cách độc lạ như bị chảy sơn, chắc chắn sẽ khiến tất cả khách đến nhà phải tròn mắt ngạc nhiên!\" src=\"http://giadinh.mediacdn.vn/2017/photo-7-1505456177623.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Chiếc b&agrave;n n&agrave;y lại mang m&agrave;u sắc trẻ trung với phong c&aacute;ch độc lạ như bị chảy sơn, chắc chắn sẽ khiến tất cả kh&aacute;ch đến nh&agrave; phải tr&ograve;n mắt ngạc nhi&ecirc;n!</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Một chiếc sofa cá tính từ bồn tắm cũ, tại sao lại không nhỉ?\" src=\"http://giadinh.mediacdn.vn/2017/photo-8-1505456177625.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Một chiếc sofa c&aacute; t&iacute;nh từ bồn tắm cũ, tại sao lại kh&ocirc;ng nhỉ?</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Nếu bạn đang thiếu chỗ để sách nhưng còn thừa một chiếc thang cũ, tại sao lại không thử kết hợp lại với nhau? Một giá sách làm từ thang cũ sẽ mang lại diện mạo mới mẻ cho căn phòng của bạn!\" src=\"http://giadinh.mediacdn.vn/2017/photo-9-1505456177626.jpeg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Nếu bạn đang thiếu chỗ để s&aacute;ch nhưng c&ograve;n thừa một chiếc thang cũ, tại sao lại kh&ocirc;ng thử kết hợp lại với nhau? Một gi&aacute; s&aacute;ch l&agrave;m từ thang cũ sẽ mang lại diện mạo mới mẻ cho căn ph&ograve;ng của bạn!</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Nếu bạn không có thang, mà có cả một cây đàn piano cũ? Không sao, chúng ta cũng có thể tạo ra một giá sách cực ngầu!\" src=\"http://giadinh.mediacdn.vn/2017/photo-10-1505456177628.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Nếu bạn kh&ocirc;ng c&oacute; thang, m&agrave; c&oacute; cả một c&acirc;y đ&agrave;n piano cũ? Kh&ocirc;ng sao, ch&uacute;ng ta cũng c&oacute; thể tạo ra một gi&aacute; s&aacute;ch cực ngầu!</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Đồng hồ treo tường bằng bánh xe đạp chắc chắn sẽ là thứ đồ cá tính vô cùng trong căn nhà của bạn.\" src=\"http://giadinh.mediacdn.vn/2017/photo-11-1505456177629.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Đồng hồ treo tường bằng b&aacute;nh xe đạp chắc chắn sẽ l&agrave; thứ đồ c&aacute; t&iacute;nh v&ocirc; c&ugrave;ng trong căn nh&agrave; của bạn.</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Nét như...tivi bể cá! Nếu bạn yêu thích những chú cá bé xinh trong căn nhà, hãy tận dụng chiếc tivi đen trắng thời ông bà anh để nuôi cá nhé!\" src=\"http://giadinh.mediacdn.vn/2017/photo-12-1505456177631.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">N&eacute;t như...tivi &quot;bể c&aacute;&quot;! Nếu bạn y&ecirc;u th&iacute;ch những ch&uacute; c&aacute; b&eacute; xinh trong căn nh&agrave;, h&atilde;y tận dụng chiếc tivi đen trắng thời &quot;&ocirc;ng b&agrave; anh&quot; để nu&ocirc;i c&aacute; nh&eacute;!</p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Một ý tưởng sáng tạo dành cho nhà vệ sinh, vừa đẹp, mà lại vừa hữu ích. Thế này thì chắc chắn không lo thiếu giấy vệ sinh dùng nữa rồi!\" src=\"http://giadinh.mediacdn.vn/2017/photo-13-1505456177634.jpg\" /></p>\r\n\r\n<p style=\"text-align: center;\">Một &yacute; tưởng s&aacute;ng tạo d&agrave;nh cho nh&agrave; vệ sinh, vừa đẹp, m&agrave; lại vừa hữu &iacute;ch. Thế n&agrave;y th&igrave; chắc chắn kh&ocirc;ng lo thiếu giấy vệ sinh d&ugrave;ng nữa rồi!</p>\r\n',''),(107,167,'vi','Thiết kế nội thất phong cách Pháp phổ biến','<p>Kh&ocirc;ng gian Scandinavian&nbsp;của ch&uacute;ng t&ocirc;i dựa tr&ecirc;n m&agrave;u x&aacute;m s&aacute;ng ch&oacute;i để mang lại sự độc t&ocirc;n m&agrave;u sắc. Kh&ocirc;ng c&oacute; nơi n&agrave;o được minh hoạ r&otilde; hơn so với s&aacute;u khung h&igrave;nh ph&ograve;ng kh&aacute;ch, một sự tổng hợp c&aacute;c sự nhẹ nh&agrave;ng c&aacute;c m&agrave;u sắc v&agrave; minh họa kh&aacute;c nhau trong nghệ thuật của họ.</p>\r\n','<h3 style=\"text-align: justify;\">Kh&ocirc;ng gian Scandinavian&nbsp;của ch&uacute;ng t&ocirc;i dựa tr&ecirc;n m&agrave;u x&aacute;m s&aacute;ng ch&oacute;i để mang lại sự độc t&ocirc;n m&agrave;u sắc. Kh&ocirc;ng c&oacute; nơi n&agrave;o được minh hoạ r&otilde; hơn so với s&aacute;u khung h&igrave;nh ph&ograve;ng kh&aacute;ch, một sự tổng hợp c&aacute;c sự nhẹ nh&agrave;ng c&aacute;c m&agrave;u sắc v&agrave; minh họa kh&aacute;c nhau trong nghệ thuật của họ.&nbsp;Thiết kế nội thất&nbsp;sẽ thể hiện những g&igrave; m&agrave; c&aacute; t&iacute;nh gia chủ lu&ocirc;n muốn giữ cho ri&ecirc;ng m&igrave;nh.</h3>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-1.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Một tấm thảm m&agrave;u x&aacute;m lụa v&acirc;y cảnh, một chiếc ghế sofa da trắng v&agrave; những chiếc b&agrave;n ph&ugrave; hợp giữ hoa hồng dưới những bong b&oacute;ng thủy tinh.<br />\r\nKh&ocirc;ng gian mở ra cho thấy một l&ograve; sưởi bằng gốm v&agrave; bếp x&aacute;m với năm ch&ugrave;m đ&egrave;n ch&ugrave;m m&agrave;u trắng. Hai chiếc ghế da m&agrave;u n&acirc;u thu hẹp lại kh&ocirc;ng gian, nổi bật l&ecirc;n những bức khinh kh&iacute; cầu khổng lồ được treo tr&ecirc;n tường ph&iacute;a sau.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-2.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-3.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Ba cửa số cung cấp &aacute;nh s&aacute;ng tự nhi&ecirc;n thuộc phong c&aacute;ch hiện đại len lỏi trong khung cảnh.&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-4.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Sự kết hợp giữa&nbsp;m&agrave;u x&aacute;m với m&aacute;y l&agrave;m bằng gỗ trắng. Ch&uacute;ng được trải d&agrave;i tại&nbsp;khu ăn uống v&agrave; sảnh kh&aacute;ch.&nbsp;<br />\r\nC&aacute;c đường gờ bằng t&ocirc;n mộc đẹp đẽ mang lại cảm gi&aacute;c Phục hưng Ph&aacute;p, ch&uacute;ng được nh&acirc;n đ&ocirc;i bằng gương cổ m&agrave;u đen ở lối v&agrave;o.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-5.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">C&aacute;c ph&ograve;ng ăn v&agrave; nh&agrave; bếp tạo ra th&ecirc;m một kiểu&nbsp;Scandinavia kh&aacute;c. Sau bếp l&agrave; một v&aacute;ch tường được gia cố c&ocirc;ng phu như một chỗ dựa vững chắc.<br />\r\nNhững chiếc ghế gỗ m&agrave;u đen cao, ngồi quanh một chiếc b&agrave;n x&aacute;m x&aacute;m. Kề những tủ gỗ 3 ngăn tiện &iacute;ch c&ugrave;ng những phụ kiện bếp được l&agrave;m từ nhiều vật liệu như crom mạ, đồng , thiếc ...</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-6.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-7.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-8.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-9.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-10.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Kh&ocirc;ng gian h&agrave;nh lang của n&oacute; được l&agrave;m s&aacute;ng bởi sơn m&agrave;u x&aacute;m v&agrave; đồ gỗ trắng, b&ecirc;n cạnh gi&aacute; đỡ tường nhỏ m&agrave;u trắng v&agrave; một c&aacute;i giường ph&ugrave; hợp.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-11.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Kết hợp th&ecirc;m ấm &aacute;p v&agrave;o những m&ugrave;a lạnh l&agrave; một l&ograve; sưởi đơn giản c&ugrave;ng ống kh&oacute;i khắc điệu Scanavian.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-12.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-13.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-14.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Ph&ograve;ng ngủ ch&iacute;nh cung cấp một nơi đẹp để thư gi&atilde;n. C&aacute;c bức tường đ&uacute;c bằng v&ocirc;i v&agrave; tủ đựng đồ chơi với m&agrave;u trắng, x&aacute;m v&agrave; m&agrave;u n&acirc;u sẫm tr&ecirc;n giường.&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-15.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-16.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-phap-pho-bien-17.jpg\" /></p>\r\n',''),(108,168,'vi','Phong cách Scandinavian tinh tế trong thiết kế nội thất','<p>Kh&ocirc;ng gian Scandinavia tạo ra một c&aacute;ch thể hiện với một s&agrave;n gỗ m&agrave;u x&aacute;m mở rộng qua c&aacute;c ph&ograve;ng của n&oacute;. Được bao quanh bởi c&aacute;c bức tường trắng v&agrave; tủ bếp m&agrave;u x&aacute;m. Kh&ocirc;ng gian sống ch&iacute;nh dao động giữa m&agrave;u x&aacute;m, trắng, xen kẽ x&aacute;m v&agrave; trắng</p>\r\n','<p style=\"text-align: justify;\">Kh&ocirc;ng gian Scandinavia của ch&uacute;ng t&ocirc;i l&agrave; một kh&ocirc;ng gian thể hiện&nbsp;với một s&agrave;n gỗ m&agrave;u x&aacute;m mở rộng th&ocirc;ng qua c&aacute;c ph&ograve;ng của n&oacute;.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-2.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Được bao quanh bởi c&aacute;c bức tường trắng v&agrave; tủ bếp m&agrave;u x&aacute;m. Kh&ocirc;ng gian sống ch&iacute;nh dao động giữa m&agrave;u x&aacute;m, trắng, x&aacute;m v&agrave; trắng trong một tấm thảm trải giường, ghế x&aacute;m v&agrave; đệm.&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-3.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">C&aacute;c t&iacute;nh năng m&agrave;u sắc bật ra lu&acirc;n phi&ecirc;n, trong c&aacute;c bảng m&agrave;u trắng được đ&oacute;ng khung bằng v&agrave;ng v&agrave; một sự phối hợp&nbsp;của đ&egrave;n với c&aacute;c m&agrave;u kh&aacute;c nhau.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-4.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Một v&agrave;i c&acirc;y trồng trong chậu th&ecirc;m kh&ocirc;ng gian xanh cho căn ph&ograve;ng tươi m&aacute;t. Một c&aacute;i đ&egrave;n treo lơ lửng h&igrave;nh khối cầu với t&ocirc;ng m&agrave;u sẫm tương phản rất bắt mắt.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-5.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-6.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-7.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Hướng nh&igrave;n v&agrave;o ph&ograve;ng ngủ, một bức tường cửa sổ được ph&acirc;n chia đều đặn. K&egrave;m theo đ&oacute; l&agrave; một cửa k&eacute;o k&iacute;nh đi k&egrave;m với độ bền rất cao nhờ c&aacute;c thanh trượt cao cấp. Đ&oacute; l&agrave; một nghệ thuật lấy từ đất nước Nhật Bản được &aacute;p dụng tại biệt thự n&agrave;y.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-8.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Bức tường k&iacute;nh đ&oacute; g&oacute;p phần mang lại &aacute;nh s&aacute;ng tự nhi&ecirc;n b&ecirc;n ngo&agrave;i v&agrave;o thẳng ph&ograve;ng ngủ tự nhi&ecirc;n nhất. Được bổ sung &aacute;nh s&aacute;ng nhờ một chiếc đ&egrave;n lồng bật khi ngủ v&agrave;o ban đ&ecirc;m, gi&uacute;p căn ph&ograve;ng kh&ocirc;ng thiếu s&aacute;ng.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-9.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-10.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">V&agrave;ng ấm của b&agrave;n&nbsp;ăn l&agrave;m tăng th&ecirc;m sự ấm &aacute;p cho nh&agrave; bếp. Trong một bức tường m&agrave;u x&aacute;m với c&aacute;c thiết bị b&oacute;ng bẩy bằng v&agrave;ng. Đ&oacute; ch&iacute;nh l&agrave; sự ấn tượng đầu ti&ecirc;n khi quan s&aacute;t kh&ocirc;ng gian n&agrave;y.<br />\r\nKế b&ecirc;n l&agrave; một chiếc b&agrave;n xếp m&agrave;u sẫm bổ sung diện t&iacute;ch ăn khi nh&agrave; c&oacute; kh&aacute;ch.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that-11.jpg\" /></p>\r\n',''),(109,169,'vi','Thiết kế nội thất phòng khách biệt thự sang trọng','<p>Đầu ti&ecirc;n sử dụng một v&agrave;i mảng h&igrave;nh ri&ecirc;ng vững chắc để diễn tả một phong c&aacute;ch c&aacute; nh&acirc;n. Ph&ograve;ng kh&aacute;ch sử dụng c&aacute;c t&aacute;c phẩm đi&ecirc;u khắc để nhấn mạnh chủ đề h&igrave;nh học tinh vi của n&oacute;.&nbsp;</p>\r\n','<p style=\"text-align: justify;\">Ng&ocirc;i nh&agrave; tuyệt vời n&agrave;y tạo ra một t&aacute;c động đ&aacute;ng kinh ngạc với m&agrave;u sắc tối. Một bảng m&agrave;u sắc phong ph&uacute; bằng đất với t&ocirc;ng m&agrave;u x&aacute;m nhạt.&nbsp;<br />\r\nThẩm mỹ của căn ph&ograve;ng cho ta cảm thấy phong c&aacute;ch cổ điển tr&agrave;n ngập cả ph&ograve;ng .&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-khach-biet-thu-sang-trong-2.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Trang tr&iacute; th&ecirc;m v&agrave;i kh&ocirc;ng gian xanh gồm nhiều chậu c&acirc;y cối nhỏ gần cửa sổ.<br />\r\nMột bộ sưu tập c&aacute;c bức tranh sơn dầu đ&aacute;nh bật phong c&aacute;ch gia chủ l&ecirc;n r&otilde; r&agrave;ng hơn.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-khach-biet-thu-sang-trong-3.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">C&aacute;c tấm xi măng tạo th&agrave;nh một bối cảnh trung lập tốt đẹp cho nghệ thuật.&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-khach-biet-thu-sang-trong-4.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">V&aacute;n gỗ ngo&agrave;i trời mang lại cho nh&agrave; bếp một cảm gi&aacute;c rất th&acirc;n mật, cực kỳ sang trọng .Kết hợp với quầy bar đ&aacute; cẩm thạch tạo n&ecirc;n một bức tranh tuyệt đẹp.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-khach-biet-thu-sang-trong-5.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Đ&acirc;y l&agrave; một g&oacute;c tuyệt vời để so s&aacute;nh nhiều loại gỗ được sử dụng tr&ecirc;n trần nh&agrave;, s&agrave;n nh&agrave;, tủ v&agrave; tường. Mỗi loại n&oacute;i l&ecirc;n một n&eacute;t đặc trưng kh&aacute;c nhau, h&ograve;a quyện v&agrave;o nhau sẽ như thế n&agrave;o ?</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-khach-biet-thu-sang-trong-6.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Một kh&ocirc;ng gian ăn uống ch&iacute;nh thức nằm giữa ph&ograve;ng kh&aacute;ch v&agrave; nh&agrave; bếp.&nbsp;<a href=\"http://noithatangel.com/\">Thiết kế nội thất</a>&nbsp;để ho&agrave;n thiện như h&igrave;nh l&agrave; một qu&aacute; tr&igrave;nh kh&aacute; c&ocirc;ng phu v&agrave; tốn thời gian.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-khach-biet-thu-sang-trong-7.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Tất cả c&aacute;c đ&egrave;n mặt d&acirc;y chuyền bằng gỗ đều do c&ocirc;ng ty thiết kế theo kiểu Phần Lan. C&aacute;c đ&egrave;n b&ecirc;n tr&aacute;i l&agrave; m&ocirc; h&igrave;nh Octo.</p>\r\n',''),(110,170,'vi','Phong cách nhiệt đới một thiết kế nội thất phòng ngủ.','<p>Trong một kh&ocirc;ng gian ph&ograve;ng ngủ, ta c&oacute; thể kết hợp cả một l&uacute;c cả hai phong c&aacute;ch. Ph&ograve;ng ngủ phong c&aacute;ch nhiệt đới c&ugrave;ng với bộ lạc như mang bạn đến một thế giới lạ. Nơi bạn c&oacute; thể h&ograve;a m&igrave;nh với thi&ecirc;n nhi&ecirc;n v&agrave; đ&aacute;nh một giấc l&yacute; tưởng.</p>\r\n','<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-co-dien-6.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Nh&igrave;n v&agrave;o đ&atilde; thấy được kh&ocirc;ng gian được ph&acirc;n đoạn th&ocirc;ng qua c&aacute;ch chơi s&agrave;n gỗ đơn giản. Trong ph&ograve;ng ngủ, một khung bốn h&igrave;nh treo với m&agrave;u n&acirc;u v&agrave; trắng d&agrave;nh cho phong c&aacute;ch bộ lạc. R&egrave;m&nbsp;trắng treo ở tr&ecirc;n&nbsp;theo c&aacute;ch bố tr&iacute; của những vị vua ch&uacute;a ng&agrave;y xưa.<br />\r\nTrong khi những chiếc l&aacute; xanh tươi m&aacute;t mẻ b&ecirc;n ngo&agrave;i, khung v&aacute;n tạo m&agrave;u đen l&agrave;m cho căn ph&ograve;ng trở n&ecirc;n hiện đại. Một ngọn đ&egrave;n hổ ph&aacute;ch rực rỡ, họa tiết trang tr&iacute;&nbsp;bằng gỗ v&agrave; đ&egrave;n sưởi đang h&uacute;t l&ograve;ng người&nbsp;tr&ecirc;n tủ gỗ truyền thống.</p>\r\n\r\n<p style=\"text-align: justify;\"><br />\r\n<strong>Bể bơi &quot; khi&ecirc;m tốn &quot; cho că ph&ograve;ng.</strong></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-co-dien-7.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Kh&ocirc;ng gian bước v&agrave;o khu vực bể bơi, được hiện đại h&oacute;a bằng c&aacute;c phụ kiện l&agrave;m bằng Crom rất bền . Được trang tr&iacute; bằng bức tường bằng m&iacute;a, c&aacute;c chậu bằng đất nung được sơn m&agrave;u n&acirc;u. Một v&ograve;i hoa sen cố định cung cấp một kh&ocirc;ng gian kh&aacute;c khi tắm.&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-co-dien-8.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-co-dien-9.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-co-dien-10.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Ngo&agrave;i trời đ&oacute;ng một phần lớn trong thiết kế, th&ocirc;ng qua c&aacute;c cửa sổ lớn khung m&agrave;u đen. Nh&igrave;n v&agrave;o nh&agrave; vệ sinh, b&ecirc;n ngo&agrave;i m&agrave;u xanh l&aacute; c&acirc;y phản &aacute;nh ngọc b&iacute;ch b&ecirc;n trong. Từ nh&agrave; vệ sinh, một gương h&igrave;nh bầu dục tr&ecirc;n đ&aacute; granite m&agrave;u be xuất hiện như một cửa sổ kh&aacute;c.&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-co-dien-11.jpg\" /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-co-dien-12.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Q&uacute;a m&aacute;t cho một ph&ograve;ng tắm nhiệt đới.</strong></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://noithatangel.com/dtool/data/computer/web765/thiet-ke-noi-that-phong-cach-co-dien-13.jpg\" /></p>\r\n\r\n<p style=\"text-align: justify;\">Ph&ograve;ng vệ sinh &quot; tho&aacute;ng đ&atilde;ng&quot; , được trang tr&iacute; bằng một h&igrave;nh ảnh họa tiết bằng v&agrave;ng nằm phẳng tr&ecirc;n tường. Trong đ&oacute;, những nội thất ben trong chỉ l&agrave; những đơn giản tối thiểu c&ocirc;ng năng nhất. Nhưng cũng gọi l&agrave; kh&aacute; vừa đủ cho một kh&ocirc;ng gian &quot; m&aacute;t &quot; như thế n&agrave;y.</p>\r\n','');
/*!40000 ALTER TABLE `wb_post_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product`
--

DROP TABLE IF EXISTS `wb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `other_cat_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(14,2) DEFAULT '0.00',
  `quantity` int(11) DEFAULT '0',
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gallery` text COLLATE utf8_unicode_ci,
  `manufacturer_id` int(11) DEFAULT NULL,
  `in_stock` tinyint(1) DEFAULT '1',
  `view_count` int(11) DEFAULT '0',
  `sort_order` int(11) DEFAULT '0',
  `is_published` tinyint(1) DEFAULT '1',
  `published_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product`
--

LOCK TABLES `wb_product` WRITE;
/*!40000 ALTER TABLE `wb_product` DISABLE KEYS */;
INSERT INTO `wb_product` VALUES (205,'',8,NULL,31499000.00,0,'2017/12/04/615-mitssy-sinh-hoat-1.jpg','2017/12/04/269-mitssy-sinh-hoat-2-1.jpg,2017/12/04/615-mitssy-sinh-hoat-1.jpg',0,1,21,0,1,'2017-12-04 00:00:00','2017-12-04 16:00:31','2018-06-25 15:08:43'),(206,'',8,NULL,25999000.00,0,'2017/12/04/525-minimalism-01-1.jpg','',0,0,18,0,1,'2017-12-04 00:00:00','2017-12-04 16:07:58','2018-06-30 11:28:43'),(207,'',8,NULL,32500000.00,0,'2017/12/04/331-portsmouth.jpg','',0,1,13,0,1,'2017-12-04 00:00:00','2017-12-04 16:10:08','2018-06-25 15:12:02'),(208,'',8,NULL,29000000.00,0,'2017/12/04/402-malibu.jpg','',0,1,9,0,1,'2017-12-04 00:00:00','2017-12-04 16:13:36','2018-06-22 19:38:02'),(209,'',8,NULL,31000000.00,0,'2017/12/04/490-norway.jpg','',0,1,8,0,1,'2017-12-04 00:00:00','2017-12-04 16:14:43','2018-06-21 07:03:21'),(210,'',8,NULL,30000000.00,0,'2017/12/04/651-mid-century-linng-room-1-1-1.jpg','',0,1,13,0,1,'2017-12-04 00:00:00','2017-12-04 16:15:41','2018-06-26 10:35:15'),(211,'',9,NULL,4583000.00,0,'2018/03/01/718-k-s-ch-ayako-shirai-4.jpg','2018/03/01/448-k-s-ch-ayako-shirai-2.jpg,2018/03/01/279-k-s-ch-ayako-shirai-6.jpg,2018/03/01/718-k-s-ch-ayako-shirai-4.jpg,2018/03/01/645-k-s-ch-ayako-shirai-7.jpg,2018/03/01/104-k-s-ch-ayako-shirai-3.jpg,2018/03/01/157-272180.jpg',0,1,9,0,1,'2017-12-06 00:00:00','2017-12-06 10:55:17','2018-06-19 19:38:34'),(212,'',9,NULL,6593000.00,0,'2018/03/01/807-img02-2.jpg','2018/03/01/880-img07-1.jpg,2018/03/01/853-img04-2.jpg,2018/03/01/807-img02-2.jpg,2018/03/01/647-img01-2.jpg',0,1,9,0,1,'2017-12-06 00:00:00','2017-12-06 11:03:28','2018-06-29 04:01:32'),(214,'',9,NULL,3366000.00,0,'2017/12/06/489-tu-tivi-toshihiro.jpg','2017/12/06/489-tu-tivi-toshihiro.jpg,2018/03/01/234-71wezdtr9sl-sl1500.jpg',0,1,6,0,1,'2017-12-06 00:00:00','2017-12-06 11:09:02','2018-06-12 18:55:41'),(215,'',9,NULL,3870000.00,0,'2018/02/28/308-k-gi-y-d-p-kiyoshi-nh-shirai-4.jpg','2018/02/28/417-k-gi-y-d-p-kiyoshi-nh-shirai-8.jpg,2018/02/28/708-k-gi-y-d-p-kiyoshi-nh-shirai-3.jpg,2018/02/28/681-k-gi-y-d-p-kiyoshi-nh-shirai-2.jpg,2018/02/28/315-k-gi-y-d-p-kiyoshi-nh-shirai-7.jpg,2018/02/28/308-k-gi-y-d-p-kiyoshi-nh-shirai-4.jpg,2018/02/28/651-k-gi-y-d-p-kiyoshi-nh-shirai.jpg,2018/02/28/551-k-gi-y-d-p-kiyoshi-nh-shirai-6.jpg,2018/02/28/370-k-gi-y-d-p-kiyoshi-nh-shirai-9.jpg,2018/02/28/654-k-gi-y-d-p-kiyoshi-nh-shirai-5.jpg',0,1,2,1,1,'2018-02-28 00:00:00','2018-02-28 08:32:56','2018-06-19 20:45:28'),(217,'',13,NULL,4500000.00,0,'2018/02/28/54-randy.png','2018/02/28/880-randy-1.jpg,2018/02/28/699-randy.jpg,2018/02/28/54-randy.png',0,1,0,3,1,'2018-02-28 00:00:00','2018-02-28 09:04:13','2018-02-28 14:48:22'),(218,'',13,NULL,4325000.00,0,'2018/02/28/981-marvin-4.jpg','2018/02/28/669-marvin.jpg,2018/02/28/521-marvin-3.jpg,2018/02/28/101-marvin-1.jpg,2018/02/28/981-marvin-4.jpg,2018/02/28/891-mitssy-ban-marvin.jpg,2018/02/28/633-marvin-2-1.jpg',0,1,1,4,1,'2018-02-28 00:00:00','2018-02-28 09:08:27','2018-06-19 19:38:35'),(219,'',13,NULL,6000000.00,0,'2018/03/01/200-ban-tra-ma-vang-mat-da205.jpg','2018/03/01/852-26105652-1533736413407184-1101671622-n.jpg,2018/03/01/830-26102871-1535432199904272-1799696208-n.jpg,2018/03/01/25-ban-tra-ma-vang-mat-da2012.jpg,2018/03/01/467-ban-tra-ma-vang-mat-da207.jpg,2018/03/01/167-q5-600x519.jpg,2018/03/01/200-ban-tra-ma-vang-mat-da205.jpg',0,1,1,5,1,'0000-00-00 00:00:00','2018-02-28 10:04:03','2018-06-19 19:38:35'),(221,'',13,NULL,925000.00,0,'2018/02/28/702-lix-4052-3.jpg','2018/02/28/15-lix-4052-5.jpg,2018/02/28/702-lix-4052-3.jpg,2018/02/28/873-lix-4052-2.jpg,2018/02/28/278-lix-4052-1.jpg',0,1,1,6,1,'2018-02-28 00:00:00','2018-02-28 14:44:32','2018-05-26 16:07:28'),(222,'',13,NULL,3070000.00,0,'2018/02/28/328-ac-cd003-2.jpg','2018/02/28/977-ac-cd003-4.jpg,2018/02/28/179-ac-cd003-3.jpg,2018/02/28/328-ac-cd003-2.jpg,2018/02/28/799-ac-cd003-1.jpg,2018/02/28/782-ac-cd003.jpg',0,1,0,7,1,'2018-02-28 00:00:00','2018-02-28 14:51:15','2018-02-28 16:07:07'),(223,'',13,NULL,3100000.00,0,'2018/02/28/49-img-8175-1.jpg','2018/02/28/868-png-sp2b2-1.png,2018/02/28/882-untitled-1-1-2.png,2018/02/28/49-img-8175-1.jpg',0,1,1,8,1,'2018-02-28 00:00:00','2018-02-28 15:11:26','2018-06-19 19:38:35'),(224,'',13,'[]',2100000.00,0,'2018/03/01/31-ghe-luoi-cao-cap-gl318-48761-zoom.jpg','2018/03/01/31-ghe-luoi-cao-cap-gl318-48761-zoom.jpg',0,1,4,11,1,'2018-03-01 00:00:00','2018-03-01 08:27:53','2018-06-22 19:34:07'),(225,'',9,NULL,2000000.00,0,'2018/03/01/314-2739.jpg','2018/03/01/838-23954075-alt01.jpg,2018/03/01/726-alo-2793.jpg,2018/03/01/130-ke-sach-trang-2793-master.jpg,2018/03/01/314-2739.jpg',0,1,6,10,1,'2018-03-09 00:00:00','2018-03-01 11:00:36','2018-06-29 15:13:39');
/*!40000 ALTER TABLE `wb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_advanced_attribute`
--

DROP TABLE IF EXISTS `wb_product_advanced_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_advanced_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute` text COLLATE utf8_unicode_ci NOT NULL,
  `original_price` double(14,2) unsigned zerofill NOT NULL DEFAULT '00000000000.00',
  `sale_price` double(14,2) unsigned zerofill NOT NULL DEFAULT '00000000000.00',
  `gallery` text COLLATE utf8_unicode_ci,
  `in_stocks` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_advanced_attribute`
--

LOCK TABLES `wb_product_advanced_attribute` WRITE;
/*!40000 ALTER TABLE `wb_product_advanced_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_product_advanced_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_coupon`
--

DROP TABLE IF EXISTS `wb_product_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_id` (`coupon_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_coupon`
--

LOCK TABLES `wb_product_coupon` WRITE;
/*!40000 ALTER TABLE `wb_product_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_product_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_description`
--

DROP TABLE IF EXISTS `wb_product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `product_id` (`product_id`,`lang_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_description`
--

LOCK TABLES `wb_product_description` WRITE;
/*!40000 ALTER TABLE `wb_product_description` DISABLE KEYS */;
INSERT INTO `wb_product_description` VALUES (90,205,'vi','PHÒNG SINH HOẠT CHUNG ADELINE','<p>Để t&ugrave;y chỉnh v&agrave; ho&agrave;n thiện căn hộ của bạn theo set nội thất n&agrave;y, xin nhấn v&agrave;o n&uacute;t &quot;Li&ecirc;n hệ&quot; gặp&nbsp;trực tiếp với Home Stylist.</p>\r\n','<div class=\"col-sm-12\">\r\n<div class=\"gray_line_bg\" style=\" margin-top: 20px; \">\r\n<div style=\"text-align: center;\"><span style=\"font-size:16px;\"><strong>Sản phẩm trong set</strong></span></div>\r\n</div>\r\n\r\n<h1>1. SOFA MELISSA 3 CHỖ</h1>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://ahometo.s3.amazonaws.com/catalog/product/cache/1/image/1000x1000/9df78eab33525d08d6e5fb8d27136e95/i/m/img_4303.jpg\" /></p>\r\n\r\n<p>Mẫu ghế sofa với thiết kế hiện đại v&agrave; trang nh&atilde;, th&iacute;ch hợp cho cả nội thất nh&agrave; ở v&agrave; văn ph&ograve;ng.</p>\r\n\r\n<p>N&eacute;t đặc biệt ở Melissa l&agrave; ch&acirc;n đen cao tiện tr&ograve;n, h&agrave;ng n&uacute;t đơm tỉ mỉ c&ugrave;ng phần tay bo tr&ograve;n th&acirc;n ghế l&agrave;m n&ecirc;n một sofa Classic Mid-Century pha ch&uacute;t Contemporary.&nbsp;</p>\r\n\r\n<p>K&iacute;ch thước: W184 x D85 x H86cm</p>\r\n\r\n<h3 style=\"text-align: center;\">&nbsp; Gi&aacute; 10.240.000&nbsp;đ</h3>\r\n\r\n<h1>2. SOFA 1 CHỖ MELISSA</h1>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://ahometo.s3.amazonaws.com/catalog/product/cache/1/image/1000x1000/9df78eab33525d08d6e5fb8d27136e95/m/e/melissa-1-cho-1.jpg\" /></p>\r\n\r\n<p>Mẫu ghế sofa với thiết kế hiện đại v&agrave; trang nh&atilde;, th&iacute;ch hợp cho cả nội thất nh&agrave; ở v&agrave; văn ph&ograve;ng.</p>\r\n\r\n<p>N&eacute;t đặc biệt ở Melissa l&agrave; ch&acirc;n đen cao tiện tr&ograve;n, h&agrave;ng n&uacute;t đơm tỉ mỉ c&ugrave;ng phần tay bo tr&ograve;n th&acirc;n ghế l&agrave;m n&ecirc;n một sofa Classic Mid-Century pha ch&uacute;t Contemporary.&nbsp;</p>\r\n\r\n<p>K&iacute;ch thước: W184 x D85 x H86cm</p>\r\n\r\n<h3 style=\"text-align: center;\">&nbsp; Gi&aacute; 5.280.000&nbsp;đ</h3>\r\n\r\n<h1>3. B&Agrave;N SOFA MILAN</h1>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://ahometo.s3.amazonaws.com/catalog/product/cache/1/image/1000x1000/9df78eab33525d08d6e5fb8d27136e95/m/i/milan.png\" /></p>\r\n\r\n<p>Ch&acirc;n b&agrave;n l&agrave;m từ gỗ tự nhi&ecirc;n, mặt b&agrave;n MDF</p>\r\n\r\n<p>B&agrave;n sofa Milan nằm trong collection &quot;Functional&quot;, gồm c&aacute;c b&agrave;n: b&agrave;n tr&ograve;n Lux, b&agrave;n tr&ograve;n Mateo, b&agrave;n tr&ograve;n Harper, b&agrave;n tr&ograve;n Halley, b&agrave;n tr&ograve;n Fourcross. Thực tế như t&ecirc;n gọi &quot;Functional&quot;, tất cả sản phẩm trong collection đều nhắm tới y&ecirc;u cầu đề cao t&iacute;nh c&ocirc;ng năng, an t&ograve;an nhưng vẫn đảm bảo t&iacute;nh thẩm mỹ.</p>\r\n\r\n<p>Với kết cấu đơn giản, mọi b&agrave;n sofa trong bộ sưu tập đều c&oacute; mặt b&agrave;n v&aacute;t tr&ograve;n tạo sự mềm mại v&agrave; an to&agrave;n cho việc sử dụng sản phẩm. Điểm kh&aacute;c biệt của từng sản phẩm được thể hiện ở phần ch&acirc;n gỗ sồi chắc chắn. Mỗi ch&acirc;n mang một hiệu ứng thẩm mỹ kh&aacute;c nhau với những n&eacute;t nhấn thả ở cấu tr&uacute;c kh&aacute;c nhau.</p>\r\n\r\n<p>Sự kết hợp m&agrave;u sắc giữa m&agrave;u trắng mặt b&agrave;n với m&agrave;u gỗ tự nhi&ecirc;n ở ch&acirc;n cũng g&oacute;p phần cho tất cả b&agrave;n sofa trong collection &quot;Functional&quot; dễ được đ&oacute; nhận trong mọi kh&ocirc;ng gian.</p>\r\n\r\n<ul>\r\n	<li>Chất liệu: Solid oak, MDF lacquered</li>\r\n	<li>Sản phẩm đặt l&agrave;m, kh&ocirc;ng c&oacute; sẵn trong kho. Thời gian sản xuất: 10 -15 ng&agrave;y.</li>\r\n</ul>\r\n\r\n<p>K&iacute;ch thước: D600 x H342.25mm</p>\r\n\r\n<h3 style=\"text-align: center;\">&nbsp; Gi&aacute; 3.500.000&nbsp;đ</h3>\r\n\r\n<div class=\"price_display def\" final-price=\"10240000\" origin-price=\"10240000.0000\">\r\n<div class=\"price-box def\"><span id=\"product-price-7968\"> </span></div>\r\n</div>\r\n</div>\r\n',NULL),(91,206,'vi','PHÒNG KHÁCH SWEDISH','<p>Một g&oacute;c căn hộ Masteri 2 ph&ograve;ng ngủ với thiết kế tối giản mọi nội thất trong kh&ocirc;ng gian, đề cao t&iacute;nh c&ocirc;ng năng, ph&ugrave; hợp căn hộ c&oacute; diện t&iacute;ch nhỏ.</p>\r\n','<p>Để t&ugrave;y chỉnh v&agrave; ho&agrave;n thiện căn hộ của bạn theo &yacute; tưởng nội thất n&agrave;y, xin h&atilde;y nhấn v&agrave;o n&uacute;t &quot;Li&ecirc;n hệ&quot; để được n&oacute;i chuyện trực tiếp với Home Stylist.</p>\r\n',NULL),(92,207,'vi','PHÒNG KHÁCH PORTSMOUTH','<p>Để t&ugrave;y chỉnh v&agrave; ho&agrave;n thiện căn hộ của bạn theo set nội thất n&agrave;y, xin li&ecirc;n hệ&nbsp;trực tiếp với ch&uacute;ng t&ocirc;i qua n&uacute;t &quot;Li&ecirc;n hệ&quot;&nbsp;hay email support@imgroup.vn</p>\r\n','<p>Chuẩn ph&ograve;ng kh&aacute;ch Masteri, 2 ph&ograve;ng ngủ&nbsp;<br />\r\nDiện t&iacute;ch: 3.2m x 2.95m</p>\r\n',NULL),(93,208,'vi','PHÒNG KHÁCH MALIBU','<p>Để t&ugrave;y chỉnh v&agrave; ho&agrave;n thiện căn hộ của bạn theo set nội thất n&agrave;y, xin li&ecirc;n hệ&nbsp;trực tiếp với ch&uacute;ng t&ocirc;i qua n&uacute;t &quot;Li&ecirc;n hệ&quot;&nbsp;hay email support@imgroup.vn</p>\r\n','<p>Chuẩn ph&ograve;ng kh&aacute;ch Masteri, 2 ph&ograve;ng ngủ 72m2, t&ograve;a T1&nbsp;<br />\r\nDiện t&iacute;ch ph&ograve;ng kh&aacute;ch:5m x4m</p>\r\n\r\n<p style=\"text-align: center;\"><strong><span style=\"font-size:14px;\">Sản phẩm trong set</span></strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"padding: 8px; text-align: center;\"><strong><span style=\"font-size:14px;\">STT</span></strong></td>\r\n			<td style=\"padding: 8px; text-align: center;\"><strong><span style=\"font-size:14px;\">H&igrave;nh ảnh</span></strong></td>\r\n			<td style=\"padding: 8px; text-align: center;\"><strong><span style=\"font-size:14px;\">T&ecirc;n sản phẩm</span></strong></td>\r\n			<td style=\"padding: 8px; text-align: center;\"><strong><span style=\"font-size:14px;\">K&iacute;ch thước</span></strong></td>\r\n			<td style=\"padding: 8px; text-align: center;\"><strong><span style=\"font-size:14px;\">Số lượng</span></strong></td>\r\n			<td style=\"padding: 8px; text-align: center;\"><strong><span style=\"font-size:14px;\">Gi&aacute;</span></strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\"><span style=\"font-size:14px;\">1</span></td>\r\n			<td style=\"text-align: center;\"><span style=\"font-size:14px;\"><a data-hhref=\"\" href=\"\"><img alt=\"Thảm - Jasmine Leather Rug Grey\" src=\"https://ahometo.s3.amazonaws.com/catalog/product/cache/1/thumbnail/400x/9df78eab33525d08d6e5fb8d27136e95/a/c/ac-rug013a.jpg\" /></a></span></td>\r\n			<td style=\"text-align: center;\"><span style=\"font-size:14px;\"><a data-hhref=\"\" href=\"\">Thảm - Jasmine Leather Rug Grey</a></span></td>\r\n			<td style=\"text-align: center;\"><span style=\"font-size:14px;\">170x240cm</span></td>\r\n			<td style=\"text-align: center;\"><span style=\"font-size:14px;\">1</span></td>\r\n			<td style=\"text-align: center;\"><span style=\"font-size:14px;\">17.195</span>.000&nbsp;đ</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',NULL),(94,209,'vi','PHÒNG KHÁCH NORWAY','<p style=\"text-align: justify;\">Để t&ugrave;y chỉnh v&agrave; ho&agrave;n thiện căn hộ của bạn theo set nội thất n&agrave;y, xin li&ecirc;n hệ&nbsp;trực tiếp với ch&uacute;ng t&ocirc;i qua số điện thoại n&uacute;t &quot;Li&ecirc;n hệ&quot;&nbsp;hay email support@imgroup.vn</p>\r\n','<p>Chuẩn ph&ograve;ng kh&aacute;ch Masteri 2 ph&ograve;ng ngủ 71m2&nbsp;<br />\r\nDiện t&iacute;ch: 5m x4m</p>\r\n',NULL),(95,210,'vi','PHÒNG KHÁCH LEWERENTZ','<p>Để t&ugrave;y chỉnh v&agrave; ho&agrave;n thiện căn hộ của bạn theo set nội thất n&agrave;y, xin li&ecirc;n hệ&nbsp;trực tiếp với ch&uacute;ng t&ocirc;i qua n&uacute;t &quot;Li&ecirc;n hệ&quot;&nbsp;hay email support@imgroup.vn</p>\r\n','<p>Để t&ugrave;y chỉnh v&agrave; ho&agrave;n thiện căn hộ của bạn theo set nội thất n&agrave;y, xin li&ecirc;n hệ&nbsp;trực tiếp với ch&uacute;ng t&ocirc;i qua n&uacute;t &quot;Li&ecirc;n hệ&quot;&nbsp;hay email support@imgroup.vn</p>\r\n',NULL),(96,211,'vi','KỆ SÁCH AYAKO - SHIRAI','<p style=\"text-align: justify;\">Kệ s&aacute;ch Ayako l&agrave; sản phẩm được sản xuất từ c&ocirc;ng ty Nhật Bản Shirai. Tất cả c&aacute;c d&ograve;ng sản phẩm Shirai được thiết kế bởi những nh&agrave; thiết kế Nhật Bản gi&agrave;u kinh nghiệm v&agrave; được sản xuất theo d&acirc;y chuyền c&ocirc;ng nghệ hiện đại của Nhật Bản. Thiết kế th&ocirc;ng minh, tạo cho sản phẩm độ tiện dụng tối đa, gi&uacute;p tiết kiệm kh&ocirc;ng gian nhưng vẫn nổi bật v&agrave; thẩm mỹ khi đặt trong kh&ocirc;ng gian.</p>\r\n\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n','<p style=\"text-align: justify;\">Vật liệu :<strong> gỗ c&ocirc;ng nghiệp </strong>nhập khẩu MDF</p>\r\n\r\n<h3 style=\"text-align: justify;\">&bull; Chất liệu:</h3>\r\n\r\n<p style=\"text-align: justify;\">Gỗ c&ocirc;ng nghiệp MDF đ&atilde; qua xử l&yacute; với m&agrave;u gỗ tự nhi&ecirc;n bền đẹp, dễ d&agrave;ng lau ch&ugrave;i v&agrave; chống trầy xước. Tất cả gỗ được sử dụng đều đạt ti&ecirc;u chuẩn E1 với lượng formaldehyde thấp hơn 6-12 lần so với ti&ecirc;u chuẩn th&ocirc;ng thường. (Formaldehyde l&agrave; một hợp chất hữu cơ thường được d&ugrave;ng như một loại keo kết d&iacute;nh trong c&aacute;c sản phẩm nội thất gia đ&igrave;nh).&nbsp;Sản phẩm đạt chất lượng an to&agrave;n sức khoẻ theo ti&ecirc;u chuẩn Nhật Bản</p>\r\n\r\n<p style=\"text-align: justify;\">Sản phẩm sử dụng trong nh&agrave;, tr&aacute;nh ẩm ướt, &aacute;nh s&aacute;ng trực tiếp v&agrave; kh&ocirc;ng d&ugrave;ng chất tẩy rửa.</p>\r\n\r\n<h3 style=\"text-align: justify;\">&bull; Quy c&aacute;ch sản phẩm</h3>\r\n\r\n<p style=\"text-align: justify;\">K&iacute;ch thước &nbsp;:<br />\r\nD&agrave;i 75.2 cm x Rộng 28.4 cm x Cao147.3 cm<br />\r\nM&agrave;u sắc : m&agrave;u ch&iacute;nh gỗ tự &nbsp;nhi&ecirc;n</p>\r\n',NULL),(97,212,'vi','TỦ LƯU TRỮ FIERTÉ - NHỎ','<p style=\"text-align: justify;\">&quot;(La) Fiert&eacute;&quot; - tiếng Ph&aacute;p c&oacute; nghĩa l&agrave; Niềm tự h&agrave;o. Bộ sưu tập Fiert&eacute; l&agrave; c&aacute;c mẫu nội thất ấp ủ t&igrave;nh cảm v&agrave; tự h&agrave;o của những người con rất y&ecirc;u S&agrave;i G&ograve;n - &quot;H&ograve;n ngọc Viễn Đ&ocirc;ng&quot; một thời.</p>\r\n\r\n<p style=\"text-align: justify;\">Thiết kế Fiert&eacute; l&agrave; kết tinh của sự giao thoa giữa hiện đại v&agrave; truyền thống, giữa đam m&ecirc; d&agrave;nh cho xu hướng tối giản v&agrave; gi&aacute; trị tinh thần trong những điều xưa cũ của S&agrave;i G&ograve;n - thể hiện trong chất liệu gỗ bạch dương, m&agrave;u sắc trầm ấm, đậm đ&agrave; v&agrave; kiểu d&aacute;ng ho&agrave;i cổ, sang trọng.</p>\r\n','<p style=\"text-align: justify;\">&quot;(La) Fiert&eacute;&quot; - tiếng Ph&aacute;p c&oacute; nghĩa l&agrave; Niềm tự h&agrave;o. Bộ sưu tập Fiert&eacute; l&agrave; c&aacute;c mẫu nội thất ấp ủ t&igrave;nh cảm v&agrave; tự h&agrave;o của những người con rất y&ecirc;u S&agrave;i G&ograve;n - &quot;H&ograve;n ngọc Viễn Đ&ocirc;ng&quot; một thời.</p>\r\n\r\n<p style=\"text-align: justify;\">Thiết kế Fiert&eacute; l&agrave; kết tinh của sự giao thoa giữa hiện đại v&agrave; truyền thống, giữa đam m&ecirc; d&agrave;nh cho xu hướng tối giản v&agrave; gi&aacute; trị tinh thần trong những điều xưa cũ của S&agrave;i G&ograve;n - thể hiện trong chất liệu gỗ bạch dương, m&agrave;u sắc trầm ấm, đậm đ&agrave; v&agrave; kiểu d&aacute;ng ho&agrave;i cổ, sang trọng.</p>\r\n\r\n<p style=\"text-align: justify;\">Tủ lưu trữ Fiert&eacute; - Nhỏ với k&iacute;ch thước vừa phải c&oacute; thể d&ugrave;ng để đặt tr&ecirc;n lối v&agrave;o nh&agrave;, lối h&agrave;nh lang, trang tr&iacute; ph&ograve;ng kh&aacute;ch hoặc ph&ograve;ng bếp. Đặc biệt với bản lề giảm chấn cho phần c&aacute;nh tủ b&ecirc;n tr&aacute;i, l&agrave; một lời đảm bảo cho sự an to&agrave;n của người sử dụng d&ugrave; l&agrave; trẻ nhỏ hay người lớn tuổi.</p>\r\n\r\n<p style=\"text-align: justify;\">Cũng như c&aacute;c sản phẩm kh&aacute;c trong BST Fiert&eacute;, chất liệu ch&iacute;nh được sử dụng cho tủ Fiert&eacute; 1 hộc l&agrave; gỗ bạch dương (poplar wood). Đ&acirc;y l&agrave; loại gỗ được sử dụng kh&aacute; phổ biến cho đồ gỗ gia dụng tại Mỹ. Ở Việt Nam, gỗ bạch dương chủ yếu phục vụ c&aacute;c nhu cầu đ&oacute;ng đồ xuất khẩu. Gỗ c&oacute; khả năng chịu m&aacute;y tốt, d&iacute;nh keo tốt, kh&ocirc;ng bị nứt khi đ&oacute;ng đinh v&agrave; ốc v&iacute;t, c&ugrave;ng chất lượng bề mặt v&agrave; độ d&agrave;y như gỗ sồi, hay gỗ tần b&igrave;.</p>\r\n\r\n<p style=\"text-align: justify;\">BST Fiert&eacute; cũng như một lời gửi gắm của Mitssy đến bạn rằng, dẫu lối sống hiện đại c&oacute; cuốn h&uacute;t, c&oacute; khiến ta vội v&agrave;ng đến mấy, th&igrave; h&atilde;y lu&ocirc;n tr&acirc;n trọng những k&yacute; ức đẹp đ&atilde; qua. Như S&agrave;i G&ograve;n dẫu c&oacute; ph&aacute;t triển, c&oacute; &quot;thay da đổi thịt&quot; đến thế n&agrave;o, th&igrave; vẫn lu&ocirc;n c&oacute; chỗ cho những n&eacute;t ho&agrave;i niệm ng&agrave;y xưa...</p>\r\n\r\n<p style=\"text-align: justify;\">- <strong>K&iacute;ch thước:</strong> Ngang 90 x S&acirc;u 40 x Cao 83.5 cm<br />\r\n-<strong> Chất liệu</strong>: 100% gỗ bạch dương nhập khẩu (poplar wood)<br />\r\n- Sản phẩm <strong>xuất khẩu trực tiếp sang ch&acirc;u &Acirc;u v&agrave; Mỹ</strong></p>\r\n',NULL),(99,214,'vi','KỆ TIVI MATSU - SHIRAI','<p style=\"text-align: justify;\">Kệ tivi&nbsp;Matsu&nbsp;l&agrave; sản phẩm được sản xuất từ c&ocirc;ng ty Nhật Bản Shirai. Tất cả c&aacute;c d&ograve;ng sản phẩm Shirai được thiết kế bởi những nh&agrave; thiết kế Nhật Bản gi&agrave;u kinh nghiệm v&agrave; được sản xuất theo d&acirc;y chuyền c&ocirc;ng nghệ hiện đại của Nhật Bản. Thiết kế th&ocirc;ng minh, tạo cho sản phẩm độ tiện dụng tối đa, gi&uacute;p tiết kiệm kh&ocirc;ng gian nhưng vẫn nổi bật v&agrave; thẩm mỹ khi đặt trong kh&ocirc;ng gian.</p>\r\n','<p style=\"text-align: justify;\">&bull; Quy c&aacute;ch sản phẩm</p>\r\n\r\n<p style=\"text-align: justify;\">Trọng lượng : 17 kg<br />\r\nM&agrave;u sắc : n&acirc;u sẫm&nbsp;<br />\r\nTải trọng :&nbsp;<br />\r\nTấm v&aacute;n tr&ecirc;n c&ugrave;ng chịu tải tọng 35 kg, kệ di động chịu tải tọng 7kg</p>\r\n\r\n<p style=\"text-align: justify;\">Vật liệu : gỗ c&ocirc;ng nghiệp nhập khẩu MDF</p>\r\n\r\n<p style=\"text-align: justify;\">&bull; Chất liệu: gỗ c&ocirc;ng nghiệp MDF đ&atilde; qua xử l&yacute; với m&agrave;u gỗ tự nhi&ecirc;n bền đẹp, dễ d&agrave;ng lau ch&ugrave;i v&agrave; chống trầy xước. Tất cả gỗ được sử dụng đều đạt ti&ecirc;u chuẩn E1 với lượng formaldehyde thấp hơn 6-12 lần so với ti&ecirc;u chuẩn th&ocirc;ng thường. (Formaldehyde l&agrave; một hợp chất hữu cơ thường được d&ugrave;ng như một loại keo kết d&iacute;nh trong c&aacute;c sản phẩm nội thất gia đ&igrave;nh).&nbsp;Sản phẩm đạt chất lượng an to&agrave;n sức khoẻ theo ti&ecirc;u chuẩn Nhật Bản</p>\r\n\r\n<p style=\"text-align: justify;\">Sản phẩm sử dụng trong nh&agrave;, tr&aacute;nh ẩm ướt, &aacute;nh s&aacute;ng trực tiếp v&agrave; kh&ocirc;ng d&ugrave;ng chất tẩy rửa.</p>\r\n\r\n<p style=\"text-align: justify;\">K&iacute;ch thước: D&agrave;iD&agrave;i 118 X Rộng 40 X Cao35cm</p>\r\n\r\n<p style=\"text-align: justify;\">K&iacute;ch thước: D&agrave;i 118 X Rộng 40 X Cao35cm</p>\r\n',NULL),(100,215,'vi','KỆ GIÀY DÉP KIYOSHI, NHỎ - SHIRAI','<p style=\"text-align: justify;\">Kệ Gi&agrave;y D&eacute;p&nbsp;Kiyoshi, Nhỏ - Shirai&nbsp; l&agrave; sản phẩm được sản xuất từ c&ocirc;ng ty Nhật Bản Shirai. Tất cả c&aacute;c d&ograve;ng sản phẩm Shirai được thiết kế bởi những nh&agrave; thiết kế Nhật Bản gi&agrave;u kinh nghiệm v&agrave; được sản xuất theo d&acirc;y chuyền c&ocirc;ng nghệ hiện đại của Nhật Bản. Thiết kế th&ocirc;ng minh, tạo cho sản phẩm độ tiện dụng tối đa, gi&uacute;p tiết kiệm kh&ocirc;ng gian nhưng vẫn nổi bật v&agrave; thẩm mỹ khi đặt trong kh&ocirc;ng gian.</p>\r\n','<p style=\"text-align: justify;\"><span style=\"font-size:16px;\">&bull; Quy c&aacute;ch sản phẩm</span></p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:14px;\">K&iacute;ch thước:</span></p>\r\n\r\n<p style=\"text-align: justify;\">D&agrave;i 60 cm x Rộng 36.2 cm x Cao 102.6 cm&nbsp;</p>\r\n\r\n<p style=\"text-align: justify;\">M&agrave;u sắc : m&agrave;u n&acirc;u gỗ<br />\r\nSố kệ :4 ngăn kệ c&oacute; thể di chuyển v&agrave; 1 kệ cố định</p>\r\n\r\n<p style=\"text-align: justify;\">Tải trọng :</p>\r\n\r\n<p style=\"text-align: justify;\">Tấm v&aacute;n tr&ecirc;n c&ugrave;ng chịu tải trọng 20 kg, tải trọng kệ di động 4kg</p>\r\n\r\n<p style=\"text-align: justify;\">Vật liệu : gỗ c&ocirc;ng nghiệp nhập khẩu MDF</p>\r\n\r\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\">&bull; Chất liệu:</span> gỗ c&ocirc;ng nghiệp MDF đ&atilde; qua xử l&yacute; với m&agrave;u gỗ tự nhi&ecirc;n bền đẹp, dễ d&agrave;ng lau ch&ugrave;i v&agrave; chống trầy xước. Tất cả gỗ được sử dụng đều đạt ti&ecirc;u chuẩn E1 với lượng formaldehyde thấp hơn 6-12 lần so với ti&ecirc;u chuẩn th&ocirc;ng thường. (Formaldehyde l&agrave; một hợp chất hữu cơ thường được d&ugrave;ng như một loại keo kết d&iacute;nh trong c&aacute;c sản phẩm nội thất gia đ&igrave;nh).&nbsp;Sản phẩm đạt chất lượng an to&agrave;n sức khoẻ theo ti&ecirc;u chuẩn Nhật Bản</p>\r\n\r\n<p style=\"text-align: justify;\">Sản phẩm sử dụng trong nh&agrave;, tr&aacute;nh ẩm ướt, &aacute;nh s&aacute;ng trực tiếp v&agrave; kh&ocirc;ng d&ugrave;ng chất tẩy rửa.</p>\r\n\r\n<p style=\"text-align: justify;\">K&iacute;ch thước: D&agrave;i 60 cm x Rộng 36.2 cm x Cao 102.6 cm</p>\r\n',NULL),(102,217,'vi','BÀN RANDY','<p style=\"text-align: justify;\">G&oacute;c b&agrave;n bo tr&ograve;n của b&agrave;n Randy chắc chắn l&agrave; ưu điểm được đ&aacute;nh gi&aacute; cao nhất. D&ograve;ng b&agrave;n Box Frame th&ocirc;ng thường lu&ocirc;n được biết đến với sự r&otilde; r&agrave;ng trong h&igrave;nh d&aacute;ng - chỉ vu&ocirc;ng, hoặc tr&ograve;n. Thế nhưng b&agrave;n Randy minh chứng một điều đ&atilde; được biết đến từ l&acirc;u nhưng vẫn lu&ocirc;n đ&uacute;ng &quot;S&aacute;ng tạo l&agrave; kh&ocirc;ng c&oacute; giới hạn.&quot; Tương phản, nhưng ấn tượng - khi g&oacute;c b&agrave;n tr&ograve;n trịa được đặt tr&ecirc;n khung ch&acirc;n vu&ocirc;ng vức.</p>\r\n','<p style=\"text-align: justify;\">G&oacute;c b&agrave;n bo tr&ograve;n của b&agrave;n Randy chắc chắn l&agrave; ưu điểm được đ&aacute;nh gi&aacute; cao nhất. D&ograve;ng b&agrave;n Box Frame th&ocirc;ng thường lu&ocirc;n được biết đến với sự r&otilde; r&agrave;ng trong h&igrave;nh d&aacute;ng - chỉ vu&ocirc;ng, hoặc tr&ograve;n. Thế nhưng b&agrave;n Randy minh chứng một điều đ&atilde; được biết đến từ l&acirc;u nhưng vẫn lu&ocirc;n đ&uacute;ng &quot;S&aacute;ng tạo l&agrave; kh&ocirc;ng c&oacute; giới hạn.&quot; Tương phản, nhưng ấn tượng - khi g&oacute;c b&agrave;n tr&ograve;n trịa được đặt tr&ecirc;n khung ch&acirc;n vu&ocirc;ng vức.&nbsp;<br />\r\nNgo&agrave;i yếu tố thẩm mỹ, g&oacute;c b&agrave;n bo tr&ograve;n của b&agrave;n Randy cũng đem lại sự an to&agrave;n cho những gia đ&igrave;nh c&oacute; trẻ em, hoặc người lớn tuổi. Khung b&agrave;n cũng được cải tiến hơn với hai thanh đỡ chịu lực cho mặt b&agrave;n đ&aacute; v&agrave; phần nối giữa hai khung ch&acirc;n chữ U thay cho khung hộp truyền thống.&nbsp;<br />\r\nChất liệu:&nbsp;<br />\r\n- Khung ch&acirc;n sắt sơn tĩnh điện<br />\r\n- Mặt b&agrave;n đ&aacute; Marble trắng</p>\r\n\r\n<p style=\"text-align: justify;\">K&iacute;ch thước: D&agrave;i 750 x Rộng 750 x Cao 285</p>\r\n',NULL),(103,218,'vi','BÀN SOFA MARVIN','<p style=\"text-align: justify;\">Ph&aacute;t triển từ d&ograve;ng b&agrave;n Box Frame vốn rất được ưa chuộng tại Mitssy, bản th&acirc;n b&agrave;n Marvin ho&agrave;n to&agrave;n kh&ocirc;ng qu&aacute; nổi bật nếu đứng ri&ecirc;ng lẻ một m&igrave;nh. B&agrave;n Marvin chỉ thật sự tỏa s&aacute;ng khi đặt trong một căn ph&ograve;ng c&ugrave;ng với những vật dụng kh&aacute;c. Sự tối giản trong thiết kế vừa gi&uacute;p Marvin dễ d&agrave;ng h&ograve;a hợp với kh&ocirc;ng gian chung, vừa khiến những đường n&eacute;t mộc mạc, thẳng thắn của Marvin được t&ocirc;n l&ecirc;n một c&aacute;ch tinh tế.</p>\r\n','<p style=\"text-align: justify;\">T&iacute;nh chất của mặt b&agrave;n l&agrave;m từ đ&aacute; Marble chắc chắn v&agrave; khung ch&acirc;n sắt sơn tĩnh điện c&oacute; độ kh&aacute;ng trầy cao đẩy gi&aacute; trị c&ocirc;ng năng của Marble l&ecirc;n một nấc mới so với c&aacute;c b&agrave;n Box Frame truyền thống. Cả hai chất liệu đều l&agrave; nguy&ecirc;n tố lạnh, nhưng khi kết hợp, ch&uacute;ng mang lại cho người d&ugrave;ng cảm gi&aacute;c y&ecirc;n t&acirc;m về sự vững ch&atilde;i v&agrave; mạnh mẽ của Marvin<br />\r\nChất liệu:<br />\r\n- Khung ch&acirc;n sắt sơn tĩnh điện<br />\r\n- Mặt b&agrave;n đ&aacute; Marble trắng</p>\r\n\r\n<p style=\"text-align: justify;\">K&iacute;ch thước: D&agrave;i 750 x Rộng 750 x Cao 335</p>\r\n',NULL),(104,219,'vi','BÀN TRÒN SOFA MẶT ĐÁ CHÂN INOX MẠ','<p style=\"text-align: justify;\">B&agrave;n tr&ograve;n sofa mặt đ&aacute; tự nhi&ecirc;n (B&agrave;n Sofa Monterey)&nbsp;<br />\r\nSang trọng với chất liệu đ&aacute; Marble tự nhi&ecirc;n, ch&acirc;n inox mạ v&agrave;ng&nbsp;</p>\r\n','<p style=\"text-align: justify;\">- Chiều cao ch&ecirc;nh lệch bạn c&oacute; thể trưng 2 chiếc b&agrave;n th&agrave;nh một bộ b&agrave;n cao thấp hoặc để ri&ecirc;ng mỗi chiếc.<br />\r\n- K&iacute;ch thước: 60x50cm v&agrave; 45x42cm.<br />\r\n- Chất liệu: mặt đ&aacute; Marble, ch&acirc;n inox mạ v&agrave;ng.</p>\r\n',NULL),(106,221,'vi','BÀN VI TÍNH, KANAU','<p>B&agrave;n vi t&iacute;nh Kanau đơn giản, tinh tế với kết cấu c&oacute; hộc b&agrave;n nhỏ th&iacute;ch hợp để những vật dụng học tập hoặc l&agrave;m việc như giấy tờ, b&uacute;t viết,&hellip; M&agrave;u n&acirc;u dẻ gai mang đến vẻ sang trong tinh tế cho kh&ocirc;ng gian nội thất.</p>\r\n\r\n<p>K&iacute;ch thước: K&Iacute;CH THƯỚC L81.5*W50.5*H8.5CM</p>\r\n','<p>K&iacute;ch thước: K&Iacute;CH THƯỚC L81.5*W50.5*H8.5CM</p>\r\n',NULL),(107,222,'vi','GHẾ ĂN VALERIE','<p>Ghế ăn Valerie mang vẻ đẹp bất đối xứng, mặc d&ugrave; thoạt đầu lướt qua kh&ocirc;ng c&oacute; điểm kh&aacute;c biệt so với những chiếc ghế ăn th&ocirc;ng thường. Hai ch&acirc;n trước được lắp đặt theo phương thẳng đứng, 2 ch&acirc;n sau nghi&ecirc;ng g&oacute;c 10&deg; tạo cấu tr&uacute;c bền vững v&agrave; điểm nhấn cho ghế ăn Valerie.</p>\r\n','<ul>\r\n	<li>Chất liệu : Ch&acirc;n gỗ sơn đen, nệm d&agrave;y bọc da nh&acirc;n tạo</li>\r\n	<li>M&agrave;u sắc c&oacute; sẵn: Black - White - Light brown - Dark brown</li>\r\n	<li>Xuất xứ : H&agrave;ng nhập khẩu ph&acirc;n phối</li>\r\n	<li>Bảo h&agrave;nh sản phẩm : 1 năm</li>\r\n</ul>\r\n\r\n<p>Giao h&agrave;ng tận nơi tr&ecirc;n to&agrave;n quốc, miễn ph&iacute; vận chuyển trong khu vực tp. Hồ Ch&iacute; Minh</p>\r\n',NULL),(108,223,'vi','GHẾ ROY MÀU XANH','<p>- K&iacute;ch thước D&agrave;i 56 x S&acirc;u 60 x Cao 78 (cm)<br />\r\n- Chất liệu:</p>\r\n\r\n<ul>\r\n	<li>Khung gỗ: 100% Gỗ Tần B&igrave; (Ash)</li>\r\n	<li>Lớp bọc: Vải H&agrave;n Quốc</li>\r\n</ul>\r\n','<p>&quot;Serena&quot; mang &yacute; nghĩa của sự b&igrave;nh y&ecirc;n v&agrave; thoải m&aacute;i. Lần n&agrave;y, Mitssy gửi đến cả nh&agrave; BST Serena l&agrave; sản phẩm chất chứa t&igrave;nh cảm của những người lu&ocirc;n hướng đến gi&aacute; trị giản dị v&agrave; t&igrave;m kiếm cảm gi&aacute;c b&igrave;nh y&ecirc;n trong những ho&agrave;i niệm xưa cũ.</p>\r\n\r\n<p>BST Serena với thiết kế hướng đến sự tinh giản, thoải m&aacute;i v&agrave; ph&oacute;ng kho&aacute;ng, l&agrave; sự giao thoa giữa n&eacute;t cổ điển v&agrave; hiện đại - được thể hiện trong chất liệu gỗ Tần B&igrave;, gam m&agrave;u sắc trầm ấm, kiểu d&aacute;ng sang trọng v&agrave; ho&agrave;i cổ. BST Serena kh&ocirc;ng chỉ đẹp ở thiết kế m&agrave; c&ograve;n được ch&uacute; trọng v&agrave;o c&ocirc;ng năng. Điển h&igrave;nh ở phần lưng tựa với độ nghi&ecirc;ng vừa phải, đệm ngồi d&agrave;y &ecirc;m giảm thiểu đau lưng v&agrave; t&aacute;c động l&ecirc;n cột sống mang đến sự thoải m&aacute;i, thư gi&atilde;n tối đa cho chủ nh&acirc;n khi ngồi đọc s&aacute;ch, uống tr&agrave; hay nghe một bản nhạc y&ecirc;u th&iacute;ch. Ngo&agrave;i ra, sản phẩm dễ d&agrave;ng phối hợp v&agrave;o nhiều kh&ocirc;ng gian kh&aacute;c nhau như ph&ograve;ng kh&aacute;ch hoặc ph&ograve;ng ngủ.</p>\r\n\r\n<p>Ghế Roy được l&agrave;m từ gỗ T&acirc;n B&igrave; được nhập khẩu từ Mĩ, Loại gỗ n&agrave;y c&oacute; v&acirc;n gỗ thẳng, đều, thịt gỗ chắc c&oacute; m&agrave;u nhạt ( trắng). Để sản xuất ra ra ghế th&igrave; gỗ sẽ được sấy kh&ocirc; v&agrave; &eacute;p cứng. B&ecirc;n ngo&agrave;i l&agrave; một lớp sơn b&oacute;ng để bảo vệ gỗ. Mặt gỗ được bọc đệm đ&agrave;n hồi tốt với lớp phủ Simily tạo sự thoải m&aacute;i cho kh&aacute;ch h&agrave;ng khi sử dụng.</p>\r\n\r\n<p>BST Serena cũng như một lời gửi gắm của Mitssy đến bạn rằng, cuộc sống dẫu c&oacute; bộn bề đến mấy, ta vẫn lu&ocirc;n cần c&oacute; những khoảng lặng của ri&ecirc;ng m&igrave;nh, lu&ocirc;n cần một chốn để quay về, nơi để t&acirc;m hồn ta được sống lại với những x&uacute;c cảm d&ugrave; nhạt nh&ograve;a hay đậm n&eacute;t m&agrave; đ&ocirc;i lần ta đ&atilde; lỡ dửng dưng.</p>\r\n\r\n<p>K&iacute;ch thước: D&agrave;i 56 x S&acirc;u 60 x Cao 78 (cm)</p>\r\n',NULL),(109,224,'vi','Ghế luới cao cấp GL318','<p>Ghế lưới cao cấp khung tựa nhựa, tay nhựa, chân thép mạ</p>\r\n','<p><strong>Kiểu Dáng</strong><br />\r\n&nbsp;&nbsp;&nbsp; - Ghế xoay lưới cao cấp Hòa Phát.<br />\r\n&nbsp;&nbsp;&nbsp; - Ghế có khung tựa nhựa bọc lưới chiụ lực, có tựa đầu.<br />\r\n&nbsp;&nbsp;&nbsp; - Đệm ghế mút bọc da công nghiệp cao cấp<br />\r\n&nbsp;&nbsp;&nbsp; - Tay nhựa chữa T cách điệu.<br />\r\n&nbsp;&nbsp;&nbsp; - Chân thép mạ sáng bóng có bánh xe di chuyển<br />\r\n&nbsp;&nbsp;&nbsp; - Ghế có khả năng ngả hãm ở nhiều góc độ khác nhau, bộ piston khí nén có thể điều chỉnh được độ cao thấp.<br />\r\n&nbsp;&nbsp;&nbsp; - Sản phẩm&nbsp;<strong>ghế lưới Hòa Phát GL318</strong>&nbsp;kết hợp với&nbsp;<a href=\"\" target=\"_blank\" title=\"bàn văn phòng hòa phát\"><strong>bàn Hòa Phát</strong></a>&nbsp;thích hợp sử dụng dành cho người lãnh đạo, trưởng phòng trong công ty</p>\r\n\r\n<p><strong>Kích Thước:</strong>&nbsp;W630 x D63 x H(1170-1225) mm</p>\r\n\r\n<p><strong>Chất liệu:</strong>&nbsp;Ghế lưới cao cấp khung tựa nhựa, tay nhựa, chân thép mạ</p>\r\n',NULL),(110,225,'vi','KỆ SÁCH CHỮ X CHAKALUKA','<p>kệ s&aacute;ch, kệ chữ X m&agrave;u trắng</p>\r\n\r\n<p>Ngang 1200 X S&acirc;u 330 X Cao 1500 mm</p>\r\n','<p>ho&agrave;n to&agrave;n bằng gỗ tự nhi&ecirc;n</p>\r\n\r\n<p>K&iacute;ch thước: Qui C&aacute;ch Sản Phẩm: Ngang 1200 X S&acirc;u 330 X Cao 1500 mm</p>\r\n',NULL);
/*!40000 ALTER TABLE `wb_product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_discount`
--

DROP TABLE IF EXISTS `wb_product_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `price` double(14,2) DEFAULT '0.00',
  `is_expired` tinyint(1) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_discount`
--

LOCK TABLES `wb_product_discount` WRITE;
/*!40000 ALTER TABLE `wb_product_discount` DISABLE KEYS */;
INSERT INTO `wb_product_discount` VALUES (113,214,2356000.00,NULL,'2017-12-06 00:00:00','2017-12-06 00:00:00'),(116,212,5934000.00,NULL,'2017-12-06 00:00:00','2017-12-06 00:00:00'),(120,211,3208000.00,NULL,'2017-12-06 00:00:00','2017-12-06 00:00:00'),(121,225,1900000.00,NULL,'2018-03-01 00:00:00','2018-03-08 00:00:00'),(125,224,1000000.00,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wb_product_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_gift`
--

DROP TABLE IF EXISTS `wb_product_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_gift` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apply_for` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `apply_ids` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `limit` int(11) unsigned DEFAULT '0',
  `used` int(11) unsigned NOT NULL DEFAULT '0',
  `is_stopped` tinyint(2) NOT NULL DEFAULT '0',
  `started_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_gift`
--

LOCK TABLES `wb_product_gift` WRITE;
/*!40000 ALTER TABLE `wb_product_gift` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_product_gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_option`
--

DROP TABLE IF EXISTS `wb_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `gallery_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_id` (`option_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_option`
--

LOCK TABLES `wb_product_option` WRITE;
/*!40000 ALTER TABLE `wb_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_shipping`
--

DROP TABLE IF EXISTS `wb_product_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_shipping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `weight` double(11,2) DEFAULT '0.00',
  `length` double(11,2) DEFAULT '0.00',
  `width` double(11,2) DEFAULT '0.00',
  `height` double(11,2) DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `option_id` (`weight`,`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_shipping`
--

LOCK TABLES `wb_product_shipping` WRITE;
/*!40000 ALTER TABLE `wb_product_shipping` DISABLE KEYS */;
INSERT INTO `wb_product_shipping` VALUES (1,205,0.00,0.00,0.00,0.00),(2,206,0.00,0.00,0.00,0.00),(3,207,0.00,0.00,0.00,0.00),(4,208,0.00,0.00,0.00,0.00),(5,209,0.00,0.00,0.00,0.00),(6,210,0.00,0.00,0.00,0.00),(7,211,0.00,0.00,0.00,0.00),(8,212,0.00,0.00,0.00,0.00),(10,214,0.00,0.00,0.00,0.00),(11,215,0.00,0.00,0.00,0.00),(13,217,0.00,0.00,0.00,0.00),(14,218,0.00,0.00,0.00,0.00),(15,219,0.00,0.00,0.00,0.00),(17,221,0.00,0.00,0.00,0.00),(18,222,0.00,0.00,0.00,0.00),(19,223,0.00,0.00,0.00,0.00),(20,224,0.00,0.00,0.00,0.00),(21,225,0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `wb_product_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_tab`
--

DROP TABLE IF EXISTS `wb_product_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_tab`
--

LOCK TABLES `wb_product_tab` WRITE;
/*!40000 ALTER TABLE `wb_product_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_product_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_tab_content`
--

DROP TABLE IF EXISTS `wb_product_tab_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_tab_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_tab_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_tab_content`
--

LOCK TABLES `wb_product_tab_content` WRITE;
/*!40000 ALTER TABLE `wb_product_tab_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_product_tab_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_product_tab_description`
--

DROP TABLE IF EXISTS `wb_product_tab_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_product_tab_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_tab_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_tab_id` (`product_tab_id`,`lang_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_product_tab_description`
--

LOCK TABLES `wb_product_tab_description` WRITE;
/*!40000 ALTER TABLE `wb_product_tab_description` DISABLE KEYS */;
INSERT INTO `wb_product_tab_description` VALUES (5,3,'thông số','vi');
/*!40000 ALTER TABLE `wb_product_tab_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_province`
--

DROP TABLE IF EXISTS `wb_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_province` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `ghn_code` int(5) unsigned NOT NULL,
  `shipchung_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_province`
--

LOCK TABLES `wb_province` WRITE;
/*!40000 ALTER TABLE `wb_province` DISABLE KEYS */;
INSERT INTO `wb_province` VALUES (1,'01','TP. Hà nội',201,18),(2,'02','TP. Hồ Chí Minh',202,52),(3,'03','TP. Hải Phòng',224,24),(4,'04','TP. Đà Nẵng',203,35),(5,'05','Hà Giang',227,3),(6,'06','Cao Bằng',246,1),(7,'07','Lai Châu',264,4),(8,'08','Lào Cai',269,5),(9,'09','Tuyên Quang',228,7),(10,'10','Lạng Sơn',247,14),(11,'11','Bắc Kạn',245,6),(12,'12','Thái Nguyên',244,12),(13,'13','Yên Bái',263,11),(14,'14','Sơn La',266,16),(15,'15','Phú Thọ',229,17),(16,'16','Vĩnh Phúc',221,15),(17,'17','Quảng Ninh',230,20),(18,'18','Bắc Giang',248,19),(19,'19','Bắc Ninh',249,2),(20,'21','Hải Dương',225,22),(21,'22','Hưng Yên',268,8),(22,'23','Hòa Bình',267,23),(23,'24','Hà Nam',232,25),(24,'25','Nam Định',231,28),(25,'26','Thái Bình',226,26),(26,'27','Ninh Bình',233,27),(27,'28','Thanh Hóa',234,29),(28,'29','Nghệ An',235,30),(29,'30','Hà Tĩnh',236,31),(30,'31','Quảng Bình',237,32),(31,'32','Quảng Trị',238,33),(32,'33','Thừa Thiên - Huế',223,34),(33,'34','Quảng Nam',243,36),(34,'35','Quãng Ngãi',242,37),(35,'36','Kon Tum',259,38),(36,'37','Bình Định',262,39),(37,'38','Gia Lai',207,40),(38,'39','Phú Yên',260,9),(39,'40','Đắk Lắk',210,42),(40,'41','Khánh Hòa',208,43),(41,'42','Lâm Đồng',209,46),(42,'43','Bình Phước',239,45),(43,'44','Bình Dương',205,49),(44,'45','Ninh Thận',261,47),(45,'46','Tây Ninh',240,48),(46,'47','Bình Thuận',258,51),(47,'48','Đồng Nai',204,50),(48,'49','Long An',211,53),(49,'50','Đồng Tháp',216,57),(50,'51','An Giang',217,56),(51,'52','Bà Rịa - Vũng Tàu',206,54),(52,'53','Tiền Giang',212,58),(53,'54','Kiên Giang',219,62),(54,'55','Cần Thơ',220,59),(55,'56','Bến Tre',213,60),(56,'57','Vĩnh Long',215,61),(57,'58','Trà Vinh',214,64),(58,'59','Sóc Trăng',218,13),(59,'60','Bạc Liêu',253,65),(60,'61','Cà Mau',252,68),(61,'62','Điện Biên',265,10),(62,'63','Đăk Nông',241,44),(63,'64','Hậu Giang',250,63);
/*!40000 ALTER TABLE `wb_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_rating`
--

DROP TABLE IF EXISTS `wb_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_rating` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `taxonomy_type` varchar(50) NOT NULL,
  `taxonomy_id` int(11) unsigned NOT NULL,
  `total_point` double(15,2) unsigned NOT NULL,
  `total_review` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_rating`
--

LOCK TABLES `wb_rating` WRITE;
/*!40000 ALTER TABLE `wb_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_seo`
--

DROP TABLE IF EXISTS `wb_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_seo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `robots` int(11) NOT NULL DEFAULT '0',
  `taxonomy_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxonomy_id` int(11) NOT NULL,
  `lang_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_seo`
--

LOCK TABLES `wb_seo` WRITE;
/*!40000 ALTER TABLE `wb_seo` DISABLE KEYS */;
INSERT INTO `wb_seo` VALUES (1,'gioi-thieu',1,'page',55,'vi','giới thiệu','giới thiệu','giới thiệu'),(2,'san-pham',0,'category',1,'vi','Sản phẩm','Sản phẩm','Sản phẩm'),(3,'ngo-ngang-noi-that-cua-ngoi-nha-co-ve-ngoai-tho-rap-xu-xi',0,'post',162,'vi','Ngỡ ngàng nội thất của ngôi nhà có vẻ ngoài thô ráp xù xì','Ngỡ ngàng nội thất của ngôi nhà có vẻ ngoài thô ráp xù xì','Ngôi nhà này chính là minh chứng tiêu biểu cho câu nói “Đừng nhìn mặt mà bắt hình dong”.'),(5,'homepage',1,'page',53,'vi','Trang chủ','giới thiệu','nội thất đẹp, hiện đại'),(8,'tin-noi-that',0,'category',5,'vi','Tin nội thất ','Tin nội thất','Căn hộ với hàng loạt nội thất hàng hiệu sẽ là nơi dừng chân của ngôi sao Hàn Quốc mỗi dịp anh đến Việt Nam'),(10,'noi-that-xa-xi-trong-can-ho-trieu-do-tai-trung-tam-ha-noi-cua-thanh-vien-nhom-big-bang',0,'post',163,'vi','Nội thất xa xỉ trong căn hộ triệu đô tại trung tâm Hà Nội của thành viên nhóm Big Bang','Nội thất xa xỉ trong căn hộ triệu đô tại trung tâm Hà Nội của thành viên nhóm Big Bang','Căn hộ với hàng loạt nội thất hàng hiệu sẽ là nơi dừng chân của ngôi sao Hàn Quốc mỗi dịp anh đến Việt Nam.'),(11,'phat-hoang-truoc-nhung-thu-do-noi-that-quai-di-ngay-halloween',0,'post',164,'vi','Phát hoảng trước những thứ đồ nội thất quái dị ngày Halloween','Phát hoảng trước những thứ đồ nội thất quái dị ngày Halloween','Liệu bạn có dám tậu những thứ đồ nội thất quái dị đầy ma mị này để trang trí nhà ngày Halloween không?'),(12,'10-thiet-ke-tu-luu-tru-giup-ban-chua-ca-the-gioi-chai-lo-linh-kinh-trong-phong-bep',0,'post',165,'vi','10 thiết kế tủ lưu trữ giúp bạn chứa cả thế giới chai lọ lỉnh kỉnh trong phòng bếp','10 thiết kế tủ lưu trữ giúp bạn chứa cả thế giới chai lọ lỉnh kỉnh trong phòng bếp','Một số đồ nội thất có thể tạo ra sự khác biệt lớn cho cả không gian nếu bạn sử dụng chúng. Và trên hết, những thiết kế tủ lưu trữ dưới đây còn giúp bạn được nhiều hơn thế nữa.'),(13,'nhin-la-muon-mua-ngay-nhung-mon-do-noi-that-cuc-chat-ma-tien-dung-nay',0,'post',166,'vi','Nhìn là muốn mua ngay những món đồ nội thất cực chất mà tiện dụng này','Nhìn là muốn mua ngay những món đồ nội thất cực chất mà tiện dụng này','Nếu bạn thích nuôi những chú cá bé xinh trong căn nhà, hãy tận dụng ngay chiếc tivi đen trắng thời \"ông bà anh\" để nuôi nhé!'),(15,'tin-noi-that-nhom',0,'group',2,'vi','Tin Nội Thất','','Tin Nội Thất'),(16,'phong-sinh-hoat-chung-adeline',0,'product',205,'vi','PHÒNG SINH HOẠT CHUNG ADELINE','PHÒNG SINH HOẠT CHUNG ADELINE','Để tùy chỉnh và hoàn thiện căn hộ của bạn theo set nội thất này, xin nhấn vào nút \"Liên hệ\" nói trực tiếp với Home Stylist.'),(17,'phong-khach',0,'group',3,'vi','Phòng khách','','Phòng khách'),(18,'phong-khach-swedish',0,'product',206,'vi','PHÒNG KHÁCH SWEDISH','PHÒNG KHÁCH SWEDISH','Một góc căn hộ Masteri 2 phòng ngủ với thiết kế tối giản mọi nội thất trong không gian, đề cao tính công năng, phù hợp căn hộ có diện tích nhỏ.'),(19,'phong-khach-portsmouth',0,'product',207,'vi','PHÒNG KHÁCH PORTSMOUTH','PHÒNG KHÁCH PORTSMOUTH','Chuẩn phòng khách Masteri, 2 phòng ngủ \r\nDiện tích: 3.2m x 2.95m'),(20,'phong-khach-malibu',0,'product',208,'vi','PHÒNG KHÁCH MALIBU','PHÒNG KHÁCH MALIBU','Chuẩn phòng khách Masteri, 2 phòng ngủ 72m2, tòa T1 \r\nDiện tích phòng khách:5m x4m'),(21,'phong-khach-norway',0,'product',209,'vi','PHÒNG KHÁCH NORWAY','PHÒNG KHÁCH NORWAY','Chuẩn phòng khách Masteri 2 phòng ngủ 71m2 \r\nDiện tích: 5m x4m'),(22,'phong-khach-lewerentz',0,'product',210,'vi','PHÒNG KHÁCH LEWERENTZ','PHÒNG KHÁCH LEWERENTZ','Để tùy chỉnh và hoàn thiện căn hộ của bạn theo set nội thất này, xin liên hệ trực tiếp với chúng tôi qua nút \"Liên hệ\" hay email support@imgroup.vn'),(23,'thiet-ke-noi-that-phong-cach-phap-pho-bien',0,'post',167,'vi','Thiết kế nội thất phong cách Pháp phổ biến','Thiết kế nội thất phong cách Pháp phổ biến','Không gian Scandinavian của chúng tôi dựa trên màu xám sáng chói để mang lại sự độc tôn màu sắc. Không có nơi nào được minh hoạ rõ hơn so với sáu khung hình phòng khách, một sự tổng hợp các sự nhẹ nhàng các màu sắc và minh họa khác nhau trong nghệ thuật của họ.'),(24,'phong-cach-scandinavian-tinh-te-trong-thiet-ke-noi-that',0,'post',168,'vi','Phong cách Scandinavian tinh tế trong thiết kế nội thất','Phong Cách Scandinavian Tinh Tế Trong Thiết Kế Nội Thất','Không gian Scandinavia tạo ra một cách thể hiện với một sàn gỗ màu xám mở rộng qua các phòng của nó. Được bao quanh bởi các bức tường trắng và tủ bếp màu xám. Không gian sống chính dao động giữa màu xám, trắng, xen kẽ xám và trắng '),(25,'thiet-ke-noi-that-phong-khach-biet-thu-sang-trong',0,'post',169,'vi','Thiết kế nội thất phòng khách biệt thự sang trọng','Thiết kế nội thất phòng khách biệt thự sang trọng','Đầu tiên sử dụng một vài mảng hình riêng vững chắc để diễn tả một phong cách cá nhân. Phòng khách sử dụng các tác phẩm điêu khắc để nhấn mạnh chủ đề hình học tinh vi của nó. '),(26,'phong-cach-nhiet-doi-mot-thiet-ke-noi-that-phong-ngu',0,'post',170,'vi','Phong cách nhiệt đới một thiết kế nội thất phòng ngủ.','Phong cách nhiệt đới một thiết kế nội thất phòng ngủ.','Trong một không gian phòng ngủ, ta có thể kết hợp cả một lúc cả hai phong cách. Phòng ngủ phong cách nhiệt đới cùng với bộ lạc như mang bạn đến một thế giới lạ. Nơi bạn có thể hòa mình với thiên nhiên và đánh một giấc lý tưởng.'),(27,'ke-sach-ayako-shirai',0,'product',211,'vi','KỆ SÁCH AYAKO - SHIRAI','KỆ SÁCH AYAKO - SHIRAI','Kệ sách Ayako là sản phẩm được sản xuất từ công ty Nhật Bản Shirai. Tất cả các dòng sản phẩm Shirai được thiết kế bởi những nhà thiết kế Nhật Bản giàu kinh nghiệm và được sản xuất theo dây chuyền công nghệ hiện đại của Nhật Bản. Thiết kế thông minh, tạo cho sản phẩm độ tiện dụng tối đa, giúp tiết kiệm không gian nhưng vẫn nổi bật và thẩm mỹ khi đặt trong không gian.\r\n\r\n'),(28,'tu-luu-tru-fierte-nho',0,'product',212,'vi','TỦ LƯU TRỮ FIERTÉ - NHỎ','TỦ LƯU TRỮ FIERTÉ - NHỎ','\"(La) Fierté\" - tiếng Pháp có nghĩa là Niềm tự hào. Bộ sưu tập Fierté là các mẫu nội thất ấp ủ tình cảm và tự hào của những người con rất yêu Sài Gòn - \"Hòn ngọc Viễn Đông\" một thời.\r\nThiết kế Fierté là kết tinh của sự giao thoa giữa hiện đại và truyền thống, giữa đam mê dành cho xu hướng tối giản và giá trị tinh thần trong những điều xưa cũ của Sài Gòn - thể hiện trong chất liệu gỗ bạch dương, màu sắc trầm ấm, đậm đà và kiểu dáng hoài cổ, sang trọng.'),(30,'ke-tivi-matsu-shirai',0,'product',214,'vi','KỆ TIVI MATSU - SHIRAI','KỆ TIVI MATSU - SHIRAI','Kệ tivi Matsu là sản phẩm được sản xuất từ công ty Nhật Bản Shirai. Tất cả các dòng sản phẩm Shirai được thiết kế bởi những nhà thiết kế Nhật Bản giàu kinh nghiệm và được sản xuất theo dây chuyền công nghệ hiện đại của Nhật Bản. Thiết kế thông minh, tạo cho sản phẩm độ tiện dụng tối đa, giúp tiết kiệm không gian nhưng vẫn nổi bật và thẩm mỹ khi đặt trong không gian.'),(31,'huong-dan',0,'page',56,'vi','Hướng Dẫn ','','Hướng Dẫn '),(32,'san-pham-moi',0,'category',7,'vi','','',''),(33,'phong-khach-8501',0,'category',8,'vi','Phòng Khách','Phòng Khách','Phòng Khách'),(34,'ke-tu-sach',0,'category',9,'vi','Kệ Tủ Sách','Kệ Tủ Sách','Kệ Tủ Sách'),(41,'abc',0,'category',10,'vi','abc','abc','abc'),(43,'lien-he',1,'page',54,'vi','','lien he',''),(44,'ke-giay-dep-kiyoshi',0,'product',215,'vi','KỆ GIÀY DÉP KIYOSHI, NHỎ - SHIRAI','KỆ GIÀY DÉP KIYOSHI,NHỎ - SHIRAI','Kệ Giày Dép Kiyoshi, Nhỏ - Shirai  là sản phẩm được sản xuất từ công ty Nhật Bản Shirai. Tất cả các dòng sản phẩm Shirai được thiết kế bởi những nhà thiết kế Nhật Bản giàu kinh nghiệm và được sản xuất theo dây chuyền công nghệ hiện đại của Nhật Bản. Thiết kế thông minh, tạo cho sản phẩm độ tiện dụng tối đa, giúp tiết kiệm không gian nhưng vẫn nổi bật và thẩm mỹ khi đặt trong không gian.'),(46,'ban-ghe',0,'category',11,'vi','BÀN GHÉ,','BÀN GHẾ','BÀN GHÉ,'),(47,'ban-randy',0,'product',217,'vi','BÀN RANDY','BÀN RANDY','Bàn sofa được Mitssy chọn lọc trong Bộ sưu tập The New Wave - Làn Sóng Mới, ra mắt lần đầu tiên vào tháng 4 - 2017\r\n'),(48,'ban-sofa-marvin',0,'product',218,'vi','BÀN SOFA MARVIN','BÀN SOFA MARVIN','Phát triển từ dòng bàn Box Frame vốn rất được ưa chuộng tại Mitssy, bản thân bàn Marvin hoàn toàn không quá nổi bật nếu đứng riêng lẻ một mình. Bàn Marvin chỉ thật sự tỏa sáng khi đặt trong một căn phòng cùng với những vật dụng khác. Sự tối giản trong thiết kế vừa giúp Marvin dễ dàng hòa hợp với không gian chung, vừa khiến những đường nét mộc mạc, thẳng thắn của Marvin được tôn lên một cách tinh tế.'),(49,'ban-tron-sofa-mat-da-chan-inox-ma',0,'product',219,'vi','BÀN TRÒN SOFA MẶT ĐÁ CHÂN INOX MẠ','BÀN TRÒN SOFA MẶT ĐÁ CHÂN INOX MẠ','Bàn tròn sofa mặt đá tự nhiên (Bàn Sofa Monterey) \r\nSang trọng với chất liệu đá Marble tự nhiên, chân inox mạ vàng '),(51,'ban-vi-tinh',0,'product',221,'vi','BÀN VI TÍNH, KANAU','BÀN VI TÍNH,KANAU','Bàn vi tính Kanau đơn giản, tinh tế với kết cấu có hộc bàn nhỏ thích hợp để những vật dụng học tập hoặc làm việc như giấy tờ, bút viết,… Màu nâu dẻ gai mang đến vẻ sang trong tinh tế cho không gian nội thất.\r\nKích thước: KÍCH THƯỚC L81.5*W50.5*H8.5CM'),(52,'ban-ghe-398171',0,'category',12,'vi','bàn ghế','bàn ghế','bàn ghế'),(53,'ban-ghe-146211',0,'category',13,'vi','Bàn Ghế','Bàn Ghế','Bàn Ghế'),(54,'ghe-an-valerie',0,'product',222,'vi','GHẾ ĂN VALERIE','GHẾ ĂN VALERIE','Ghế ăn Valerie mang vẻ đẹp bất đối xứng, mặc dù thoạt đầu lướt qua không có điểm khác biệt so với những chiếc ghế ăn thông thường. Hai chân trước được lắp đặt theo phương thẳng đứng, 2 chân sau nghiêng góc 10° tạo cấu trúc bền vững và điểm nhấn cho ghế ăn Valerie.'),(55,'ghe-roy-mau-xanh',0,'product',223,'vi','GHẾ ROY MÀU XANH','GHẾ ROY MÀU XANH',' sản phẩm chất chứa tình cảm của những người luôn hướng đến giá trị giản dị và tìm kiếm cảm giác bình yên trong những hoài niệm xưa cũ.'),(56,'ghe-luoi-cao-cap-gl318',0,'product',224,'vi','Ghế luới cao cấp GL318','Ghế luới cao cấp GL318,Ghế lưới cao cấp khung tựa nhựa,tay nhựa,chân thép mạ','Ghế lưới cao cấp khung tựa nhựa, tay nhựa, chân thép mạ'),(57,'ke-sach-chu-x-chakaluka',0,'product',225,'vi','KỆ SÁCH CHỮ X CHAKALUKA','KỆ SÁCH CHỮ X CHAKALUKA','kệ sách, kệ chữ X màu trắng\r\nNgang 1200 X Sâu 330 X Cao 1500 mm\r\nhoàn toàn bằng gỗ tự nhiên'),(58,'chinh-sach-giao-hang',0,'page',57,'vi','CHÍNH SÁCH GIAO HÀNG','CHÍNH SÁCH GIAO HÀNG','CHÍNH SÁCH GIAO HÀNG\r\n'),(59,'chinh-sach-doi-tra',0,'page',58,'vi','CHÍNH SÁCH ĐỔI TRẢ','CHÍNH SÁCH ĐỔI TRẢ','CHÍNH SÁCH ĐỔI TRẢ\r\n\r\n'),(60,'huong-dan-thanh-toan',0,'page',59,'vi','HƯỚNG DẪN THANH TOÁN','Hướng dẫn thanh toán,HƯỚNG DẪN THANH TOÁN','HƯỚNG DẪN THANH TOÁN'),(61,'huong-dan-mua-hang',0,'page',60,'vi','HƯỚNG DẪN MUA HÀNG','HƯỚNG DẪN MUA HÀNG','HƯỚNG DẪN MUA HÀNG'),(66,'qua-tang',1,'page',62,'vi','tieu de trang','salpage','mo ta trang'),(99,'thong-bao-khan-cap',1,'page',95,'vi','Trái cây Trung Quốc chứa chất độc phá hủy nội tạng','THÔNG BÁO KHẨN CẤP,cam độc,các loại Hoa Quả từ Trung Quốc','Một số nước đã phát hiện trái cây Trung Quốc có thuốc trừ sâu, chất gây ung thư, melamine. Đáng lo ngại là những loại trái cây này đang tràn ngập thị trường Việt Nam.'),(102,'nhom-tuy-chon-1',1,'group',118,'vi','Nhóm tùy chọn 1','Nhóm tùy chọn 1',''),(103,'nhom-tuy-chon-2',1,'group',119,'vi','Nhóm tùy chọn 2','Nhóm tùy chọn 2',''),(104,'nhom-tuy-chon-3',1,'group',120,'vi','Nhóm tùy chọn 3','Nhóm tùy chọn 3','');
/*!40000 ALTER TABLE `wb_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_sessions`
--

DROP TABLE IF EXISTS `wb_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_sessions` (
  `id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_sessions`
--

LOCK TABLES `wb_sessions` WRITE;
/*!40000 ALTER TABLE `wb_sessions` DISABLE KEYS */;
INSERT INTO `wb_sessions` VALUES ('4k4mjadSxaKhRd29Dn77tv5FW8s21Hgwet1gzZXa',NULL,'171.248.166.100','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','ZXlKcGRpSTZJbGhQZEVOY0x6TkNRbWhVZEhCaVpFNUVZVm9yUlZ3dmR6MDlJaXdpZG1Gc2RXVWlPaUppTkZKNlNWcDBNMGRHVjNoaWMwdDFiMU5XWlVScFRIYzJZa3BuYlRNeWR6RTJiM0JNSzJaTVkxVlBXbkIyYlZaeGFpdGlNV1ZyU21sV1IxZFhZbEJNVlZST1ExbEliREZtYTBzMU1rWnBiVTkzYUdSRFZXWnhkVmhxYTFaNWMyOW9RV0pCUVVoTlIzcDZZbE42Tkcxc1pFdEZhRmN3VVRJNFhDOURSekpIYVZKeFkycG9OMWhuVjNsMlVYWlZURXRXS3pRM1EycGNMMnhITlZFck5sWXhTMmwxTkZoNFl6RTFZbWxPVm1GR2EzaEJibWRQY0dnck4zVTFSMlpVVFZZNFNWQjVUREpsY0RkR1NrY3lLMHRvWVZGUVIzRkdUR3B0Y0hOY0x6ZGFPVGxPTUd3eGFXSk5VVWQ1ZG1NMmNIRm1jV0ZyWVN0UU9VcFJURFpPZFhablUxQTRka1E0VFRkc2RrTTVTRVZWY0hZM1RVdHJPVXM0UVQwOUlpd2liV0ZqSWpvaU1qYzFNV0UxWVRNNFpETXlOemRpWkdNMFlqSTJZVFpqWXpBME1HWXlNV0kzTlRGaU4yTXpZVEl5WmpNMk5qZ3lOR1F6WWpWa05tVXlZekZoT1dKak55Sjk=',1530361921),('9V9ycn35FCfTGZLDGfd5LQOQu4d71YkNhiaYbSKb',NULL,'123.30.175.138','Mozilla/5.0 (compatible; coccocbot-web/1.0; +http://help.coccoc.com/searchengine)','ZXlKcGRpSTZJbGhhU2pnMFNXaFdSRlJ1TWxoQ2VWVndPR2xoUkZFOVBTSXNJblpoYkhWbElqb2llakZuUnlzM1ZqVnVjVTVCWVVKdFJuaGNMMVJvY2pGd1pWbzFPVEZzV2xNelR6SkhaVlYwVGtkc1RFNXRUMXd2Y21KNGJ6Uk9lV2xRWms1NFpVMVVObWxKVEhoMVJFaEVZVFJjTDFoY0wxTkNXVWhGUmtweldISm9XVVp4YmxCTWFEUmFUR3B3WjBRd0sybEtkSEZOSzFFek5WWmhPSFU1WlVWclpYSnNiRUZ2UkhobE5WZEZTVU5tVDBKWlprMXhhbnBpU1VoblMxY3pXbEZ5Y2xaSWNVc3lUWGx4TXpWa2MzRlpWRzFMWWxOUFZITmNMME41UTA1eE5sTTFOek5yZVdwSVJFa3hlVlZZY21SUWJWTnJkbUZSVFVad1pDdE1VRUZwZDA1Y0wyaHJYQzlQYldsTlZFSktRbVpFTTFSaWEwMTBhMmhYTUcxQlNYaDFUR2d3YURKSGFETnNYQzlMWVRZMlVTdFZOa3BpU0hoSFVHZHVNRXBGVURGalF5dHpkV3hMTUdOMVRsTlNOamd3VG10NWFIVXJaejBpTENKdFlXTWlPaUk0WkdOalpXSmlNall6WkdWaE16RTFOekk0TWpVNU1EQmxOamhrTjJRd09EUmlaV1V6WmpWbE1tTTFaakkwTURoallXSTBaVEl5TUdNek9ESXhOV05tSW4wPQ==',1530347967),('camwHlRXfp0nRNwJSbgrhWnjNVUNxUykZ89z74EE',NULL,'123.21.18.56','Mozilla/5.0 (Linux; Android 7.0; SM-G570Y Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/67.0.3396.87 Mobile Safari/537.36 Zalo/1.0','ZXlKcGRpSTZJbVY0YlVOcGVYTjFkWGQxVjBKYU5tbFlkemhFTW1jOVBTSXNJblpoYkhWbElqb2lPVUY0V2t0SmNXVmhWM1Y0UWt4cFFrc3dWV1pJZUV0SVRtWnBSM0J3VTB3MmJHdHRVbXBTUkhCd1dtRnNaRU5xWldjNFozSnFOMWQyYTBKa1dGbEJaMGxvUjJObVppdHROWGs1ZFU1ak5saDBUSEo0VkhseWIydGNMMGcwYkRSdGR6aFBUalpNV1c5eWRrUldUM1pvTUdGaVlWRnVObWxZWVdSNldHdDBiWFZ1ZEZKalVWcHlNRlJxY0hoS1V6bDVjWEIxUWtvd2FGaEVjVUZvYkVKTVJ6TXJSMDVNTVZaTWNsTkRiRmxoTVVVMlJIWmxObWw2SzJsRldXd3JVRVp4WW00MFZubHpkMHc0TjNoU1JqZE9aVEp5U1RFeFJVRk1NbTFHUTNkUk4xZHpOMjVMT0ZJd2FVb3hUMVI1WTBoWmJtSm9OM2ROVm5SVFdVZGhZMDlTVW1JM1FtSXplVU5jTDFkYVJscFdVMVEzVmx3dllXbDBPV1pHTTNWWmFUUXpiVTVFYTBVNGRYYzNUVzlZWkVwaFRsbFlURmROTW5jNVFYbG5VbTAyUTFSMlMzQWlMQ0p0WVdNaU9pSmtOV1l3T0dVeU9EQTJOamhqTXpRd1lUUXhPRGt3T1RaallUTTJNVEl3TW1OaE16WmxZelZrT1RkaFpXTmtaVFV3WVdFMVpHWXlZelptWkdZeFlqSmlJbjA9',1530333085),('CfdvEzuaUURg9DVImFAUizoZcmlrKOLD13pG53dY',NULL,'171.230.248.228','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','ZXlKcGRpSTZJbEY1U1dJeFJtaFZZMlJYYUZGalFraDVSREpqYUhjOVBTSXNJblpoYkhWbElqb2lUbkI0VGpjd09WVlBlVFIxSzBoa1ozVkVhRE5MWjNKSFhDOXhUWGgzTnpKRVJHUldkWFpYTkRCelZ6SmxlV3A2YWx3dldVbGxVMHN6UTI1blhDOXZlVTlxZEV4TmQxZ3pXR0pvT0doNU1VZGNMMGxqV201RU4wSjNiMWQwT1ROTFp6aGFlRmxaY201S1JHUnBiVUp5WldadE16Sm9PR3B0TUVKNlV5dHJZbVZ2U0dSQ1VqTXlWekpXY1RKeVFXbHNha1pXZGpaV1hDOWxVVWQ2YzJsUmJ6ZzJTRVI1YzB4MWIycHVkWHBLTVRSRVNWa3lSblIzYjB4cFZuaFFWbTA0ZFU5d1oxa3daRlJNVDJST2JVUTVYQzlFVFdwcmRYRk5OWE5rYVRKb2JqUjRVM2hVVHpZd1N6VnlWVTVLV0hGeFExTkNSV3RtVUdscWNEbEJYQzlaUkhwVmNGRmNMekJPU2pabWRXTlhjbVkwUms1RFZEWlZPR2RyWlhORVVUMDlJaXdpYldGaklqb2lPR1V3T1RreVlXTTNNR0l6WVRWbVpUUmxOR1V4WWpBME5tUTFaVEkxTTJGaU5qSXhZalF3Tm1VMU5HWXhPVGd3T1RreFl6SmlOak5tTURVd1pqSTFPU0o5',1530383018),('cJ4UEzPBN7GbVbYA9eqDCEUXEGmzvdam0aystD37',NULL,'42.112.90.46','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/70.4.230 Chrome/64.4.3282.230 Safari/537.36','ZXlKcGRpSTZJbVJ3ZUZSSlZXVlVORlU1VWtsclkxVXJabnBLWm1jOVBTSXNJblpoYkhWbElqb2lWamh3Y0UwNFdETjBWemRtUkhWeU9HZDZaMFEzWlRodGJVUkljeXQ2VTFoYVNsbHFlVXBXVFRST1FrNDBXRnB3V0RJd05VOXBjMEV4UVdkc1RHeExabUprVW1rM1VETnFaamRUWkRkVlZsVnBLMm8yWlZZM2VESTFjMUJTWEM5RFpWQjBhM05zWVRsd2RHVktaVEZqTmtoNVRVcHJZVGxSVkVjeFYzUnZSbGtySzNKcGNXNUROR3N6VkU1Q2J6WjBPRlZ2YlhGRVN6Tk1NV2hhUlhKVk1XaE1hamRIZG01eFVXWkVLMmhpTWtFMFkzVlJVVkp6YW1oNloyYzNWVTFxWjFnMVRVZGNMMU5oZUZaMlVIcFplV0pDVGpGRFpXczBjbHBpV0U1RlVXTkVaazVvVFRoamVFSk9TVFJUVkRkcGFrTnNVMUpHTkdNNFEwZEhXVzVyZUU5ckszUjViRmd4YUZoNlNVTm5WWEZCWlRJMWJGQmtRVDA5SWl3aWJXRmpJam9pWldVeU9XTTVORGcxWTJFeFl6VTBNR05sWXpRM05qVXlOR1V4TWpsak1ETm1aRFU1TkRVMlkyRXdaVFUyTURneE9URXpNRGszWWpjMk5EQTVZekZrTXlKOQ==',1530372912),('dAMLS9Vi93Bz5GYQ3GJ174JKKeZ5RVejekkHmRWb',NULL,'123.30.175.137','Mozilla/5.0 (compatible; coccocbot-web/1.0; +http://help.coccoc.com/searchengine)','ZXlKcGRpSTZJazVDU1haS2VFRktaVzVjTDNkVU5IazVXV3RMU2tSblBUMGlMQ0oyWVd4MVpTSTZJa1ZaUkZSUFNXOXFZbmhzU0VWTlhDOTRjRzVQY1VkVFRtcGFNVXBxUlV3elQyWTJWV2REZEVWUmRVOVFaRzlOYkdWRlhDOHJkbVZ0WmtKVWRUWlliekp4Y1VGd1RIbEdNVmhZYm5aS2NVRkVaVEoxZDI1V1lXOVZUV2RHS3psbGVIaGNMMEYxZFZSdGFtZERhemx3VkZOV01GSndOMVYwYWt0SllUbHdjM0I0YzNRME1XRXdjbEI2VVhVM1FrUnllVWROVVU1TmMwNWtiRGg2T1Z3dldsd3ZRV1UyWW5Nd1ZFUlliVE5aTVRsMEsxd3ZRMXd2U0hvck0xVkdRaXMxUmtoaFQzbG9NWGd5TTA5WFNTdDRlVnd2WlZoUE4zWjJjbVEyVTBSVmRVVnBlRU5UWVhJcllteHBRMGN6ZFhaRFJHOWNMMlZJY1ROT1ZHTXpLM05RVm1wb2R6SmhYQzlzYWxwNlZWVnFRVTlPYmxOQ1IzVnZNakpUZWt4SlEwTTNlRU4zTWpCMmExbEVTWEJMVDJSeGQyTkhiRzFzY0hKNlJtVlpjMXBqUmt4eWRURm5XREJpYjJsdWRtaHZLelZXVEhoblltUmpjRUZHTUVGQ1Z6bHJORUZqUTFaR2Fsb3hlRmRKTUUxS2N6VnpkRXhCTkZsUFFtVlNXVFZMY0VKblQzSldSRUpUVlhoRmNEWk1TVWxETlhOS2JpczNaVVJDYlRCTWIyVlhXakF5VEZCcWIwZEhWbk5FVEZWYWJ6TlpWVFZrTjBaQlBTSXNJbTFoWXlJNklqbGlNbUk0TkdVMk9EWmtZV0k0TkdFeE5EUTBORFppTTJNMVpUTTNObVJrTVdNeE5qUTFPV1F4WkRGak1qTTVNVEl4TkRBM1ltSmtPVFV3TnpNMk1qWWlmUT09',1530416157),('dfRHp3pfUmWxFiLpYbxuuD8t41dYguDHeezHNxtn',NULL,'123.21.18.56','Mozilla/5.0 (Linux; Android 7.0; SAMSUNG SM-G570Y Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/7.2 Chrome/59.0.3071.125 Mobile Safari/537.36','ZXlKcGRpSTZJa2wxVlhGamRHWlNWMnRRUm5OVGIwMVJSM1ZaV0VFOVBTSXNJblpoYkhWbElqb2lTWGh2ZGxOSmN5dE5ZM0ZHWlN0eEsxTjNiRGhLV1RVNWRVbFNLMUZsUW01eFJEZEhkMjlVU1hWb1lVWm1VbkJ6YWxwSVRUVTNhRGswYW01c1VtSTFhemRKYW5aSFNEWjRXRVpqUlVNemVHbHFOWGQ1YkRZMlduUkhRek41ZFhrMlhDODVLMFJCVlhkVVlscFNTVnBJY0hwaFNISlJXR0p6TVd0aWRVTjVjakJzVlZGNlRVUlpkR05CY0V0cVNIbG5NRVpaWEM5U1NGYzJlbHB3Um01dVdVa3pPRWRtZGtwcVZWWnRhSFYwVkZvM1ZUSlRWbGg2TjI5dGJXSTBNMFphZUZoV1owdEJiV0ZJTldwMWRHbHVjamRFZVVocFRGUXhhMlIxUTA5VFVrNTFZalF6VjJoa1J6UmxNU3NyYVdkeWR6bDJSVmhrUVc1dE9Gd3ZLMWgzTkdsUVhDOHJlbVJ0UVVaY0wyWm5lbUV3VGtaMFFsTm1WbEJXVVQwOUlpd2liV0ZqSWpvaU5qTmhOMkZoT1dRM05UVTVOalk1T0RGaFpEaGtPVFZpTURrME5HVXdNR1UzTm1SbE56VXdNRFJsWldVMVptWTJNR0k1WW1WbE1qSTRNREJtWlRNeU1pSjk=',1530329304),('eecpMe8LlMKABVJs4nvFjq8rPBX0FLcw9feNlFV7',NULL,'116.108.236.72','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','ZXlKcGRpSTZJbEZhY1hWaVRXTlBkWFYwZFdoWmVscE9USEpUZVZFOVBTSXNJblpoYkhWbElqb2lXV2RYZDFkdmRtNUNlVWgyUWpWcWEwSllOR1pCVGtwblNHUjNNSGRDYm5GNmRpdE5NbmgxZEhaS1VFWkhWMFpHUXpoQ00zWkhhM1ZFWTJaME1uazNZVmRCU1hGUVdEWTBlRlJOVmpjeU0yZE1VVk0wUmtwelJYTjZXbFpaZVRGaE5HWkdlSGx1ZEVoT1VGaFNSVVowVjFGNFoxSlpia001YmtSSk9IRmNMemxxVmtGMlFXWTFjR2xDTVZOWVNGUmxRWEZaUWpKV1pFazBjMkV6Tm05TVdETlZTbE5pVWxsb01tczBjelI0WWs4cmFHZExiV2gyV2tabU5qSnVhVFl3YjJkM2RrUkNRblp6V1VSdWJESnFlSG80UmxKWmFHUk9kVXRtVjAxS1dFUndSVTE1WTB0WlkwNVhZVEpsVFVWeGVucGlOV3gyU1dWaFpXZFZTbXhLTUhObk9XRXdWbXRJWVRGT1RHOW1WME5pVDA1VGVsSlJQVDBpTENKdFlXTWlPaUkwTWpRME5USXpaVFEwTldSbE1UTTJaVEZsTlRFM05XVmlPR0kxT0RJeFl6QTNORFZrWWpZd01qZzBaVFUzTTJabE1XRmtOelprWVRoa05tUTJZelpqSW4wPQ==',1530347129),('FM3Ls47L8HalY0OowR2CZ98om9OlSBc5uTrtRc5i',NULL,'123.30.175.138','Mozilla/5.0 (compatible; coccocbot-web/1.0; +http://help.coccoc.com/searchengine)','ZXlKcGRpSTZJa1JKYlVWeFpERmpXa1ZITm5Rd1kyTTVPV1I1ZUhjOVBTSXNJblpoYkhWbElqb2lLMDUxVTJSSWNIUmpRVElyZG14NlR6QkRVVmh2VVVaNGVGTmlTRXh4YUVOdGIxSjRObVUwVVZKWmFuUlROQ3QzVFZKbFRVeFNkRnd2UWxaVlZ6WnVRbmxTVkhRelNXd3hOMlJyWEM5aFozVnJOMkZ5WkZBMGF6ZG1XSFJyUlhGb016ZENjMnh3YzFKVVRGbFBlVFZwZUVWblMydEJPVTFxZWpoNWRYQldNV2d6ZFROWWVraExVVnd2UWxOallXZzFiV3g1V0c5VFJGSTJTVEZZVTFZNVYySjVhQ3R6YWxGUVdVeG9WSEptZVZVcllYTkRWVUprV2pOck1Va3pha3h0Vkd0bFJrWlpiMWhVVFhGdE1tcHlYQzkxVFVwVGRscE9UVXhRVlhRclNXUnhhak4yYzBGM1ltTmxZMjEyWWsxWFQwOWlSMEVyTUZGU05FdzJhekpHVWxCbloxWmhZbkp1VUhrME5uaFBWWGRWTW5ZeFNuazROMjAzVUhOSGNISlNObEI2Y2pab09XMDJVbElyUWsxcVEwTldaeXQ0ZFVwRmJUZExYQzh4WjI5Q1RWWnZkbEJoV0ZOM1dWbFdPRWhjTDFWSVNFb3pibmhZVGtFeWNqaFBSMVJ2T1RsS1pYVlhiR1JLZFVsRWNVazRhemhpVG1sRFNrZGtTMk4zZFVGTGExYzRXV2RvYTFKc1dEWnNZa0pLVjBkM2VFSXJiMVJRYTBZeFhDOTZaalJuUlZSVFQyTnlYQzlFYzFGM1hDOXpUVmhOTVdwQk9YaEZWbFpWV1ZWVFdqTjVlVmRRWjBFMU1VWmNMM00wVWtGUWRrTmNMMVpwYzJjMVEyUnROMjg1VVQwOUlpd2liV0ZqSWpvaU5tWTFOREl3T1dWaFptSmlaRGM0TldZMFpXVTVZVFZqTm1FNVlXRmlabVZtWkRsbFlXSTNNV1V5TUdVNE4yWTNZemN5WmpGbU1EQXdNek0zT0RWaFpTSjk=',1530347974),('GAkjf3QQmdPDxpq9GsLuziToW1T5UDMlnT3MLhnB',NULL,'123.21.18.56','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','ZXlKcGRpSTZJamw0VVhvM1F5czFaakJJTkZOaGNHc3lZelZ6SzFFOVBTSXNJblpoYkhWbElqb2laRk5ITm1kSU9YUmNMelZMYzNSTFpIcHhWMGh6VEU4NWFrWmliM0ZwU21wSFRETnpiMDl1TjBoUlMybFdUMUZJYm5GQ2NFWnFWVEJRYnpoWVNISklRWFZjTDJGblZTdEdNRkpyY2xadmFDczFkR3hRT0RsUlRXaGhZa0kzSzNNMVYwbGtWRko1YUc5dldYSlZiVU5RTjFGdlpsVnJLMEpqZHpONlZrZDZZVzlLUzJkVk5FMW9Na0pQYUhFM2VIaFhTa3B3VDNnNVdGWkpWV1F5YkhkaVlUQnRVSFkxVG1kR01GTlBTWGgzTXl0eGVrRjRiRWxsTWtkcWREbGhSRGR3Wmx3dk9GRmpUamxrWTJWTlpuVmpUbE5sVTBKVWJYcHhkVUo0UkVaT2JqVkNVWEZJUTJKV1ltNDBjRk5PWjB0M1ZtbE1aWE5QVW1KaFkxRmxZVlpXUzJKM1QyaE9jVTlMVXpsbmNIZERWRFI1ZG10WWRUaEhiWGM5UFNJc0ltMWhZeUk2SWpreE9XWmlZMlkzTlRZMU5UVTVNRFV3TkRRNFlqQmhaVFJqTWprNVpqTmhNekJpTnpNM1pHWTFOemRsTW1JeU4yTTFNakV4WldRek9HTXlabVEyT1dFaWZRPT0=',1530420441),('Hcw7QgPRwBOT6hpKpQRdY1papwYmIn20oqFnn1b8',NULL,'123.21.18.56','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36','ZXlKcGRpSTZJbGNyU1dvMloyaEtTVlJUVGs1alQyZzRibVJFY1djOVBTSXNJblpoYkhWbElqb2libGxQTUdaamNWVXhhMGRKVVZSTU1rOU1TRXRsTTJSQ1RGQjNSM2hzSzJadWFXcHdkVXhvT0RWelRXaDVTSG80TUdrNFJGd3ZjM0F6T1ZSdFptWkNlVFVyY0VVMlJDdENOVlpGYmpWV00zUkNRVWQ1WlhGeWJURllhMjAyWlZSc2VHUk1Za2hOWWtrNWJ6Qk5iMWsxWTNOTmEyODJTVkVyVUhkdmMwUnZRbEV4UjBkd1VrSjFhMk5pTjBkUFJVSmNMM051VUUxcmVHZzNSRVE0YlU4cmNGWnpWRkZxVEhwRk1GWklNVU4yZWpOVU9WRjFPSFl4YjB0TGNrc3lUVlZLZDBKUGVqVlJLMU5RU1RWMmRGVXdiVk5uWTNWc2NreE1OMVp5Y1ZGeVRHbFJhMVV5T0dsMlJFaG1jSGxrVTBrMGJYTmtSMk5HVUZncmVXUk5la2gyUkZsQmFGZDZVMVZJUjNoRlpuSnhNbVl4ZUZWUWFHVnZaejA5SWl3aWJXRmpJam9pTWpNeU9Ea3lNVFEyT1RoaVlqQXpOek00TlROaVlXRXhNak0xWlRSallXVmpaRGN3WWpZd1ptTmxNamcyT0RFd00yRTJZbU5tWmpFd05URXlaak15TWlKOQ==',1530333229),('hHmGw6AYwCixWdlesOf1bVqNLh8oAXmAlrbutyaP',NULL,'203.205.27.166','Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36','ZXlKcGRpSTZJa1JFTUd0Qk5ETTJPREF4Ym1WTlUyaE1kSFZ1Wm5jOVBTSXNJblpoYkhWbElqb2laVWhWVjJGeFlsSm9TbGRaY1VkaEszRlpZMFZ5TWpsNE0yMW5iVzVZY2s1MFZXUXJjMFZjTDJ4bWExTXhaak41VVVNcloyVlZkbTk2Yml0VE1VdDJTRGs0ZDBjeWFuSmhXbEJ1UVhVME1HUlJka1J0UzFaUFFuWkRXWEZNU1hVMFUzUlBZa0ZzZUZZelMzaFpkRkk0ZFVKclpsQTFXblZ0ZEcwM1IxZE5TVGxTVDFkRVNGSjVUR2RqY0c0eVRHVk5SWEZNV2pKSWVFeFdWRzFwZFhsYU5VZHRVSFUxYURkcmJYQmpURWRQTkhRclhDOU1NRmhSYkZFMWFVeENaMEpQT1VSclltMXJORWxWUmxOWlJXUlJSbkZZZFZwNVpHOW1ZVEJhYkZ3dlZsUnhZa1YzVHpOaE0wSk1XU3NyTkRSTmFEWlVkazA0ZW5Bd2RrTm1NbEpyV2s0M2RuQllhemR0T1hveFNsSjRiVFJhYlVGblJERjVWRkU5UFNJc0ltMWhZeUk2SWpRM01tTTRZakprTVRSbE56Tm1ZelJpTVRKaU5ERTVPRFJpTWpNMllUSmxNVEZpWmpsaE1tVTFOems1WWpNMFl6ZzNNekpoTVRZM05XTXlNMlk0TjJJaWZRPT0=',1530342230),('MecGUlFqsaN5wiew9RwAOmwnh2MpbkKlnh2WoN9F',NULL,'123.21.18.56','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/70.4.236 Chrome/64.4.3282.236 Safari/537.36','ZXlKcGRpSTZJa1ZZY0d4MVFWQlNNMlpYZG1SMFJVaFhNRUpTSzNjOVBTSXNJblpoYkhWbElqb2lRV1ZPWTNaTVYwNTRaRVZtVEVGaVkyeE5UR2dyYVVGQlIyeEVaVUZ5VEZkNkswVlpWbmxRV0RaWFVuWk9OVzVSTTFCRlMzYzRjbWc1YlZKdVZHUnNNVmhUWmpGdlpsZFhObkpIVjB4R2RtVkxRa2cyVldsUWFIaEtXRWx6WmtkalExWm1RakZRWTJ3NGNESmtUek16YVd4WFkxTkpXbkpJYkROM1MzZHdUbnAyY1dSU2IwaE9hWEJXZW5SM2RuWlJORlpWYkRkSlJteHlhVE5ZV0dsdU5ETkNUR3BCZFZoTlpEVjRTV3Q2VkZSNlZXWTNUMnRjTDBkM0sxcE5XbGt5UVVKSFVFaG9UMnhyTm5kTFVEQkNhSGQ0TVVaWWFsaDNkWGRvWlhsQ2JYZzRTMloyTVVoQ09IWjRaV2N4U2pnME5qWTNjRnBUUmxkMVUwRkdjbGxSWXpWUldrWkxSa1JJYTNVMFdYWk9hMDFUV25JclRGRkJQVDBpTENKdFlXTWlPaUl3TnprME5UWXdaREZtTkRGaVl6WmlabU5tTXpWa05qSm1NR0UyT0RFeU5qWmxOell4TnpkaFltUXlZVEF4WkRReVltSTJaVEkzTnpBMk56VXpaRGs0SW4wPQ==',1530332935),('OQTmBjygt8kw5VB7sQi7dgB3ev28xaasZUokmdGh',NULL,'123.30.175.136','Mozilla/5.0 (compatible; coccocbot-web/1.0; +http://help.coccoc.com/searchengine)','ZXlKcGRpSTZJak13VGxrMVRFVlpOV05xZFZCeFhDOHlSMmRDTkZsM1BUMGlMQ0oyWVd4MVpTSTZJbFpNSzFsRFVFMVNRbXhWTlVWRFRXWjBTMGxtWEM5VVhDOUNaMGxYYlRKelZrVnhWbWRvYmx3dmVUUmlVWEZWZGx3dlkzbEVSMU5pY1hvd1JVczBkV0ZwVkdRMGRGVjFXRWxFU0RKclVtbDVhbGRhVm1SeFJsUmlkRnd2U1ZJNGRrTnpWVzl3YzNSdlZsRjFSemxOYUZ3dlZsRkNYQzlHV1VWWVQyTmhLMnc0VUdoR1UzUTFSWFZqYjFBMmNFTnRZbFJCVDFNeVpYQkdOMHN6Wm5JNFJraGNMMGhvTWs0MFhDOTJjVk5rWWpkUmVqVXJUeXQxVnpobE56bHFUbGg0Y0V4d2IxVjBjbEY0ZURoNFNIbEtObk0xWEM5dUt6WmhYQzlaZGs5YWIxUjBUbGR4VkU5dE5XSlhVVTFhTlRoVFIwWkxNeXRrVVVKUk0ybDVOemMwUW1kdFJqQjRNSEpsY21JeVZERXlUelJVTTFKVE5HSXlPVlpUT1UxdVhDOVJXV2wzUFQwaUxDSnRZV01pT2lKaFpXVm1OV0ZsTTJFek9HSTFOemd3TUdNeFl6UmtaamxqTVRkaVlXTXlPVGd4TXpCaE1XSmtORGhoTVRNNVpUazRNREUyTWpnNE5qWTNPVGsyWlRFM0luMD0=',1530414684),('rusJAYqN3AS2eggvpAId6C7hwrPuN3vHdqpjeq4q',NULL,'123.30.175.207','Mozilla/5.0 (compatible; coccocbot-web/1.0; +http://help.coccoc.com/searchengine)','ZXlKcGRpSTZJa3BITTJ4Wk5HWkJjRlpoYjBwTE1FTm5kalp3VDFFOVBTSXNJblpoYkhWbElqb2lTa1F6TldGUmFIWlVTamhuVEhoaGFGVmtkekUxYlVkT0swVlFPRk4wWTFoVlQycERXbEpIV2pCNE9VRnZiMnBTYUZ3dmQyWmFPRTAzVDBkQldXMHdVR1UwU21wMVp6aFhOVlowTmpKdlprMTVhMWhLYVZkQmFUZEZUbEJuWkN0WloxTTFNR013U21KRGVXTXpiRlJVUkZKblpsbHZURzAxZWl0cVZHMWNMMWw1YjI1WlFXeHhNekJsWjFKdlIySk1hVGQzVFVkc1oyMUtkRlZRVVVSU1JtdE1aRU5pVjNGSVFtdDFUMmh4VEhsVk1VSmhhek5LYlhVMVExWnVOVFJVUW5jclFUQjBObGhwTWxRMGRGd3ZWM3BQZW1FMk5uRnBUMGh4WVU1YVEyOVBkVk56TWtKYVpFWkJlRzgxY3pKYWR6aERRVzExTVhsS1pUUkZXRTQzWkVoMVVWcHJNa1l6Wldnd01IWTJPREIyVnprM2JrMXBWV015UVc0M2RuTkNaV3RHYkRSclRsQTNhWEUyV0dzOUlpd2liV0ZqSWpvaU5XTTVPREkwTm1aak1qWTJPVE0yWlRkak1tVXhabVUzT0dZMk9UY3pNbVl5T1dNek5qazNNekl5WkRZeU9UUTVaVE0zT1RZM1lXTTJPR1F6TXpGalpDSjk=',1530414677),('WmhtQem2QEyGEzgHv0KNzk3N6hCad3rt8N9QS8bb',NULL,'123.21.18.56','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/70.4.236 Chrome/64.4.3282.236 Safari/537.36','ZXlKcGRpSTZJbmhpZFhSUGVHNURPVnd2VERCMWMxRTBTbk5UTkc5blBUMGlMQ0oyWVd4MVpTSTZJbkZPYUVwd1RqZHlZbVJuWXpWVk9EbHdTblp6UlhsMldGZFFjV1lyVmxKRVFXbGpjbk5IV0hZMU5HNXJTbk5QVm5oSlYyUjJYQzlrV21sUE5sUldSRGQxTm1NMWEyNTVVekpRWldwSVMxWlVRV2wwVFRSR1ZsaDBVV2R4U3l0b2VtcFVObXM1UW01QlFsQnlabU5OU1hBelF6Rk1VRWRPT1RsUFMzSklSMGRRV0ZSM2FYTjFXa1Z5VDF3dk5HOWNMMnhWTVcxaVJYVmhkeXQ1TWtKNlNuVlRLMXd2V1doQ1ozaHdXWGxGUldSRFRraG9OWEZqTm1WSVQybGlNMGt6VDFVd00yUjFlVmwxVjI1S09DdFRTM2RRT0dkS1NqQnRUMUEzVFVnNU0weFpRMHNyVmtWMmNtVTBaMnBwVUc5RVNrZHFTRTFyTTNsWFpsQlRVV3BEYTJRd1NFeDRiU3MzTkdnMFJrcG1Oa0ZDTlZKM2FEVTNNek5GUVQwOUlpd2liV0ZqSWpvaVpqQmpZVEEwT0dWa1l6RTFNRGszTm1GbE1UWXhaVEl6T1Rjd01XUTNOMkl3Tmprd1pHUmxNR1JtTkRkaVlUSmpPVEZpT0RBMk4ySXpOamcxWWpFNE1pSjk=',1530332935);
/*!40000 ALTER TABLE `wb_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_shipping_area`
--

DROP TABLE IF EXISTS `wb_shipping_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_shipping_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `based_on` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'price',
  `min` decimal(15,2) NOT NULL DEFAULT '0.00',
  `max` decimal(15,2) DEFAULT NULL,
  `fee` decimal(15,2) NOT NULL,
  `supported_districts` text COLLATE utf8_unicode_ci,
  `unsupported_districts` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_shipping_area`
--

LOCK TABLES `wb_shipping_area` WRITE;
/*!40000 ALTER TABLE `wb_shipping_area` DISABLE KEYS */;
INSERT INTO `wb_shipping_area` VALUES (1,2,'Giao hàng tận nơi','price',0.00,NULL,0.00,'{\"31\":10000,\"32\":20000,\"33\":30000,\"34\":40000,\"35\":50000,\"36\":60000,\"37\":70000,\"38\":80000,\"39\":90000,\"40\":100000,\"41\":110000,\"42\":120000,\"43\":121000,\"44\":122000,\"45\":123000,\"46\":124000,\"47\":125000,\"48\":126000,\"49\":127000,\"50\":128000,\"51\":129000,\"52\":130000,\"53\":131000,\"54\":132000}','[]','2018-01-23 08:28:47','2018-03-06 09:40:43'),(2,1,'Giao hàng tận nơi','price',0.00,500000.00,50000.00,'{\"1\":50000,\"2\":50000,\"3\":50000,\"4\":50000,\"5\":50000,\"6\":50000,\"7\":50000,\"8\":50000,\"9\":50000,\"10\":50000,\"11\":50000,\"12\":50000,\"13\":50000,\"14\":50000,\"15\":50000,\"16\":50000,\"17\":50000,\"18\":50000,\"19\":50000,\"20\":50000,\"21\":50000,\"22\":50000,\"23\":50000,\"24\":50000,\"25\":50000,\"26\":50000,\"27\":50000,\"28\":50000,\"29\":50000,\"30\":50000}','[]','2018-01-23 08:34:44','2018-01-23 08:48:30'),(3,1,'Giao hàng tận nơi','price',5000000.00,15000000.00,25000.00,'{\"1\":25000,\"2\":25000,\"3\":25000,\"4\":25000,\"5\":25000,\"6\":25000,\"7\":25000,\"8\":25000,\"9\":25000,\"10\":25000,\"11\":25000,\"12\":25000,\"13\":25000,\"14\":25000,\"15\":25000,\"16\":25000,\"17\":25000,\"18\":25000,\"19\":25000,\"20\":25000,\"21\":25000,\"22\":25000,\"23\":25000,\"24\":25000,\"25\":25000,\"26\":25000,\"27\":25000,\"28\":25000,\"29\":25000,\"30\":25000}','[]','2018-01-23 08:36:45','2018-01-23 09:02:55');
/*!40000 ALTER TABLE `wb_shipping_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_slider`
--

DROP TABLE IF EXISTS `wb_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '''''',
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_slider`
--

LOCK TABLES `wb_slider` WRITE;
/*!40000 ALTER TABLE `wb_slider` DISABLE KEYS */;
INSERT INTO `wb_slider` VALUES (3,'Slider','owl_carousel','{\"owl_carousel\":{\"js_library\":{\"animatein\":\"fadeIn\",\"animateout\":\"fadeOut\",\"pagination\":\"false\",\"navigation\":\"true\",\"loop\":\"true\",\"autoplay\":\"true\",\"smartSpeed\":450},\"website\":{\"width\":\"\",\"height\":\"\",\"text_animation\":\"fadeIn\",\"text_position\":\"center\"}}}','2017-12-04 06:53:58','2018-05-04 09:22:24');
/*!40000 ALTER TABLE `wb_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_slider_image`
--

DROP TABLE IF EXISTS `wb_slider_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_slider_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(11) NOT NULL,
  `lang_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `src` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `href` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `alt` text COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text1` text COLLATE utf8_unicode_ci,
  `text2` text COLLATE utf8_unicode_ci,
  `text3` text COLLATE utf8_unicode_ci,
  `is_new_tab` tinyint(1) DEFAULT '0',
  `sort_order` int(11) DEFAULT '0',
  `is_published` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_slider_image`
--

LOCK TABLES `wb_slider_image` WRITE;
/*!40000 ALTER TABLE `wb_slider_image` DISABLE KEYS */;
INSERT INTO `wb_slider_image` VALUES (21,3,'vi','2018/03/02/222-slider-2.jpg','','','','','','',0,0,1,'2017-12-04 15:20:54','2018-03-02 10:48:39'),(22,3,'vi','2018/03/02/735-slider-1.jpg','','','','','','',0,1,1,'2017-12-04 15:22:47','2018-03-02 10:48:39'),(23,3,'vi','2018/03/02/801-face-3.png','','','','','','',0,2,1,'2018-02-27 10:06:01','2018-03-02 10:48:39'),(24,3,'vi','2018/03/02/88-slider-5.jpg','','','','','','',0,3,1,'2018-02-27 10:06:56','2018-03-02 10:48:39'),(25,3,'vi','2018/03/02/557-banner-1-1.jpg','','','','','','',0,4,1,'2018-02-27 10:07:34','2018-03-02 10:48:39');
/*!40000 ALTER TABLE `wb_slider_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_statistic`
--

DROP TABLE IF EXISTS `wb_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_statistic`
--

LOCK TABLES `wb_statistic` WRITE;
/*!40000 ALTER TABLE `wb_statistic` DISABLE KEYS */;
INSERT INTO `wb_statistic` VALUES (1,3,'2018-03-22'),(2,8,'2018-03-23'),(3,10,'2018-03-24'),(4,12,'2018-03-25'),(5,7,'2018-03-26'),(6,14,'2018-03-27'),(7,2,'2018-03-28'),(8,5,'2018-03-29'),(9,5,'2018-03-30'),(10,2,'2018-03-31'),(11,6,'2018-04-01'),(12,8,'2018-04-02'),(13,3,'2018-04-03'),(14,22,'2018-04-04'),(15,7,'2018-04-05'),(16,9,'2018-04-06'),(17,2,'2018-04-07'),(18,11,'2018-04-08'),(19,3,'2018-04-09'),(20,16,'2018-04-10'),(21,10,'2018-04-11'),(22,27,'2018-04-12'),(23,24,'2018-04-13'),(24,20,'2018-04-14'),(25,13,'2018-04-15'),(26,45,'2018-04-16'),(27,27,'2018-04-17'),(28,37,'2018-04-18'),(29,8,'2018-04-19'),(30,10,'2018-04-20'),(31,5,'2018-04-21'),(32,4,'2018-04-22'),(33,8,'2018-04-23'),(34,7,'2018-04-24'),(35,1,'2018-04-25'),(36,41,'2018-04-26'),(37,31,'2018-04-27'),(38,5,'2018-04-28'),(39,2,'2018-04-30'),(40,6,'2018-05-01'),(41,13,'2018-05-02'),(42,16,'2018-05-03'),(43,10,'2018-05-04'),(44,1,'2018-05-05'),(45,10,'2018-05-06'),(46,12,'2018-05-07'),(47,15,'2018-05-08'),(48,16,'2018-05-09'),(49,10,'2018-05-10'),(50,14,'2018-05-11'),(51,11,'2018-05-12'),(52,9,'2018-05-13'),(53,14,'2018-05-14'),(54,9,'2018-05-15'),(55,3,'2018-05-16'),(56,11,'2018-05-17'),(57,10,'2018-05-18'),(58,124,'2018-05-19'),(59,6,'2018-05-20'),(60,5,'2018-05-21'),(61,6,'2018-05-22'),(62,10,'2018-05-23'),(63,6,'2018-05-24'),(64,12,'2018-05-25'),(65,10,'2018-05-26'),(66,1,'2018-05-27'),(67,7,'2018-05-28'),(68,16,'2018-05-29'),(69,15,'2018-05-30'),(70,16,'2018-05-31'),(71,30,'2018-06-01'),(72,26,'2018-06-02'),(73,8,'2018-06-03'),(74,15,'2018-06-04'),(75,13,'2018-06-05'),(76,12,'2018-06-06'),(77,2,'2018-06-07'),(78,8,'2018-06-08'),(79,1,'2018-06-09'),(80,3,'2018-06-10'),(81,5,'2018-06-11'),(82,21,'2018-06-12'),(83,21,'2018-06-13'),(84,11,'2018-06-14'),(85,11,'2018-06-15'),(86,7,'2018-06-16'),(87,3,'2018-06-17'),(88,12,'2018-06-18'),(89,23,'2018-06-19'),(90,10,'2018-06-20'),(91,50,'2018-06-21'),(92,32,'2018-06-22'),(93,14,'2018-06-23'),(94,10,'2018-06-24'),(95,13,'2018-06-25'),(96,12,'2018-06-26'),(97,29,'2018-06-27'),(98,37,'2018-06-28'),(99,24,'2018-06-29'),(100,11,'2018-06-30'),(101,5,'2018-07-01');
/*!40000 ALTER TABLE `wb_statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_subscribers`
--

DROP TABLE IF EXISTS `wb_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_subscribers`
--

LOCK TABLES `wb_subscribers` WRITE;
/*!40000 ALTER TABLE `wb_subscribers` DISABLE KEYS */;
INSERT INTO `wb_subscribers` VALUES (1,'ttghjk@dfghj.xfg','','','2018-02-28 09:35:39','2018-02-28 09:35:39'),(2,'coldboy659@gmail.com','','','2018-02-28 09:36:24','2018-02-28 09:36:24'),(3,'abc@gmail.com','','','2018-03-09 03:58:28','2018-03-09 03:58:28'),(4,'coldboy65@gmail.com','','','2018-05-04 02:29:30','2018-05-04 02:29:30'),(5,'t@gmail.com','','','2018-06-22 08:04:37','2018-06-22 08:04:37');
/*!40000 ALTER TABLE `wb_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_tag_html`
--

DROP TABLE IF EXISTS `wb_tag_html`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_tag_html` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `config` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_tag_html`
--

LOCK TABLES `wb_tag_html` WRITE;
/*!40000 ALTER TABLE `wb_tag_html` DISABLE KEYS */;
INSERT INTO `wb_tag_html` VALUES (2,'Google Tag Manager trước thẻ đóng </head>','Công cụ giúp quản lý tag trên website của bạn ',1,'','{\"type\":\"0\",\"page\":[]}'),(3,'Google Tag Manager ngay sau thẻ mở <body>','Công cụ giúp quản lý tag trên website của bạn ',2,'','{\"type\":\"0\",\"page\":[]}'),(4,'Google Analytics','',3,'','{\"type\":\"0\",\"page\":[]}'),(5,'Google Search Console ','Chỉ Homepage',1,'','{\"type\":\"1\",\"page\":[\"http:\\/\\/wb-core.dev\"]}'),(6,'Google Remarketing','',3,'','{\"type\":\"0\",\"page\":[\"\"]}'),(7,'Facebook Pixel','Công cụ theo dõi của Facebook để tiếp thị lại hoặc đo chuyển đổi',1,'','{\"type\":\"0\",\"page\":[]}');
/*!40000 ALTER TABLE `wb_tag_html` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_testimonials`
--

DROP TABLE IF EXISTS `wb_testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_published` int(11) NOT NULL DEFAULT '1',
  `published_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_testimonials`
--

LOCK TABLES `wb_testimonials` WRITE;
/*!40000 ALTER TABLE `wb_testimonials` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_theme`
--

DROP TABLE IF EXISTS `wb_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_theme` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `folder_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `type` tinyint(4) DEFAULT NULL,
  `layout` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `is_published` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_theme`
--

LOCK TABLES `wb_theme` WRITE;
/*!40000 ALTER TABLE `wb_theme` DISABLE KEYS */;
INSERT INTO `wb_theme` VALUES (2,'Shop trái cây','fruitshop',1,'{\"header\":{\"template\":\"style2\",\"path\":\"themes.fruitshop.views.layouts.headers.style2\"}}',1),(8,'Mặc định','default',1,'',0);
/*!40000 ALTER TABLE `wb_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_user`
--

DROP TABLE IF EXISTS `wb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `remember_token` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_user`
--

LOCK TABLES `wb_user` WRITE;
/*!40000 ALTER TABLE `wb_user` DISABLE KEYS */;
INSERT INTO `wb_user` VALUES (111,0,'vanminh@imgroup.vn',NULL,'Huỳnh Văn Minh','1698259450','18 Trần Thiện Chánh P. 12 Quận 10','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-07 11:11:07','2017-10-07 11:11:07'),(112,0,'vanminh@imgroup.vn',NULL,'Huỳnh Văn Minh','1698259450','18 Trần Thiện Chánh P. 12 Quận 10','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-07 15:44:36','2017-10-07 15:44:36'),(113,0,'fgdfbdfb@gmail.com',NULL,'@@^^^^%%%%','122596335','fdfdfdf','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-18 13:50:49','2017-10-18 13:50:49'),(114,0,'hoangtrang@imgroup.vn',NULL,'Hoàng Thị Trang','01272173376','18 Trần Thiện Chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-18 14:18:19','2017-10-18 14:18:19'),(115,0,'hoangtrang@imgroup.vn',NULL,'Hoàng Thị Trang','01272173376','18 Trần Thiện Chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-18 14:44:58','2017-10-18 14:44:58'),(116,0,'hoangtrang@imgroup.vn',NULL,'Hoàng Thị Trang','1272173376','18 Trần thiện chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-18 14:48:01','2017-10-18 14:48:01'),(117,0,'hoangtrang@imgroup.vn',NULL,'Hoàng Thị Trang','1272173376','18 Trần thiện chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-18 14:56:53','2017-10-18 14:56:53'),(118,0,'hoangtrang@imgroup.vn',NULL,'Hoàng Thị Trang','1272173376','18 Trần thiện chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-18 14:57:52','2017-10-18 14:57:52'),(119,0,'hoangtrang200496@gmail.com',NULL,'Hoàng Thị Trang','1272173376','18 Trần thiện chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-18 15:12:11','2017-10-18 15:12:11'),(120,0,'hoangtrang@imgroup.vn',NULL,'Hoàng Thị Trang','1272173376','18 Trần thiện chánh','Quận Cầu Giấy','TP. Hà nội',NULL,NULL,NULL,'2017-10-18 15:15:08','2017-10-18 15:15:08'),(121,0,'hoangtrang@imgroup.vn',NULL,'Hoàng Thị Trang','1272173376','18 Trần thiện chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-18 15:24:19','2017-10-18 15:24:19'),(122,0,'hoangtrang@imgroup.vn',NULL,'Hoàng Thị Trang','1272173376','18 Trần thiện chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-19 08:25:30','2017-10-19 08:25:30'),(123,0,'vanminh@imgroup.vn',NULL,'Huỳnh Văn Minh','1698259450','18 Trần Thiện Chánh P. 12 Quận 10','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-19 08:57:36','2017-10-19 08:57:36'),(124,0,'test@gmail.com',NULL,'Kích thước','1231231','12312313','Quận Ba Đình','TP. Hà nội',NULL,NULL,NULL,'2017-10-19 09:24:58','2017-10-19 09:24:58'),(125,0,'thanhnguyenit.nlu@gmail.com',NULL,'kỹ thuật1231','12313','aqeqweqwe','Quận 9','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-19 09:50:25','2017-10-19 09:50:25'),(126,0,'thanhnguyenit.nlu@gmail.com',NULL,'kỹ thuật1231','12313','aqeqweqwe','Quận 9','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-19 09:54:35','2017-10-19 09:54:35'),(127,0,'vanminh@imgroup.vn',NULL,'Huỳnh Văn Minh','1698259450','18 Trần Thiện Chánh P. 12 Quận 10','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-19 10:37:59','2017-10-19 10:37:59'),(128,0,'ngochien@imgroup.vn',NULL,'vu ngoc hien ','0902745977','quận 10','Quận Hai Bà Trưng','TP. Hà nội',NULL,NULL,NULL,'2017-10-20 08:33:00','2017-10-20 08:33:00'),(129,0,'vungochien037@gmail.com',NULL,'vũ ngọc hiển','0902745977','kiểm tra','Huyện Tân Sơn','Phú Thọ',NULL,NULL,NULL,'2017-10-20 08:53:09','2017-10-20 08:53:09'),(133,0,'vanminh@imgroup.vn',NULL,'Huỳnh Văn Minh','1698259450','18 Trần Thiện Chánh P. 12 Quận 10','Quận 2','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 09:11:20','2017-10-20 09:11:20'),(134,0,'vungochien037@gmail.com',NULL,'vũ ngọc hiển','0902745977','đinh trang hòa','Huyện Di Linh','Lâm Đồng',NULL,NULL,NULL,'2017-10-20 09:18:58','2017-10-20 09:18:58'),(135,0,'vungochien037@gmail.com',NULL,'vũ ngọc hiển','0902745977','đinh trang hòa','Huyện Di Linh','Lâm Đồng',NULL,NULL,NULL,'2017-10-20 09:28:13','2017-10-20 09:28:13'),(136,0,'vungochien037@gmail.com',NULL,'vũ ngọc hiển','0902745977','đinh trang hòa','Huyện Di Linh','Lâm Đồng',NULL,NULL,NULL,'2017-10-20 09:28:31','2017-10-20 09:28:31'),(137,0,'vungochien037@gmail.com',NULL,'vũ ngọc hiển','0902745977','trần thiện chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 09:46:02','2017-10-20 09:46:02'),(138,0,'vungochien037@gmail.com',NULL,'vũ ngọc hiển','0902745977','hàm nghi','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 09:51:12','2017-10-20 09:51:12'),(139,0,'vungochien037@gmail.com',NULL,'vũ ngọc hiển','0902745977','hàm nghi','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 10:00:11','2017-10-20 10:00:11'),(140,0,'vungochien037@gmail.com',NULL,'vũ ngọc hiển','0902745977','hàm nghi','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 10:01:36','2017-10-20 10:01:36'),(141,0,'vanminh@imgroup.vn',NULL,'Huỳnh Văn Minh','1698259450','18 Trần Thiện Chánh P. 12 Quận 10','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 10:11:53','2017-10-20 10:11:53'),(142,0,'ngochien@imgroup.vn',NULL,'vũ ngọc hiển','902745977','trần thiện chánh','Quận Bình Tân','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 10:31:02','2017-10-20 10:31:02'),(143,0,'ngochien@imgroup.vn',NULL,'vũ ngọc hiển','902745977','trần thiện chánh','Quận Thủ Đức','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 10:36:28','2017-10-20 10:36:28'),(144,0,'ngochien@imgroup.vn',NULL,'vũ ngọc hiển','902745977','trần thiện chánh','Quận 2','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 10:38:47','2017-10-20 10:38:47'),(145,0,'ngochien@imgroup.vn',NULL,'vũ ngọc hiển','902745977','trần thiện chánh','Quận Bình Tân','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 10:39:56','2017-10-20 10:39:56'),(146,0,'vanminh@imgroup.vn',NULL,'Huỳnh Văn Minh','1698259450','18 Trần Thiện Chánh P. 12 Quận 10','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 10:41:30','2017-10-20 10:41:30'),(147,0,'ngochien@imgroup.vn',NULL,'vũ ngọc hiển','902745977','trần thiện chánh','Quận Bình Tân','TP. Hồ Chí Minh',NULL,NULL,NULL,'2017-10-20 11:11:35','2017-10-20 11:11:35'),(148,0,'admin@admin.com',NULL,'sdfgh','0947016300','sdfgh','Huyện Phù Cừ','Hưng Yên',NULL,NULL,NULL,'2017-12-12 02:01:41','2017-12-12 02:01:41'),(149,0,'coldboy6596@gmail.com',NULL,'Ngoc','0945123456','abc Ghi','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-01-23 08:29:05','2018-01-23 08:29:05'),(150,0,'coldboy6596@gmail.com',NULL,'Ngoc','0945123456','abc Ghi','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-01-23 08:32:23','2018-01-23 08:32:23'),(151,0,'admin@admin.com',NULL,'Ngoc','0945123456','abc Ghi','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-01-23 08:33:03','2018-01-23 08:33:03'),(152,0,'coldboy6596@gmail.com',NULL,'test','sdfgh','sdfzcá','Quận Đống Đa','TP. Hà nội',NULL,NULL,NULL,'2018-01-23 09:06:18','2018-01-23 09:06:18'),(153,0,'coldboy6596@gmail.com',NULL,'test','sdfgh','sdfzcá','Quận Đống Đa','TP. Hà nội',NULL,NULL,NULL,'2018-01-23 09:09:26','2018-01-23 09:09:26'),(154,0,'coldboy6596@gmail.com',NULL,'YTLH','0947123456','sdfgh','Quận 3','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-03-01 08:40:56','2018-03-01 08:40:56'),(155,0,'coldboy6596@gmail.com',NULL,'YTLH','0947123456','sdfgh','Quận 3','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-03-01 08:46:49','2018-03-01 08:46:49'),(156,0,'coldboy6596@gmail.com',NULL,'Tester Thanh Toán','0947123456','18 Trần Thiện Chánh','Quận 10','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-03-01 09:43:51','2018-03-01 09:43:51'),(157,0,'coldboy6596@gmail.com',NULL,'Tester Thanh Toán','0947123456','18 Trần Thiện Chánh','Huyện Mộc Châu','Sơn La',NULL,NULL,NULL,'2018-03-01 09:46:03','2018-03-01 09:46:03'),(158,0,'coldboy6596@gmail.com',NULL,'Tester Thanh Toán','0947123456','18 Trần Thiện Chánh','Huyện Mộc Châu','Sơn La',NULL,NULL,NULL,'2018-03-01 09:48:56','2018-03-01 09:48:56'),(159,0,'obama@imgroup.vn',NULL,'obama','0999999999','ssdfsdf','Quận 2','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-03-02 07:23:22','2018-03-02 07:23:22'),(160,0,'abc@gmail.com',NULL,'fà','0988888888','abc','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-03-02 09:03:55','2018-03-02 09:03:55'),(161,0,'admin@admin.com',NULL,'obama','0999999999','NA, 19','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-03-02 09:26:51','2018-03-02 09:26:51'),(162,0,'By.xpath(\"//div[@class=\\\"dd menu_container\\\"]/ol[@class=\\\"menu-item-list dd-list\\\"][last()]/li[@class=\\\"menu-item dd-item\\\"][last()]/form[@class=\\\"store-form\\\"][last()]/div[@class=\\\"panel panel-white widget-item cursor-move panel-collapsed\\\"]/div[@class=\\',NULL,'Tester Thanh Toán','0947123456','sdfghm,','Huyện Mường Tè','Lai Châu',NULL,NULL,NULL,'2018-03-06 06:51:40','2018-03-06 06:51:40'),(163,0,'khachhang@gmail.com',NULL,'Khách hàng','0123456789','Địa chỉ khách hàng','Khách hàng','Khách hàng',NULL,NULL,NULL,'2018-03-12 08:43:20','2018-03-12 08:43:20'),(164,0,'khachhang@gmail.com',NULL,'','0123456789','Địa chỉ khách hàng','Khách hàng','Khách hàng',NULL,NULL,NULL,'2018-03-12 08:45:22','2018-03-12 08:45:22'),(165,0,'',NULL,'','0123456789','','Quận 7','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-03-12 09:03:59','2018-03-12 09:03:59'),(166,0,'',NULL,'','0123456789','','Quận 6','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-03-12 09:06:03','2018-03-12 09:06:03'),(167,0,'thanhnm.dev@gmail.com',NULL,'Nguyen Minh Tan','1212313','home, home','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-05-04 02:12:25','2018-05-04 02:12:25'),(168,0,'thanhnm.dev@gmail.com',NULL,'Nguyen Minh Tan','123123','home, home','Quận 1','TP. Hồ Chí Minh',NULL,NULL,NULL,'2018-05-18 10:04:16','2018-05-18 10:04:16'),(169,0,'thanhnm.dev@gmail.com',NULL,'Nguyen Minh Tan','123','home, home','Huyện Tân Biên','Tây Ninh',NULL,NULL,NULL,'2018-05-18 11:24:51','2018-05-18 11:24:51'),(170,0,'thanhnm.dev@gmail.com',NULL,'Nguyen Minh Tan','112','home, home','Thành phố Tây Ninh','Tây Ninh',NULL,NULL,NULL,'2018-05-18 11:48:37','2018-05-18 11:48:37'),(171,0,'thanhnm.dev@gmail.com',NULL,'Nguyen Minh Tan','1231','home, home','Huyện Châu Thành','Tây Ninh',NULL,NULL,NULL,'2018-05-18 11:51:31','2018-05-18 11:51:31');
/*!40000 ALTER TABLE `wb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_user_password_reset`
--

DROP TABLE IF EXISTS `wb_user_password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_user_password_reset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_user_password_reset`
--

LOCK TABLES `wb_user_password_reset` WRITE;
/*!40000 ALTER TABLE `wb_user_password_reset` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_user_password_reset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_widget`
--

DROP TABLE IF EXISTS `wb_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_widget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `title` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `position` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `config` text COLLATE utf8_unicode_ci,
  `screenshot` varchar(191) COLLATE utf8_unicode_ci DEFAULT '',
  `theme_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_widget`
--

LOCK TABLES `wb_widget` WRITE;
/*!40000 ALTER TABLE `wb_widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_widget_page`
--

DROP TABLE IF EXISTS `wb_widget_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_widget_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT '0',
  `widget_taxonomy` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `theme_id` int(11) DEFAULT NULL,
  `position` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `config` text COLLATE utf8_unicode_ci,
  `sort_order` int(11) DEFAULT '0',
  `is_published` tinyint(1) DEFAULT '1',
  `block` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_widget_page`
--

LOCK TABLES `wb_widget_page` WRITE;
/*!40000 ALTER TABLE `wb_widget_page` DISABLE KEYS */;
INSERT INTO `wb_widget_page` VALUES (5,0,'youtube',0,NULL,'homepage','{\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=Ou8n9IYJFeI\",\"width\":\"900\",\"height\":\"500\"}',2,1,1),(8,0,'post',0,NULL,'homepage','{\"group_feature_id\":\"2\",\"limit\":\"3\",\"style\":\"style1\"}',3,1,1),(16,0,'fanpage_fb',0,NULL,'sidebar','{\"url\":\"https:\\/\\/www.facebook.com\\/IMGroupVietnam\\/\",\"height\":\"300\"}',0,1,1),(18,0,'post',0,NULL,'sidebar','{\"group_feature_id\":\"2\",\"limit\":\"6\",\"style\":\"style3\"}',1,1,1),(19,0,'payment_method',0,NULL,'homepage',NULL,13,1,1),(32,0,'text_editor',0,NULL,'footer','\"\"',0,1,1),(33,0,'text_editor',0,NULL,'footer','\"\"',1,1,1),(36,0,'product',0,NULL,'homepage','{\"group_feature_id\":\"3\",\"limit\":\"8\",\"style\":\"style7\"}',1,1,1),(37,0,'fanpage_fb',0,NULL,'footer','{\"url\":\"https:\\/\\/www.facebook.com\\/IMGroupVietnam\\/\",\"height\":\"300\"}',2,1,1),(38,0,'social_links',0,NULL,'footer','\"\"',0,1,2),(39,0,'payment_method',0,NULL,'footer','\"\"',1,1,2),(40,0,'service',0,NULL,'sidebar','{\"blocks\":{\"1\":{\"icon\":\"fa fa-user\"},\"2\":{\"icon\":\"fa fa-tachometer\"},\"3\":{\"icon\":\"fa fa-wrench\"},\"4\":{\"icon\":\"fa fa-ambulance\"}}}',2,1,1),(42,0,'slider',0,NULL,'homepage','{\"slide_id\":\"3\"}',0,1,1),(43,0,'newsletter',0,NULL,'homepage','\"\"',6,1,1),(44,0,'partner',0,NULL,'homepage','{\"animate_time\":\"2\",\"auto_play\":\"1\"}',5,1,1),(49,0,'text_editor',0,NULL,'footer','{\"stylesheet\":{\"background-type\":\"color\",\"background-color\":\"#fff\",\"background-image\":\"\"}}',1,1,3);
/*!40000 ALTER TABLE `wb_widget_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wb_widget_page_description`
--

DROP TABLE IF EXISTS `wb_widget_page_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wb_widget_page_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `widget_page_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `config` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `lang_code` (`lang_code`,`widget_page_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wb_widget_page_description`
--

LOCK TABLES `wb_widget_page_description` WRITE;
/*!40000 ALTER TABLE `wb_widget_page_description` DISABLE KEYS */;
INSERT INTO `wb_widget_page_description` VALUES (9,'vi',9,'Đối tác',NULL,NULL),(12,'vi',12,'HỆ THỐNG CỬA HÀNG NƯỚC ÉP','<p>Nước &eacute;p nguy&ecirc;n chất kh&ocirc;ng pha đường hoặc bất k&igrave; chất bảo quản n&agrave;o. &Eacute;p tươi b&aacute;n v&agrave; d&ugrave;ng trong ng&agrave;y mặc d&ugrave; c&oacute; thể bảo quản được 2-3 ng&agrave;y.</p>\r\n',NULL),(14,'vi',14,'LIÊN HỆ','<div class=\"f-ct-sidebar\">\r\n<p><strong>CTY CỔ PHẦN NƯỚC &Eacute;P VIỆT NAM</strong></p>\r\n<p>Địa chỉ: 8/4 Nguyễn Văn Tr&aacute;ng, P. Bến Th&agrave;nh, Q1, Tp. HCM<br /> Hotline:&nbsp;<span style=\"font-size: 12px;\"><strong style=\"font-size: 12px; color: #2e2e2e; font-family: Tahoma, Geneva, sans-serif; line-height: 22px; text-align: center; margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; color: #ff0000;\">0919008739 -&nbsp;0918008739</span></strong>&nbsp;</span>(Mr.PH&Uacute;)</p>\r\n<p>Gmail: nuocepsach@gmail.com</p>\r\n</div>\r\n',NULL),(15,'vi',15,'THÔNG TIN','<p>Tuy&ecirc;n bố miễn trừ tr&aacute;ch nhiệm: Sản phẩm l&agrave; nước &eacute;p, chỉ c&oacute; thể hỗ trợ chứ kh&ocirc;ng phải l&agrave; thuốc, kh&ocirc;ng c&oacute; t&aacute;c dụng chữa bệnh. V&agrave; kết quả c&oacute; thể thay đổi t&ugrave;y theo cơ địa của mỗi người sẽ c&oacute; kết quả kh&aacute;c nhau.</p>\r\n',NULL),(20,'vi',20,'Tin tức nóng hằng ngày',NULL,NULL),(22,'vi',22,'',NULL,NULL),(23,'vi',23,'Sản phẩm nổi bật',NULL,NULL),(24,'vi',24,'Xu hướng thời trang 2017',NULL,NULL),(25,'vi',25,'Sản phẩm mới',NULL,NULL),(26,'vi',26,'',NULL,NULL),(27,'vi',27,'',NULL,NULL),(28,'vi',28,'',NULL,NULL),(29,'vi',29,'',NULL,NULL),(34,'vi',5,'MẪU THIẾT KẾ NỘI THẤT CĂN HỘ ĐẸP',NULL,NULL),(37,'vi',8,'Nội Thất Trong Nhà',NULL,NULL),(45,'vi',16,'Fanpage ',NULL,NULL),(47,'vi',18,'Tin Tức Nội Thất',NULL,NULL),(48,'vi',19,'Phương thức thanh toán',NULL,NULL),(61,'vi',32,'Liên hệ','<p><strong>C&ocirc;ng ty Cổ Phần Đầu tư v&agrave; Ph&aacute;t triển IM</strong></p>\r\n\r\n<p><strong>Văn ph&ograve;ng:</strong>&nbsp;Số 18, đường Trần Thiện Ch&aacute;nh, P12, Quận 10, TPHCM.</p>\r\n\r\n<p><strong>Hotline:</strong>&nbsp;<a href=\"tel://1900636040\">1900 636 040</a></p>\r\n\r\n<p><strong>Email:</strong>&nbsp;<a href=\"mailto:support@imgroup.vn\">support@imgroup.vn</a></p>\r\n',NULL),(62,'vi',33,'Chính sách','<p><a href=\"/huong-dan-mua-hang\">Hướng dẫn mua h&agrave;ng</a></p>\r\n\r\n<p><a href=\"/huong-dan-thanh-toan\">Hướng dẫn thanh to&aacute;n</a></p>\r\n\r\n<p><a href=\"/chinh-sach-giao-hang\">Phương thức giao nhận</a></p>\r\n\r\n<p><a href=\"/chinh-sach-doi-tra\">Ch&iacute;nh s&aacute;ch đổi trả h&agrave;ng v&agrave; ho&agrave;n tiền</a></p>\r\n',NULL),(65,'vi',36,'Nội Thất Phòng Khách',NULL,NULL),(66,'vi',37,'Fanpage Facebook',NULL,NULL),(67,'vi',38,'',NULL,NULL),(68,'vi',39,'',NULL,NULL),(69,'vi',40,'phương châm',NULL,'{\"blocks\":{\"1\":{\"title\":\"T\\u01b0 v\\u1ea5n c\\u1ee5 th\\u1ec3\",\"title_small\":\"nhi\\u1ec7t t\\u00ecnh\"},\"2\":{\"title\":\"Thi\\u1ebft k\\u1ebf nhanh\",\"title_small\":\"\\u0111\\u1eb9p - h\\u1ee3p l\\u00fd - theo y\\u00eau c\\u1ea7u\"},\"3\":{\"title\":\"Ch\\u1ec9nh s\\u1eeda \\u0111\\u1eb9p\",\"title_small\":\"theo y\\u00eau c\\u1ea7u th\\u01b0\\u1ee3ng kh\\u00e1ch\"},\"4\":{\"title\":\"B\\u1ea3o h\\u00e0nh uy t\\u00edn\",\"title_small\":\"kh\\u00f4ng h\\u1eb9n l\\u1ea1i l\\u1ea7n sau\"}}}'),(71,'vi',42,'',NULL,NULL),(72,'vi',43,'Nhận khuyến mãi','','{\"btn\":\"\\u0110\\u0103ng k\\u00fd\"}'),(73,'vi',44,'Đối tác',NULL,NULL),(78,'vi',49,'','<p>&copy; Bản quyền thuộc về fruitshop2.loveitop.com - Powered by IM Group</p>\r\n',NULL);
/*!40000 ALTER TABLE `wb_widget_page_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-02  9:48:29
