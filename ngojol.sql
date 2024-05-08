-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Bulan Mei 2024 pada 15.05
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ngojol`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id_transaksi` int(11) NOT NULL,
  `id_pesanan` int(6) DEFAULT NULL,
  `id_pelanggan` int(6) DEFAULT NULL,
  `id_driver` int(8) DEFAULT NULL,
  `jumlah_Pesanan` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `status` enum('Telah bayar','Belum bayar') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id_transaksi`, `id_pesanan`, `id_pelanggan`, `id_driver`, `jumlah_Pesanan`, `subtotal`, `status`) VALUES
(1, 72131, 131089, 11289, 3, 75000, 'Telah bayar'),
(2, 886758, 131143, 598169, 2, 20000, 'Belum bayar'),
(3, 1115532, 131082, 997868, 5, 75000, 'Telah bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `driver_ojol`
--

CREATE TABLE `driver_ojol` (
  `id_driver` int(8) NOT NULL,
  `nama_driver` varchar(100) DEFAULT NULL,
  `kendaraan` varchar(100) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `nomor_telepon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `driver_ojol`
--

INSERT INTO `driver_ojol` (`id_driver`, `nama_driver`, `kendaraan`, `rating`, `nomor_telepon`) VALUES
(11289, 'Ahmad Ladusing', 'Yamaha Gear', 4, '081209985729'),
(598169, 'Yato', 'Kawasaki ZX25R', 5, '088906362823'),
(997868, 'Ilham', 'Honda Gyro', 4, '087711285890');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(6) NOT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `nomor_telepon` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `nomor_telepon`) VALUES
(131082, 'Obed Yudha Pambudi', 'Jln. Haji naik bubur', '082287286171'),
(131089, 'Yehezkiel Matius Palenewen', 'Jln. Jati diri', '08963491'),
(131143, 'Dani Rizky Syabana', 'Jln. gang Lorong perempatan', '087702916750');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_pesanan`
--

CREATE TABLE `transaksi_pesanan` (
  `id_pesanan` int(6) NOT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `id_pelanggan` int(6) DEFAULT NULL,
  `jumlah_pesanan` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `pesanan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_pesanan`
--

INSERT INTO `transaksi_pesanan` (`id_pesanan`, `tanggal_transaksi`, `id_pelanggan`, `jumlah_pesanan`, `harga`, `pesanan`) VALUES
(72131, '2024-02-19', 131089, 3, 25000, 'Ayam bakar bandung'),
(886758, '2024-04-20', 131143, 2, 10000, 'Le minerale'),
(1115532, '0000-00-00', 131082, 5, 15000, 'paket 1 rocket chicken');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_driver` (`id_driver`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indeks untuk tabel `driver_ojol`
--
ALTER TABLE `driver_ojol`
  ADD PRIMARY KEY (`id_driver`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi_pesanan`
--
ALTER TABLE `transaksi_pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `detail_pesanan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`id_driver`) REFERENCES `driver_ojol` (`id_driver`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pesanan_ibfk_3` FOREIGN KEY (`id_pesanan`) REFERENCES `transaksi_pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
