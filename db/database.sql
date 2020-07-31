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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `admin_menu` (`id`, `par_id`, `user_role_ids`, `title`, `icon`, `link`, `sort_order`, `created`) VALUES
(1, 0, ',1,2,3,4,', 'Dashboard', 'fa fa-tachometer-alt', '/', 1, '2019-03-30 03:05:59'),
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
(38, 0, ',1,2,4,', 'Instansi', 'fa fa-school', '#', 1, '2020-07-23 00:12:17'),
(39, 0, ',1,2,3,', 'Pengguna', 'fa fa-user', '#', 1, '2020-07-23 00:12:45'),
(40, 39, ',1,2,3,', 'Tambah Pengguna', 'fa fa-plus', '/pengguna/edit', 1, '2020-07-23 00:13:05'),
(41, 39, ',1,2,3,', 'Data Pengguna', 'fa fa-list', '/pengguna/list', 1, '2020-07-23 00:13:17'),
(42, 38, ',1,2,3,', 'Tambah Instansi', 'fa fa-plus', '/instansi/edit', 1, '2020-07-23 00:13:41'),
(43, 38, ',1,2,3,4,', 'Data Instansi', 'fa fa-list', '/instansi/list', 1, '2020-07-23 00:13:55'),
(44, 0, ',1,2,4,', 'Karyawan', 'fa fa-chalkboard-teacher', '#', 1, '2020-07-29 07:59:17'),
(45, 44, ',1,2,4,', 'Tambah Karyawan', 'fa fa-plus', '/karyawan/edit', 1, '2020-07-29 08:00:44'),
(46, 44, ',1,2,4,', 'Data Karyawan', 'fa fa-list', '/karyawan/list', 1, '2020-07-29 08:00:58');

DROP TABLE IF EXISTS `bank_account`;
CREATE TABLE `bank_account` (
  `id` int UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `bank_number` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `content` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unread, 1=read',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'templates', '{\"public_template\":\"AdminLTE\",\"admin_template\":\"AdminLTE\"}'),
(2, 'site', '{\"title\":\"sistem absensi\",\"link\":\"https:\\/\\/www.esoftgreat.com\",\"image\":\"image_esoftgreat_1545189785.png\",\"keyword\":\"\",\"description\":\"\",\"year\":\"2015\",\"lang\":\"id\",\"use_cache\":\"0\"}'),
(3, 'logo', '{\"title\":\"sistem absensi\",\"image\":\"image_sistem_absensi.png\",\"width\":\"250\",\"height\":\"150\",\"display\":\"title\"}'),
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
(16, 'http:__localhost_absensi__main', '{\"lembaga\":\"Kemenag\",\"image\":\"image_pati.jpg\",\"province_id\":\"33\",\"regency_id\":\"3318\"}'),
(18, 'config_theme', '{\"main_color\":\"#27dd30\",\"font_color\":\"#f9f5f5\"}');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `instansi`;
CREATE TABLE `instansi` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `province_id` int NOT NULL,
  `regency_id` int NOT NULL,
  `district_id` int NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `website` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `instansi` (`id`, `nama`, `alamat`, `phone`, `email`, `province_id`, `regency_id`, `district_id`, `longitude`, `latitude`, `website`, `created`, `updated`) VALUES
(1, 'MAN 1 PATI', 'pati', '085290335332', 'iwansafr@gmail.com', 33, 3318, 3318100, 110.8857718, -6.4702896999999995, 'https://man1pati.sch.id', '2020-07-26 23:40:19', '2020-07-31 18:44:38');

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `payment_method` tinyint(1) NOT NULL DEFAULT '1',
  `notes` varchar(255) NOT NULL,
  `items` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ppn` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan` (
  `id` int NOT NULL,
  `instansi_id` int NOT NULL,
  `kary_group_id` int NOT NULL,
  `nip` bigint NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jk` tinyint(1) NOT NULL COMMENT '1=laki-laki,2=perempuan',
  `foto` varchar(255) NOT NULL,
  `jabatan` tinyint NOT NULL,
  `golongan` tinyint NOT NULL,
  `tmpt_lahir` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(20) NOT NULL,
  `hp` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `riwayat_pendidikan` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `karyawan` (`id`, `instansi_id`, `kary_group_id`, `nip`, `nama`, `jk`, `foto`, `jabatan`, `golongan`, `tmpt_lahir`, `tgl_lahir`, `alamat`, `telp`, `hp`, `email`, `riwayat_pendidikan`, `created`) VALUES
(1, 1, 1, 0, 'Iwan Safrudin, S.Kom', 1, 'foto_Iwan_Safrudin,_S.Kom.jpg', 0, 0, 'jepara', '1993-01-16', '', '', '', '', '-MI matholiul falah tulakan jepara\r\n-smp islam keling jepara\r\n-sma negeri 1 donrojo\r\n-universitas muria kudus', '2020-07-29 15:14:13'),
(2, 1, 1, 0, 'marulina fivit octavia, S.I.pust', 2, 'foto_marulina_fivit_octavia,_S.I.pust.png', 0, 0, 'jepara', '1993-10-27', '', '', '', '', '-sd negeri 1 tunahan\r\n-mts darul falah sirahan pati\r\n-ma darul falah sirahan pati', '2020-07-29 15:24:54');

DROP TABLE IF EXISTS `karyawan_group`;
CREATE TABLE `karyawan_group` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `karyawan_group` (`id`, `title`) VALUES
(1, 'guru'),
(2, 'TU');

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
  `message` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=unread,2=read',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `cat_ids` mediumtext NOT NULL,
  `tag_ids` mediumtext NOT NULL,
  `image` varchar(11) NOT NULL,
  `images` mediumtext NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `price` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `qty` int NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = not publish, 1 = publish',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `subscriber` (`id`, `email`, `created`) VALUES
(1, 'iwansafr@gmail.com', '2019-04-22 06:39:07');

DROP TABLE IF EXISTS `testimonial`;
CREATE TABLE `testimonial` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `testimonial` mediumtext NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `testimonial` (`id`, `name`, `email`, `profession`, `testimonial`, `publish`, `created`) VALUES
(2, 'iwan', 'iwansafr@gmail.com', 'guru', 'keren websitenya', 0, '2019-08-27 11:53:56');

DROP TABLE IF EXISTS `trash`;
CREATE TABLE `trash` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `table_id` int NOT NULL,
  `table_title` varchar(255) NOT NULL,
  `table_content` mediumtext NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `trash` (`id`, `user_id`, `table_id`, `table_title`, `table_content`, `created`) VALUES
(1, 1, 3, 'user', '{\"id\":\"3\",\"username\":\"root\",\"password\":\"$2y$10$oCNvK4jcYmDPvF35ZtYaTOTGstJoRVJFnYMvkZaobiGmudP0IxQMm\",\"email\":\"iwansafr@gmail.com\",\"image\":\"\",\"user_role_id\":\"2\",\"active\":\"1\",\"created\":\"2020-07-26 13:20:13\",\"updated\":\"2020-07-26 13:20:13\"}', '2020-07-26 13:58:46'),
(2, 1, 2, 'user_sekolah', '{\"id\":\"2\",\"sekolah_id\":\"0\",\"user_id\":\"3\",\"user_role_id\":\"2\",\"username\":\"root\",\"email\":\"iwansafr@gmail.com\",\"sandi\":\"1\",\"nama\":\"root\",\"phone\":\"908908\",\"active\":\"1\",\"created\":\"2020-07-26 13:20:13\",\"updated\":\"2020-07-26 13:20:13\"}', '2020-07-26 13:58:52'),
(3, 1, 4, 'user', '{\"id\":\"4\",\"username\":\"iwan\",\"password\":\"$2y$10$WYkAizO8lznat9x2l.b2tuEKBSj.VTzVMXYDfLxxjcz6JdOuoUSgG\",\"email\":\"iwansafr@gmail.com\",\"image\":\"\",\"user_role_id\":\"0\",\"active\":\"1\",\"created\":\"2020-07-26 13:52:31\",\"updated\":\"2020-07-26 13:52:31\"}', '2020-07-26 14:07:49'),
(4, 1, 3, 'user_sekolah', '{\"id\":\"3\",\"sekolah_id\":\"0\",\"user_id\":\"4\",\"user_role_id\":\"0\",\"username\":\"iwan\",\"email\":\"iwansafr@gmail.com\",\"sandi\":\"1\",\"nama\":\"iwan\",\"phone\":\"080989\",\"active\":\"1\",\"created\":\"2020-07-26 13:52:31\",\"updated\":\"2020-07-26 13:52:31\"}', '2020-07-26 14:07:49'),
(5, 1, 5, 'user_instansi', '{\"id\":\"5\",\"instansi_id\":\"1\",\"user_id\":\"0\",\"user_role_id\":\"4\",\"username\":\"man1pati\",\"email\":\"man1pati@gmail.com\",\"sandi\":\"123456\",\"nama\":\"MAN 1 PATI\",\"phone\":\"081000000000\",\"active\":\"1\",\"created\":\"2020-08-01 01:40:45\",\"updated\":\"2020-08-01 01:40:45\"}', '2020-08-01 01:54:37'),
(6, 1, 5, 'user', '{\"id\":\"5\",\"username\":\"man1pati\",\"password\":\"$2y$10$RHMASrOExH9yEDKJT4gN1e6LR.p8P4kGMWh.WQ38XPuHGB6dQ1vQe\",\"email\":\"man1pati@gmail.com\",\"image\":\"\",\"user_role_id\":\"4\",\"active\":\"1\",\"created\":\"2020-08-01 01:40:45\",\"updated\":\"2020-08-01 01:40:45\"}', '2020-08-01 01:54:44');

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
(1, 'root', '$2y$10$iN3I64zsXAyy9MCEVAPe3uqv1ygazlJgKFYEc2aNCiu2VDe/ZTKjO', 'root@esoftgreat.com', '', 1, 1, '2018-11-03 07:36:32'),
(6, 'man1pati', '$2y$10$GL9lp1f0nNAIZ8kxCbITCO75tgEx4qR5OTOiYUqct1YWB9iG5fDKC', 'man1pati@gmail.com', '', 4, 1, '2020-08-01 01:55:08');

DROP TABLE IF EXISTS `user_instansi`;
CREATE TABLE `user_instansi` (
  `id` int NOT NULL,
  `instansi_id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_instansi` (`id`, `instansi_id`, `user_id`, `user_role_id`, `username`, `email`, `sandi`, `nama`, `phone`, `active`) VALUES
(4, 0, 1, 1, 'root', 'iwansafr@gmail.com', ',./\';[]-=90893eih897fjh9ru04jr934', 'root', '085290335332', 1),
(6, 1, 6, 4, 'man1pati', 'man1pati@gmail.com', '123456', 'MAN 1 PATI', '081000000000', 1);

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `ip` varchar(15) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=failed, 1=success',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_login` (`id`, `user_id`, `ip`, `browser`, `status`, `created`) VALUES
(1, 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', 1, '2020-07-23 07:11:28'),
(2, 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', 1, '2020-07-23 10:42:56'),
(3, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-26 13:52:14'),
(4, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-26 23:19:25'),
(5, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-26 23:39:11'),
(6, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-28 18:40:51'),
(7, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-29 05:57:14'),
(8, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-29 14:53:07'),
(9, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, '2020-07-29 14:58:48'),
(10, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-07-31 01:02:05'),
(11, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-07-31 01:30:35'),
(12, 0, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 0, '2020-07-31 01:54:05'),
(13, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-07-31 01:54:06'),
(14, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-07-31 18:24:25'),
(15, 0, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 0, '2020-07-31 23:31:37'),
(16, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-07-31 23:31:39'),
(17, 5, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-01 01:41:31'),
(18, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-01 01:44:57'),
(19, 6, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-01 01:55:47'),
(20, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 1, '2020-08-01 02:23:36');

DROP TABLE IF EXISTS `user_login_failed`;
CREATE TABLE `user_login_failed` (
  `id` int NOT NULL,
  `user_login_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_login_failed` (`id`, `user_login_id`, `username`, `password`) VALUES
(1, 12, 'root', 'Dks_080308'),
(2, 15, 'root', 'Dks_080308');

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int NOT NULL,
  `level` tinyint NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_role` (`id`, `level`, `title`, `description`, `created`) VALUES
(1, 1, 'root', 'super user', '2018-11-02 22:57:22'),
(2, 2, 'admin', 'the administrator', '2018-11-02 22:57:22'),
(3, 5, 'Member', 'User member yang hanya berlangganan saja', '2018-11-04 12:59:26'),
(4, 5, 'Sekolah', 'Akun Sekolahan', '2020-07-26 07:12:41');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(60, '::1', 'http://localhost/absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '2020-07-23 11:26:43'),
(61, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 14:53:16'),
(62, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 14:55:19'),
(63, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 14:55:19'),
(64, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 14:56:13'),
(65, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 14:56:13'),
(66, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 14:56:29'),
(67, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 14:56:29'),
(68, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 14:56:44'),
(69, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 15:33:00'),
(70, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-29 15:33:00'),
(71, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:05:52'),
(72, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:05:53'),
(73, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:07:04'),
(74, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:07:04'),
(75, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:07:47'),
(76, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:10:06'),
(77, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:10:06'),
(78, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:10:06'),
(79, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:10:07'),
(80, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:10:29'),
(81, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:10:30'),
(82, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:10:43'),
(83, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:10:43'),
(84, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:11:03'),
(85, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:11:03'),
(86, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:12:04'),
(87, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:12:04'),
(88, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:12:06'),
(89, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:12:06'),
(90, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:12:06'),
(91, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:12:07'),
(92, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:14:50'),
(93, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:14:50'),
(94, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:15:46'),
(95, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:15:46'),
(96, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:15:47'),
(97, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:15:47'),
(98, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:15:47'),
(99, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:15:48'),
(100, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:15:59'),
(101, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:15:59'),
(102, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:16:56'),
(103, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:16:56'),
(104, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:17:31'),
(105, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:18:00'),
(106, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:18:23'),
(107, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:18:24'),
(108, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:18:48'),
(109, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:18:49'),
(110, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:22:51'),
(111, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:22:51'),
(112, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:23:08'),
(113, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:23:38'),
(114, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:24:08'),
(115, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1', '2020-07-31 01:24:48'),
(116, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:25:39'),
(117, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:26:05'),
(118, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:26:44'),
(119, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:27:04'),
(120, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:27:10'),
(121, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:27:12'),
(122, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:27:30'),
(123, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:28:15'),
(124, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:29:00'),
(125, '::1', 'http://localhost/sistem_absensi/absensi/1', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:29:37'),
(126, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:30:10'),
(127, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:30:16'),
(128, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:32:29'),
(129, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:32:44'),
(130, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:32:51'),
(131, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:33:25'),
(132, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:33:39'),
(133, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:33:56'),
(134, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:34:06'),
(135, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:34:17'),
(136, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:34:28'),
(137, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:34:51'),
(138, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:35:17'),
(139, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:35:22'),
(140, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:35:42'),
(141, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:35:54'),
(142, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:36:15'),
(143, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:36:35'),
(144, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:36:58'),
(145, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:37:41'),
(146, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:38:02'),
(147, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:39:31'),
(148, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:39:38'),
(149, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:39:51'),
(150, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:40:17'),
(151, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:41:09'),
(152, '::1', 'http://localhost/sistem_absensi/images/none.png', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:41:10'),
(153, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:43:11'),
(154, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:43:37'),
(155, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:44:04'),
(156, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:44:25'),
(157, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:44:31'),
(158, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:44:46'),
(159, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:44:54'),
(160, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:45:00'),
(161, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:45:02'),
(162, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:45:06'),
(163, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:45:11'),
(164, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:45:20'),
(165, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:45:42'),
(166, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:45:47'),
(167, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:46:46'),
(168, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:47:12'),
(169, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:47:19'),
(170, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:47:39'),
(171, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:48:00'),
(172, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:48:08'),
(173, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:48:27'),
(174, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:48:50'),
(175, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:49:03'),
(176, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:49:07'),
(177, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:49:43'),
(178, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:50:02'),
(179, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:50:19'),
(180, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:50:38'),
(181, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:51:26'),
(182, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:52:18'),
(183, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:52:27'),
(184, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:52:35'),
(185, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:52:42'),
(186, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:53:01'),
(187, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:53:16'),
(188, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:54:14'),
(189, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 01:55:54'),
(190, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:56:03'),
(191, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:56:33'),
(192, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:56:33'),
(193, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:56:42'),
(194, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:57:07'),
(195, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:57:15'),
(196, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:57:26'),
(197, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:57:41'),
(198, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:58:15'),
(199, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:58:16'),
(200, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:58:16'),
(201, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:58:23'),
(202, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:14'),
(203, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:16'),
(204, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:16'),
(205, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:17'),
(206, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:24'),
(207, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:24'),
(208, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:32'),
(209, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:41'),
(210, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:56'),
(211, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:57'),
(212, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:57'),
(213, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 01:59:58'),
(214, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:04'),
(215, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:05'),
(216, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:17'),
(217, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:25'),
(218, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:26'),
(219, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:26'),
(220, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:27'),
(221, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:33'),
(222, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:38'),
(223, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:43'),
(224, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:00:56'),
(225, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:01:10');
INSERT INTO `visitor` (`id`, `ip`, `visited`, `city`, `region`, `country`, `browser`, `created`) VALUES
(226, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:01:39'),
(227, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:01:39'),
(228, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:01:48'),
(229, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:02:00'),
(230, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:04:52'),
(231, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:05:31'),
(232, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:05:38'),
(233, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:06:51'),
(234, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:07:01'),
(235, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:07:35'),
(236, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:07:48'),
(237, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:08:05'),
(238, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:09:07'),
(239, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:09:14'),
(240, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:09:17'),
(241, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:09:18'),
(242, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:09:18'),
(243, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:09:24'),
(244, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:10:20'),
(245, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:10:21'),
(246, '::1', 'http://localhost/sistem_absensi/assets/modules/absensi/script.js', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:10:21'),
(247, '::1', 'http://localhost/sistem_absensi/assets/modules/absensi/script.js', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:10:37'),
(248, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:10:59'),
(249, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:10:59'),
(250, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:11:13'),
(251, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:11:14'),
(252, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:12:50'),
(253, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:12:51'),
(254, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:13:38'),
(255, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:13:38'),
(256, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:13:38'),
(257, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:17:20'),
(258, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:17:32'),
(259, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:17:33'),
(260, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:17:33'),
(261, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:18:00'),
(262, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:18:00'),
(263, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:18:01'),
(264, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:18:01'),
(265, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:18:27'),
(266, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:18:27'),
(267, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:19:04'),
(268, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:19:16'),
(269, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:19:16'),
(270, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:19:16'),
(271, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:19:30'),
(272, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:20:31'),
(273, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:21:11'),
(274, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:21:33'),
(275, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:21:38'),
(276, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:21:57'),
(277, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:22:38'),
(278, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:25:02'),
(279, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:25:42'),
(280, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:25:54'),
(281, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:26:03'),
(282, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:26:25'),
(283, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:26:36'),
(284, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:26:52'),
(285, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:27:08'),
(286, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:27:14'),
(287, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:28:27'),
(288, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:28:52'),
(289, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:30:47'),
(290, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 02:34:00'),
(291, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:36:22'),
(292, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:36:22'),
(293, '::1', 'http://localhost/sistem_absensi/plugins/jvectormap/jquery-jvectormap-world-mill-en.js', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:36:22'),
(294, '::1', 'http://localhost/sistem_absensi/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:36:23'),
(295, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:36:58'),
(296, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:36:59'),
(297, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:38:04'),
(298, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:38:04'),
(299, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:39:43'),
(300, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:42:05'),
(301, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:42:57'),
(302, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:45:10'),
(303, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:45:10'),
(304, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:45:32'),
(305, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:45:45'),
(306, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:47:04'),
(307, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:47:11'),
(308, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:47:31'),
(309, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:47:47'),
(310, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:48:02'),
(311, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:48:08'),
(312, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:48:13'),
(313, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:49:28'),
(314, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:49:29'),
(315, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:50:45'),
(316, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:51:02'),
(317, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:56:15'),
(318, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:56:28'),
(319, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:56:28'),
(320, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:56:28'),
(321, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:56:28'),
(322, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:57:06'),
(323, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:57:06'),
(324, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:57:06'),
(325, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 02:58:39'),
(326, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:01:40'),
(327, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:02:04'),
(328, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:02:52'),
(329, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:02:52'),
(330, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:05:36'),
(331, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:05:50'),
(332, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:10:37'),
(333, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:11:05'),
(334, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:11:05'),
(335, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:11:06'),
(336, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:12:41'),
(337, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:12:42'),
(338, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:12:42'),
(339, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:12:58'),
(340, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:12:58'),
(341, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:13:49'),
(342, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:14:24'),
(343, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:14:33'),
(344, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:14:42'),
(345, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:19:25'),
(346, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:20:02'),
(347, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:21:41'),
(348, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:22:19'),
(349, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:22:19'),
(350, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:23:05'),
(351, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:24:17'),
(352, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:24:17'),
(353, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:24:35'),
(354, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:24:49'),
(355, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:24:50'),
(356, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:25:23'),
(357, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:25:36'),
(358, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:26:32'),
(359, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:27:02'),
(360, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:27:34'),
(361, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:27:45'),
(362, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:28:00'),
(363, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:28:11'),
(364, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:28:20'),
(365, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:28:52'),
(366, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:29:09'),
(367, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:29:20'),
(368, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:33:54'),
(369, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:34:24'),
(370, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:37:14'),
(371, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 03:47:47'),
(372, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:47:58'),
(373, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:48:21'),
(374, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 03:48:35'),
(375, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:21:57'),
(376, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:22:01'),
(377, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:22:01'),
(378, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:24:18'),
(379, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:25:40'),
(380, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 04:27:04'),
(381, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:27:44'),
(382, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:28:23'),
(383, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:28:49'),
(384, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:29:06'),
(385, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:29:22'),
(386, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:29:36'),
(387, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:29:56'),
(388, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 04:30:32'),
(389, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 04:31:48'),
(390, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:31:52'),
(391, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:31:57'),
(392, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:31:59'),
(393, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:31:59'),
(394, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:34:15'),
(395, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:34:35'),
(396, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:34:41'),
(397, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:34:49'),
(398, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:35:01'),
(399, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:35:06'),
(400, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:35:15'),
(401, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:35:20'),
(402, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:35:30'),
(403, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:36:24'),
(404, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:43:20'),
(405, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 04:43:35'),
(406, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 04:43:51'),
(407, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 04:43:51'),
(408, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 04:43:52'),
(409, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 04:43:52'),
(410, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:44:04'),
(411, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 04:44:06'),
(412, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:10:51'),
(413, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:11:18'),
(414, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:12:04'),
(415, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:12:24'),
(416, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:12:42'),
(417, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:12:54'),
(418, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:13:14'),
(419, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:13:32'),
(420, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:14:24'),
(421, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:14:34'),
(422, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:14:45'),
(423, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:15:06'),
(424, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:17:19'),
(425, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:18:13'),
(426, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:18:37'),
(427, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:18:57'),
(428, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:01'),
(429, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:01'),
(430, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:01'),
(431, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:15'),
(432, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:15'),
(433, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:15'),
(434, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:15'),
(435, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:19'),
(436, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:22'),
(437, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:19:43'),
(438, '::1', 'http://localhost/sistem_absensi/home', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:23:09'),
(439, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/dist/img/user2-160x160.jpg', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:23:09'),
(440, '::1', 'http://localhost/sistem_absensi/home/absensi/location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:23:13'),
(441, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:23:19'),
(442, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:23:32'),
(443, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:23:34'),
(444, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:23:44'),
(445, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:23:47'),
(446, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:23:47'),
(447, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:24:16'),
(448, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:24:16'),
(449, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:24:16'),
(450, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:25:21'),
(451, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:26:30'),
(452, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:26:30'),
(453, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:26:51'),
(454, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:26:52'),
(455, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:04'),
(456, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:18'),
(457, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:18'),
(458, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:18'),
(459, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:19'),
(460, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:34'),
(461, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:34'),
(462, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:39'),
(463, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:39'),
(464, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:43'),
(465, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:43'),
(466, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:44'),
(467, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:27:44'),
(468, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 05:28:18');
INSERT INTO `visitor` (`id`, `ip`, `visited`, `city`, `region`, `country`, `browser`, `created`) VALUES
(469, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 05:28:18'),
(470, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 05:28:50'),
(471, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 05:28:50'),
(472, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 05:28:50'),
(473, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 05:29:04'),
(474, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 05:29:04'),
(475, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:29:10'),
(476, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:29:10'),
(477, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:29:10'),
(478, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:29:13'),
(479, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:29:14'),
(480, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:29:14'),
(481, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:29:14'),
(482, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:29:14'),
(483, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 05:29:33'),
(484, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 05:29:34'),
(485, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:30:04'),
(486, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:30:05'),
(487, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:42:38'),
(488, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:42:44'),
(489, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:42:45'),
(490, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:54:12'),
(491, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 05:54:13'),
(492, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:08:12'),
(493, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:08:13'),
(494, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:11:24'),
(495, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:11:25'),
(496, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:13:14'),
(497, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:13:15'),
(498, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:14:46'),
(499, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:14:46'),
(500, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:15:29'),
(501, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:15:29'),
(502, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:16:09'),
(503, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:16:10'),
(504, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:16:54'),
(505, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:16:54'),
(506, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:17:06'),
(507, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:17:07'),
(508, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:17:46'),
(509, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:17:46'),
(510, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:18:11'),
(511, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:18:12'),
(512, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:18:12'),
(513, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:18:12'),
(514, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:18:45'),
(515, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:18:45'),
(516, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:18:46'),
(517, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:19:46'),
(518, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:19:47'),
(519, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:20:26'),
(520, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:20:26'),
(521, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:20:47'),
(522, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:20:48'),
(523, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:21:31'),
(524, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:21:31'),
(525, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:22:12'),
(526, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:22:13'),
(527, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:22:26'),
(528, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:22:26'),
(529, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:22:31'),
(530, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:22:31'),
(531, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:22:31'),
(532, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:22:32'),
(533, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:29:10'),
(534, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:29:10'),
(535, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:29:10'),
(536, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:29:45'),
(537, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:29:46'),
(538, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:30:01'),
(539, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:30:02'),
(540, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:30:19'),
(541, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:30:20'),
(542, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:30:31'),
(543, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:30:32'),
(544, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:30:41'),
(545, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:30:42'),
(546, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:17'),
(547, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:17'),
(548, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:20'),
(549, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:20'),
(550, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:20'),
(551, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:21'),
(552, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:25'),
(553, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:25'),
(554, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:28'),
(555, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:28'),
(556, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:28'),
(557, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:28'),
(558, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:29'),
(559, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:29'),
(560, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:44'),
(561, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:44'),
(562, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:45'),
(563, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:51'),
(564, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:32:52'),
(565, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:33:02'),
(566, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:33:02'),
(567, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:33:18'),
(568, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:33:18'),
(569, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:33:28'),
(570, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:33:28'),
(571, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:43:25'),
(572, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:43:25'),
(573, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:43:37'),
(574, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:43:38'),
(575, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:44:28'),
(576, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:44:33'),
(577, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:44:33'),
(578, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:01'),
(579, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:02'),
(580, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:07'),
(581, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:07'),
(582, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:15'),
(583, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:15'),
(584, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:27'),
(585, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:27'),
(586, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:32'),
(587, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:33'),
(588, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:37'),
(589, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:37'),
(590, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:42'),
(591, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 06:45:43'),
(592, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:59:53'),
(593, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 06:59:54'),
(594, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 07:00:03'),
(595, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 07:00:03'),
(596, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 07:00:47'),
(597, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 07:00:47'),
(598, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:00:59'),
(599, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:01:00'),
(600, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:01:10'),
(601, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:01:11'),
(602, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:02:27'),
(603, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:02:28'),
(604, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:02:34'),
(605, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:02:34'),
(606, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:07:27'),
(607, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:07:28'),
(608, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:07:58'),
(609, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:07:59'),
(610, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:08:16'),
(611, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:08:17'),
(612, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:08:37'),
(613, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:08:37'),
(614, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:08:38'),
(615, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:09:04'),
(616, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:09:04'),
(617, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 07:11:01'),
(618, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 07:11:01'),
(619, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:12:23'),
(620, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:12:23'),
(621, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:13:02'),
(622, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:13:03'),
(623, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:13:11'),
(624, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:13:11'),
(625, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:13:37'),
(626, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:13:38'),
(627, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:14:02'),
(628, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:14:03'),
(629, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:14:23'),
(630, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:14:23'),
(631, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:14:47'),
(632, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:14:47'),
(633, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:16:32'),
(634, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:16:32'),
(635, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:16:53'),
(636, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:16:53'),
(637, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:15'),
(638, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:15'),
(639, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:36'),
(640, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:37'),
(641, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:48'),
(642, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:49'),
(643, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:55'),
(644, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:55'),
(645, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:55'),
(646, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 07:17:55'),
(647, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 07:21:58'),
(648, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 07:22:02'),
(649, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 07:22:02'),
(650, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:33:53'),
(651, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:34:05'),
(652, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:34:08'),
(653, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:34:10'),
(654, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:34:10'),
(655, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:36:24'),
(656, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 18:36:28'),
(657, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:38:06'),
(658, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:38:33'),
(659, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:39:43'),
(660, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:40:10'),
(661, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:40:43'),
(662, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:41:20'),
(663, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:41:26'),
(664, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:41:27'),
(665, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:41:48'),
(666, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:42:17'),
(667, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:42:32'),
(668, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 18:43:03'),
(669, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 18:43:24'),
(670, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1', '2020-07-31 18:44:14'),
(671, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 19:03:52'),
(672, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 19:03:53'),
(673, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 19:03:55'),
(674, '::1', 'http://localhost/sistem_absensi/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 19:03:57'),
(675, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 19:03:57'),
(676, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 19:07:12'),
(677, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:20:47'),
(678, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:26:13'),
(679, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:27:05'),
(680, '::1', 'http://localhost/sistem_absensi/home/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:29:20'),
(681, '::1', 'http://localhost/sistem_absensi/home/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:29:25'),
(682, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:29:25'),
(683, '::1', 'http://localhost/sistem_absensi/home/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:29:27'),
(684, '::1', 'http://localhost/sistem_absensi/home/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:29:27'),
(685, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:29:28'),
(686, '::1', 'http://localhost/sistem_absensi/home/absensi', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:29:33'),
(687, '::1', 'http://localhost/sistem_absensi/home/absensi/my_location', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 20:29:33'),
(688, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 00:17:01'),
(689, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 01:57:07'),
(690, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 01:57:16'),
(691, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 01:57:59'),
(692, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 01:58:14'),
(693, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:10:04'),
(694, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:12:01'),
(695, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:12:19'),
(696, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:13:34');
INSERT INTO `visitor` (`id`, `ip`, `visited`, `city`, `region`, `country`, `browser`, `created`) VALUES
(697, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:13:53'),
(698, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:13:59'),
(699, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:14:26'),
(700, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:14:29'),
(701, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:14:36'),
(702, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:14:41'),
(703, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:15:16'),
(704, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:15:17'),
(705, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:15:48'),
(706, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:15:49'),
(707, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:16:24'),
(708, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:16:30'),
(709, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:21:45'),
(710, '::1', 'http://localhost/sistem_absensi/templates/AdminLTE/assets/summernote/summernote.js.map', '', '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 02:23:36');


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

ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `karyawan_group`
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

ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `trash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_instansi`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_login_failed`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `admin_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

ALTER TABLE `bank_account`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

ALTER TABLE `content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `content_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `content_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `instansi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `karyawan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `karyawan_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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

ALTER TABLE `subscriber`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `testimonial`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `trash`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `user_instansi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `user_login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `user_login_failed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `user_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `visitor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=711;


ALTER TABLE `trash`
  ADD CONSTRAINT `trash_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
