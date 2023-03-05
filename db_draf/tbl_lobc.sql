-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2023 at 08:29 PM
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
-- Table structure for table `tbl_lobc`
--

CREATE TABLE `tbl_lobc` (
  `lobc_no` int(10) NOT NULL,
  `lobc_no_pnr` varchar(20) NOT NULL,
  `lobc_dp_duedate` datetime NOT NULL,
  `lobc_pymt_duedate` datetime NOT NULL,
  `lobc_pic` varchar(100) NOT NULL,
  `lobc_pic_number` int(15) NOT NULL,
  `lobc_publ` varchar(100) NOT NULL,
  `lobc_destn` varchar(60) NOT NULL,
  `lobc_date` date NOT NULL,
  `lobc_airline` varchar(20) NOT NULL,
  `lobc_dept_date` date NOT NULL,
  `lobc_aiport` varchar(60) NOT NULL,
  `lobc_dept_no` varchar(14) NOT NULL,
  `lobc_dept_time` time NOT NULL,
  `lobc_total_seat` int(3) NOT NULL,
  `lobc_per_seat` bigint(19) NOT NULL,
  `lobc_total` bigint(19) NOT NULL,
  `lobc_dp_total` bigint(19) NOT NULL,
  `lobc_pymt_total` bigint(19) NOT NULL,
  `lobc_dir` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_lobc`
--
ALTER TABLE `tbl_lobc`
  ADD PRIMARY KEY (`lobc_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
