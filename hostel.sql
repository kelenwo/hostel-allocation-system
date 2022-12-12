-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: hostel
-- ------------------------------------------------------
-- Server version	5.7.40-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add applications',7,'add_applications'),(26,'Can change applications',7,'change_applications'),(27,'Can delete applications',7,'delete_applications'),(28,'Can view applications',7,'view_applications'),(29,'Can add spaces',8,'add_spaces'),(30,'Can change spaces',8,'change_spaces'),(31,'Can delete spaces',8,'delete_spaces'),(32,'Can view spaces',8,'view_spaces'),(33,'Can add users',9,'add_users'),(34,'Can change users',9,'change_users'),(35,'Can delete users',9,'delete_users'),(36,'Can view users',9,'view_users');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'hostel','applications'),(8,'hostel','spaces'),(9,'hostel','users'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-02 11:36:31.809503'),(2,'auth','0001_initial','2022-12-02 11:36:39.724500'),(3,'admin','0001_initial','2022-12-02 11:36:41.418827'),(4,'admin','0002_logentry_remove_auto_add','2022-12-02 11:36:41.468693'),(5,'admin','0003_logentry_add_action_flag_choices','2022-12-02 11:36:41.516367'),(6,'contenttypes','0002_remove_content_type_name','2022-12-02 11:36:42.513614'),(7,'auth','0002_alter_permission_name_max_length','2022-12-02 11:36:42.630667'),(8,'auth','0003_alter_user_email_max_length','2022-12-02 11:36:42.747662'),(9,'auth','0004_alter_user_username_opts','2022-12-02 11:36:42.788616'),(10,'auth','0005_alter_user_last_login_null','2022-12-02 11:36:43.290785'),(11,'auth','0006_require_contenttypes_0002','2022-12-02 11:36:43.315214'),(12,'auth','0007_alter_validators_add_error_messages','2022-12-02 11:36:43.360133'),(13,'auth','0008_alter_user_username_max_length','2022-12-02 11:36:43.492510'),(14,'auth','0009_alter_user_last_name_max_length','2022-12-02 11:36:43.668163'),(15,'auth','0010_alter_group_name_max_length','2022-12-02 11:36:43.784801'),(16,'auth','0011_update_proxy_permissions','2022-12-02 11:36:43.829871'),(17,'auth','0012_alter_user_first_name_max_length','2022-12-02 11:36:43.960822'),(18,'hostel','0001_initial','2022-12-02 11:36:44.806916'),(19,'sessions','0001_initial','2022-12-02 11:36:45.330581');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('wkbhqsb7gwm0xk2fjcmkmhf7xf9ql9wv','.eJx9j8FqwzAMhl8l6JwuS2HrmlNh9LKxU9k5KLaWmtmyke1BKH332S057LKjPn2_-HUBRkcwwDva3DYfRlBZao5TnghayJEEhgsYDUPf_u8KzSNnN9UE9M8dzZ2ibvf0UnYBY1Re13AQw5Z-akJTQEmOOBX-eiZnFNrmyLNhoqLNxflClW1aivCXk0NjC3X3Ft-l0nZ7WPDs_YPyrl73Uy3yuHnLvOn3-11hkWI0nmHgbG0dHcV0K3wi5Vk3p5XcOwcvaZWD-FnQjWkJ9Y9P1iQF6Izp9r7IamIIY0yYciweXK-_gg93LA:1p4gXV:qXeD-jMWxDKJMUqwHtZFqCiaw53fg4iNo6KlcBZ_IrY','2022-12-26 11:00:05.627469');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_applications`
--

DROP TABLE IF EXISTS `hostel_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostel_applications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `reg_number` varchar(255) NOT NULL,
  `department` varchar(70) NOT NULL,
  `faculty` varchar(70) NOT NULL,
  `hostel` varchar(70) NOT NULL,
  `room_id` varchar(20) NOT NULL,
  `bunk_id` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `session` varchar(20) NOT NULL,
  `status` varchar(15) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_applications`
--

LOCK TABLES `hostel_applications` WRITE;
/*!40000 ALTER TABLE `hostel_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostel_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_spaces`
--

DROP TABLE IF EXISTS `hostel_spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostel_spaces` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hostel` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `room_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `bunk_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_spaces`
--

LOCK TABLES `hostel_spaces` WRITE;
/*!40000 ALTER TABLE `hostel_spaces` DISABLE KEYS */;
INSERT INTO `hostel_spaces` VALUES (1,'Room 1','mph','rm1','A1'),(2,'Room 1','mph','rm1','A2'),(3,'Room 1','mph','rm1','B1'),(4,'Room 1','mph','rm1','B2'),(5,'Room 1','mph','rm1','C1'),(6,'Room 1','mph','rm1','C2'),(7,'Room 1','mph','rm1','D1'),(8,'Room 1','mph','rm1','D2'),(9,'Room 2','mph','rm2','A1'),(10,'Room 2','mph','rm2','A2'),(11,'Room 2','mph','rm2','B1'),(12,'Room 2','mph','rm2','B2'),(13,'Room 2','mph','rm2','C1'),(14,'Room 2','mph','rm2','C2'),(15,'Room 2','mph','rm2','D1'),(16,'Room 2','mph','rm2','D2'),(17,'Room 3','mph','rm3','A1'),(18,'Room 3','mph','rm3','A2'),(19,'Room 3','mph','rm3','B1'),(20,'Room 3','mph','rm3','B2'),(21,'Room 3','mph','rm3','C1'),(22,'Room 3','mph','rm3','C2'),(23,'Room 3','mph','rm3','D1'),(24,'Room 3','mph','rm3','D2'),(25,'Room 4','mph','rm4','A1'),(26,'Room 4','mph','rm4','A2'),(27,'Room 4','mph','rm4','B1'),(28,'Room 4','mph','rm4','B2'),(29,'Room 4','mph','rm4','C1'),(30,'Room 4','mph','rm4','C2'),(31,'Room 4','mph','rm4','D1'),(32,'Room 4','mph','rm4','D2'),(33,'Room 5','mph','rm5','A1'),(34,'Room 5','mph','rm5','A2'),(35,'Room 5','mph','rm5','B1'),(36,'Room 5','mph','rm5','B2'),(37,'Room 5','mph','rm5','C1'),(38,'Room 5','mph','rm5','C2'),(39,'Room 5','mph','rm5','D1'),(40,'Room 5','mph','rm5','D2'),(41,'Room 6','mph','rm6','A1'),(42,'Room 6','mph','rm6','A2'),(43,'Room 6','mph','rm6','B1'),(44,'Room 6','mph','rm6','B2'),(45,'Room 6','mph','rm6','C1'),(46,'Room 6','mph','rm6','C2'),(47,'Room 6','mph','rm6','D1'),(48,'Room 6','mph','rm6','D2'),(49,'Room 7','mph','rm7','A1'),(50,'Room 7','mph','rm7','A2'),(51,'Room 7','mph','rm7','B1'),(52,'Room 7','mph','rm7','B2'),(53,'Room 7','mph','rm7','C1'),(54,'Room 7','mph','rm7','C2'),(55,'Room 7','mph','rm7','D1'),(56,'Room 7','mph','rm7','D2'),(57,'Room 8','mph','rm8','A1'),(58,'Room 8','mph','rm8','A2'),(59,'Room 8','mph','rm8','B1'),(60,'Room 8','mph','rm8','B2'),(61,'Room 8','mph','rm8','C1'),(62,'Room 8','mph','rm8','C2'),(63,'Room 8','mph','rm8','D1'),(64,'Room 8','mph','rm8','D2'),(65,'Room 9','mph','rm9','A1'),(66,'Room 9','mph','rm9','A2'),(67,'Room 9','mph','rm9','B1'),(68,'Room 9','mph','rm9','B2'),(69,'Room 9','mph','rm9','C1'),(70,'Room 9','mph','rm9','C2'),(71,'Room 9','mph','rm9','D1'),(72,'Room 9','mph','rm9','D2'),(73,'Room 10','mph','rm10','A1'),(74,'Room 10','mph','rm10','A2'),(75,'Room 10','mph','rm10','B1'),(76,'Room 10','mph','rm10','B2'),(77,'Room 10','mph','rm10','C1'),(78,'Room 10','mph','rm10','C2'),(79,'Room 10','mph','rm10','D1'),(80,'Room 10','mph','rm10','D2'),(81,'Room 11','mph','rm11','A1'),(82,'Room 11','mph','rm11','A2'),(83,'Room 11','mph','rm11','B1'),(84,'Room 11','mph','rm11','B2'),(85,'Room 11','mph','rm11','C1'),(86,'Room 11','mph','rm11','C2'),(87,'Room 11','mph','rm11','D1'),(88,'Room 11','mph','rm11','D2'),(89,'Room 12','mph','rm12','A1'),(90,'Room 12','mph','rm12','A2'),(91,'Room 12','mph','rm12','B1'),(92,'Room 12','mph','rm12','B2'),(93,'Room 12','mph','rm12','C1'),(94,'Room 12','mph','rm12','C2'),(95,'Room 12','mph','rm12','D1'),(96,'Room 12','mph','rm12','D2'),(97,'Room 13','mph','rm13','A1'),(98,'Room 13','mph','rm13','A2'),(99,'Room 13','mph','rm13','B1'),(100,'Room 13','mph','rm13','B2'),(101,'Room 13','mph','rm13','C1'),(102,'Room 13','mph','rm13','C2'),(103,'Room 13','mph','rm13','D1'),(104,'Room 13','mph','rm13','D2'),(105,'Room 14','mph','rm14','A1'),(106,'Room 14','mph','rm14','A2'),(107,'Room 14','mph','rm14','B1'),(108,'Room 14','mph','rm14','B2'),(109,'Room 14','mph','rm14','C1'),(110,'Room 14','mph','rm14','C2'),(111,'Room 14','mph','rm14','D1'),(112,'Room 14','mph','rm14','D2'),(113,'Room 15','mph','rm15','A1'),(114,'Room 15','mph','rm15','A2'),(115,'Room 15','mph','rm15','B1'),(116,'Room 15','mph','rm15','B2'),(117,'Room 15','mph','rm15','C1'),(118,'Room 15','mph','rm15','C2'),(119,'Room 15','mph','rm15','D1'),(120,'Room 15','mph','rm15','D2'),(121,'Room 16','mph','rm16','A1'),(122,'Room 16','mph','rm16','A2'),(123,'Room 16','mph','rm16','B1'),(124,'Room 16','mph','rm16','B2'),(125,'Room 16','mph','rm16','C1'),(126,'Room 16','mph','rm16','C2'),(127,'Room 16','mph','rm16','D1'),(128,'Room 16','mph','rm16','D2'),(129,'Room 17','mph','rm17','A1'),(130,'Room 17','mph','rm17','A2'),(131,'Room 17','mph','rm17','B1'),(132,'Room 17','mph','rm17','B2'),(133,'Room 17','mph','rm17','C1'),(134,'Room 17','mph','rm17','C2'),(135,'Room 17','mph','rm17','D1'),(136,'Room 17','mph','rm17','D2'),(137,'Room 18','mph','rm18','A1'),(138,'Room 18','mph','rm18','A2'),(139,'Room 18','mph','rm18','B1'),(140,'Room 18','mph','rm18','B2'),(141,'Room 18','mph','rm18','C1'),(142,'Room 18','mph','rm18','C2'),(143,'Room 18','mph','rm18','D1'),(144,'Room 18','mph','rm18','D2'),(145,'Room 19','mph','rm19','A1'),(146,'Room 19','mph','rm19','A2'),(147,'Room 19','mph','rm19','B1'),(148,'Room 19','mph','rm19','B2'),(149,'Room 19','mph','rm19','C1'),(150,'Room 19','mph','rm19','C2'),(151,'Room 19','mph','rm19','D1'),(152,'Room 19','mph','rm19','D2'),(153,'Room 20','mph','rm20','A1'),(154,'Room 20','mph','rm20','A2'),(155,'Room 20','mph','rm20','B1'),(156,'Room 20','mph','rm20','B2'),(157,'Room 20','mph','rm20','C1'),(158,'Room 20','mph','rm20','C2'),(159,'Room 20','mph','rm20','D1'),(160,'Room 20','mph','rm20','D2'),(161,'Room 21','mph','rm21','A1'),(162,'Room 21','mph','rm21','A2'),(163,'Room 21','mph','rm21','B1'),(164,'Room 21','mph','rm21','B2'),(165,'Room 21','mph','rm21','C1'),(166,'Room 21','mph','rm21','C2'),(167,'Room 21','mph','rm21','D1'),(168,'Room 21','mph','rm21','D2'),(169,'Room 22','mph','rm22','A1'),(170,'Room 22','mph','rm22','A2'),(171,'Room 22','mph','rm22','B1'),(172,'Room 22','mph','rm22','B2'),(173,'Room 22','mph','rm22','C1'),(174,'Room 22','mph','rm22','C2'),(175,'Room 22','mph','rm22','D1'),(176,'Room 22','mph','rm22','D2'),(177,'Room 23','mph','rm23','A1'),(178,'Room 23','mph','rm23','A2'),(179,'Room 23','mph','rm23','B1'),(180,'Room 23','mph','rm23','B2'),(181,'Room 23','mph','rm23','C1'),(182,'Room 23','mph','rm23','C2'),(183,'Room 23','mph','rm23','D1'),(184,'Room 23','mph','rm23','D2'),(185,'Room 24','mph','rm24','A1'),(186,'Room 24','mph','rm24','A2'),(187,'Room 24','mph','rm24','B1'),(188,'Room 24','mph','rm24','B2'),(189,'Room 24','mph','rm24','C1'),(190,'Room 24','mph','rm24','C2'),(191,'Room 24','mph','rm24','D1'),(192,'Room 24','mph','rm24','D2');
/*!40000 ALTER TABLE `hostel_spaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_users`
--

DROP TABLE IF EXISTS `hostel_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostel_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `reg_number` varchar(255) NOT NULL,
  `passcode` varchar(255) DEFAULT NULL,
  `department` varchar(70) NOT NULL,
  `faculty` varchar(70) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` varchar(70) DEFAULT NULL,
  `session` varchar(15) DEFAULT NULL,
  `semester` varchar(70) DEFAULT NULL,
  `passport` varchar(70) DEFAULT NULL,
  `program_type` varchar(70) DEFAULT NULL,
  `rrr` int(11) DEFAULT NULL,
  `app_status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_users`
--

LOCK TABLES `hostel_users` WRITE;
/*!40000 ALTER TABLE `hostel_users` DISABLE KEYS */;
INSERT INTO `hostel_users` VALUES (1,'Kalu, Miracle Ebube','16/eg/ce/758','prinleve','Chemical Engineering','Engineering','miraclekalu22@yahoo.com','10-Jun-1997',NULL,'Second Semester',NULL,'Undergraduate',NULL,'');
/*!40000 ALTER TABLE `hostel_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-12 12:01:21
