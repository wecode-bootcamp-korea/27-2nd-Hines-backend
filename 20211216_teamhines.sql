-- MySQL dump 10.13  Distrib 8.0.27, for macos11.6 (arm64)
--
-- Host: localhost    Database: teamhines
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_cart` (`user_id`,`product_id`),
  KEY `carts_product_id_02913eac_fk_products_id` (`product_id`),
  CONSTRAINT `carts_product_id_02913eac_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_3a9d1785_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_menu_id_33730ae9_fk_menus_id` (`menu_id`),
  CONSTRAINT `categories_menu_id_33730ae9_fk_menus_id` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Area',1),(2,'Closet',1),(3,'Food',1),(4,'Tool',1),(5,'Transportation',1),(6,'Funiture',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'cart','cart'),(1,'contenttypes','contenttype'),(10,'orders','order'),(12,'orders','orderitem'),(11,'orders','orderstatus'),(4,'products','category'),(9,'products','image'),(5,'products','menu'),(6,'products','product'),(8,'products','review'),(7,'products','subcategory'),(2,'sessions','session'),(3,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'users','0001_initial','2021-12-16 06:19:09.970794'),(2,'products','0001_initial','2021-12-16 06:19:10.086420'),(3,'cart','0001_initial','2021-12-16 06:19:10.125849'),(4,'contenttypes','0001_initial','2021-12-16 06:19:10.136549'),(5,'contenttypes','0002_remove_content_type_name','2021-12-16 06:19:10.157977'),(6,'orders','0001_initial','2021-12-16 06:19:10.268034'),(7,'sessions','0001_initial','2021-12-16 06:19:10.276975');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_url` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `images_product_id_f90b9061_fk_products_id` (`product_id`),
  CONSTRAINT `images_product_id_f90b9061_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'2021-12-16 06:19:35.326080','2021-12-16 06:19:35.326095','https://raw.githubusercontent.com/Djangowon/TIL/main/image/MARS.jpeg',1),(2,'2021-12-16 06:19:35.326653','2021-12-16 06:19:35.326667','https://raw.githubusercontent.com/Djangowon/TIL/main/image/MARS-1.jpeg',1),(3,'2021-12-16 06:19:35.327186','2021-12-16 06:19:35.327199','https://raw.githubusercontent.com/Djangowon/TIL/main/image/PICHU.jpeg',2),(4,'2021-12-16 06:19:35.327712','2021-12-16 06:19:35.327726','https://raw.githubusercontent.com/Djangowon/TIL/main/image/PICHU-1.jpeg',2),(5,'2021-12-16 06:19:35.328218','2021-12-16 06:19:35.328231','https://raw.githubusercontent.com/Djangowon/TIL/main/image/KRK.jpeg',3),(6,'2021-12-16 06:19:35.328763','2021-12-16 06:19:35.328779','https://raw.githubusercontent.com/Djangowon/TIL/main/image/KRK-1.jpeg',3),(7,'2021-12-16 06:19:35.329274','2021-12-16 06:19:35.329286','https://raw.githubusercontent.com/Djangowon/TIL/main/image/SAT.png',4),(8,'2021-12-16 06:19:35.329757','2021-12-16 06:19:35.329769','https://raw.githubusercontent.com/Djangowon/TIL/main/image/SAT-1.jpeg',4),(9,'2021-12-16 06:19:35.330229','2021-12-16 06:19:35.330240','https://raw.githubusercontent.com/Djangowon/TIL/main/image/OUR.jpeg',5),(10,'2021-12-16 06:19:35.330696','2021-12-16 06:19:35.330707','https://raw.githubusercontent.com/Djangowon/TIL/main/image/OUR-1.jpg',5),(11,'2021-12-16 06:19:35.331162','2021-12-16 06:19:35.331173','https://raw.githubusercontent.com/Djangowon/TIL/main/image/QN.jpeg',6),(12,'2021-12-16 06:19:35.331624','2021-12-16 06:19:35.331635','https://raw.githubusercontent.com/Djangowon/TIL/main/image/QN-1.jpeg',6),(13,'2021-12-16 06:19:35.332072','2021-12-16 06:19:35.332084','https://raw.githubusercontent.com/Djangowon/TIL/main/image/EZ.jpeg',7),(14,'2021-12-16 06:19:35.332528','2021-12-16 06:19:35.332540','https://raw.githubusercontent.com/Djangowon/TIL/main/image/EZ-1.jpeg',7),(15,'2021-12-16 06:19:35.333309','2021-12-16 06:19:35.333331','https://raw.githubusercontent.com/Djangowon/TIL/main/image/CONDA.jpeg',8),(16,'2021-12-16 06:19:35.333872','2021-12-16 06:19:35.333888','https://raw.githubusercontent.com/Djangowon/TIL/main/image/CONDA-1.jpeg',8),(17,'2021-12-16 06:19:35.334416','2021-12-16 06:19:35.334431','https://raw.githubusercontent.com/Djangowon/TIL/main/image/RO-X.jpeg',9),(18,'2021-12-16 06:19:35.334932','2021-12-16 06:19:35.334946','https://raw.githubusercontent.com/Djangowon/TIL/main/image/RO-X-1.jpeg',9),(19,'2021-12-16 06:19:35.335449','2021-12-16 06:19:35.335466','https://raw.githubusercontent.com/Djangowon/TIL/main/image/SF-08.jpeg',10),(20,'2021-12-16 06:19:35.335975','2021-12-16 06:19:35.335989','https://raw.githubusercontent.com/Djangowon/TIL/main/image/SF-08-1.jpeg',10),(21,'2021-12-16 06:19:35.336500','2021-12-16 06:19:35.336514','https://raw.githubusercontent.com/Djangowon/TIL/main/image/PAK.jpeg',11),(22,'2021-12-16 06:19:35.337236','2021-12-16 06:19:35.337250','https://raw.githubusercontent.com/Djangowon/TIL/main/image/PAK-1.jpg',11),(23,'2021-12-16 06:19:35.338036','2021-12-16 06:19:35.338053','https://raw.githubusercontent.com/Djangowon/TIL/main/image/RAL.jpeg',12),(24,'2021-12-16 06:19:35.340736','2021-12-16 06:19:35.340754','https://raw.githubusercontent.com/Djangowon/TIL/main/image/RAL-1.jpeg',12),(25,'2021-12-16 06:19:35.344301','2021-12-16 06:19:35.344321','https://cdn.pixabay.com/photo/2011/12/13/17/09/astronaut-11050_1280.jpg',13),(26,'2021-12-16 06:19:35.345461','2021-12-16 06:19:35.345480','https://cdn.pixabay.com/photo/2017/02/14/10/41/germany-2065592_1280.jpg',13),(27,'2021-12-16 06:19:35.346311','2021-12-16 06:19:35.346325','https://cdn.pixabay.com/photo/2014/04/09/17/48/man-320276_1280.png',14),(28,'2021-12-16 06:19:35.347058','2021-12-16 06:19:35.347072','https://cdn.pixabay.com/photo/2014/04/09/17/48/man-320274_1280.png',14),(29,'2021-12-16 06:19:35.347749','2021-12-16 06:19:35.347763','https://cdn.pixabay.com/photo/2017/01/13/04/56/blank-1976334_1280.png',15),(30,'2021-12-16 06:19:35.348449','2021-12-16 06:19:35.348462','https://cdn.pixabay.com/photo/2015/09/06/01/03/white-926838_1280.jpg',15),(31,'2021-12-16 06:19:35.349169','2021-12-16 06:19:35.349182','https://cdn.pixabay.com/photo/2016/02/09/01/01/isolated-1188090_1280.png',16),(32,'2021-12-16 06:19:35.349985','2021-12-16 06:19:35.349998','https://cdn.pixabay.com/photo/2021/01/21/17/06/man-5937887_1280.jpg',16),(33,'2021-12-16 06:19:35.350784','2021-12-16 06:19:35.350797','https://cdn.pixabay.com/photo/2015/12/06/21/04/person-1080055_1280.png',17),(34,'2021-12-16 06:19:35.351567','2021-12-16 06:19:35.351580','https://cdn.pixabay.com/photo/2016/01/13/17/10/super-1138512_1280.png',17),(35,'2021-12-16 06:19:35.352273','2021-12-16 06:19:35.352286','https://cdn.pixabay.com/photo/2020/04/29/10/18/stress-5108221__480.jpg',18),(36,'2021-12-16 06:19:35.353017','2021-12-16 06:19:35.353030','https://cdn.pixabay.com/photo/2017/11/16/09/34/matrix-2953883_1280.jpg',18),(37,'2021-12-16 06:19:35.353743','2021-12-16 06:19:35.353756','https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_1280.jpg',19),(38,'2021-12-16 06:19:35.354470','2021-12-16 06:19:35.354483','https://cdn.pixabay.com/photo/2016/01/25/16/53/jeans-1161035_1280.jpg',19),(39,'2021-12-16 06:19:35.355207','2021-12-16 06:19:35.355220','https://cdn.pixabay.com/photo/2018/10/10/14/23/pants-3737400_1280.jpg',20),(40,'2021-12-16 06:19:35.355944','2021-12-16 06:19:35.355957','https://cdn.pixabay.com/photo/2014/04/28/18/37/zipper-333997__340.jpg',20),(41,'2021-12-16 06:19:35.356685','2021-12-16 06:19:35.356698','https://cdn.pixabay.com/photo/2021/04/13/15/08/spacesuit-6175962_1280.jpg',21),(42,'2021-12-16 06:19:35.357407','2021-12-16 06:19:35.357420','https://cdn.pixabay.com/photo/2014/11/16/23/39/superhero-534120_1280.jpg',21),(43,'2021-12-16 06:19:35.358117','2021-12-16 06:19:35.358130','https://cdn.pixabay.com/photo/2018/01/09/16/11/angler-3071970_1280.jpg',22),(44,'2021-12-16 06:19:35.358847','2021-12-16 06:19:35.358860','https://cdn.pixabay.com/photo/2016/10/18/15/09/hands-1750481_1280.jpg',22),(45,'2021-12-16 06:19:35.359568','2021-12-16 06:19:35.359581','https://cdn.pixabay.com/photo/2018/06/25/15/21/science-3497118_1280.png',23),(46,'2021-12-16 06:19:35.360294','2021-12-16 06:19:35.360306','https://cdn.pixabay.com/photo/2017/10/12/10/55/astronaut-2844245_1280.png',23),(47,'2021-12-16 06:19:35.361022','2021-12-16 06:19:35.361035','https://www.pngfind.com/pngs/m/594-5944611_green-alien-morphsuit-guy-in-alien-costume-hd.png',24),(48,'2021-12-16 06:19:35.361754','2021-12-16 06:19:35.361767','https://cdn.pixabay.com/photo/2015/09/16/09/29/grafitti-942459_1280.jpg',24),(49,'2021-12-16 06:19:35.362480','2021-12-16 06:19:35.362493','https://ifh.cc/g/uGjIbm.jpg',25),(50,'2021-12-16 06:19:35.363189','2021-12-16 06:19:35.363202','https://ifh.cc/g/d0we1e.jpg',25),(51,'2021-12-16 06:19:35.363923','2021-12-16 06:19:35.363936','https://ifh.cc/g/71E574.jpg',26),(52,'2021-12-16 06:19:35.365695','2021-12-16 06:19:35.365709','https://ifh.cc/g/ifUzuY.jpg',26),(53,'2021-12-16 06:19:35.366436','2021-12-16 06:19:35.366450','https://ifh.cc/g/fK841d.jpg',27),(54,'2021-12-16 06:19:35.367182','2021-12-16 06:19:35.367196','https://ifh.cc/g/wkZyPO.jpg',27),(55,'2021-12-16 06:19:35.367909','2021-12-16 06:19:35.367923','https://ifh.cc/g/p6B3JX.jpg',28),(56,'2021-12-16 06:19:35.368691','2021-12-16 06:19:35.368706','https://ifh.cc/g/bWKCQ0.jpg',28),(57,'2021-12-16 06:19:35.369489','2021-12-16 06:19:35.369503','https://ifh.cc/g/Sop2cI.jpg',29),(58,'2021-12-16 06:19:35.370250','2021-12-16 06:19:35.370264','https://ifh.cc/g/ROUHNY.jpg',29),(59,'2021-12-16 06:19:35.371007','2021-12-16 06:19:35.371021','https://ifh.cc/g/vtA0Cl.jpg',30),(60,'2021-12-16 06:19:35.371766','2021-12-16 06:19:35.371781','https://ifh.cc/g/o2CqJZ.jpg',30),(61,'2021-12-16 06:19:35.372510','2021-12-16 06:19:35.372524','https://ifh.cc/g/qUSvtX.jpg',31),(62,'2021-12-16 06:19:35.373270','2021-12-16 06:19:35.373284','https://ifh.cc/g/u2BoGf.jpg',31),(63,'2021-12-16 06:19:35.374001','2021-12-16 06:19:35.374016','https://ifh.cc/g/O9hLDj.jpg',32),(64,'2021-12-16 06:19:35.374757','2021-12-16 06:19:35.374771','https://ifh.cc/g/d2FjlD.jpg',32),(65,'2021-12-16 06:19:35.375513','2021-12-16 06:19:35.375528','https://ifh.cc/g/xAJKTJ.jpg',33),(66,'2021-12-16 06:19:35.376271','2021-12-16 06:19:35.376286','https://ifh.cc/g/DDMl4Z.jpg',33),(67,'2021-12-16 06:19:35.376986','2021-12-16 06:19:35.377000','https://ifh.cc/g/izVNkF.jpg',34),(68,'2021-12-16 06:19:35.377724','2021-12-16 06:19:35.377739','https://ifh.cc/g/vFsSaa.jpg',34),(69,'2021-12-16 06:19:35.378459','2021-12-16 06:19:35.378473','https://ifh.cc/g/8SQ1hu.jpg',35),(70,'2021-12-16 06:19:35.379185','2021-12-16 06:19:35.379199','https://ifh.cc/g/gXeqDN.jpg',35),(71,'2021-12-16 06:19:35.379894','2021-12-16 06:19:35.379908','https://ifh.cc/g/xMnkH2.jpg',36),(72,'2021-12-16 06:19:35.380626','2021-12-16 06:19:35.380640','https://ifh.cc/g/6ov9IA.jpg',36),(73,'2021-12-16 06:19:35.381333','2021-12-16 06:19:35.381347','https://ifh.cc/g/0wBCXE.jpg',37),(74,'2021-12-16 06:19:35.382062','2021-12-16 06:19:35.382076','https://ifh.cc/g/ZMDGEF.jpg',37),(75,'2021-12-16 06:19:35.382769','2021-12-16 06:19:35.382783','https://ifh.cc/g/G5i1np.jpg',38),(76,'2021-12-16 06:19:35.383497','2021-12-16 06:19:35.383511','https://ifh.cc/g/vTVRnD.jpg',38),(77,'2021-12-16 06:19:35.384222','2021-12-16 06:19:35.384237','https://ifh.cc/g/d071ZE.jpg',39),(78,'2021-12-16 06:19:35.384950','2021-12-16 06:19:35.384964','https://ifh.cc/g/GEaiLz.jpg',39),(79,'2021-12-16 06:19:35.385651','2021-12-16 06:19:35.385665','https://ifh.cc/g/QKWbBW.jpg',40),(80,'2021-12-16 06:19:35.386408','2021-12-16 06:19:35.386422','https://ifh.cc/g/vp5n8b.jpg',40),(81,'2021-12-16 06:19:35.387159','2021-12-16 06:19:35.387173','https://ifh.cc/g/FlMeGh.jpg',41),(82,'2021-12-16 06:19:35.387885','2021-12-16 06:19:35.387900','https://ifh.cc/g/e5r4GU.jpg',41),(83,'2021-12-16 06:19:35.388590','2021-12-16 06:19:35.388605','https://ifh.cc/g/NWjPWr.jpg',42),(84,'2021-12-16 06:19:35.389316','2021-12-16 06:19:35.389330','https://ifh.cc/g/BvCQnz.jpg',42),(85,'2021-12-16 06:19:35.390038','2021-12-16 06:19:35.390053','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A0111-1.jpg',43),(86,'2021-12-16 06:19:35.390773','2021-12-16 06:19:35.390788','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A0111.jpeg',43),(87,'2021-12-16 06:19:35.391500','2021-12-16 06:19:35.391514','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A02-1.jpeg',44),(88,'2021-12-16 06:19:35.392241','2021-12-16 06:19:35.392255','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A0222.jpeg',44),(89,'2021-12-16 06:19:35.393035','2021-12-16 06:19:35.393049','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A03-1.jpg',45),(90,'2021-12-16 06:19:35.393785','2021-12-16 06:19:35.393800','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A03.jpg',45),(91,'2021-12-16 06:19:35.394550','2021-12-16 06:19:35.394568','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A04-1.jpeg',46),(92,'2021-12-16 06:19:35.395279','2021-12-16 06:19:35.395296','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A04.jpeg',46),(93,'2021-12-16 06:19:35.396267','2021-12-16 06:19:35.396282','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A05-1.jpg',47),(94,'2021-12-16 06:19:35.397012','2021-12-16 06:19:35.397029','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A05.gif',47),(95,'2021-12-16 06:19:35.397762','2021-12-16 06:19:35.397776','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A06-1.jpg',48),(96,'2021-12-16 06:19:35.398510','2021-12-16 06:19:35.398524','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A06.jpg',48),(97,'2021-12-16 06:19:35.399246','2021-12-16 06:19:35.399260','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%95111-1.jpeg',49),(98,'2021-12-16 06:19:35.399968','2021-12-16 06:19:35.399982','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%95111.jpeg',49),(99,'2021-12-16 06:19:35.400700','2021-12-16 06:19:35.400714','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%952-1.jpg',50),(100,'2021-12-16 06:19:35.401441','2021-12-16 06:19:35.401456','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%952.jpg',50),(101,'2021-12-16 06:19:35.402220','2021-12-16 06:19:35.402236','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%953-1.jpeg',51),(102,'2021-12-16 06:19:35.403002','2021-12-16 06:19:35.403019','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%953.jpg',51),(103,'2021-12-16 06:19:35.403779','2021-12-16 06:19:35.403795','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%954-1.jpg',52),(104,'2021-12-16 06:19:35.404556','2021-12-16 06:19:35.404573','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%954.jpg',52),(105,'2021-12-16 06:19:35.405384','2021-12-16 06:19:35.405403','https://cdn.pixabay.com/photo/2019/09/05/22/09/concept-4455117_1280.jpg',53),(106,'2021-12-16 06:19:35.406225','2021-12-16 06:19:35.406241','https://cdn.pixabay.com/photo/2019/09/05/22/08/concept-4455111_1280.jpg',53),(107,'2021-12-16 06:19:35.407412','2021-12-16 06:19:35.407429','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%956-1.jpg',54),(108,'2021-12-16 06:19:35.408267','2021-12-16 06:19:35.408283','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%956.jpg',54),(109,'2021-12-16 06:19:35.409061','2021-12-16 06:19:35.409077','https://drive.google.com/uc?id=1CbXN3fENQBjcK7xD6ooVinGgNW-uEZeY',55),(110,'2021-12-16 06:19:35.409861','2021-12-16 06:19:35.409877','https://drive.google.com/uc?id=1u6hP-E5bdyADnKtOKAvwbkSv1GF1jO-K',55),(111,'2021-12-16 06:19:35.410619','2021-12-16 06:19:35.410635','https://drive.google.com/uc?id=1J0WsoZyi6vTj84VZIRz8ZFgzo94anQut',56),(112,'2021-12-16 06:19:35.411390','2021-12-16 06:19:35.411410','https://drive.google.com/uc?id=1y8fkN_Xq9SWyPdl-q7HQVaLwzHcPNDW4',56),(113,'2021-12-16 06:19:35.412165','2021-12-16 06:19:35.412182','https://drive.google.com/uc?id=1IGfyzZbsY2_g6ULwEfHaOTUE0nzVMFEH',57),(114,'2021-12-16 06:19:35.412906','2021-12-16 06:19:35.412923','https://drive.google.com/uc?id=18ExeiEf22-xSnSPvpZWABLIHgA6to5SX',57),(115,'2021-12-16 06:19:35.413648','2021-12-16 06:19:35.413664','https://drive.google.com/uc?id=1NUpnxf16Zb6280DoLw3J_i6UPUE_jEt_',58),(116,'2021-12-16 06:19:35.414400','2021-12-16 06:19:35.414422','https://drive.google.com/uc?id=1CG44Ek_l0qkl6G7ZZ1WTFdpbSoRFgyQj',58),(117,'2021-12-16 06:19:35.415330','2021-12-16 06:19:35.415350','https://drive.google.com/uc?id=1hwz2GORbvJulGPWDpqogRvunp1nvKEcv',59),(118,'2021-12-16 06:19:35.416131','2021-12-16 06:19:35.416148','https://drive.google.com/uc?id=1RxB6lgtCXPujZZzQ-VVSpaxJsG-gbBG_',59),(119,'2021-12-16 06:19:35.416896','2021-12-16 06:19:35.416916','https://drive.google.com/uc?id=1nBdDNsJph3Ej37zv_f_gmNdY7_r6JKIm',60),(120,'2021-12-16 06:19:35.417693','2021-12-16 06:19:35.417710','https://drive.google.com/uc?id=1dAedR_HJ24A8Quq6rfT4u22i4_gkIHiB',60),(121,'2021-12-16 06:19:35.418506','2021-12-16 06:19:35.418523','https://drive.google.com/uc?id=1y0zZKDGFy8isrRkMukIRNlunFbyha7xV',61),(122,'2021-12-16 06:19:35.419271','2021-12-16 06:19:35.419288','https://drive.google.com/uc?id=1-aIh5uGlgjBM5oXe_ocnwmVSSMIo0M2K',61),(123,'2021-12-16 06:19:35.420056','2021-12-16 06:19:35.420072','https://drive.google.com/uc?id=14sG4-t-FRIMK1M6tT4OkWlHCQkJuaSlW',62),(124,'2021-12-16 06:19:35.420822','2021-12-16 06:19:35.420839','https://drive.google.com/uc?id=1mUwAFOfnZd9s1OGGegqel4SnHiX77nhH',62),(125,'2021-12-16 06:19:35.421581','2021-12-16 06:19:35.421597','https://drive.google.com/uc?id=1HGkXF1C8GNd4D6G4kpETY9icuc0gVWxH',63),(126,'2021-12-16 06:19:35.422315','2021-12-16 06:19:35.422331','https://drive.google.com/uc?id=1Kt4B73YOMwtXMKAXKjLaBIiwKAB7RiCM',63),(127,'2021-12-16 06:19:35.423112','2021-12-16 06:19:35.423129','https://drive.google.com/uc?id=1JwJv4mR0RV1iA1Vio8DJNvo3ElL2QVRn',64),(128,'2021-12-16 06:19:35.423893','2021-12-16 06:19:35.423910','https://drive.google.com/uc?id=1e-K71XwXmDPNkctTSOlTdWFxFmGGbw-6',64),(129,'2021-12-16 06:19:35.424905','2021-12-16 06:19:35.424922','https://drive.google.com/uc?id=105mrNL9Uhp0lxsjCk65Eji7j60uG9rn-',65),(130,'2021-12-16 06:19:35.425676','2021-12-16 06:19:35.425692','https://drive.google.com/uc?id=1Rf1Z9tBtg23cTKCeWbi7W0tEZ927edmR',65),(131,'2021-12-16 06:19:35.426415','2021-12-16 06:19:35.426434','https://drive.google.com/uc?id=1tR8OuCVc3N1yXezhtSuiEBdOKeA1LkBj',66),(132,'2021-12-16 06:19:35.427154','2021-12-16 06:19:35.427171','https://drive.google.com/uc?id=1z3e9RmG9rkuA_KPd5ZSjQ-ikr76ea2a6',66),(133,'2021-12-16 06:19:35.427954','2021-12-16 06:19:35.427971','https://images.unsplash.com/photo-1589361558560-58fd95e47b3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80',67),(134,'2021-12-16 06:19:35.429668','2021-12-16 06:19:35.429684','https://images.unsplash.com/photo-1589361558569-dfffa66869b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1560&q=80',67),(135,'2021-12-16 06:19:35.430441','2021-12-16 06:19:35.430457','https://images.unsplash.com/photo-1604061986761-d9d0cc41b0d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',68),(136,'2021-12-16 06:19:35.431191','2021-12-16 06:19:35.431207','https://images.unsplash.com/photo-1602123116122-9b6e1695a670?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',68),(137,'2021-12-16 06:19:35.431938','2021-12-16 06:19:35.431954','https://images.unsplash.com/photo-1541558869434-2840d308329a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',69),(138,'2021-12-16 06:19:35.432692','2021-12-16 06:19:35.432708','https://images.unsplash.com/photo-1541558949596-1d9103f64840?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',69),(139,'2021-12-16 06:19:35.433465','2021-12-16 06:19:35.433486','https://images.unsplash.com/photo-1558769132-01559c326cbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',70),(140,'2021-12-16 06:19:35.434208','2021-12-16 06:19:35.434227','https://images.unsplash.com/photo-1558603668-6570496b66f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',70),(141,'2021-12-16 06:19:35.434991','2021-12-16 06:19:35.435007','https://images.unsplash.com/photo-1551516595-097a8d938ecd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',71),(142,'2021-12-16 06:19:35.435778','2021-12-16 06:19:35.435798','https://images.unsplash.com/photo-1551516595-09cb9fcf8db5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',71),(143,'2021-12-16 06:19:35.436556','2021-12-16 06:19:35.436575','https://images.unsplash.com/photo-1505821058859-3672fc4508c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1457&q=80',72),(144,'2021-12-16 06:19:35.437421','2021-12-16 06:19:35.437437','https://images.unsplash.com/photo-1505820956113-4a0267ff4c0f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',72),(145,'2021-12-16 06:19:35.438195','2021-12-16 06:19:35.438211','https://images.unsplash.com/photo-1505773278895-5efa7b11679a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=922&q=80',73),(146,'2021-12-16 06:19:35.439005','2021-12-16 06:19:35.439022','https://images.unsplash.com/photo-1505773508401-e26ca9845131?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=961&q=80',73),(147,'2021-12-16 06:19:35.439788','2021-12-16 06:19:35.439804','https://images.unsplash.com/photo-1565330502637-963b256876c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',74),(148,'2021-12-16 06:19:35.440821','2021-12-16 06:19:35.440840','https://images.unsplash.com/photo-1560067174-c5a3a8f37060?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',74),(149,'2021-12-16 06:19:35.441890','2021-12-16 06:19:35.441906','https://images.unsplash.com/photo-1560067174-e553b3647603?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',75),(150,'2021-12-16 06:19:35.442873','2021-12-16 06:19:35.442890','https://images.unsplash.com/photo-1566195992011-5f6b21e539aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',75),(151,'2021-12-16 06:19:35.443748','2021-12-16 06:19:35.443765','https://images.unsplash.com/photo-1616594136787-28732f588083?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',76),(152,'2021-12-16 06:19:35.444607','2021-12-16 06:19:35.444633','https://images.unsplash.com/photo-1616594092403-fb65629b0a46?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',76),(153,'2021-12-16 06:19:35.445555','2021-12-16 06:19:35.445574','https://images.unsplash.com/photo-1613252086325-ac35531fc326?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',77),(154,'2021-12-16 06:19:35.446371','2021-12-16 06:19:35.446390','https://images.unsplash.com/photo-1613252067198-cc29a8368d09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',77),(155,'2021-12-16 06:19:35.447182','2021-12-16 06:19:35.447201','https://images.unsplash.com/photo-1603072388139-565853396b38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',78),(156,'2021-12-16 06:19:35.447993','2021-12-16 06:19:35.448012','https://images.unsplash.com/photo-1603072387865-e48a022fc541?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',78);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Category');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_412ad78b_fk_orders_id` (`order_id`),
  KEY `order_items_product_id_dd557d5a_fk_products_id` (`product_id`),
  CONSTRAINT `order_items_order_id_412ad78b_fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_product_id_dd557d5a_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_number` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `tracking_number` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `order_status_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  UNIQUE KEY `tracking_number` (`tracking_number`),
  KEY `orders_order_status_id_05e726df_fk_order_status_id` (`order_status_id`),
  KEY `orders_user_id_7e2523fb_fk_users_id` (`user_id`),
  CONSTRAINT `orders_order_status_id_05e726df_fk_order_status_id` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `orders_user_id_7e2523fb_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `brand` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `thumbnail_image_url` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `sub_category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_sub_category_id_f08b7711_fk_sub_categories_id` (`sub_category_id`),
  CONSTRAINT `products_sub_category_id_f08b7711_fk_sub_categories_id` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2021-12-16 06:19:35.267030','2021-12-16 06:19:35.267195','MARS-9',199999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/MARS.jpeg',1),(2,'2021-12-16 06:19:35.267939','2021-12-16 06:19:35.267955','PICHU',399999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/PICHU.jpeg',1),(3,'2021-12-16 06:19:35.268605','2021-12-16 06:19:35.268618','KRK',499999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/KRK.jpeg',1),(4,'2021-12-16 06:19:35.269223','2021-12-16 06:19:35.269233','SAT-X',199999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/SAT.png',2),(5,'2021-12-16 06:19:35.269969','2021-12-16 06:19:35.269981','OUR',299999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/OUR.jpeg',2),(6,'2021-12-16 06:19:35.270726','2021-12-16 06:19:35.270738','QN',199999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/QN.jpeg',2),(7,'2021-12-16 06:19:35.271482','2021-12-16 06:19:35.271494','EZ',199999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/EZ.jpeg',1),(8,'2021-12-16 06:19:35.272236','2021-12-16 06:19:35.272247','CONDA',199999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/CONDA.jpeg',2),(9,'2021-12-16 06:19:35.272974','2021-12-16 06:19:35.272985','RO-X',399999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/RO-X.jpeg',1),(10,'2021-12-16 06:19:35.273748','2021-12-16 06:19:35.273760','SF-08',299999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/SF-08.jpeg',2),(11,'2021-12-16 06:19:35.274510','2021-12-16 06:19:35.274522','PAK',399999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/PAK.jpeg',1),(12,'2021-12-16 06:19:35.275252','2021-12-16 06:19:35.275264','RAL',299999.99,'DW','description','https://raw.githubusercontent.com/Djangowon/TIL/main/image/RAL.jpeg',2),(13,'2021-12-16 06:19:35.276004','2021-12-16 06:19:35.276016','SPACE-SUITE',500000.00,'JX','description','https://cdn.pixabay.com/photo/2011/12/13/17/09/astronaut-11050_1280.jpg',3),(14,'2021-12-16 06:19:35.276755','2021-12-16 06:19:35.276767','CYBERX-39',329000.00,'JX','description','https://cdn.pixabay.com/photo/2014/04/09/17/48/man-320274_1280.png',3),(15,'2021-12-16 06:19:35.277508','2021-12-16 06:19:35.277520','WHITE-T',99000.00,'JX','description','https://cdn.pixabay.com/photo/2017/01/13/04/56/blank-1976334_1280.png',3),(16,'2021-12-16 06:19:35.278273','2021-12-16 06:19:35.278285','THE-CAPE',129000.00,'JX','description','https://cdn.pixabay.com/photo/2016/02/09/01/01/isolated-1188090_1280.png',3),(17,'2021-12-16 06:19:35.279028','2021-12-16 06:19:35.279040','RED-HOOD',99000.00,'JX','description','https://cdn.pixabay.com/photo/2015/12/06/21/04/person-1080055_1280.png',3),(18,'2021-12-16 06:19:35.279774','2021-12-16 06:19:35.279786','MATRIX-EFFECT-SUIT',129000.00,'JX','description','https://cdn.pixabay.com/photo/2020/04/29/10/18/stress-5108221__480.jpg',3),(19,'2021-12-16 06:19:35.280525','2021-12-16 06:19:35.280537','NAVY-PANTS',99000.00,'JX','description','https://cdn.pixabay.com/photo/2017/08/27/05/33/trousers-2685231_1280.jpg',4),(20,'2021-12-16 06:19:35.281287','2021-12-16 06:19:35.281299','GRAY-JEAN',39000.00,'JX','description','https://cdn.pixabay.com/photo/2018/10/10/14/23/pants-3737400_1280.jpg',4),(21,'2021-12-16 06:19:35.282050','2021-12-16 06:19:35.282062','JX-HANSOME-SUIT',129000.00,'JX','description','https://cdn.pixabay.com/photo/2021/04/13/15/08/spacesuit-6175962_1280.jpg',4),(22,'2021-12-16 06:19:35.282800','2021-12-16 06:19:35.282812','FISHERMAN-PANTS',99000.00,'JX','description','https://cdn.pixabay.com/photo/2018/01/09/16/11/angler-3071970_1280.jpg',4),(23,'2021-12-16 06:19:35.283543','2021-12-16 06:19:35.283555','SPACE-SUITE-PANTS',99000.00,'JX','description','https://cdn.pixabay.com/photo/2018/06/25/15/21/science-3497118_1280.png',4),(24,'2021-12-16 06:19:35.284297','2021-12-16 06:19:35.284309','ALIEN-SUIT',129000.00,'JX','description','https://www.pngfind.com/pngs/m/594-5944611_green-alien-morphsuit-guy-in-alien-costume-hd.png',4),(25,'2021-12-16 06:19:35.285302','2021-12-16 06:19:35.285314','Happy',1900000.00,'JB','description','https://ifh.cc/g/uGjIbm.jpg',5),(26,'2021-12-16 06:19:35.286052','2021-12-16 06:19:35.286064','Sad',320000.00,'JB','description','https://ifh.cc/g/71E574.jpg',5),(27,'2021-12-16 06:19:35.286779','2021-12-16 06:19:35.286791','Bright-future',550000.00,'JB','description','https://ifh.cc/g/fK841d.jpg',5),(28,'2021-12-16 06:19:35.287531','2021-12-16 06:19:35.287543','Still-happy',520000.00,'JB','description','https://ifh.cc/g/p6B3JX.jpg',5),(29,'2021-12-16 06:19:35.288274','2021-12-16 06:19:35.288286','Feel-so-good',990000.00,'JB','description','https://ifh.cc/g/Sop2cI.jpg',5),(30,'2021-12-16 06:19:35.289025','2021-12-16 06:19:35.289037','Madness',370000.00,'JB','description','https://ifh.cc/g/vtA0Cl.jpg',5),(31,'2021-12-16 06:19:35.289776','2021-12-16 06:19:35.289788','Thorn',23000.00,'JB','description','https://ifh.cc/g/qUSvtX.jpg',6),(32,'2021-12-16 06:19:35.290522','2021-12-16 06:19:35.290534','Almond',120000.00,'JB','description','https://ifh.cc/g/O9hLDj.jpg',6),(33,'2021-12-16 06:19:35.291264','2021-12-16 06:19:35.291276','Cloud',440000.00,'JB','description','https://ifh.cc/g/xAJKTJ.jpg',6),(34,'2021-12-16 06:19:35.291986','2021-12-16 06:19:35.291998','Cliff',520000.00,'JB','description','https://ifh.cc/g/izVNkF.jpg',6),(35,'2021-12-16 06:19:35.292722','2021-12-16 06:19:35.292734','Odd',170000.00,'JB','description','https://ifh.cc/g/8SQ1hu.jpg',6),(36,'2021-12-16 06:19:35.293461','2021-12-16 06:19:35.293473','Dust',230000.00,'JB','description','https://ifh.cc/g/xMnkH2.jpg',6),(37,'2021-12-16 06:19:35.294214','2021-12-16 06:19:35.294226','Sweet-pumpkin',150000.00,'JB','description','https://ifh.cc/g/0wBCXE.jpg',7),(38,'2021-12-16 06:19:35.294954','2021-12-16 06:19:35.294966','Red-apple',264000.00,'JB','description','https://ifh.cc/g/G5i1np.jpg',7),(39,'2021-12-16 06:19:35.295690','2021-12-16 06:19:35.295702','Signal',333200.00,'JB','description','https://ifh.cc/g/d071ZE.jpg',7),(40,'2021-12-16 06:19:35.296431','2021-12-16 06:19:35.296443','Green-hat',221000.00,'JB','description','https://ifh.cc/g/QKWbBW.jpg',7),(41,'2021-12-16 06:19:35.297200','2021-12-16 06:19:35.297212','Yellow-light',333221.00,'JB','description','https://ifh.cc/g/FlMeGh.jpg',7),(42,'2021-12-16 06:19:35.297968','2021-12-16 06:19:35.297980','Blossom',1125000.00,'JB','description','https://ifh.cc/g/NWjPWr.jpg',7),(43,'2021-12-16 06:19:35.298748','2021-12-16 06:19:35.298760','Garzia',5920000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A0111-1.jpg',10),(44,'2021-12-16 06:19:35.299534','2021-12-16 06:19:35.299546','Columpia',7930000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A02-1.jpeg',10),(45,'2021-12-16 06:19:35.300316','2021-12-16 06:19:35.300328','Endevear',11200000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A03.jpg',10),(46,'2021-12-16 06:19:35.301255','2021-12-16 06:19:35.301268','Dophinus',38599900.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A04.jpeg',10),(47,'2021-12-16 06:19:35.302027','2021-12-16 06:19:35.302039','Crapponia',17200000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A05.gif',10),(48,'2021-12-16 06:19:35.302749','2021-12-16 06:19:35.302761','Spaix',10550000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%EC%99%95%EB%B3%B5%EC%84%A06-1.jpg',10),(49,'2021-12-16 06:19:35.303484','2021-12-16 06:19:35.303497','LunaLover',57900000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%95111-1.jpeg',11),(50,'2021-12-16 06:19:35.304212','2021-12-16 06:19:35.304224','Arcron',52100000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%952-1.jpg',11),(51,'2021-12-16 06:19:35.304978','2021-12-16 06:19:35.304991','Detonator',62100000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%953-1.jpeg',11),(52,'2021-12-16 06:19:35.305733','2021-12-16 06:19:35.305746','Univorginy',23500000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%954-1.jpg',11),(53,'2021-12-16 06:19:35.306519','2021-12-16 06:19:35.306532','Vegatti',22200000.00,'CM','description','https://cdn.pixabay.com/photo/2019/09/05/22/09/concept-4455117_1280.jpg',11),(54,'2021-12-16 06:19:35.307280','2021-12-16 06:19:35.307293','LunaCart',8750000.00,'CM','description','https://raw.githubusercontent.com/Ted0527/weStarbucks/main/westarbucks/%ED%83%90%EC%82%AC%EC%A0%956-1.jpg',11),(55,'2021-12-16 06:19:35.308032','2021-12-16 06:19:35.308046','ipone-spaceX1',1000000.00,'JH','description','https://drive.google.com/uc?id=1CbXN3fENQBjcK7xD6ooVinGgNW-uEZeY',9),(56,'2021-12-16 06:19:35.308782','2021-12-16 06:19:35.308796','Green lightsaber',50000.00,'JH','description','https://drive.google.com/uc?id=1y8fkN_Xq9SWyPdl-q7HQVaLwzHcPNDW4',9),(57,'2021-12-16 06:19:35.309822','2021-12-16 06:19:35.309835','Pumpkin lantern',30000.00,'JH','description','https://drive.google.com/uc?id=18ExeiEf22-xSnSPvpZWABLIHgA6to5SX',9),(58,'2021-12-16 06:19:35.310684','2021-12-16 06:19:35.310697','Gun',70000.00,'JH','description','https://drive.google.com/uc?id=1CG44Ek_l0qkl6G7ZZ1WTFdpbSoRFgyQj',9),(59,'2021-12-16 06:19:35.312105','2021-12-16 06:19:35.312118','Long Gun',80000.00,'JH','description','https://drive.google.com/uc?id=1hwz2GORbvJulGPWDpqogRvunp1nvKEcv',9),(60,'2021-12-16 06:19:35.313107','2021-12-16 06:19:35.313120','Blue lightsaber',50000.00,'JH','description','https://drive.google.com/uc?id=1dAedR_HJ24A8Quq6rfT4u22i4_gkIHiB',9),(61,'2021-12-16 06:19:35.313764','2021-12-16 06:19:35.313777','Scrubbers\n',1000.00,'JH','description','https://drive.google.com/uc?id=1y0zZKDGFy8isrRkMukIRNlunFbyha7xV',8),(62,'2021-12-16 06:19:35.314412','2021-12-16 06:19:35.314425','ultrasonic cleaner',5000000.00,'JH','description','https://drive.google.com/uc?id=1mUwAFOfnZd9s1OGGegqel4SnHiX77nhH',8),(63,'2021-12-16 06:19:35.315049','2021-12-16 06:19:35.315062','robot cleaner',7500000.00,'JH','description','https://drive.google.com/uc?id=1HGkXF1C8GNd4D6G4kpETY9icuc0gVWxH',8),(64,'2021-12-16 06:19:35.315659','2021-12-16 06:19:35.315672','Cup',5000.00,'JH','description','https://drive.google.com/uc?id=1JwJv4mR0RV1iA1Vio8DJNvo3ElL2QVRn',8),(65,'2021-12-16 06:19:35.316293','2021-12-16 06:19:35.316306','Coffee machine',120000.00,'JH','description','https://drive.google.com/uc?id=1Rf1Z9tBtg23cTKCeWbi7W0tEZ927edmR',8),(66,'2021-12-16 06:19:35.316912','2021-12-16 06:19:35.316925','Silver plate',60000.00,'JH','description','https://drive.google.com/uc?id=1tR8OuCVc3N1yXezhtSuiEBdOKeA1LkBj',8),(67,'2021-12-16 06:19:35.317534','2021-12-16 06:19:35.317547','Fluffy Lite Gray Chair',379300.00,'WY','description','https://images.unsplash.com/photo-1589361558560-58fd95e47b3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',12),(68,'2021-12-16 06:19:35.318157','2021-12-16 06:19:35.318170','Warm Lite Green Chair',659800.00,'WY','description','https://images.unsplash.com/photo-1604061986761-d9d0cc41b0d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',12),(69,'2021-12-16 06:19:35.318826','2021-12-16 06:19:35.318839','Dark Sky Blue Chair',463000.00,'WY','description','https://images.unsplash.com/photo-1541558869434-2840d308329a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',12),(70,'2021-12-16 06:19:35.319483','2021-12-16 06:19:35.319496','Cactus Net Chair',102300.00,'WY','description','https://images.unsplash.com/photo-1558769132-01559c326cbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',12),(71,'2021-12-16 06:19:35.320227','2021-12-16 06:19:35.320240','Luxury Silk Green Chair ',873200.00,'WY','description','https://images.unsplash.com/photo-1551516595-097a8d938ecd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',12),(72,'2021-12-16 06:19:35.320885','2021-12-16 06:19:35.320898','Beige Blue Chair',113000.00,'WY','description','https://images.unsplash.com/photo-1505821058859-3672fc4508c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1457&q=80',12),(73,'2021-12-16 06:19:35.321496','2021-12-16 06:19:35.321509','Stripe Lite Blue Bed',1022000.00,'WY','description','https://images.unsplash.com/photo-1505773278895-5efa7b11679a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=922&q=80',13),(74,'2021-12-16 06:19:35.322098','2021-12-16 06:19:35.322111','Kotori Beige & Light Green Bed',3001000.00,'WY','description','https://images.unsplash.com/photo-1565330502637-963b256876c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80',13),(75,'2021-12-16 06:19:35.322686','2021-12-16 06:19:35.322699','Soft Sendwich Bed',1463000.00,'WY','description','https://images.unsplash.com/photo-1560067174-e553b3647603?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',13),(76,'2021-12-16 06:19:35.323301','2021-12-16 06:19:35.323314','Light Gray Bed',2330200.00,'WY','description','https://images.unsplash.com/photo-1616594136787-28732f588083?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',13),(77,'2021-12-16 06:19:35.323887','2021-12-16 06:19:35.323900','Pink Leaf Bed',2223000.00,'WY','description','https://images.unsplash.com/photo-1613252086325-ac35531fc326?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',13),(78,'2021-12-16 06:19:35.324470','2021-12-16 06:19:35.324483','Colorfully Stripe Blue Bed',1003600.00,'WY','description','https://images.unsplash.com/photo-1603072388139-565853396b38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',13);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_url` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_product_id_d4b78cfe_fk_products_id` (`product_id`),
  KEY `reviews_user_id_c23b0903_fk_users_id` (`user_id`),
  CONSTRAINT `reviews_product_id_d4b78cfe_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `reviews_user_id_c23b0903_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_category_id_dc42080e_fk_categories_id` (`category_id`),
  CONSTRAINT `sub_categories_category_id_dc42080e_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'Central Area',1),(2,'Belocity Area',1),(3,'Top',2),(4,'Bottom',2),(5,'Food Pills',3),(6,'Seed',3),(7,'seeding',3),(8,'Indoor',4),(9,'Outdoor',4),(10,'Spaceship',5),(11,'Car',5),(12,'Chair',6),(13,'Bed',6);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `kakao_id` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kakao_id` (`kakao_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2021-12-16 21:53:33
