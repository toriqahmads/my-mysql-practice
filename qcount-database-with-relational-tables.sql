-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2018 at 05:27 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qcount`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `input_data_caleg` (IN `fname` VARCHAR(15), IN `lname` VARCHAR(15), IN `partai` INT(2), IN `dapil` INT(2), IN `prov` INT(2), IN `kab` INT(2), IN `kel` INT(2))  BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING, NOT FOUND
ROLLBACK;

START TRANSACTION;

INSERT INTO caleg (nama_depan, nama_belakang, id_partai, id_dapil, id_prov, id_kab, id_kel) VALUES (fname, lname, partai, dapil, prov, kab, kel);

COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `input_data_saksi` (IN `fname` VARCHAR(15), IN `lname` VARCHAR(15), IN `sex` CHAR(1), IN `alamat` VARCHAR(30), IN `kel` INT(4), IN `kec` INT(2), IN `kab` INT(2), IN `prov` INT(2), IN `dapil` INT(2), IN `nomor_nik` VARCHAR(16), IN `photo` VARCHAR(30), IN `telpon` VARCHAR(13))  BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING, NOT FOUND
ROLLBACK;

START TRANSACTION;

INSERT INTO saksi (nama_depan, nama_belakang, gender, alamat, id_kel, id_kec, id_kab, id_prov, id_dapil, nik, foto, telp)
VALUES (fname, lname, sex, alamat, kel, kec, kab, prov, dapil, nomor_nik, photo, telpon);

COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `input_proof` (IN `photo` TEXT, IN `lokasi` VARCHAR(100), IN `dapil` INT(2), IN `kel` INT(2), IN `saksi` INT(3))  BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING, NOT FOUND
ROLLBACK;

START TRANSACTION;

INSERT INTO proof (foto, location, id_dapil, id_kel, id_saksi, tanggal) VALUES (photo, lokasi, dapil, kel, saksi, NOW());

COMMIT;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `input_suara` (IN `j_suara` INT(7), IN `caleg` INT(2), IN `saksi` INT(3))  BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING, NOT FOUND
ROLLBACK;

START TRANSACTION;

INSERT INTO suara (suara, id_caleg, id_saksi, tanggal) VALUES (j_suara, caleg, saksi, NOW());

COMMIT;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `caleg`
--

CREATE TABLE `caleg` (
  `id` int(2) NOT NULL,
  `nama_depan` varchar(15) DEFAULT NULL,
  `nama_belakang` varchar(15) DEFAULT NULL,
  `id_partai` int(2) DEFAULT NULL,
  `id_dapil` int(2) DEFAULT NULL,
  `id_prov` int(2) DEFAULT NULL,
  `id_kab` int(2) DEFAULT NULL,
  `id_kel` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caleg`
--

INSERT INTO `caleg` (`id`, `nama_depan`, `nama_belakang`, `id_partai`, `id_dapil`, `id_prov`, `id_kab`, `id_kel`) VALUES
(1, 'Muhammad', 'Husni', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dapil`
--

CREATE TABLE `dapil` (
  `id` int(2) NOT NULL,
  `kursi` int(2) DEFAULT NULL,
  `DPT` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dapil`
--

INSERT INTO `dapil` (`id`, `kursi`, `DPT`) VALUES
(1, 12, 278333),
(2, 8, 183939),
(3, 8, 176297),
(4, 11, 236374),
(5, 11, 241400);

-- --------------------------------------------------------

--
-- Table structure for table `kab`
--

CREATE TABLE `kab` (
  `id` int(2) NOT NULL,
  `kab` varchar(25) DEFAULT NULL,
  `id_prov` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kab`
--

INSERT INTO `kab` (`id`, `kab`, `id_prov`) VALUES
(1, 'Demak', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kec`
--

CREATE TABLE `kec` (
  `id` int(2) NOT NULL,
  `kec` varchar(15) DEFAULT NULL,
  `id_kab` int(2) DEFAULT NULL,
  `id_prov` int(2) DEFAULT NULL,
  `id_dapil` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kec`
--

INSERT INTO `kec` (`id`, `kec`, `id_kab`, `id_prov`, `id_dapil`) VALUES
(1, 'Demak', 1, 1, 1),
(2, 'Dempet', 1, 1, 1),
(3, 'Kebonagung', 1, 1, 1),
(4, 'Wonosalam', 1, 1, 1),
(5, 'Bonang', 1, 1, 2),
(6, 'Wedung', 1, 1, 2),
(7, 'Gajah', 1, 1, 3),
(8, 'Karanganyar', 1, 1, 3),
(9, 'Mijen', 1, 1, 3),
(10, 'Karangawen', 1, 1, 4),
(11, 'Mranggen', 1, 1, 4),
(12, 'Guntur', 1, 1, 5),
(13, 'Karangtengah', 1, 1, 5),
(14, 'Sayung', 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kel`
--

CREATE TABLE `kel` (
  `id` int(3) NOT NULL,
  `kel` varchar(20) DEFAULT NULL,
  `pos` int(6) DEFAULT NULL,
  `id_kec` int(2) DEFAULT NULL,
  `id_kab` int(2) DEFAULT NULL,
  `id_prov` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kel`
--

INSERT INTO `kel` (`id`, `kel`, `pos`, `id_kec`, `id_kab`, `id_prov`) VALUES
(1, 'Demak', 59511, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `partai`
--

CREATE TABLE `partai` (
  `id` int(2) NOT NULL,
  `partai` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partai`
--

INSERT INTO `partai` (`id`, `partai`) VALUES
(1, 'Demokrat');

-- --------------------------------------------------------

--
-- Table structure for table `proof`
--

CREATE TABLE `proof` (
  `id` int(2) NOT NULL,
  `foto` text,
  `location` varchar(100) DEFAULT NULL,
  `id_dapil` int(2) DEFAULT NULL,
  `id_kel` int(2) DEFAULT NULL,
  `id_saksi` int(3) DEFAULT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proof`
--

INSERT INTO `proof` (`id`, `foto`, `location`, `id_dapil`, `id_kel`, `id_saksi`, `tanggal`) VALUES
(2, 'sakdhkagsdbckdjf', 'images.jpg', 1, 1, 1, '2018-06-09 17:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `prov`
--

CREATE TABLE `prov` (
  `id` int(2) NOT NULL,
  `prov` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prov`
--

INSERT INTO `prov` (`id`, `prov`) VALUES
(1, 'Jawa Tengah');

-- --------------------------------------------------------

--
-- Table structure for table `saksi`
--

CREATE TABLE `saksi` (
  `id` int(3) NOT NULL,
  `nama_depan` varchar(15) DEFAULT NULL,
  `nama_belakang` varchar(15) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `id_kel` int(4) DEFAULT NULL,
  `id_kec` int(2) DEFAULT NULL,
  `id_kab` int(2) DEFAULT NULL,
  `id_prov` int(2) DEFAULT NULL,
  `id_dapil` int(2) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `foto` varchar(30) DEFAULT NULL,
  `telp` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saksi`
--

INSERT INTO `saksi` (`id`, `nama_depan`, `nama_belakang`, `gender`, `alamat`, `id_kel`, `id_kec`, `id_kab`, `id_prov`, `id_dapil`, `nik`, `foto`, `telp`) VALUES
(1, 'Muhammad', 'Ainun', 'l', 'Jl. Kyai Singkil no.45', 1, 1, 1, 1, 1, '3340506880200001', 'foto1.jpg', '089668629038'),
(2, 'Imam', 'Khilmi', 'l', 'Jl. Kyai Jebat no.11', 1, 1, 1, 1, 1, '3320506880230002', 'foto2.jpg', '081225678082');

-- --------------------------------------------------------

--
-- Table structure for table `suara`
--

CREATE TABLE `suara` (
  `id` int(2) NOT NULL,
  `suara` int(7) DEFAULT NULL,
  `id_caleg` int(2) DEFAULT NULL,
  `id_saksi` int(3) DEFAULT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suara`
--

INSERT INTO `suara` (`id`, `suara`, `id_caleg`, `id_saksi`, `tanggal`) VALUES
(1, 1200, 1, 1, '2018-06-09 16:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(2) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `u_level` int(1) DEFAULT NULL,
  `id_saksi` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caleg`
--
ALTER TABLE `caleg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caleg_ibfk_1` (`id_partai`),
  ADD KEY `caleg_ibfk_2` (`id_dapil`),
  ADD KEY `caleg_ibfk_3` (`id_prov`),
  ADD KEY `caleg_ibfk_4` (`id_kab`),
  ADD KEY `caleg_ibfk_5` (`id_kel`);

--
-- Indexes for table `dapil`
--
ALTER TABLE `dapil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kab`
--
ALTER TABLE `kab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kab_ibfk_1` (`id_prov`);

--
-- Indexes for table `kec`
--
ALTER TABLE `kec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kec_ibfk_1` (`id_kab`),
  ADD KEY `kec_ibfk_2` (`id_prov`),
  ADD KEY `kec_ibfk_3` (`id_dapil`);

--
-- Indexes for table `kel`
--
ALTER TABLE `kel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kel_ibfk_1` (`id_kec`),
  ADD KEY `kel_ibfk_2` (`id_kab`),
  ADD KEY `kel_ibfk_3` (`id_prov`);

--
-- Indexes for table `partai`
--
ALTER TABLE `partai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proof`
--
ALTER TABLE `proof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proof_ibfk_1` (`id_dapil`),
  ADD KEY `proof_ibfk_2` (`id_kel`),
  ADD KEY `proof_ibfk_3` (`id_saksi`);

--
-- Indexes for table `prov`
--
ALTER TABLE `prov`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `saksi`
--
ALTER TABLE `saksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saksi_rel_dapil` (`id_dapil`),
  ADD KEY `saksi_rel_prov` (`id_prov`),
  ADD KEY `saksi_rel_kab` (`id_kab`),
  ADD KEY `saksi_rel_kec` (`id_kec`),
  ADD KEY `saksi_rel_kel` (`id_kel`);

--
-- Indexes for table `suara`
--
ALTER TABLE `suara`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suara_ibfk_1` (`id_caleg`),
  ADD KEY `suara_ibfk_3` (`id_saksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_ibfk_1` (`id_saksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caleg`
--
ALTER TABLE `caleg`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dapil`
--
ALTER TABLE `dapil`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kab`
--
ALTER TABLE `kab`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kec`
--
ALTER TABLE `kec`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `kel`
--
ALTER TABLE `kel`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `partai`
--
ALTER TABLE `partai`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `proof`
--
ALTER TABLE `proof`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `prov`
--
ALTER TABLE `prov`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `saksi`
--
ALTER TABLE `saksi`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `suara`
--
ALTER TABLE `suara`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `caleg`
--
ALTER TABLE `caleg`
  ADD CONSTRAINT `caleg_ibfk_1` FOREIGN KEY (`id_partai`) REFERENCES `partai` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `caleg_ibfk_2` FOREIGN KEY (`id_dapil`) REFERENCES `dapil` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `caleg_ibfk_3` FOREIGN KEY (`id_prov`) REFERENCES `prov` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `caleg_ibfk_4` FOREIGN KEY (`id_kab`) REFERENCES `kab` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `caleg_ibfk_5` FOREIGN KEY (`id_kel`) REFERENCES `kel` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kab`
--
ALTER TABLE `kab`
  ADD CONSTRAINT `kab_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `prov` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kec`
--
ALTER TABLE `kec`
  ADD CONSTRAINT `kec_ibfk_1` FOREIGN KEY (`id_kab`) REFERENCES `kab` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kec_ibfk_2` FOREIGN KEY (`id_prov`) REFERENCES `prov` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kec_ibfk_3` FOREIGN KEY (`id_dapil`) REFERENCES `dapil` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kel`
--
ALTER TABLE `kel`
  ADD CONSTRAINT `kel_ibfk_1` FOREIGN KEY (`id_kec`) REFERENCES `kec` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kel_ibfk_2` FOREIGN KEY (`id_kab`) REFERENCES `kab` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `kel_ibfk_3` FOREIGN KEY (`id_prov`) REFERENCES `prov` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `proof`
--
ALTER TABLE `proof`
  ADD CONSTRAINT `proof_ibfk_1` FOREIGN KEY (`id_dapil`) REFERENCES `dapil` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proof_ibfk_2` FOREIGN KEY (`id_kel`) REFERENCES `kel` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proof_ibfk_3` FOREIGN KEY (`id_saksi`) REFERENCES `saksi` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `saksi`
--
ALTER TABLE `saksi`
  ADD CONSTRAINT `saksi_rel_dapil` FOREIGN KEY (`id_dapil`) REFERENCES `dapil` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `saksi_rel_kab` FOREIGN KEY (`id_kab`) REFERENCES `kab` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `saksi_rel_kec` FOREIGN KEY (`id_kec`) REFERENCES `kec` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `saksi_rel_kel` FOREIGN KEY (`id_kel`) REFERENCES `kel` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `saksi_rel_prov` FOREIGN KEY (`id_prov`) REFERENCES `prov` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `suara`
--
ALTER TABLE `suara`
  ADD CONSTRAINT `suara_ibfk_1` FOREIGN KEY (`id_caleg`) REFERENCES `caleg` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `suara_ibfk_3` FOREIGN KEY (`id_saksi`) REFERENCES `saksi` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_saksi`) REFERENCES `saksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
