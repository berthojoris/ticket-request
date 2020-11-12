-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table ticketrequest.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.brands: ~0 rows (approximately)
DELETE FROM `brands`;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.brand_users
CREATE TABLE IF NOT EXISTS `brand_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_users_brand_id_foreign` (`brand_id`),
  KEY `brand_users_user_id_foreign` (`user_id`),
  CONSTRAINT `brand_users_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `users` (`id`),
  CONSTRAINT `brand_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.brand_users: ~0 rows (approximately)
DELETE FROM `brand_users`;
/*!40000 ALTER TABLE `brand_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_users` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.categories: ~2 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Category 1', 'category-1', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(2, NULL, 1, 'Category 2', 'category-2', '2020-11-12 12:03:58', '2020-11-12 12:03:58');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.data_rows: ~94 rows (approximately)
DELETE FROM `data_rows`;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
	(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
	(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
	(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
	(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
	(56, 7, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(57, 7, 'uuid', 'hidden', 'UUID', 1, 1, 1, 1, 1, 1, '{}', 5),
	(58, 7, 'project_id', 'text', 'Project Name', 1, 1, 1, 1, 1, 1, '{}', 6),
	(59, 7, 'brand_id', 'select_dropdown', 'Brand Name', 1, 1, 1, 1, 1, 1, '{}', 2),
	(60, 7, 'program_name', 'text', 'Program Name', 1, 1, 1, 1, 1, 1, '{}', 7),
	(61, 7, 'project_name', 'text', 'Project Name', 1, 1, 1, 1, 1, 1, '{}', 8),
	(62, 7, 'background', 'rich_text_box', 'Background', 1, 1, 1, 1, 1, 1, '{}', 9),
	(63, 7, 'objective', 'rich_text_box', 'Objective', 1, 1, 1, 1, 1, 1, '{}', 10),
	(64, 7, 'target_audience', 'rich_text_box', 'Target Audience', 1, 1, 1, 1, 1, 1, '{}', 11),
	(65, 7, 'channels', 'rich_text_box', 'Channels', 1, 1, 1, 1, 1, 1, '{}', 12),
	(66, 7, 'digital_assets', 'rich_text_box', 'Digital Assets', 1, 1, 1, 1, 1, 1, '{}', 13),
	(67, 7, 'creative_consideration', 'rich_text_box', 'Creative Consideration', 1, 1, 1, 1, 1, 1, '{}', 14),
	(68, 7, 'support_from_other_channel', 'rich_text_box', 'Support From Other Channel', 1, 1, 1, 1, 1, 1, '{}', 15),
	(69, 7, 'competitor', 'rich_text_box', 'Competitor', 1, 1, 1, 1, 1, 1, '{}', 16),
	(70, 7, 'kpi', 'rich_text_box', 'Kpi', 1, 1, 1, 1, 1, 1, '{}', 17),
	(71, 7, 'requirement_rules', 'text', 'Requirement Rules', 1, 1, 1, 1, 1, 1, '{}', 18),
	(72, 7, 'reference', 'rich_text_box', 'Reference', 1, 1, 1, 1, 1, 1, '{}', 19),
	(73, 7, 'campaign_period_start', 'date', 'Campaign Period Start', 1, 1, 1, 1, 1, 1, '{}', 20),
	(74, 7, 'campaign_period_end', 'date', 'Campaign Period End', 1, 1, 1, 1, 1, 1, '{}', 21),
	(75, 7, 'development_deadline_start', 'date', 'Development Deadline Start', 1, 1, 1, 1, 1, 1, '{}', 22),
	(76, 7, 'development_deadline_end', 'date', 'Development Deadline End', 1, 1, 1, 1, 1, 1, '{}', 23),
	(77, 7, 'budget', 'text', 'Budget', 1, 1, 1, 1, 1, 1, '{}', 24),
	(78, 7, 'requested_id', 'hidden', 'From', 1, 1, 1, 1, 1, 1, '{}', 3),
	(79, 7, 'received_id', 'select_dropdown', 'To', 1, 1, 1, 1, 1, 1, '{}', 4),
	(80, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 25),
	(81, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 26),
	(82, 8, 'id', 'hidden', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(83, 8, 'uuid', 'hidden', 'UUID', 1, 0, 0, 0, 0, 0, '{}', 2),
	(84, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
	(85, 8, 'img', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
	(86, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
	(87, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(88, 9, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(89, 9, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 3),
	(90, 9, 'reason', 'text', 'Reason', 0, 1, 1, 1, 1, 1, '{}', 4),
	(91, 9, 'document_attached', 'text', 'Document Attached', 0, 1, 1, 1, 1, 1, '{}', 5),
	(92, 9, 'created_by', 'text', 'Created By', 1, 1, 1, 1, 1, 1, '{}', 2),
	(93, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
	(94, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.data_types: ~9 rows (approximately)
DELETE FROM `data_types`;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(7, 'form_requests', 'form-requests', 'Form Request', 'Form Requests', 'voyager-window-list', 'App\\FormRequest', NULL, NULL, 'Form Request', 1, 1, '{"order_column":"id","order_display_column":"id","order_direction":"desc","default_search_key":"program_name","scope":null}', '2020-11-12 12:08:11', '2020-11-12 16:24:12'),
	(8, 'brands', 'brands', 'Brand', 'Brands', NULL, 'App\\Brand', NULL, NULL, NULL, 1, 1, '{"order_column":"id","order_display_column":"id","order_direction":"desc","default_search_key":"name","scope":null}', '2020-11-12 16:46:08', '2020-11-12 16:50:06'),
	(9, 'form_request_histories', 'form-request-histories', 'Form Request History', 'Form Request Histories', NULL, 'App\\FormRequestHistory', NULL, NULL, NULL, 1, 1, '{"order_column":"id","order_display_column":"id","order_direction":"desc","default_search_key":null}', '2020-11-12 16:48:02', '2020-11-12 16:48:02');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.email_notifs
CREATE TABLE IF NOT EXISTS `email_notifs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from` bigint(20) unsigned NOT NULL,
  `to` bigint(20) unsigned NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_notifs_from_foreign` (`from`),
  KEY `email_notifs_to_foreign` (`to`),
  CONSTRAINT `email_notifs_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`),
  CONSTRAINT `email_notifs_to_foreign` FOREIGN KEY (`to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.email_notifs: ~0 rows (approximately)
DELETE FROM `email_notifs`;
/*!40000 ALTER TABLE `email_notifs` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_notifs` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.file_downloads
CREATE TABLE IF NOT EXISTS `file_downloads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `random_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `saved_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_downloads_uploaded_id_foreign` (`uploaded_id`),
  CONSTRAINT `file_downloads_uploaded_id_foreign` FOREIGN KEY (`uploaded_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.file_downloads: ~0 rows (approximately)
DELETE FROM `file_downloads`;
/*!40000 ALTER TABLE `file_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_downloads` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.form_requests
CREATE TABLE IF NOT EXISTS `form_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` bigint(20) unsigned NOT NULL,
  `program_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `objective` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_audience` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `channels` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `digital_assets` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `creative_consideration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_from_other_channel` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `competitor` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `kpi` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement_rules` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_period_start` date NOT NULL,
  `campaign_period_end` date NOT NULL,
  `development_deadline_start` date NOT NULL,
  `development_deadline_end` date NOT NULL,
  `budget` double NOT NULL,
  `requested_id` bigint(20) unsigned NOT NULL,
  `received_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_requests_requested_id_foreign` (`requested_id`),
  KEY `form_requests_received_id_foreign` (`received_id`),
  KEY `form_requests_brand_id_foreign` (`brand_id`),
  CONSTRAINT `form_requests_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `users` (`id`),
  CONSTRAINT `form_requests_received_id_foreign` FOREIGN KEY (`received_id`) REFERENCES `users` (`id`),
  CONSTRAINT `form_requests_requested_id_foreign` FOREIGN KEY (`requested_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.form_requests: ~0 rows (approximately)
DELETE FROM `form_requests`;
/*!40000 ALTER TABLE `form_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_requests` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.form_request_histories
CREATE TABLE IF NOT EXISTS `form_request_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('created','accepted','returned','in_progress','pending','canceled','closed','done') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `document_attached` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_request_histories_created_by_foreign` (`created_by`),
  CONSTRAINT `form_request_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.form_request_histories: ~0 rows (approximately)
DELETE FROM `form_request_histories`;
/*!40000 ALTER TABLE `form_request_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_request_histories` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `function` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_user_id_foreign` (`user_id`),
  CONSTRAINT `logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.logs: ~0 rows (approximately)
DELETE FROM `logs`;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.menus: ~0 rows (approximately)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2020-11-12 12:03:58', '2020-11-12 12:03:58');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.menu_items: ~18 rows (approximately)
DELETE FROM `menu_items`;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-11-12 12:03:58', '2020-11-12 12:03:58', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2020-11-12 12:03:58', '2020-11-12 16:14:57', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-11-12 12:03:58', '2020-11-12 12:03:58', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-11-12 12:03:58', '2020-11-12 12:03:58', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2020-11-12 12:03:58', '2020-11-12 16:14:57', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-11-12 12:03:58', '2020-11-12 16:14:57', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-11-12 12:03:58', '2020-11-12 16:14:57', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-11-12 12:03:58', '2020-11-12 16:14:57', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-11-12 12:03:58', '2020-11-12 16:14:57', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2020-11-12 12:03:58', '2020-11-12 16:14:57', 'voyager.settings.index', NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2020-11-12 12:03:58', '2020-11-12 16:14:57', 'voyager.categories.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2020-11-12 12:03:58', '2020-11-12 16:14:57', 'voyager.posts.index', NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2020-11-12 12:03:59', '2020-11-12 16:14:57', 'voyager.pages.index', NULL),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-11-12 12:03:59', '2020-11-12 16:14:57', 'voyager.hooks', NULL),
	(16, 1, 'Form Request', '/admin/form-requests', '_self', 'voyager-window-list', '#000000', 19, 1, '2020-11-12 16:16:54', '2020-11-12 17:05:29', NULL, ''),
	(17, 1, 'Brands', '', '_self', 'voyager-window-list', '#000000', 19, 2, '2020-11-12 16:46:08', '2020-11-12 17:08:08', 'voyager.brands.index', 'null'),
	(18, 1, 'Form Request Histories', '', '_self', 'voyager-window-list', '#000000', 19, 3, '2020-11-12 16:48:02', '2020-11-12 17:08:17', 'voyager.form-request-histories.index', 'null'),
	(19, 1, 'User Pages', '', '_self', 'voyager-documentation', '#000000', NULL, 10, '2020-11-12 17:05:16', '2020-11-12 17:06:32', NULL, '');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.migrations: ~37 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
	(2, '2014_10_12_000000_create_users_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2016_01_01_000000_add_voyager_user_fields', 1),
	(5, '2016_01_01_000000_create_data_types_table', 1),
	(6, '2016_01_01_000000_create_pages_table', 1),
	(7, '2016_01_01_000000_create_posts_table', 1),
	(8, '2016_02_15_204651_create_categories_table', 1),
	(9, '2016_05_19_173453_create_menu_table', 1),
	(10, '2016_10_21_190000_create_roles_table', 1),
	(11, '2016_10_21_190000_create_settings_table', 1),
	(12, '2016_11_30_135954_create_permission_table', 1),
	(13, '2016_11_30_141208_create_permission_role_table', 1),
	(14, '2016_12_26_201236_data_types__add__server_side', 1),
	(15, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(16, '2017_01_14_005015_create_translations_table', 1),
	(17, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(18, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(19, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
	(20, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(21, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(22, '2017_08_05_000000_add_group_to_settings_table', 1),
	(23, '2017_11_26_013050_add_user_role_relationship', 1),
	(24, '2017_11_26_015000_create_user_roles_table', 1),
	(25, '2018_03_11_000000_add_user_settings', 1),
	(26, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(27, '2018_03_16_000000_make_settings_value_nullable', 1),
	(28, '2019_08_19_000000_create_failed_jobs_table', 1),
	(29, '2020_11_12_081603_create_form_requests_table', 1),
	(30, '2020_11_12_082433_create_form_request_histories_table', 1),
	(31, '2020_11_12_082945_create_email_notifs_table', 1),
	(32, '2020_11_12_083542_create_brands_table', 1),
	(33, '2020_11_12_083614_create_brand_users_table', 1),
	(34, '2020_11_12_084032_create_logs_table', 1),
	(35, '2020_11_12_084113_create_notifications_table', 1),
	(36, '2020_11_12_085830_create_file_downloads_table', 1),
	(37, '2020_11_12_100521_update_form_request_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.notifications: ~0 rows (approximately)
DELETE FROM `notifications`;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.pages: ~0 rows (approximately)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-11-12 12:03:59', '2020-11-12 12:03:59');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.permissions: ~56 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(2, 'browse_bread', NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(3, 'browse_database', NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(4, 'browse_media', NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(5, 'browse_compass', NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(6, 'browse_menus', 'menus', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(7, 'read_menus', 'menus', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(8, 'edit_menus', 'menus', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(9, 'add_menus', 'menus', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(10, 'delete_menus', 'menus', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(11, 'browse_roles', 'roles', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(12, 'read_roles', 'roles', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(13, 'edit_roles', 'roles', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(14, 'add_roles', 'roles', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(15, 'delete_roles', 'roles', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(16, 'browse_users', 'users', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(17, 'read_users', 'users', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(18, 'edit_users', 'users', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(19, 'add_users', 'users', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(20, 'delete_users', 'users', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(21, 'browse_settings', 'settings', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(22, 'read_settings', 'settings', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(23, 'edit_settings', 'settings', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(24, 'add_settings', 'settings', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(25, 'delete_settings', 'settings', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(26, 'browse_categories', 'categories', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(27, 'read_categories', 'categories', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(28, 'edit_categories', 'categories', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(29, 'add_categories', 'categories', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(30, 'delete_categories', 'categories', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(31, 'browse_posts', 'posts', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(32, 'read_posts', 'posts', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(33, 'edit_posts', 'posts', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(34, 'add_posts', 'posts', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(35, 'delete_posts', 'posts', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(36, 'browse_pages', 'pages', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(37, 'read_pages', 'pages', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(38, 'edit_pages', 'pages', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(39, 'add_pages', 'pages', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(40, 'delete_pages', 'pages', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(41, 'browse_hooks', NULL, '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(42, 'browse_form_requests', 'form_requests', '2020-11-12 12:08:11', '2020-11-12 12:08:11'),
	(43, 'read_form_requests', 'form_requests', '2020-11-12 12:08:11', '2020-11-12 12:08:11'),
	(44, 'edit_form_requests', 'form_requests', '2020-11-12 12:08:11', '2020-11-12 12:08:11'),
	(45, 'add_form_requests', 'form_requests', '2020-11-12 12:08:11', '2020-11-12 12:08:11'),
	(46, 'delete_form_requests', 'form_requests', '2020-11-12 12:08:11', '2020-11-12 12:08:11'),
	(47, 'browse_brands', 'brands', '2020-11-12 16:46:08', '2020-11-12 16:46:08'),
	(48, 'read_brands', 'brands', '2020-11-12 16:46:08', '2020-11-12 16:46:08'),
	(49, 'edit_brands', 'brands', '2020-11-12 16:46:08', '2020-11-12 16:46:08'),
	(50, 'add_brands', 'brands', '2020-11-12 16:46:08', '2020-11-12 16:46:08'),
	(51, 'delete_brands', 'brands', '2020-11-12 16:46:08', '2020-11-12 16:46:08'),
	(52, 'browse_form_request_histories', 'form_request_histories', '2020-11-12 16:48:02', '2020-11-12 16:48:02'),
	(53, 'read_form_request_histories', 'form_request_histories', '2020-11-12 16:48:02', '2020-11-12 16:48:02'),
	(54, 'edit_form_request_histories', 'form_request_histories', '2020-11-12 16:48:02', '2020-11-12 16:48:02'),
	(55, 'add_form_request_histories', 'form_request_histories', '2020-11-12 16:48:02', '2020-11-12 16:48:02'),
	(56, 'delete_form_request_histories', 'form_request_histories', '2020-11-12 16:48:02', '2020-11-12 16:48:02');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.permission_role: ~55 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(54, 1),
	(55, 1),
	(56, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.posts: ~4 rows (approximately)
DELETE FROM `posts`;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-12 12:03:58', '2020-11-12 12:03:58');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2020-11-12 12:03:58', '2020-11-12 12:03:58'),
	(2, 'user', 'Normal User', '2020-11-12 12:03:58', '2020-11-12 12:03:58');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.settings: ~10 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'DIGITAL PROJECT BRIEF', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'DIGITAL PROJECT BRIEF', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Administrator', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', 'settings\\November2020\\iaTgqgYedQnN0V2h3Tnq.png', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.translations: ~30 rows (approximately)
DELETE FROM `translations`;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-11-12 12:03:59', '2020-11-12 12:03:59'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-11-12 12:03:59', '2020-11-12 12:03:59');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Bertho', 'berthojoris@gmail.com', 'users/default.png', NULL, '$2y$10$ZNH.3akufHbaIS/qEosnzO2YfYdnYuxtIXpWfNmctKq8/2IbKJPLe', '9g20eek4GaBlFNPfPCxGtPQgxycWvx2GApTdUrWliCoLAOOeTlW3Xui0ijT6', NULL, '2020-11-12 12:03:58', '2020-11-12 12:03:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.user_roles: ~0 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Dumping structure for table ticketrequest.websockets_statistics_entries
CREATE TABLE IF NOT EXISTS `websockets_statistics_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ticketrequest.websockets_statistics_entries: ~0 rows (approximately)
DELETE FROM `websockets_statistics_entries`;
/*!40000 ALTER TABLE `websockets_statistics_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `websockets_statistics_entries` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
