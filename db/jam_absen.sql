SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS `jam_absen`;
CREATE TABLE `jam_absen` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `jam_absen` (`id`, `name`, `value`) VALUES
(1, 'config_jam', '{\"akhir_pulang_1\": \"\", \"akhir_pulang_2\": \"15:14\", \"akhir_pulang_3\": \"\", \"akhir_pulang_4\": \"19:57\", \"akhir_pulang_5\": \"17:34\", \"akhir_pulang_6\": \"\", \"akhir_pulang_7\": \"\", \"mulai_pulang_1\": \"\", \"mulai_pulang_2\": \"15:14\", \"mulai_pulang_3\": \"\", \"mulai_pulang_4\": \"16:54\", \"mulai_pulang_5\": \"16:33\", \"mulai_pulang_6\": \"\", \"mulai_pulang_7\": \"\", \"akhir_berangkat_1\": \"\", \"akhir_berangkat_2\": \"10:15\", \"akhir_berangkat_3\": \"\", \"akhir_berangkat_4\": \"14:52\", \"akhir_berangkat_5\": \"15:30\", \"akhir_berangkat_6\": \"\", \"akhir_berangkat_7\": \"\", \"mulai_berangkat_1\": \"\", \"mulai_berangkat_2\": \"10:14\", \"mulai_berangkat_3\": \"\", \"mulai_berangkat_4\": \"13:51\", \"mulai_berangkat_5\": \"13:30\", \"mulai_berangkat_6\": \"\", \"mulai_berangkat_7\": \"\"}');


ALTER TABLE `jam_absen`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `jam_absen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
