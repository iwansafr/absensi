SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int NOT NULL,
  `par_id` int DEFAULT NULL,
  `user_role_ids` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin_menu` (`id`, `par_id`, `user_role_ids`, `title`, `icon`, `link`, `sort_order`, `created`) VALUES
(1, 0, ',1,2,3,', 'Dashboard', 'fa fa-tachometer-alt', '/', 1, '2019-03-30 03:05:59'),
(2, 0, ',1,2,3,', 'Content', 'fa fa-file-alt', '/content', 2, '2019-03-30 03:24:19'),
(3, 2, ',1,2,3,', 'Category', 'fa fa-list', '/content/category', 21, '2019-03-30 03:26:22'),
(4, 2, ',1,2,3,', 'Add Content', 'fa fa-pencil-alt', '/content/edit', 22, '2019-03-30 03:35:27'),
(5, 2, ',1,2,3,', 'Content List', 'fa fa-list', '/content/list', 23, '2019-03-30 03:35:44'),
(6, 2, ',1,2,3,', 'Tag', 'fa fa-list', '/content/tag', 24, '2019-03-30 03:36:06'),
(7, 0, ',1,2,3,', 'Gallery', 'fa fa-images', '/gallery', 3, '2019-03-31 22:53:29'),
(8, 7, ',1,2,3,', 'Images', 'fa fa-image', '/gallery', 31, '2019-03-31 22:53:57'),
(9, 0, ',1,2,', 'User', 'fa fa-user', '/user', 4, '2019-03-31 22:54:25'),
(10, 9, ',1,2,', 'User List', 'fa fa-dot-circle', '/user/list', 41, '2019-03-31 22:55:32'),
(11, 9, ',1,2,', 'User Edit', 'fa fa-dot-circle', '/user/edit', 42, '2019-03-31 22:58:48'),
(12, 9, ',1,', 'User Role', 'fa fa-dot-circle', '/user/role', 43, '2019-03-31 22:59:13'),
(13, 0, ',1,2,', 'Menu', 'fa fa-list', '/menu', 5, '2019-03-31 22:59:33'),
(14, 13, ',1,2,', 'Add Menu', 'fa fa-pencil-alt', '/menu/edit', 51, '2019-03-31 22:59:58'),
(15, 13, ',1,2,', 'Menu List', 'fa fa-pencil-alt', '/menu/list', 52, '2019-03-31 23:00:18'),
(16, 13, ',1,2,', 'Menu Position', 'fa fa-list', '/menu/position', 53, '2019-03-31 23:00:37'),
(17, 0, ',1,', 'Admin Menu', 'fa fa-list', '/admin_menu', 6, '2019-03-31 23:01:10'),
(18, 17, ',1,', 'Add Menu', 'fa fa-pencil-alt', '/admin_menu/edit', 61, '2019-04-01 05:45:00'),
(19, 17, ',1,', 'Menu List', 'fa fa-list', '/admin_menu/list', 62, '2019-04-01 05:45:20'),
(20, 17, ',1,', 'Menu Parent', 'fa fa-list', '/admin_menu/list?id=0', 63, '2019-04-01 05:46:00'),
(21, 0, ',1,2,', 'Data', 'fa fa-database', '/visitor', 7, '2019-04-01 05:46:34'),
(22, 21, ',1,2,', 'Visitor', 'fa fa-chart-bar', '/visitor', 72, '2019-04-01 05:46:56'),
(23, 0, ',1,2,', 'Configuration', 'fa fa-cog', '/config', 8, '2019-04-01 06:03:37'),
(24, 23, ',1,2,', 'Logo', 'fa fa-cog', '/config/logo', 81, '2019-04-01 06:04:28'),
(25, 23, ',1,2,', 'Site', 'fa fa-cog', '/config/site', 82, '2019-04-01 06:04:41'),
(26, 23, ',1,2,', 'Templates', 'fa fa-cog', '/config/templates', 83, '2019-04-01 06:04:57'),
(27, 23, ',1,2,', 'Contact', 'fa fa-cog', '/config/contact', 84, '2019-04-01 06:05:14'),
(28, 23, ',1,2,', 'Style', 'fa fa-cog', '/config/style', 86, '2019-04-01 06:06:52'),
(29, 23, ',1,2,', 'Script', 'fa fa-cog', '/config/script', 87, '2019-04-01 06:07:29'),
(30, 21, ',1,2,', 'Backup', 'fa fa-download', '/backup', 73, '2019-04-01 06:08:04'),
(31, 21, ',1,2,', 'Restore', 'fa fa-upload', '/restore', 74, '2019-04-01 06:08:15'),
(32, 21, ',1,2,', 'Delete Cache', 'fa fa-trash', '/config/delete_cache', 75, '2019-04-04 00:08:10'),
(33, 21, ',1,2,', 'Invoice', 'fa fa-money', '/invoice', 71, '2019-04-05 23:07:23'),
(34, 23, ',1,2,', 'Bank Account', 'fa fa-user', '/config/bank_account', 85, '2019-04-06 01:37:09'),
(35, 23, ',1,', 'Dashboard', 'fa fa-chart-bar', '/config/dashboard', 88, '2019-04-19 18:37:39'),
(37, 21, ',1,', 'Subscribers', 'fa fa-user', '/subscriber', 1, '2019-04-22 06:37:13'),
(38, 0, ',1,2,', 'Sekolah', 'fa fa-school', '#', 1, '2020-07-23 00:12:17'),
(39, 0, ',1,2,3,', 'Pengguna', 'fa fa-user', '#', 1, '2020-07-23 00:12:45'),
(40, 39, ',1,2,3,', 'Tambah Pengguna', 'fa fa-plus', '/pengguna/edit', 1, '2020-07-23 00:13:05'),
(41, 39, ',1,2,3,', 'Data Pengguna', 'fa fa-list', '/pengguna/list', 1, '2020-07-23 00:13:17'),
(42, 38, ',1,2,3,', 'Tambah Sekolah', 'fa fa-plus', '/sekolah/edit', 1, '2020-07-23 00:13:41'),
(43, 38, ',1,2,3,', 'Data Sekolah', 'fa fa-list', '/sekolah/list', 1, '2020-07-23 00:13:55');

DROP TABLE IF EXISTS `bank_account`;
CREATE TABLE `bank_account` (
  `id` int UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `bank_number` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `bank_account` (`id`, `bank_name`, `person_name`, `icon`, `bank_number`, `created`) VALUES
(1, 'BCA', 'Iwan Safrudin', 'icon_BCA.png', '0312609779', '2019-04-14 16:18:57'),
(2, 'BNI', 'Iwan Safrudin', 'icon_BNI.png', '0813920638', '2019-04-14 16:19:55');

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL,
  `par_id` int NOT NULL,
  `module` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=content,2=product',
  `module_id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unread, 1=read',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'templates', '{\"public_template\":\"magazine\",\"admin_template\":\"AdminLTE\"}'),
(2, 'site', '{\"title\":\"sistem absensi\",\"link\":\"https:\\/\\/www.esoftgreat.com\",\"image\":\"image_esoftgreat_1545189785.png\",\"keyword\":\"\",\"description\":\"\",\"year\":\"2015\",\"lang\":\"id\",\"use_cache\":\"0\"}'),
(3, 'logo', '{\"title\":\"sistem absensi\",\"image\":\"image_sarwabimbel_1546913142.png\",\"width\":\"250\",\"height\":\"50\",\"display\":\"image\"}'),
(4, 'one-night_widget', '{\"template\":\"one-night\",\"menu_top\":{\"content\":\"1\"},\"content_slider\":{\"content\":\"latest\",\"limit\":\"7\"},\"content_hot\":{\"content\":\"latest\",\"limit\":\"7\"},\"content_top\":{\"content\":\"latest\",\"limit\":\"7\"},\"content\":{\"content\":\"latest\",\"limit\":\"7\"},\"content_bottom\":{\"content\":\"latest\",\"limit\":\"7\"},\"right\":{\"content\":\"1\",\"limit\":\"7\"},\"menu_right\":{\"content\":\"1\"},\"right_extra\":{\"content\":\"2\",\"limit\":\"7\"},\"menu_bottom_1\":{\"content\":\"2\"},\"menu_bottom_2\":{\"content\":\"2\"},\"menu_bottom_3\":{\"content\":\"2\"},\"menu_footer\":{\"content\":\"2\"}}'),
(5, 'contact', '{\"name\":\"esoftgreat\",\"description\":\"jasa pembuatan website dan software. sesuai kebutuhan dan keinginan anda\",\"address\":\"Jl Tulakan Km 1 \\r\\nDukuh Krajan \\r\\nDesa Tulakan Rt 06\\/02 \\r\\nKec Donorojo Kab Jepara \\r\\nJawa Tengah\\r\\nKode Pos 59454\",\"phone\":\"+6285290335332\",\"wa\":\"6285290335332\",\"email\":\"info@esoftgreat.com\",\"google\":\"https:\\/\\/plus.google.com\\/115611472723876300931\",\"facebook\":\"https:\\/\\/web.facebook.com\\/esoftgreat\\/\",\"twitter\":\"https:\\/\\/twitter.com\",\"instagram\":\"https:\\/\\/instagram.com\",\"linkedin\":\"https:\\/\\/linkedin.com\",\"wordpress\":\"https:\\/\\/esoftgreat.wordrpress.com\",\"yahoo\":\"\",\"youtube\":\"https:\\/\\/www.youtube.com\\/channel\\/UC7QNxh1R6eo3mO2hRJtj6xw?view_as=subscriber\"}'),
(6, 'header', '{\"image\":\"image_Selamat_Datang_di_Esoftgreat_1547957588.jpeg\",\"title\":\"Selamat Datang di Esoftgreat\",\"description\":\"JASA PEMBUATAN WEBSITE, DESAIN, ARTIKEL SEO, SOSIAL MEDIA MARKETING\"}'),
(7, 'Avilon_widget', '{\"template\":\"Avilon\",\"menu_top\":{\"content\":\"1\"},\"content_thumbnail\":{\"content\":\"4\",\"limit\":\"3\"},\"content_hot\":{\"content\":\"5\",\"limit\":\"1\"},\"content_top\":{\"content\":\"6\",\"limit\":\"4\"},\"content\":{\"content\":\"7\",\"limit\":\"3\"},\"content_banner\":{\"content\":\"8\",\"limit\":\"1\"},\"content_bottom\":{\"content\":\"9\",\"limit\":\"4\"},\"content_brand\":{\"content\":\"10\",\"limit\":\"10\"},\"content_pricing\":{\"content\":\"11\",\"limit\":\"3\"},\"content_question\":{\"content\":\"12\",\"limit\":\"7\"},\"content_team\":{\"content\":\"13\",\"limit\":\"7\"},\"content_gallery\":{\"content\":\"14\",\"limit\":\"6\"},\"content_photo\":{\"content\":\"4\",\"limit\":\"7\"},\"content_video\":{\"content\":\"24\",\"limit\":\"7\"},\"content_payment\":{\"content\":\"0\",\"limit\":\"7\"},\"menu_bottom\":{\"content\":\"0\"}}'),
(8, 'Avilon_script', '{\"script\":\"<!-- Go to www.addthis.com\\/dashboard to customize your tools -->\\r\\n<!-- <script type=\\\"text\\/javascript\\\" src=\\\"\\/\\/s7.addthis.com\\/js\\/300\\/addthis_widget.js#pubid=ra-5c2b7a98a617a916\\\"><\\/script> -->\"}'),
(9, 'Avilon_style', '{\"style\":\"<style>\\r\\n.credit{\\r\\npadding-bottom: 10px;\\r\\n}\\r\\n.product-screens img{\\r\\n border-radius: 25px;\\r\\n}\\r\\n#clients img{\\r\\n max-height: 150px;\\r\\n}\\r\\n#clients .col-md-4{\\r\\n text-align: center;\\r\\n}\\r\\n<\\/style>\\r\\n<!-- Global site tag (gtag.js) - Google Analytics -->\\r\\n<script async src=\\\"https:\\/\\/www.googletagmanager.com\\/gtag\\/js?id=UA-113848816-1\\\"><\\/script>\\r\\n<script>\\r\\n  window.dataLayer = window.dataLayer || [];\\r\\n  function gtag(){dataLayer.push(arguments);}\\r\\n  gtag(\'js\', new Date());\\r\\n\\r\\n  gtag(\'config\', \'UA-113848816-1\');\\r\\n<\\/script>\\r\\n<script async src=\\\"\\/\\/pagead2.googlesyndication.com\\/pagead\\/js\\/adsbygoogle.js\\\"><\\/script>\\r\\n<script>\\r\\n  (adsbygoogle = window.adsbygoogle || []).push({\\r\\n    google_ad_client: \\\"ca-pub-3145506515429478\\\",\\r\\n    enable_page_level_ads: true\\r\\n  });\\r\\n<\\/script>\"}'),
(10, 'dashboard', '{\"icon\":{\"bank_account\":\"fa fa-chart-bar\",\"comment\":\"fa fa-chart-bar\",\"content\":\"fa fa-chart-bar\",\"content_cat\":\"fa fa-chart-bar\",\"content_tag\":\"fa fa-chart-bar\",\"invoice\":\"fa fa-chart-bar\",\"menu\":\"fa fa-chart-bar\",\"menu_position\":\"fa fa-chart-bar\",\"message\":\"fa fa-chart-bar\",\"product\":\"fa fa-chart-bar\",\"product_cat\":\"fa fa-chart-bar\",\"product_tag\":\"fa fa-chart-bar\",\"subscriber\":\"\",\"testimonial\":\"\",\"trash\":\"\",\"user\":\"fa fa-chart-bar\",\"user_login\":\"fa fa-chart-bar\",\"user_login_failed\":\"fa fa-chart-bar\",\"user_role\":\"fa fa-chart-bar\",\"visitor\":\"fa fa-chart-bar\"},\"link\":{\"bank_account\":\"\\/admin\\/bank_account\",\"comment\":\"\",\"content\":\"\\/admin\\/content\\/list\",\"content_cat\":\"\\/admin\\/content\\/category\",\"content_tag\":\"\\/admin\\/content\\/tag\",\"invoice\":\"\\/admin\\/invoice\",\"menu\":\"\\/admin\\/menu\\/list\",\"menu_position\":\"\\/admin\\/menu\\/position\",\"message\":\"\\/admin\\/message\",\"product\":\"\",\"product_cat\":\"\",\"product_tag\":\"\",\"subscriber\":\"\",\"testimonial\":\"\",\"trash\":\"\",\"user\":\"\\/admin\\/user\\/list\",\"user_login\":\"\\/admin\\/user\\/login_list\",\"user_login_failed\":\"\\/admin\\/user\\/login_failed\",\"user_role\":\"\\/admin\\/user\\/role\",\"visitor\":\"\\/admin\\/visitor\"},\"color_row\":{\"bank_account\":\"#00cccc\",\"comment\":\"#ff0000\",\"content\":\"#0000ff\",\"content_cat\":\"#00d100\",\"content_tag\":\"#ff00ff\",\"invoice\":\"#000000\",\"menu\":\"#00dede\",\"menu_position\":\"#ff0000\",\"message\":\"#0000ff\",\"product\":\"#00e300\",\"product_cat\":\"#c5c560\",\"product_tag\":\"#737c29\",\"subscriber\":\"#000000\",\"testimonial\":\"#000000\",\"trash\":\"#000000\",\"user\":\"#00e300\",\"user_login\":\"#ff00ff\",\"user_login_failed\":\"#000000\",\"user_role\":\"#e8e800\",\"visitor\":\"#000000\"}}'),
(11, 'subscriber', '{\"broadcast\":0}'),
(12, 'village_widget', '{\"template\":\"village\",\"menu_top\":{\"content\":\"1\"},\"content_slider\":{\"content\":\"3\",\"limit\":\"7\"},\"content_top\":{\"content\":\"5\",\"limit\":\"7\"},\"content\":{\"content\":\"6\",\"limit\":\"7\"},\"content_bottom\":{\"content\":\"7\",\"limit\":\"7\"},\"twitter_widget\":{\"content\":\"\",\"limit\":\"7\"},\"content_latest\":{\"content\":\"8\",\"limit\":\"7\"},\"content_popular\":{\"content\":\"10\",\"limit\":\"7\"},\"category\":{\"content\":\"1\",\"limit\":\"7\"},\"tag\":{\"content\":\"2\",\"limit\":\"7\"},\"menu_bottom_1\":{\"content\":\"2\"},\"menu_bottom_2\":{\"content\":\"2\"},\"menu_bottom_3\":{\"content\":\"2\"},\"menu_footer\":{\"content\":\"2\"}}'),
(13, 'magazine_widget', '{\"template\":\"magazine\",\"menu_top\":{\"content\":\"2\"},\"content_top_banner\":{\"content\":\"2\",\"limit\":\"7\"},\"menu_main\":{\"content\":\"1\"},\"content_news\":{\"content\":\"4\",\"limit\":\"7\"},\"content_slider\":{\"content\":\"4\",\"limit\":\"7\"},\"content_block_1\":{\"content\":\"0\",\"limit\":\"7\"},\"content_banner\":{\"content\":\"0\",\"limit\":\"7\"},\"content_block_2\":{\"content\":\"0\",\"limit\":\"7\"},\"content_gallery\":{\"content\":\"0\",\"limit\":\"7\"},\"content_grid\":{\"content\":\"12\",\"limit\":\"7\"},\"content_advertisement\":{\"content\":\"0\",\"limit\":\"7\"},\"category\":{\"content\":\"0\",\"limit\":\"7\"},\"twitter_widget\":{\"content\":\"\",\"limit\":\"7\"},\"content_popular\":{\"content\":\"0\",\"limit\":\"7\"},\"content_latest\":{\"content\":\"0\",\"limit\":\"7\"},\"content_banner_right\":{\"content\":\"5\",\"limit\":\"7\"},\"menu_bottom\":{\"content\":\"0\"},\"content_bottom\":{\"content\":\"0\",\"limit\":\"7\"}}'),
(16, 'http:__localhost_absensi__main', '{\"lembaga\":\"Kemenag\",\"image\":\"image_pati.jpg\",\"province_id\":\"33\",\"regency_id\":\"3318\"}');

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int NOT NULL,
  `cat_ids` mediumtext NOT NULL,
  `par_id` int DEFAULT '0',
  `tpl` varchar(255) DEFAULT '0',
  `tag_ids` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `source` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `images` text NOT NULL,
  `videos` text,
  `document` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `hits` int NOT NULL,
  `last_hits` datetime NOT NULL,
  `rating` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `publish` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `content` (`id`, `cat_ids`, `par_id`, `tpl`, `tag_ids`, `title`, `slug`, `description`, `keyword`, `intro`, `content`, `source`, `image`, `icon`, `image_link`, `images`, `videos`, `document`, `author`, `hits`, `last_hits`, `rating`, `params`, `created`, `publish`) VALUES
(1, ',1,', 0, '0', ',1,2,', 'Hello World', 'hello-world', 'Hello World\r\n', 'Hello World', 'Hello World\r\n', '<p>Hello World</p>\r\n', '', 'image_Hello_World_1541950550.png', '', '', '[\"images_Hello_World_0_1541950550.png\",\"images_Hello_World_1_1541950550.png\"]', NULL, '', 'admin', 153, '0000-00-00 00:00:00', '', '', '2018-11-11 22:35:50', 1);

DROP TABLE IF EXISTS `content_cat`;
CREATE TABLE `content_cat` (
  `id` int NOT NULL,
  `par_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `description` mediumtext NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `content_cat` (`id`, `par_id`, `title`, `slug`, `image`, `icon`, `description`, `publish`, `created`) VALUES
(1, 0, 'Uncategorized', 'uncategorized', '', '', '', 1, '2018-11-11 22:23:38');

DROP TABLE IF EXISTS `content_tag`;
CREATE TABLE `content_tag` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `total` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru` (
  `id` int NOT NULL,
  `sekolah_id` int NOT NULL,
  `nip` bigint NOT NULL,
  `jabatan` tinyint NOT NULL,
  `golongan` tinyint NOT NULL,
  `tmpt_lahir` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(20) NOT NULL,
  `hp` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `riwayat_pendidikat` json NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `payment_method` tinyint(1) NOT NULL DEFAULT '1',
  `notes` varchar(255) NOT NULL,
  `items` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ppn` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int NOT NULL,
  `par_id` int NOT NULL DEFAULT '0',
  `position_id` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` mediumtext NOT NULL,
  `tpl` varchar(255) NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `menu_position`;
CREATE TABLE `menu_position` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `menu_position` (`id`, `title`, `created`) VALUES
(1, 'Top Menu', '2018-11-12 02:16:02'),
(2, 'Bottom Menu', '2018-11-15 12:39:27');

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=unread,2=read',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `cat_ids` text NOT NULL,
  `tag_ids` text NOT NULL,
  `image` varchar(11) NOT NULL,
  `images` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `qty` int NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = not publish, 1 = publish',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `product_cat`;
CREATE TABLE `product_cat` (
  `id` int NOT NULL,
  `par_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `total` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `sekolah`;
CREATE TABLE `sekolah` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `province_id` int NOT NULL,
  `regency_id` int NOT NULL,
  `district_id` int NOT NULL,
  `website` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sekolah` (`id`, `nama`, `alamat`, `phone`, `email`, `province_id`, `regency_id`, `district_id`, `website`, `created`, `updated`) VALUES
(1, 'MAN 1 PATI', 'pati', '085290335332', 'iwansafr@gmail.com', 33, 3318, 3318100, 'https://man1pati.sch.id', '2020-07-26 23:40:19', NULL);

DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `subscriber` (`id`, `email`, `created`) VALUES
(1, 'iwansafr@gmail.com', '2019-04-22 06:39:07');

DROP TABLE IF EXISTS `testimonial`;
CREATE TABLE `testimonial` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `testimonial` text NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `testimonial` (`id`, `name`, `email`, `profession`, `testimonial`, `publish`, `created`) VALUES
(2, 'iwan', 'iwansafr@gmail.com', 'guru', 'keren websitenya', 0, '2019-08-27 11:53:56');

DROP TABLE IF EXISTS `trash`;
CREATE TABLE `trash` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `table_id` int NOT NULL,
  `table_title` varchar(255) NOT NULL,
  `table_content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `trash` (`id`, `user_id`, `table_id`, `table_title`, `table_content`, `created`) VALUES
(1, 1, 3, 'user', '{\"id\":\"3\",\"username\":\"root\",\"password\":\"$2y$10$oCNvK4jcYmDPvF35ZtYaTOTGstJoRVJFnYMvkZaobiGmudP0IxQMm\",\"email\":\"iwansafr@gmail.com\",\"image\":\"\",\"user_role_id\":\"2\",\"active\":\"1\",\"created\":\"2020-07-26 13:20:13\",\"updated\":\"2020-07-26 13:20:13\"}', '2020-07-26 13:58:46'),
(2, 1, 2, 'user_sekolah', '{\"id\":\"2\",\"sekolah_id\":\"0\",\"user_id\":\"3\",\"user_role_id\":\"2\",\"username\":\"root\",\"email\":\"iwansafr@gmail.com\",\"sandi\":\"1\",\"nama\":\"root\",\"phone\":\"908908\",\"active\":\"1\",\"created\":\"2020-07-26 13:20:13\",\"updated\":\"2020-07-26 13:20:13\"}', '2020-07-26 13:58:52'),
(3, 1, 4, 'user', '{\"id\":\"4\",\"username\":\"iwan\",\"password\":\"$2y$10$WYkAizO8lznat9x2l.b2tuEKBSj.VTzVMXYDfLxxjcz6JdOuoUSgG\",\"email\":\"iwansafr@gmail.com\",\"image\":\"\",\"user_role_id\":\"0\",\"active\":\"1\",\"created\":\"2020-07-26 13:52:31\",\"updated\":\"2020-07-26 13:52:31\"}', '2020-07-26 14:07:49'),
(4, 1, 3, 'user_sekolah', '{\"id\":\"3\",\"sekolah_id\":\"0\",\"user_id\":\"4\",\"user_role_id\":\"0\",\"username\":\"iwan\",\"email\":\"iwansafr@gmail.com\",\"sandi\":\"1\",\"nama\":\"iwan\",\"phone\":\"080989\",\"active\":\"1\",\"created\":\"2020-07-26 13:52:31\",\"updated\":\"2020-07-26 13:52:31\"}', '2020-07-26 14:07:49');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_role_id` int NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = not active',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`, `username`, `password`, `email`, `image`, `user_role_id`, `active`, `created`) VALUES
(1, 'root', '$2y$10$iN3I64zsXAyy9MCEVAPe3uqv1ygazlJgKFYEc2aNCiu2VDe/ZTKjO', 'root@esoftgreat.com', '', 1, 1, '2018-11-03 07:36:32');

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `ip` varchar(15) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=failed, 1=success',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_login` (`id`, `user_id`, `ip`, `browser`, `status`, `created`) VALUES
(1, 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', 1, '2020-07-23 07:11:28'),
(2, 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', 1, '2020-07-23 10:42:56'),
(3, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-26 13:52:14'),
(4, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-26 23:19:25'),
(5, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-26 23:39:11');

DROP TABLE IF EXISTS `user_login_failed`;
CREATE TABLE `user_login_failed` (
  `id` int NOT NULL,
  `user_login_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int NOT NULL,
  `level` tinyint NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_role` (`id`, `level`, `title`, `description`, `created`) VALUES
(1, 1, 'root', 'super user', '2018-11-02 22:57:22'),
(2, 2, 'admin', 'the administrator', '2018-11-02 22:57:22'),
(3, 5, 'Member', 'User member yang hanya berlangganan saja', '2018-11-04 12:59:26'),
(4, 5, 'Sekolah', 'Akun Sekolahan', '2020-07-26 07:12:41');

DROP TABLE IF EXISTS `user_sekolah`;
CREATE TABLE `user_sekolah` (
  `id` int NOT NULL,
  `sekolah_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_role_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sandi` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_sekolah` (`id`, `sekolah_id`, `user_id`, `user_role_id`, `username`, `email`, `sandi`, `nama`, `phone`, `active`) VALUES
(4, 0, 1, 1, 'root', 'iwansafr@gmail.com', ',./\';[]-=90893eih897fjh9ru04jr934', 'root', '085290335332', 1);

DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `id` int NOT NULL,
  `ip` varchar(50) NOT NULL,
  `visited` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `country` varchar(10) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `visitor` (`id`, `ip`, `visited`, `city`, `region`, `country`, `browser`, `created`) VALUES
(1, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:12:42'),
(2, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:25:57'),
(3, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:26:15'),
(4, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:28:54'),
(5, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:28:55'),
(6, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:32:17'),
(7, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:32:19'),
(8, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:32:29'),
(9, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:32:51'),
(10, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:33:00'),
(11, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:44:22'),
(12, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:47:34'),
(13, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:47:56'),
(14, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:48:02'),
(15, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:48:52'),
(16, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:48:57'),
(17, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:50:47'),
(18, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:51:47'),
(19, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:52:48'),
(20, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:54:26'),
(21, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 08:54:26'),
(22, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 09:01:45'),
(23, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 09:02:11'),
(24, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 09:02:16'),
(25, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:43:13'),
(26, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:43:23'),
(27, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:43:32'),
(28, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:43:47'),
(29, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:43:50'),
(30, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:44:37'),
(31, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:53:35'),
(32, '::1', 'http://localhost/absensi/main/get_provinces', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:53:36'),
(33, '::1', 'http://localhost/absensi/main/get_regencies', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:53:36'),
(34, '::1', 'http://localhost/absensi/main/get_districts', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:53:37'),
(35, '::1', 'http://localhost/absensi/main/get_provinces', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:55:08'),
(36, '::1', 'http://localhost/absensi/main/get_regencies', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:55:09'),
(37, '::1', 'http://localhost/absensi/main/get_districts', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:55:09'),
(38, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:55:12'),
(39, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:09'),
(40, '::1', 'http://localhost/absensi/main/get_provinces', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:09'),
(41, '::1', 'http://localhost/absensi/main/get_districts', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:10'),
(42, '::1', 'http://localhost/absensi/main/get_regencies', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:10'),
(43, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:16'),
(44, '::1', 'http://localhost/absensi/main/get_districts', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:18'),
(45, '::1', 'http://localhost/absensi/main/get_provinces', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:21'),
(46, '::1', 'http://localhost/absensi/main/get_regencies', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:22'),
(47, '::1', 'http://localhost/absensi/main/get_regencies', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:25'),
(48, '::1', 'http://localhost/absensi/main/get_provinces', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:25'),
(49, '::1', 'http://localhost/absensi/main/get_districts', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:26'),
(50, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:56:26'),
(51, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:57:16'),
(52, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 10:57:27'),
(53, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 11:02:26'),
(54, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 11:03:56'),
(55, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 11:04:21'),
(56, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 11:04:37'),
(57, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 11:04:51'),
(58, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 11:21:23'),
(59, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 11:24:59'),
(60, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 11:26:43');


ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `content_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

ALTER TABLE `content_tag`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `menu_position`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `product_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `trash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_login_failed`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_sekolah`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `admin_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

ALTER TABLE `bank_account`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `content_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `content_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `guru`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `menu_position`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `message`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `product_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `product_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `sekolah`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `subscriber`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `testimonial`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `trash`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `user_login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `user_login_failed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `user_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `user_sekolah`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `visitor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;


ALTER TABLE `trash`
  ADD CONSTRAINT `trash_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
