-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2023 at 08:00 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `umrahtiket`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `pkg_id` int(11) NOT NULL,
  `pkg_maskapai` varchar(60) NOT NULL,
  `pkg_no_keberangkatan` int(15) NOT NULL,
  `pkg_tgl_keberangkatan` date NOT NULL,
  `pkg_jam_keberangkatan` time NOT NULL,
  `pkg_jam_kedatangan` time NOT NULL,
  `pkg_sektor_keberangkatan` varchar(40) NOT NULL,
  `pkg_transit_keberangkatan` varchar(60) NOT NULL,
  `pkg_no_kepulangan` int(15) NOT NULL,
  `pkg_tgl_kepulangan` date NOT NULL,
  `pkg_jam_kepulangan` time NOT NULL,
  `pkg_jam_kedatangan_id` time NOT NULL,
  `pkg_sektor_kepulangan` varchar(40) NOT NULL,
  `pkg_transit_kepulangan` varchar(60) NOT NULL,
  `pkg_total_seat` int(5) NOT NULL,
  `pkg_min_seat` int(3) NOT NULL,
  `pkg_maks_seat` int(3) NOT NULL,
  `pkg_deadline` datetime NOT NULL,
  `pkh_hrg_perseat` bigint(11) NOT NULL,
  `pkg_hrg_lobc` int(11) NOT NULL,
  `pkg_dp_perseat` int(11) NOT NULL,
  `pkg_dp_deadline` datetime NOT NULL,
  `pkg_lunas_deadline` datetime NOT NULL,
  `pkg_manifest_deadline` datetime NOT NULL,
  `pkg_opt_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD PRIMARY KEY (`pkg_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
