-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 05, 2023 at 05:38 AM
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
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_akses`
--

CREATE TABLE `tbl_akses` (
  `nama_akses` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_akses`
--

INSERT INTO `tbl_akses` (`nama_akses`) VALUES
('admin'),
('customer'),
('provider');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank`
--

CREATE TABLE `tbl_bank` (
  `bank_id` int(11) NOT NULL,
  `bank_cabang` varchar(60) NOT NULL,
  `bank_no_rek` int(16) NOT NULL,
  `bank_atas_nama` varchar(100) NOT NULL,
  `prov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `cust_id` int(11) NOT NULL,
  `cust_nama` varchar(100) NOT NULL,
  `cust_nama_co` varchar(100) NOT NULL,
  `cust_alamat_co` varchar(150) NOT NULL,
  `cust_telp` int(15) NOT NULL,
  `cust_wa` int(15) NOT NULL,
  `cust_email` varchar(62) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_direktur`
--

CREATE TABLE `tbl_direktur` (
  `dir_id` int(11) NOT NULL,
  `dir_nama` varchar(100) NOT NULL,
  `dir_telp` int(15) NOT NULL,
  `dir_wa` int(15) NOT NULL,
  `dir_ktp` int(16) NOT NULL,
  `dir_ktpdoc` varchar(128) NOT NULL,
  `dir_npwp` int(15) NOT NULL,
  `dir_email` varchar(62) NOT NULL,
  `prov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_keberangkatan`
--

CREATE TABLE `tbl_keberangkatan` (
  `no_keberangkatan` varchar(7) NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `wkt_keberangkatan` time NOT NULL,
  `wkt_tiba` time NOT NULL,
  `bandara_keberangkatan` varchar(75) NOT NULL,
  `transit_keberangkatan` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kepulangan`
--

CREATE TABLE `tbl_kepulangan` (
  `no_kepulangan` varchar(7) NOT NULL,
  `tgl_kepulangan` date NOT NULL,
  `wkt_kepulangan` time NOT NULL,
  `wkt_tiba_plg` time NOT NULL,
  `bandara_kepulangan` varchar(75) NOT NULL,
  `transit_kepulangan` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lobc`
--

CREATE TABLE `tbl_lobc` (
  `no_lobc` varchar(10) NOT NULL,
  `tgl_lobc` date NOT NULL DEFAULT current_timestamp(),
  `no_pnr` int(11) NOT NULL,
  `depo_akhir_lobc` datetime NOT NULL,
  `pelunasan_akhir_lobc` datetime NOT NULL,
  `pic_lobc` varchar(100) NOT NULL,
  `telp_pic_lobc` int(15) NOT NULL,
  `id_pesanan` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_maskapai`
--

CREATE TABLE `tbl_maskapai` (
  `id_maskapai` int(11) NOT NULL,
  `nama_maskapai` varchar(40) NOT NULL,
  `logo_maskapai` int(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembatalan`
--

CREATE TABLE `tbl_pembatalan` (
  `id_pembatalan` int(11) NOT NULL,
  `ket_pembatalan` text NOT NULL,
  `id_pesanan` varchar(9) NOT NULL,
  `status_pembatalan` enum('0','1','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesanan`
--

CREATE TABLE `tbl_pesanan` (
  `id_pesanan` varchar(9) NOT NULL,
  `jmlh_seat_booked` int(11) NOT NULL,
  `id_pkt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pic`
--

CREATE TABLE `tbl_pic` (
  `pic_id` int(11) NOT NULL,
  `pic_nama` varchar(100) NOT NULL,
  `pic_telp` int(15) NOT NULL,
  `pic_wa` int(15) NOT NULL,
  `pic_ktp` int(16) NOT NULL,
  `pic_ktpdoc` varchar(128) NOT NULL,
  `pic_email` varchar(62) NOT NULL,
  `prov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pkt_umrah`
--

CREATE TABLE `tbl_pkt_umrah` (
  `id_pkt` int(11) NOT NULL,
  `maskapai` varchar(60) NOT NULL,
  `total_seat` int(5) NOT NULL,
  `min_seat` int(3) NOT NULL,
  `maks_seat` int(3) NOT NULL,
  `batas_pembelian` date NOT NULL,
  `hrg_perseat` bigint(19) NOT NULL,
  `biaya_lobc` bigint(19) NOT NULL,
  `depo_perseat` bigint(19) NOT NULL,
  `depo_akhir` datetime NOT NULL,
  `pelunasan_akhir` datetime NOT NULL,
  `manifest_akhir` datetime NOT NULL,
  `deskripsi_tmbhn` text NOT NULL,
  `prov_id` int(11) NOT NULL,
  `no_keberangkatan` varchar(7) NOT NULL,
  `no_kepulangan` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_provider`
--

CREATE TABLE `tbl_provider` (
  `prov_id` int(11) NOT NULL,
  `prov_nama` varchar(100) NOT NULL,
  `prov_alamat` varchar(150) NOT NULL,
  `prov_alamat2` varchar(150) NOT NULL,
  `prov_telp` int(15) NOT NULL,
  `prov_wa` int(15) NOT NULL,
  `prov_email` varchar(62) NOT NULL,
  `prov_sk_pendirian` varchar(128) NOT NULL,
  `prov_sk_perubahan` varchar(128) NOT NULL,
  `prov_npwp` int(15) NOT NULL,
  `prov_skdp` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sp_prov`
--

CREATE TABLE `tbl_sp_prov` (
  `sp_id` int(11) NOT NULL,
  `sp_doc` varchar(100) NOT NULL,
  `prov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` varchar(12) NOT NULL,
  `wkt_transaksi` datetime NOT NULL DEFAULT current_timestamp(),
  `mtd_transaksi` varchar(30) NOT NULL,
  `jenis_transaksi` enum('Deposit','Pelunasan','','') NOT NULL,
  `nominal_transaksi` bigint(19) NOT NULL,
  `id_pesanan` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(62) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_as` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `fk_user_admin` (`user_id`);

--
-- Indexes for table `tbl_akses`
--
ALTER TABLE `tbl_akses`
  ADD PRIMARY KEY (`nama_akses`);

--
-- Indexes for table `tbl_bank`
--
ALTER TABLE `tbl_bank`
  ADD PRIMARY KEY (`bank_id`),
  ADD KEY `fk_prov_bank` (`prov_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD KEY `fk_user_customer` (`user_id`);

--
-- Indexes for table `tbl_direktur`
--
ALTER TABLE `tbl_direktur`
  ADD PRIMARY KEY (`dir_id`),
  ADD KEY `fk_prov_direktur` (`prov_id`);

--
-- Indexes for table `tbl_keberangkatan`
--
ALTER TABLE `tbl_keberangkatan`
  ADD PRIMARY KEY (`no_keberangkatan`);

--
-- Indexes for table `tbl_kepulangan`
--
ALTER TABLE `tbl_kepulangan`
  ADD PRIMARY KEY (`no_kepulangan`);

--
-- Indexes for table `tbl_lobc`
--
ALTER TABLE `tbl_lobc`
  ADD PRIMARY KEY (`no_lobc`),
  ADD KEY `fk_lobc_pesanan` (`id_pesanan`);

--
-- Indexes for table `tbl_maskapai`
--
ALTER TABLE `tbl_maskapai`
  ADD PRIMARY KEY (`id_maskapai`);

--
-- Indexes for table `tbl_pembatalan`
--
ALTER TABLE `tbl_pembatalan`
  ADD PRIMARY KEY (`id_pembatalan`),
  ADD KEY `fk_pesanan_pembatalan` (`id_pesanan`);

--
-- Indexes for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `fk_pesanan_pktumrah` (`id_pkt`);

--
-- Indexes for table `tbl_pic`
--
ALTER TABLE `tbl_pic`
  ADD PRIMARY KEY (`pic_id`),
  ADD KEY `fk_prov_pic` (`prov_id`);

--
-- Indexes for table `tbl_pkt_umrah`
--
ALTER TABLE `tbl_pkt_umrah`
  ADD PRIMARY KEY (`id_pkt`),
  ADD UNIQUE KEY `no_keberangkatan` (`no_keberangkatan`,`no_kepulangan`),
  ADD KEY `fk_provider_pktumrah` (`prov_id`),
  ADD KEY `fk_nokepulangan_pktumrah` (`no_kepulangan`);

--
-- Indexes for table `tbl_provider`
--
ALTER TABLE `tbl_provider`
  ADD PRIMARY KEY (`prov_id`),
  ADD KEY `fk_user_prov` (`user_id`);

--
-- Indexes for table `tbl_sp_prov`
--
ALTER TABLE `tbl_sp_prov`
  ADD PRIMARY KEY (`sp_id`),
  ADD KEY `fk_prov_sp_prov` (`prov_id`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_pesanan_transaksi` (`id_pesanan`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD CONSTRAINT `fk_user_admin` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_bank`
--
ALTER TABLE `tbl_bank`
  ADD CONSTRAINT `fk_prov_bank` FOREIGN KEY (`prov_id`) REFERENCES `tbl_provider` (`prov_id`);

--
-- Constraints for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD CONSTRAINT `fk_user_customer` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_direktur`
--
ALTER TABLE `tbl_direktur`
  ADD CONSTRAINT `fk_prov_direktur` FOREIGN KEY (`prov_id`) REFERENCES `tbl_provider` (`prov_id`);

--
-- Constraints for table `tbl_lobc`
--
ALTER TABLE `tbl_lobc`
  ADD CONSTRAINT `fk_lobc_pesanan` FOREIGN KEY (`id_pesanan`) REFERENCES `tbl_pesanan` (`id_pesanan`);

--
-- Constraints for table `tbl_pembatalan`
--
ALTER TABLE `tbl_pembatalan`
  ADD CONSTRAINT `fk_pesanan_pembatalan` FOREIGN KEY (`id_pesanan`) REFERENCES `tbl_pesanan` (`id_pesanan`);

--
-- Constraints for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  ADD CONSTRAINT `fk_pesanan_pktumrah` FOREIGN KEY (`id_pkt`) REFERENCES `tbl_pkt_umrah` (`id_pkt`);

--
-- Constraints for table `tbl_pic`
--
ALTER TABLE `tbl_pic`
  ADD CONSTRAINT `fk_prov_pic` FOREIGN KEY (`prov_id`) REFERENCES `tbl_provider` (`prov_id`);

--
-- Constraints for table `tbl_pkt_umrah`
--
ALTER TABLE `tbl_pkt_umrah`
  ADD CONSTRAINT `fk_nokbrngkatan_pktumrah` FOREIGN KEY (`no_keberangkatan`) REFERENCES `tbl_keberangkatan` (`no_keberangkatan`),
  ADD CONSTRAINT `fk_nokepulangan_pktumrah` FOREIGN KEY (`no_kepulangan`) REFERENCES `tbl_kepulangan` (`no_kepulangan`),
  ADD CONSTRAINT `fk_provider_pktumrah` FOREIGN KEY (`prov_id`) REFERENCES `tbl_provider` (`prov_id`);

--
-- Constraints for table `tbl_provider`
--
ALTER TABLE `tbl_provider`
  ADD CONSTRAINT `fk_user_prov` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_sp_prov`
--
ALTER TABLE `tbl_sp_prov`
  ADD CONSTRAINT `fk_prov_sp_prov` FOREIGN KEY (`prov_id`) REFERENCES `tbl_provider` (`prov_id`);

--
-- Constraints for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `fk_pesanan_transaksi` FOREIGN KEY (`id_pesanan`) REFERENCES `tbl_pesanan` (`id_pesanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
