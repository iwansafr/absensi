SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS `absensi_libur`;
CREATE TABLE `absensi_libur` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=libur nasional,2=libur mandiri',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `absensi_libur` (`id`, `title`, `status`, `date`) VALUES
(1, 'KENAIKAN ISA ALMASIH', 1, '2020-05-21'),
(14, 'LIBUR HARI MINGGU', 1, '2020-05-24'),
(15, 'HARI RAYA IDUL FITRI', 1, '2020-05-25'),
(16, 'LIBUR HARI MINGGU', 1, '2020-05-31'),
(17, 'HARI LAHIR PANCASILA', 1, '2020-06-01'),
(18, 'LIBUR HARI MINGGU', 1, '2020-06-07'),
(19, 'LIBUR HARI MINGGU', 1, '2020-06-14'),
(20, 'LIBUR HARI MINGGU', 1, '2020-06-21'),
(21, 'LIBUR HARI MINGGU', 1, '2020-06-28'),
(22, 'LIBUR HARI MINGGU', 1, '2020-07-05'),
(23, 'LIBUR HARI MINGGU', 1, '2020-07-12'),
(24, 'LIBUR HARI MINGGU', 1, '2020-07-19'),
(25, 'LIBUR HARI MINGGU', 1, '2020-07-26'),
(27, 'HARI RAYA IDUL ADHA 1441 HIJRIYAH', 1, '2020-07-31'),
(28, 'LIBUR HARI MINGGU', 1, '2020-08-02'),
(29, 'LIBUR HARI MINGGU', 1, '2020-08-09'),
(30, 'LIBUR HARI MINGGU', 1, '2020-08-16'),
(31, 'HARI PROKLAMASI KEMERDEKAAN REPUBLIK INDONESIA', 1, '2020-08-17'),
(32, 'TAHUN BARU HIJRIYAH 1442 H', 1, '2020-08-20'),
(33, 'LIBUR HARI MINGGU', 1, '2020-08-23'),
(34, 'LIBUR HARI MINGGU', 1, '2020-08-30'),
(35, 'LIBUR HARI MINGGU', 1, '2020-09-06'),
(36, 'LIBUR HARI MINGGU', 1, '2020-09-13'),
(37, 'LIBUR HARI MINGGU', 1, '2020-09-20'),
(38, 'LIBUR HARI MINGGU', 1, '2020-09-27'),
(39, 'LIBUR HARI MINGGU', 1, '2020-10-04'),
(40, 'LIBUR HARI MINGGU', 1, '2020-10-11'),
(41, 'LIBUR HARI MINGGU', 1, '2020-10-18'),
(42, 'LIBUR HARI MINGGU', 1, '2020-10-25'),
(43, 'MAULID NABI MUHAMMAD SAW', 1, '2020-10-29'),
(44, 'LIBUR HARI MINGGU', 1, '2020-11-01'),
(45, 'LIBUR HARI MINGGU', 1, '2020-11-08'),
(46, 'LIBUR HARI MINGGU', 1, '2020-11-15'),
(47, 'LIBUR HARI MINGGU', 1, '2020-11-22'),
(48, 'LIBUR HARI MINGGU', 1, '2020-11-29'),
(49, 'LIBUR HARI MINGGU', 1, '2020-12-06'),
(50, 'LIBUR HARI MINGGU', 1, '2020-12-13'),
(51, 'LIBUR HARI MINGGU', 1, '2020-12-20'),
(52, 'HARI RAYA NATAL', 1, '2020-12-25'),
(53, 'LIBUR HARI MINGGU', 1, '2020-12-27');


ALTER TABLE `absensi_libur`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `absensi_libur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;