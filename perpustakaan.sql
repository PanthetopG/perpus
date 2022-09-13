-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2022 at 08:45 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `nama_buku` varchar(120) NOT NULL,
  `deskripsi` varchar(120) NOT NULL,
  `foto` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `nama_buku`, `deskripsi`, `foto`) VALUES
(10, 'Best Striker in The World', 'Robert LewanGOALski', 0x6c6577612e6a7067),
(11, 'The greatest Team called Barca', 'Factos', 0x6261726361636f7665722e6a7067);

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman_buku`
--

CREATE TABLE `detail_peminjaman_buku` (
  `id_detail_peminjaman_buku` int(11) NOT NULL,
  `id_peminjaman_buku` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_peminjaman_buku`
--

INSERT INTO `detail_peminjaman_buku` (`id_detail_peminjaman_buku`, `id_peminjaman_buku`, `id_buku`, `qty`) VALUES
(2, 2, 11, 1),
(3, 3, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `kelompok` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kelompok`) VALUES
(1, 'XIR2', 'NAGA'),
(2, 'XIR2', 'NAGA'),
(3, 'XIR2', 'ASAP'),
(4, 'XIR2', 'kucing');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_buku`
--

CREATE TABLE `peminjaman_buku` (
  `id_peminjaman_buku` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman_buku`
--

INSERT INTO `peminjaman_buku` (`id_peminjaman_buku`, `id_siswa`, `tanggal_pinjam`, `tanggal_kembali`) VALUES
(2, 33, '2022-09-13', '2022-09-18'),
(3, 33, '2022-09-13', '2022-09-18');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian_buku`
--

CREATE TABLE `pengembalian_buku` (
  `id_pengembalian_buku` int(11) NOT NULL,
  `id_peminjaman_buku` int(11) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian_buku`
--

INSERT INTO `pengembalian_buku` (`id_pengembalian_buku`, `id_peminjaman_buku`, `tanggal_pengembalian`, `denda`) VALUES
(2, 2, '2022-09-13', 0),
(3, 3, '2022-09-13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `tanggal_lahir`, `gender`, `alamat`, `username`, `password`, `id_kelas`) VALUES
(28, 'Panji', '0006-03-02', 'L', 'awsev', 'PanjiGaming', 'fcea920f7412b5da7be0cf42b8c93759', 2),
(31, 'Panji AW', '2006-03-02', 'L', 'Rmh Kamu ', 'PanjiGamingYT2022', '22c276a05aa7c90566ae2175bcc2a9b0', 1),
(32, 'Panji', '0006-03-02', 'L', 'awsev', 'PanjiGaming', 'd3fe265eeaecbaa16eb610fdff281caa', 2),
(33, 'Panji AW', '2006-03-02', 'L', 'Malang', 'PanjiYT', '827ccb0eea8a706c4c34a16891f84e7b', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  ADD PRIMARY KEY (`id_detail_peminjaman_buku`),
  ADD KEY `id_peminjaman_buku` (`id_peminjaman_buku`,`id_buku`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  ADD PRIMARY KEY (`id_peminjaman_buku`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  ADD PRIMARY KEY (`id_pengembalian_buku`),
  ADD KEY `id_peminjaman_buku` (`id_peminjaman_buku`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  MODIFY `id_detail_peminjaman_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  MODIFY `id_peminjaman_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  MODIFY `id_pengembalian_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  ADD CONSTRAINT `detail_peminjaman_buku_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_peminjaman_buku_ibfk_2` FOREIGN KEY (`id_peminjaman_buku`) REFERENCES `peminjaman_buku` (`id_peminjaman_buku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  ADD CONSTRAINT `peminjaman_buku_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  ADD CONSTRAINT `pengembalian_buku_ibfk_1` FOREIGN KEY (`id_peminjaman_buku`) REFERENCES `peminjaman_buku` (`id_peminjaman_buku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
