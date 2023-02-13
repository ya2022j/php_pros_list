-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: flarum
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB-1:10.5.19+maria~ubu2004

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `flarum`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `flarum` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `flarum`;

--
-- Table structure for table `flarum_access_tokens`
--

DROP TABLE IF EXISTS `flarum_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(40) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `last_activity_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `type` varchar(100) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `last_ip_address` varchar(45) DEFAULT NULL,
  `last_user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flarum_access_tokens_token_unique` (`token`),
  KEY `flarum_access_tokens_user_id_foreign` (`user_id`),
  KEY `flarum_access_tokens_type_index` (`type`),
  CONSTRAINT `flarum_access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_access_tokens`
--

LOCK TABLES `flarum_access_tokens` WRITE;
/*!40000 ALTER TABLE `flarum_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_api_keys`
--

DROP TABLE IF EXISTS `flarum_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_api_keys` (
  `key` varchar(100) NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `allowed_ips` varchar(255) DEFAULT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flarum_api_keys_key_unique` (`key`),
  KEY `flarum_api_keys_user_id_foreign` (`user_id`),
  CONSTRAINT `flarum_api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_api_keys`
--

LOCK TABLES `flarum_api_keys` WRITE;
/*!40000 ALTER TABLE `flarum_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_discussion_tag`
--

DROP TABLE IF EXISTS `flarum_discussion_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_discussion_tag` (
  `discussion_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discussion_id`,`tag_id`),
  KEY `flarum_discussion_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `flarum_discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `flarum_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `flarum_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_discussion_tag`
--

LOCK TABLES `flarum_discussion_tag` WRITE;
/*!40000 ALTER TABLE `flarum_discussion_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_discussion_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_discussion_user`
--

DROP TABLE IF EXISTS `flarum_discussion_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_discussion_user` (
  `user_id` int(10) unsigned NOT NULL,
  `discussion_id` int(10) unsigned NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int(10) unsigned DEFAULT NULL,
  `subscription` enum('follow','ignore') DEFAULT NULL,
  PRIMARY KEY (`user_id`,`discussion_id`),
  KEY `flarum_discussion_user_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `flarum_discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `flarum_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_discussion_user`
--

LOCK TABLES `flarum_discussion_user` WRITE;
/*!40000 ALTER TABLE `flarum_discussion_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_discussion_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_discussions`
--

DROP TABLE IF EXISTS `flarum_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_discussions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `comment_count` int(11) NOT NULL DEFAULT 1,
  `participant_count` int(10) unsigned NOT NULL DEFAULT 0,
  `post_number_index` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `first_post_id` int(10) unsigned DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int(10) unsigned DEFAULT NULL,
  `last_post_id` int(10) unsigned DEFAULT NULL,
  `last_post_number` int(10) unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `is_sticky` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `flarum_discussions_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `flarum_discussions_first_post_id_foreign` (`first_post_id`),
  KEY `flarum_discussions_last_post_id_foreign` (`last_post_id`),
  KEY `flarum_discussions_last_posted_at_index` (`last_posted_at`),
  KEY `flarum_discussions_last_posted_user_id_index` (`last_posted_user_id`),
  KEY `flarum_discussions_created_at_index` (`created_at`),
  KEY `flarum_discussions_user_id_index` (`user_id`),
  KEY `flarum_discussions_comment_count_index` (`comment_count`),
  KEY `flarum_discussions_participant_count_index` (`participant_count`),
  KEY `flarum_discussions_hidden_at_index` (`hidden_at`),
  KEY `flarum_discussions_is_locked_index` (`is_locked`),
  KEY `flarum_discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`),
  KEY `flarum_discussions_is_sticky_last_posted_at_index` (`is_sticky`,`last_posted_at`),
  FULLTEXT KEY `title` (`title`),
  CONSTRAINT `flarum_discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flarum_discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flarum_discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flarum_discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flarum_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_discussions`
--

LOCK TABLES `flarum_discussions` WRITE;
/*!40000 ALTER TABLE `flarum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_email_tokens`
--

DROP TABLE IF EXISTS `flarum_email_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_email_tokens` (
  `token` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `flarum_email_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `flarum_email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_email_tokens`
--

LOCK TABLES `flarum_email_tokens` WRITE;
/*!40000 ALTER TABLE `flarum_email_tokens` DISABLE KEYS */;
INSERT INTO `flarum_email_tokens` VALUES ('3ZRocW8JoQT5sO9Unzbv2ArhSvdlvVs1yPAgsnac','mingyifan2007@126.com',2,'2023-02-13 00:37:20'),('ok37WPgB7fYWeSu8cc5w61D9ppAbOmsU7Uok1Z8a','mingyifan2d007@126.com',3,'2023-02-13 00:41:00');
/*!40000 ALTER TABLE `flarum_email_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_flags`
--

DROP TABLE IF EXISTS `flarum_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_flags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `reason_detail` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flarum_flags_post_id_foreign` (`post_id`),
  KEY `flarum_flags_user_id_foreign` (`user_id`),
  KEY `flarum_flags_created_at_index` (`created_at`),
  CONSTRAINT `flarum_flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_flags`
--

LOCK TABLES `flarum_flags` WRITE;
/*!40000 ALTER TABLE `flarum_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_group_permission`
--

DROP TABLE IF EXISTS `flarum_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_group_permission` (
  `group_id` int(10) unsigned NOT NULL,
  `permission` varchar(100) NOT NULL,
  PRIMARY KEY (`group_id`,`permission`),
  CONSTRAINT `flarum_group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `flarum_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_group_permission`
--

LOCK TABLES `flarum_group_permission` WRITE;
/*!40000 ALTER TABLE `flarum_group_permission` DISABLE KEYS */;
INSERT INTO `flarum_group_permission` VALUES (2,'viewForum'),(3,'discussion.flagPosts'),(3,'discussion.likePosts'),(3,'discussion.reply'),(3,'discussion.replyWithoutApproval'),(3,'discussion.startWithoutApproval'),(3,'searchUsers'),(3,'startDiscussion'),(4,'discussion.approvePosts'),(4,'discussion.editPosts'),(4,'discussion.hide'),(4,'discussion.hidePosts'),(4,'discussion.lock'),(4,'discussion.rename'),(4,'discussion.sticky'),(4,'discussion.tag'),(4,'discussion.viewFlags'),(4,'discussion.viewIpsPosts'),(4,'user.suspend'),(4,'user.viewLastSeenAt');
/*!40000 ALTER TABLE `flarum_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_group_user`
--

DROP TABLE IF EXISTS `flarum_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_group_user` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `flarum_group_user_group_id_foreign` (`group_id`),
  CONSTRAINT `flarum_group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `flarum_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_group_user`
--

LOCK TABLES `flarum_group_user` WRITE;
/*!40000 ALTER TABLE `flarum_group_user` DISABLE KEYS */;
INSERT INTO `flarum_group_user` VALUES (1,1);
/*!40000 ALTER TABLE `flarum_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_groups`
--

DROP TABLE IF EXISTS `flarum_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_singular` varchar(100) NOT NULL,
  `name_plural` varchar(100) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_groups`
--

LOCK TABLES `flarum_groups` WRITE;
/*!40000 ALTER TABLE `flarum_groups` DISABLE KEYS */;
INSERT INTO `flarum_groups` VALUES (1,'Admin','Admins','#B72A2A','fas fa-wrench',0),(2,'Guest','Guests',NULL,NULL,0),(3,'Member','Members',NULL,NULL,0),(4,'Mod','Mods','#80349E','fas fa-bolt',0);
/*!40000 ALTER TABLE `flarum_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_login_providers`
--

DROP TABLE IF EXISTS `flarum_login_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_login_providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(100) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flarum_login_providers_provider_identifier_unique` (`provider`,`identifier`),
  KEY `flarum_login_providers_user_id_foreign` (`user_id`),
  CONSTRAINT `flarum_login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_login_providers`
--

LOCK TABLES `flarum_login_providers` WRITE;
/*!40000 ALTER TABLE `flarum_login_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_login_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_migrations`
--

DROP TABLE IF EXISTS `flarum_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_migrations`
--

LOCK TABLES `flarum_migrations` WRITE;
/*!40000 ALTER TABLE `flarum_migrations` DISABLE KEYS */;
INSERT INTO `flarum_migrations` VALUES (1,'2015_02_24_000000_create_access_tokens_table',NULL),(2,'2015_02_24_000000_create_api_keys_table',NULL),(3,'2015_02_24_000000_create_config_table',NULL),(4,'2015_02_24_000000_create_discussions_table',NULL),(5,'2015_02_24_000000_create_email_tokens_table',NULL),(6,'2015_02_24_000000_create_groups_table',NULL),(7,'2015_02_24_000000_create_notifications_table',NULL),(8,'2015_02_24_000000_create_password_tokens_table',NULL),(9,'2015_02_24_000000_create_permissions_table',NULL),(10,'2015_02_24_000000_create_posts_table',NULL),(11,'2015_02_24_000000_create_users_discussions_table',NULL),(12,'2015_02_24_000000_create_users_groups_table',NULL),(13,'2015_02_24_000000_create_users_table',NULL),(14,'2015_09_15_000000_create_auth_tokens_table',NULL),(15,'2015_09_20_224327_add_hide_to_discussions',NULL),(16,'2015_09_22_030432_rename_notification_read_time',NULL),(17,'2015_10_07_130531_rename_config_to_settings',NULL),(18,'2015_10_24_194000_add_ip_address_to_posts',NULL),(19,'2015_12_05_042721_change_access_tokens_columns',NULL),(20,'2015_12_17_194247_change_settings_value_column_to_text',NULL),(21,'2016_02_04_095452_add_slug_to_discussions',NULL),(22,'2017_04_07_114138_add_is_private_to_discussions',NULL),(23,'2017_04_07_114138_add_is_private_to_posts',NULL),(24,'2018_01_11_093900_change_access_tokens_columns',NULL),(25,'2018_01_11_094000_change_access_tokens_add_foreign_keys',NULL),(26,'2018_01_11_095000_change_api_keys_columns',NULL),(27,'2018_01_11_101800_rename_auth_tokens_to_registration_tokens',NULL),(28,'2018_01_11_102000_change_registration_tokens_rename_id_to_token',NULL),(29,'2018_01_11_102100_change_registration_tokens_created_at_to_datetime',NULL),(30,'2018_01_11_120604_change_posts_table_to_innodb',NULL),(31,'2018_01_11_155200_change_discussions_rename_columns',NULL),(32,'2018_01_11_155300_change_discussions_add_foreign_keys',NULL),(33,'2018_01_15_071700_rename_users_discussions_to_discussion_user',NULL),(34,'2018_01_15_071800_change_discussion_user_rename_columns',NULL),(35,'2018_01_15_071900_change_discussion_user_add_foreign_keys',NULL),(36,'2018_01_15_072600_change_email_tokens_rename_id_to_token',NULL),(37,'2018_01_15_072700_change_email_tokens_add_foreign_keys',NULL),(38,'2018_01_15_072800_change_email_tokens_created_at_to_datetime',NULL),(39,'2018_01_18_130400_rename_permissions_to_group_permission',NULL),(40,'2018_01_18_130500_change_group_permission_add_foreign_keys',NULL),(41,'2018_01_18_130600_rename_users_groups_to_group_user',NULL),(42,'2018_01_18_130700_change_group_user_add_foreign_keys',NULL),(43,'2018_01_18_133000_change_notifications_columns',NULL),(44,'2018_01_18_133100_change_notifications_add_foreign_keys',NULL),(45,'2018_01_18_134400_change_password_tokens_rename_id_to_token',NULL),(46,'2018_01_18_134500_change_password_tokens_add_foreign_keys',NULL),(47,'2018_01_18_134600_change_password_tokens_created_at_to_datetime',NULL),(48,'2018_01_18_135000_change_posts_rename_columns',NULL),(49,'2018_01_18_135100_change_posts_add_foreign_keys',NULL),(50,'2018_01_30_112238_add_fulltext_index_to_discussions_title',NULL),(51,'2018_01_30_220100_create_post_user_table',NULL),(52,'2018_01_30_222900_change_users_rename_columns',NULL),(55,'2018_09_15_041340_add_users_indicies',NULL),(56,'2018_09_15_041828_add_discussions_indicies',NULL),(57,'2018_09_15_043337_add_notifications_indices',NULL),(58,'2018_09_15_043621_add_posts_indices',NULL),(59,'2018_09_22_004100_change_registration_tokens_columns',NULL),(60,'2018_09_22_004200_create_login_providers_table',NULL),(61,'2018_10_08_144700_add_shim_prefix_to_group_icons',NULL),(62,'2019_10_12_195349_change_posts_add_discussion_foreign_key',NULL),(63,'2020_03_19_134512_change_discussions_default_comment_count',NULL),(64,'2020_04_21_130500_change_permission_groups_add_is_hidden',NULL),(65,'2021_03_02_040000_change_access_tokens_add_type',NULL),(66,'2021_03_02_040500_change_access_tokens_add_id',NULL),(67,'2021_03_02_041000_change_access_tokens_add_title_ip_agent',NULL),(68,'2021_04_18_040500_change_migrations_add_id_primary_key',NULL),(69,'2021_04_18_145100_change_posts_content_column_to_mediumtext',NULL),(70,'2018_07_21_000000_seed_default_groups',NULL),(71,'2018_07_21_000100_seed_default_group_permissions',NULL),(72,'2021_05_10_000000_rename_permissions',NULL),(73,'2015_09_21_011527_add_is_approved_to_discussions','flarum-approval'),(74,'2015_09_21_011706_add_is_approved_to_posts','flarum-approval'),(75,'2017_07_22_000000_add_default_permissions','flarum-approval'),(76,'2018_09_29_060444_replace_emoji_shorcuts_with_unicode','flarum-emoji'),(77,'2015_09_02_000000_add_flags_read_time_to_users_table','flarum-flags'),(78,'2015_09_02_000000_create_flags_table','flarum-flags'),(79,'2017_07_22_000000_add_default_permissions','flarum-flags'),(80,'2018_06_27_101500_change_flags_rename_time_to_created_at','flarum-flags'),(81,'2018_06_27_101600_change_flags_add_foreign_keys','flarum-flags'),(82,'2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at','flarum-flags'),(83,'2018_09_15_043621_add_flags_indices','flarum-flags'),(84,'2019_10_22_000000_change_reason_text_col_type','flarum-flags'),(85,'2015_05_11_000000_create_posts_likes_table','flarum-likes'),(86,'2015_09_04_000000_add_default_like_permissions','flarum-likes'),(87,'2018_06_27_100600_rename_posts_likes_to_post_likes','flarum-likes'),(88,'2018_06_27_100700_change_post_likes_add_foreign_keys','flarum-likes'),(89,'2021_05_10_094200_add_created_at_to_post_likes_table','flarum-likes'),(90,'2015_02_24_000000_add_locked_to_discussions','flarum-lock'),(91,'2017_07_22_000000_add_default_permissions','flarum-lock'),(92,'2018_09_15_043621_add_discussions_indices','flarum-lock'),(93,'2021_03_25_000000_default_settings','flarum-markdown'),(94,'2015_05_11_000000_create_mentions_posts_table','flarum-mentions'),(95,'2015_05_11_000000_create_mentions_users_table','flarum-mentions'),(96,'2018_06_27_102000_rename_mentions_posts_to_post_mentions_post','flarum-mentions'),(97,'2018_06_27_102100_rename_mentions_users_to_post_mentions_user','flarum-mentions'),(98,'2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id','flarum-mentions'),(99,'2018_06_27_102300_change_post_mentions_post_add_foreign_keys','flarum-mentions'),(100,'2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id','flarum-mentions'),(101,'2018_06_27_102500_change_post_mentions_user_add_foreign_keys','flarum-mentions'),(102,'2021_04_19_000000_set_default_settings','flarum-mentions'),(103,'2015_02_24_000000_add_sticky_to_discussions','flarum-sticky'),(104,'2017_07_22_000000_add_default_permissions','flarum-sticky'),(105,'2018_09_15_043621_add_discussions_indices','flarum-sticky'),(106,'2021_01_13_000000_add_discussion_last_posted_at_indices','flarum-sticky'),(107,'2015_05_11_000000_add_subscription_to_users_discussions_table','flarum-subscriptions'),(108,'2015_05_11_000000_add_suspended_until_to_users_table','flarum-suspend'),(109,'2015_09_14_000000_rename_suspended_until_column','flarum-suspend'),(110,'2017_07_22_000000_add_default_permissions','flarum-suspend'),(111,'2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until','flarum-suspend'),(112,'2021_10_27_000000_add_suspend_reason_and_message','flarum-suspend'),(113,'2015_02_24_000000_create_discussions_tags_table','flarum-tags'),(114,'2015_02_24_000000_create_tags_table','flarum-tags'),(115,'2015_02_24_000000_create_users_tags_table','flarum-tags'),(116,'2015_02_24_000000_set_default_settings','flarum-tags'),(117,'2015_10_19_061223_make_slug_unique','flarum-tags'),(118,'2017_07_22_000000_add_default_permissions','flarum-tags'),(119,'2018_06_27_085200_change_tags_columns','flarum-tags'),(120,'2018_06_27_085300_change_tags_add_foreign_keys','flarum-tags'),(121,'2018_06_27_090400_rename_users_tags_to_tag_user','flarum-tags'),(122,'2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at','flarum-tags'),(123,'2018_06_27_100200_change_tag_user_add_foreign_keys','flarum-tags'),(124,'2018_06_27_103000_rename_discussions_tags_to_discussion_tag','flarum-tags'),(125,'2018_06_27_103100_add_discussion_tag_foreign_keys','flarum-tags'),(126,'2019_04_21_000000_add_icon_to_tags_table','flarum-tags');
/*!40000 ALTER TABLE `flarum_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_notifications`
--

DROP TABLE IF EXISTS `flarum_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `from_user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flarum_notifications_from_user_id_foreign` (`from_user_id`),
  KEY `flarum_notifications_user_id_index` (`user_id`),
  CONSTRAINT `flarum_notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flarum_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_notifications`
--

LOCK TABLES `flarum_notifications` WRITE;
/*!40000 ALTER TABLE `flarum_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_password_tokens`
--

DROP TABLE IF EXISTS `flarum_password_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_password_tokens` (
  `token` varchar(100) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `flarum_password_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `flarum_password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_password_tokens`
--

LOCK TABLES `flarum_password_tokens` WRITE;
/*!40000 ALTER TABLE `flarum_password_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_password_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_post_likes`
--

DROP TABLE IF EXISTS `flarum_post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_post_likes` (
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `flarum_post_likes_user_id_foreign` (`user_id`),
  CONSTRAINT `flarum_post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_post_likes`
--

LOCK TABLES `flarum_post_likes` WRITE;
/*!40000 ALTER TABLE `flarum_post_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_post_mentions_post`
--

DROP TABLE IF EXISTS `flarum_post_mentions_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_post_mentions_post` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_post_id`),
  KEY `flarum_post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`),
  CONSTRAINT `flarum_post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_post_mentions_post`
--

LOCK TABLES `flarum_post_mentions_post` WRITE;
/*!40000 ALTER TABLE `flarum_post_mentions_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_post_mentions_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_post_mentions_user`
--

DROP TABLE IF EXISTS `flarum_post_mentions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_post_mentions_user` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_user_id`),
  KEY `flarum_post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`),
  CONSTRAINT `flarum_post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_post_mentions_user`
--

LOCK TABLES `flarum_post_mentions_user` WRITE;
/*!40000 ALTER TABLE `flarum_post_mentions_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_post_mentions_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_post_user`
--

DROP TABLE IF EXISTS `flarum_post_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_post_user` (
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `flarum_post_user_user_id_foreign` (`user_id`),
  CONSTRAINT `flarum_post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `flarum_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_post_user`
--

LOCK TABLES `flarum_post_user` WRITE;
/*!40000 ALTER TABLE `flarum_post_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_post_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_posts`
--

DROP TABLE IF EXISTS `flarum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int(10) unsigned NOT NULL,
  `number` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int(10) unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flarum_posts_discussion_id_number_unique` (`discussion_id`,`number`),
  KEY `flarum_posts_edited_user_id_foreign` (`edited_user_id`),
  KEY `flarum_posts_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `flarum_posts_discussion_id_number_index` (`discussion_id`,`number`),
  KEY `flarum_posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  KEY `flarum_posts_user_id_created_at_index` (`user_id`,`created_at`),
  FULLTEXT KEY `content` (`content`),
  CONSTRAINT `flarum_posts_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `flarum_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flarum_posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flarum_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_posts`
--

LOCK TABLES `flarum_posts` WRITE;
/*!40000 ALTER TABLE `flarum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_registration_tokens`
--

DROP TABLE IF EXISTS `flarum_registration_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_registration_tokens` (
  `token` varchar(100) NOT NULL,
  `payload` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_attributes` text DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_registration_tokens`
--

LOCK TABLES `flarum_registration_tokens` WRITE;
/*!40000 ALTER TABLE `flarum_registration_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_registration_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_settings`
--

DROP TABLE IF EXISTS `flarum_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_settings` (
  `key` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_settings`
--

LOCK TABLES `flarum_settings` WRITE;
/*!40000 ALTER TABLE `flarum_settings` DISABLE KEYS */;
INSERT INTO `flarum_settings` VALUES ('allow_post_editing','reply'),('allow_renaming','10'),('allow_sign_up','1'),('custom_less',''),('default_locale','en'),('default_route','/all'),('display_name_driver','username'),('extensions_enabled','[\"flarum-approval\",\"flarum-bbcode\",\"flarum-emoji\",\"flarum-lang-english\",\"flarum-flags\",\"flarum-likes\",\"flarum-lock\",\"flarum-markdown\",\"flarum-mentions\",\"flarum-statistics\",\"flarum-sticky\",\"flarum-subscriptions\",\"flarum-suspend\",\"flarum-tags\"]'),('flarum-markdown.mdarea','1'),('flarum-mentions.allow_username_format','1'),('flarum-tags.max_primary_tags','1'),('flarum-tags.max_secondary_tags','3'),('flarum-tags.min_primary_tags','1'),('flarum-tags.min_secondary_tags','0'),('forum_description',''),('forum_title','ddd'),('mail_driver','mail'),('mail_from','noreply@localhost'),('slug_driver_Flarum\\User\\User','default'),('theme_colored_header','0'),('theme_dark_mode','0'),('theme_primary_color','#4D698E'),('theme_secondary_color','#4D698E'),('version','1.3.0'),('welcome_message','Enjoy your new forum! Hop over to discuss.flarum.org if you have any questions, or to join our community!'),('welcome_title','Welcome to Flarum');
/*!40000 ALTER TABLE `flarum_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_tag_user`
--

DROP TABLE IF EXISTS `flarum_tag_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_tag_user` (
  `user_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `flarum_tag_user_tag_id_foreign` (`tag_id`),
  CONSTRAINT `flarum_tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `flarum_tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flarum_tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `flarum_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_tag_user`
--

LOCK TABLES `flarum_tag_user` WRITE;
/*!40000 ALTER TABLE `flarum_tag_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `flarum_tag_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_tags`
--

DROP TABLE IF EXISTS `flarum_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `background_path` varchar(100) DEFAULT NULL,
  `background_mode` varchar(100) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `default_sort` varchar(50) DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `discussion_count` int(10) unsigned NOT NULL DEFAULT 0,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int(10) unsigned DEFAULT NULL,
  `last_posted_user_id` int(10) unsigned DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flarum_tags_slug_unique` (`slug`),
  KEY `flarum_tags_parent_id_foreign` (`parent_id`),
  KEY `flarum_tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  KEY `flarum_tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`),
  CONSTRAINT `flarum_tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `flarum_discussions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flarum_tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `flarum_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `flarum_tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `flarum_tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_tags`
--

LOCK TABLES `flarum_tags` WRITE;
/*!40000 ALTER TABLE `flarum_tags` DISABLE KEYS */;
INSERT INTO `flarum_tags` VALUES (1,'General','general',NULL,'#888',NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `flarum_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flarum_users`
--

DROP TABLE IF EXISTS `flarum_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flarum_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(100) NOT NULL,
  `avatar_url` varchar(100) DEFAULT NULL,
  `preferences` blob DEFAULT NULL,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_count` int(10) unsigned NOT NULL DEFAULT 0,
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `suspend_reason` text DEFAULT NULL,
  `suspend_message` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flarum_users_username_unique` (`username`),
  UNIQUE KEY `flarum_users_email_unique` (`email`),
  KEY `flarum_users_joined_at_index` (`joined_at`),
  KEY `flarum_users_last_seen_at_index` (`last_seen_at`),
  KEY `flarum_users_discussion_count_index` (`discussion_count`),
  KEY `flarum_users_comment_count_index` (`comment_count`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flarum_users`
--

LOCK TABLES `flarum_users` WRITE;
/*!40000 ALTER TABLE `flarum_users` DISABLE KEYS */;
INSERT INTO `flarum_users` VALUES (1,'admin','xyz@xyz.com',1,'$2y$10$2xI6T1/ggxnsMADWSRGp5OlusZ5q6Lt/s/zht7ZrN34zHcC4OFBV.',NULL,NULL,'2023-02-13 00:35:47','2023-02-13 00:36:08',NULL,NULL,0,0,NULL,NULL,NULL,NULL),(2,'lkang','mingyifan2007@126.com',0,'$2y$10$RHp2N8oWdxjms.QNcgSwTuEHBsU6qyJ4F.H9/lnfkj0pVksdUnxXe',NULL,NULL,'2023-02-13 00:37:20',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL),(3,'likang','mingyifan2d007@126.com',0,'$2y$10$iGa37sbjvyKDepu.nUaWp.y8.qjdrSDyKG.V9xF1mu6YCoBCLU5AC',NULL,NULL,'2023-02-13 00:41:00',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `flarum_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-13  2:13:17
