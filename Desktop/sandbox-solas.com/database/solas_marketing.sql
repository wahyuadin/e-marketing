-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 14 Bulan Mei 2025 pada 09.11
-- Versi server: 8.0.30
-- Versi PHP: 8.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `solas_marketing`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensis`
--

CREATE TABLE `absensis` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alasan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_marki` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `absensis`
--

INSERT INTO `absensis` (`id`, `user_id`, `tanggal`, `waktu`, `keterangan`, `status`, `alasan`, `foto_marki`, `latitude`, `longitude`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9ee11836-bcb1-4d70-a5db-3aceecbcb100', '9ee0d4fb-cbfe-4b5c-aedd-5b73cdae09cb', '2025-05-10', '23:55', 'masuk', 'dalam_kota', NULL, '6xW8mTsQ4u8sKUPFLUYB6JwNa12vLMUBP0OlqrWi.png', NULL, NULL, NULL, '2025-05-10 16:55:10', '2025-05-10 16:55:10'),
('9ee11876-24d1-4e37-a066-dc72a8393639', '9ee1017f-7364-4ae3-8c57-14dd2bb25e91', '2025-05-10', '23:55', 'masuk', 'luar_kota', NULL, 'OD3wbxYOCjUP06Qh1PO1TdEdpL0bmIw7WU3f1OZ8.png', NULL, NULL, NULL, '2025-05-10 16:55:52', '2025-05-10 16:55:52'),
('9ee1301e-79dc-4ab5-a3df-3958ac11de06', '9ee0d4fb-cbfe-4b5c-aedd-5b73cdae09cb', '2025-05-11', '01:02', 'masuk', 'dalam_kota', NULL, 'SvBPSZ7QKty0mLyMXSBtSXjDU7JebPwKwCaj32Be.png', NULL, NULL, NULL, '2025-05-10 18:02:01', '2025-05-10 18:02:01'),
('9ee142d8-5013-46f7-8ed7-135345dbc0cf', '9ee1017f-7364-4ae3-8c57-14dd2bb25e91', '2025-05-11', '01:54', 'masuk', 'dalam_kota', NULL, 'Pak3VUpJuA3yvGkKCCPoP8Cv7Dp40OztWfsrPvxx.png', NULL, NULL, NULL, '2025-05-10 18:54:23', '2025-05-10 18:54:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `approval_histories`
--

CREATE TABLE `approval_histories` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengajuan_dokter_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `appoval_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appoval_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_appoval_1` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status_appoval_2` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `approval_histories`
--

INSERT INTO `approval_histories` (`id`, `pengajuan_dokter_id`, `appoval_1`, `appoval_2`, `status_appoval_1`, `status_appoval_2`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9eddbfac-d35b-498d-8eab-6e4cf8cc7466', '9eddbfac-a032-49ef-86f2-937c39628012', 'Super Admin', 'Welmando', 'pending', 'pending', NULL, '2025-05-09 08:00:07', '2025-05-09 08:00:07'),
('9ee0e541-3b22-4bb0-a3e3-65f0310550db', '9ee0e541-376e-404a-b3db-96c01fe57892', 'Super Admin', 'Vacant', 'pending', 'pending', NULL, '2025-05-10 14:32:41', '2025-05-10 14:32:41'),
('9ee100c6-c97b-4baf-b41d-e9c1bdbde622', '9ee100c6-c6d3-4494-9c03-6e1168358981', 'Super Admin', 'Vacant', 'pending', 'pending', NULL, '2025-05-10 15:49:38', '2025-05-10 15:49:38'),
('9ee10714-0de5-43d3-9c95-fa54c2285c20', '9ee10714-0ae5-4f38-bd44-3615f7d626fd', 'Super Admin', 'Wahyu', 'pending', 'pending', NULL, '2025-05-10 16:07:15', '2025-05-10 16:07:15'),
('9ee2dcf7-6150-4a93-a5bf-b88630058f0d', '9ee2dcf7-5e52-4858-8cb6-1b7ebd362d8a', 'Super Admin', 'Vacant', 'pending', 'pending', NULL, '2025-05-11 14:01:09', '2025-05-11 14:01:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `areas`
--

CREATE TABLE `areas` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `areas`
--

INSERT INTO `areas` (`id`, `area`, `deleted_at`, `created_at`, `updated_at`) VALUES
('13373538-294c-11f0-bda6-bc2411c0ee13', 'Toraja', NULL, NULL, NULL),
('1353c5ec-294c-11f0-bda6-bc2411c0ee13', 'Bone, Soppeng, Wajo, Sinjai', NULL, NULL, NULL),
('135ef723-294c-11f0-bda6-bc2411c0ee13', 'Makassar Utara', NULL, NULL, NULL),
('136fc661-294c-11f0-bda6-bc2411c0ee13', 'Pare Barru Pinrang', NULL, NULL, NULL),
('1378f98c-294c-11f0-bda6-bc2411c0ee13', 'Makassar Utara', NULL, NULL, NULL),
('13822ee0-294c-11f0-bda6-bc2411c0ee13', 'Kendari', NULL, NULL, NULL),
('138b60a2-294c-11f0-bda6-bc2411c0ee13', 'Baubau, Raha, Wakatobi', NULL, NULL, NULL),
('139490bc-294c-11f0-bda6-bc2411c0ee13', 'Kendari 1, Bombana, Konsel', NULL, NULL, NULL),
('13aaf7de-294c-11f0-bda6-bc2411c0ee13', 'Ambon', NULL, NULL, NULL),
('13b4bb62-294c-11f0-bda6-bc2411c0ee13', 'Ambon 1', NULL, NULL, NULL),
('13bdef49-294c-11f0-bda6-bc2411c0ee13', 'Ambon 2', NULL, NULL, NULL),
('13c7253a-294c-11f0-bda6-bc2411c0ee13', 'Manado', '2025-05-05 14:00:55', NULL, '2025-05-05 14:00:55'),
('13d05742-294c-11f0-bda6-bc2411c0ee13', 'Kotamobagu', NULL, NULL, NULL),
('13d98af7-294c-11f0-bda6-bc2411c0ee13', 'Manado', NULL, NULL, NULL),
('13e2bf24-294c-11f0-bda6-bc2411c0ee13', 'Gorontalo', NULL, NULL, NULL),
('13ee6ffe-294c-11f0-bda6-bc2411c0ee13', 'Gorontalo 1', NULL, NULL, NULL),
('13f9b7cf-294c-11f0-bda6-bc2411c0ee13', 'Gorontalo 2', NULL, NULL, NULL),
('14047526-294c-11f0-bda6-bc2411c0ee13', 'Palu', NULL, NULL, NULL),
('140daa66-294c-11f0-bda6-bc2411c0ee13', 'Palu', NULL, NULL, NULL),
('1416d882-294c-11f0-bda6-bc2411c0ee13', 'All Reg 01', NULL, NULL, NULL),
('14200cf5-294c-11f0-bda6-bc2411c0ee13', 'Cirebon', NULL, NULL, NULL),
('1429427a-294c-11f0-bda6-bc2411c0ee13', 'Bojonegoro', NULL, NULL, NULL),
('14327389-294c-11f0-bda6-bc2411c0ee13', 'Tuban (Jatim 3)', NULL, NULL, NULL),
('143ba049-294c-11f0-bda6-bc2411c0ee13', 'Madura 3( Pamekasan-sampang)', NULL, NULL, NULL),
('1444db21-294c-11f0-bda6-bc2411c0ee13', 'Nganjuk', NULL, NULL, NULL),
('1452a50e-294c-11f0-bda6-bc2411c0ee13', 'JATIM 4', NULL, NULL, NULL),
('145bd449-294c-11f0-bda6-bc2411c0ee13', 'JATIM 5', NULL, NULL, NULL),
('14650bb4-294c-11f0-bda6-bc2411c0ee13', 'Malang 1', NULL, NULL, NULL),
('146e3ff4-294c-11f0-bda6-bc2411c0ee13', 'Malang 2', NULL, NULL, NULL),
('1477713b-294c-11f0-bda6-bc2411c0ee13', 'JATIM 6', NULL, NULL, NULL),
('1480a37c-294c-11f0-bda6-bc2411c0ee13', 'Kediri 1', NULL, NULL, NULL),
('14884da4-294c-11f0-bda6-bc2411c0ee13', 'JATIM 7', NULL, NULL, NULL),
('148fff13-294c-11f0-bda6-bc2411c0ee13', 'Jember 1', NULL, NULL, NULL),
('1497a814-294c-11f0-bda6-bc2411c0ee13', 'Jember 3 (Probolinggo, Lumajang, Kraksaan)', NULL, NULL, NULL),
('149f51d7-294c-11f0-bda6-bc2411c0ee13', 'BALI', '2025-05-05 14:18:04', NULL, '2025-05-05 14:18:04'),
('14a6ff93-294c-11f0-bda6-bc2411c0ee13', 'NUSRA 1', NULL, NULL, NULL),
('14aea848-294c-11f0-bda6-bc2411c0ee13', 'Mataram 1', NULL, NULL, NULL),
('14b6560d-294c-11f0-bda6-bc2411c0ee13', 'Praya', NULL, NULL, NULL),
('14be01e7-294c-11f0-bda6-bc2411c0ee13', 'Selong', NULL, NULL, NULL),
('14c735ca-294c-11f0-bda6-bc2411c0ee13', 'NUSRA 2', NULL, NULL, NULL),
('14cedf9e-294c-11f0-bda6-bc2411c0ee13', 'Bima 1', NULL, NULL, NULL),
('14d68acb-294c-11f0-bda6-bc2411c0ee13', 'Bima 2', NULL, NULL, NULL),
('14de37bc-294c-11f0-bda6-bc2411c0ee13', 'Kupang', NULL, NULL, NULL),
('14e5e2ca-294c-11f0-bda6-bc2411c0ee13', 'Flores', NULL, NULL, NULL),
('14ed8c8d-294c-11f0-bda6-bc2411c0ee13', 'REG 3', NULL, NULL, NULL),
('14f53826-294c-11f0-bda6-bc2411c0ee13', 'REG 3', NULL, NULL, NULL),
('14fe6ea0-294c-11f0-bda6-bc2411c0ee13', 'Kalsel 1', NULL, NULL, NULL),
('1507a20e-294c-11f0-bda6-bc2411c0ee13', 'Banjarmasin 1', NULL, NULL, NULL),
('1510d1af-294c-11f0-bda6-bc2411c0ee13', 'Banjarmasin 2', NULL, NULL, NULL),
('151a07a0-294c-11f0-bda6-bc2411c0ee13', 'Batulicin', NULL, NULL, NULL),
('15295df0-294c-11f0-bda6-bc2411c0ee13', 'Kalsel 2', NULL, NULL, NULL),
('15328ef7-294c-11f0-bda6-bc2411c0ee13', 'Banjarmasin 3', NULL, NULL, NULL),
('15468c5b-294c-11f0-bda6-bc2411c0ee13', 'Banjarbaru', NULL, NULL, NULL),
('156527d4-294c-11f0-bda6-bc2411c0ee13', 'Kalsel 3', NULL, NULL, NULL),
('1583c8e5-294c-11f0-bda6-bc2411c0ee13', 'Tanjung', NULL, NULL, NULL),
('159f54a0-294c-11f0-bda6-bc2411c0ee13', 'Rantau', NULL, NULL, NULL),
('15a887e7-294c-11f0-bda6-bc2411c0ee13', 'Kalteng 1', NULL, NULL, NULL),
('15b1bafc-294c-11f0-bda6-bc2411c0ee13', 'Palangkaraya 1', NULL, NULL, NULL),
('15baef9f-294c-11f0-bda6-bc2411c0ee13', 'Muara Teweh', NULL, NULL, NULL),
('15c4221f-294c-11f0-bda6-bc2411c0ee13', 'Kalteng 2', NULL, NULL, NULL),
('15cd53ec-294c-11f0-bda6-bc2411c0ee13', 'Sampit 1', NULL, NULL, NULL),
('15d68926-294c-11f0-bda6-bc2411c0ee13', 'Pangkalan Bun', NULL, NULL, NULL),
('15dfbaf3-294c-11f0-bda6-bc2411c0ee13', 'Kaltim', NULL, NULL, NULL),
('15e8f010-294c-11f0-bda6-bc2411c0ee13', 'Bontang', NULL, NULL, NULL),
('15f22310-294c-11f0-bda6-bc2411c0ee13', 'Regional 4', NULL, NULL, NULL),
('15fb54e8-294c-11f0-bda6-bc2411c0ee13', 'Regional 4', NULL, NULL, NULL),
('1604875b-294c-11f0-bda6-bc2411c0ee13', 'Jateng 1', NULL, NULL, NULL),
('160dbc7f-294c-11f0-bda6-bc2411c0ee13', 'Purwodadi', NULL, NULL, NULL),
('1616efe2-294c-11f0-bda6-bc2411c0ee13', 'Blora', NULL, NULL, NULL),
('16201fb5-294c-11f0-bda6-bc2411c0ee13', 'Semarang Tengah', NULL, NULL, NULL),
('162954bc-294c-11f0-bda6-bc2411c0ee13', 'Semarang Barat', NULL, NULL, NULL),
('16328898-294c-11f0-bda6-bc2411c0ee13', 'Jateng 2', NULL, NULL, NULL),
('163bbabe-294c-11f0-bda6-bc2411c0ee13', 'Kuds Jepara Demak', NULL, NULL, NULL),
('16574ac2-294c-11f0-bda6-bc2411c0ee13', 'Pati Rembang Lasem', NULL, NULL, NULL),
('1672d6c6-294c-11f0-bda6-bc2411c0ee13', 'Ungaran Salatiga Ambarawa', NULL, NULL, NULL),
('168e684e-294c-11f0-bda6-bc2411c0ee13', 'Jateng 3', NULL, NULL, NULL),
('169f404c-294c-11f0-bda6-bc2411c0ee13', 'Temanggung Wonosobo', NULL, NULL, NULL),
('16a87795-294c-11f0-bda6-bc2411c0ee13', 'Magelang Purworejo', NULL, NULL, NULL),
('16b1a7a0-294c-11f0-bda6-bc2411c0ee13', 'Yogyakarta', NULL, NULL, NULL),
('16bada70-294c-11f0-bda6-bc2411c0ee13', 'Jateng 4', NULL, NULL, NULL),
('16c40be7-294c-11f0-bda6-bc2411c0ee13', 'Pwt Banyumas Pbg Bjn', NULL, NULL, NULL),
('16cd3f42-294c-11f0-bda6-bc2411c0ee13', 'Pwt Majenang Bumiayu', NULL, NULL, NULL),
('16d671db-294c-11f0-bda6-bc2411c0ee13', 'Kebumen - Cilacap', NULL, NULL, NULL),
('16dfa414-294c-11f0-bda6-bc2411c0ee13', 'Jateng 5', NULL, NULL, NULL),
('16e8d91a-294c-11f0-bda6-bc2411c0ee13', 'Solo Sukoharjo Wonogiri', NULL, NULL, NULL),
('16f393d4-294c-11f0-bda6-bc2411c0ee13', 'Solo Sragen Karanganyar', NULL, NULL, NULL),
('16fe4e5e-294c-11f0-bda6-bc2411c0ee13', 'Jateng 6', NULL, NULL, NULL),
('17078462-294c-11f0-bda6-bc2411c0ee13', 'Tegal Pemalang', NULL, NULL, NULL),
('1710b8ee-294c-11f0-bda6-bc2411c0ee13', 'Slawi', NULL, NULL, NULL),
('1719eaf8-294c-11f0-bda6-bc2411c0ee13', 'Pekalongan', NULL, NULL, NULL),
('17231ca3-294c-11f0-bda6-bc2411c0ee13', 'Batang', NULL, NULL, NULL),
('172c50a4-294c-11f0-bda6-bc2411c0ee13', 'Regional 5', NULL, NULL, NULL),
('17358337-294c-11f0-bda6-bc2411c0ee13', 'Regional 5', NULL, NULL, NULL),
('173eb4da-294c-11f0-bda6-bc2411c0ee13', 'Jabar-01', NULL, NULL, NULL),
('17529fb5-294c-11f0-bda6-bc2411c0ee13', 'Garut+Tasik', NULL, NULL, NULL),
('176995e5-294c-11f0-bda6-bc2411c0ee13', 'Bandung Utara 2+Ciwidey', NULL, NULL, NULL),
('1772c9f3-294c-11f0-bda6-bc2411c0ee13', 'Bandung Selatan+Majalaya', NULL, NULL, NULL),
('177bfcef-294c-11f0-bda6-bc2411c0ee13', 'Bandung Timur+Sumedang', NULL, NULL, NULL),
('1783a6c1-294c-11f0-bda6-bc2411c0ee13', 'Jabar-02', NULL, NULL, NULL),
('178b4e58-294c-11f0-bda6-bc2411c0ee13', 'Bandung+Subang', NULL, NULL, NULL),
('179301ba-294c-11f0-bda6-bc2411c0ee13', 'Sukabumi', NULL, NULL, NULL),
('179aabd5-294c-11f0-bda6-bc2411c0ee13', 'Cianjur', NULL, NULL, NULL),
('17a2576a-294c-11f0-bda6-bc2411c0ee13', 'Bandung Tengah+Smd', NULL, NULL, NULL),
('17aa044e-294c-11f0-bda6-bc2411c0ee13', 'Jabar-03', NULL, NULL, NULL),
('17b1af73-294c-11f0-bda6-bc2411c0ee13', 'Cirebon+Brebes', NULL, NULL, NULL),
('17b9596f-294c-11f0-bda6-bc2411c0ee13', 'Cirebon+Indramayu', NULL, NULL, NULL),
('17c104b9-294c-11f0-bda6-bc2411c0ee13', 'Cirebon+Majalengka', NULL, NULL, NULL),
('17c8b0aa-294c-11f0-bda6-bc2411c0ee13', 'Jabar', '2025-05-05 20:02:58', NULL, '2025-05-05 20:02:58'),
('17d05d30-294c-11f0-bda6-bc2411c0ee13', 'Jabar', '2025-05-05 20:03:09', NULL, '2025-05-05 20:03:09'),
('17d806bd-294c-11f0-bda6-bc2411c0ee13', 'DKI 1', NULL, NULL, NULL),
('17dfb2b2-294c-11f0-bda6-bc2411c0ee13', 'DKI 1', '2025-05-05 20:24:33', NULL, '2025-05-05 20:24:33'),
('17e75eb6-294c-11f0-bda6-bc2411c0ee13', 'DKI 1', '2025-05-05 20:24:39', NULL, '2025-05-05 20:24:39'),
('17ef0af8-294c-11f0-bda6-bc2411c0ee13', 'DKI 2', '2025-05-05 20:24:46', NULL, '2025-05-05 20:24:46'),
('17f6b68c-294c-11f0-bda6-bc2411c0ee13', 'JakTim 1', NULL, NULL, NULL),
('17fe5fd1-294c-11f0-bda6-bc2411c0ee13', 'Jakarta Timur II', NULL, NULL, NULL),
('18079422-294c-11f0-bda6-bc2411c0ee13', 'DKI 2', NULL, NULL, NULL),
('1810c257-294c-11f0-bda6-bc2411c0ee13', 'DKI 3', '2025-05-05 20:24:52', NULL, '2025-05-05 20:24:52'),
('1819faa3-294c-11f0-bda6-bc2411c0ee13', 'DKI 3', '2025-05-05 20:24:59', NULL, '2025-05-05 20:24:59'),
('18263bb8-294c-11f0-bda6-bc2411c0ee13', 'DKI 3', '2025-05-05 20:25:05', NULL, '2025-05-05 20:25:05'),
('1830f58a-294c-11f0-bda6-bc2411c0ee13', 'DKI 3', NULL, NULL, NULL),
('183d375b-294c-11f0-bda6-bc2411c0ee13', 'DKI 4', '2025-05-05 20:25:11', NULL, '2025-05-05 20:25:11'),
('18466d1a-294c-11f0-bda6-bc2411c0ee13', 'DKI 4', NULL, NULL, NULL),
('184f9f38-294c-11f0-bda6-bc2411c0ee13', 'JakTim / JKT 1', NULL, NULL, NULL),
('18681d6d-294c-11f0-bda6-bc2411c0ee13', 'Kalbar', NULL, NULL, NULL),
('18716526-294c-11f0-bda6-bc2411c0ee13', 'PTK1', NULL, NULL, NULL),
('187a9cce-294c-11f0-bda6-bc2411c0ee13', 'Kalbar', NULL, NULL, NULL),
('1883ccf1-294c-11f0-bda6-bc2411c0ee13', 'REG 07', NULL, NULL, NULL),
('188d00bf-294c-11f0-bda6-bc2411c0ee13', 'Admin Pusat', NULL, NULL, NULL),
('189631a2-294c-11f0-bda6-bc2411c0ee13', 'DKI 7', '2025-05-05 20:25:19', NULL, '2025-05-05 20:25:19'),
('189f678c-294c-11f0-bda6-bc2411c0ee13', 'DKI 7', '2025-05-05 20:25:25', NULL, '2025-05-05 20:25:25'),
('18a89a07-294c-11f0-bda6-bc2411c0ee13', 'Banten', NULL, NULL, NULL),
('18b1cd8e-294c-11f0-bda6-bc2411c0ee13', 'Tangerang', NULL, NULL, NULL),
('18bb02c0-294c-11f0-bda6-bc2411c0ee13', 'Tangerang', NULL, NULL, NULL),
('18c4335f-294c-11f0-bda6-bc2411c0ee13', 'Banten 2', NULL, NULL, NULL),
('18cd6420-294c-11f0-bda6-bc2411c0ee13', 'Serang + Cilegon', NULL, NULL, NULL),
('18d69941-294c-11f0-bda6-bc2411c0ee13', 'Lampung', NULL, NULL, NULL),
('18dfcafa-294c-11f0-bda6-bc2411c0ee13', 'Lampung 1', NULL, NULL, NULL),
('18e8fe4f-294c-11f0-bda6-bc2411c0ee13', 'Lampung 3', NULL, NULL, NULL),
('18f23538-294c-11f0-bda6-bc2411c0ee13', 'Lampung 4', NULL, NULL, NULL),
('18fb684f-294c-11f0-bda6-bc2411c0ee13', 'Lampung 5', NULL, NULL, NULL),
('19049bab-294c-11f0-bda6-bc2411c0ee13', 'Sumsel 1 - Palembang', NULL, NULL, NULL),
('190dce10-294c-11f0-bda6-bc2411c0ee13', 'Sumsel 2 - Lubuk Linggau', NULL, NULL, NULL),
('19170290-294c-11f0-bda6-bc2411c0ee13', 'Palembang', NULL, NULL, NULL),
('19203143-294c-11f0-bda6-bc2411c0ee13', 'Reg 08', NULL, NULL, NULL),
('19296576-294c-11f0-bda6-bc2411c0ee13', 'DKI 7', NULL, NULL, NULL),
('19329616-294c-11f0-bda6-bc2411c0ee13', 'Sumut I', NULL, NULL, NULL),
('193bc7f1-294c-11f0-bda6-bc2411c0ee13', 'Padang Bulan', '2025-05-05 21:08:11', NULL, '2025-05-05 21:08:11'),
('19450050-294c-11f0-bda6-bc2411c0ee13', 'Delitua', '2025-05-05 21:08:19', NULL, '2025-05-05 21:08:19'),
('194e3124-294c-11f0-bda6-bc2411c0ee13', 'Sunggal', '2025-05-05 21:08:25', NULL, '2025-05-05 21:08:25'),
('1957665e-294c-11f0-bda6-bc2411c0ee13', 'Sumut II', NULL, NULL, NULL),
('19609bc0-294c-11f0-bda6-bc2411c0ee13', 'Medan Baru', NULL, NULL, NULL),
('196adb8d-294c-11f0-bda6-bc2411c0ee13', 'Lubuk Pakam', '2025-05-05 21:09:03', NULL, '2025-05-05 21:09:03'),
('19792456-294c-11f0-bda6-bc2411c0ee13', 'Tembung - Binjai', '2025-05-05 21:09:22', NULL, '2025-05-05 21:09:22'),
('1983dd46-294c-11f0-bda6-bc2411c0ee13', 'Medan Krakatau - Tanjung Mulia', NULL, NULL, NULL),
('198d0f4f-294c-11f0-bda6-bc2411c0ee13', 'Sumut III', NULL, NULL, NULL),
('1996415d-294c-11f0-bda6-bc2411c0ee13', 'Rantau Prapat', NULL, NULL, NULL),
('199f75f3-294c-11f0-bda6-bc2411c0ee13', 'Medan Kota', NULL, NULL, NULL),
('19a8a84b-294c-11f0-bda6-bc2411c0ee13', 'Kisaran', NULL, NULL, NULL),
('19b1d8df-294c-11f0-bda6-bc2411c0ee13', 'Sumut IV', NULL, NULL, NULL),
('19bb0fc7-294c-11f0-bda6-bc2411c0ee13', 'Tarurung', NULL, NULL, NULL),
('19c4416d-294c-11f0-bda6-bc2411c0ee13', 'HM. Yamin - T. Pura', NULL, NULL, NULL),
('19cd714d-294c-11f0-bda6-bc2411c0ee13', 'Sumut V', NULL, NULL, NULL),
('19d6a508-294c-11f0-bda6-bc2411c0ee13', 'Padang Sidempuan II', NULL, NULL, NULL),
('19dfdbc2-294c-11f0-bda6-bc2411c0ee13', 'Sibolga', NULL, NULL, NULL),
('19e90ce4-294c-11f0-bda6-bc2411c0ee13', 'Aceh', NULL, NULL, NULL),
('19f23ffd-294c-11f0-bda6-bc2411c0ee13', 'Sigli', NULL, NULL, NULL),
('19f9ed66-294c-11f0-bda6-bc2411c0ee13', 'Meulaboh', NULL, NULL, NULL),
('1a019701-294c-11f0-bda6-bc2411c0ee13', 'Bireun', NULL, NULL, NULL),
('1a0dda6a-294c-11f0-bda6-bc2411c0ee13', 'Banda Aceh I', NULL, NULL, NULL),
('1a158748-294c-11f0-bda6-bc2411c0ee13', 'Langsa', NULL, NULL, NULL),
('1a1d3217-294c-11f0-bda6-bc2411c0ee13', 'Banda Aceh II', NULL, NULL, NULL),
('1a24dc02-294c-11f0-bda6-bc2411c0ee13', 'Pekanbaru', '2025-05-05 21:44:33', NULL, '2025-05-05 21:44:33'),
('1a2c87fc-294c-11f0-bda6-bc2411c0ee13', 'Sumbar', NULL, NULL, NULL),
('1a343389-294c-11f0-bda6-bc2411c0ee13', 'Padang Kota', NULL, NULL, NULL),
('1a3bde28-294c-11f0-bda6-bc2411c0ee13', 'Padang II', NULL, NULL, NULL),
('1a4388c2-294c-11f0-bda6-bc2411c0ee13', 'Padang I', NULL, NULL, NULL),
('1a4b3522-294c-11f0-bda6-bc2411c0ee13', 'Jambi', NULL, NULL, NULL),
('1a52e3c0-294c-11f0-bda6-bc2411c0ee13', 'Jambi II', NULL, NULL, NULL),
('1a5a8a76-294c-11f0-bda6-bc2411c0ee13', 'Jambi I', NULL, NULL, NULL),
('1a62399b-294c-11f0-bda6-bc2411c0ee13', 'Regional VII', NULL, NULL, NULL),
('1a69e61c-294c-11f0-bda6-bc2411c0ee13', 'Regional VII', NULL, NULL, NULL),
('1a718d45-294c-11f0-bda6-bc2411c0ee13', 'Nasional ', NULL, NULL, NULL),
('9ed5a9bc-0cca-4918-865f-1b8bb3640371', 'Makassar Selatan', NULL, '2025-05-05 07:32:08', '2025-05-05 07:32:08'),
('9ed5a9c5-f272-449d-986e-ac8ba9204ef7', 'Bulukumba Bantaeng', NULL, '2025-05-05 07:32:15', '2025-05-05 07:32:15'),
('9ed61c86-d9ec-4308-bbcc-a162b9620a12', 'Mamuju', NULL, '2025-05-05 12:53:07', '2025-05-05 12:53:07'),
('9ed61c8f-2d75-4cec-99bd-668a890fdd95', 'Polewali', NULL, '2025-05-05 12:53:13', '2025-05-05 12:53:13'),
('9ed61d3b-344f-42f5-b712-0a5e94706779', 'Kendari 2', NULL, '2025-05-05 12:55:06', '2025-05-05 12:55:06'),
('9ed61d80-7559-49a4-a648-7c0f04985081', 'Kendari 2', '2025-05-05 12:56:30', '2025-05-05 12:55:51', '2025-05-05 12:56:30'),
('9ed61ee2-abee-4e1a-958a-c84e43cb5e26', 'Manado 1', NULL, '2025-05-05 12:59:43', '2025-05-05 12:59:43'),
('9ed61eea-5aff-4502-9f12-b8063a5a3e41', 'Manado 2', NULL, '2025-05-05 12:59:48', '2025-05-05 12:59:48'),
('9ed61fdf-e646-4f3b-aacd-092af6d2add9', 'Palu 1', NULL, '2025-05-05 13:02:29', '2025-05-05 13:02:29'),
('9ed62011-1be0-42ee-bfea-8cecc9fcdb63', 'Palu 2', NULL, '2025-05-05 13:03:01', '2025-05-05 13:03:01'),
('9ed6201a-35fb-49e6-9f01-891be41d09a4', 'Palu 3', NULL, '2025-05-05 13:03:07', '2025-05-05 13:03:07'),
('9ed637d4-6234-4eb8-9b6b-d5e3346cfc31', 'Malang 3 (Pasuruan, Pandaan, Bangil)', NULL, '2025-05-05 14:09:28', '2025-05-05 14:09:28'),
('9ed63824-cdaa-48ff-8ef7-3ec579d8b8a2', 'Kediri 2', NULL, '2025-05-05 14:10:21', '2025-05-05 14:10:21'),
('9ed63831-4786-472d-b44d-e5621c4ae80e', 'Kediri 3', '2025-05-05 14:10:37', '2025-05-05 14:10:29', '2025-05-05 14:10:37'),
('9ed6386c-515c-4954-ba2c-365518a64205', 'Kediri 3', NULL, '2025-05-05 14:11:08', '2025-05-05 14:11:08'),
('9ed639b1-3947-461f-a4ff-c8bbfb7a4315', 'Jember 2 (Banyuwangi, Besuki, Situbondo)', NULL, '2025-05-05 14:14:41', '2025-05-05 14:14:41'),
('9ed639b9-2cf9-44ae-a961-0c32cc572c31', 'Jember 3 (Probolinggo, Lumajang, Tongas, Kraksaan, Jatiroto)', NULL, '2025-05-05 14:14:46', '2025-05-05 14:14:46'),
('9ed63af2-912f-41c4-9786-efe57466ec37', 'Bali 1 (Singaraja, Negara, Tabanan)', NULL, '2025-05-05 14:18:11', '2025-05-05 14:18:11'),
('9ed63afc-01bd-4375-b703-8cdfa5c52226', 'Bali 2 (Karangasem, Klungkung, Denpasar, Gianyar, Bangli)', NULL, '2025-05-05 14:18:17', '2025-05-05 14:18:17'),
('9ed63c4f-03ca-46a2-a414-3596a490be61', 'Mataram 2', NULL, '2025-05-05 14:22:00', '2025-05-05 14:22:00'),
('9ed63cba-330d-4ada-9ee1-c0683abad2d4', 'Bima 1 & Sumbawa', '2025-05-05 14:23:24', '2025-05-05 14:23:10', '2025-05-05 14:23:24'),
('9ed63f5b-c03c-4bdb-903b-6ea3594b0a12', 'MARTAPURA', '2025-05-05 14:30:38', '2025-05-05 14:30:31', '2025-05-05 14:30:38'),
('9ed63f76-37fa-4e2b-922c-50de0e8c47f3', 'Martapura', NULL, '2025-05-05 14:30:49', '2025-05-05 14:30:49'),
('9ed64836-406d-4c7e-8771-bd54392eabdd', 'Barabai - Amuntai', NULL, '2025-05-05 14:55:17', '2025-05-05 14:55:17'),
('9ed6492d-3ffc-40b7-b464-2851e218a102', 'Palangkaraya 2', NULL, '2025-05-05 14:57:58', '2025-05-05 14:57:58'),
('9ed64953-d402-45ec-b308-ca5fbe7dbf25', 'Palangkaraya 2 - Buntok', NULL, '2025-05-05 14:58:24', '2025-05-05 14:58:24'),
('9ed649ee-43d2-4642-99f1-2da61f05c0aa', 'Sampit 2', NULL, '2025-05-05 15:00:05', '2025-05-05 15:00:05'),
('9ed64a7c-5b75-4aa8-88cd-dc1a9436133c', 'SAMARINDA - TENGGARONG - MELAK - MUARA BADAK', NULL, '2025-05-05 15:01:38', '2025-05-05 15:01:38'),
('9ed64aa1-ab9a-4ca8-8a6f-f217ca1db7f0', 'BALIKPAPAN - PENAJAM - TANAH GROGOT', NULL, '2025-05-05 15:02:02', '2025-05-05 15:02:02'),
('9ed64aab-c50c-4388-9524-263f73d51f39', 'BONTANG - SANGATTA - WAHAU', NULL, '2025-05-05 15:02:09', '2025-05-05 15:02:09'),
('9ed64ab4-4911-428e-a5ce-c3845360bf2f', 'TARAKAN - TANJUNG REDEP - TANJUNG SELOR - TANA TIDUNG', NULL, '2025-05-05 15:02:15', '2025-05-05 15:02:15'),
('9ed6cdb8-f144-444e-b756-493f7f849a1b', 'Padang Bulan- Kutacane', NULL, '2025-05-05 21:08:36', '2025-05-05 21:08:36'),
('9ed6cdc0-119d-4e71-a37e-79334205af23', 'Delitua-Katamso-medan kota', NULL, '2025-05-05 21:08:41', '2025-05-05 21:08:41'),
('9ed6cdc7-67cb-4795-abed-873adc8816b6', 'Sunggal-Setia Budi', '2025-05-05 21:10:19', '2025-05-05 21:08:45', '2025-05-05 21:10:19'),
('9ed6cdc7-c6be-4dcd-9291-73fcd0f9953c', 'Sunggal-Setia Budi', NULL, '2025-05-05 21:08:46', '2025-05-05 21:08:46'),
('9ed6cdd0-c884-4e14-9bd3-faec8d071963', 'Kabanjahe-sidikalang', NULL, '2025-05-05 21:08:52', '2025-05-05 21:08:52'),
('9ed6cde9-9ebf-46f3-b97f-08d168409eec', 'Lubuk Pakam-Perbaungan', NULL, '2025-05-05 21:09:08', '2025-05-05 21:09:08'),
('9ed6ce09-186c-468f-a31e-fad845a60abf', 'Tembung-Marelan-Binjai-Langkat', NULL, '2025-05-05 21:09:28', '2025-05-05 21:09:28'),
('9ed6cf55-ddb6-4270-bc86-015e6f204f97', 'Krakatau', NULL, '2025-05-05 21:13:07', '2025-05-05 21:13:07'),
('9ed6d70e-c596-40d7-a6ce-5de62b5558af', 'Tanjung Balai', NULL, '2025-05-05 21:34:42', '2025-05-05 21:34:42'),
('9ed6d726-a04c-4e90-bf4b-0267df5eb869', 'Tebing Tinggi', NULL, '2025-05-05 21:34:58', '2025-05-05 21:34:58'),
('9ed6d80d-2c25-4111-a738-d9d5ef15ab3a', 'Pematang Siantar I-Perdagangn', NULL, '2025-05-05 21:37:29', '2025-05-05 21:37:29'),
('9ed6d87f-ab0d-4ccc-bf2c-ed71de09436d', 'Pematang Siantar II', NULL, '2025-05-05 21:38:44', '2025-05-05 21:38:44'),
('9ed6d8a3-fe00-4689-80f1-6117307b41d2', 'Balige-  Tarutung', NULL, '2025-05-05 21:39:08', '2025-05-05 21:39:08'),
('9ed6daac-672b-4224-9b99-d8a2019aeccc', 'Pekanbaru I', NULL, '2025-05-05 21:44:49', '2025-05-05 21:44:49'),
('9ed6dab3-a9dc-491d-9265-ef936a13a68f', 'Pekanbaru II', NULL, '2025-05-05 21:44:53', '2025-05-05 21:44:53'),
('9ed6dabb-04b4-41ed-bd1f-75511806c480', 'Pekanbaru III', NULL, '2025-05-05 21:44:58', '2025-05-05 21:44:58'),
('9ed6dba7-5065-4341-82c2-9b8566833f2c', 'Muara Bungo', NULL, '2025-05-05 21:47:33', '2025-05-05 21:47:33'),
('9ed9b3e0-d5ce-401f-9061-5bdd6102a668', 'Vacant', NULL, '2025-05-07 07:43:49', '2025-05-07 07:43:49'),
('9ee0d547-4844-4001-94e7-b66dcd1a86ed', 'RENGASDENGKLOK', NULL, '2025-05-10 13:48:00', '2025-05-10 13:48:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bug_reports`
--

CREATE TABLE `bug_reports` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bug_reports`
--

INSERT INTO `bug_reports` (`id`, `user_id`, `title`, `content`, `gambar`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9ede0c49-9f82-45a3-bfdf-60493954275e', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'Saran', 'Dashboard Super admin pada pengajuan dokter bisa di klik', 'PpSDixMXYBvIsVzLwdpMhW40g3WmSvnZecpiqo5v.png', 'selesai', NULL, '2025-05-09 04:34:20', '2025-05-09 04:34:20'),
('9ede0cb9-8e9d-4209-8c4a-bb276ae6c673', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'Bug', 'Super Admin Tidak Absen', 'b54WU6RRMuOfYn9jDnH5EC55n5NnSoacP8Lyx8Hq.png', 'selesai', NULL, '2025-05-09 04:35:34', '2025-05-09 04:35:34'),
('9ede396c-28b2-458a-bfbd-4ee87b8acb3c', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'User', 'Admin 1\r\n- Regionn 6 s/d 10\r\n\r\nAdmin 2\r\n- Region 1 s/d 5', NULL, 'pending', NULL, '2025-05-09 06:40:33', '2025-05-09 06:40:33'),
('9ede39c5-efa6-4c86-bd53-d2f012458582', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'Approval Pengajuan Dokter', 'Approval 1 AM\r\nApproval 2 RSM', NULL, 'pending', NULL, '2025-05-09 06:41:32', '2025-05-09 06:41:32'),
('9ee0dd52-d7e3-4119-b32d-8cb21c906a77', '0e9da98c-b11d-4038-a45b-2945f692a805', 'Bug Pengajuan Dokter', 'Saya telah testing untuk ROLE MR sebagai galih dan AM Vaisal, approval pada pengajuan dokter tidak muncul', '0DU1FbLHrPSl54GvVm7RdWTo0W7a5DvWkojQaoDC.png', 'selesai', NULL, '2025-05-10 14:10:30', '2025-05-10 14:10:30'),
('9ee2dc3d-e794-4730-b0aa-0b40fa879f48', '9ee1017f-7364-4ae3-8c57-14dd2bb25e91', 'Dashboard AM', 'Dashboard AM masih belum ada isi', 'Fn6QwxJJNbqhKP5hLWepHSS5rZ9r1htVroMm7uZU.png', 'pending', NULL, '2025-05-11 13:59:08', '2025-05-11 13:59:08'),
('9ee2dea7-c8d9-44ac-97b0-700afa24c2d4', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'Dashboard RSM', 'Dashboard RSM masih belum ada', 'L0v2Swvg3gh7RsgzY17ZLDX5SC7gYkLbyLmA0D0R.png', 'pending', NULL, '2025-05-11 14:05:53', '2025-05-11 14:05:53'),
('9ee2ded3-8ac7-4e05-9761-8bb8192a140d', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'Dashbord NSM', 'Dashboard NSM masih belum ada', '6U92vpeYDIZ0CElxGe2LNRyzclm3O2Z56IuvEuGX.png', 'pending', NULL, '2025-05-11 14:06:22', '2025-05-11 14:06:22'),
('9ee2df9f-8f7a-4522-b193-4d6d5938fd19', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'Middleware', 'Middleware masing masing role masih bisa di akses oleh role lain', 'CEhMhpRDi9VOraOYTNbqXRriUJXXoDesxOC0xsVL.png', 'pending', NULL, '2025-05-11 14:08:35', '2025-05-11 14:08:35'),
('9ee2e0bb-b23e-44e7-9648-9d0fa5b998fb', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'Bug Daftar Laporan (Role AM)', 'Di halaman daftar laporan, di Role AM bisa memunculkan masing masing MR-nya. Namun, untuk AM sendiri datanya tidak ada', 'qYyBabKYVmOUvzmIMTd6argnZfRJQTvUTejXIQXP.png', 'pending', NULL, '2025-05-11 14:11:41', '2025-05-11 14:11:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daily_visits`
--

CREATE TABLE `daily_visits` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dokter_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instansi_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu_kunjungan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kunjungan` enum('remiding','garapan','lainnya') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kunjungan_lainnya` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keperluan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('selesai','progress','tidak_terpenuhi') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'progress',
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_target` date DEFAULT NULL,
  `tanggal_realisasi` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokters`
--

CREATE TABLE `dokters` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instansi_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spesialis_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wilayah_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dokter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_rumah` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `alamat_praktek` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bank_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atas_nama_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atas_nama_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekening_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rekening_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekening_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dokters`
--

INSERT INTO `dokters` (`id`, `instansi_id`, `spesialis_id`, `wilayah_id`, `dokter`, `email`, `instagram`, `no_hp`, `alamat_rumah`, `alamat_praktek`, `bank_1`, `bank_2`, `bank_3`, `atas_nama_1`, `atas_nama_2`, `atas_nama_3`, `rekening_1`, `rekening_2`, `rekening_3`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9ed6062e-4335-4369-a1b6-5ddf58645fa2', '01a73bd7-a6db-41eb-9c9b-caf32b572c13', '9801e155-9bcc-4586-81d4-e405315e03d4', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Christien Agitha Ratmanasuci, Sp.U.', 'info@mulyamedicalcentre.com', NULL, '085711115140', 'Jl Kapten Halim No 73 Pasawahan Purwakarta', NULL, 'BCA', NULL, NULL, 'Christien Agitha', NULL, NULL, '2233323', NULL, NULL, '2025-05-05 12:41:53', '2025-05-05 11:50:38', '2025-05-05 12:41:53'),
('9ed6184a-64b7-49a0-a687-0c95389e045e', '791bfa37-b38d-4f0b-a777-67befdafa216', 'a8e40681-4d91-4315-ade1-c573a29518d1', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Alexander Welliangan Sp.Pd', 'Alexander@gmail.com', NULL, '0811431183', 'Gorontalo', 'Jln Panjaitan 34 Gtlo', 'BCA', NULL, NULL, 'Alexander Welliangan', NULL, NULL, '827388', NULL, NULL, NULL, '2025-05-05 12:41:17', '2025-05-05 12:41:17'),
('9ed61fbb-0719-4c56-94f6-608be3ef13d8', '69d759cd-567f-4853-a972-4a1581c1b031', '2e757673-0a53-44ef-866b-a86111608127', 'c415a75a-2969-11f0-bda6-bc2411c0ee13', 'dr. Ananta Fittonia Benvenuto SpA', 'anata@gmail.com', NULL, '085228014780', 'Jl. Jupiter Raya No. 15 Telagawaru', 'Telaga Waru, Kec. Labuapi', 'BCA', NULL, NULL, 'ANATA', NULL, NULL, '9128039821', NULL, NULL, NULL, '2025-05-05 13:02:05', '2025-05-05 13:02:05'),
('9ed6204c-96f8-4ecc-99c4-c3b573ed30b0', 'd5ec583c-ce18-4c6e-b0d1-7f2e650c23ab', '2e757673-0a53-44ef-866b-a86111608127', 'c415a75a-2969-11f0-bda6-bc2411c0ee13', 'dr. Gede Sugiarta SpA', 'gede@gmai.com', NULL, '087765555466', '-', 'Jl. S. Parman No 02 Kauman Praya, Lombok Tengah', 'BCA', NULL, NULL, 'GEDE', NULL, NULL, '08120021980', NULL, NULL, NULL, '2025-05-05 13:03:40', '2025-05-05 13:03:40'),
('9ed62151-2783-46ef-a304-a9501e2d7f15', '28bb8271-db91-4010-8087-ef8e1191c54e', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a75a-2969-11f0-bda6-bc2411c0ee13', 'dr. Indri Hapsari SpA', 'indri@gmail.com', NULL, '087765555466', '-', 'Jl. H. Lalu Anggrat BA No. 2, Gerung, Gerung Utara, Kec. Gerung', 'BCA', NULL, NULL, 'indri', NULL, NULL, '2131231213', NULL, NULL, NULL, '2025-05-05 13:06:31', '2025-05-05 13:06:31'),
('9ed621d6-bf90-4f07-8540-a5a5083ab650', 'e544373e-5943-4302-836b-3db242436b2f', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Nurul Fuada Sp.Og', 'nurul@gmail.com', NULL, '082349994070', 'Gorontalo', 'Klinik Mulia Pratama/Jl A. Yani 12 Gtlo', 'BCA', NULL, NULL, 'Nurul', NULL, NULL, '1123', NULL, NULL, NULL, '2025-05-05 13:07:59', '2025-05-05 13:07:59'),
('9ed621fd-a30c-413c-9a84-65a918ace1fd', '9bf0d093-7a43-4412-afa4-b9306e08d11a', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a75a-2969-11f0-bda6-bc2411c0ee13', 'dr. Kadek Apik Lestari,SpA', 'kadek@gmail.com', NULL, '081339854541', '-', 'Jln. Gajah Mada No. 9-10 Jempong', 'BCA', NULL, NULL, 'KADEK', NULL, NULL, '90129082910', NULL, NULL, NULL, '2025-05-05 13:08:24', '2025-05-05 13:08:24'),
('9ed6233c-2448-4ab6-8d2b-8402c788c68d', 'be3914e8-ee12-4f50-90ed-97d8449690ef', '67926b37-2547-448f-afc4-3d3cb7abbaf6', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Junus Lihawa Sp.B', 'junus@gmail.com', NULL, '085497498602', 'Jl Suktan Botutihe kel tamlate', 'Rsud Toto Kabila', 'BCA', NULL, NULL, 'junus', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:11:53', '2025-05-05 13:11:53'),
('9ed623aa-32f5-4c68-a6cd-40f66db45f0e', 'e70d1137-d784-402d-8aa8-5ddd04dfae48', '84e557a6-938e-4810-9826-db999c7eaf85', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Irma Suryani Darise Spot', 'irma@gmail.com', NULL, '081342262361', 'Gorontalo', 'Rsud Aloe Saboe Kota Gorontalo', 'BCA', NULL, NULL, 'irma', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:13:05', '2025-05-05 13:13:05'),
('9ed6240a-b954-4eb5-86cf-31ecdde74d8b', 'fd0f365a-76db-415a-a3a8-90aa503f9ebc', 'a8e40681-4d91-4315-ade1-c573a29518d1', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Ferdiyanto Da\'I Sppd', 'ferdi@gmail.com', NULL, '085290206767', 'Gorontalo Utara', 'Rsud Zainal Umar Sidiki  Gorontalo Utara', 'BCA', NULL, NULL, 'ferdi', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:14:08', '2025-05-05 13:14:08'),
('9ed624fc-dc60-4fed-bfca-daa9eef35f8e', 'afe6049c-ea06-4954-9a98-3f49a8ee821f', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Benny S Moningka Sp.Og', 'benny@gmail.com', NULL, '081211888420', 'Boalemo', 'Rsud Tani Dan Nelayan Boalemo', 'BCA', NULL, NULL, 'benny', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:16:47', '2025-05-05 13:16:47'),
('9ed6254f-040d-4130-ace1-4e1aaecf0451', 'ecbdcdd7-e17a-4505-9b6e-7ec2becbd23b', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Sukmawati Djakatara Spog', 'sukma@gmail.com', NULL, '082296525808', 'Kota Gorontalo', 'Rsud Iwan Boking,S Boalemo', 'BCA', NULL, NULL, 'sukma', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:17:41', '2025-05-05 13:17:41'),
('9ed625c8-bce5-49fe-baac-ca51fadfd902', '201fda03-5987-439f-a476-83b89b412c58', 'ad826c45-8aeb-4b25-a90a-11c0c7680e32', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Moh Bahtiar Fandi Sps', 'bahtiar@gmail.com', NULL, '08529902264', 'Marisa', 'Rsud Pohuwato Marisa', 'BCA', NULL, NULL, 'bahtiar', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:19:01', '2025-05-05 13:19:01'),
('9ed6262a-f1e8-4923-b855-7bb5a00d1033', '5cc76ed2-e03e-4aad-aa1e-16ead92d1c8e', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Friska Harun Spa', 'harun@gmail.com', NULL, '0822210100', 'Jl Hb Yasi Kota Gorontalo', 'Rsud Aloe Saboe', 'BCA', NULL, NULL, 'Harun', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:20:05', '2025-05-05 13:20:05'),
('9ed6268d-9a96-4d81-ac05-6c2e1e9e6b31', 'be3914e8-ee12-4f50-90ed-97d8449690ef', '9801e155-9bcc-4586-81d4-e405315e03d4', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Dr Romy Wijaya Spkk', 'romy@gmail.com', NULL, '08529902264', 'Gorontalo', 'Rsud Toto Kabila', 'BCA', NULL, NULL, 'wijaya', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:21:10', '2025-05-05 13:21:10'),
('9ed6279a-c64e-4bb9-a1dc-e3ae32c704e0', 'd55848bd-157f-4c42-8f97-f8823bae0f34', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Management Rs Multazam', 'multazam@gmail.com', NULL, '0822272214026', 'Jl Gelatik Kota Gorontalo', 'Jl Gelatik Kota Gorontalo', 'BCA', NULL, NULL, 'azam', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:24:06', '2025-05-05 13:24:06'),
('9ed627c7-707d-4439-80f3-5365d1504dd3', 'd55848bd-157f-4c42-8f97-f8823bae0f34', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Management Rs Multazam', 'azam@gmail.com', NULL, '0822272214026', 'Jl Gelatik Kota Gorontalo', 'Jl Gelatik Kota Gorontalo', 'BCA', NULL, NULL, 'azam', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:24:35', '2025-05-05 13:24:35'),
('9ed62876-0148-4aa9-8e65-ae6fc3cb72fb', '9313aa26-24a6-4270-b7b9-c04482e53ee8', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Nursani Taha S. Farm.Apt', 'taha@gmail.com', NULL, '081340888328', 'Gorontalo', 'Instalasi Farmasi Rsia Sitti Khadidjah', 'BCA', NULL, NULL, 'taha', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:26:30', '2025-05-05 13:26:30'),
('9ed628c5-ca2c-43ab-9d10-7f3b975bf431', 'eda39ef9-dc0d-476e-a041-ef033360dcd0', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'Muh Usman Nur  S Farm Apt', 'muh@gmail.com', NULL, '082347606426', 'Gorontalo', 'Ap Rissa', 'BCA', NULL, NULL, 'muh', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:27:22', '2025-05-05 13:27:22'),
('9ed6293a-da74-49dd-b589-a589897cf7a7', 'c142bd7d-d668-43e8-affc-d43c651958ff', '89aff25b-fd8f-4f8e-bfce-f54d4fbc89a1', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Rodrigo Limmon,Sp.Tht', 'rod@gmail.com', NULL, '081343322033', 'Jl Dewi Sartika, Karang Panjang', 'Jl. Anthony Rebok', 'BCA', NULL, NULL, 'rod', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:28:39', '2025-05-05 13:28:39'),
('9ed629a3-9902-479b-8267-ba21098c3f30', '927dc2d5-62ba-4b23-81da-e62b9ea31b89', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Nurhasan', 'nurhasan@gmail.com', NULL, '081383730873', NULL, 'Jl. Anthony Rebok', 'BCA', NULL, NULL, 'nurhasan', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 13:29:47', '2025-05-05 13:29:47'),
('9ed6351b-63f5-429f-ab88-9ef0bc853bba', 'c2b21787-a998-4337-b73d-140e3ebaa9d3', 'bd3c7a33-af31-40dd-b7d8-e294d64c0ecf', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Oktofina Moses,Sp.An', 'okto@gmail.com', NULL, '08124620793', 'Jl Imam Bonjol No 324 Masohi', 'Ap Mutiara Masohi', 'BCA', NULL, NULL, 'okto', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:01:51', '2025-05-05 14:01:51'),
('9ed6356a-ea1f-4d59-b1d1-7aa0797f7b93', '10cc0767-1f1f-478b-ad32-a25130d9ecf7', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Sofyan Laiya', 'sofyan@gmail.com', NULL, '082125222298', 'Jln Ampera Kota Masohi', 'Ap17', 'BCA', NULL, NULL, 'sofyan', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:02:43', '2025-05-05 14:02:43'),
('9ed635c8-e919-459b-a7e8-5b03eaeb5c36', 'c2b21787-a998-4337-b73d-140e3ebaa9d3', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Iin Iluwan', 'lin@gmail.com', NULL, '082147911538', 'Jln Asmil No 731 Karabesi', 'Ap Mutiara Masohi', 'BCA', NULL, NULL, 'Lin', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:03:45', '2025-05-05 14:03:45'),
('9ed636c1-0102-4c07-97f9-6d673c9c9765', '03764674-58b0-4c5d-9986-5947d8cd0dc4', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Emanuella Yefta,Sp.A', 'emma@gmail.com', NULL, '08122019802', 'Jl Putu Ina Karang Panjang', 'Ap Happy Kids', 'BCA', NULL, NULL, 'emma', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:06:28', '2025-05-05 14:06:28'),
('9ed63727-d7ac-49b1-b176-f4868289df7f', '03764674-58b0-4c5d-9986-5947d8cd0dc4', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Dr Rudy Gunawan', 'rudy@gmail.com', NULL, '081343076671', 'Jl Putu Ina Karang Panjang', 'Ap Happy Kids', 'BCA', NULL, NULL, 'rudy', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:07:35', '2025-05-05 14:07:35'),
('9ed637da-ecd0-4137-a623-4ce4495ab475', 'feed2cf3-b898-46a7-8e0e-976b799f89ac', '7880df51-4cff-4297-bbf6-81ff45b5ac0d', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Indah Pratiwi,Sp,Jp', 'indah@gmail.com', NULL, '081311652327', 'Jl Komp Setia Budi Permai Blok 1A', 'Dr.J.A.Latumeten Ambon', 'BCA', NULL, NULL, 'indah', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:09:32', '2025-05-05 14:09:32'),
('9ed63822-a27f-4402-8146-57e481008abd', '60496554-99bd-4e45-bfbf-df80c9e9a705', '89aff25b-fd8f-4f8e-bfce-f54d4fbc89a1', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Julu Manalu,Sp.Tht', 'julu@gmail.com', NULL, '081247277607', 'Jl Perumahan Dinas Kuda Mati', 'Ap Valentine', 'BCA', NULL, NULL, 'julu', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:10:19', '2025-05-05 14:10:19'),
('9ed63870-ebb7-4aa1-b148-5c857bb4a281', '285be21c-545a-4a6d-a12e-92cb3e3efce3', 'a8e40681-4d91-4315-ade1-c573a29518d1', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', 'Sofyan Umarella,Sp.Pd', 'uma@gmail.com', NULL, '082198334655', 'Jl Soabali', 'Ap Nenglinjte', 'BCA', NULL, NULL, 'uma', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:11:11', '2025-05-05 14:11:11'),
('9ed638ef-0903-4371-91c2-d22a289f1637', '157db596-7aa7-49b5-aae2-dc7470d6390a', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Dr. Dzatur Rizqi Fathienah S., Sp.Og', 'dzatur@gmail.com', NULL, '082219995023', 'Jeneponto', 'Apt. Cahaya Farma', 'BCA', NULL, NULL, 'dzatur', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:12:33', '2025-05-05 14:12:33'),
('9ed639d4-0765-4e1f-859a-1011aa5254cc', '2c9bf674-772b-49a6-a00f-1196f95282ce', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Dr. Muhammad Asnan Sahar', 'asnan@gmail.com', NULL, '082393130636', 'Jeneponto', 'Apt. Dhani,', 'BCA', NULL, NULL, 'asnan', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:15:03', '2025-05-05 14:15:03'),
('9ed63a38-45c3-4707-b9fd-5c7b1f971246', 'bdf7027a-0f03-4fe9-871d-cead816c7c3d', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Fadli Akbar', 'fadli@gmail.com', NULL, '081243482644', 'Jeneponto', 'Apt. Dhani 02 Jeneponto', 'BCA', NULL, NULL, 'fadli', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:16:09', '2025-05-05 14:16:09'),
('9ed63a92-fe08-4e75-ada5-cbc811371f0c', '2c9bf674-772b-49a6-a00f-1196f95282ce', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Sonia Purnama Arsan', 'sonia@gmail.com', NULL, '085643219358', 'Jeneponto', 'Apt. Dhani,', 'BCA', NULL, NULL, 'sonia', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:17:09', '2025-05-05 14:17:09'),
('9ed63ae1-fc58-4ea0-87be-3c47fa58c20b', 'c03ddb68-fd6b-4858-a40b-d0df4b284263', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Dr. Nurbani Bangsawan, Sp.Og', 'nurbani@gmail.com', NULL, '0811423092', 'Perum Taman Gosyen Indah No 1,Jl Hertasning Baru', 'Jl. Hertasning', 'BCA', NULL, NULL, 'nurbani', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:18:00', '2025-05-05 14:18:00'),
('9ed63b45-8baf-4b7f-b717-2645cb356912', '84d8da4d-dce5-4aa1-9e62-761dbca87f0f', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'A. Astriyani Harun', 'astri@gmail.com', NULL, '082347935714', 'Jl Lasinrang Makassar', 'Jl Lasinrang Makassar', 'BCA', NULL, NULL, 'astri', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:19:06', '2025-05-05 14:19:06'),
('9ed63ba5-2177-4b72-8308-fa8f935e58dd', '8e400e24-bb65-428a-b9ea-01e55ddb7ce8', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Nurul Izzah', 'izz@gmail.com', NULL, '081356442951', NULL, 'Apt. Graha Medika Wirahusada', 'BCA', NULL, NULL, 'izz', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:20:08', '2025-05-05 14:20:08'),
('9ed63d4e-05d7-4321-9521-400603bbb223', 'bcc0189d-e8f0-4bf1-8185-dbb851a77a49', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Dr. Elia Tombe Marrung, Sp.Og', 'elia@gmail.com', NULL, '082190246300', NULL, 'Jl. Buntu No.8A, Pantan, Kec. Makale, Kabupaten Tana Toraja, Sulawesi', 'BCA', NULL, NULL, 'elia', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:24:47', '2025-05-05 14:24:47'),
('9ed63dae-d3c4-4af5-afe8-afdbede7e94b', '92e46ede-8ab7-4e15-a562-b85ed41411af', 'a8e40681-4d91-4315-ade1-c573a29518d1', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Dr. Restu Olymulana Rantetondo, Sp.Pd', 'restu@gmail.com', NULL, '082347928988', 'Rantepao, Toraja Utara', 'Apt. Hikorla', 'BCA', NULL, NULL, 'restu', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:25:50', '2025-05-05 14:25:50'),
('9ed63e01-fd13-4aba-8de4-5fee8a6aea58', 'bcc0189d-e8f0-4bf1-8185-dbb851a77a49', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Kristiina Tumba Uwa', 'kris@gmail.com', NULL, '085394347908', 'Makale, Toraja', 'Jl. Buntu No.8A, Pantan, Kec. Makale, Kabupaten Tana Toraja, Sulawesi', 'BCA`', NULL, NULL, 'kris', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:26:45', '2025-05-05 14:26:45'),
('9ed63e69-3581-4baf-88ec-5e51fdbcf006', '9ba932aa-2357-47ac-9349-7b9906aae58a', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Dr. Maisuri,Sp.Og', 'mai@gmail.com', NULL, '0811463780', 'Jl H.A Mappanyukki 27 Rs.Restu 004/001,Mariso', 'Jl Mappayuki', 'BCA', NULL, NULL, 'mai', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-05 14:27:52', '2025-05-05 14:27:52'),
('9ed7a9cb-248b-4da1-945a-3a65ae87d714', '0a69b0eb-eec2-46f7-a2b7-a7ecaa826b60', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Andi Tenri Bayang', 'andi@gmail.com', NULL, '085255282252', 'Bantaeng', 'Ap Rs Pof Anwar Makatutu', 'BCA', NULL, NULL, 'andi', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:23:58', '2025-05-06 07:23:58'),
('9ed7aa14-012d-41c4-a918-e32e1f8e5530', 'f2a2555d-c468-4c09-8a4c-5899c31108b2', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Yayu Tri Angriyani', 'yayu@gmail.com', NULL, '081245151848', 'Makassar', 'Rs Amanat', 'BCA', NULL, NULL, 'yayu', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:24:45', '2025-05-06 07:24:45'),
('9ed7aa6f-155b-4e1d-b701-dae77fb8edee', '04f41604-044d-46d3-b04e-3c316cd73fd3', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Dr Muh Ilyas Nurdin', 'ilyas@gmail.com', NULL, '085340029847', 'Bulukumba', 'Ap Hm', 'BCA', NULL, NULL, 'Ilyas', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:25:45', '2025-05-06 07:25:45'),
('9ed7aaf9-0bd7-47f1-bdfd-228ce3705f64', '0fceb305-cdd3-4497-8403-9d12eb0c7b15', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Tanti Indrawati', 'tanti@gmail.com', NULL, '081355816999', 'Bantaeng', 'Ap Adiza', 'BCA', NULL, NULL, 'Tanti', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:27:16', '2025-05-06 07:27:16'),
('9ed7ab44-cc88-45ee-a1ad-b6232c1f1052', '7f0e54e9-72d4-49bf-b561-8bd1ce51775e', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a158-2969-11f0-bda6-bc2411c0ee13', 'Dr Agnes Tjungadi', 'agnes@gmail.com', NULL, '082290328359', 'Rantepao, Toraja', 'Ap Makmur', 'BCA', NULL, NULL, 'agnes', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:28:05', '2025-05-06 07:28:05'),
('9ed7abb1-6e19-4de5-976f-32638f97b6c2', '7693cd74-2165-4d80-980f-54a8c56ba086', '89aff25b-fd8f-4f8e-bfce-f54d4fbc89a1', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Dr. Asria Rusdi, Sp.Tht', 'asria@gmail.com', NULL, '085242904436', NULL, 'Ap Wihdah', 'BCA', NULL, NULL, 'asria', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:29:16', '2025-05-06 07:29:16'),
('9ed7abf3-8896-400e-9570-a3e606d63c6a', '13cfd558-528e-457c-9d9a-7957f686cff2', '020d6f5d-2606-4d6b-9847-112cdb793373', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Dr. Wiwi Irawan, Sp.Og', 'wiwi@gmail.com', NULL, '081299037321', 'Jln Kemerdekaan', 'Apt Nurfadillah', 'BCA', NULL, NULL, 'wiwi', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:30:00', '2025-05-06 07:30:00'),
('9ed7ac42-c746-4ecd-9f58-9835b47acc74', '67203f51-a056-42b6-bb96-43e702ba1bc8', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Sri Maladewisari Basir', 'mala@gmail.com', NULL, '085397979763', NULL, 'Jl. Masjid Raya, Sengkang', 'BCA', NULL, NULL, 'mala', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:30:52', '2025-05-06 07:30:52'),
('9ed7ac89-7415-47fe-9632-5d651a753471', 'a3b328b2-1f37-4807-8e8d-82ffb705e64a', '020d6f5d-2606-4d6b-9847-112cdb793373', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Dr. Amiruddin, Sp.Og', 'ami@gmail.com', NULL, '08114137641', 'Green River view,barombong', 'Jl. Sungai Saddang', 'BCA', NULL, NULL, 'ami', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:31:38', '2025-05-06 07:31:38'),
('9ed7b03d-3f62-4701-90e1-4dec1b10f967', '437d8dc3-d95d-4e3d-a01c-4bc36a25f94a', '67926b37-2547-448f-afc4-3d3cb7abbaf6', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Dr. Irwan Hasan, Sp.B', 'irwan@gmail.com', NULL, '081344288838', NULL, 'Jl. Botolempangan No. 20 Lt. 3, Sawerigading, Ujung Pandang, Makassar', 'BCA', NULL, NULL, 'irwan', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:41:59', '2025-05-06 07:41:59'),
('9ed7b08e-38bd-43bc-90e3-c859fea1a0b4', 'c5169bdc-3306-40a7-904a-b000c99e2890', '78be4356-8da0-427d-81fa-b437c2ec3e00', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Dr. Mohammad Syakur Ridho', 'syakur@gmail.com', NULL, '089665544333', 'Jl Graha Cemerlang hasanudin,Mandai maros', 'Graha Cemerlang Kompleks Blok B No. 9 Maros', 'BCA', NULL, NULL, 'syakur', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:42:52', '2025-05-06 07:42:52'),
('9ed7b0de-a86e-4c6c-bd6b-b17ee5627138', 'ab622c03-18ff-4702-ba64-fd6a9f7a5959', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Rosnawati', 'rosna@gmail.com', NULL, '085256415559', 'H Hamka,Coppo,Kel Barru', 'Jl. H. M. Sewang Barru', 'BCA', NULL, NULL, 'rosna', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:43:45', '2025-05-06 07:43:45'),
('9ed7b12d-ec9a-4527-a6c4-2a4ca067ffe9', '437d8dc3-d95d-4e3d-a01c-4bc36a25f94a', 'a8e40681-4d91-4315-ade1-c573a29518d1', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Dr. Ivan Velentino, Sp.Pd', 'ivan@gmail.com', NULL, '08124226061', 'Perumahan Mega Ma Jln Perintis Kemerdekaan', 'Jln Botolempangan No 20', 'BCA', NULL, NULL, 'ivan', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:44:37', '2025-05-06 07:44:37'),
('9ed7b178-ef65-4697-8c98-426f2f744201', '66edbe5a-dd06-426d-8c58-f50a3a23fb4c', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Arnida Makmur (Kl Budi Lestari)', 'arnida@gmail.com', NULL, '081342913829', 'Jl Compo Tompong Pangkep', 'Kl Budi Lestari', 'BCA', NULL, NULL, 'arnida', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:45:26', '2025-05-06 07:45:26'),
('9ed7b1e0-2cf3-4077-b050-4cd1c9772749', '68f6b360-efab-4d21-9861-4228f0368a95', '020d6f5d-2606-4d6b-9847-112cdb793373', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'Maria Kabangnga,Sp.Og', 'maria@gmail.com', NULL, '08115900577', 'Jl Mawar', 'Ap Nur Wahyu', 'BCA', NULL, NULL, 'maria', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:46:34', '2025-05-06 07:46:34'),
('9ed7b23f-7617-481d-ad7d-92302ba18f7d', '65f4d2c4-f902-4fa7-ba32-08ee926cfd9c', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a452-2969-11f0-bda6-bc2411c0ee13', 'Dr. Andi Fatmawati Rachman, Sp.A', 'rach@gmail.com', NULL, '08112693105', NULL, 'Jl Yos Sudarso,Pinrang', 'BCA', NULL, NULL, 'rach', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:47:36', '2025-05-06 07:47:36'),
('9ed7b28b-704d-48d3-980f-928f63d1c9a2', 'c9e1fb06-a9c1-45f4-af24-1606ea64223a', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a452-2969-11f0-bda6-bc2411c0ee13', 'Dr. Yulianty, Sp.A', 'yuli@gmail.com', NULL, '085240742297', 'Jl. Guru M. Amin No. 25 Pare - Pare', 'Apt. Denai', 'BCA', NULL, NULL, 'yuli', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:48:26', '2025-05-06 07:48:26'),
('9ed7b2e6-dc47-4534-8cb2-11d5d6946dc4', '6bcc4687-c59d-4ced-b541-4d5db8b4130d', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a452-2969-11f0-bda6-bc2411c0ee13', 'Nuryadin Tahiruddin', 'nur@gmail.com', NULL, '085776573794', 'Jl Garuda No 2A Sidrap', NULL, 'BCA', NULL, NULL, 'nur', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 07:49:26', '2025-05-06 07:49:26'),
('9ed7b9be-66b4-4345-9d45-624d6045a3e1', 'd13e35d7-bfa0-43c4-8b7e-c20e619f323c', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'I Wayan Kariasa', 'wayan@gmail.com', NULL, '085240000825', 'Uwemanje', 'Rs Undata', 'BCA', NULL, NULL, 'wayan', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:08:34', '2025-05-06 08:08:34'),
('9ed7ba28-fd14-44bc-b511-9513f17153ad', 'adc2889e-3470-4a52-97d8-4021039e6f37', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Catur', 'catur@gmail.com', NULL, '082393966584', 'Toli-Toli', 'Dinas Kesehatan Toli-Toli', 'BCA', NULL, NULL, 'catur', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:09:44', '2025-05-06 08:09:44'),
('9ed7ba7d-f87f-45f0-8ff2-6a070b49e544', '33b4ff9e-bf4e-490e-b6ac-5653387c220f', '5c889ffa-50b2-424c-8f20-5e448386e163', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Drg Herlina Hafid', 'her@gmail.com', NULL, '085298722140', 'Jl Simpati Air', 'Jl Imam Bonjol', 'BCA', NULL, NULL, 'her', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:10:39', '2025-05-06 08:10:39'),
('9ed7bacd-1ab1-4777-b711-872c5f73a648', '825197e2-5605-463f-9c59-a23b71b6ddd4', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Dr Subhan Habibi', 'sub@gmail.com', NULL, '081234666651', 'Jl Re Martadinata', 'Jl Mangga', 'BCA', NULL, NULL, 'Sub', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:11:31', '2025-05-06 08:11:31'),
('9ed7bb14-ba99-4d12-83f7-eb9c4c52f0ad', '25fd3bfd-84fb-4ccd-9da4-8a8ea1c6835e', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Dimas Bagus Prastyo,Sp.A', 'bagus@gmail.com', NULL, '085234777277', 'Jln Btn Kerajalemba', 'Jl Imambonjol', 'BCA', NULL, NULL, 'bagus', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:12:18', '2025-05-06 08:12:18'),
('9ed7bc13-af38-4498-b4bc-af6bb5757089', '0e374396-e539-4bd4-9088-d91d3897b3a3', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Dr Ni Putu Ripna Oktaviani', 'putu@gmail.com', NULL, '085256006073', 'Jl Kijang', 'Jln Thalua Konchi', 'BCA', NULL, NULL, 'putu', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:15:05', '2025-05-06 08:15:05'),
('9ed7bc56-7c7f-47c5-8344-3c2c404a9a02', '0e374396-e539-4bd4-9088-d91d3897b3a3', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Nurhalisyah', 'hali@gmail.com', NULL, '081243434464', 'Jln Trans Mamboro', 'Jln Thalua Konchi', 'BCA', NULL, NULL, 'hali', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:15:49', '2025-05-06 08:15:49'),
('9ed7bc9c-540c-4c72-9b9a-5767bc6ce281', '0e374396-e539-4bd4-9088-d91d3897b3a3', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Dr Nurhidayah', 'hida@gmail.com', NULL, '081273020124', 'Jln Tombolotutu', 'Jln Thalua Konchi', 'BCA', NULL, NULL, 'hida', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:16:35', '2025-05-06 08:16:35'),
('9ed7bce5-6c5f-4a26-aaab-19bd18ac8012', '949e57cd-f804-482c-98a4-e05ed9966aaa', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Andi Amsyar Praja,Sp.A', 'amsyar@gmail.com', NULL, '081341019497', 'Jl Brigjend Katamso', 'Jl Brigjend Katamso', 'BCA', NULL, NULL, 'amsyar', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:17:23', '2025-05-06 08:17:23'),
('9ed7bd36-1cc6-4330-9431-065b938a951c', '5cf7471f-a343-4ed3-8401-03d847a3cbd9', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Stephen Son Santigi', 'stephen@gmail.com', NULL, '082347498428', 'Tentena', 'Rsud Sinar Kasih Gkst Tentena', 'BCA', NULL, NULL, 'stephen', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:18:15', '2025-05-06 08:18:15'),
('9ed7bd80-3d2a-464e-8a9b-ab8d65f14f18', 'b5ede08c-761f-4f36-b6f9-5f90d011f60c', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Dr Irene Mahakena', 'irene@gmail.com', NULL, '081341027697', 'Jl Kijang Ii No 19 Palu', 'Rsud Torabelo Sigi', 'BCA', NULL, NULL, 'irene', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:19:04', '2025-05-06 08:19:04'),
('9ed7bdd5-5a00-46a8-83c4-490d42ba7015', '5647d2af-d93e-4363-86ab-eb24e25cad88', '67926b37-2547-448f-afc4-3d3cb7abbaf6', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Alfreth Langitan,Sp.B', 'alfreth@gmail.com', NULL, '0811450262', 'Jl Samratulangi', 'Jl Samratulangi', 'BCA', NULL, NULL, 'alfreth', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:20:00', '2025-05-06 08:20:00'),
('9ed7be1d-356a-468c-a15d-368aad7308ff', '5bc60136-c867-4f6b-a967-7007d975074c', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Dr Ilmawati', 'wati@gmail.com', NULL, '085399004432', 'Jln Ir Soekarno Kec Pasangkayu', 'Pasangkayu', 'BCA', NULL, NULL, 'wati', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:20:47', '2025-05-06 08:20:47'),
('9ed7be67-66e2-4f16-83c2-b8466b21f9b4', '589224a5-eb8e-4871-8aa1-de68eb2fca3e', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a685-2969-11f0-bda6-bc2411c0ee13', 'Ibu Darmawanti', 'darma@gmail.com', NULL, '081212488586', NULL, 'Morowali', 'BCA', NULL, NULL, 'darma', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:21:36', '2025-05-06 08:21:36'),
('9ed7c974-0c5e-4ceb-b960-29657fbbf83c', 'b5052430-0340-4b19-b6a8-d446615fd502', '9801e155-9bcc-4586-81d4-e405315e03d4', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Astrid Laurentia Harianto, Sp.Kk', 'astrid@gmail.com', NULL, '081241047508', 'Jl. Ahmad Yani No. 149 Kendari', 'Jl. Ahmad Yani No. 149 Kendari', 'BCA', NULL, NULL, 'astrid', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:52:29', '2025-05-06 08:52:29'),
('9ed7cb40-629e-47f8-a7b1-3c7d3d1f9c16', '0d2813fc-8975-4c27-9497-816b48917755', 'deccc142-aea4-4a9c-b62b-436702334fe4', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Handi Priambodo, Sp.P', 'handi@gmail.com', NULL, '08123185027', 'Perumahan dinas rumah sakit konawe', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe', 'BCA', NULL, NULL, 'handi', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:57:31', '2025-05-06 08:57:31'),
('9ed7cb95-71a9-4660-b9cd-cc0c3efdb237', '714830db-6b05-4422-9ac9-272ddf3d8cc7', 'a8e40681-4d91-4315-ade1-c573a29518d1', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. M. Yusuf Hamra, Sp.Pd', 'hamra@gmail.com', NULL, '081392617790', 'jln DI panjaitan kendari', 'Jl. Ahmad Yani No. 149 Kendari', 'BCA', NULL, NULL, 'hamra', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 08:58:27', '2025-05-06 08:58:27'),
('9ed7cc6a-2aa2-4d2a-b50b-7009ba38f48e', 'ddedd2f5-3fd2-4525-be9b-3881f7c3d7b8', 'fe137aa3-74c1-4c89-88e9-2c1282e78cc2', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Melvin Manuel Philips, Sp.M', 'melvin@gmail.com', NULL, '082193224818', 'citraland kendari', 'Jl. Buburanda, Sorumba, Mandonga', 'BCA', NULL, NULL, 'melvin', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:00:46', '2025-05-06 09:00:46'),
('9ed7ccb7-b5de-416b-8a30-ac981ddc9a66', '9a9018cf-c48c-4b1e-9696-ac3eb1699578', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Nur Indah Purnamasari, Sp.Og', 'purna@gmail.com', NULL, '081257444400', 'kendari', 'Jl. Jend. M.T. Haryono, Bende, Kadia, Kendari', 'BCA', NULL, NULL, 'purna', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:01:37', '2025-05-06 09:01:37'),
('9ed7cd01-da2a-428b-8371-4e30373b64a3', '0d2813fc-8975-4c27-9497-816b48917755', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Rafika, Sp.A', 'rafika@gmail.com', NULL, '081355447144', 'Perumahan dinas rumah sakit konawe', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe', 'BCA', NULL, NULL, 'rafika', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:02:26', '2025-05-06 09:02:26'),
('9ed7cd54-0652-40d3-9670-aecef9e40991', '0d2813fc-8975-4c27-9497-816b48917755', 'a8e40681-4d91-4315-ade1-c573a29518d1', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Rony Kendyartanto, Sp.Pd', 'rony@gmail.com', NULL, '081228696071', 'Perumahan dinas rumah sakit konawe', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe', 'BCA', NULL, NULL, 'rony', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:03:19', '2025-05-06 09:03:19'),
('9ed7cda1-bf9a-42ae-9f90-013989d73e4d', '59e4135d-a4f0-4340-ad1c-d28b6cfb140e', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Suhartini, Sp.Og', 'suhartini@gmail.com', NULL, '08114055212', 'Jl. D.I. Panjaitan No. 243 Kendari', 'Jl. D.I. Panjaitan No. 243 Kendari', 'BCA', NULL, NULL, 'suhartini', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:04:10', '2025-05-06 09:04:10'),
('9ed7ce8f-2809-470d-b0f4-b3c9eb4ffe96', '0d2813fc-8975-4c27-9497-816b48917755', '67926b37-2547-448f-afc4-3d3cb7abbaf6', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Taufiq Ardianto, Sp.B', 'taufiq@gmail.com', NULL, '085299427382', 'perumahan dinas rs bahteramas', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe', 'BCA', NULL, NULL, 'taufiq', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:06:46', '2025-05-06 09:06:46'),
('9ed7ced1-a0c4-4e0a-8d60-efe8d115acb8', '7ec2cea3-7fa9-44e8-a338-fbdaf8cd45d6', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Hikmah Satriani', 'hikmah@gmail.com', NULL, '085333375019', 'Jl. Prof. Dr. Abdurrauf Tarimana, Kambu, Kendari', 'Jl. Di Panjaitan No.243, Lepo-Lepo, Kec. Baruga, Kota Kendari', 'BCA', NULL, NULL, 'hikmah', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:07:30', '2025-05-06 09:07:30'),
('9ed7cf36-1a91-432e-b9ef-c25a2a80ebd0', '0d2813fc-8975-4c27-9497-816b48917755', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Sri Muliana', 'muli@gmail.com', NULL, '08114099173', 'Kelurahan Rawua', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe, Sulawesi Tenggara', 'BCA', NULL, NULL, 'muli', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:08:35', '2025-05-06 09:08:35'),
('9ed7cf85-dee2-4bed-aa52-a5259b90cdfc', 'c222bd25-d20d-484c-87e6-f38bb3cf50e9', '89aff25b-fd8f-4f8e-bfce-f54d4fbc89a1', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Dewi Kurniawati, Sp.Tht', 'kurni@gmail.com', NULL, '081355010306', 'Jl. Sao Sao No. 238, Bende, Kadia, Kendari', 'Jl. Sao Sao No. 238, Bende, Kadia, Kendari', 'BCA', NULL, NULL, 'kurni', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:09:28', '2025-05-06 09:09:28'),
('9ed7cfcc-078a-40d8-9d3e-cae4a4b12ec1', '4b8cc676-cbbd-4dc6-98ee-8f261bb86ddb', '67926b37-2547-448f-afc4-3d3cb7abbaf6', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. M. Firman Kamal, Sp.B', 'kamal@gmail.com', NULL, '081341737173', 'Lantowua, Rarowatu Utara, Bombana', 'Apt. Azqishara Bombana', 'BCA', NULL, NULL, 'kamal', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:10:14', '2025-05-06 09:10:14'),
('9ed7d011-8b7f-4bed-ae7f-1e25dce862f1', 'f46a2063-ff13-40ee-97cd-0c1c34c3b62d', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Muh Alamsyah A.K.', 'alam@gmail.com', NULL, '08114001303', 'kendari', 'Jl. Buburanda, Sorumba, Mandonga, Kendari', 'BCA', NULL, NULL, 'alam', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:10:59', '2025-05-06 09:10:59'),
('9ed7d0ea-f41c-4f78-8c9c-354069e10d9f', 'a9ebb54a-5b12-4e0e-bc9e-94c5ca9020e2', '84e557a6-938e-4810-9826-db999c7eaf85', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Tri Tuti Hendarwati, Sp.Ot', 'tri@gmail.com', NULL, '081382767669', 'Komp Perumahan Grand Clarissa', 'Jl. Mayjend. Sutoyo No. 8 Kendari', 'BCA', NULL, NULL, 'tri', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:13:22', '2025-05-06 09:13:22'),
('9ed7d372-cdd4-4862-bd5d-3c8eda5b1434', '10bd42be-e65b-4443-a268-e7a87658c6de', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Agung Mas Aprilianti', 'mas@gmail.com', NULL, '08114091993', 'kendari', 'Desa Monapa No. 3 Kendari', 'BCA', NULL, NULL, 'mas', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:20:26', '2025-05-06 09:20:26'),
('9ed7d3c2-8bda-4ec0-8df9-2fbf6cb20001', '38512f92-70c8-4eef-8c20-149cf100e0bc', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Haidir Irawan', 'haidir@gmail.com', NULL, '081314015343', 'Ranomeeto, Konawe Selatan', 'Desa Onewila, Ranomeeto', 'BCA', NULL, NULL, 'haidir', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:21:19', '2025-05-06 09:21:19'),
('9ed7d414-6e9e-47b9-bde3-28260f260171', '99bbcf87-bd88-4a3a-8d92-7d88c6054846', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Muhammad Sujarwad', 'sujar@gmail.com', NULL, '08233352336', 'kendari', 'Komplek Btn Kendari Permai, Kendari', 'BCA', NULL, NULL, 'sujar', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:22:12', '2025-05-06 09:22:12'),
('9ed7d471-4638-4113-832b-9973618ef445', '016acb86-a835-41c7-9f09-5688535541f6', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Ria Andriany Amin', 'ria@gmail.com', NULL, '085255660404', 'kendari', 'Jl. Mayjen S. Parman No. 82 Kendari', 'BCA', NULL, NULL, 'ria', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:23:13', '2025-05-06 09:23:13'),
('9ed7d54c-8eeb-404b-ba84-3c390d7aa9b3', '2654e1fb-be4c-4929-ae89-0783a7d56099', '9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Rismanto', 'manto@gmail.com', NULL, '082256222143', 'kendari', 'Jl. Mayjen S. Parman No. 82 Kendari', 'BCA', NULL, NULL, 'manto', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 09:25:37', '2025-05-06 09:25:37'),
('9ed7ffe2-195d-4e39-a21e-72c28752e8f5', '3271f138-d266-4a1a-b69d-c12ba48ff77b', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. A. Zuljumadi Adma', 'zulju@gmail.com', NULL, '085219548866', 'Jl. Sultan Hasanuddin No. 57, Batulo, Wolio, Bau-Bau', 'Jl. Sultan Hasanuddin No. 57, Batulo, Wolio, Bau-Bau', 'BCA', NULL, NULL, 'zulju', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 11:24:41', '2025-05-06 11:24:41'),
('9ed80453-d9c4-4dd6-8acd-f92397e1be42', '3271f138-d266-4a1a-b69d-c12ba48ff77b', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Gina Revana Dwi Aprilia', 'gina@gmail.com', NULL, '082194135967', 'Jl. Budi Utomo, Bau - Bau', 'Jl. Sultan Hasanuddin No.57, Batulo, Wolio, Bau-Bau', 'BCA', NULL, NULL, 'gina', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 11:37:07', '2025-05-06 11:37:07'),
('9ed804ab-732d-4c27-8624-43dc903e8725', '3271f138-d266-4a1a-b69d-c12ba48ff77b', '1add2ca2-23b2-480f-954a-79932bf2e096', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. La Hau, Sp.Rad', 'lahau@gmail.com', NULL, '081241522321', 'Palatiga', 'Jl. R.A. Kartini No. 3 Bau-Bau', 'BCA', NULL, NULL, 'lahau', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 11:38:04', '2025-05-06 11:38:04'),
('9ed8052e-09fa-49c8-ae18-ec9c6cd9e3ee', '9ffde6ee-4184-424d-bc79-f51f9b911429', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'Dr. Suhardi, Sp.A', 'suhardi@gmail.com', NULL, '082347281956', 'Jl. Ahmad Yani, Muna', 'Jl. Ahmad Yani, Muna', 'BCA', NULL, NULL, 'suhardi', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-06 11:39:30', '2025-05-06 11:39:30'),
('9ed9eddd-fb31-4733-9bf6-d04e9ca319c4', '3f637078-ab45-46a5-9d34-b4690c1f3686', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Adia Triyarintana Sp.OG', 'adia@gmail.com', NULL, '082323456456', NULL, 'JL. Gajah Mada  NO. 10, Purwodadi', 'BCA', NULL, NULL, 'adia', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-07 10:25:58', '2025-05-07 10:25:58'),
('9ed9f4a9-3996-49b3-a218-b6228c279914', 'dcd37ad3-46c6-4acc-9904-bf10d6909f2c', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Agustinawati Ulfa, Sp.A', 'tina@gmail.com', NULL, '08122822701', NULL, 'JL. Hayam Wuruk 24, Purwodadi', 'BCA', NULL, NULL, 'tina', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-07 10:44:58', '2025-05-07 10:44:58'),
('9edc536a-4127-452d-8c71-baf25c781f26', 'fa20a8a6-8cfd-4708-8df4-0a75652edc7b', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Andrew Sitepu, SpA', 'andrew@gmail.com', NULL, '081367006672', NULL, 'Jl. Letjen Suprapto No 12, Kwaron, Gubug, grobogan', 'BCA', NULL, NULL, 'andrew', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:01:34', '2025-05-08 15:01:34'),
('9edc5403-ff0f-4872-b35d-c9a166164f51', '40fcad6a-ba10-4edf-a419-3653e1ab544e', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Anita Ratna Damayanti, Sp.OG', 'anita@gmail.com', NULL, '081325879944', NULL, 'Jl. Gajah Mada, RT.002/RW.015, Nglejok, Kuripan, Kec. Purwodadi, Kabupaten Grobogan, Jawa Tengah 58112', 'BCA', NULL, NULL, 'anita', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:03:15', '2025-05-08 15:03:15'),
('9edc54a4-e26d-4fb8-aed6-160a66da5a11', '901b2352-5ddb-453e-bc08-d3051a7066fa', '67926b37-2547-448f-afc4-3d3cb7abbaf6', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Bahri Firdaus, SpB', 'bahri@gmail.com', NULL, '081225512414', NULL, 'Dusun ploso RT.5, Plosorejo, Kec. Purwodadi, Jawa Tengah 58191', 'BCA', NULL, NULL, 'bahri', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:05:00', '2025-05-08 15:05:00'),
('9edc5633-11b1-49d1-b223-205007f8cbc2', '01e28bb1-045d-4dde-b915-a2eabf334f4e', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Cahyo Budi Utomo', 'cahyo@gmail.com', NULL, '081234394294', NULL, 'JL. Letjen Suprapto No. 6, Purwodadi', 'BCA', NULL, NULL, 'cahyo', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:09:21', '2025-05-08 15:09:21'),
('9edc56b3-0239-4e17-9e8e-e984ffdc37ae', '01e28bb1-045d-4dde-b915-a2eabf334f4e', '78be4356-8da0-427d-81fa-b437c2ec3e00', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. David Setiawan', 'david@gmail.com', NULL, '085647035599', NULL, 'JL. Letjen Suprapto No. 6, Purwodadi', 'BCA', NULL, NULL, 'david', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:10:45', '2025-05-08 15:10:45'),
('9edc58d2-df12-4529-a7a7-08f646b73fb5', '9fd552dc-3f6b-4cd7-b55e-a0ed675668ab', '9801e155-9bcc-4586-81d4-e405315e03d4', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Dimas Djohan, Sp.KK', 'dimas@gmail.com', NULL, '081327774983', NULL, 'JL. Letjen R. Soeprapto No. 89, Purwodadi', 'BCA', NULL, NULL, 'dimas', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:16:42', '2025-05-08 15:16:42'),
('9edc5a35-a210-4ea8-928c-bbed85293042', '3b635af2-da25-49e6-945a-f10e0b3be46c', 'deccc142-aea4-4a9c-b62b-436702334fe4', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Dina Okfina Ria, Sp.P', 'dina@gmail.com', NULL, '08562673197', NULL, 'Jl. DI panjaitan No. 36 Purwodadi Kab Grobogan', 'BCA', NULL, NULL, 'dina', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:20:34', '2025-05-08 15:20:34'),
('9edc5aae-ead5-433b-9ce2-c1aaa7a80ff1', '01e28bb1-045d-4dde-b915-a2eabf334f4e', '89aff25b-fd8f-4f8e-bfce-f54d4fbc89a1', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Dwi Antono, Sp.THT', 'dwi@gmail.com', NULL, '08122909069', NULL, 'JL. Letjen Suprapto No. 6, Purwodadi', 'BCA', NULL, NULL, 'dwi', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:21:54', '2025-05-08 15:21:54'),
('9edc5b10-1a07-4b0b-a07b-6ef58524a8a9', 'fa20a8a6-8cfd-4708-8df4-0a75652edc7b', '020d6f5d-2606-4d6b-9847-112cdb793373', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Friza Norviansyah, Sp.OG', 'friza@gmail.com', NULL, '0811250104', NULL, 'Jalan Letjend Suprapto No.12, Kuwaron, Kec. Gubug, Kabupaten Grobogan, Jawa Tengah 58164', 'BCA', NULL, NULL, 'friza', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:22:57', '2025-05-08 15:22:57'),
('9edc5b72-6b8a-4d6a-b824-584c70bc9026', 'dcd37ad3-46c6-4acc-9904-bf10d6909f2c', 'ad826c45-8aeb-4b25-a90a-11c0c7680e32', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Hasyim, Sp.S', 'hasyim@gmail.com', NULL, '0811270810', NULL, 'JL. Hayam Wuruk 24, Purwodadi', 'BCA', NULL, NULL, 'hasyim', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:24:02', '2025-05-08 15:24:02'),
('9edc5bde-dec7-4a5d-8b98-353fb6731e95', 'dcd37ad3-46c6-4acc-9904-bf10d6909f2c', '67926b37-2547-448f-afc4-3d3cb7abbaf6', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Heri Pratomo, Sp.B', 'heri@gmail.com', NULL, '081390034563', NULL, 'JL. Hayam Wuruk 24, Purwodadi', 'BCA', NULL, NULL, 'heri', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:25:13', '2025-05-08 15:25:13'),
('9edc5c52-5941-463a-b240-69522440e62f', 'dcd37ad3-46c6-4acc-9904-bf10d6909f2c', '85c1bf08-c6e0-4475-8771-90c075e9cd15', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', 'dr. Khotimatun Khasanah, Sp.A', 'khotimatun@gmail.com', NULL, '08157796460', NULL, 'JL. Hayam Wuruk 24, Purwodadi', 'BCA', NULL, NULL, 'khotimatun', NULL, NULL, '1122', NULL, NULL, NULL, '2025-05-08 15:26:28', '2025-05-08 15:26:28'),
('9ee0d6ba-3d6e-41b5-9669-8c2f9f92c328', '9ee0d638-ba6d-43f8-9387-ea9cc3eed9f8', '9801e155-9bcc-4586-81d4-e405315e03d4', 'c415a9aa-2969-11f0-bda6-bc2411c0ee13', 'Dr Mikel', 'info@rspakuwi.com', NULL, '082737263527', 'Karawang', 'Karawang', 'BANK ROLLAN', NULL, NULL, 'MIKEL SIMAKJUNTAK', NULL, NULL, '982938', NULL, NULL, NULL, '2025-05-10 13:52:03', '2025-05-10 13:52:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `instansis`
--

CREATE TABLE `instansis` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instansi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` enum('apotek','rs') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `instansis`
--

INSERT INTO `instansis` (`id`, `instansi`, `alamat`, `email`, `no_hp`, `kategori`, `deleted_at`, `created_at`, `updated_at`) VALUES
('00123b16-81b7-42c8-b2d0-2d7c11791d9c', 'AP  MANDIRI FARMA', 'JL. A. YANI NO. 83A, SUNGAI BARU', NULL, '81349678395', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0031b38a-3118-4d2a-aabd-f4023eadc038', 'Klinik Pratama Budi Utami', 'Desa Jepang RT.04 RW.06 Mejobo Kudus', NULL, '081329238899', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('00445974-1551-4f6b-8f98-22218dee5192', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '8125172973', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('00e3a356-6e8a-4f3e-903b-a24a6b7a2fdc', 'RS PKU Kutoarjo', 'RS pku kutoarjo', NULL, '082135956229', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0168499a-6575-43d7-9627-47b1d6e85995', 'AP  MEDIKA FARMA', 'JL. A. YANI KM. 34 LOKTABAT UTARA, BANJARBARU', NULL, '82213560645', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('016acb86-a835-41c7-9f09-5688535541f6', 'All Ap  Kimia Farma Kendari', 'Jl. Mayjen S. Parman No. 82 Kendari', NULL, '085255660404', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('01a73bd7-a6db-41eb-9c9b-caf32b572c13', 'Klinik Graha Medika', 'Jl. kesehatan No.8, Mangunsari, Kec. Sidomukti, Kota Salatiga, Jawa Tengah 50721', NULL, '081229220866', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('01e28bb1-045d-4dde-b915-a2eabf334f4e', 'RS. Panti Rahayu', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '08132596861', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('021cd16c-40b7-4991-be2c-4224bf8363c0', 'Klinik Utama Rawat Inap Rahayu', 'JL. Kartini No. 207 C, Dliwang Ungaran, Ungaran', NULL, '081319248719', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0260ecab-d4b8-40e0-a6bc-6d47653614ea', 'RSI. Sultan Hadlirin', 'Depan Mapolres, Jl. K. S. Tubun, Demaan VIII, Demaan, Kec. Jepara, Kabupaten Jepara, Jawa Tengah 59419', NULL, '085292291001', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('03044901-57fa-41bf-837a-0a24b82736c8', 'RS. Panti Wilasa Citarum Semarang', 'Jl. Citarum Raya No 58 Semarang', NULL, '081281699799', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('030ee3cc-a37f-469e-bf1a-62d7bb035fe8', 'APOTEK ABIDIN FARMA', 'JL. BELIMBING RAYA RT. 01 PEMBATAAN, TANJUNG, TABALONG', NULL, '82254914111', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('03764674-58b0-4c5d-9986-5947d8cd0dc4', 'Ap Happy Kids', 'Jl Putu Ina Karang Panjang', NULL, '08122019802', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('03d86f57-8f41-491c-9838-2170a1baa4ae', 'Apt. Sarika (PT Sarika)', 'Jl. Kedungmundu No.11-11a, Jomblang, Kec. Candisari, Kota Semarang,', NULL, '082197047474', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('04f41604-044d-46d3-b04e-3c316cd73fd3', 'Ap Hm', 'Ap Hm', NULL, '085340029847', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('05e16bc6-9f02-462f-bf62-46f79dc341ad', 'Risa Rafana', 'JL. Wage Batujai, Batujai, Kec. Praya', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('067dc88e-03fb-40b3-8f9a-53e8ef71a869', 'RST Wijayakusuma', 'Jl. Prof Dr. HR Bunyamin, Purwokerto', NULL, '081327102227', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('068a24c3-968b-4ed0-8516-4229b5421d59', 'Apt. Cahaya Satusatu Kdi', 'Jl. Sultan Hasanuddin, Bau - Bau', NULL, '082346123265', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('06b3a993-2a55-40f0-8008-5ece773f2ef4', 'Apt. Grabag', 'Dusun Gentan RT 01/ RW 02 Kel. Tirto, Kec. Grabag, Magelang', NULL, '085600967773', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('06d9115d-71c3-4fda-8411-6c11711f31a2', 'RSU SYIFA MEDIKA', 'JL. RO. ULIN NO. 93 BANJARBARU SELATAN', NULL, '87815050055', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('070dcbec-bb95-4124-80a5-8031497d050b', 'RS. PKU Muhammadiyah Mayong', 'Jl. Pegadaian Mayong No.12, Gloge, Mayong Lor, Kec. Mayong, Kabupaten Jepara, Jawa Tengah 59465', NULL, '081325854441', 'apotek', '2025-05-07 10:47:58', '2025-05-05 11:38:20', '2025-05-07 10:47:58'),
('0873298f-d2ad-4f11-a560-1bb4325af7dd', 'RSUD Ki Ageng Getas Pendowo', 'Jl. Ahmad Yani No. 57 Gubug Kec. Gubug Kab. Grobogan, Gubug, Indonesia, Central Java', NULL, '(0292) 5151911', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('08ac404d-7191-4643-b66b-c25377079d3e', 'RS. Panti Rahayu', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '08998324689', 'apotek', '2025-05-08 15:06:21', '2025-05-05 11:38:20', '2025-05-08 15:06:21'),
('08ad0413-06c2-4bb6-ab04-b460cc7aa0bc', 'RS DATU KANDANG HAJI', 'JL. GN. PANDAU, PARINGIN KOTA, PARINGIN, BALANGAN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('08b2a4cd-d33b-418d-b9d8-8f0ae802e4e2', 'RSUD DR.H.SOEMARNO SOSROATMODJO', 'JL. TAMBUN SUNGAI NO. 16, SELAT TENGAH, SELAT, KAPUAS', NULL, '81340345443', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0987f547-d8b9-456b-99e6-611440be6b56', 'RS ABDUL AZIS MARABAHAN', 'JL. JEND. SUDIRMAN NO. 10, RT 13 RW 001, ULU BENTENG, MARABAHAN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('09f5379d-8edb-4b3f-837a-9215801325f8', 'RSU Bunda', 'Jl.Pramuka No.249-Purwokerto', NULL, '082288838883', 'apotek', '2025-05-07 10:28:59', '2025-05-05 11:38:20', '2025-05-07 10:28:59'),
('09f9a291-e8e3-4edb-928c-3163cd01336e', 'RSUD Wates', 'Jl. Tentara Pelajar No.Km. 1 No. 5, Area Sawah, Beji, Kec. Wates, Kabupaten Kulon Progo, Daerah Istimewa Yogyakarta 55651WATES', NULL, '08119538388', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0a609eec-8c06-43db-9f40-aab802f3c25d', 'RSIA Miriam', 'Jl. Jend. Ahmad Yani No.58, Magersari, Panjunan, Kec. Kota Kudus, Kabupaten Kudus, Jawa Tengah 59317', NULL, '081236529518', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0a69b0eb-eec2-46f7-a2b7-a7ecaa826b60', 'Ap Rs Pof Anwar Makatutu', 'Ap Rs Pof Anwar Makatutu', NULL, '085255282252', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0aefe842-6ae5-41bd-ae07-479fea7014ac', 'Apt. Anisaa', 'Jl.Ahmad Yani No 130, ngepelan, Wonosobo Barat, Wonosobo', NULL, '085226969257', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0b9457a3-f72d-447e-8d1d-47d6df05ed9a', 'Apt. Seven pharmacy', 'kedungmenjangan, purbalingga', NULL, '08123454343', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0c787275-0310-465a-b3cb-cd2345010bb2', 'RSIA Sadewa', 'Jalan Babarsari Blok TB 16 No.13B, Tambak Bayan, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0d01ebfa-df7a-47f5-9724-bc8327f5298d', 'RS N 21', 'Jl. Desa Pabelan No.5, Jagalan, Pabelan, Kec. Mungkid, Kabupaten Magelang, Jawa Tengah 56551', NULL, '082220801088', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0d2813fc-8975-4c27-9497-816b48917755', 'Rs Konawe', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe', NULL, '08123185027', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0dad5f9a-4ef0-4772-b244-7e9aefba28b6', 'Klinik Ngesti Widodo', 'Jl. Brigjend Katamso 1 Ungaran', NULL, '08122552220', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0e217486-4717-4190-b457-65353f3e22d4', 'Klinik Syira Ur Rahman', 'Jl. Letnan Tukiyat, Gunungan, Deyangan, Kec. Mertoyudan, Kabupaten Magelang, Jawa Tengah 56172', NULL, '08164221356', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0e374396-e539-4bd4-9088-d91d3897b3a3', 'Rs Madani', 'Jln Thalua Konchi', NULL, '085256006073', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0e67ae8e-bba0-4d72-bc47-2eb258f9f1de', 'RSUD DR.H.SOEMARNO SOSROATMODJO', 'JL. TAMBUN SUNGAI NO. 16, SELAT TENGAH, SELAT, KAPUAS', NULL, '82255152097', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0e80d4aa-1986-48b4-bbd4-5370f28806df', 'Apt. Dian Farma', 'Jl. Secang Pirikan Km. 6,5 Magelang', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0f684a16-8016-47f3-89f0-afbba5f443c6', 'Apt. Kimia Farma 19', 'Jl. Sultan agung No. 1A', NULL, '085726175756', 'apotek', '2025-05-06 09:26:59', '2025-05-05 11:38:20', '2025-05-06 09:26:59'),
('0fcd2178-29b0-4487-a1a4-6dee5c3caa36', 'RSU.RATU ZALEHA', 'JL. SASARAN, MARTAPURA', NULL, '081232063416', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('0fceb305-cdd3-4497-8403-9d12eb0c7b15', 'Ap Adiza', 'Ap Adiza', NULL, '081355816999', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('10455326-fa9a-40da-b6ff-c14140f1980f', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '081326823540', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('10bd42be-e65b-4443-a268-e7a87658c6de', 'Apt. Kimia Farma Pelengkap 71', 'Desa Monapa No. 3 Kendari', NULL, '08114091993', 'apotek', '2025-05-06 09:28:10', '2025-05-05 11:38:20', '2025-05-06 09:28:10'),
('10cc0767-1f1f-478b-ad32-a25130d9ecf7', 'Ap17', 'Jln Ampera Kota Masohi', NULL, '082125222298', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('10e7bb86-08f1-471d-89ef-56ee159c455a', 'Ap Almediqa', 'Mogolaing', NULL, '082348844231', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('111372a6-db53-4f62-aa3d-b55ae99f31a8', 'RSUD Merah Putih', 'Jl. Magelang - Yogyakarta No.Km.5, Japunan, Danurejo, Kec. Mertoyudan, Kabupaten Magelang, Jawa Tengah 56172', NULL, '083869459540', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('11647c8f-ac30-49bf-8db4-5e9ec03b7479', 'RSUD KI Ageng Selo Wirosari', 'Jl. Raya Blora - Purwodadi No.KM 19, Area Sawah, Kunden, Kec. Wirosari, Kab. Grobogan, Jawa Tengah', NULL, '081216412140', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('11668a78-765a-400d-8de4-0e87a8a57fcb', 'RSUD. Kartini Jepara', 'Jl. KH. Wachid Hasyim No.175 Bapangan Kec Jepara Kab Jepara', NULL, '0813904831163', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('11d21b94-806a-46ee-9590-b31d6a0e01d6', 'Apt. Kimia Farma 19', 'Jl. Sultan agung No. 1A', NULL, '085282461899', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('121addbc-94b4-4568-91c6-aed7b5755bda', 'RS PERTAMINA TANJUNG', 'JL. GAS NO. 1 KOMPERTA TANJUNG, MURUN PUDAK', NULL, '81341064160', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('129f05a1-f5ac-4fbe-881f-fbc0c42a913b', 'Apt. Kasih Ibu (Grobogan)', 'Jl. Untung Suropati No.RT 03, RW.01', NULL, '085380370898', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('12a9349c-0c57-4e39-b9fe-e9e3fe6a4636', 'RS BORNEO', 'JL. AHMAD YANI, ANGSAU', NULL, '081311087744', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('12bff43a-75f6-4d92-afe0-81e145da4f09', 'Permata', 'Jalan Tanjung Gunung No.4, Gerung Sel., Kec. Gerung', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('12ddca5e-9486-462d-8137-28de4607b2ff', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '08228219336', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('12f0bf3c-9540-4dfd-a03f-da7f358c79e8', 'Kl Sehat Selaras Blora', 'Jl. Sumodarsono no. 50, Mlangsen, Kab. Blora, Jawa Tengah', NULL, '085254321992', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('130b12a8-26ec-433c-a840-e2ddf4d561b5', 'Rs Konawe', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe', NULL, '081355447144', 'apotek', '2025-05-06 08:53:59', '2025-05-05 11:38:20', '2025-05-06 08:53:59'),
('132d7bfb-30eb-40a8-bc61-dcd7ebd3419d', 'Apt. Amanah Ibu', 'Jl. Karang Ingas Raya No.7 B Semarang', NULL, '085640080894', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('133755a4-0241-4646-8a30-d507435198b8', 'Klinik Panti Bahagia', 'Jl. Tentara Pelajar No.61, Kemirirejo, Kec. Magelang Tengah, Kota Magelang, Jawa Tengah 56122', NULL, '088221423260', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('13cfd558-528e-457c-9d9a-7957f686cff2', 'Apt Nurfadillah', 'Apt Nurfadillah', NULL, '081299037321', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('13e56bea-f111-416d-8417-661460f8a4a3', 'RSI Wonosobo', 'Jl.Letjen S Parman NO Km 3 Mendolo, Bumireso, Wonosobo', NULL, '08122769259', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1471af2a-e093-47f6-ace1-22f666bc563f', 'Praktik Pribadi', 'Jl. Kartini Semarang', NULL, '08165435273', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1477c668-35cb-4bf6-b09e-267457e2d7ad', 'Apt. Kimia Farma 71', 'Jl. DR. Soetomo No. 3', NULL, '08112608876', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('157db596-7aa7-49b5-aae2-dc7470d6390a', 'Apt. Cahaya Farma,', 'Apt. Cahaya Farma', NULL, '082219995023', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('162d07c5-efab-438a-8aee-b839211c9f9e', 'Apt. Sarana Makmur (Panel)', 'Jl. Jend. Sudirman Golantepus Mejobo, Golan, Golantepus, Kec. Mejobo, Kabupaten Kudus, Jawa Tengah 59381', NULL, '081326743122', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('165151e3-cb29-46fc-80e6-367303065312', 'RS. Panti Rahayu', 'JL. R.Suprapto No.6, Purwodadi, Kec. Purwodadi, Kabupaten Grobogan, Jawa Tengah 58111', NULL, '085270680960', 'apotek', '2025-05-08 15:06:55', '2025-05-05 11:38:20', '2025-05-08 15:06:55'),
('165188cd-994b-4b40-9d67-0f5b6b658c65', 'Apt. K24 Anjasmoro', 'Jl. Anjasmoro Raya no. 55', NULL, '081244842487', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('173a4708-2fdb-4c38-8b2d-cdaddc2a3f5d', 'Klinik Utama Rawat Inap Rahayu', 'JL. Kartini No. 207 C, Dliwang Ungaran, Ungaran', NULL, '0895410322532', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('181b94fc-8b44-4c4a-8427-95e2b9a58d6c', 'KLINIK SEKATA MEDICAL CENTER', 'JL. NEGARA KM 142 RT 24 BATU KAJANG, BATU SOPANG, PASER', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('192578e6-bcf0-4b20-b471-f54c35a13bb8', 'RS Mitra Sehat', 'Jl. Wates No.KM. 9, Ngemplak, Balecatur, Kec. Gamping, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55295Sehat', NULL, '082220360505', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('192edaf6-ae53-4ffd-9e79-5447ca93f4df', 'RS Bunda', 'Jl.Pramuka No.249-Purwokerto', NULL, '085227222227', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('19605394-31c4-414f-b245-ab55d8123fd7', 'RS. PKU Muhammadiyah Mayong', 'Jl. Pegadaian Mayong No.12, Gloge, Mayong Lor, Kec. Mayong, Kabupaten Jepara, Jawa Tengah 59465', NULL, '082328045526', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1997d797-04e1-4073-9cb1-bda78c93492b', 'RS SARI MULIA', 'JL. P. ANTASARI NO.139, SUNGA BARU, BANJARMASIN', NULL, '8999990079', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1a5aa415-cc1f-4bf4-941f-5f1f5af38f73', 'RS PKU MUH Temanggung', 'Jl. Raya Kedu Km. 2 Kalisat, Bulu, Temanggung', NULL, '08122736295', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1ab4256a-a0cb-4e63-8301-800f6441556d', 'Apt. Harapan Kita L24 Jepara', 'Jl. Raya Jepara - Kudus, KM. 6.5, Rw. 03, Krasak, Kec. Pecangaan, Kabupaten Jepara, Jawa Tengah 59462', NULL, '085225559540', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1b04c606-a49f-408f-96c5-567e7d6c599a', 'Apt. Krisna', 'Kauman, Medari, Kec.Ngadirejo,Kab Temanggung', NULL, '082220273925', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1b7d302f-64d2-4a12-bd58-b949ed3b3f96', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '08122561633', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1d07d020-4cbc-4be1-8b59-28ffb6e27e9d', 'RS RESTU IBPT RESTU IBU UTAMA', '', NULL, '08125414940', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1d3517ed-b7e9-4fe1-809c-8655618968cd', 'AP NABILA FARMA', '', NULL, '08115491157', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1d58c981-5dfa-483b-adbe-22776c385156', 'RS Charlie', 'Jl. Ngabean, Gowok, kec. Boja', NULL, '085802790680', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1d787e42-7d3c-4bab-91a6-392a1f65b942', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1d7d671b-a5a8-4dde-9186-97c4536afd90', 'RS TK. III Wijayakusuma Purwokerto', 'Jl. Prof Dr. HR Bunyamin, Glempang, Bancarkembar, Kec. Purwokerto Utara, Kabupaten Banyumas, Jawa Tengah 53121', NULL, '085229921680', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1d80d627-92ef-4895-8ff8-4082a6b01525', 'RS Charlie', 'Jl. Ngabean, Gowok, kec. Boja', NULL, '081802408323', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1db401b1-0f43-4ddb-bac5-6afc874c3957', 'Rs Konawe', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe', NULL, '085299427382', 'apotek', '2025-05-06 08:54:06', '2025-05-05 11:38:20', '2025-05-06 08:54:06'),
('1f18e209-c0d4-4d35-bf0a-d2e9b89afade', 'RSUD BOEYASIN', 'JL. AHMAD YANI, ANGSAU', NULL, '082193174290', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('1f2484db-79c2-4569-a463-63723c8ea7de', 'Apt. Harapan Kita L24 Jepara', 'Beji Lor, Tanjungrejo, Kec. Jekulo, Kabupaten Kudus, Jawa Tengah 59382', NULL, '081383167111', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('201fda03-5987-439f-a476-83b89b412c58', 'Rsud Pohuwato', 'Rsud Pohuwato Marisa', NULL, '08529902264', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('209749e7-272e-4107-8698-a53fd6871cc4', 'RS. PKU Muhammadiyah Mayong', 'Jl. Pegadaian Mayong No.12, Gloge, Mayong Lor, Kec. Mayong, Kabupaten Jepara, Jawa Tengah 59465', NULL, '081293351543', 'apotek', '2025-05-07 10:48:44', '2025-05-05 11:38:20', '2025-05-07 10:48:44'),
('20ac05fe-6f5d-4e99-8862-c15cc9112ebe', 'RSUD Tidar', 'Alamanda Residance Cluster Jasmine 1 Magelang', NULL, '081390500808', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('20e1298d-e278-4379-a0ae-c87a11b2b14c', 'Apt. Bina Sehat', 'Jl. Kalimas raya No. 29', NULL, '08886448720', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('21a3237b-470e-4975-8e95-7a6437dca985', 'RSK Ngesti Waluyo', 'Jl. Pahlawan Jubug , Wanutengah, Parakan, temanggung', NULL, '081224440019', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('22654c3f-eb70-44fe-b09b-8a82a1fb2b33', 'Klinik Smile Center', 'Jl. Melati Utara No. 16', NULL, '08157601355', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('226fa7b8-5079-4225-90a4-37ef14d55cda', 'Klinik Amalia 3', 'Jl. M. Yusuf, Semaken, Pucungrejo, Kec. Muntilan, Kabupaten Magelang, Jawa Tengah 56414', NULL, '085740506545', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('229a8283-6c69-498b-b077-d49de026c490', 'Apt. Kimia Farma 19', 'Jl. Batur No. 1', NULL, '081326020926', 'apotek', '2025-05-06 09:27:15', '2025-05-05 11:38:20', '2025-05-06 09:27:15'),
('22d5c368-8649-4016-869a-b0ef5116a651', 'Praktik Pribadi', 'Jl. Mahesa Mukti, Semarang', NULL, '0811271997', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('23309f71-b67a-481f-a430-a5100d751c13', 'Apt. Omura', 'Jln. Seroja ,Semarang', NULL, '082135794965', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('235276b0-91e5-47c9-9e40-16b954caaf22', 'Apt. Toroh Farma', 'Jl. Hayam Wuruk no 24 Kabupaten Grobogan, Jawa Tengah 58192', NULL, '085290452288', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('235fd4bc-c982-4dff-8f53-80fc3d5d011f', 'RSUD PULANG PISAU', 'JL. W.A.D DUHA KOMPLEK PERKANTORAN, MANTAREN I, KAHAYAN HILIR, PULANG PISAU', NULL, '85256220003', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2366ebec-71aa-45e3-89b0-39df69bc99c2', 'Apt. Salsabila', 'Randugunting, Randugading, Blondo, Kec. Mungkid, Kabupaten Magelang, Jawa Tengah 56512', NULL, '085228811717', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('243e535b-0d9a-490e-a564-32518867403c', 'KLINIK KUSUMA MEDIKA', 'JL. RAYA BATULICIN', NULL, '85255248484', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('244b75c5-a401-44df-80d0-c8a33948bff2', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('25c6ee2a-e8e8-4900-bd2a-b1c26cb1ed53', 'Apt. Kroden', 'JL. Agil Kusumadya N0.23', NULL, '08156540272', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('25cf3e41-d85c-44d8-9030-3cea8378033e', 'Klinik BP Anisa Demak', 'Jl. Kyai Turmudzi No.100, Stinggil, Bintoro, Kec. Demak, Kabupaten Demak, Jawa Tengah 59511', NULL, '085600609069', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('25e6a298-93fa-43f4-83c4-078c35aff689', 'Ap 46 Cepu', 'Kompleks perumahan dinas dokter RSUD, Cepu, Kec. Cepu, Kab. Blora Jawa Tengah', NULL, '085223677777', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('25fd3bfd-84fb-4ccd-9da4-8a8ea1c6835e', 'Ap Farminda 1', 'Jl Imambonjol', NULL, '085234777277', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('260448f5-4ba1-47ca-a96d-56c59e69448b', 'APOTEK ASHEEQA', 'JL. A. YANI DESA TELAGA ITAR RT 04, SUNGAI RUKAM, KELUA', NULL, '81349535395', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2654e1fb-be4c-4929-ae89-0783a7d56099', 'Ap Kimia Farma Kartika', 'Jl. Mayjen S. Parman No. 82 Kendari', NULL, '082256222143', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('268f6810-87ae-4ec8-8de9-f060eaf902eb', 'APOTEK ABID FARMA', 'JL. RAYA BATULICIN NO. 11', NULL, '82241494566', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('26904486-a61a-4db3-92f1-c30ed57796eb', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '85232220072', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('271ba2ff-09a6-4987-97e2-81e7a331b26d', 'RS. PW dr. Cipto', 'Jl. Dr. Cipto No. 50, Bugangan, Semarang Timur, Semarang', NULL, '081325652003', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('27a749bd-b273-4702-8c58-13617436e1ad', 'Apt. Sarika (PT Sarika)', 'Jl. Lamper Sari No 31. Lamper Kidul. Kec Semarang Selatan Kota Semarang Jawa Tengah 50249', NULL, '087802424557', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('284c0e2c-d17f-45a4-a10d-ba1616934aec', 'RSIA Kahyangan', 'Jl. Tino Sidin No.390, Kdipiro, Ngestiharjo, Kec. Kasihan, Kabupaten Bantul, Daerah Istimewa Yogyakarta 55184', NULL, '081254078216', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('285be21c-545a-4a6d-a12e-92cb3e3efce3', 'Ap Neng Lientje', 'Jl Soabali', NULL, '082198334655', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('285d4970-7978-4660-a8de-36debebbc978', 'Ap Regina Farma 24', 'Jl. R.A. Kartini No. 3 Bau-Bau', NULL, '081241522321', 'apotek', '2025-05-06 09:39:29', '2025-05-05 11:38:20', '2025-05-06 09:39:29'),
('28aac725-33f0-46cd-b69f-def153a0322d', 'RSIA Sadewa', 'Jalan Babarsari Blok TB 16 No.13B, Tambak Bayan, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', NULL, '081217931183', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('28bb8271-db91-4010-8087-ef8e1191c54e', 'An-Nur', 'Jl. H. Lalu Anggrat BA No. 2, Gerung, Gerung Utara, Kec. Gerung', NULL, '87765555466', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('29573872-5424-4265-bedc-6c448e257f3a', 'RSUD Samin Surosentiko Randublatung', 'Randublatung, Kec. Randublatung, Kab. Blora, Jawa Tengah', NULL, '085727691888', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('29b705e4-517c-425b-bd4a-862211a7b918', 'RS KHUSUS IBU DAN ANAK ANNISA', 'JL. ZAFRI ZAM ZAM NO. 55/56, KUIN CERUCUK, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('29b8a723-45c8-4fa4-b1fe-636644d2450e', 'Klinik Kusuma Medika', 'Jl. Raya Secang No.1, Sumberketandan, Secang, Kec. Secang, Kabupaten Magelang, Jawa Tengah 56195', NULL, '081229345584', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2a0ec833-af2a-4cda-b92b-7dfae77913e1', 'APOTEK AJI FARMA', 'JL. ZAFRI ZAM ZAM, KUIN CERUCUK, BANJARMASIN', NULL, '89613796732', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2a1a25ee-ccbe-4b01-a571-36727871fcf3', 'RS SARI MULIA', 'JL. P. ANTASARI NO.139, SUNGA BARU, BANJARMASIN', NULL, '81351881412', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2ad57311-4b9f-4874-94c9-4f62b0fd0ec2', 'Apt. Omura', 'Jln. KH Ahmad dahlan, Semarang', NULL, '08157740494', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2adbdcde-33ec-487b-a48e-09c8a99f67dc', 'KLINIK AR RAHMAN', 'JL. MALAKA, TEGAL REJO', NULL, '8125065070', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2b509034-1dc6-41bc-ae00-ab43e514a6ba', 'Apt. Krisna', 'Jalan Campur Salam, Jatisuko, Campursalam, Parakan ,temanggung', NULL, '08156543187', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2b7d425f-9228-43de-aa32-c60c0e757413', 'Klinik BP Anisa Demak', 'Jl. Kyai Turmudzi No.100, Stinggil, Bintoro, Kec. Demak, Kabupaten Demak, Jawa Tengah 59511', NULL, '08122572740', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2b920f31-38ea-4410-ad26-2bb6ace9acb7', 'Rs Konawe', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe', NULL, '081228696071', 'apotek', '2025-05-06 08:54:13', '2025-05-05 11:38:20', '2025-05-06 08:54:13'),
('2c136918-bcba-4392-a013-992d2edabceb', 'RST Bhakti Wiratamtama', 'Jl. DR. Soetomo No. 17', NULL, '082127127007', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2c6374f3-46ab-4323-84e9-c597a43077cc', 'Apt. Krista farma', 'Jl. Semarang Indah blok C', NULL, '08156517896', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2c9bf674-772b-49a6-a00f-1196f95282ce', 'Apt. Dhani,', 'Apt. Dhani,', NULL, '085643219358', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2ca1d6a6-7bb8-44c6-8d8a-3c461e8b8524', 'AP  TAPIN', 'JL. H. ISBAT, KUPANG, TAPIN UTARA', NULL, '81328633353', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2ca57e1a-62f8-46b9-979a-7a233ab26c0e', 'Apt. Victory Medika', 'Jl. Urip Sumoharjo No.124, Tuksongo, Purworejo, Kec. Purworejo, Kabupaten Purworejo, Jawa Tengah 54151', NULL, '085292161775', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2cab3277-e344-4a69-ab78-ea8ebc6d76d2', 'Apt. Kosudgama', 'Perum Griya Mahkota C16 Kwarasan, Nogotirto, Gamping, Sleman, Yogyakarta', NULL, '081227911968', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2ce3f738-9f39-44da-8a16-e9b8846dddcf', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '08122823325', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2d422004-0bf4-4c13-8cf7-563b3ad99d45', 'Klinik Gumuk Walik', 'Jl. Veteran Yogyakarta', NULL, '081226026026', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2d98bd2e-b16d-44b7-a1e1-5c28b9a31516', 'Apt. Domas', 'Jl. Ranggasena No. 43 Sidareja', NULL, '081325321821', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2e417863-ca7f-450e-bb8c-4782f1235bff', 'Apt. Kimia Farma 271', 'Jl. Dr. Cipto No. 47', NULL, '082225903711', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2ed371f6-70b2-486b-8e50-e0739d159c1f', 'RSI. Pati', 'Jl. Raya Pati - Tayu No.KM.18, Kampunganyar, Waturoyo, Kec. Margoyoso, Kabupaten Pati, Jawa Tengah 59154', NULL, '08116222910', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2f593dbb-8177-469d-8853-84fc4565c496', 'RS. Panti Wilasa Citarum Semarang', 'Jl. Citarum No.98, Mlatiharjo, Kec. Semarang Tim., Kota Semarang', NULL, '082127127007', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2fa9f109-1b3d-4919-bbb7-8ff4fe5a64c6', 'Apt. Madani', 'Bongsri, Mulyoharjo, Kec. Pati, Kabupaten Pati, Jawa Tengah 59119', NULL, '081259569583', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('2fcb29b5-5185-4d43-9bc4-da0ea48701b7', 'RS Emanuel', 'Jl.Banyumas-banjar 12, banjarnegara', NULL, '081328751103', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('302f831d-8663-4e7e-87f3-61166728b460', 'Klinik Dharmasifa', 'JL. Kaliwungu raya km', NULL, '08122517108', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('305ef7c5-5ec1-4028-a4b5-a410980b1be9', 'Apt. Simpang Lima Purwodadi', 'Jl. Raya Purwodadi Solo', NULL, '08122904711', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('30d0fef0-a534-4c34-9966-0286043cef83', 'RSU HANDAYATI', 'JL. H. ISBAT, KUPANG, TAPIN UTARA', NULL, '08125175919', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('31494301-8f7c-4f26-ad74-7908e05d9df1', 'KLINIK SEKATA MEDICAL CENTER', 'JL. NEGARA KM 142 RT 24 BATU KAJANG, BATU SOPANG, PASER', NULL, '8114685777', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('317470a3-535f-4591-9099-4edead568066', 'Apt. Anugerah', 'Suronegaran RT 2 / RW 10 Purworejo', NULL, '08122969869', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('31a65785-3b74-416c-bdc8-640584b12d15', 'Apt. Eidola', 'JL. Rejosari 3 / 1 Ngijo Gunung Pati', NULL, '085876528063', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('321bd801-641c-416d-bc20-53fa9e2d3f35', 'APOTEK ALIFA FARMA', 'JL. H. MISTAR COKROKUSUMO, BANJARBARU', NULL, '8988888885', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3220a997-d112-40b4-8ac6-0f4546cff7c6', 'RSUD BOEYASIN', 'JL. ATU - ATU, PELAIHARI', NULL, '082135191379', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('323268d0-0075-42d5-a83e-f2fd7b61a03d', 'RUMAH SAKIT PERMATA HUSADA', 'JL. IR. PM. NOOR, SUNGAI ULIN, BANJARBARU', NULL, '81232063416', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3271f138-d266-4a1a-b69d-c12ba48ff77b', 'Ap Regina Farma 24', 'Jl. Sultan Hasanuddin No.57, Batulo, Wolio, Bau-Bau', NULL, '082194135967', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('32cb12c4-c0a2-4f03-a2a4-944fb43eb4b4', 'RSU Puri Asih', 'Jl. Jend. Sudirman No.169, Gendongan, Kec. Tingkir, Kota Salatiga, Jawa Tengah 50743', NULL, '088220226915', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3333194f-9701-429d-b284-562fa9e9f9cb', 'RS Habibullah Gabus', 'Jl. Raya Tahunan, Krajan, Tahunan, Kec. Gabus, Kab. Grobogan, Jawa Tengah', NULL, '081239840165', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('333a8d7e-d34e-4104-b4f4-34e3642f7005', 'Klinik Ibunda', 'Jl. Pramuka No.392 Kab. Banjarnegara', NULL, '081575807119', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('33b4ff9e-bf4e-490e-b6ac-5653387c220f', 'Ap Novita', 'Jl Imam Bonjol', NULL, '085298722140', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('347e4021-0fab-470a-b52c-ba2fed78cc9e', 'RSUD Muntilan', 'Jl. Kartini No.13, Balemulyo, Muntilan, Kec. Muntilan, Kabupaten Magelang, Jawa Tengah 56411', NULL, '087738712273', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3499e6f7-f3a5-47e6-bf9e-9b2312f308b9', 'Apt. Seteran', 'Jl. Karangwulansari I No.19, Brumbungan', NULL, '082220936308', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('34b13141-59dc-4623-b6b8-b9a14b25ac5f', 'RSUD PAMBALAH BATUNG', 'JL. BIHMAN VILLA RT 08, ANTASARI, AMUNTAI TENGAH, HULU SUNGAI UTARA', NULL, '85249742858', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('34b8948f-2054-4a08-a681-e74a4121f79f', 'Apt. Krisna', 'Jl Suyoto No 135, Jampiroso, Kertosari, Temanggung', NULL, '081313408854', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('34f25333-bd75-4e91-baaf-f9a41c344905', 'Apt. K24 Suratmo', 'Jl. Abdulrahman Saleh No.82, Kalibanteng Kidul, Kec. Semarang Barat, Kota Semarang, Jawa Tengah 50145', NULL, '081225559262', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('35955320-fa09-45a4-a1a4-b91e88be5e62', 'Apt. Enggal Saras 2', 'Kayen No. 147-B RT 05 / RW 44 Depok, Condongcatur, Sleman, Yogyakarta', NULL, '0811256090', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('35c2570f-9842-4c95-b744-5949e83f9903', 'RSU ALMANSYUR MEDIKA', 'JL. A. YANI KM. 34 LOKTABAT UTARA, BANJARBARU', NULL, '81355896697', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('361a2dd1-fdec-45cf-9e13-8e68229ea310', 'APOTEK WIDYA', 'JL. A. YANI, ILUNG, BATANG ALAI UTARA, HULU SUNGAI TENGAH', NULL, '81348809688', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3629269c-6cdb-415c-9272-42230357b8ae', 'RS SARI MULIA', 'JL. P. ANTASARI NO.139, SUNGA BARU, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('367dd31b-ca50-40c9-9080-8ff69aaf1b61', 'RS PKU MUH Wonosobo', 'Jl Raya No 1 KM 4, Kedewan, Sudungdewo, Kertek, Wonosobo', NULL, '081329646909', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3719ba99-cdde-4b11-8035-4065faa110d7', 'RSUD PAMBALAH BATUNG', 'JL. SUWANDI SUMARTA, KEBUN SARI, AMUNTAI TENGAH, HULU SUNGAI UTARA', NULL, '81261103605', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('37425276-e777-46f9-bfb3-fcbdbfcbcc0c', 'Apt. Mrican', 'Jl. Kencono wungu tengah I no. 37', NULL, '08122891445', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('37b1c404-8eca-404f-87df-891fe110bd1d', 'Klinik Pesat', 'Lopait, Kec. Tuntang, Kabupaten Semarang, Jawa Tengah 50773', NULL, '081225079559', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('37be5a84-60ad-44a1-9a49-4bb0129ae425', 'RS. PKU Muhammadiyah Gubug', 'Jalan Letjend Suprapto No.12, Kuwaron, Kec. Gubug, Kabupaten Grobogan, Jawa Tengah 58164', NULL, '0811250104', 'apotek', '2025-05-07 10:47:35', '2025-05-05 11:38:20', '2025-05-07 10:47:35'),
('38479916-1109-428d-8b13-96696b0c7bc3', 'Klinik Kecantikan Pratama Benings', 'Jl. Magelang No.9, Bumijo, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55231', NULL, '082120989802', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('38512f92-70c8-4eef-8c20-149cf100e0bc', 'Ap Kimia Farma Baruga', 'Desa Onewila, Ranomeeto', NULL, '081314015343', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('38e7fb82-3575-49ad-835d-87d43cd633b3', 'RSIA. Bunda Semarang', 'Jln. Bridjen katamso , Semarang', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('39b0051f-44e4-4065-bdc5-b9afc855d315', 'RSUD Lombok Timur Labuhan haji', 'jln. Hos Cokroaminoto No.31 Labuhan Haji', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('39b7f281-165c-4ef5-b323-8b415dc14bd1', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '85234908835', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('39dfda4a-6ca5-4c50-99c8-950e80a0f5d6', 'Apt. Kimia Farma 18', 'Jl. Pemuda No. 135', NULL, '08122824171', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3a8fdfb5-d289-470e-b0dc-dd299d657c93', 'Klinik Bina sehat', 'Jl. Kalimas raya No. 29', NULL, '081326596018', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3a91a64a-c023-4807-b8d5-da539d0c69f6', 'AP SEROJA', 'JL. BELITUNG LAUT NO. 15, BELITUNG SELATAN, BANJARMASIN', NULL, '8125120678', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3b635af2-da25-49e6-945a-f10e0b3be46c', 'RSD DR. R. Soedjati Purwodadi', 'Jl. DI panjaitan No. 36 Purwodadi Kab Grobogan', NULL, '08562673197', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3ba75be3-e975-41f6-ad2c-eab6c84707ac', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '8125131177', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3c60a477-252f-496e-994a-c41083dc7a24', 'Apt. Omura', 'Jln. Seroja ,Semarang', NULL, '082135794965', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3c653def-c24f-4e69-a7e0-10c9bc9b6e2e', 'RS SARI MULIA', 'JL. P. ANTASARI NO.139, SUNGA BARU, BANJARMASIN', NULL, '81348860670', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3d3fa81f-47bc-47b7-b358-5f1911a4ee1b', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '082324225582', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3e4fcca7-97ec-401b-ab58-bcf5f483bbd7', 'Apt. Sana Farma', 'Jl. Sinar Kartika 498 Sinar Waluyo Semarang', NULL, '085657161204', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3e697696-82db-4061-b36f-d96a7d78bf5c', 'RSD IDAMAN BANJARBARU', 'JL. TRIKORA, GUNTUNG MANGGIS, BANJARBARU', NULL, '81349586453', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3ef4e573-a588-4aef-a7aa-6e92eb5e0a1c', 'RS. PW dr. Cipto', 'Jl. Dr. Cipto No. 50, Bugangan, Semarang Timur, Semarang', NULL, '08122898762', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3f0ab6db-d9d5-46c1-8fe3-07253c59364f', 'Balkesmas Ambarawa', 'Jl. Dr. Cipto No.102, Kepatihan, Kranggan, Kec. Ambarawa, Kabupaten Semarang, Jawa Tengah 50613', NULL, '081391291926', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('3f637078-ab45-46a5-9d34-b4690c1f3686', 'Apt. Akmal Sehat -5', 'JL. Gajah Mada  NO. 10, Purwodadi', NULL, '082323456456', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('40dd7dfa-f0a9-48a9-a100-36d4c284432e', 'Apt. Kawatan', 'Jl. Sigaluh No.12, RT.009/RW.004, Panjang, Kec. Magelang Tengah, Kota Magelang, Jawa Tengah 56111', NULL, '08112955563', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('40fcad6a-ba10-4edf-a419-3653e1ab544e', 'RS. Sekar Laras', 'Jl. Gajah Mada, RT.002/RW.015, Nglejok, Kuripan, Kec. Purwodadi, Kabupaten Grobogan, Jawa Tengah 58112', NULL, '081325879944', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4128d1d5-81af-4fb6-8c5d-a53c109c792f', 'PKU Muhamadiyah Cepu', 'Jl. Ronggolawe No.137, Megal, Balun, Kec. Cepu, Kab. Blora, Jawa Tengah', NULL, '081330415042', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('415e22bd-b07d-464e-8a50-5ba51605f48a', 'Apt. Mulia Pati', 'Jl. Penjawi No. 78 Randukuning, Pati Lor, Kec. Pati,  Kab. Pati 59111', NULL, '082313831606', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('41ba0561-d0c3-4dbf-9d78-d3fbf9c431a9', 'Apt. Luwes Agung', 'Jl. Bhayangkara No.43, Gubug, Kec. Gubug, Kabupaten Grobogan, Jawa Tengah 58164', NULL, '085727918365', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('41c49428-a5a9-4c67-954c-438d8c464727', 'Apt. Kimia Farma Abdurrahman Saleh', 'Jl. Abdulrahman Saleh No.82, Kalibanteng Kidul, Kec. Semarang Barat, Kota Semarang, Jawa Tengah 50145', NULL, '082243253615', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('41e4fc87-0c2d-4d59-81d3-338645447885', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('41f420e3-f3ab-4423-a548-958e0c2fbbe0', 'AP SEHAT JAYA', 'JL. BANDUNG, LOKTABAT, BANJARBARU', NULL, '81349456373', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('437d8dc3-d95d-4e3d-a01c-4bc36a25f94a', 'Ap Eterna Farma', 'Jl. Botolempangan No. 20 Lt. 3, Sawerigading, Ujung Pandang, Makassar', NULL, '081344288838', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('43e898cf-1640-4f57-ae11-689e0eca2002', 'Apt. Harapan Kita L24 Jepara', 'Rw. 3, Rengging, Kec. Pecangaan, Kabupaten Jepara, Jawa Tengah 59462', NULL, '0811277076', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('443f5e3b-30a7-42ff-a31b-91e78996d0b5', 'RSU NIRWANA', 'JL. PANGLIMA BATUR NO. 42 LOKTABAT UTARA, BANJARBARU', NULL, '81253206878', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('453b5d2e-2eaf-4aad-8cff-0e91a1ec23ee', 'Klinik Esensia', 'Jln. Rejosari 3, Gunung Pati', NULL, '085726830340', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('458adc1f-e78b-43da-a5b7-d8a3e5fa4a6d', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '81319929718', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('46c01ce6-4ca9-4aec-8143-33df00137db2', 'Apt. Manshurin Semarang', 'Jl. Ketileng Raya Semarang', NULL, '081325163457', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('47351ad0-bb94-4b5e-bb5f-885c333391d1', 'RSUD Ki Ageng Getas Pendowo', 'Jl. Ahmad Yani No. 57 Gubug Kec. Gubug Kab. Grobogan, Gubug, Indonesia, Central Java', NULL, '089507239576', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('475b6f49-aa43-4f8a-b38d-73b4f0048a3d', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '081393950603', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('48282f6c-9baf-42f9-af11-4082575cca16', 'RSUD DAMANHURI', 'JL. MURAKATA NO. 04 BARABAI BARAT, BARABAI, HULU SUNGAI TENGAH', NULL, '81347702211', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4852bb69-7962-49fc-a014-2cceebbc5a18', 'RS. Panti Rahayu', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '081575400847', 'apotek', '2025-05-08 15:07:08', '2025-05-05 11:38:20', '2025-05-08 15:07:08'),
('49a74506-5884-4620-961c-05ec145150ae', 'Apt. Alwina Farma 2', 'Ap Alwina Farma 2', NULL, '085282711331', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4a27be03-e6e1-480e-bf2a-bdf953825921', 'RS PKU Kutoarjo', 'RS pku kutoarjo', NULL, '082135956229', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4a6b64c6-cb6e-47f1-8e5d-924a42b79931', 'Apt. Kawatan', 'paten Jl. Singosari No.42b, Rejowinangun Sel., Kec. Magelang Sel., Kota Magelang, Jawa Tengah 56214', NULL, '081578689999', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4a897587-5894-4e4c-9d44-56ab0d434bc6', 'RSK Ngesti Waluyo', 'Jl. Pahlawan Jubug , Wanutengah, Parakan, temanggung', NULL, '085691754171', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4b3ffdfb-9077-4821-b4b7-679d462dd587', 'RSU SYIFA MEDIKA', 'JL. RO. ULIN, BANJARBARU', NULL, '082234464376', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4b8cc676-cbbd-4dc6-98ee-8f261bb86ddb', 'Apt. Azqishara Bombana', 'Apt. Azqishara Bombana', NULL, '081341737173', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4b8fc999-aef4-4dbb-9e0f-7635bcbb1cc2', 'RS. Hermina', 'Jl. Pandanaran , Semarang', NULL, '081973272410', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4bc0b715-9694-412e-9b09-8ac8b57129a9', 'RSIA Bunda', 'Jl. Brigjen Katamso No.8, Karangturi, Kec. Semarang Tim., Kota Semarang', NULL, '08122559995', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4c05b452-f163-4e7b-84b0-fc1cfedc1505', 'Kl Citra Mulia Blora', 'Jl. Gatot Subroto no. KM. 4, Tamansetro, Kec. Tunjungan, Kab. Blora, Jawa Tengah', NULL, '081215559565', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4c2af4fb-19a0-4507-8d07-1290113e8d8f', 'Dinkes Bombana', 'Bombana', NULL, '085342009696', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4c8ae908-e4ad-4043-b8f5-7ca90c8caaa1', 'Amanda', 'Jl. Raya Keruak, Keruak, Kabupaten Lombok Timur', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4d042a45-f898-4a12-a048-dedea650e338', 'RSUD Wonosobo', 'Jalan RSU Setjonegoro, No 1 , Stasiun, Wonosobo Barat,Wonosobo', NULL, '085229566279', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4d8c7216-207d-4922-812d-28fdde744d5b', 'RSIA Bunda', 'Jln. Bridjen katamso , Semarang', NULL, '0811274630', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4df6bb7b-95ad-4595-b9a7-5315d6f0f75d', 'Klinik Gravida', 'Jl. Magelang No.9, Bumijo, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55231', NULL, '082236088995', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4e09cb00-39fa-4c56-8230-bcccc8ccd9a8', 'RSUD DR.H.SOEMARNO SOSROATMODJO', 'JL. TAMBUN SUNGAI NO. 16, SELAT TENGAH, SELAT, KAPUAS', NULL, '85228290200', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4e964a6f-4640-4878-b756-290a8cadfef5', 'RSD DR. R. Soedjati Purwodadi', 'Jl. DI panjaitan No. 36 Purwodadi Kab Grobogan', NULL, '087833099082', 'apotek', '2025-05-08 15:19:59', '2025-05-05 11:38:20', '2025-05-08 15:19:59'),
('4ec93658-9193-4a52-b9c8-de0966743dbd', 'Apt. Grabag', 'Purworejo', NULL, '085701300345', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4ece4ef7-5f78-41ac-84a6-753f8638c134', 'Apt. Kawatan', 'Jl. Urip Sumoharjo No.48, Wates, Kec. Magelang Utara, Kota Magelang, Jawa Tengah 56113', NULL, '0811283900', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4facfc2f-f0d5-4c71-8f5c-8b413d32871f', 'Klinik Ibunda', 'Jl. Pramuka No.392 Kab. Banjarnegara', NULL, '081327458607', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4fad411a-9f34-4542-a31e-22d3c8f28518', 'RSUD Soedjono Selong', 'Jl. Prof. M Yamin SH No.55, Khusus Kota Selong, Kec. Selong', NULL, '81331497349', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('4faf60e8-5146-4079-a1f3-0e4da81a077b', 'Apt. Kimia Farma 374 Cepu-Blora', 'Jl. Ronggolawe Jl. Ketapang Sel. No.13c, Sidomulyo, Cepu, Kec. Cepu, Kabupaten Blora, Jawa Tengah 58112', NULL, '081229504040', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('50258b61-67af-43ee-b72f-044fd080840b', 'Apt. Sehati', 'Jl. Tlogosari raya 5, Semarang', NULL, '081914629595', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('514cd8cb-946f-4997-a842-a3594daee734', 'RSUD KI Ageng Selo Wirosari', 'Jl. Raya Blora - Purwodadi No.KM 19, Area Sawah, Kunden, Kec. Wirosari, Kab. Grobogan, Jawa Tengah', NULL, '081226700913', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('51598197-06e7-4f01-ad40-579208b9251e', 'Apt. Puji Husada', 'Jl. Tentara Pelajar, Tegal Slerem, Sedayu, Kec. Muntilan, Kabupaten Magelang, Jawa Tengah 56413', NULL, '087838891388', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('51e4f501-cc1a-4931-91c2-72e42d0256d7', 'Klinik Mutiara Hadi Kudus', 'Jl. Purwodadi KM 15 kalirejo Undaan Kudus', NULL, '081542815277', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('523bc6a4-2f29-4e3d-b011-1e6eaf13cd4b', 'Apt. Tiga Bintang', 'Jl. Raya Lasem, RT.1/RW.1, Gayam, Sumberejo, Kec. Pamotan, Kabupaten Rembang, Jawa Tengah 59261', NULL, '081325790555', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('52647f25-b810-4142-8646-1782a309b5df', 'RS Habibullah Gabus', 'Jl. Raya Tahunan, Krajan, Tahunan, Kec. Gabus, Kab. Grobogan, Jawa Tengah', NULL, '081294203206', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('52a157d8-90cd-4534-b68c-8c74dcb56d46', 'Apt. Kawatan', 'Jl. Sriwijaya 3 Magelang', NULL, '0811282256', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('53338bb4-27e8-4fba-9d68-f01579838551', 'RS Habibullah Gabus', 'Jl. Raya Tahunan, Krajan, Tahunan, Kec. Gabus, Kab. Grobogan, Jawa Tengah', NULL, '082241208814', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('536b8c31-c201-4031-9de8-5166d80237be', 'Apt. Mugi Waras 2', 'Jl. Teuku Umar No. 47 Jatingaleh', NULL, '081281869985', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('53cf977b-7cc4-4f59-8a91-993243cca7e9', 'Apt. Media Farma', 'Jl, Jumprit No 320, Dandu , Manggong, Ngadirejo,temanggung', NULL, '089603442642', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('548786d0-446d-4ff9-adf3-0968fbb22cdb', 'AP  KL  SIMPANG', 'JL. GAWE SABUMI', NULL, '81216311223', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('54a30b88-cf7e-48a4-8072-75cd0bb3e763', 'Klinik Mutiara Bunda', 'Jl. Prof Dr. Hamka no. 100', NULL, '081226699827', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('555b9d51-9728-4bdc-8718-7337679846c8', 'RS PKU MUH Temanggung', 'Jl. Raya Kedu Km. 2 Kalisat, Bulu, Temanggung', NULL, '089525835164', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('55772384-4903-4b3a-9d5d-208570ce97d3', 'Ap Zafa Farma', 'Jl Budi Utomo No 5', NULL, '081210001852', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('55b70384-06f6-4f1e-a433-9db17f5c76eb', 'Apt. Aira', 'Ruko Taman Niaga, BSB no. 6 Blok D', NULL, '083838994994', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5647d2af-d93e-4363-86ab-eb24e25cad88', 'Ap Singganipura', 'Jl Samratulangi', NULL, '0811450262', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('56642ced-5c11-42ad-b25f-ee382f9be8b6', 'AP  MEDIKA FARMA', 'JL. A. YANI KM. 34 LOKTABAT UTARA, BANJARBARU', NULL, '81357999075', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5682a3b5-33c1-4251-a04d-54bc9f8b4e21', 'Praktik Pribadi', 'JL. Pandanaran I 2, Karangkidul', NULL, '08164251450', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('56bcfd12-49c8-4cc2-884f-15525ec76af6', 'RSUD dr. Soetijono Blora', 'Jl. Dr. Sutomo No.42, Blora, Tempelan, Kec. Blora, Kab. Blora, Jawa Tengah', NULL, '085225637637', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5721a3a2-69f5-4a8c-a8fc-e41f334e1b06', 'Klinik Deka medika', 'Jl.klipamg raya ruko klipang golf view kav. C-6, Jl. Klipang Raya, Sendangmulyo, Kec. Tembalang, Kota Semarang', NULL, '081393256456', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('574ed58e-f56e-440b-be45-6bb2ef36869e', 'Apt. Toroh Farma', 'Jl. Hayam Wuruk no 24 Kabupaten Grobogan, Jawa Tengah 58192', NULL, '082136698186', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('57925445-bac5-4d48-a3c1-7266cc4e2c44', 'Apt. Krisna', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '08164266380', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('57d06136-a8f8-48f8-9ef9-cfbcb6301ebc', 'Apt. Seger Waras', 'Jl. Diponegoro No.113-115, Jobokuto I, Kauman, Kec. Jepara, Kabupaten Jepara, Jawa Tengah 59417', NULL, '081326756756', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20');
INSERT INTO `instansis` (`id`, `instansi`, `alamat`, `email`, `no_hp`, `kategori`, `deleted_at`, `created_at`, `updated_at`) VALUES
('5828fbf8-eec6-4efa-a320-aed7e5c43114', 'Apt. Mugi Waras 2', 'Jl. Teuku Umar No. 47 Jatingaleh', NULL, '087832880078', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5853b32f-ed49-41d2-aab0-8af56300fee5', 'RS PKU Kutoarjo', 'Jl. Kauman I No.6, Kutoarjo, Kec. Kutoarjo, Kabupaten Purworejo, Jawa Tengah 54251', NULL, '081393890635', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('586e6848-07fe-4e08-b9c0-1a51a7f12913', 'RSI. Sultan Hadlirin', 'JL. Raya Jepara Bangsri, Jepara', NULL, '0822252528501', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('589224a5-eb8e-4871-8aa1-de68eb2fca3e', 'Dinkes Morowali', 'Morowali', NULL, '081212488586', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('58edbc58-81ff-43fe-ae7c-a588482dfb37', 'RSUD dr. Soetijono Blora', 'Jl. Dr. Sutomo No.42, Blora, Tempelan, Kec. Blora, Kab. Blora, Jawa Tengah', NULL, '082232838235', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('59154f5a-651d-4553-951c-8be791c057e4', 'Kl Sehat Selaras Blora', 'Jl. Dr. Sutomo No.42, Blora, Tempelan, Kec. Blora, Kab. Blora, Jawa Tengah', NULL, '082117700364', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('593c7648-e7b1-4d28-baee-73f6f8ba0f6c', 'RS Charlie', 'Jl. Ngabean, Gowok, kec. Boja', NULL, '08123046804', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('59e4135d-a4f0-4340-ad1c-d28b6cfb140e', 'Rs Hati Mulia', 'Jl. D.I. Panjaitan No. 243 Kendari', NULL, '08114055212', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('59ecdfe1-6cf9-47b8-8db5-119e76f8ddb7', 'Apt. Setia Farma', 'Jl. Suyudono No. 100', NULL, '08157746268', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5a22ceca-a1f8-468a-9fa2-3ed1aaf3bb6e', 'Komala Dewi Masbagik', 'Jl. Raya Masbagik, labuhan lombok, Kec. Masbagik', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5af28d0d-aed9-4625-b665-6a911cb7705b', 'Risa Rafana', 'JL. Wage Batujai, Batujai, Kec. Praya', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5bc60136-c867-4f6b-a967-7007d975074c', 'Ap Athallah', 'Pasangkayu', NULL, '085399004432', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5bd778de-5941-4c55-a648-ff250a26f6ab', 'RS. Panti Rahayu', 'JL. Hayam Wuruk 24, Purwodadi', NULL, '081393650196', 'apotek', '2025-05-08 15:07:26', '2025-05-05 11:38:20', '2025-05-08 15:07:26'),
('5be84bf7-e703-41e0-8195-062c980710f9', 'RSIA Sadewa', 'Jalan Babarsari Blok TB 16 No.13B, Tambak Bayan, Caturtunggal, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', NULL, '08112800027', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5c1de8cc-70bc-4127-90ea-f1eb387c9426', 'Apt. SMS', 'Jl. Ki Mangunsarkoro No.41, Gabahan, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50135', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5c92876c-8d2e-408e-a33f-dd3541045a49', 'Apt. Satria Purwodadi', 'Jl. S. Parman 25, Purwodadi', NULL, '081325201636', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5ca930fd-7832-4f51-907a-16e82d9e9c86', 'Apt. Adhi Husada', 'Jl. Raya Mranggen Mo 95 Mranggen, Jagalan, Mranggen, Kec. Mranggen, Kabupaten Demak, Jawa Tengah 59567', NULL, '082134829512', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5cc76ed2-e03e-4aad-aa1e-16ead92d1c8e', 'Ap Hanifa Farma', 'Rsud Aloe Saboe', NULL, '0822210100', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5cf7471f-a343-4ed3-8401-03d847a3cbd9', 'Rsud Sinar Kasih Tentena', 'Rsud Sinar Kasih Gkst Tentena', NULL, '082347498428', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5cfe4948-d7b9-47d2-b4a6-855c85765a78', 'Praktek Pribadi', 'Jl. DR. Muwardi No.38/33, Kutowinangun Kidul, Kec. Tingkir, Kota Salatiga, Jawa Tengah 50742', NULL, '081329876677', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5d4451eb-3c89-43a1-913e-ce694a6208b5', 'Apotek Thabel', 'Jl.Pasukan Ronggolawe No24, WonosoboTimur , Wonosobo', NULL, '081328001377', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5d6a084c-6a2f-4e41-ba01-99d073fcc3e9', 'RSUD Gondo Suwarno', 'Jl. Diponegoro No.125, Ungaran, Genuk, Kec. Ungaran Bar., Kabupaten Semarang, Jawa Tengah 50512', NULL, '085640970154', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5d6e949b-f200-4d5b-84d6-fd674d73af12', 'RSI Wonosobo', 'Jl.Letjen S Parman NO Km 3 Mendolo, Bumireso, Wonosobo', NULL, '08122918104', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5d80d473-a415-4053-a86e-44d72d436f3c', 'Klinik Syira Ur Rahman', 'Jl. Letnan Tukiyat, Gunungan, Deyangan, Kec. Mertoyudan, Kabupaten Magelang, Jawa Tengah 56172', NULL, '083125992633', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5d96ed80-ca85-4b81-b9f2-d774b31f8890', 'RS. PKU Muhammadiyah Mayong', 'Jl. Pegadaian Mayong No.12, Gloge, Mayong Lor, Kec. Mayong, Kabupaten Jepara, Jawa Tengah 59465', NULL, '081226909013', 'apotek', '2025-05-07 10:48:12', '2025-05-05 11:38:20', '2025-05-07 10:48:12'),
('5dec3f79-8794-415a-b976-380db1a1dd73', 'RSUD BOEYASIN', 'JL. BALIREJO NO. 12, ANGSAU, PELAIHARI, TANAH LAUT', NULL, '081349167972', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('5df84848-b9e2-4c68-8b02-68284d8fc7f1', 'AP GARUDA ESTETIKA', 'MELAYU, BANJARMASIN', NULL, '81251738181', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('60496554-99bd-4e45-bfbf-df80c9e9a705', 'Ap Valentine', 'Jl Perumahan Dinas Kuda Mati', NULL, '081247277607', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('60c54850-beba-4e01-940d-0bfe81aadbba', 'RS. PKU Muhammadiyah Gubug', 'Jl. Letjend R Soeprapto No. 12 Grobogan', NULL, '(0292) 533102', 'apotek', '2025-05-07 10:46:55', '2025-05-05 11:38:20', '2025-05-07 10:46:55'),
('60d32a57-0c41-49e7-b9bf-a424b779e1f8', 'RSU ALMANSYUR MEDIKA', 'JL. A. YANI KM. 36 SUNGAI ULIN, BANJARBARU', NULL, '8128500248', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('61d799bf-4388-4d2d-9a8b-a5b8af7a3c87', 'Klinik Utama Keluarga Sehat', 'Ngarus, Kec. Pati, Kabupaten Pati, Jawa Tengah 59112', NULL, '08562732677', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('61f47c42-d829-4145-a455-4b4e897e02ea', 'KLINIK MATA BORNEO', 'JL. S. PARMAN NO. 74/21, BELITUNG UTARA, BANJARMASIN', NULL, '87816962826', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6257e27a-49d8-4b3a-bb55-8edd7e7989b7', 'Klinik Bhumi', 'Jl. Mayjen Bambang Soegeng No.315, Jarangan, Sumberrejo, Kec. Mertoyudan, Kabupaten Magelang, Jawa Tengah 56172', NULL, '081390500808', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('62cd1b4f-7d1a-4b76-8381-1d7aab66ae94', 'RS Hermina Pandanaran', 'JL. Pandanaran No. 24, Semarang', NULL, '08122810945', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('62d31167-76a5-44a2-93b3-944da3289ea5', 'Apt. Jampi Sae', 'Jl. Tlogosari Raya Semarang', NULL, '081326211888', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('639ccb1c-6284-4867-bb66-ed96a47c96f8', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '82323424455', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('63dbb64d-9e17-4b26-811d-78bb27de0628', 'Apt. Enggal Saras 2', 'Yogyakarta', NULL, '081328774444', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('64354ae5-ad83-45d5-97d5-b730f8bb62f5', 'Ap Lianza', 'Jln Panjaitan', NULL, '081355687450', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('64a10400-6cdc-4fbf-9871-2f4ea198c0fc', 'Apt. Laksmana', 'Jl. Sri Rejeki Utara no. 20', NULL, '082227702250', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('64c7ca0f-c4fa-4f6d-8d5d-31d7612cb5b1', 'Apt. Prima Husada', 'Jl. Urip Sumoharjo No.48, Wates, Kec. Magelang Utara, Kota Magelang, Jawa Tengah 56113', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('64f5ba85-e5a7-4760-8412-f351d3c2d735', 'RSUD KANUDJOSO DJATIWIBOWO', '', NULL, '081391959263', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6509c842-026a-41a8-b892-2a10f8dcd07b', 'Klinik Anugrah Pratama', 'Jl. Graha Mukti Raya No.1146, Tlogosari Kulon, Kec. Pedurungan, Kota Semarang, Jawa Tengah 50196', NULL, '085184807597', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('652a0154-bf1a-4c5c-8a23-3fcceb311d1b', 'Apt. Mini Seven', 'padamara,purbalingga', NULL, '085802254919', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6555bad3-a664-459a-a25c-3ef3b9ecee08', 'Apt. Media Farma 2', 'Jl. Raya Manyaran - Gunungpati No. 5 kp Getas, Nongkosawit, Gunungpati, Semarang', NULL, '0895363274549', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('655bef1d-d47c-4055-b90e-5790450d49e8', 'RS Hermina Semarang', 'Jl. Puri Anjasmoro L2 / 40 Semarang', NULL, '08156503336', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6572440d-0df7-4be8-85ac-2861eb124ec5', 'AP  AL KURBA NUR', 'JL. RANTAUAN DARAT NO. 9, PEKAUMAN, BANJARMASIN', NULL, '8179400579', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('65941ec6-6836-48f7-80df-fca1bee92eb0', 'RSU SYIFA MEDIKA', 'JL. RO. ULIN NO. 93 BANJARBARU SELATAN', NULL, '81521902048', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('65c1b222-cfe5-447b-babe-bbaf7d0e4b61', 'RSUD PULANG PISAU', 'JL. W.A.D DUHA KOMPLEK PERKANTORAN, MANTAREN I, KAHAYAN HILIR, PULANG PISAU', NULL, '85248487608', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('65f4d2c4-f902-4fa7-ba32-08ee926cfd9c', 'Ap Hikmah 2 Pinrang', 'Jl Yos Sudarso,Pinrang', NULL, '08112693105', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('668a7487-0bf9-46e4-ae11-13df0fc9a120', 'RSUD DAMANHURI', 'JL. PUTERA HARAPAN, MATANG GINALUN, PANDAWAN, HULU SUNGAI TENGAH', NULL, '81334734923', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('66c7d83f-2e21-4be3-8bfa-c9aaf74d0bec', 'Klinik Moro Agung', 'Jalan Raya, Sleko, Dukuhmulyo, Kec. Jakenan, Kabupaten Pati, Jawa Tengah 59182', NULL, '08122911994', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('66edbe5a-dd06-426d-8c58-f50a3a23fb4c', 'Kl Budi Lestari', 'Kl Budi Lestari', NULL, '081342913829', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('67203f51-a056-42b6-bb96-43e702ba1bc8', 'Ap Sarindah', 'Jl. Masjid Raya, Sengkang', NULL, '085397979763', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('67a5ea69-0864-4169-aa82-4ad02514b99d', 'RSUD DAMANHURI', 'JL. MURAKATA NO. 04 BARABAI BARAT, BARABAI, HULU SUNGAI TENGAH', NULL, '081348342555‬', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('67b70917-e659-4926-b0a7-3d644930f101', 'Klinik Bersalin dan Infertilitas Harapan Bunda', 'Jl. Jati Raya, Kalipasir, Kalirejo, Kec. Ungaran Tim., Kabupaten Semarang, Jawa Tengah 50515', NULL, '085700044561', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('680c68ee-3a1d-4604-b24c-b9c68ca6f281', 'Apt. Enggal Saras 2', 'The Jalimbar Residence A05, Jl. Imogiri Barat, Timbulharjo, Sewon, Bantul, Yogyakarta', NULL, '081354972298', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6810db49-a23f-4096-9efa-df4a53d88fbf', 'RS. Panti Rahayu', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '081234456807', 'apotek', '2025-05-08 15:07:38', '2025-05-05 11:38:20', '2025-05-08 15:07:38'),
('684f9a05-10c4-45e2-95a6-3f45a708ccb2', 'AP  IBNU SINA', '', NULL, '081331747217', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('68f6b360-efab-4d21-9861-4228f0368a95', 'Ap Nur Wahyu', 'Ap Nur Wahyu', NULL, '08115900577', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6977c58a-919a-454e-95d4-5ba1fbab573b', 'Apt. Eidola', 'Jln. Mahesa Mukti, Semarang', NULL, '08122844328', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('69d759cd-567f-4853-a972-4a1581c1b031', 'Keluarga Telaga Waru', 'Telaga Waru, Kec. Labuapi', NULL, '85228014780', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('69f92341-3d2c-4db6-bea9-33b7906425c9', 'Apt. Budi Farma', 'Kutabanjarnegara, Kab. Banjarnegara', NULL, '0811261692', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6a2f6e05-bbc0-46e1-ad9f-b98fbd418b45', 'RS. Permata Bunda', 'Jl. Hayam Wuruk No. 3 C Purwodadi', NULL, '08122737105', 'apotek', '2025-05-07 10:29:48', '2025-05-05 11:38:20', '2025-05-07 10:29:48'),
('6aad40b3-8eca-4abb-ad83-7c3debac6c41', 'Klinik Utama Rawat Inap Rahayu', 'Klinik Rawat Inap Rahayu Ungaran Jl. Kartini 207 C Ungaran', NULL, '081973272410', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6ae1e881-f176-473e-a447-608b4dbac1c5', 'RSU Puri Asih', 'Jl. Jend. Sudirman No.169, Gendongan, Kec. Tingkir, Kota Salatiga, Jawa Tengah 50743', NULL, '081352722570', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6b15edeb-a1c3-479a-a43f-17ba9a2e5b5f', 'Apt. Bina Sehat', 'Jl. Kalimas raya No. 29', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6b74e49f-fb46-41e4-ba0a-1c3c1428e16f', 'Klinik Dentfam', 'Jl. Seroja 1 No. 8', NULL, '081905068001', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6b9b6a50-9bf7-47b4-ae19-7aa5b5424486', 'RSUD Tidar', 'Jl. Tidar No.30A, Kemirirejo, Kec. Magelang Tengah, Kota Magelang, Jawa Tengah 56125', NULL, '081328665503', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6bcc4687-c59d-4ced-b541-4d5db8b4130d', 'Ap Fella', 'Ap Fella', NULL, '085776573794', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6cba8724-cdc0-417c-8fe4-c85e2cb0eb19', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '81237659880', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6cf600ce-1251-4212-9d02-2d440ffb9f33', 'YAYASAN SUAKA INSAN', 'JL. ZAFRI ZAM ZAM NO. 60, BELITUNG SELATAN, BANJARMASIN', NULL, '82225132008', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6dd6a2f2-62be-43a4-9d2b-ad9105dcc552', 'AP PERINTIS MANARAP', 'SIMPANG EMPAT, KERTAK HANYAR, BANJAR', NULL, '81257812205', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6dfde1d7-e39d-42c9-8c13-2dad9d8b5eca', 'RSU SYIFA MEDIKA', 'JL. RO. ULIN NO. 93 BANJARBARU SELATAN', NULL, '8152109777', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6e598a47-a002-4efb-9034-8f28883778fd', 'Klinik Mutiara Bunda', 'Jl. Prof Dr. Hamka no. 100', NULL, '081904320228', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6f0c94f2-8dd7-497f-a7ca-51e5c42fefe1', 'RSU. Permata Blora', 'Jl. Reksodiputro Kel No.57, Jenar, Kedungjenar, Kec. Blora, Kabupaten Blora, Jawa Tengah 58217', NULL, '081901087330', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('6fe0bf87-a277-4d0d-be44-9c5f18eb6f40', 'RSUD DAHA SEJATERA', 'JL. TAMBAK BITIN, DAHA UTARA, HULU SUNGAI SELATAN', NULL, '81289450057', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7049f24c-f8d1-4e45-acc5-4baa63b47a29', 'RSUD Wonosobo', 'Jalan RSU Setjonegoro, No 1 , Stasiun, Wonosobo Barat,Wonosobo', NULL, '081393077564', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('70c989b6-9bd9-4bbe-95d2-4b70556f8fe6', 'RSIA Bunda', 'Jl. Brigjen Katamso No.8, Karangturi, Kec. Semarang Tim., Kota Semarang', NULL, '081329929261', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('70fa132a-d70f-41e8-95c8-74ce7c89743c', 'Klinik Pratama Bina Estetika Nugraha', 'Glempang, Bancarkembar, Purwokerto Utara', NULL, '0811287679', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('711dad9d-a581-4039-af8e-072f5d31bd6b', 'RSD IDAMAN BANJARBARU', 'JL. CITRA MEGAH RAYA, LOKTABAT UTARA, BANJARBARU', NULL, '82130877777', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('714830db-6b05-4422-9ac9-272ddf3d8cc7', 'Apt. Wua-Wua', 'Jl. Ahmad Yani No. 149 Kendari', NULL, '081392617790', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('717f1389-157e-4069-bf09-e2f3366691e3', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '82254205125', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7188c416-786c-45de-aee8-6f32e50c1d70', 'Apt. Alfath', 'Jl. Hos Cokroaminoto No.68, Sukoharjo, Kec. Rembang, Kabupaten Rembang, Jawa Tengah 59218', NULL, '081329787793', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('72376c8f-2562-4089-ab66-b6d9666fc2e9', 'RSUD dr. Soetijono Blora', 'Jl. Dr. Sutomo No.42, Blora, Tempelan, Kec. Blora, Kab. Blora, Jawa Tengah', NULL, '085713276167', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('732824a4-3fd2-4522-9473-d89eeb94194f', 'Apt. Kuwu Purwodadi', 'Jl. Honggokusuman No.42, Kembangan, Tuko, Kec. Pulokulon,', NULL, '081228012012', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7358444a-411c-4c3d-b4cd-d83cdb51b381', 'Klinik PMI', 'Jl. Adhyaksa No.8, Brubahan, Kranji, Kec. Purwokerto Tim., Kabupaten Banyumas, Jawa Tengah 53116', NULL, '082242997459', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('73bc9395-3e91-4f52-8f50-e4fee4181827', 'Ap K24 Cepu', 'Jl. Mutiara III No.29, Ngelo, Kec. Cepu, Kab. Blora, Jawa Tengah', NULL, '08122811205', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('74159079-7d00-459b-9daf-a1cd4fe7f9d0', 'Apotek Graha Interna', 'Jl. Osamaliki No.68, Mangunsari, Kec. Sidomukti, Kota Salatiga, Jawa Tengah 50721', NULL, '0811270259', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('744c909e-d60b-4f49-ba53-a6041cbd95b0', 'Klinik IDI', 'Jl. Kauman Lama No.46, Cigrobak, Purwokerto Lor,', NULL, '085640440804', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7480863d-d49f-4f60-bb2e-7767a9940af9', 'Komala Dewi Masbagik', 'Jl. Raya Masbagik, labuhan lombok, Kec. Masbagik', NULL, '81231903888', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('74af9e08-0838-4b6b-9cec-9b887fa89a43', 'RSU ALMANSYUR MEDIKA', 'JL. A. YANI KM. 36 SUNGAI ULIN, BANJARBARU', NULL, '85651046777', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('74c0b7d0-4677-43df-b135-9d4f00afc0c2', 'RSI. Sultan Hadlirin', 'JL. Raya Jepara Bangsri, Jepara', NULL, '081369100818', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('75bb0705-33c0-4ce5-9d8d-71160f787978', 'Apt. Sugiyopranoto', 'JL.Siliwangi Raya', NULL, '0818450185', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7617ce3d-1da5-46bf-bb78-0dc3c440ee4b', 'RSU Asyiya Muntilan', 'Jl. Kh Ahmad Dahlan No.24, Kenalan, Pucungrejo, Kec. Muntilan, Kabupaten Magelang, Jawa Tengah 56414', NULL, '0811283982', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7693cd74-2165-4d80-980f-54a8c56ba086', 'Ap Wihdah', 'Ap Wihdah', NULL, '085242904436', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('76f8c12a-ebb9-4576-b80c-d05daff06b72', 'RSJ. Amino Gondohutomo', 'Jl. Brigjen Sudiarto No.347, Gemah, Kec. Pedurungan, Kota Semarang', NULL, '082328010439', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('77cb46bc-bda3-4fe9-9783-ab03c78f9623', 'Klinik Wiwit', 'Tegal Layang IX RT 02 Caturharjo, Pandak, Bantul, Yogyakarta', NULL, '085100898240', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('77fa3b9a-7efe-4d7a-a940-8814da044f38', 'RSU SYIFA MEDIKA', 'JL. RO. ULIN NO. 93 BANJARBARU SELATAN', NULL, '8113337191', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('79055ae2-50ed-4b56-97e2-6bd8a67f0243', 'RSUD BOEYASIN', 'JL. AHMAD YANI, ANGSAU', NULL, '081348343801', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('791bfa37-b38d-4f0b-a777-67befdafa216', 'Ap Adihusada', 'Jln Panjaitan 34 Gtlo', NULL, '0811431183', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('791c0149-8681-4e72-9ca4-a297353dd262', 'Klinik Harapan Sehat Keluarga', 'jl. Perumahan ketileng indah, Tembalang', NULL, '081248229453', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('794e77a2-1ed9-421a-833e-b8ee1bcafca2', 'Praktik Pribadi', 'Jl. Indraprasta Raya No. 12 Semarang', NULL, '081390280000', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('79fa3692-8b0a-405b-8f80-359fd9491fff', 'Ap Kf Sinindian', 'Jl Ks Tubun Sinindian', NULL, '085398588993', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7ae20a30-5d30-4cac-bc3e-0f14d696e36b', 'RS SARI MULIA', 'JL. P. ANTASARI NO.139, SUNGA BARU, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7b485457-f1a6-4968-ac8e-2209b910cb41', 'Apt. Tga Bintang', 'Jl. Pamotan, RT.01/RW.13, Candisari, Pamotan, Kec. Pamotan, Kabupaten Rembang, Jawa Tengah 59261', NULL, '081335979223', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7bd0478d-b703-49e6-bfb0-d247f2a19f5d', 'Apt. Usadani', 'Jl. Suyodono A52 Semarang', NULL, '0243563698', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7c558766-80e7-4f04-99a7-e93663f4be24', 'Apt. K24 Kudus', 'Jl. Hos Cokroaminoto No.48, Mlati Lor, Kec. Kota Kudus, Kabupaten Kudus, Jawa Tengah 59319', NULL, '085643442148', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7c6b5ef8-f0e7-457c-8111-355c047194cb', 'Ap Kimia Farma 479', 'Ap Kimia Farma 479', NULL, '081215630525', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7d76b844-756f-4bdb-be7c-677254fab621', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '08122985479', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7d99c3e3-e130-484d-b9d7-c5855a61d78e', 'RSUD PANGERAN JAYA SUMITRA', 'JL. BRIGJEND H. HASAN BASRI NO. 57', NULL, '81250179290', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7e1a7895-7942-4f18-bcca-13f6dadeddd5', 'Klinik Sumber Bahagia', 'Jln Tlogosari raya 5, Semarang', NULL, '085225480375', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7e6d5303-6052-405c-bfac-aae09aef2ab6', 'AP  ANNISA', 'JL. A. YANI RT 03 / RW 01 MABUUN, MURUN PUDAK, TABALONG', NULL, '81281155364', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7ec2cea3-7fa9-44e8-a338-fbdaf8cd45d6', 'Rs  Hati Mulia', 'Jl. Di Panjaitan No.243, Lepo-Lepo, Kec. Baruga, Kota Kendari', NULL, '085333375019', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7ee4b3f8-128b-4f1f-a9ad-b6a6b73505a6', 'APOTEK KLINIK MANDIRI', 'JL. TRANSMIGRASI', NULL, '82152231154', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7f0e54e9-72d4-49bf-b561-8bd1ce51775e', 'Ap Makmur', 'Ap Makmur', NULL, '082290328359', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7f1879b3-23f0-4d42-bea2-4851b24efd0f', 'RS Sebening Kasih', 'Jl. Raya Pati - Tayu No.99A KM.3, Area Kebun Dan Tambak, Pakis, Kec. Tayu, Kabupaten Pati, Jawa Tengah 59155', NULL, '082226263161', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7f92278b-817b-43df-b036-5f952c29f2c8', 'RS. Telogorejo', 'Jln. KH ahmad dahlan, Semarang', NULL, '08122863606', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7fb3be81-0c33-49cf-a24d-3bc92880311b', 'Ap Ibnu Sina', 'Jl. R.A. Kartini No. 3 Bau-Bau', NULL, '081242241109', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('7fb95e91-0af7-4d5a-93b6-aae75e375c5d', 'Apt. Sarika (PT Sarika)', 'JL. Lamper Sari 31, Semarang', NULL, '08562746400', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('808c14ac-ee3b-448d-aecd-b32f7f7199e1', 'RSU BERIMAN', '', NULL, '08113909369', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('808d3477-a8e3-4e01-9873-bc4bfc178e12', 'Klinik Bersalin dan Infertilitas Harapan Bunda', 'Jl. Jati Raya, Kalipasir, Kalirejo, Kec. Ungaran Tim., Kabupaten Semarang, Jawa Tengah 50515', NULL, '081325212444', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('80b56c45-1c6f-47fd-a3a2-325f94588573', 'Apt. Poncol', 'Jl. Imam Bonjol No. 31', NULL, '081802420272', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('82226e9a-97f3-45bd-a0a8-fbe198c4964e', 'RSIA Gunung Sawo', 'Jln. Erlangga raya, Semarang', NULL, '085641382345', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('82417c5b-ef1a-4aab-865f-15d3ac423394', 'Klinik Utama Rawat Inap Rahayu', 'JL. Kartini No. 207 C, Dliwang Ungaran, Ungaran', NULL, '08817625393', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('825197e2-5605-463f-9c59-a23b71b6ddd4', 'Ap Nurul', 'Jl Mangga', NULL, '081234666651', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8253c70a-3aa0-4119-be2e-16681b4da29c', 'RSU HANDAYATI', 'JL. H. ISBAT, KUPANG, TAPIN UTARA', NULL, '81344007231', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('830dddb0-19cf-4bef-b024-0f955dfb1d20', 'RS. Permata Bunda', 'JL. Hayam Wuruk 24, Purwodadi', NULL, '081527931917', 'apotek', '2025-05-07 10:30:07', '2025-05-05 11:38:20', '2025-05-07 10:30:07'),
('83a41dd8-1695-4244-a757-87fe879008fd', 'Apt. Waringin', 'Jl. Diponegoro No 26, Puntuksari, Temanggung', NULL, '08122594310', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('83f1a7a0-8fd5-4664-8a7f-be0ac65b2bae', 'RS. PKU Muhammadiyah Gubug', 'Jl. Letjen Suprapto No 12, Kwaron, Gubug, grobogan', NULL, '081367006672', 'apotek', '2025-05-07 10:47:11', '2025-05-05 11:38:20', '2025-05-07 10:47:11'),
('840d867b-9ebb-43e6-a003-b193be3050f3', 'RS PERTAMINA TANJUNG', 'JL. GAS NO. 1 KOMPERTA TANJUNG, MURUN PUDAK', NULL, '81326313389', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('845a13af-a8e7-448f-95a3-83803d0f66df', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '81250713506', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('84d8da4d-dce5-4aa1-9e62-761dbca87f0f', 'Apt. Biodika Makassar', 'Jl Lasinrang Makassar', NULL, '082347935714', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('85196291-6662-470d-9887-3f51ea82debb', 'Rs  Konawe', 'Jl. Pangeran Diponegoro No. 301, Tuoy, Unaaha, Konawe, Sulawesi Tenggara', NULL, '08114099173', 'apotek', '2025-05-06 08:54:21', '2025-05-05 11:38:20', '2025-05-06 08:54:21'),
('85ea2cb4-f11f-472f-98ee-a883c7706570', 'Apt. Mrican', 'Jl. Kumudasmoro utara no. 17, Bongsari', NULL, '085869951858', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('85eadd63-7a07-4d26-b605-b73deb305f03', 'RSUD Soedjono Selong', 'Jl. Prof. M. Yamin, SH No. 55 Selong', NULL, '81339739149', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('86884864-d202-4553-936f-d02f9a6f4c55', 'Rs Aghisna Sidareja', 'Jl. Jendral Sudirman No. 40 Sidareja', NULL, '082324856000', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('878dd6ee-dc7c-46dc-9c86-222a16ab5576', 'Klinik Gigi Nadira Sukun', 'Komplek Ruko Sukun Blok B1, Srondol Wetan Banyumanik Semarang', NULL, '0895373082711', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('87edeb0a-b342-46bc-8969-6a7a95f55172', 'RS MELOY', '', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('881ddb7f-10b5-4061-b2ce-c75cedf92f6a', 'RST Wijayakusuma', 'Jl. Prof Dr. HR Bunyamin, Purwokerto', NULL, '08112937898', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('886f41f5-3e2f-4f3f-97a0-667cccaa805d', 'RSUD DAMANHURI', 'JL. A. YANI RT 016/003 MANDIMGIN, BARABAI, HULU SUNGAI TENGAH', NULL, '82350978888', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8874e171-ed1a-4076-bf51-d22cc0e102da', 'RSKIA MAHKOTA BUNDA', 'JL. AES NASUTION NO. 102, GADANG, BANJARMASIN', NULL, '82234257027', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('88b4738f-533b-40e3-954f-033fb4162a95', 'RSK Ngesti Waluyo', 'Jl. Pahlawan Jubug , Wanutengah, Parakan, temanggung', NULL, '085329303377', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('88e45e85-bb26-4450-bca3-084f4b2fe2b7', 'Apotek Ada Farma', 'Jl Saubari NO40A. Karangtengah, Parakan Kauman, Parakan , temanggung', NULL, '08164272384', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('891445ea-372c-4eca-a2c2-fe527eb8b8ca', 'Apt. Akmal grup', 'Jln. Gajah Mada no 10, Purwodadi', NULL, '0811274541', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('893289e6-f7e1-45bf-80bd-55babe4324c0', 'RS. Permata Bunda', 'JL. Hayam Wuruk 24, Purwodadi', NULL, '0811270810', 'apotek', '2025-05-07 10:31:34', '2025-05-05 11:38:20', '2025-05-07 10:31:34'),
('89c4943d-3d6a-4c2c-86e2-e104fa8628d7', 'Apt. Kimia Farma 71', 'Jl. DR. Soetomo No. 3', NULL, '081226659459', 'apotek', '2025-05-06 09:28:40', '2025-05-05 11:38:20', '2025-05-06 09:28:40'),
('8a334ab7-adc1-46bf-8830-3162cd0e7a95', 'Apt. KF Ngaliyan', 'PLN Krapyak', NULL, '085100315116', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8b380782-4741-44e1-a45a-af1d514957b8', 'RSIA Puri Agung', 'Jl. Pahlawan No.119, Potrobangsan, Kec. Magelang Utara, Kota Magelang, Jawa Tengah 56116', NULL, '082322275428', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8b482e43-4324-4e64-97bf-bb017d7c43db', 'Apt. Pelangi', 'Jl. Dr. Wahidin No. 197A', NULL, '085802229199', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8b6804b6-7d0b-4c32-94b2-577d01195206', 'RSU Bunda', 'Jl.Pramuka No.249-Purwokerto', NULL, '0818275574', 'apotek', '2025-05-07 10:28:45', '2025-05-05 11:38:20', '2025-05-07 10:28:45'),
('8b81ed77-abfb-4432-b9e0-e5a326d798be', 'RS Telogorejo', 'Jln. KH ahmad Dahlan, Semarang', NULL, '08122924346', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8c6254cc-6eff-41ef-a323-63e3cf7504de', 'Ap Kf 748 Sao-Sao', 'Ap Kimia Farma 748', NULL, '081215630525', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8d62d514-82ab-40f8-9d72-42977d10f745', 'Apt. Salsabila', 'Jl. Jenggolo 42 Magelang', NULL, '08562966500', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8df3d50e-9412-4e32-b230-66d0b9bd2b86', 'RSUD DAMANHURI', 'BARABAI DARAT, BARABAI, HULU SUNGAI TENGAH', NULL, '82136504950', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8e400e24-bb65-428a-b9ea-01e55ddb7ce8', 'Apt. Graha Medika Wirahusada', 'Apt. Graha Medika Wirahusada', NULL, '081356442951', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8ebaed7b-8525-490b-abcc-3c13cf201ee0', 'AP NABILA FARMA', '', NULL, '082140955471', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('8fcaf311-7c6a-4ce0-a293-b0ce3662f985', 'Ap. Sukun Semarang', 'Jl. Bina Remaja NO.1 Srondol Wetan Semarang', NULL, '081513651313', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('901b2352-5ddb-453e-bc08-d3051a7066fa', 'Klinik Griya Medika Purwodadi', 'Jl. Raya jeketro, Godong, Jawa Tengah, Indonesia', NULL, '082221885322', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9092fe4a-1fc5-4cec-a4b3-ef210438b222', 'Apotek Krisna', 'Jl. Pahlawan Jubug , Wanutengah, Parakan, temanggung', NULL, '08215106040', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('90a326b6-b917-41ca-963f-5a533746a2e9', 'APOTEK FOLLA CLINIC', 'JL. A. YANI KM. 23 LANDASAN ULIN TENGAH, BANJARBARU', NULL, '82271216096', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('90d9d56f-ada0-42b0-b8b4-af4a8c312091', 'RSUD Sunan Kali jaga', 'Jl. Sultan Fatah No.669/50, Bogorame, Bintoro, Kec. Demak, Kabupaten Demak, Jawa Tengah 59511', NULL, '081337768886', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9170340a-92e9-48d9-b51f-4e48e3ed30ef', 'RS. Permata Bunda', 'JL. Hayam Wuruk 24, Purwodadi', NULL, '08122822701', 'apotek', '2025-05-07 10:32:25', '2025-05-05 11:38:20', '2025-05-07 10:32:25'),
('91cf12aa-c062-46e1-8ff1-9594eb16591e', 'RS PERTAMINA TANJUNG', 'JL. GAS NO. 1 KOMPERTA TANJUNG, MURUN PUDAK', NULL, '8125473497', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('91ddf509-6744-4c80-ba28-2a88c5612360', 'Apt. Magelang', 'Jl. Mataram 59, Magelang', NULL, '081139912828', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9241ad41-2296-4b8a-aaed-52fe31881b41', 'Apt. K24 Anjasmoro', 'Jl. Puri Anjasmoro blok N2', NULL, '089648821932', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('927dc2d5-62ba-4b23-81da-e62b9ea31b89', 'Klinik Agape', '', NULL, '081383730873', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('929b33bb-4d24-44ed-a422-151cda450878', 'Risa Rafana', 'JL. Wage Batujai, Batujai, Kec. Praya', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('92c30a78-dd57-44c9-8b53-228de9326d46', 'Klinik PMI', 'Jl. Adhyaksa No. 8 Purwokerto', NULL, '085398394011', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('92e46ede-8ab7-4e15-a562-b85ed41411af', 'Apt. Hikorla', 'Apt. Hikorla', NULL, '082347928988', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9313aa26-24a6-4270-b7b9-c04482e53ee8', 'Rsia Siti Khadijah', 'Instalasi Farmasi Rsia Sitti Khadidjah', NULL, '081340888328', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('934c5238-7ea4-40b4-8df3-3f5bb52801e8', 'Apotek Hidup', 'Jl Suyoto No 135, Jampiroso, Kertosari, Temanggung', NULL, '087705382000', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('93dad689-bd98-4245-94ff-304ef9ffae56', 'Rs Sinar Kasih', 'Jl. Buntu No.8A, Pantan, Kec. Makale, Kabupaten Tana Toraja, Sulawesi', NULL, '082190246300', 'apotek', '2025-05-05 14:20:52', '2025-05-05 11:38:20', '2025-05-05 14:20:52'),
('93e7a2d2-2729-42e6-a718-eebea296b9ac', 'APOTEK ABID FARMA', 'JL. RAYA BATULICIN NO. 11', NULL, '8114108385', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('941a29d0-ec1c-460c-b409-981efdc25841', 'Klinik Pratama Budi Utami', 'Desa Jepang RT.04 RW.06 Mejobo Kudus', NULL, '085741888755', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('945a1a67-6c20-4d71-aa33-fe543137938b', 'Apt. Triana', 'Jl. Lettu Sugiarno 6A Keji, Muntilan', NULL, '0811282998', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('946850ec-6a52-4c1b-abe6-03154d92e4e6', 'Klinik Utama iBunda', 'Jl Letkol Subadri km0.5, Sleman 3, Triharjo, Kec. Sleman, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55514', NULL, '081326012042', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('949e57cd-f804-482c-98a4-e05ed9966aaa', 'Ap Minasaupah', 'Jl Brigjend Katamso', NULL, '081341019497', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('95419330-ca47-4b2c-8ea8-612fa71b5ed6', 'RSU SYIFA MEDIKA', 'JL. RO. ULIN NO. 93 BANJARBARU SELATAN', NULL, '8115012829', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9552e5bd-c2bd-47d5-afd2-13e1203ac63e', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '82255324313', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('956135fa-4b43-44a4-b1e8-1c9fee55f45a', 'Pt Anita Jaya Medika', 'Jl. Bukit Permai, Bau - Bau', NULL, '085399502340', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('956b5b78-19b6-4be8-b0c7-79cab8ba4bcf', 'RS. Panti Wilasa Citarum Semarang', 'Jl. Citarum Raya No 58 Semarang', NULL, '08122900047', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('959d061f-08d1-4ea2-84e2-c317907cf5b8', 'KLINIK RS.IBU  ANAK CERIA', 'HAMALAU, SUNGAI RAYA, HULU SUNGAI TENGAH', NULL, '82151346550', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('961bd842-ae72-49b3-9181-5075a14d9718', 'Apt. Bregas Medika', 'Kutabanjarnegara, Kab. Banjarnegara', NULL, '081578351513', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('963dd73c-a88d-49e0-a30d-e59b5d7c0092', 'Ap Taman Seribu Lampu Blora', 'Jl. RSU No.81, Bulansawahan, Balun, Kec. Cepu, Kab. Blora, Jawa Tengah', NULL, '085641680680', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9667faa9-e3d8-4373-866d-891eb67a9d4a', 'RS. Panti Rahayu', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '085647035599', 'apotek', '2025-05-08 15:07:48', '2025-05-05 11:38:20', '2025-05-08 15:07:48'),
('966ccd24-8d28-4783-bc66-6d58a57ccf44', 'RSU Bunda', 'Jl.Pramuka No.249-Purwokerto', NULL, '081223453529', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('96e83b88-3ac2-4ace-80cf-e00e1cabd810', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '081328710091', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('96fd89fc-1f5a-45b9-ab53-debbe4c2efe1', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '85251428888', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('97b265ee-442a-4b6c-9f1d-0a48509dd131', 'APOTEK WIDYA', 'RANTAU KANAN, TAPIN UTARA', NULL, '81910742117', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('983d3e7c-1d50-49e9-9771-e36e2ea57bbc', 'RSK Ngesti Waluyo', 'Jl. Pahlawan Jubug , Wanuengah, Parakan, temanggung)', NULL, '081273999357', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('985f7586-9505-42dc-94e3-438009473ef0', 'Apt. K24 HOS Cokroaminoto', 'Green Kuntan Residence K.5 Jl. Wates, Sedayu, Yogyakarta', NULL, '087885716293', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9868bb58-d7b7-4004-bd9e-ab9f87a68fe3', 'RS Ummu Hani', 'Jl. D.I Panjaitan No.40A, Purbalingga, Purbalingga Lor, Kec. Purbalingga, Kabupaten Purbalingga, Jawa Tengah 53472', NULL, '0895322084820', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('98ca4795-a086-48e4-bdf0-e3b26c9e09af', 'Klinik Wahyu Husada', 'Jl. Jogja - Wonosari KM 7 Gunung Kidul, Yogyakarta', NULL, '(0274) 329314', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('99132e3f-6fa9-4d57-9dbd-18a66d72c801', 'RST Magelang', 'Jl. Urip Sumoharjo No.48, Wates, Kec. Magelang Utara, Kota Magelang, Jawa Tengah 56113', NULL, '081232412253', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('99154743-fe9a-401a-803f-36bc127c7e36', 'RSUD ANSARI SALEH', 'JL. BRIG. JEND. HASAN BASRI NO. 1, ALALAK UTARA, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('993a2cd6-91d0-499b-886f-375326dfca9c', 'RS. Panti Rahayu', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '082127127007', 'apotek', '2025-05-08 15:08:09', '2025-05-05 11:38:20', '2025-05-08 15:08:09'),
('996fa924-0598-4a3d-b948-968d531163a5', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('999aefce-0ef3-40ea-894f-ec640c27eca3', 'Apt. Rapha Medica', 'Jl. Kudus - Purwodadi No. 15, Ketanjung, Tj. Karang, Kec. Jati', NULL, '0818291686', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('99bbcf87-bd88-4a3a-8d92-7d88c6054846', 'Ap Kimia Farma Di Panjaitan', 'Komplek Btn Kendari Permai, Kendari', NULL, '08233352336', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('99d7e013-c783-4724-a8d1-155c93d5d622', 'Apt. Gama Farma', 'Jl. Jiwonolo No.10A, RT.7/RW.Rt2, Pati Kidul, Kec. Pati, Kabupaten Pati, Jawa Tengah 59114', NULL, '081328618951', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9a11a517-4139-4515-9da2-3b5e0b3a2c3e', 'Risa Rafana', 'JL. Wage Batujai, Batujai, Kec. Praya', NULL, '87864148677', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9a80a13e-852f-49e9-9756-ae191da450b3', 'RSUD Banyumas', 'Jl. Rumah Sakit No.1, Kejawar, Kec. Banyumas', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9a9018cf-c48c-4b1e-9696-ac3eb1699578', 'Ap Aflah Farma Kendari', 'Jl. Jend. M.T. Haryono, Bende, Kadia, Kendari', NULL, '081257444400', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9abb5d58-c883-4e5d-a69b-4f7075a3cd18', 'Apt. Krisna', 'Kauman, Medari, Kec.Ngadirejo,Kab Temanggung', NULL, '08312567057', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9ac65d3d-68b5-44dd-ac50-726b2943a601', 'Apt. Kharisma', 'Jl. Wotgandul Timur No. 8', NULL, '08112990091', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9b4302b3-d4b5-4514-8a75-3ff087028dac', 'Ap Mugi Waras Wirosari', 'Jl. Kusuma Bangsa No.175-177, Bandang, Kunden, Kec. Wirosari, Kab. Grobogan, Jawa Tengah', NULL, '0811282304', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9b52a348-26be-4969-ab2e-f43e89a4475e', 'YAYASAN SUAKA INSAN', 'JL. ZAFRI ZAM ZAM NO. 60, BELITUNG SELATAN, BANJARMASIN', NULL, '811511692', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9b71f538-13d0-4c25-99f9-d6348e603ae6', 'Ap DWS Blora', 'Jl. Maluku No.14, Jetis, Kec. Blora, Kab. Blora, Jawa Tengah', NULL, '081390009541', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9b8762b9-4257-426f-8621-211c6a373b8a', 'APOTEK GHAZA', 'JL. RAYA PANDAN ARUM RT 16 BELIMBING RAYA', NULL, '81250166064', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9ba932aa-2357-47ac-9349-7b9906aae58a', 'Apt Restu', 'Jl Mappayuki', NULL, '0811463780', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9bc149c4-e894-4eee-a68b-dea6f95ee32e', 'KLINIK BIDAN ASMAWATI', '', NULL, '081316511149', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9bcc2ec4-9355-48fe-90b5-03bc58aa04bc', 'RS KAEYZA MEDIKA', 'KOMP. BUMI CAHAYA BINTANG, JL. GEMINI NO. 22 BANJARBARU', NULL, '81251337777', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9bf0d093-7a43-4412-afa4-b9306e08d11a', 'Lestari', 'Jln. Gajah Mada No. 9-10 Jempong', NULL, '81339854541', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9c0b23a6-3b03-467f-aaa5-7f717a8dafd3', 'Apt. Kinanthi', 'Jalan Mayor Kaslam, No13, Sumberan Selatan, Wonosobo Barat, Wonosobo', NULL, '08122956323', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9d614b93-650b-4f7c-8fb7-db78b3e8e01a', 'RSK Ngesti Waluyo', 'Jl. Pahlawan Jubug , Wanutengah, Parakan, temanggung', NULL, '08122920930', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9d6b0343-df24-49ec-8ea7-acd64e9a4397', 'RSUD Ajibarang', 'Jl. Raya Ajibarang Pancasan', NULL, '08112297220', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9e1a30c8-7bef-4376-bf88-a8ed1888a84e', 'Ap Regina Farma 24', 'Jl. Sultan Hasanuddin No. 57, Batulo, Wolio, Bau-Bau', NULL, '085219548866', 'apotek', '2025-05-06 10:55:06', '2025-05-05 11:38:20', '2025-05-06 10:55:06'),
('9e5a7a3d-90c3-436f-ac93-2d876c712d48', 'RS. PW dr. Cipto', 'Jl. Dr. Cipto No. 50, Bugangan, Semarang Timur, Semarang', NULL, '081325638313', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9e822223-d074-46a6-92fb-52459c27d808', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '8156634585', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9e9c19d2-f835-4444-b3ce-43ffe3c0c3b2', 'RSU Ananda', 'Jl. Pemuda No. 20 Purwokerto', NULL, '085726315535', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9ee0d638-ba6d-43f8-9387-ea9cc3eed9f8', 'RS Pak Uwi', 'RENGASDENGKLOK KARAWANG', 'info@rspakuwi.com', '082737263527', 'rs', NULL, '2025-05-10 13:50:39', '2025-05-10 13:50:39'),
('9eed41a1-d63a-4296-a165-827f9722816c', 'Apt. Kinanti', 'Jl. Dieng No 24, Wonosobo Timur, Wonosobo', NULL, '081238575662', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9efc4fd4-74e4-454b-a804-f0dd4875c54f', 'Apt. Kartika Medika', 'Jl. Jati raya No.G14', NULL, '081326674999', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9f4a59cd-2a3b-43d6-a0c5-665d142e6233', 'RSU NIRWANA', 'JL. PANGLIMA BATUR NO. 42 LOKTABAT UTARA, BANJARBARU', NULL, '82217797711', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9f89b2bf-4992-4e3f-b282-a407b3ad1eea', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '85225067657', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9fd552dc-3f6b-4cd7-b55e-a0ed675668ab', 'Apt. Ibunda (Purwodadi)', 'JL. Letjen R. Soeprapto No. 89, Purwodadi', NULL, '081327774983', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('9ffde6ee-4184-424d-bc79-f51f9b911429', 'Ap Bintang Farma', 'Jl. Ahmad Yani, Muna', NULL, '082347281956', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a0063305-3be2-49ce-aa1e-e3a69817b59d', 'Apt. Ben Waras Demak', 'Jalan Sultan Fatah, Ruko, Depan Pasar Bintoro No.mor 03, Petengan Selatan, Bintoro, Kec. Demak, Kabupaten Demak, Jawa Tengah 59511', NULL, '082134233244', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a088e113-17db-4b92-a99d-fe18df9e854b', 'Apt. Grabag', 'Jl. Letnan Tukiyat, Gunungan, Deyangan, Kec. Mertoyudan, Kabupaten Magelang, Jawa Tengah 56172', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a0a12ef9-ef4a-4c4d-8cf0-bf6ef48cf5fb', 'RS. Mitra Bangsa', 'Jl. Kol. Sugiyono No. 10 D', NULL, '081225153406', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a0dfdf88-82b1-4329-b70d-bcaa8032f18a', 'RSUD Merah Putih', 'Jl. Kartini No.13, Balemulyo, Muntilan, Kec. Muntilan, Kabupaten Magelang, Jawa Tengah 56411', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a0e0eeb4-3e47-4ed3-9bc7-3b62df550819', 'RS. Mitra Bangsa', 'Jl Gunung Mulyi RT 02/V Juwana Pati', NULL, '081225199333', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a116ab99-a451-4b13-a648-fd0f84b06c75', 'Apt. Citra Medika', 'Jl. Pahlawan No.39, Kabongan Kidul, Kec. Rembang, Kabupaten Rembang, Jawa Tengah 59218', NULL, '082242424939', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a165ea0a-8021-42aa-a9ce-0646b82b0a11', 'RS Telogorejo', 'Jl. KH. Ahmad Dahlan', NULL, '081325638313', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a1682fce-105e-438f-9da8-4f264968889c', 'IFRSU MAWAR', 'JL. PANGLIMA BATUR NO. 52 BANJARBARU', NULL, '81350686970', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a2ed9aa8-5435-49a4-95e0-ccea7d03c4bb', 'Apt. Satria Purwodadi', 'Jl. S. Parman 25, Purwodadi', NULL, '089526945519', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a33e194e-beaa-431f-be7d-512ceac90fdd', 'Apt. Grabag', 'Jl. Raya Kemiri Winong Km. 2 No. 12 Winong, Purworejo', NULL, '085758561348', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a3b28d13-7e44-4f75-98c6-b1b9cd08495c', 'RSKIA MAHKOTA BUNDA', 'JL. AES NASUTION NO. 102, GADANG, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a3b328b2-1f37-4807-8e8d-82ffb705e64a', 'Ap Mds Farmaap Bintang Farma Mks', 'Jl. Sungai Saddang', NULL, '08114137641', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a3c99122-3e35-408e-a2e6-63467e504541', 'RSUD PAMBALAH BATUNG', 'JL. NORMAN UMAR NO. 07 RT. 07 KEBUN SARI, AMUNTAI TENGAH, HULU SUNGA UTARA', NULL, '82155609095', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a4511b44-596c-469f-a9e9-6d4d2ec24b63', 'RSUD Samin Surosentiko Randublatung', 'Randublatung, Kec. Randublatung, Kab. Blora, Jawa Tengah', NULL, '08112641503', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a4765859-a79c-4424-bb3a-0d69c42a14e5', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '8125130516', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a4bfe316-4664-4434-9073-ed64c591f182', 'Rsu Budi Sehat', 'Jl. Jenderal Sudirman No.60, Rw. I, Doplang, Kec. Purworejo, Kabupaten Purworejo, Jawa Tengah 54114', NULL, '08129450025', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a4c5692c-7a92-4940-864a-d7670f5aa348', 'Apt. Prima Husada', 'Jl. Ahmad Yani No.33A, Magelang, Kec. Magelang Tengah, Kota Magelang, Jawa Tengah 56116', NULL, '0811258983', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a50cea28-58ef-455d-b6d0-1c56ae4e5490', 'RSIA Puri Agung', 'Jl. Tidar No.30A, Kemirirejo, Kec. Magelang Tengah, Kota Magelang, Jawa Tengah 56125', NULL, '081326311630', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a59b50e6-e165-42e3-b81e-3c153b346aed', 'Apt. PIP Semarang', 'Jl. Singosari No. 2A Wonodri, Semarang', NULL, '085641305525', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a5c3a4ee-5466-4703-b6c4-a21636458837', 'Apt. Kroden Jati', 'Jl. Babalan - Prawoto, Pejaten, Jati Kulon, Kec. Jati, Kabupaten Kudus, Jawa Tengah 59346', NULL, '081236367577', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a7189113-1067-422e-b1ff-5b9fe02e41b1', 'Klinik Ibunda', 'Jl. Pramuka No.392 Kab. Banjarnegara', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a7ac9787-5147-4d02-a60e-dcc7c007d838', 'Apt. Citra Medika (Rembang', 'Jl. Pahlawan No.39, Kabongan Kidul, Kec. Rembang, Kabupaten Rembang, Jawa Tengah 59218', NULL, '081578846517', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a8571998-979f-4406-9bda-718545c56b9c', 'AP K24 TANJUNG TABALONG', 'JL. MABUUN RAYA, MABUUN, MURUN PUDAK, TABALONG', NULL, '81351975285', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a86b54ba-e19e-4837-8ec1-8a9fba43fffa', 'KLINIK CAHAYA IMANI', 'JL. BRIGJEN H. M. YUSI, KANDANGAN UTARA', NULL, '81227113006', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a8e09c15-b97f-4910-b560-3db59b09faa7', 'Apt. Dhani,', 'Apt. Dhani,', NULL, '082393130636', 'apotek', '2025-05-05 14:13:46', '2025-05-05 11:38:20', '2025-05-05 14:13:46'),
('a9bca315-3e99-48fb-927e-d3e5aa7a328a', 'Praktek Pribadi', 'Jl. Johar No.20, Kalicacing, Kec. Sidomukti, Kota Salatiga, Jawa Tengah 50724', NULL, '08562686110', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('a9ebb54a-5b12-4e0e-bc9e-94c5ca9020e2', 'Rs Pmi', 'Jl. Mayjend. Sutoyo No. 8 Kendari', NULL, '081382767669', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('aa017467-df9a-4963-b284-0a193679c9d5', 'RS UAD', 'Jl. Cindelaras Raya No.33, Karangsari, Wedomartani, Kec. Ngemplak, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55584', NULL, '082136440574', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20');
INSERT INTO `instansis` (`id`, `instansi`, `alamat`, `email`, `no_hp`, `kategori`, `deleted_at`, `created_at`, `updated_at`) VALUES
('aa4cfef3-396b-4110-8126-c8bb2b89dd86', 'Ap 46 Cepu', 'Jl. Tuk Buntung No.34, Sidomulyo, Cepu, Kec. Cepu, Kab. Blora, Jawa Tengah', NULL, '085890429160', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ab622c03-18ff-4702-ba64-fd6a9f7a5959', 'Ap Sahlah Farma', 'Jl. H. M. Sewang Barru', NULL, '085256415559', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('abcf3833-ac6f-4108-ae42-e0ca5ac6ba37', 'RSD IDAMAN BANJARBARU', 'JL. A. YANI KM. 36 SUNGAI ULIN, BANJARBARU', NULL, '82154955988', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('abeea33c-f8de-4be8-add7-1539b5c606ef', 'Apt. Mulia Pati', 'Jl. Penjawi No.78, Randukuning, Pati Lor, Kec. Pati, Kabupaten Pati, Jawa Tengah 59111', NULL, '087735276387', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('aceaa770-5c89-45e5-94b8-837f2b197d59', 'RS Permata Blora', 'Jl. Reksodiputro Kel No.57, Jenar, Kedungjenar, Kec. Blora, Kab. Blora, Jawa Tengah', NULL, '082136078433', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('acf08ca6-cd03-4018-aee5-222aab7179d3', 'Apt. Randu Kuning', 'Jl. Kolonel Sugiyono, Winong, Kec. Pati, Kabupaten Pati, Jawa Tengah 59112', NULL, '08156541595', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ad125acd-9d4d-47fa-9804-be5c29a59ee6', 'KLINIK RS.IBU  ANAK CERIA', 'HAMALAU, SUNGAI RAYA, HULU SUNGAI TENGAH', NULL, '81139922881', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ad90d267-5c3b-4cfc-897e-5c58da08845c', 'RSUD DR.H.SOEMARNO SOSROATMODJO', 'JL. TAMBUN SUNGAI NO. 16, SELAT TENGAH, SELAT, KAPUAS', NULL, '85866732836', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('adc2889e-3470-4a52-97d8-4021039e6f37', 'Dinas Kesehatan Toli-Toli', 'Dinas Kesehatan Toli-Toli', NULL, '082393966584', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ae3458bb-16a4-4720-8401-88ab6220bb12', 'Klinik Soegiyapranata', 'JL. Dr. Wahidin, No. 110, Kaliwiru, Kec. Candisari, Kota Semarang', NULL, '085290812827', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ae725a7e-e135-4293-bf30-e7f3366c51ef', 'Permata', 'Jalan Tanjung Gunung No.4, Gerung Sel., Kec. Gerung', NULL, '82340018125', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('aecb8b5b-6e03-45f6-bace-74872550fba4', 'Klinik Margo Husodo', 'Jl. Borobudur Utara IV Kav 120 Rt.02/Rw.04 Semarang', NULL, '081327486935', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('af2817ca-58f8-49d4-8c99-fff102c6da28', 'RSUD DR.H.SOEMARNO SOSROATMODJO', 'JL. TAMBUN SUNGAI NO. 16, SELAT TENGAH, SELAT, KAPUAS', NULL, '82134406510', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('af347091-f8fb-4dcb-9300-58058e477105', 'RSUD ANSARI SALEH', 'JL. BRIG. JEND. HASAN BASRI NO. 1, ALALAK UTARA, BANJARMASIN', NULL, '87846999669', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('afe6049c-ea06-4954-9a98-3f49a8ee821f', 'Ap Al Barokah Medika', 'Rsud Tani Dan Nelayan Boalemo', NULL, '081211888420', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b01e4c3a-ab2d-43dd-9801-3e6c70d682b1', 'RSUD DR.H.SOEMARNO SOSROATMODJO', 'JL. TAMBUN SUNGAI NO. 16, SELAT TENGAH, SELAT, KAPUAS', NULL, '81245997736', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b02c63ff-e5e3-4658-910d-9f1d72b9faa2', 'Klinik Arda Medical Center', 'Jl. Tegal Turi No. 44 Giwangan, Umbulharjo, Yogyakarta', NULL, '081227043636', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b073e4da-2590-4bf2-9fa5-6eefd0137271', 'RSUD BOEYASIN', 'JL. MENTRI EMPAT, BANJAR', NULL, '081351467750', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b08fccbf-8cd2-4c02-bd76-652d0054843b', 'RSIA Bunda Arif', 'Jl. Jatiwinangun No. 16 Purwokerto', NULL, '081228406406', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b0ed0b87-2a80-4052-bb8c-d9e6638aae1c', 'Apt. Laksmi', 'Jl. Brigjen Katamso No. 4 Magelang', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b1216fca-708a-4c2c-8733-633ef2014d33', 'Rsud Toto Kabila', 'Rsud Toto Kabila', NULL, '0854 9749 8602', 'apotek', '2025-05-05 13:10:21', '2025-05-05 11:38:20', '2025-05-05 13:10:21'),
('b13a0d38-9444-41e0-815b-de9620d45bbf', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '081392656421', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b1450028-957a-4462-be77-b8d5e72fdc9b', 'RSUD Temanggung', 'Jl. Gajah Mada No 1A, Brojolan Barat, Temanggung', NULL, '081325555661', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b23996d3-0d44-4c5c-b606-a3d369691c8c', 'Klinik Pku Muh Kertek', 'Pandansari ,kertek, Wonosobo', NULL, '082322050080', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b2626aab-3b0b-46c8-8dd8-7400a87dab79', 'RS Telogorejo', 'Jl. KH. Ahmad Dahlan', NULL, '0811276280', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b352ee3a-08a8-43d0-b409-a20638de56fa', 'AP MEDIKA FARMA', 'JL. BUPATI H. SAID ALWI NO. 16 RT. 006/001 RANTAU KIWA, TAPIN UTARA', NULL, '81349352101', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b37ce9ff-bd92-4c00-a359-88a1b1197ed8', 'RSUD PAMBALAH BATUNG', 'MUARA TAPUS, AMUNTAI TENGAH, HULU SUNGAI UTARA', NULL, '82191184177', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b3cb72d2-97fd-4e96-9f8f-0fdbab18a668', 'RS ISLAM BANJARMASIN', 'JL. S. PARMAN GG. PURNAMA NO. 88 BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b3f5abf9-8926-48b3-82a1-c687ce765fc4', 'Apt. Sukolilo Sehat', 'Jl. Pati - Sukolilo No.Km 27, Lebakwetan, Sukolilo, Kec. Sukolilo, Kabupaten Pati, Jawa Tengah 59172', NULL, '082243639870', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b420c4af-466c-4291-b382-d9a7b6b901e5', 'Apt. Manshurin Semarang', 'Jl. Fatmawati No.1, Mangunharjo, Kec. Tembalang, Kota Semarang, Jawa Tengah', NULL, '08995920973', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b47632cb-6581-41cc-8107-f704b257319e', 'Apt. Sehat Abadi', 'Jl. Letjend S Parman ,Sayangan, Butuh, Temanggung', NULL, '085819264765', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b5052430-0340-4b19-b6a8-d446615fd502', 'Apt. Alfa Farma', 'Jl. Ahmad Yani No. 149 Kendari', NULL, '081241047508', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b5ede08c-761f-4f36-b6f9-5f90d011f60c', 'Rsud Torabelo Sigi', 'Rsud Torabelo Sigi', NULL, '081341027697', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b647cf8b-4469-43ac-bc25-87d83145bdbe', 'RSK Ngesti Waluyo', 'Jl. Pahlawan Jubug , Wanutengah, Parakan, temanggung', NULL, '081226950376', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b7519abb-3602-40ba-9fb1-82fc1a18cacf', 'RS PKU MUH Wonosobo', 'Jl Raya No 1 KM 4, Kedewan, Sudungdewo, Kertek, Wonosobo', NULL, '085156368657', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b7686e86-dffe-4df2-a383-86259a8aa0a5', 'Klinik Sumber Waras', 'Jln. Parang Sarpo Tlogosari, Semarang', NULL, '087832392967', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b7c0873e-880e-4a92-af23-18b72c042a7f', 'RS. Panti Wilasa Citarum Semarang', 'Jl. Citarum No.98, Mlatiharjo, Kec. Semarang Tim., Kota Semarang', NULL, '082127127007', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b8cb7941-685a-4f15-a7a0-c6411001321c', 'RSI. Sultan Hadlirin', 'JL. Raya Jepara Bangsri, Jepara', NULL, '082138865038', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b9bf4bcc-19b2-4e79-8ced-1974acfa21b4', 'Apt. Timur Sehat', 'Jl. Raya Mr. Moch Ichsan no. 93-97', NULL, '08122924751', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('b9f58a82-83a8-40b3-a506-2da70d48ea0d', 'RS Emanuel', 'Jl.Banyumas-banjar 12, banjarnegara', NULL, '08562879898', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bacc96c2-9ae4-4aa2-b761-eca62cecbaf6', 'RS Budi Sehat', 'Jl. WR. Supratman No. 183, Cangkrep Lor, Dusun II, Cangkreplor, Kec. Purworejo, Kabupaten Purworejo, Jawa Tengah 54117', NULL, '081329428575', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bb10d2ec-69b9-407b-80c4-6902f5bb224d', 'Apt. Permata Farma', 'PKM Limbangan', NULL, '08122920906', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bb604431-c599-46ea-80b2-6a4cd841cf6f', 'RSUD DAMANHURI', 'JL. A. YANI RT 016/003 MANDIMGIN, BARABAI, HULU SUNGAI TENGAH', NULL, '81343165596', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bb6b6c35-3a8a-4505-a855-bc16db2294da', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '85656335551', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bb701fe0-4f86-4048-9803-a0341194267d', 'RSUD ANSARI SALEH', 'JL. BRIG. JEND. HASAN BASRI NO. 1, ALALAK UTARA, BANJARMASIN', NULL, '82225132008', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bb704817-6d99-4fac-a6ba-f605b8b6143a', 'RSIA PERMATA BUNDA', 'JL. AHMAD YANI NO. 28A, KANDANGAN', NULL, '85973032874', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bb74c274-6952-4059-8d02-47aeb0c4a474', 'KLINIK BUNDA ASIH', '', NULL, '08123218275', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bb81e0d6-469b-4113-abc1-39ed4f18a264', 'Klinik Anugrah', 'Jl. Sultan patah No.85 Kel. Bintoro, Demak', NULL, '0816642914', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bbd075b9-6bfe-48de-99f5-bc22aa1e451b', 'Apt. Jodipadti', 'Jl. Jodipati Raya No.44, Jambean, Sidokerto, Kec. Pati, Kabupaten Pati, Jawa Tengah 59118', NULL, '081809159788', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bbe70618-3a7c-4982-8ab4-57408cbca89a', 'Semayan', 'Semayan', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bbf26023-01f7-42de-a634-92c9f33bc02c', 'RS Bunda', 'Jl. Pramuka No. 249 Purwokerto', NULL, '0818275574', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bbfb6163-359b-40e1-9805-cc44228fa2fb', 'Klinik Uksw', 'Jl. Kartini No.11A, Salatiga, Kec. Sidorejo, Kota Salatiga, Jawa Tengah 50711', NULL, '0818489624', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bc3537a4-e9b3-4672-893e-03a2cccb9256', 'RSUD PANGERAN JAYA SUMITRA', 'JL. BRIGJEND H. HASAN BASRI NO. 57', NULL, '82196439399', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bcc0189d-e8f0-4bf1-8185-dbb851a77a49', 'Rs Sinar Kasih', 'Jl. Buntu No.8A, Pantan, Kec. Makale, Kabupaten Tana Toraja, Sulawesi', NULL, '085394347908', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bd5c5af3-c8f6-431c-a878-0d1aed5b80a6', 'RS ANSARI SALEH', 'JL. BRIG. JEND. HASAN BASRI NO. 1, ALALAK UTARA, BANJARMASIN', NULL, '87846999669', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bd5f7b62-1401-4042-8caf-28f416f5f707', 'RSUD KI Ageng Selo Wirosari', 'Jl. Raya Blora - Purwodadi No.KM 19, Area Sawah, Kunden, Kec. Wirosari, Kab. Grobogan, Jawa Tengah', NULL, '085293047992', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bdf7027a-0f03-4fe9-871d-cead816c7c3d', 'Apt. Dhani 02 Jeneponto', 'Apt. Dhani 02 Jeneponto', NULL, '081243482644', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('be001ca8-90c1-4126-940a-2b34b09a8333', 'Apt. Bagas Jiwo', 'JL. Raya Senenan Km. 2, Jepara', NULL, '081226859691', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('be3914e8-ee12-4f50-90ed-97d8449690ef', 'Rsud Toto Kabila', 'Rsud Toto Kabila', NULL, '08529902264', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('be3d1cd6-962d-40b6-bfd3-3e45f57b61cf', 'Klinik Anugerah', 'Jl. Mayjend Panjaitan No.26. Banjarnegara', NULL, '082227468000', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('be40b64c-fe00-4dc6-b245-2c03811e7360', 'Klinik Pandu sehat', 'Jl. Cinde Selatan No.29, Jomblang, Kec. Candisari, Kota Semarang', NULL, '0811273316', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('be4e2490-36c2-4a94-b981-66b3f2829dbc', 'Klinik Amalia 3', 'Jl. Kartini No.13, Balemulyo, Muntilan, Kec. Muntilan, Kabupaten Magelang, Jawa Tengah 56411', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bea56c43-f5c1-4f5a-8223-d50182a09517', 'Praktik Pribadi', 'Jl. Kanfer Raya Blok o / 2 Semarang', NULL, '082133074782', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bf09cc4d-7f3d-4f41-a783-3b1ad7880259', 'RSU NIRWANA', 'JL. PANGLIMA BATUR, LOKTABAT UTARA, BANJARBARU', NULL, '82153587442', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bf464eb9-23ff-4260-a7ae-5989c72143e4', 'Apt. Gajah Mada', 'Jalan RSU Setjonegoro, No 1 , Stasiun, Wonosobo Barat,Wonosobo', NULL, '08156703719', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('bfac186d-093b-42d2-abcd-366b77231113', 'APOTEK KIMIA FARMA SUNGAI DANAU', 'JL. PROPINSI NO. KM 168', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c00c673d-9254-48cc-90bb-2a440b6398ce', 'RSUD BOEYASIN', 'JL. AHMAD YANI, ANGSAU', NULL, '081328050732', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c03ddb68-fd6b-4858-a40b-d0df4b284263', 'Rs. Paramount', 'Jl. Hertasning', NULL, '0811423092', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c0d6b3d5-056d-4fb2-bde3-969a85e528b2', 'RS. Panti Rahayu', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '08122909069', 'apotek', '2025-05-08 15:08:20', '2025-05-05 11:38:20', '2025-05-08 15:08:20'),
('c142bd7d-d668-43e8-affc-d43c651958ff', 'Pt Agape', 'Jl Dewi Sartika, Karang Panjang', NULL, '081343322033', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c1576405-ba46-4d1a-8bf4-ada70a66ae52', 'RSIA Arvita Bunda', 'Jalan Tajem, Pasar Jl. Stan, RT.04/RW.44, Maguwoharjo, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55282', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c175d7d9-2c72-4280-9e52-f9210e5f4248', 'Apt. Magelang', 'Jl. Mataram 59, Magelang', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c1ee7429-f7e0-48f1-99a0-9c96d08cd664', 'AP ANUGRAH ABADI', 'BERSUJUD, KAB TANAH BUMBU', NULL, '87851031585', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c222bd25-d20d-484c-87e6-f38bb3cf50e9', 'Ap Dzaky Farma Kendari', 'Jl. Sao Sao No. 238, Bende, Kadia, Kendari', NULL, '081355010306', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c236269a-8e07-4c8b-9e47-bc45d811832c', 'Apt. Akmal Sehat (Demak)', 'JL. Gajah Mada  NO. 10, Purwodadi', NULL, '082323456456', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c2b21787-a998-4337-b73d-140e3ebaa9d3', 'Ap Mutiara Masohi', 'Jl Imam Bonjol No 324 Masohi', NULL, '08124620793', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c2d678b2-6912-48eb-812b-82e98beca58f', 'RS PKU MUH Temanggung', 'Jl. Raya Kedu Km. 2 Kalisat, Bulu, Temanggung', NULL, '081390407956', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c3530a48-e5b8-41b4-8a93-c7859fd73ae6', 'APOTEK ABID FARMA', 'JL. RAYA BATULICIN NO. 11', NULL, '85255055018', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c3745120-b393-4fdc-93c0-9bb03d22666e', 'Ap Mutiara Masohi', 'Jln Asmil No 731 Karabesi', NULL, '082147911538', 'apotek', '2025-05-05 13:31:43', '2025-05-05 11:38:20', '2025-05-05 13:31:43'),
('c4c5b952-6ca6-4358-b1f2-331158433dcf', 'Apt. Dian Farma', 'Jl. Secang Pirikan Km. 6,5 Magelang', NULL, '08121589269', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c4ede708-b92b-4c85-9a38-b34fa32bd644', 'Apt. Mulia Pati', 'Jl. Penjawi No. 78 Randukuning, Pati Lor, Kec. Pati,  Kab. Pati', NULL, '082225528266', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c4fdc815-b765-4aa2-8602-7a37211820d3', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '81251250663', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c5169bdc-3306-40a7-904a-b000c99e2890', 'Ap Cemerlang Farma', 'Graha Cemerlang Kompleks Blok B No. 9 Maros', NULL, '089665544333', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c530cd2f-ca18-4e3a-9afa-47219b9f28dc', 'RSUD dr. Soetijono Blora', 'Jl. Dr. Sutomo No.42, Blora, Tempelan, Kec. Blora, Kab. Blora, Jawa Tengah', NULL, '081265466093', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c6f52a51-3429-4209-bbe3-8286f83f05c3', 'RS Mitra Bangsa Pati', 'Jl. Kolonel Sugiyono No.75, Ngagul, Winong, Kec. Pati, Kabupaten Pati, Jawa Tengah 59112', NULL, '08122801185', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c8039738-bfd2-4053-aa38-6bf70bada80a', 'Ap Happy Kids', 'Jl Putu Ina Karang Panjang', NULL, '081343076671', 'apotek', '2025-05-05 14:05:32', '2025-05-05 11:38:20', '2025-05-05 14:05:32'),
('c80cf99c-236c-4dd9-bde5-7636bd724964', 'RSUD PULANG PISAU', 'JL. W.A.D DUHA KOMPLEK PERKANTORAN, MANTAREN I, KAHAYAN HILIR, PULANG PISAU', NULL, '82219995022', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c8547161-e349-44c7-9d32-cdb72f8abf74', 'RS PKU MUH Wonosobo', 'Jl Raya No 1 KM 4, Kedewan, Sudungdewo, Kertek, Wonosobo', NULL, '085343456102', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c8af7b56-4ab2-4e53-b1a4-0bc9b393a78c', 'RSUD DATU SANGGUL', 'JL. H. ISBAT, KUPANG, TAPIN UTARA', NULL, '08115030103', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c944a549-da3f-41eb-b007-fe11690f3b9a', 'RSU ALMANSYUR MEDIKA', 'JL. CITRA MEGAH RAYA, LOKTABAT UTARA, BANJARBARU', NULL, '81952003497', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('c9e1fb06-a9c1-45f4-af24-1606ea64223a', 'Apt. Denai', 'Apt. Denai', NULL, '085240742297', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('caced8ae-89be-4b1c-987f-be0642727453', 'RSUD Wonosobo', 'Jl.Letjen S Parman NO Km 3 Mendolo, Bumireso, Wonosobo', NULL, '08228170264', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cb0954f9-1047-4c60-b906-d3f33ad6e703', 'AP  IBNU SINA', '', NULL, '082151887700', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cb0c6fd0-1675-40be-bdea-6db49b0fe63d', 'RS KHUSUS IBU DAN ANAK ANNISA', 'JL. ZAFRI ZAM ZAM NO. 55/56, KUIN CERUCUK, BANJARMASIN', NULL, '81342335445', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cb5c8f14-17ac-4e54-ac70-5419a8b19527', 'Klinik Pandu sehat', 'Jl. Cinde Selatan No.29, Jomblang, Kec. Candisari, Kota Semarang', NULL, '082137371417', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cbdbaebc-4f05-4142-af11-6b52fe3a93d0', 'Klinik Ngesti Widodo', 'Jl. Brigjend Katamso 1 Ungaran', NULL, '08122552220', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cbedc9cd-f14c-46ba-a54f-c0750f4bf62f', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '81348190200', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cc2abc14-6134-41e8-bad9-ec350b3c09fb', 'KLINIK BUNDA ASIH', '', NULL, '08115433006', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cdac81d6-aefa-4ea7-9a2b-fe9ae342176c', 'Apt. Grabag', 'magelang', NULL, '081221842260', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cdd7ae73-b253-42f8-be32-2572aff37df5', 'RS. Panti Rahayu', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '081234394294', 'apotek', '2025-05-08 15:08:31', '2025-05-05 11:38:20', '2025-05-08 15:08:31'),
('cde0a74e-6604-4e41-994e-fd7bbc3415c8', 'AP  MANDIRI FARMA', 'JL CEMPAKA BESAR', NULL, '8125119440', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cde37646-a688-411e-b71a-5998757db9da', 'Apt. Cininta Semarang', 'Jl. Lamper Sari No.57, Peterongan, Kec. Semarang Sel., Kota Semarang, Jawa Tengah 50249', NULL, '0811299547', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cdf8df16-68b2-45e1-b856-87001b3285cb', 'Apt. Amanah', 'Jl. Lamper Tengah No.670, Lamper Tengah, Kec. Semarang', NULL, '81805999832', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ce8d7fbb-88be-4471-8e46-f326e2fbd97c', 'APOTEK NURI', 'JL. HKSN NO. 9, ALALAK SELATAN, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cef11ac6-76e9-49bb-8762-e65fa83803e2', 'RS SARI MULIA', 'JL. P. ANTASARI NO.139, SUNGA BARU, BANJARMASIN', NULL, '82188470528', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('cf50174a-543b-4ae5-a499-229c1743bf22', 'Ap Eterna Farma', 'Jln Botolempangan No 20', NULL, '08124226061', 'apotek', '2025-05-06 07:33:39', '2025-05-05 11:38:20', '2025-05-06 07:33:39'),
('d02866e8-aa20-48cf-822e-6fea4f34e9ca', 'Apt. Ananda', 'Jalan RSU Setjonegoro, No 1 , Stasiun, Wonosobo Barat,Wonosobo', NULL, '081225447060', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d0544433-8b4e-46ae-a269-04e695ee4b7c', 'PT KIMIA FARMA APOTEK 61', 'JL. CEMARA', NULL, '81952782105', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d0a310f6-834d-4ffc-94e6-ec5057269898', 'RS UAD', 'Jl. Cindelaras Raya No.33, Karangsari, Wedomartani, Kec. Ngemplak, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55584', NULL, '081390361340', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d0caf416-69f0-48a6-90e3-fe0763c374ab', 'Klinik Hasnaliya', 'Jl. Ahmad Yani No.169, Kramat Utara, Kec. Magelang Utara, Kota Magelang, Jawa Tengah 56115', NULL, '8121552754', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d0ec2986-3e6b-4755-9c21-485e08a59cab', 'RSUD DATU SANGGUL', 'JL. AHMAD YANI, BINUANG', NULL, '81330133119', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d1032354-af32-4f9a-8ba4-5acd8f93ded7', 'Rs Madani', 'Jln Thalua Konchi', NULL, '081273020124', 'apotek', '2025-05-06 08:13:37', '2025-05-05 11:38:20', '2025-05-06 08:13:37'),
('d111bdb1-d7cf-4ac2-91a2-2c3cc0a930cc', 'AP  IBNU SINA', '', NULL, '082145258287', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d13e35d7-bfa0-43c4-8b7e-c20e619f323c', 'Rs Undata', 'Rs Undata', NULL, '085240000825', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d1607ac9-5c96-4970-b34a-1befe1f67892', 'AP  IBNU SINA', '', NULL, '081250808097', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d171b59a-b617-4d1d-aa9f-e8d3ed37dc7f', 'RS Habibullah Gabus', 'Jl. Raya Tahunan, Krajan, Tahunan, Kec. Gabus, Kab. Grobogan, Jawa Tengah', NULL, '081215361276', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d1e4a51b-a0da-40bb-b63f-e3f9b73a893c', 'RSU SYIFA MEDIKA', 'JL. A. YANI KM. 34 LOKTABAT UTARA, BANJARBARU', NULL, '8115041241', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d26ade5b-2938-4ed7-938b-d980dac3af57', 'Apt. Tulus Harapan', 'Jalan KPA II No.5, Sendangmulyo, Kec. Tembalang, Kota Semarang, Jawa Tengah 50272', NULL, '082136538728', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d29b9e4f-0abf-4cfe-a650-38e47a3f644f', 'Klinik Utama Namira', 'Jl. Pakintelan II RT.04 RW.05, Pakintelan, Gunungpati, Semarang', NULL, '085921478396', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d2a093bb-804e-4291-92bf-ca076dd5b7d9', 'RS Biomedika', 'Jl. Bung Karno, Mataram', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d2d0cbe2-a489-403b-9e1e-aa64b9f39039', 'Apt. Asa', 'Jl. DI panjaitan No. 36 Purwodadi Kab Grobogan', NULL, '081390355784', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d3100fe1-eddb-404f-9b1e-866fe4f551f8', 'Apt. Farrel', 'JL Pramuka No 264 RT 01/II,banyumas', NULL, '082227061381', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d3210044-55dc-42f3-a3eb-4e84076e4842', 'Apt. Magelang', 'magelang', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d3486ee0-7187-41d8-926f-34d5db9edca1', 'RS RESTU BUNDA', 'RS RESTU BUNDA', NULL, '082243438463', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d36191ee-bd95-4f6f-bdfb-7807346bc0d7', 'RSUD BOEYASIN', 'JL. AHMAD YANI, PELAIHARI', NULL, '085213553686', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d377105f-d689-4b67-8f33-b2c745406dac', 'AP  IBNU SINA', '', NULL, '081347422266', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d38781df-5647-425e-af2a-323e5d90a132', 'RS SARI MULIA', 'JL. P. ANTASARI NO.139, SUNGA BARU, BANJARMASIN', NULL, '8115019191', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d55848bd-157f-4c42-8f97-f8823bae0f34', 'Rs Multazam Kota Gorontalo', 'Jl Gelatik Kota Gorontalo', NULL, '0822272214026', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d568bfe9-0165-4eab-b593-ae2529fd99f9', 'Apotek Aji', 'Wates Rt 03 / Rw 05 Undaan Kudus', NULL, '085201222250', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d56c2684-060c-417c-9179-fa8fa3341ce9', 'RSU H.BADARUDDIN TANJUNG', 'JL. TANJUNG BARU, MURUN PUDAK, TABALONG', NULL, '81228012381', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d5717fd6-867a-4031-8a8a-a0c6e2ccd33d', 'KLINIK RS.IBU  ANAK CERIA', 'HAMALAU, SUNGAI RAYA, HULU SUNGAI TENGAH', NULL, '85249751609', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d5ec583c-ce18-4c6e-b0d1-7f2e650c23ab', 'Yusra', 'Jl. S. Parman No 02 Kauman Praya, Lombok Tengah', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d675877b-d0a9-4d62-843e-590969aaef8d', 'Dr. Kusbandi & Balai Pengobatan Kusuma', 'Jl. Komisaris Bambang Suprapto No.107, Cigrobak, Purwokerto Lor, Kec. Purwokerto Tim., Kabupaten Banyumas, Jawa Tengah 53111', NULL, '0816411756', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d68b252d-96f3-4c04-a93b-82a00c61009e', 'Rs Gunung Sawo', 'jalan Gatot Soebroto NoKm 2, Tegaltemu,Manding, Temanggung', NULL, '08562985973', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d6b9d0cc-0b32-4722-ad49-db03e62f57c2', 'RS. Permata Bunda', 'Jl. Hayam Wuruk 24 Purwodadi', NULL, '082243617852', 'apotek', '2025-05-07 10:30:55', '2025-05-05 11:38:20', '2025-05-07 10:30:55'),
('d73028a2-09bc-45db-b299-d529a6f179c3', 'RSU Bina Kasih', 'Jl. Naryoatmajan No.27A, Kranggan, Panjang, Kec. Ambarawa, Kabupaten Semarang, Jawa Tengah 50614', NULL, '082260757419', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d7a37256-0f93-4ee6-962e-c315b979813b', 'Apt. Mugi Waras', 'Jl. Teuku Umar No. 47 Jatingaleh', NULL, '081392148518', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d7a68d83-ff03-4c38-9a85-a3ccdaa9ba01', 'RSUD Banyumas', 'Jl. Rumah Sakit No.1, Kejawar, Kec. Banyumas', NULL, '081374825690', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d7e106f0-1f5a-4145-8d9b-fc6eb725cd01', 'Apt. Harapan Kita L24 Jepara', 'Rw. 3, Rengging, Kec. Pecangaan, Kabupaten Jepara, Jawa Tengah 59462', NULL, '082311611582', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d85cd0c8-03fb-47f7-834d-9c33433fe716', 'RS. Mitra Bangsa', 'Bongsri, Mulyoharjo, Kec. Pati, Kabupaten Pati, Jawa Tengah 59119', NULL, '081299057810', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d8b8b577-5348-48df-9081-0064874e43af', 'RS. Siloam', 'Jl. Kompol Maksum No.296, Peterongan, Kec. Semarang Sel., Kota Semarang, Jawa Tengah 50242', NULL, '08122573083', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('d9c2b428-10e7-41e1-bfce-7db88354147b', 'AP  MANDIRI FARMA', 'BERSUJUD, SIMPANG EMPAT', NULL, '85869889777', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('da12f3b2-b98a-4fb8-afe0-880ac1df9c0e', 'Apt. K-24 Gubug', 'Dusun Bantengan 005/002 Tlogomulyo Gubug', NULL, '081227137941', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('da287740-722c-4b83-a793-88e750b29fd7', 'RSB PARADISE', 'JL. GUBERNUR NO. 267', NULL, '81649681806', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('da39eee4-7b5a-4e31-afe9-d75c142740a0', 'Apt. Manshurin Semarang', 'Jl. Fatmawati Raya Semarang', NULL, '083842044130', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('da5b5175-1aaf-454a-b89b-44a4d8c4ed01', 'PKU Muhamadiyah Cepu', 'Jl. Ronggolawe No.137, Megal, Balun, Kec. Cepu, Kab. Blora, Jawa Tengah', NULL, '081225753466', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('da9f3af9-3eee-45aa-a8d8-c8f6c3d42656', 'Instalasi Farmasi RS Jiwa', 'JL. Kauman Raya NO. 17 Pedurungan, Semarang', NULL, '081390042902', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('dae39467-dfb6-4f9e-b8ed-149269c878ad', 'Apt. Kartika Medika', 'Jl. Jati raya No.G14', NULL, '087820989988', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('db479cc8-414f-432a-abf7-a8d801d77ad4', 'RSIA Bunda', 'Jl. Brigjen Katamso No.8, Karangturi, Kec. Semarang Tim., Kota Semarang', NULL, '08125522010', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('db92c46c-dee9-44d2-b787-e3a7527b0d39', 'RST Bakti Wiratamtama', 'Jl. DR. Sutomo No.17', NULL, '081326079032', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('dbd415ec-b0db-4352-85d5-905ec6788f87', 'Kl Citra Mulia Blora', 'Jl. Gatot Subroto no. KM. 4, Tamansetro, Kec. Tunjungan, Kab. Blora, Jawa Tengah', NULL, '085239060317', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('dbe03368-e4a2-462d-b00a-2ef085ddcef3', 'Apt.Trio', 'Jl. Raya Doyotakan No 101, Kauman, Candiroto, KabTemanggung', NULL, '082143119065', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('dc6ed430-f982-475a-98c4-7aa97dc7729a', 'RS Tlogorejo Semarang', 'Jl. Kh Ahmad Dahlan, Karangkidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50134', NULL, '081283855577', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('dca106d8-f7b9-4510-8cb3-444b9e26ca95', 'RS ISLAM BANJARMASIN', 'JL. S. PARMAN GG. PURNAMA NO. 88 BANJARMASIN', NULL, '818377332', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('dcd37ad3-46c6-4acc-9904-bf10d6909f2c', 'RS. Permata Bunda', 'JL. Hayam Wuruk 24, Purwodadi', NULL, '081390034563', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('dde19c45-4320-4fae-9b20-4cf4e7a3f2d4', 'RSUD ANSARI SALEH', 'JL. KINIBALU NO. 8, RT 38, TLK. DALAM, BANJARMASIN', NULL, '85100147956', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ddedd2f5-3fd2-4525-be9b-3881f7c3d7b8', 'Klinik Mata Kendari', 'Jl. Buburanda, Sorumba, Mandonga', NULL, '082193224818', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('de32d5e6-374f-47c4-b323-c6687afbfce5', 'RUMAH SAKIT PERMATA HUSADA', 'JL. IR. PM. NOOR, SUNGAI ULIN, BANJARBARU', NULL, '81349474021', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('de33e120-69c4-40ca-a498-8a7e69b04f16', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '8125121693', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('de81a675-967e-4940-abbc-ca65fe38c7fa', 'Rs Madani', 'Jln Thalua Konchi', NULL, '081243434464', 'apotek', '2025-05-06 08:14:01', '2025-05-05 11:38:20', '2025-05-06 08:14:01'),
('dee25365-89ca-4226-904d-d486d0bb293c', 'RS. Permata Bunda', 'Desa Kuwaron Kec Gubug Kab Grobogan', NULL, '081325585531', 'apotek', '2025-05-07 10:31:58', '2025-05-05 11:38:20', '2025-05-07 10:31:58'),
('deea1db7-6e2c-4c6d-9033-a2adc0064feb', 'Aslam Medicare', 'Jl. TGH. Lopan No.289, Bagik Polak, Kec. Labuapi', NULL, '81230583999', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('defc8329-581f-4bb3-b5e7-e64351950a62', 'APOTEK MEDIKA FARMA', 'JL. BRIGJEND H. HASAN BASRI NO. 57', NULL, '85249681024', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('dffa8176-01a2-4205-8600-7a7059f73f56', 'Apt. Sehati', 'Jln. Sriwijaya , Semarang', NULL, '08122921997', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e06d6265-9907-43d7-891a-5ac12ce6944b', 'RSUD dr. Soetijono Blora', 'Jl. Dr. Sutomo No.42, Blora, Tempelan, Kec. Blora, Kab. Blora, Jawa Tengah', NULL, '08562688872', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e1b3432e-376e-4dcc-b924-4834d72519a9', 'KLINIK TABALONG HUSADA', 'JL. IR. P.H.M. NOOR NO. 71 PEMBATAAN, MURUN PUDAK, TABALONG', NULL, '81328816992', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e1f347f7-45c2-4041-a727-3f048eaa4d76', 'RS. Mitra ParamedikaFarma', 'Yogyakarta', NULL, '082134537090', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e38d18ba-4f03-44a1-8da4-55bc860869c8', 'AP SUMBER SEHAT', 'JL. AES NASUTION NO. 28A, RT 14 RW 03, GADANG, BANJARMASIN', NULL, '8125039700', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e3c76685-4258-459c-af83-a8e33913cf2c', 'Klinik Griya Medika Purwodadi', 'Dusun ploso RT.5, Plosorejo, Kec. Purwodadi, Jawa Tengah 58191', NULL, '081225512414', 'apotek', '2025-05-08 15:04:30', '2025-05-05 11:38:20', '2025-05-08 15:04:30'),
('e473159f-e8d3-4d57-a070-37eaf25c1cb2', 'RSU NIRWANA', 'JL. PANGLIMA BATUR NO. 42 LOKTABAT UTARA, BANJARBARU', NULL, '8125129125', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e47d28d2-d97e-4e05-a9ae-0a3909d84730', 'Apt. Mugi Waras 2', 'Jl. Teuku Umar No. 47 Jatingaleh', NULL, '082220125498', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e4aa9c03-21a1-4acb-93bb-94bed4ff63f5', 'RS. Permata Bunda', 'Jl. Hayam Wuruk No.24, Palembahan, Kalongan, Kec. Purwodadi, Kabupaten Grobogan, Jawa Tengah 58114', NULL, '081325792179', 'apotek', '2025-05-07 10:31:12', '2025-05-05 11:38:20', '2025-05-07 10:31:12'),
('e4c3fd96-0631-43e6-a741-6dc4b30276da', 'RS Ummu Hani', 'Jl. Mayjend. Panjaitan No. 40 A Purbalingga', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e4cea459-1b51-4bf1-bebe-38ef55de97a2', 'RS PKU MUH Wonosobo', 'Jl. Raya Kedu Km. 2 Kalisat, Bulu, Temanggung', NULL, '082240005070', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e542b4d6-7ca1-4b05-8473-9832d574cb8a', 'RS ULIN', 'JL. JEND. A. YANI KM. 2,5 NO. 43, RW 05, SUNGAI BARU, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e544373e-5943-4302-836b-3db242436b2f', 'Rs Bayangkara Gorontalo', 'Klinik Mulia Pratama/Jl A. Yani 12 Gtlo', NULL, '082349994070', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e59e8537-c9e8-4e9e-9843-66106b8fe4e7', 'Apt. Patimura', 'Jl. Patimura No.04, Mapagan, Lerep, Kec. Ungaran Bar., Kabupaten Semarang, Jawa Tengah 50519', NULL, '08122728973', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e5cf5c7d-5389-43e6-8aa4-35db2414fb5c', 'RS. Fastabiq Sehat', 'Bongsri, Mulyoharjo, Kec. Pati, Kabupaten Pati, Jawa Tengah 59119', NULL, '082243435353', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e70d1137-d784-402d-8aa8-5ddd04dfae48', 'Rsud  Aloe Saboe', 'Rsud Aloe Saboe Kota Gorontalo', NULL, '081342262361', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e73178df-ab50-4e4e-8534-cc55c80b2811', 'AP SEGAR WARAS', 'JL. RAYA BATULICIN', NULL, '82139999715', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e7f51771-5419-492f-9f1d-6d90194829e4', 'RSUD BOEYASIN', 'JL. AHMAD YANI, PELAIHARI', NULL, '081338570956', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e8ae4c19-c685-4cd4-9f7b-1350f2d70b7a', 'RS Emanuel', 'Jl.Banyumas-banjar 12, banjarnegara', NULL, '08112605775', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e8fd6fc4-e429-43be-b9a3-0f13a77310e1', 'AP  IBNU SINA', '', NULL, '0811258942', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('e9a6fa8a-0ef1-4e98-b035-4060f385d891', 'RS Ummu Hani', 'Jl. D.I Panjaitan No.40A, Purbalingga,', NULL, '082138903537', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ea079f15-95ff-4756-9b99-5587af75c817', 'Ap Kimia Farma 262 Ktg', 'Jln Adampe Dolot', NULL, '085256388147', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('eaeb40ce-7a3f-4df6-a17c-201c177c725e', 'Apt. Mrican', 'Jl. Karangrejo Raya No. 5', NULL, '082134830800', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('eb3d8cc2-4065-4927-babe-93b9374e166c', 'RS. Permata Bunda', '', NULL, '081325327827', 'apotek', '2025-05-07 10:30:26', '2025-05-05 11:38:20', '2025-05-07 10:30:26'),
('eb77fbf0-a2bd-4ef4-99e1-05cb4a37e315', 'Apt. Hayam Wuruk', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '081234456806', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('eb7ee3bf-1674-4f4e-b2ad-bf0c5313580d', 'RSK Ngesti Waluyo', 'Jl. Pahlawan Jubug , Wanutengah, Parakan, temanggung', NULL, '081392466894', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ebec78e6-c18b-4cd5-8e0a-d8252abd4ddd', 'Klinik Sejahtera Bakti Sehat', 'Jl. Wonosari - Pakis, Seleker, Kopeng, Kec. Getasan, Kabupaten Semarang, Jawa Tengah 50774', NULL, '081390008001', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ecbdcdd7-e17a-4505-9b6e-7ec2becbd23b', 'Rsud Iwan Boking', 'Rsud Iwan Boking,S Boalemo', NULL, '082296525808', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('eda39ef9-dc0d-476e-a041-ef033360dcd0', 'Ap Rissa', 'Ap Rissa', NULL, '082347606426', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('eda74e4f-cc76-42c4-89c9-539d514e4742', 'RSUD ANSARI SALEH', 'JL. BRIG. JEND. HASAN BASRI NO. 1, ALALAK UTARA, BANJARMASIN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ee0a6416-89e3-40c8-8ccb-b3ebaed60547', 'AP SEHAT JAYA', 'JL. PANGLIMA BATUR, COMET, BANJARBARU', NULL, '8115577939', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ee1d40e9-e20e-48de-99df-ee92261fdd6b', 'Ap Almediqa', 'Jl Ks Tubun No 90 Sinindian,Kotamobagu', NULL, '082187753786', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ee91db8f-8827-4e39-a343-5aa75c567c8a', 'RS. Sekar Laras', 'Jl. Gajah Mada, RT.002/RW.015, Nglejok, Kuripan, Kec. Purwodadi, Kabupaten Grobogan, Jawa Tengah 58112', NULL, '081246671617', 'apotek', '2025-05-08 15:02:56', '2025-05-05 11:38:20', '2025-05-08 15:02:56'),
('ee9c23bb-542d-444c-b761-941c45de2fee', 'RSI Wonosobo', 'Jl.Letjen S Parman NO Km 3 Mendolo, Bumireso, Wonosobo', NULL, '081328584713', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ef69af34-35d4-46ba-9556-03c39e2bac01', 'Klinik Az-Zahra Bau - Bau', 'Jl. Muh. Husni Thamrin, Bau - Bau', NULL, '081341686560', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('efad5141-9f64-41c8-837b-9d0e9e977c70', 'RSD DR. R. Soedjati Purwodadi', 'Jl. DI panjaitan No. 36 Purwodadi Kab Grobogan', NULL, '08122910299', 'apotek', '2025-05-08 15:20:11', '2025-05-05 11:38:20', '2025-05-08 15:20:11'),
('efc347e5-91b1-4099-99a0-e4c7410fe1a1', 'APT PAHLAWAN', '', NULL, '08125844048', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f0141342-8395-40ac-9679-e99155a78e5e', 'Apt. Mrican', 'JL. Puspogiwang 3/46', NULL, '08112924420', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f04b0c20-b060-488b-908f-1c09dccc95dc', 'RSUD DR.H.SOEMARNO SOSROATMODJO', 'JL. TAMBUN SUNGAI NO. 16, SELAT TENGAH, SELAT, KAPUAS', NULL, '81348013013', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f0cdd4c4-ba51-4e72-bb6e-b293070c595b', 'RS. Panti Rahayu', 'JL. Letjen Suprapto No. 6, Purwodadi', NULL, '081567708314', 'apotek', '2025-05-08 15:08:42', '2025-05-05 11:38:20', '2025-05-08 15:08:42'),
('f13e0cb0-3a87-4de6-9e21-15188ce046fa', 'Apt. Mulia Pati', 'Jl. Penjawi No. 78 Randukuning, Pati Lor, Kec. Pati,  Kab. Pati 59111', NULL, '082225535710', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f1a6c5bd-074e-4c0e-9f3a-6b261023950c', 'Apt. Pemda Kudus', 'Jl. Pegadaian Mayong No.12, Gloge, Mayong Lor, Kec. Mayong, Kabupaten Jepara, Jawa Tengah 59465', NULL, '081325864221', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f258675c-fb03-407e-8397-82353abc1807', 'Apt. Dian Farma', 'kab. magelang', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f2a2555d-c468-4c09-8a4c-5899c31108b2', 'Rs Amanat', 'Rs Amanat', NULL, '081245151848', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f2b00822-a8d8-4012-9aeb-34f242165338', 'Apt. Asa', 'Dsn Glonggong Rt.03 Rw.03 Purwodadi', NULL, '085876606475', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f45ce429-5432-4225-9604-2c331d13ca2b', 'PRATAMA ASRI', 'JL. A. YANI KM. 31 GUNTUNG MANGGIS, BANJARBARU', NULL, '8123287292', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f46a2063-ff13-40ee-97cd-0c1c34c3b62d', 'Ap Klinik Mata Kendari', 'Jl. Buburanda, Sorumba, Mandonga, Kendari', NULL, '08114001303', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f4a43515-9bfd-485d-93ea-81ef764e8932', 'Apt. Ananda', 'Jalan Raya Diponegoro No 58, Bugangan, Kaliange, Rowopeni, Wonosobo', NULL, '085293378080', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f53c24f9-109a-4843-9a25-34fb08aaedfd', 'RSUD Prembun', 'Jl. Pemuda No.172, Panjer, Kec. Kebumen, Kabupaten Kebumen, Jawa Tengah 54311', NULL, '081915054514', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f587d4c0-0acb-4176-85fd-a9db2ca15721', 'RSUD DAMANHURI', '', NULL, '81253914848', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f60ad9e1-5bd1-4278-a3a1-f4121b3fe9d8', 'Apt. Adi Mulya', 'Jl. Kelud Raya No. 60', NULL, '085702848500', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f614280d-d033-49bb-9922-1ff9bc1236c6', 'RSUD Bukit Menoreh', 'Jl. Kartini No.13, Balemulyo, Muntilan, Kec. Muntilan, Kabupaten Magelang, Jawa Tengah 56411', NULL, '082225058566', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f6644ebd-9a0f-4bab-ba84-eeecf07581f0', 'AP  KL  SIMPANG', 'JL. GAWE SABUMI', NULL, '81355717901', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f6e73474-9c30-4513-9009-e893a3baea68', 'Klinik Esensia', 'Jln. Woltermonginsidi, Semarang', NULL, '08128533806', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f7b222c0-6778-45fd-af3b-2ffe67f59100', 'RS. TNI AU (Yogyakarta)', 'Komplek Lanud Adisucipto G No. 23 Kolonel Kesehatan, Yogyakarta', NULL, '081327272570', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f7b463d0-9501-4d22-beb8-76653d78b077', 'RSUD DAMANHURI', 'JL. A. YANI RT 016/003 MANDIMGIN, BARABAI, HULU SUNGAI TENGAH', NULL, '8125181595', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f7f2ee2f-5394-44bd-85a3-7f1c686373d8', 'RSUD DR.H.SOEMARNO SOSROATMODJO', 'JL. TAMBUN SUNGAI NO. 16, SELAT TENGAH, SELAT, KAPUAS', NULL, '81225293799', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f9412caf-daa9-45cb-8a29-03be4d0a9c5b', 'RSUD BOEYASIN', 'JL. AHMAD YANI, ANGSAU', NULL, '085251764891', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('f99a2146-268c-41b6-89fa-0cee88bd1a0e', 'RSUD DR.H.SOEMARNO SOSROATMODJO', 'JL. TAMBUN SUNGAI NO. 16, SELAT TENGAH, SELAT, KAPUAS', NULL, '81228156118', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fa1a8426-32ef-4210-9868-c2f2cad3af3f', 'RSU Raffa Majenang', 'Jl bhayangkara, jenang No. 69 Majenang', NULL, '082278988812', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fa20a8a6-8cfd-4708-8df4-0a75652edc7b', 'RS. PKU Muhammadiyah Gubug', 'Jalan Letjend Suprapto No.12, Kuwaron, Kec. Gubug, Kabupaten Grobogan, Jawa Tengah 58164', NULL, '082133525008', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fabedb99-952c-4029-8ad8-af92501327f6', 'RS. Islam Banjarnegara', 'Jl. Raya Bawang, Banjarnegara', NULL, '08123305949', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fafc2610-a4a8-4b1e-bf8b-5af79bcb96fc', 'AP  SYIFA', 'JL. PANGLIMA BATUR, LOKTABAT UTARA, BANJARBARU', NULL, '82158277727', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fb758029-f857-49c6-99b9-714d3039fe64', 'Apt. Jago', 'Jalan Brigjen Katamso No 21, Besaran,Parakan Kauman, Parakan, Temanggung', NULL, '081226465253', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fbd5ff8b-8472-4be6-a5c2-f767cff11945', 'RS An Nimah', 'Jl. Wangon', NULL, '081242060008', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fc0d383c-2ca2-4221-af72-50f7e7ef90f3', 'Klinik Padma Paradina', 'Jl. Sanun No.3, Terbah, Wates, Kec. Wates, Kabupaten Kulon Progo, Daerah Istimewa Yogyakarta 55651', NULL, '082133012217', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fc450005-7d59-4ce1-a40a-3a8b1eb79f16', 'Apt. Dian Farma', 'Jl. Secang Pirikan Km. 6,5 Magelang', NULL, '082242659262', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fc8092de-b48c-4654-9391-86f655da4eb9', 'RSU NIRWANA', 'JL. PANGLIMA BATUR NO. 42 LOKTABAT UTARA, BANJARBARU', NULL, '81255580111', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fce0002a-981d-4583-aaf5-5740107f94bb', 'RSUD Ajibarang', 'Jl. Raya Ajibarang Pancasan', NULL, '081340018989', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fd0f365a-76db-415a-a3a8-90aa503f9ebc', 'Ap Ridania Sehat', 'Rsud Zainal Umar Sidiki  Gorontalo Utara', NULL, '085290206767', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fd6166c7-0a36-4bfd-8047-84a0fc7e9166', 'RS. Permata Bunda', 'JL. Hayam Wuruk 24, Purwodadi', NULL, '08157796460', 'apotek', '2025-05-07 10:32:41', '2025-05-05 11:38:20', '2025-05-07 10:32:41'),
('fda390c6-dcb0-4190-90c3-3cbc492ef09d', 'Praktek Pribadi', 'Jl. Jend. Sudirman No.13a, Mijen, Gedanganak, Kec. Ungaran Tim., Kabupaten Semarang, Jawa Tengah 50519', NULL, '081285201099', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fe3f8406-3a08-437c-ad4c-36e88a6747f3', 'AP  KUSUMA FARMA', 'JL. NEGARA NO. KM. 143, RT 024 BATU KAJANG, BATU SOPANG, PASER', NULL, '85399062333', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('fe458968-ebda-4985-b6fe-e69847d1afef', 'RS ABDUL AZIS MARABAHAN', 'JL. JEND. SUDIRMAN NO. 10, RT 13 RW 001, ULU BENTENG, MARABAHAN', NULL, '', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('feed2cf3-b898-46a7-8e0e-976b799f89ac', 'Rst Latumeten', 'Jl Komp Setia Budi Permai Blok 1A', NULL, '081311652327', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ffa62e59-28e1-4e2e-a862-ae8f93c61f7e', 'RSI Purwodadi', 'Jl. Dr. Sutomo No.9, Cebok, Kalongan, Kec. Purwodadi, Kabupaten Grobogan, Jawa Tengah 58114', NULL, '(029) 2421605', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20'),
('ffe4c3a8-bcc2-4abb-ad8b-5d1514244a78', 'Apt. Laksmi', 'Jl. Brigjen Katamso No. 4 Magelang', NULL, '082134531563', 'apotek', NULL, '2025-05-05 11:38:20', '2025-05-05 11:38:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatans`
--

CREATE TABLE `jabatans` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_create_jabatans_table', 1),
(2, '0002_create_users_table', 1),
(3, '0003_create_spesialis_table', 1),
(4, '0004_create_instansis_table', 1),
(5, '0008_create_wilayahs_table', 1),
(6, '0009_create_dokters_table', 1),
(7, '0010_create_areas_table', 1),
(8, '0011_create_wilayah_details_table', 1),
(9, '0012_create_regions_table', 1),
(10, '0013_create_region_details_table', 1),
(11, '0014_create_absensis_table', 1),
(13, '0016_create_pengajuan_dokters_table', 1),
(14, '0017_create_approval_histories_table', 1),
(16, '0019_create_pengumumen_table', 1),
(17, '0020_create_whatsapps_table', 1),
(18, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(23, '0015_create_daily_visits_table', 2),
(24, '0018_create_self_schedules_table', 2),
(25, '2025_05_09_090512_create_bug_reports_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_dokters`
--

CREATE TABLE `pengajuan_dokters` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instansi_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spesialis_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wilayah_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dokter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_rumah` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `alamat_praktek` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bank_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atas_nama_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atas_nama_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekening_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rekening_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekening_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengajuan_dokters`
--

INSERT INTO `pengajuan_dokters` (`id`, `instansi_id`, `spesialis_id`, `wilayah_id`, `user_id`, `dokter`, `email`, `instagram`, `no_hp`, `alamat_rumah`, `alamat_praktek`, `bank_1`, `bank_2`, `bank_3`, `atas_nama_1`, `atas_nama_2`, `atas_nama_3`, `rekening_1`, `rekening_2`, `rekening_3`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9ee2dcf7-5e52-4858-8cb6-1b7ebd362d8a', 'f99a2146-268c-41b6-89fa-0cee88bd1a0e', '01344382-0842-4c8e-a5d9-9cb0c4baa390', '9ed9b3a1-e6f0-4d08-bbdc-37dcb61e2d0f', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'Facere ad inventore', 'peditawyse@mailinator.com', NULL, '93', 'Eos ea accusamus occ', 'Mollit magni reprehe', 'Vitae iure nobis eum', 'Ut veniam in eos i', 'Quia lorem accusanti', 'Dolor consequuntur i', 'Esse repellendus O', 'Voluptate dolorem es', '68', '32', '82', 'pending', NULL, '2025-05-11 14:01:09', '2025-05-11 14:01:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumumen`
--

CREATE TABLE `pengumumen` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','published') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengumumen`
--

INSERT INTO `pengumumen` (`id`, `user_id`, `title`, `content`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9eddc0c9-c515-4f8e-886f-99de309aee02', '9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', 'Info', 'Tes Info', 'published', NULL, '2025-05-09 08:03:14', '2025-05-10 18:53:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `regions`
--

CREATE TABLE `regions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `regions`
--

INSERT INTO `regions` (`id`, `user_id`, `region`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9ed5a8d7-de0f-4945-b609-5d1be4c29b1c', '9ed5a5ab-5a4e-44ef-9146-ae3adc32add7', 'REG 1', '2025-05-05 10:15:48', '2025-05-05 07:29:39', '2025-05-05 10:15:48'),
('9ed5e430-f46a-408f-8878-8028d159c507', 'fdf8af78-5cc0-4c36-9a0b-d2c9aef9aed7', 'REG 3', NULL, '2025-05-05 10:15:36', '2025-05-05 10:15:36'),
('9ed5e466-e650-4f43-b8aa-57fbf21ef774', '4dec1748-f9c1-4d8f-af31-c86c7381315e', 'REG 1', NULL, '2025-05-05 10:16:11', '2025-05-05 10:16:11'),
('9ed5e4a4-7dcc-4589-968c-21cffb187489', '1cbde9b2-ec67-4d20-8e2c-a1f7da32277b', 'REG 4', NULL, '2025-05-05 10:16:52', '2025-05-05 10:16:52'),
('9ed5e4ea-c15d-4d9c-8c08-8355be391ba2', '089cfbb6-ffb1-4a7a-a779-5eea19243bb2', 'REG 5', NULL, '2025-05-05 10:17:38', '2025-05-05 10:17:38'),
('9ed5e52a-7b56-4a0f-a53e-8005f5d4ef4a', '02c960d7-4767-4cfc-8722-38972b329567', 'REG 6', NULL, '2025-05-05 10:18:19', '2025-05-05 10:18:19'),
('9ed5e569-ac23-4faf-8267-c5c91fbe675d', 'da02e33c-c1e6-4893-aaff-a08547813678', 'REG 7', NULL, '2025-05-05 10:19:01', '2025-05-05 10:19:01'),
('9ed5e598-359b-4f90-b7d0-e92c802e7a09', 'f5a15f54-423f-4404-983b-e64aa760211e', 'REG 8', NULL, '2025-05-05 10:19:31', '2025-05-05 10:19:31'),
('9ed5e5b1-a548-4cb6-ad2c-61749ee8e8d5', 'a6d88de3-dc79-4d73-bdd2-9fb20a10f8fd', 'REG 2', NULL, '2025-05-05 10:19:48', '2025-05-05 10:19:48'),
('9ed5e6ae-5db5-441c-8830-2979d0884e54', '9ed5e68e-2318-4d07-9ad4-2189bde6235f', 'REG 9', NULL, '2025-05-05 10:22:34', '2025-05-05 10:22:34'),
('9ed5e6c2-6ea3-4e02-b7d9-b425897258cb', 'a6d88de3-dc79-4d73-bdd2-9fb20a10f8fd', 'REG 10', NULL, '2025-05-05 10:22:47', '2025-05-05 10:22:47'),
('9ed9b465-0062-46c9-8b35-eedcea9db1b6', 'a6d88de3-dc79-4d73-bdd2-9fb20a10f8fd', 'REG 11', NULL, '2025-05-07 07:45:16', '2025-05-07 07:45:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `region_details`
--

CREATE TABLE `region_details` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wilayah_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `region_details`
--

INSERT INTO `region_details` (`id`, `region_id`, `wilayah_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9ed606d0-6aa1-4625-91ff-89ab467848a9', '9ed5e466-e650-4f43-b8aa-57fbf21ef774', 'c415a158-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:52:25', '2025-05-05 11:52:25'),
('9ed606d0-6fff-413e-8616-98b296bd6821', '9ed5e466-e650-4f43-b8aa-57fbf21ef774', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', NULL, '2025-05-05 11:52:25', '2025-05-05 11:52:25'),
('9ed606d0-7115-4dfc-8133-5cdb8debd8ee', '9ed5e466-e650-4f43-b8aa-57fbf21ef774', 'c415a452-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:52:25', '2025-05-05 11:52:25'),
('9ed606d0-acca-462a-9eff-663e34f9dbbb', '9ed5e466-e650-4f43-b8aa-57fbf21ef774', 'c415a561-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:52:25', '2025-05-05 11:52:25'),
('9ed606d0-adca-4b27-b33d-6c8a10f93045', '9ed5e466-e650-4f43-b8aa-57fbf21ef774', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:52:25', '2025-05-05 11:52:25'),
('9ed606d0-aef0-447e-b760-32727e80d5c1', '9ed5e466-e650-4f43-b8aa-57fbf21ef774', 'c415a628-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:52:25', '2025-05-05 11:52:25'),
('9ed606d0-af63-4ad8-8068-b8cdb87bbf60', '9ed5e466-e650-4f43-b8aa-57fbf21ef774', 'c415a657-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:52:25', '2025-05-05 11:52:25'),
('9ed606d0-b07f-436a-92b3-9f7f4c8cdf72', '9ed5e466-e650-4f43-b8aa-57fbf21ef774', 'c415a685-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:52:25', '2025-05-05 11:52:25'),
('9ed60867-5968-41be-9cbe-a93724bf7b27', '9ed5e430-f46a-408f-8878-8028d159c507', 'c415a6ae-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:56:51', '2025-05-05 11:56:51'),
('9ed60867-5be5-460e-84f9-36f0df6e5e81', '9ed5e430-f46a-408f-8878-8028d159c507', 'c415a6dd-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:56:51', '2025-05-05 11:56:51'),
('9ed60867-5c50-4014-8bc3-737023951f59', '9ed5e430-f46a-408f-8878-8028d159c507', 'c415a706-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:56:51', '2025-05-05 11:56:51'),
('9ed60867-5ce4-4653-9749-36643802cc2c', '9ed5e430-f46a-408f-8878-8028d159c507', 'c415a730-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:56:51', '2025-05-05 11:56:51'),
('9ed60867-78d6-4bf9-82b3-2f82e5b3117c', '9ed5e430-f46a-408f-8878-8028d159c507', 'c415a75a-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:56:51', '2025-05-05 11:56:51'),
('9ed60867-794b-4083-8255-fdd7845522e8', '9ed5e430-f46a-408f-8878-8028d159c507', 'c415a796-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 11:56:51', '2025-05-05 11:56:51'),
('9ed60a13-17f8-48ff-8952-aa1ba5b4a23d', '9ed5e4a4-7dcc-4589-968c-21cffb187489', 'c415a7bf-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:01:32', '2025-05-05 12:01:32'),
('9ed60a13-1d33-4f68-b971-b8af1e15f6e1', '9ed5e4a4-7dcc-4589-968c-21cffb187489', 'c415a7e8-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:01:32', '2025-05-05 12:01:32'),
('9ed60a13-1da3-4959-a293-da85880ead5f', '9ed5e4a4-7dcc-4589-968c-21cffb187489', 'c415a810-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:01:32', '2025-05-05 12:01:32'),
('9ed60a13-1e07-4a8a-86a7-301ba4a56b11', '9ed5e4a4-7dcc-4589-968c-21cffb187489', 'c415a83a-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:01:32', '2025-05-05 12:01:32'),
('9ed60a13-36b0-447b-bc15-ea91eb9d53ea', '9ed5e4a4-7dcc-4589-968c-21cffb187489', 'c415a862-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:01:32', '2025-05-05 12:01:32'),
('9ed60a13-3725-42f0-a540-4eaa928076b9', '9ed5e4a4-7dcc-4589-968c-21cffb187489', 'c415a88b-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:01:32', '2025-05-05 12:01:32'),
('9ed60aae-5ae0-4386-aa43-7083713b76e1', '9ed5e4ea-c15d-4d9c-8c08-8355be391ba2', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:03:13', '2025-05-05 12:03:13'),
('9ed60aae-5d98-43ca-95c4-8aa6b33f48dd', '9ed5e4ea-c15d-4d9c-8c08-8355be391ba2', 'c415a8df-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:03:13', '2025-05-05 12:03:13'),
('9ed60aae-74d5-4c2a-8433-8780e2d96007', '9ed5e4ea-c15d-4d9c-8c08-8355be391ba2', 'c415a906-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:03:13', '2025-05-05 12:03:13'),
('9ed60aae-7555-4172-9d29-f1dbd5832f7f', '9ed5e4ea-c15d-4d9c-8c08-8355be391ba2', 'c415a92a-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:03:13', '2025-05-05 12:03:13'),
('9ed60aae-75bc-4e85-8417-12a461fe83f6', '9ed5e4ea-c15d-4d9c-8c08-8355be391ba2', 'c415a95f-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:03:13', '2025-05-05 12:03:13'),
('9ed60aae-7621-4b25-acb2-52f05acd0a38', '9ed5e4ea-c15d-4d9c-8c08-8355be391ba2', 'c415a986-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:03:13', '2025-05-05 12:03:13'),
('9ed60b17-e780-4daf-b1f6-b7fa768fd8e3', '9ed5e52a-7b56-4a0f-a53e-8005f5d4ef4a', 'c415a9aa-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:04:23', '2025-05-05 12:04:23'),
('9ed60b17-e9f9-4050-850e-6b27bca5d6f6', '9ed5e52a-7b56-4a0f-a53e-8005f5d4ef4a', 'c415a9cf-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:04:23', '2025-05-05 12:04:23'),
('9ed60b17-ea6b-461c-8bdb-2af6ad889e0f', '9ed5e52a-7b56-4a0f-a53e-8005f5d4ef4a', 'c415a9f4-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:04:23', '2025-05-05 12:04:23'),
('9ed60b9a-6d3a-47c9-90e7-bc73613c1be4', '9ed5e569-ac23-4faf-8267-c5c91fbe675d', 'c415aa1b-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:05:48', '2025-05-05 12:05:48'),
('9ed60b9a-6fa4-43a6-bd25-8c790bdd81fe', '9ed5e569-ac23-4faf-8267-c5c91fbe675d', 'c415aa41-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:05:48', '2025-05-05 12:05:48'),
('9ed60b9a-7043-4a32-88d3-76bf829720e5', '9ed5e569-ac23-4faf-8267-c5c91fbe675d', 'c415aa66-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:05:48', '2025-05-05 12:05:48'),
('9ed60b9a-8884-42f3-841f-a4d3396914bb', '9ed5e569-ac23-4faf-8267-c5c91fbe675d', 'c415aa8b-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:05:48', '2025-05-05 12:05:48'),
('9ed60b9a-8903-4361-bdf8-9eea0e46eae0', '9ed5e569-ac23-4faf-8267-c5c91fbe675d', 'c415aaae-2969-11f0-bda6-bc2411c0ee13', '2025-05-05 20:30:58', '2025-05-05 12:05:48', '2025-05-05 20:30:58'),
('9ed60b9a-8969-498a-9cde-6974cb829791', '9ed5e569-ac23-4faf-8267-c5c91fbe675d', 'c415aad5-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:05:48', '2025-05-05 12:05:48'),
('9ed60c48-f68c-4cf6-a3e3-1fcdf47c53ed', '9ed5e598-359b-4f90-b7d0-e92c802e7a09', 'c415aafc-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:07:42', '2025-05-05 12:07:42'),
('9ed60c48-f909-4151-94fe-cc8410ca756d', '9ed5e598-359b-4f90-b7d0-e92c802e7a09', 'c415ab24-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:07:42', '2025-05-05 12:07:42'),
('9ed60c49-10f3-42f2-912b-d805969240e8', '9ed5e598-359b-4f90-b7d0-e92c802e7a09', 'c415ab4a-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:07:43', '2025-05-05 12:07:43'),
('9ed60c49-1186-469a-8917-5f87877911e3', '9ed5e598-359b-4f90-b7d0-e92c802e7a09', 'c415ab94-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:07:43', '2025-05-05 12:07:43'),
('9ed60c49-11f5-4e2e-9502-ae7f6f872565', '9ed5e598-359b-4f90-b7d0-e92c802e7a09', 'c415ab6f-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:07:43', '2025-05-05 12:07:43'),
('9ed60ce5-d2ea-485f-aa29-7b7747e83a32', '9ed5e6ae-5db5-441c-8830-2979d0884e54', 'c415ac74-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:09:25', '2025-05-05 12:09:25'),
('9ed60ce5-d55e-4a57-b7ea-7b22a59a5285', '9ed5e6ae-5db5-441c-8830-2979d0884e54', 'c415acca-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:09:25', '2025-05-05 12:09:25'),
('9ed60ce5-d60a-4363-b3d9-67e627cddee0', '9ed5e6ae-5db5-441c-8830-2979d0884e54', 'c415ac99-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:09:25', '2025-05-05 12:09:25'),
('9ed60ce5-f219-4d01-8d43-fbbaeb906363', '9ed5e6ae-5db5-441c-8830-2979d0884e54', 'c415abe0-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:09:25', '2025-05-05 12:09:25'),
('9ed60ce5-f28d-40fa-a54b-30dfde61a6bc', '9ed5e6ae-5db5-441c-8830-2979d0884e54', 'c415ac05-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:09:25', '2025-05-05 12:09:25'),
('9ed60ce5-f2f0-4929-bc6a-75e3a75a3576', '9ed5e6ae-5db5-441c-8830-2979d0884e54', 'c415ac29-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:09:25', '2025-05-05 12:09:25'),
('9ed60ce5-f357-4e45-b161-2ae5a3db7495', '9ed5e6ae-5db5-441c-8830-2979d0884e54', 'c415ac4d-2969-11f0-bda6-bc2411c0ee13', NULL, '2025-05-05 12:09:25', '2025-05-05 12:09:25'),
('9ed60d7f-e063-4193-af75-a6cd903aa34b', '9ed5e6ae-5db5-441c-8830-2979d0884e54', '9ed60d4a-3c78-4c84-b5ff-c0d2482af4cd', NULL, '2025-05-05 12:11:06', '2025-05-05 12:11:06'),
('9ed6c19c-adb2-4e86-a1e3-8d2b303d0d5a', '9ed5e569-ac23-4faf-8267-c5c91fbe675d', '9ed6c158-9f21-41ed-b03c-0b3748f760b6', NULL, '2025-05-05 20:34:44', '2025-05-05 20:34:44'),
('9ed9b30b-2123-4fa4-87d9-5675b1835a77', '9ed5e6c2-6ea3-4e02-b7d9-b425897258cb', 'c415acca-2969-11f0-bda6-bc2411c0ee13', '2025-05-07 07:42:12', '2025-05-07 07:41:29', '2025-05-07 07:42:12'),
('9ed9b3b5-fce6-45c1-ae35-f348d94c4222', '9ed5e6c2-6ea3-4e02-b7d9-b425897258cb', '9ed9b3a1-e6f0-4d08-bbdc-37dcb61e2d0f', NULL, '2025-05-07 07:43:21', '2025-05-07 07:43:21'),
('9ee10944-6f84-4344-a2cf-a3e907091b29', '9ed5e52a-7b56-4a0f-a53e-8005f5d4ef4a', '9ee1019d-0681-4db0-8830-f51b9f2954c1', '2025-05-10 16:40:37', '2025-05-10 16:13:23', '2025-05-10 16:40:37'),
('9ee10fb7-d935-4a4a-9a5b-741a4cb822a4', '9ed5e6ae-5db5-441c-8830-2979d0884e54', '9ed6dc0c-fe9b-443a-9c92-19bcf08a2f3b', NULL, '2025-05-10 16:31:25', '2025-05-10 16:31:25'),
('9ee1135e-2595-4263-8919-912eb6397534', '9ed5e52a-7b56-4a0f-a53e-8005f5d4ef4a', '9ee11337-12c3-4760-b245-cd2765c09aa4', NULL, '2025-05-10 16:41:37', '2025-05-10 16:41:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `self_schedules`
--

CREATE TABLE `self_schedules` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_visit_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `spesialis`
--

CREATE TABLE `spesialis` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spesialis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `spesialis`
--

INSERT INTO `spesialis` (`id`, `spesialis`, `deleted_at`, `created_at`, `updated_at`) VALUES
('01344382-0842-4c8e-a5d9-9cb0c4baa390', 'Spesialis Gigi Anak - Sp.KGA', NULL, NULL, NULL),
('020d6f5d-2606-4d6b-9847-112cdb793373', 'Spesialis Obstetri Dan Ginekologi - Sp.OG', NULL, NULL, NULL),
('0d04fa86-b1da-4384-bf34-7625ebf63304', 'Spesialis Geriatri - Sp.Ger.', NULL, NULL, NULL),
('1066e894-f46f-487b-bbb7-73237ff30e29', 'Spesialis Onkologi - Sp.Onk', NULL, NULL, NULL),
('135640d0-228c-4603-a998-26527aaf5e8c', 'Spesialis Bedah Anak - Sp.BA', NULL, NULL, NULL),
('1add2ca2-23b2-480f-954a-79932bf2e096', 'Spesialis Radiologi - Sp.Rad', NULL, NULL, NULL),
('268b2061-2b23-4cfb-a1c1-5ab199a83540', 'Spesialis Kedokteran Okupasi - Sp.Ok.', NULL, NULL, NULL),
('26c59e0e-7634-4c21-a5e5-ec687eab665d', 'Spesialis Fisioterapi - S.FT', NULL, NULL, NULL),
('2e757673-0a53-44ef-866b-a86111608127', 'Spesialis Patologi Anatomi - Sp.PA', NULL, NULL, NULL),
('3e87a092-320e-4343-9d2f-5d85388120ec', 'Spesialis Bedah Plastik - Sp.BP', NULL, NULL, NULL),
('4af75584-537b-4b2e-b63a-3796c4fe27e0', 'Spesialis Periodonsia - Sp.Perio.', NULL, NULL, NULL),
('50d42f59-37ab-4f5a-8178-2c2fdf08d2c9', 'Spesialis Kedaruratan Medik - Sp.EM', NULL, NULL, NULL),
('5166082f-f79e-421f-9163-1d4c20b072ec', 'Spesialis Kedokteran Olahraga - Sp.KO', NULL, NULL, NULL),
('5737a646-1032-4f41-9760-06d95810d0f0', 'Spesialis Bedah Urologi - Sp.BU.', NULL, NULL, NULL),
('597b3651-e562-4afd-a764-52f470975dee', 'Spesialis Ilmu Kedokteran Fisik dan Rehabilitasi - Sp.KFR', NULL, NULL, NULL),
('5c889ffa-50b2-424c-8f20-5e448386e163', 'Dokter Gigi - Drg', NULL, NULL, NULL),
('67926b37-2547-448f-afc4-3d3cb7abbaf6', 'Spesialis Anestesiologi Dan Reanimasi - Sp.B.', NULL, NULL, NULL),
('6927bc2c-22dd-4ab3-aef4-3900965e3ed9', 'Spesialis Kedokteran Nuklir - Sp.KN', NULL, NULL, NULL),
('74188f1e-c44d-4a80-8cc3-c1fd15b698cd', 'Spesialis Penyakit Mulut - Sp.PM', NULL, NULL, NULL),
('7880df51-4cff-4297-bbf6-81ff45b5ac0d', 'Spesialis Jantung Dan Pembuluh Darah - Sp.JP', NULL, NULL, NULL),
('78be4356-8da0-427d-81fa-b437c2ec3e00', 'General Practitioner - dr', NULL, NULL, NULL),
('84e557a6-938e-4810-9826-db999c7eaf85', 'Spesialis Bedah Ortopedi Dan Traumatologi - Sp.OT', NULL, NULL, NULL),
('85c1bf08-c6e0-4475-8771-90c075e9cd15', 'Spesialis Anak - Sp.A.', NULL, NULL, NULL),
('89aff25b-fd8f-4f8e-bfce-f54d4fbc89a1', 'Spesialis Telinga, Hidung, Tenggorokan - Sp.THT', NULL, NULL, NULL),
('9801e155-9bcc-4586-81d4-e405315e03d4', 'Spesialis Penyakit Kulit Dan Kelamin - Sp.KK', NULL, NULL, NULL),
('9e7c9ab5-4c57-4e0a-abf9-bd718c36fc53', 'Spesialis Kardiologi - Sp.PD-KKV', NULL, NULL, NULL),
('9ed62714-82b1-413a-a162-1f5bf8d50c1a', 'Lainnya', NULL, '2025-05-05 13:22:38', '2025-05-05 13:22:38'),
('9f63640d-33bf-4251-a4b0-4e8e1dccb9fd', 'Spesialis Urologi - Sp.U.', NULL, NULL, NULL),
('a2f71d55-0031-473f-b71b-f49467ecbd87', 'Spesialis Onkologi Radiasi - Sp.Onk.Rad.', NULL, NULL, NULL),
('a8e40681-4d91-4315-ade1-c573a29518d1', 'Spesialis Penyakit Dalam - Sp.PD', NULL, NULL, NULL),
('ad826c45-8aeb-4b25-a90a-11c0c7680e32', 'Spesialis Saraf Atau Neurologi - Sp.S.', NULL, NULL, NULL),
('b60641e0-f57e-4b78-ac73-1a4d55503ea1', 'Spesialis Pulmonologi - Sp.PD-KP', NULL, NULL, NULL),
('b79f5254-418c-4fbc-9d78-d406688d99b7', 'Spesialis Bedah Mulut - Sp.BM', NULL, NULL, NULL),
('bc774728-7ca5-4298-beb5-50c29ee1a71a', 'Spesialis Bedah Digestif - Sp.B, Subsp.BD(K)', NULL, NULL, NULL),
('bd3c7a33-af31-40dd-b7d8-e294d64c0ecf', 'Spesialis Andrologi - Sp.And', NULL, NULL, NULL),
('c7adfd6e-1072-432c-a73c-7864b00d31af', 'Spesialis Dermatovenerologi - Sp.DV', NULL, NULL, NULL),
('d2057aaf-8763-4c3c-9005-9374b61416ac', 'Spesialis Gizi Klinik - Sp.GK', NULL, NULL, NULL),
('d6359616-8173-4c7f-8870-50dff437278e', 'Spesialis Kedokteran Jiwa Dan Psikiater - Sp.KJ', NULL, NULL, NULL),
('deccc142-aea4-4a9c-b62b-436702334fe4', 'Spesialis Paru - Sp.P.', NULL, NULL, NULL),
('e07a2be7-14b8-4a70-bcc8-891855dd8165', 'Spesialis Bedah Onkologi - Sp.B(K) Onk', NULL, NULL, NULL),
('f21e9312-6023-45f3-a1ad-97a291c76057', 'Spesialis Bedah Toraks Kardiovaskuler - Sp.BTKV', NULL, NULL, NULL),
('f6557cdd-fd99-41b9-873d-14c572caddbe', 'Spesialis Kedokteran Forensik - Sp.F', NULL, NULL, NULL),
('f6fd7fc4-eb01-479b-b7d0-26cd36ba4043', 'Spesialis Radiologi - Sp.RM', NULL, NULL, NULL),
('f83acfe6-2908-46b0-9a89-c5f08a7e4ba1', 'Spesialis Mikrobiologi Klinik - Sp.MK', NULL, NULL, NULL),
('fb282455-4b8f-4d63-8ad1-69b61966ded8', 'Spesialis Farmakologi Klinik - Sp.FK', NULL, NULL, NULL),
('fc468279-2746-4c1b-9077-3ade6c325cae', 'Spesialis Bedah Syaraf - Sp.BS', NULL, NULL, NULL),
('fd84048b-c967-4a6b-adf0-397123cb484a', 'Spesialis Patologi Klinik - Sp.PK', NULL, NULL, NULL),
('fe137aa3-74c1-4c89-88e9-2c1282e78cc2', 'Spesialis Mata - Sp.M.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `role` enum('superadmin','admin','mr','am','rsm','nsm') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nip`, `password`, `nama`, `alamat`, `no_hp`, `status`, `role`, `foto`, `email`, `email_verified_at`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
('01a18c50-203b-410e-ab18-a1f02d799045', '0017', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Dedy Herwanto', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('02c960d7-4767-4cfc-8722-38972b329567', '0006', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Willy Benyamin', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'rsm', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('0306599a-920a-467a-b681-f84630057b62', '0116', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Willy Herlambang', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('089cfbb6-ffb1-4a7a-a779-5eea19243bb2', '0005', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Yosef Widjaya', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'rsm', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('0c4aa59f-ee18-464e-a2eb-76503fed3de1', '0143', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Reza Pratama', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('0c91b69a-2520-4d59-9743-2879d0c24672', '0104', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Angga Setiawan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('0d8d367d-936e-4275-a305-7706bd93cde1', '0067', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Vacant', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('0e9da98c-b11d-4038-a45b-2945f692a805', '0015', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Vaisal', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('0ee705e9-6522-4883-a8ee-54e7e0c45e25', '0036', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Akhmad Affandy', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('100a30c3-577d-4ab6-a6f1-d0a614669e4c', '0117', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Beben Gusnuryadin', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('10c5b5f0-860c-49e8-8f61-a187363ac542', '0110', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Syamrotul Faudiyah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('13671a3f-706b-4fb5-994f-4a608569cbbf', '0095', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Nico Budi Soputro', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('165c4e1a-6350-4e74-a55a-ce8f0e932052', '0134', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Hengky Chandra', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('16861de3-f6f4-4b2e-ab0c-dbe0963b1b8c', '0029', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Patria Sonjaya', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('18c8b286-dc6c-4826-b4ca-93380951b70b', '0069', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Mei Fridawati', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('199a2479-7bee-4fe5-afaf-1017af26a21f', '0066', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Kiki Prasetyo', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('1a6133ba-16a2-4d15-83cb-247ef71dc6b6', '0080', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Nur Hanifah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('1af2daa2-d3c6-4126-b626-e6715a511fa2', '0057', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Muhammad Rizky Jamiddin Morishita', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('1bff6b3d-d74c-452f-a8bc-29272d0d8408', '0043', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'M. Novrizal Malik', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('1cbde9b2-ec67-4d20-8e2c-a1f7da32277b', '0004', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Nailah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'rsm', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('1dcad18c-8e83-4a31-9759-ec171118f88e', '0114', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Moch Ilham Surya Mustaqim', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('1f32e6d1-2db4-49b2-9c72-0a80a018e7b8', '0056', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Thomas Telapary', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('1fa11c51-f704-4be4-8a1a-7ee9dbc46306', '0024', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Lindawati', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('2459b7a0-8a0c-4dbd-891d-ef235a1289c6', '0096', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Dedi Supriyanto', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('24c687d1-bcc0-4c81-bdd4-40c4513b4754', '0094', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Galih Pradipta Haryadi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('2890e340-ce0d-487a-b8a0-aec7057098f0', '0141', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Noviansyah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('296c4073-cf47-418d-9e3a-6f3f9cd1eecb', '0136', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Syifa Fauzia', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('29f8ed76-7966-4990-9915-17152282b315', '0048', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ahmad Irsyiadi Rahim', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('2c01ddce-b52b-42e3-a68e-306d3d7c211f', '0118', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Silfia Tresnawati', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('2d21cede-43db-471b-b14d-4aebdc382cac', '0047', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Agustia Ningsih', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('2e092a9d-504a-48f6-b166-575e3fa0e9ad', '0074', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'I Ketut Agus Eko Widiawan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('31683a1c-7e64-4a05-807e-a12b59abdc45', '0038', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Indah Janingtyas Ambarwati', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('395b0a87-62ec-4e8c-8d4a-6ae78ad24857', '0033', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Muhammad Fitrianto Joko Puspito', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('3b6b6c58-64f8-49c6-8cbf-66a7d493707b', '0063', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rahmad Tabiin', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('3ce182d8-a404-42c1-bae7-ba81b3cdb57a', '0049', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ade Apriathis Rantelino', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('3d52c62c-ab56-4673-a987-21e11a99886e', '0077', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ratna Dewi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('3f748a88-3949-406b-9db5-261c87e769c9', '0113', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'M. Fazlih Gyandi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('40fd7483-791e-44a1-a1d5-fd267874a57d', '0121', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Wishnu Eka Wardhana', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('41f8c513-f98d-4a5e-8aa0-2e0005585168', '0122', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rizky Jefrianto', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('43c12651-a1c7-434b-ab79-d770ae3c572e', '0081', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Evi Maya Sari', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('48a1d223-3a7c-483d-bcbc-5c1a014dc25a', '0059', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rully Fadly Mandagie', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('48c0323b-9a34-405a-acff-cc94b9b5701e', '0068', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Dwi Jatmiko', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('4b9e7867-c050-4d78-9bd6-2f53d80d8b67', '0131', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Supriyanti', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('4c4c3772-3a4c-4531-b990-4ed9b4116685', '0019', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Leny Yudho Prawiro', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('4dec1748-f9c1-4d8f-af31-c86c7381315e', '0001', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Felix Liyadi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'rsm', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('4e2234e9-fac9-44e7-bb7b-3236e28e5bf8', '0042', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Dedy Irawan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('4f3cb970-8d20-40ea-922b-f5093dca0c51', '0129', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Agus Hayadi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('52ef10be-e16b-4cf8-a42a-11b1cbf2c7f0', '0119', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Adi Sucipto', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('52f21869-a1ad-4a80-8c8f-c0be601084c9', '0127', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Baggas Pramudya', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('55c1aba2-accd-49cb-8926-e03c5db72d45', '0140', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Pandiawan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('571ad588-9d63-45cd-8ebf-95fe54f838cd', '0031', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Aris Mardianto', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('5a6a231b-9b29-4539-b0ea-95d80b4ca8df', '0016', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Nicholas Ferryanzen', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('5e184039-e25d-49e8-b344-f6a4d1c1bf3c', '0009', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Edi Sutoyo', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('634251fe-6982-410f-bff6-305acb9c7287', '0039', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Bazar Rinaldi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('651e6683-93ad-4886-8383-2fe70e2ddb15', '0130', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Mohamad Nur Fajar Santosa', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('653b762d-8963-4407-ad36-4c6aee054697', '0065', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ach. Mabrur Yulianto', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('6608e417-26b5-477a-bb8c-84ccb0776d81', '0022', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Hadi Gunawan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('6ad0214c-42de-4646-bd29-b377643b6030', '0101', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Aditya Reza Kusuma', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('6ad350b4-31ba-4b18-a59d-3bda92305b28', '0079', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Siprianus Nong Charlon', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('6e0092fe-a9d0-419a-8c75-f9c7c9fb4695', '0103', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Miladi Kadarusman', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('6e9a2bbf-ce8a-47a8-b757-90a919f0d109', '0072', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Habriza Tauhid Rabbani', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('6ece317a-6635-4b8a-a585-e9a5182aa774', '0091', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Dalich Dewangga', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('6f11c687-2443-499e-b7f8-58a5cd4fe516', '0124', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Abdul Syukur Zulkifli', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('6f2f1abd-ee07-44dc-8fbf-f991db81c313', '0073', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'I Komang Budiarta', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('782df456-5e3c-4f3d-bdf2-b5b2cdddbc78', '0093', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ahmad Karim', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('786ab4ac-b000-434e-aed6-90eaa762fc70', '0109', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Oki Dwi Arisqi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('79feb234-c2f3-4ffc-9f90-23fce5937c22', '0099', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Khusni Taufik', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('7c0c3d34-2962-4b3f-adee-d5c1d71ca928', '0111', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Asep Budi Nugraha', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('7c27dee7-37de-42c9-9266-b26fd09b46d0', '0075', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Haerul Anwar', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('7d296490-fcf2-4e36-8b12-e282fc6d0ba8', '0021', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'I Wayan Didi Lesmana', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('7ecae3b5-dc01-4179-8f7a-8e41be857912', '0028', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Agung Wahyudi Kiosa', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('7f68146c-0971-4a44-a44b-aa2a5bf2829a', '0020', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Andhy Shamantha', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('8327054f-8069-4a49-a9b8-fd20609a85ec', '0112', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Dinar Mustika Rahmawati', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('837097e2-2136-4a06-a434-5f20f8fa42d7', '0052', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Hardiyanto Biring', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('88f124a5-ece1-44e9-ae37-7b03ed69544b', '0142', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Vira Aprilianti', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('8b2a3fb6-fa12-4130-8eda-62f572e90de4', '0012', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Andy Putra Yunior', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('8b8a3c27-25bf-45d6-bfb8-4df149ce300c', '0050', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Irwansyah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('8e878e35-3ba9-466f-90a5-413ac898e6b7', '0105', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ros Sita Sari', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('939cd1e3-1fcf-43ea-b117-bd32c7f826c4', '0013', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Sandy Andreas Koropit', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('95404c31-206d-4322-bba3-ae463fa4b0f7', '0137', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Hery Fatoni', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('961c62d6-5746-439d-a72a-43d7d1ea66ed', '0107', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Joko Santoso', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('973e20f1-1361-4c77-b632-8c51866f544b', '0092', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Syarif Hidayatullah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('982dd355-9218-4614-85a8-c7cac26c974b', '0126', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Muhamad Rifa Achyadi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('9cafa708-378d-4586-80ed-dc6edbfb7f3e', '0106', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Wahyu Satria Putra Pratama', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('9e39a7ae-51b9-428a-be0a-eb7e1cbc8620', '0128', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Arip Rahman Hakim', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('9e5077b2-ec34-44de-a963-5f5b586d3008', '0014', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'I Wayan Sutama', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('9ed5e2fc-2067-4093-a6f4-7e8b3c00b84a', '11223344', '$2y$10$Uw.fBKK8ign/u.IpTZq4ge3X9m4WG5FGw.frjj8ufNIItghy3UKBK', 'Super Admin', 'Jl Kapten Halim No 73 Pasawahan Purwakarta', '085711115140', 'active', 'superadmin', 'default.png', 'info@mulyamedicalcentre.com', NULL, NULL, NULL, '2025-05-05 10:12:13', '2025-05-05 10:12:13'),
('9ed5e68e-2318-4d07-9ad4-2189bde6235f', '9988', '$2y$10$IA54sLfD1Neo5RkFSolxCOcR27377IFV.JbP8YONdEkpTQxn1M0SW', 'Andreas Vical S', 'Jl Kapten Halim No 73 Pasawahan Purwakarta', '085311115140', 'active', 'rsm', 'default.png', 'andreas@solas.id', NULL, NULL, NULL, '2025-05-05 10:22:12', '2025-05-05 10:22:12'),
('9ed5f0b3-5ad8-46c0-bf95-d2b5da886740', '9887', '$2y$10$IcluS5eh5R2H6a83qjplKOLc3RN0KPAOIBdchPbjpjv7yjkyA1wX6', 'Kadir', 'PT SOLAS LANGGENG SEJAHTERA', '08571111519', 'active', 'am', 'default.png', 'kadir@solas.id', NULL, NULL, NULL, '2025-05-05 10:50:35', '2025-05-05 10:50:35'),
('9ed5f0f5-9ee9-4935-b70c-dc08fca58e76', '77617', '$2y$10$MDeSeklbYihZ5b5Q7VKZ2uzT7pM3hiDLkU5nANKXdUkhlPnBcaT.u', 'Lindung Manik', 'PT SOLAS LANGGENG SEJAHTERA', '085711315140', 'active', 'am', 'default.png', 'lindungmanik@solas.id', NULL, NULL, NULL, '2025-05-05 10:51:18', '2025-05-05 10:51:18'),
('9ed5f12d-eba0-4d6e-a2d2-01624ba5659c', '88776', '$2y$10$rQqjTI8URHB4bsj67wwgVej51YtMpCq6UgAOp4dEmej4fSO.AxW1m', 'Marolop Tua Purba', 'PT SOLAS LANGGENG SEJAHTERA', '085711114140', 'active', 'am', 'default.png', 'maroloptuapurba@solas.id', NULL, NULL, NULL, '2025-05-05 10:51:55', '2025-05-05 10:51:55'),
('9ed5f165-fd0d-406c-bfba-e12577712e51', '82377', '$2y$10$NnDdhmv8JsBX/FhF1/nxo.frPrVUz2hvCMjODcmufCBlZA87.QCy6', 'Welmando', 'PT SOLAS LANGGENG SEJAHTERA', '08625365354', 'active', 'am', 'default.png', 'welmando@solas.id', NULL, NULL, NULL, '2025-05-05 10:52:32', '2025-05-05 10:52:32'),
('9ed5f19d-7baf-421e-8f55-c36347e00523', '97768', '$2y$10$o.qSGerp0sxetl6GDK8OKunI6U3KDnXpDN4H9YHS1gKbJKsYJH3yu', 'Heppi Darmawan', 'PT SOLAS LANGGENG SEJAHTERA', '089988374625', 'active', 'am', 'default.png', 'heppidarmawan@solas.id', NULL, NULL, NULL, '2025-05-05 10:53:08', '2025-05-05 10:53:08'),
('9ed5f1ee-096f-4811-9078-e85fd9e78e15', '6667', '$2y$10$ARqqcBZq.OP0v8jsx5gJhe7bbeJDkMacnJB9flZOh2fBCpCBUPwtC', 'Ronald Ebit A Lbn Toruan', 'PT SOLAS LANGGENG SEJAHTERA', '08635262534', 'active', 'am', 'default.png', 'ronaldebit@solas.id', NULL, NULL, NULL, '2025-05-05 10:54:01', '2025-05-05 10:54:01'),
('9ed5f223-7149-4bc0-bd6b-e7fcf6d9d834', '1887', '$2y$10$0mo7gEfBWPwsHXzPUWOnE.Iiu8M29mcbFUW8sgpkeV2nTp2CgvUXe', 'Morry Simanjuntak', 'PT SOLAS LANGGENG SEJAHTERA', '08998767654', 'active', 'am', 'default.png', 'morrysimanjuntak@solas.id', NULL, NULL, NULL, '2025-05-05 10:54:36', '2025-05-05 10:54:36'),
('9ed5f26a-34ae-4ae7-bcfa-27cfff1aa281', '8872', '$2y$10$arMMMbjUJzhCtPF24fY9ougxLIROcBzXQd333Rkn.lCuGEHI/V.Ee', 'Rajendra Purba', 'PT SOLAS LANGGENG SEJAHTERA', '087736463516', 'active', 'am', 'default.png', 'rajendrapurba@solas.id', NULL, NULL, NULL, '2025-05-05 10:55:22', '2025-05-05 10:55:22'),
('9ed6400e-a606-4362-ba14-83411f644386', '72827', '$2y$10$koimOo8L8cfGsXrZJQafweTRWPvXd1aomtfBJ0nkVDh3pBGQkD0Le', 'Siti Maulida Awalia', 'PT SOLAS LANGGENG SEJAHTERA', '085711115149', 'active', 'mr', 'default.png', 'sitimaulidaawalia@gmail.com', NULL, NULL, NULL, '2025-05-05 14:32:28', '2025-05-05 14:32:28'),
('9ed64800-76d9-445a-8657-8c14d52ebacc', '86625', '$2y$10$LZHPN7tFmELaKM2krVT1s.2SmZG7cBGili4dh1wwm/zz28yOlPdDK', 'Ikhsan Munawar', 'PT SOLAS LANGGENG SEJAHTERA', '0372627462351', 'active', 'mr', 'default.png', 'ikhsanmunawar@solas.id', NULL, NULL, NULL, '2025-05-05 14:54:41', '2025-05-05 14:54:41'),
('9ed6b4b8-9a13-4041-a114-8505d08f9822', '8827', '$2y$10$LO7.H8uazqqYImK4N9VuGO54ONMVy1S.HrBr8OD7Tu62XGyUEBp0W', 'Wahyu Putra', 'PT SOLAS LANGGENG SEJAHTERA', '087625361514', 'active', 'mr', 'default.png', 'wahyuputra@solas.id', NULL, NULL, NULL, '2025-05-05 19:58:41', '2025-05-05 19:58:41'),
('9ed6bdcd-716b-4648-b1c0-8f3189bee096', '55261', '$2y$10$ygArK02IEuiyjPa3XKvFHei/C/eQZFqP0aCjb/2LNrHJczupPy0ae', 'Rizki Jefrianto', 'PT SOLAS LANGGENG SEJAHTERA', '087617162251', 'active', 'mr', 'default.png', 'rizkijefrianto@solas.id', NULL, NULL, NULL, '2025-05-05 20:24:05', '2025-05-05 20:24:05'),
('9ed6bee5-cf9c-4749-9562-cc93bcb3ae9e', '77165', '$2y$10$x8cB3IzjbrJ5iFTubUq1NevcNt8Z8LxnOfJPCnya03u2FyAGvQt06', 'Feri Fernando', 'PT SOLAS LANGGENG SEJAHTERA', '08716253421', 'active', 'mr', 'default.png', 'ferifernando@solas.id', NULL, NULL, NULL, '2025-05-05 20:27:09', '2025-05-05 20:27:09'),
('9ed6c24e-ab03-401d-aee4-5b62f9bb2f8c', '77287', '$2y$10$PB1P3Ox.cNY8ye9Eg44tv.bbYgx0u4etPAap.G.c3xP/D3csdX7iy', 'Hengki Chandra', 'PT SOLAS LANGGENG SEJAHTERA', '087372635527', 'active', 'mr', 'default.png', 'hengkichandra@solas.id', NULL, NULL, NULL, '2025-05-05 20:36:41', '2025-05-05 20:36:41'),
('9ed6c398-2a54-46f8-afa6-ad0bed509a36', '77265', '$2y$10$WaJVe6F/YsdoT7.0EMk.W.zgiq4SZ5TWQtIs4tX8XqtEuLeeJdtyG', 'Hery Fathoni', 'PT SOLAS LANGGENG SEJAHTERA', '087263352817', 'active', 'mr', 'default.png', 'heryfathoni@solas.id', NULL, NULL, NULL, '2025-05-05 20:40:17', '2025-05-05 20:40:17'),
('9ed6c438-4581-4b4d-8280-e95bd6762029', '99287', '$2y$10$Mx/MBRo0nxbxvrARvA/THeu/4wBVd1e9TLFtJfNDP..kUuQJOSL2m', 'Agustia Ningsih', 'PT SOLAS LANGGENG SEJAHTERA', '087161524442', 'active', 'mr', 'default.png', 'agustianingsih@solas.id', NULL, NULL, NULL, '2025-05-05 20:42:02', '2025-05-05 20:42:02'),
('9ed6c523-ebf3-4578-8965-b9ef5ed0abad', '22615', '$2y$10$XsmQMcmca3BWxOQrsCiTSubiQHPrsht2PAB7ibbbvkiYa9L.fgJWy', 'Aditya Ramadhan', 'PT SOLAS LANGGENG SEJAHTERA', '089228373615', 'active', 'mr', 'default.png', 'adityaramadhan@solas.id', NULL, NULL, NULL, '2025-05-05 20:44:36', '2025-05-05 20:44:36'),
('9ed6c86a-affa-44a5-ad27-39ad048016cd', '77261', '$2y$10$/nA0O15HPyMw9eCfC4y/Ouu.O1OTCKQ7WWOYueYTFovL0z4k7JaW6', 'Aiza Rafsanjani', 'PT SOLAS LANGGENG SEJAHTERA', '089182733627', 'active', 'mr', 'default.png', 'aizarafsanjani@solas.id', NULL, NULL, NULL, '2025-05-05 20:53:46', '2025-05-05 20:53:46'),
('9ed6c907-c92e-4bae-92fd-df12e040c056', '88278', '$2y$10$4j/UBv1CIR4qC8b9q.abWeZDRnfx0LGf2274NMkcyUrAXTXlUFuza', 'Martin', 'PT SOLAS LANGGENG SEJAHTERA', '081711264522', 'active', 'mr', 'default.png', 'martin@solas.id', NULL, NULL, NULL, '2025-05-05 20:55:29', '2025-05-05 20:55:29'),
('9ed6c974-2024-4b70-a672-a287128004c4', '79287', '$2y$10$aPzsSAnk5KSmeyIeBSDCe.OlJSdyPzUyFTDdSMVMj8Rqz9MiYiX3.', 'Darwin', 'PT SOLAS LANGGENG SEJAHTERA', '082722635241', 'active', 'mr', 'default.png', 'darwin@solas.id', NULL, NULL, NULL, '2025-05-05 20:56:40', '2025-05-05 20:56:40'),
('9ed6c9ce-2202-4c25-b4bf-4ff907861bcc', '116156', '$2y$10$vXAipFABEhtiFpk9EAkHMuoWlUNWuNUhceOjPuAHbCequXdvBzqzS', 'Eko Wardoyo', 'PT SOLAS SEJAHTERA', '089118274624', 'active', 'mr', 'default.png', 'ekowardoyo@solas.id', NULL, NULL, NULL, '2025-05-05 20:57:39', '2025-05-05 20:57:39'),
('9ed6ca1a-32ab-41c8-a851-61fafd4615a9', '86274', '$2y$10$ygShbILKL/.EN9qQeiG33.f0IsyVNxFdOAFFAcYc44YdZ8VHYP8ky', 'Saddam Hussein', 'PT SOLAS LANGGENG SEJAHTERA', '082276900165', 'active', 'mr', 'default.png', 'saddamhussein@solas.id', NULL, NULL, NULL, '2025-05-05 20:58:29', '2025-05-05 20:58:29'),
('9ed6ca72-5dd1-4486-9fd5-0f311f5ce297', '90017', '$2y$10$fiK.e0kXLH5EdBu9qMWZwOTwX2Fb/PMm5X0SKo4NA132Y4VL2nmUq', 'Satrio Umri', 'PT SOLAS LANGGENG SEJAHTERA', '081172644512', 'active', 'mr', 'default.png', 'satrioumri@solas.id', NULL, NULL, NULL, '2025-05-05 20:59:26', '2025-05-05 20:59:26'),
('9ed6ccc0-0d38-4b17-ae26-bee163095c31', '88276', '$2y$10$shQuwjmi76tuTA3yfpogFuOv/PJ.iOEG5oX0HSoyrh4lEQcNa7FBy', 'Primayandi Manullang', 'PT SOLAS LANGGENG SEJAHTERA', '0877161616152', 'active', 'mr', 'default.png', 'primayandimanullang@solas.id', NULL, NULL, NULL, '2025-05-05 21:05:53', '2025-05-05 21:05:53'),
('9ed6ccf0-29e3-4b88-80d1-d0e6d608d2f1', '55165', '$2y$10$Za7rbMN2ick2c9a50kbA7eE1xExu6rP.ooDAilnzTlHuxYO8pDht2', 'Johan Prino S', 'PT SOLAS LANGGENG SEJAHTERA', '087726253422', 'active', 'mr', 'default.png', 'johanprino@solas.id', NULL, NULL, NULL, '2025-05-05 21:06:24', '2025-05-05 21:06:24'),
('9ed6cd4b-19b8-4699-bdb6-77484ea6edee', '67265', '$2y$10$O88UflMM8E4RXmKQpRRSu.Ty7uKKxOvWfBg19DLfkg.xOGoiCo8aK', 'Mhrd Ryanton Yudha Pinem', 'PT SOLAS LANGGENG SEJAHTERA', '082273362544', 'active', 'mr', 'default.png', 'ryantonyudha@solas.id', NULL, NULL, NULL, '2025-05-05 21:07:24', '2025-05-05 21:07:24'),
('9ed6cffc-d460-4a3e-b3bd-e81a5ac6682a', '88270', '$2y$10$ICHRN2nZDB1SXPu0aaGjheGNtmgqtgkhpI6F7V3rm3zqaiKC8aNC2', 'Fondrat Yosafat S', 'PT SOLAS LANGGENG SEJAHTERA', '087716223526', 'active', 'mr', 'default.png', 'fondratyosafat@solas.id', NULL, NULL, NULL, '2025-05-05 21:14:56', '2025-05-05 21:14:56'),
('9ed6d03b-6b93-403a-ab59-22d28524a456', '88817', '$2y$10$l4uXkP4yw/EKLEAXA4Tnb.HAhcDmJ8dA9HDTMg4DwYk3nsDLNQVhe', 'Feliks Musa Rambe', 'PT SOLAS LANGGENG SEJAHTERA', '088172635333', 'active', 'mr', 'default.png', 'feliksmusarambe@solas.id', NULL, NULL, NULL, '2025-05-05 21:15:37', '2025-05-05 21:15:37'),
('9ed6d06d-9b10-4502-8cf4-3190ac3a26d1', '99187', '$2y$10$G4M950/4uOVw9GjIG8PXUunzYa1o6NS7Ot.TsEHGcdh2pgdTfL8UG', 'Wahyu Hidayat Efrizen', 'PT SOLAS LANGGENG SEJAHTERA', '081172633352', 'active', 'mr', 'default.png', 'wahyuhidayatefrizen@solas.id', NULL, NULL, NULL, '2025-05-05 21:16:10', '2025-05-05 21:16:10'),
('9ed6d0a3-a976-4c44-bcb9-7d9bcbcba522', '555147', '$2y$10$hDm3YHdrLXTtC6n6P1b89.ZCmiaUCYrCaI6Lf7av/wwiD1JCHmubO', 'Putri Handayani', 'PT SOLAS LANGGENG SEJAHTERA', '0881999228271', 'active', 'mr', 'default.png', 'putrihandayani@solas.id', NULL, NULL, NULL, '2025-05-05 21:16:45', '2025-05-05 21:16:45'),
('9ed6d0db-f43a-4c9b-bd0e-9ef7d4d2d777', '99918', '$2y$10$AJdagInyudwxJOlpC3jDh./afh9v2ymNAwac/Guy7vX9V17vlvZbi', 'Darmadi', 'PT SOLAS LANGGENG SEJAHTERA', '088762281918', 'active', 'mr', 'default.png', 'darmadi@solas.id', NULL, NULL, NULL, '2025-05-05 21:17:22', '2025-05-05 21:17:22'),
('9ed6d110-727f-4cb4-8726-fe5bc84d8c17', '77728', '$2y$10$/GeSlS07A4TsT5gMwC9VsOr2JT8xxDIg55ukLUXfPFJ.0MQ9/42Qm', 'Fikri Pratama', 'PT SOLAS LANGGENG SEJAHTERA', '0871116272831', 'active', 'mr', 'default.png', 'fikripratama@solas.id', NULL, NULL, NULL, '2025-05-05 21:17:57', '2025-05-05 21:17:57'),
('9ed6d14f-c550-4c6a-895d-ad3e0dd924a3', '55589', '$2y$10$bAQsxb1/VJ3.EiakxQIWjed/c91NtggObGXctDwPzu84r9zaVxyuS', 'Ricky Septiandi Sinaga', 'PT SOLAS LANGGENG SEJAHTERA', '088722918177', 'active', 'mr', 'default.png', 'rickyseptiandisinaga@solas.id', NULL, NULL, NULL, '2025-05-05 21:18:38', '2025-05-05 21:18:38'),
('9ed6d282-c1f1-4dd4-b208-74cc2a78d652', '88176', '$2y$10$NxoEA39.tw6zz6Hx/okJ3./CPnPZ3d8gYp3DgT5Srw30Z0geLrhui', 'Flavianus Tobing', 'PT SOLAS LANGGENG SEJAHTERA', '0881726362721', 'active', 'mr', 'default.png', 'flavianustobing@solas.id', NULL, NULL, NULL, '2025-05-05 21:21:59', '2025-05-05 21:21:59'),
('9ed6d2b4-27d5-429d-9a60-91d9ffa2eb0f', '5524', '$2y$10$8wgfeTzr0cJJIL7UNcdp..i4tHAj1hFxbZLbRiJqxh5uZ2XVRCm6K', 'Amran Simangunsong', 'PT SOLAS LANGGENG SEJAHTERA', '081711153628', 'active', 'mr', 'default.png', 'amransimangunsong@solas.id', NULL, NULL, NULL, '2025-05-05 21:22:32', '2025-05-05 21:22:32'),
('9ed6d2f9-2920-4dc6-aa1e-8cce878ff337', '99910', '$2y$10$RdHK19Q26innA76Yg81idexHyhgv6A/VmCuNbKSo5tWIOWaHOMHjC', 'Nehemia Situmeang', 'PT SOLAS LANGGENG SEJAHTERA', '088171635241', 'active', 'mr', 'default.png', 'nehemiasitumeang@solas.id', NULL, NULL, NULL, '2025-05-05 21:23:17', '2025-05-05 21:23:17'),
('9ed6d324-b39a-4dc9-8d8e-15ae89bde6cb', '77716', '$2y$10$N/M2sdDRoEGubhgjhQk31OdonrIGXtUNapQE4QWYbSgEQeQLNguAC', 'Binawan', 'PT SOLAS SEJAHTERA', '088190016253', 'active', 'mr', 'default.png', 'binawan@solas.id', NULL, NULL, NULL, '2025-05-05 21:23:45', '2025-05-05 21:23:45'),
('9ed6d382-ee89-4b47-a137-26e1790dad66', '99182', '$2y$10$q5zqPGZuJk5Yn1UsU30IP.70djSuTt4Sy6DCBL/9twZQ9Z3C9cdVe', 'Effendi Ardi Susanto Gea', 'PT SOLAS SEJAHTERA', '089118273632', 'active', 'mr', 'default.png', 'effendiardisusantogea@solas.id', NULL, NULL, NULL, '2025-05-05 21:24:47', '2025-05-05 21:24:47'),
('9ed6d3e6-525b-4029-9c23-ea5e1953faec', '44425', '$2y$10$pwc9KAg1jMqXPkElf06DHO6iHeAKyAGZBNxmkq3qhdobqhG/vT5n2', 'Shasabillah Khairunnisa', 'PT SOLAS LANGGENG SEJAHTERA', '088272992837', 'active', 'mr', 'default.png', 'shasabillahkhairunnisa@solas.id', NULL, NULL, NULL, '2025-05-05 21:25:52', '2025-05-05 21:25:52'),
('9ed6d436-3bba-4ad1-ae3e-3f092bf58b6e', '339287', '$2y$10$39tU6C8V9kSwDKjcVMkbG.9qCaAeHMaKb6YVB4u/9Ymw.mbv8Fjb6', 'Vito Reza Purba', 'PT SOLAS LANGGENG SEJAHTERA', '081117263527', 'active', 'mr', 'default.png', 'vitorezapurba@solas.id', NULL, NULL, NULL, '2025-05-05 21:26:45', '2025-05-05 21:26:45'),
('9ed6d48e-dc23-4940-98a1-b2a134048ec2', '77363', '$2y$10$aJxgrnFDCf2l51tGYPQ/SOCYnkRuv8V.2NRkBBE7lpJrzmQO1/G1K', 'Farhan Murhadi', 'PT SOLAS LANGGENG SEJAHTERA', '088172269083', 'active', 'mr', 'default.png', 'farhanmurhadi@solas.id', NULL, NULL, NULL, '2025-05-05 21:27:43', '2025-05-05 21:27:43'),
('9ed6d4eb-5f82-47a2-adbc-f5e75876009d', '66273', '$2y$10$r1V4c2cBIB3nk5xTssnlzueUloJkmWpTa47nXSNLCtV0m02LSM4g6', 'Iqbratul Akbar A', 'PT SOLAS LANGGENG SEJAHTERA', '0827236255162', 'active', 'mr', 'default.png', 'iqbratulakbar@solas.id', NULL, NULL, NULL, '2025-05-05 21:28:43', '2025-05-05 21:28:43'),
('9ed6d536-0031-422f-a4b0-32e154929cfb', '66378', '$2y$10$O7zBXbDZpUKRIG5HJ8sZc.2AxvpYHGxUT9EvaxOenJypZf0xuFwDu', 'Septesa Yuni Sari', 'PT SOLAS LANGGENG SEJAHTERA', '088920001834', 'active', 'mr', 'default.png', 'septesayunisari@solas.id', NULL, NULL, NULL, '2025-05-05 21:29:32', '2025-05-05 21:29:32'),
('9ed6d5ad-9167-4727-b2de-bcb9fdec8e17', '44234', '$2y$10$0X/uo8w/Uv9CEY7c5Czvcusb4QYkx8zAUghgrPRQ.QaNAXK35rMra', 'Nur Ziqri', 'PT SOLAS LANGGENG SEJAHTERA', '088926351009', 'active', 'am', 'default.png', 'nurziqri@solas.id', NULL, NULL, NULL, '2025-05-05 21:30:51', '2025-05-05 21:30:51'),
('9ed9c1ea-76d3-4d59-a219-0c99e021c8a3', '2556', '$2y$10$NuvKdYcbIhyStv7tAAvOA.vqUlR2q05qsHDJLsO4nNO4COJDPxzm2', 'Nasional Sales Manager', 'PT SOLAS LANGGENG SEJAHTERA', '087783744634', 'active', 'nsm', 'default.png', 'nsm@solas.id', NULL, NULL, NULL, '2025-05-07 08:23:04', '2025-05-07 08:23:04'),
('9eddb07a-6eea-4c07-b7bc-cfc0b8c7b96d', '11', '$2y$10$4jmb0Ae4P9q3mdnoZjKKlecmMh2ojMbAenZi40I9GpBP5rBb4J1V2', 'Adm 1 Pusat', 'PT SOLAS LANGGENG SEJAHTERA', '087772635463', 'active', 'superadmin', 'default.png', 'adm1pusat@solas.d', NULL, NULL, NULL, '2025-05-09 07:17:37', '2025-05-09 07:17:37'),
('9eddb0c6-3cf2-446d-96b8-75d0652abdc9', '22', '$2y$10$QXROH.sWJHqf6dkDNtLxFO.bZZlzDR/Ymr4FM3LOUoGYkE9tfkOD2', 'Adm 2 Pusat', 'PT SOLAS LANGGENG SEJAHTERA', '082991840029', 'active', 'superadmin', 'default.png', 'adm2pusat@solas.d', NULL, NULL, NULL, '2025-05-09 07:18:27', '2025-05-09 07:18:27'),
('9eddb111-40c2-482e-b07a-e037665a0db5', '33', '$2y$10$oz/D/ftXM8TkSALVmiqebufd28OWzWHQLn2lKgitgydFl9Mx6t5/K', 'Adm 3 Pusat', 'PT SOLAS LANGGENG SEJAHTERA', '088373847382', 'active', 'superadmin', 'default.png', 'adm3pusat@solas.d', NULL, NULL, NULL, '2025-05-09 07:19:16', '2025-05-09 07:19:16'),
('9eddb141-76a2-415b-b09e-e59102b88d0e', '44', '$2y$10$UiAXHBW/heoAD1sgO/JVY.6e/0qpeWo3mNxWckts0z6xyn7ZyxTzS', 'Adm 4 Pusat', 'PT SOLAS LANGGENG SEJAHTERA', '088920281767', 'active', 'superadmin', 'default.png', 'adm4pusat@solas.d', NULL, NULL, NULL, '2025-05-09 07:19:48', '2025-05-09 07:19:48'),
('9eddb181-1edf-442d-b27d-8cb81d44d760', '55', '$2y$10$nEuIS9c4kb9Dk1azzjBAx.aM5WV/YFldP9UTzqEEslo5bPfi117oC', 'Adm 5 Pusat', 'PT SOLAS LANGGENG SEJAHTERA', '087726489918', 'active', 'superadmin', 'default.png', 'adm5pusat@solas.id', NULL, NULL, NULL, '2025-05-09 07:20:29', '2025-05-09 07:20:29'),
('9eddbd31-8c4f-4347-9887-d541c502a1db', '992837', '$2y$10$Qe.VUMB.JxNZSopIud4NcOc.e9qQ9b.bLaJ6LzZtTkCcWfYa/NrkK', 'ANTONY WIJAYA', 'PT SOLAS LANGGENG SEJAHTERA', '088872635245', 'active', 'am', 'default.png', 'antonywijaya@solas.id', NULL, NULL, NULL, '2025-05-09 07:53:11', '2025-05-09 07:53:11'),
('9ee0d4fb-cbfe-4b5c-aedd-5b73cdae09cb', '87886', '$2y$10$.GSw5dyzfczob97udn2FE.X5dYq6RIgM1zlpxiwUFauRJ93w7xP7S', 'Galih', 'KALANGSURIA KARAWANG', '089928273827', 'active', 'mr', 'default.png', 'galis@solas.id', NULL, NULL, NULL, '2025-05-10 13:47:11', '2025-05-10 13:47:11'),
('9ee1017f-7364-4ae3-8c57-14dd2bb25e91', '93894', '$2y$10$NOBDY9W48cRYt6ypCP0VIe8WPZHfCOXeIU8wwxQbjebW7A6qL9Svm', 'Wahyu', 'Rengasdengklok Karawang', '08273634783', 'active', 'am', 'default.png', 'wahyu@gmail.com', NULL, NULL, NULL, '2025-05-10 15:51:39', '2025-05-10 15:51:39'),
('9ef09cd6-892a-43cb-a2f5-f5e613543e7d', '0061', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Imam Fathas Thaib', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('9f720331-a3ae-4efd-b1ca-15ba36e89e52', '0086', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Muhammad Ahyan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('a27a1ca2-2aaa-4a3e-be5f-15063de17851', '0035', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Permadi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('a2f14314-ec61-4220-8f9d-a3188f5196d4', '0034', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Aris Darmawan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('a5e0fbe8-469c-47b8-abf5-c11a949af0af', '0071', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Frisa Rahadian Sudarmono', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('a6963add-06f4-4faf-a543-c6c051ff9490', '0138', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Aditya Ramdhan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('a6d88de3-dc79-4d73-bdd2-9fb20a10f8fd', '0002', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Vacant', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'rsm', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('a91d6401-3be6-4ea8-bf58-96ff480b7718', '0044', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Lesah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('ad73a751-c439-4989-816d-5da1fc137d06', '0062', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Andi Rizaldi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('addadfad-ce3e-4c3f-8a68-20454bcfbdfb', '0025', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Siti Fatimah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('ae8304c2-7ada-49de-8b93-1160ae69406a', '0070', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Linawati', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('aec468ba-b415-4397-acca-e91852c4dca8', '0088', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Akhmad Gajali', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('b039175a-9e65-41b1-a81e-03e87effb6a8', '0102', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Yan Damar Permadi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('b35b454d-277d-453c-8029-d4480627d1e2', '0139', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'M. Apriyadi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('bab5eee4-6c8c-45bd-b986-0a47063b7184', '0133', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Wahid Ariyanto', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('baeaedf4-797b-45e9-b680-9c939dcdc5a8', '0058', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Fadliyah Korompot', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('bd1efec4-8fdb-44b9-b358-13a2e526db72', '0084', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rosita', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('bdc986ee-8747-4cbc-90ce-522429e56de8', '0064', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Holip Mustofa', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('bf51b396-abc3-4d4b-8c8e-7ad074f67d09', '0098', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rana Yuana', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('c0eaa26f-7249-4008-8de7-f54ba210fd20', '0060', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Florida Emelia Djami', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('c4b90b9b-f4f1-4674-9692-48dd2c467b84', '0011', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Anton Andreas Rosita', 'PT SOLAS LANGGENG SEJAHTERA', '085711115141', 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:37:13'),
('ca2e6119-2fa4-463c-a1d1-e116ba2a353a', '0032', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ramadhan Adi Prasetyo', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('cb76b01a-96c6-4ea3-829b-2e27848c24c7', '0010', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Vacant', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('ccfbffce-dd3c-45cf-ba52-3d2d2ea09f47', '0041', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rizki Maulana Yusron', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('cd19f2cf-d972-46c8-ae5e-77c0dd5b9d32', '0055', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Halimudin', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('cd990395-2147-4fd0-817d-9cf87be53f0e', '0108', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Imam Setiawan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('cddd92f0-fdb6-48b4-a161-6ad49e1c9fcb', '0123', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Kinanti Larasati', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('cf2ce9cb-8052-4a71-89fb-bc31ea3429a9', '0115', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Trias Badai Samudra', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('d16087c6-0308-400a-8777-01b624e3061d', '0087', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Junita Marbun', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('d1901e58-0a02-4ec9-99fc-dfe25c9e46bd', '0054', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Iin Indriani', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('d2df89ca-eeb8-43e7-86a8-9283411f6dfd', '0040', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Dede Rohmansyah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('d4a109e5-fe52-4ba1-89ec-e186228a26a3', '0030', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Hanung Rahwintoaji', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('d4bac4d1-fc49-45da-9e52-a5a81cb2b2c9', '0132', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Trisnawati', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33');
INSERT INTO `users` (`id`, `nip`, `password`, `nama`, `alamat`, `no_hp`, `status`, `role`, `foto`, `email`, `email_verified_at`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
('d84e3610-3c9f-4779-a72a-e45e68268f02', '0045', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ardian Fadiar Kurnia', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('da02e33c-c1e6-4893-aaff-a08547813678', '0007', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Bun Jung Sien', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'rsm', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('da5cae0e-b1cf-4aac-8c56-321bb8e0a4bb', '0135', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rico Ferdiansyah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('db2e5fd8-6119-417d-9e5e-901af22804ec', '0083', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Syarifah Najwa', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('dd10138f-55bd-4a50-9a8e-49d5c5f291c5', '0078', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Vera M. Koehuan', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('e54a8edf-29e4-4eb1-ae4b-6227550f5ae2', '0120', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ari Mulyadi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('e6ff1c64-955a-4f33-8cc9-aea47e06ffec', '0046', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rachmad Nur Batubara', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('e931fda8-c4cf-4df2-bda3-84b70492d9ed', '0023', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Nur Aida', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('eab7109e-2ead-41a3-91a1-0b880fda3ca1', '0037', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Untari Candra Dewi', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f0004685-dfb3-4eec-8870-9529dd7f788e', '0026', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rizky Muhammadin Norfahronni', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f0eb8971-6d98-4acb-b515-8da44575eb31', '0053', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Yuditya Kusumawardhani', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f1fc38bf-3f2c-4044-bfb0-567be6857fdd', '0027', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Milawati', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f26b625e-3d3f-448f-8c65-c2526e2fe87e', '0076', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Rahadiat Septajaya J', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f34880e5-d8f5-4f7b-8125-6560b059218e', '0089', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Martha Renatha Limbong', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f4096295-5ccc-46b3-b541-42b04a229400', '0051', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Yuni Kartika', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f5a15f54-423f-4404-983b-e64aa760211e', '0008', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Yohannes Alexsander', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'rsm', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f7fa6f1c-40b1-49f6-be6e-6ac3738437e0', '0018', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Herliani', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'am', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f9717b6f-ec8a-4a5e-91db-82aa82aeb797', '0082', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Evalyn Theresia', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f974b99e-381f-40fd-b904-31d8819628c6', '0100', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ristanto Adyityo', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('f9d82b7f-2ccd-4f2d-9b80-02e886051c32', '0090', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Susanto', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('fafa9f3d-bfef-49db-9c47-2ba620e15f9f', '0125', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Ferry Fernando', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('fde7033c-07bc-46ec-aca7-164badb21c31', '0085', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Helmah', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('fdf8af78-5cc0-4c36-9a0b-d2c9aef9aed7', '0003', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Daniel Mardianto', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'rsm', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33'),
('ff269d4f-7734-4bae-adcd-5c389dda779a', '0097', '$2b$12$tNvkG6QgmYB6AExbXHJGVOg1HJt4u6FoCJZfwxdHZObGSHQwJJJ9q', 'Reza Pungga Pratama', 'PT SOLAS LANGGENG SEJAHTERA', NULL, 'active', 'mr', 'default.png', 'info@solas.id', NULL, NULL, NULL, '2025-05-05 10:10:33', '2025-05-05 10:10:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_details`
--

CREATE TABLE `user_details` (
  `id` varchar(36) NOT NULL,
  `wilayah` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `user_details`
--

INSERT INTO `user_details` (`id`, `wilayah`, `code`) VALUES
('2cd12ee5-295b-11f0-bda6-bc2411c0ee13', 'SULSEL 1', 'SLS1.A'),
('2cd13366-295b-11f0-bda6-bc2411c0ee13', 'SULSEL 1', 'SLS1.B'),
('2cd13475-295b-11f0-bda6-bc2411c0ee13', 'SULSEL 1', 'SLS1.C'),
('2cd134c5-295b-11f0-bda6-bc2411c0ee13', 'SULSEL 2', 'SLS2.A'),
('2cd134ed-295b-11f0-bda6-bc2411c0ee13', 'SULSEL 2', 'SLS2.B'),
('2cd1350c-295b-11f0-bda6-bc2411c0ee13', 'SULSEL 2', 'SLS2.C'),
('2cd13529-295b-11f0-bda6-bc2411c0ee13', 'Sulsel 3', 'SLS3.A'),
('2cd13543-295b-11f0-bda6-bc2411c0ee13', 'Sulsel 3', 'SLS3.B'),
('2cd13564-295b-11f0-bda6-bc2411c0ee13', 'Sulsel 3', 'SLS3.C'),
('2cd1357e-295b-11f0-bda6-bc2411c0ee13', 'SULTRA', 'SLT1.A'),
('2cd1359a-295b-11f0-bda6-bc2411c0ee13', 'SULTRA', 'SLT1.B'),
('2cd135b4-295b-11f0-bda6-bc2411c0ee13', 'SULTRA', 'SLT1.C'),
('2cd135cf-295b-11f0-bda6-bc2411c0ee13', 'MALUKU', 'MLK1.A'),
('2cd135e8-295b-11f0-bda6-bc2411c0ee13', 'MALUKU', 'MLK1.B'),
('2cd13601-295b-11f0-bda6-bc2411c0ee13', 'MALUKU', 'MLK1.C'),
('2cd1361a-295b-11f0-bda6-bc2411c0ee13', 'SULUT', 'SLU1.A'),
('2cd13635-295b-11f0-bda6-bc2411c0ee13', 'SULUT', 'SLU1.B'),
('2cd13653-295b-11f0-bda6-bc2411c0ee13', 'SULUT', 'SLU1.C'),
('2cd1366e-295b-11f0-bda6-bc2411c0ee13', 'GORONTALO', 'GTL1.A'),
('2cd13693-295b-11f0-bda6-bc2411c0ee13', 'GORONTALO', 'GTL1.B'),
('2cd136b3-295b-11f0-bda6-bc2411c0ee13', 'GORONTALO', 'GTL1.C'),
('2cd136cc-295b-11f0-bda6-bc2411c0ee13', 'Sulteng', 'Palu 1'),
('2cd136e5-295b-11f0-bda6-bc2411c0ee13', 'Sulteng', 'Palu 2'),
('2cd13700-295b-11f0-bda6-bc2411c0ee13', 'Sulteng', 'Palu 3'),
('2cd13719-295b-11f0-bda6-bc2411c0ee13', 'JATIM 5', 'JTM5.A'),
('2cd13733-295b-11f0-bda6-bc2411c0ee13', 'JATIM 5', 'JTM5.B'),
('2cd1374c-295b-11f0-bda6-bc2411c0ee13', 'JATIM 5', 'JTM5.C'),
('2cd13767-295b-11f0-bda6-bc2411c0ee13', 'JATIM 6', 'JTM6.A'),
('2cd13781-295b-11f0-bda6-bc2411c0ee13', 'JATIM 6', 'JTM6.B'),
('2cd1379a-295b-11f0-bda6-bc2411c0ee13', 'JATIM 6', 'JTM6.C'),
('2cd137b3-295b-11f0-bda6-bc2411c0ee13', 'JATIM 7', 'JTM7.A'),
('2cd137cb-295b-11f0-bda6-bc2411c0ee13', 'JATIM 7', 'JTM7.B'),
('2cd137e4-295b-11f0-bda6-bc2411c0ee13', 'JATIM 7', 'JTM7.C'),
('2cd137fd-295b-11f0-bda6-bc2411c0ee13', 'BALI', 'BLI1.A'),
('2cd13819-295b-11f0-bda6-bc2411c0ee13', 'BALI', 'BLI1.B'),
('2cd13831-295b-11f0-bda6-bc2411c0ee13', 'NUSRA 1', 'NSR1.A'),
('2cd1384b-295b-11f0-bda6-bc2411c0ee13', 'NUSRA 1', 'NSR1.B'),
('2cd13863-295b-11f0-bda6-bc2411c0ee13', 'NUSRA 1', 'NSR1.C'),
('2cd1388a-295b-11f0-bda6-bc2411c0ee13', 'NUSRA 1', 'NSR1.D'),
('2cd138a5-295b-11f0-bda6-bc2411c0ee13', 'NUSRA 2', 'NSR2.A'),
('2cd138be-295b-11f0-bda6-bc2411c0ee13', 'NUSRA 2', 'NSR2.B'),
('2cd138d8-295b-11f0-bda6-bc2411c0ee13', 'NUSRA 2', 'NSR2.C'),
('2cd138f1-295b-11f0-bda6-bc2411c0ee13', 'NUSRA 2', 'NSR2.D'),
('2cd1390a-295b-11f0-bda6-bc2411c0ee13', 'KALSEL 1', 'KLS1.A'),
('2cd13923-295b-11f0-bda6-bc2411c0ee13', 'KALSEL 1', 'KLS1.B'),
('2cd1393d-295b-11f0-bda6-bc2411c0ee13', 'KALSEL 1', 'KLS1.C'),
('2cd13956-295b-11f0-bda6-bc2411c0ee13', 'KALSEL 2', 'KLS2.A'),
('2cd1396f-295b-11f0-bda6-bc2411c0ee13', 'KALSEL 2', 'KLS2.B'),
('2cd13987-295b-11f0-bda6-bc2411c0ee13', 'KALSEL 2', 'KLS2.C'),
('2cd1399f-295b-11f0-bda6-bc2411c0ee13', 'KALSEL 3', 'KLS3.A'),
('2cd139b8-295b-11f0-bda6-bc2411c0ee13', 'KALSEL 3', 'KLS3.B'),
('2cd139d2-295b-11f0-bda6-bc2411c0ee13', 'KALSEL 3', 'KLS3.C'),
('2cd139eb-295b-11f0-bda6-bc2411c0ee13', 'KALTENG 1', 'KLT1.A'),
('2cd13a03-295b-11f0-bda6-bc2411c0ee13', 'KALTENG 1', 'KLT1.B'),
('2cd13a1c-295b-11f0-bda6-bc2411c0ee13', 'KALTENG 1', 'KLT1.C'),
('2cd13a36-295b-11f0-bda6-bc2411c0ee13', 'KALTENG 2', 'KLT2.A'),
('2cd13ae6-295b-11f0-bda6-bc2411c0ee13', 'KALTENG 2', 'KLT2.B'),
('2cd13b04-295b-11f0-bda6-bc2411c0ee13', 'KALTENG 2', 'KLT2.C'),
('2cd13b1e-295b-11f0-bda6-bc2411c0ee13', 'KALTIM', 'KLM1.A'),
('2cd13b39-295b-11f0-bda6-bc2411c0ee13', 'KALTIM', 'KLM1.B'),
('2cd13b52-295b-11f0-bda6-bc2411c0ee13', 'KALTIM', 'KLM1.C'),
('2cd13b6b-295b-11f0-bda6-bc2411c0ee13', 'KALTIM', 'KLM1.D'),
('2cd13b86-295b-11f0-bda6-bc2411c0ee13', 'JATENG 1', 'JTG1.A'),
('2cd13b9f-295b-11f0-bda6-bc2411c0ee13', 'JATENG 1', 'JTG1.B'),
('2cd13bb8-295b-11f0-bda6-bc2411c0ee13', 'JATENG 1', 'JTG1.C'),
('2cd13bd1-295b-11f0-bda6-bc2411c0ee13', 'JATENG 1', 'JTG1.D'),
('2cd13be9-295b-11f0-bda6-bc2411c0ee13', 'JATENG 2', 'JTG2.A'),
('2cd13c03-295b-11f0-bda6-bc2411c0ee13', 'JATENG 2', 'JTG2.B'),
('2cd13c1e-295b-11f0-bda6-bc2411c0ee13', 'JATENG 2', 'JTG2.C'),
('2cd13c36-295b-11f0-bda6-bc2411c0ee13', 'JATENG 2', 'JTG2.D'),
('2cd13c4f-295b-11f0-bda6-bc2411c0ee13', 'JATENG 3', 'JTG3.A'),
('2cd13c67-295b-11f0-bda6-bc2411c0ee13', 'JATENG 3', 'JTG3.B'),
('2cd13c7f-295b-11f0-bda6-bc2411c0ee13', 'JATENG 3', 'JTG3.C'),
('2cd13c97-295b-11f0-bda6-bc2411c0ee13', 'JATENG 4', 'JTG4.A'),
('2cd13cb0-295b-11f0-bda6-bc2411c0ee13', 'JATENG 4', 'JTG4.B'),
('2cd13cd4-295b-11f0-bda6-bc2411c0ee13', 'JATENG 4', 'JTG4.C'),
('2cd13cee-295b-11f0-bda6-bc2411c0ee13', 'JATENG 5', 'JTG5.A'),
('2cd13d07-295b-11f0-bda6-bc2411c0ee13', 'JATENG 5', 'JTG5.B'),
('2cd13d20-295b-11f0-bda6-bc2411c0ee13', 'JATENG 5', 'JTG5.C'),
('2cd13d39-295b-11f0-bda6-bc2411c0ee13', 'JATENG 6', 'JTG6.A'),
('2cd13d55-295b-11f0-bda6-bc2411c0ee13', 'JATENG 6', 'JTG6.B'),
('2cd13d6f-295b-11f0-bda6-bc2411c0ee13', 'JATENG 6', 'JTG6.C'),
('2cd13d87-295b-11f0-bda6-bc2411c0ee13', 'JATENG 6', 'JTG6.D'),
('2cd13d9f-295b-11f0-bda6-bc2411c0ee13', 'JABAR 1', 'JBR1.A'),
('2cd13db8-295b-11f0-bda6-bc2411c0ee13', 'JABAR 1', 'JBR1.B'),
('2cd13dd2-295b-11f0-bda6-bc2411c0ee13', 'JABAR 1', 'JBR1.C'),
('2cd13dee-295b-11f0-bda6-bc2411c0ee13', 'JABAR 1', 'JBR1.D'),
('2cd13e08-295b-11f0-bda6-bc2411c0ee13', 'JABAR 2', 'JBR2.A'),
('2cd13e20-295b-11f0-bda6-bc2411c0ee13', 'JABAR 2', 'JBR2.B'),
('2cd13e38-295b-11f0-bda6-bc2411c0ee13', 'JABAR 2', 'JBR2.C'),
('2cd13e50-295b-11f0-bda6-bc2411c0ee13', 'JABAR 2', 'JBR2.D'),
('2cd13e68-295b-11f0-bda6-bc2411c0ee13', 'JABAR 3', 'JBR3.A'),
('2cd13e82-295b-11f0-bda6-bc2411c0ee13', 'JABAR 3', 'JBR3.B'),
('2cd13e9b-295b-11f0-bda6-bc2411c0ee13', 'JABAR 3', 'JBR3.C'),
('2cd13eb3-295b-11f0-bda6-bc2411c0ee13', 'DKI 1', 'DKI1.A'),
('2cd13ecc-295b-11f0-bda6-bc2411c0ee13', 'DKI 1', 'DKI1.B'),
('2cd13ee4-295b-11f0-bda6-bc2411c0ee13', 'DKI 1', 'DKI1.C'),
('2cd13efc-295b-11f0-bda6-bc2411c0ee13', 'DKI 2', 'DKI2.A'),
('2cd13f15-295b-11f0-bda6-bc2411c0ee13', 'DKI 2', 'DKI2.B'),
('2cd13f2d-295b-11f0-bda6-bc2411c0ee13', 'DKI 2', 'DKI2.C'),
('2cd13f46-295b-11f0-bda6-bc2411c0ee13', 'DKI 3', 'DKI3.A'),
('2cd13f5e-295b-11f0-bda6-bc2411c0ee13', 'DKI 3', 'DKI3.B'),
('2cd13f77-295b-11f0-bda6-bc2411c0ee13', 'DKI 3', 'DKI3.C'),
('2cd13f8f-295b-11f0-bda6-bc2411c0ee13', 'DKI 4', 'DKI4.A'),
('2cd13fa8-295b-11f0-bda6-bc2411c0ee13', 'DKI 4', 'DKI4.B'),
('2cd13fbf-295b-11f0-bda6-bc2411c0ee13', 'DKI 4', 'DKI4.C'),
('2cd13fd8-295b-11f0-bda6-bc2411c0ee13', 'DKI 5', 'DKI5.A'),
('2cd13ff0-295b-11f0-bda6-bc2411c0ee13', 'KALBAR', 'KLB.1'),
('2cd1400a-295b-11f0-bda6-bc2411c0ee13', 'DKI 7', 'DKI 7'),
('2cd14023-295b-11f0-bda6-bc2411c0ee13', 'BANTEN 1', 'BTN1.A'),
('2cd1403c-295b-11f0-bda6-bc2411c0ee13', 'BANTEN 1', 'BTN1.B'),
('2cd14055-295b-11f0-bda6-bc2411c0ee13', 'BANTEN 1', 'BTN1.C'),
('2cd1406f-295b-11f0-bda6-bc2411c0ee13', 'BANTEN 2', ' BTN2.A'),
('2cd14088-295b-11f0-bda6-bc2411c0ee13', 'BANTEN 2', ' BTN2.A'),
('2cd140a1-295b-11f0-bda6-bc2411c0ee13', 'LAMPUNG', 'LPG1.A'),
('2cd140b9-295b-11f0-bda6-bc2411c0ee13', 'LAMPUNG', 'LPG1.B'),
('2cd140d2-295b-11f0-bda6-bc2411c0ee13', 'LAMPUNG', 'LPG1.C'),
('2cd140ec-295b-11f0-bda6-bc2411c0ee13', 'LAMPUNG', 'LPG1.D'),
('2cd14105-295b-11f0-bda6-bc2411c0ee13', 'PALEMBANG', 'Palembang'),
('2cd1411f-295b-11f0-bda6-bc2411c0ee13', 'PALEMBANG', 'Palembang'),
('2cd14139-295b-11f0-bda6-bc2411c0ee13', 'PALEMBANG', 'Palembang'),
('2cd14152-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 1', 'SUM1.A'),
('2cd1416b-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 1', 'SUM1.B'),
('2cd14183-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 1', 'SUM1.C'),
('2cd1419c-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 1', 'SUM1.D'),
('2cd141b4-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 1', 'SUM1.E'),
('2cd141cc-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 2', 'SUM2.A'),
('2cd141e5-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 2', 'SUM2.B'),
('2cd141fe-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 2', 'SUM2.C'),
('2cd14217-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 2', 'SUM2.D'),
('2cd14230-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 3', 'SUM3.A'),
('2cd14248-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 3', 'SUM3.B'),
('2cd14261-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 3', 'SUM3.C'),
('2cd1427b-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 3', 'SUM3.D'),
('2cd14294-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 4', 'SUM4.A'),
('2cd142ac-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 4', 'SUM4.B'),
('2cd142c5-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 4', 'SUM4.C'),
('2cd142df-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 4', 'SUM5.A'),
('2cd142f7-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 5', 'SUM5.B'),
('2cd1430f-295b-11f0-bda6-bc2411c0ee13', 'SUMUT 5', 'SUM5.C'),
('2cd14327-295b-11f0-bda6-bc2411c0ee13', 'ACEH', 'ACH1.A'),
('2cd1433f-295b-11f0-bda6-bc2411c0ee13', 'ACEH', 'ACH1.B'),
('2cd14358-295b-11f0-bda6-bc2411c0ee13', 'ACEH', 'ACH1.C'),
('2cd14370-295b-11f0-bda6-bc2411c0ee13', 'ACEH', 'ACH1.D'),
('2cd14389-295b-11f0-bda6-bc2411c0ee13', 'ACEH', 'ACH1.E'),
('2cd143a1-295b-11f0-bda6-bc2411c0ee13', 'ACEH', 'ACH1.F'),
('2cd143ba-295b-11f0-bda6-bc2411c0ee13', 'PEKANBARU', 'PKB1.A'),
('2cd143d3-295b-11f0-bda6-bc2411c0ee13', 'PEKANBARU', 'PKB1B'),
('2cd143ec-295b-11f0-bda6-bc2411c0ee13', 'PEKANBARU', 'PKB1.C'),
('2cd14454-295b-11f0-bda6-bc2411c0ee13', 'JAMBI', 'JBI 1 A'),
('2cd14475-295b-11f0-bda6-bc2411c0ee13', 'JAMBI', 'JBI 1 B'),
('2cd1448e-295b-11f0-bda6-bc2411c0ee13', 'JAMBI', 'JBI 1 C'),
('2cd144a9-295b-11f0-bda6-bc2411c0ee13', 'NASIONAL', 'nan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `whatsapps`
--

CREATE TABLE `whatsapps` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `whatsapps`
--

INSERT INTO `whatsapps` (`id`, `nama`, `session`, `no_hp`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9ed92a53-0232-4b32-a4d3-3492b439fea8', 'Admin Pusat', 'ey72€£\\*y!w2113hhag', '85711115140', '2025-05-10 15:07:16', '2025-05-07 01:19:11', '2025-05-10 15:07:16'),
('9ee0f1b6-0ae7-4ca2-9793-4bde5294feeb', 'Wahyu', 'd6^6723Ghjshd', '85711115140', NULL, '2025-05-10 15:07:31', '2025-05-10 15:07:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wilayahs`
--

CREATE TABLE `wilayahs` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wilayah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `wilayahs`
--

INSERT INTO `wilayahs` (`id`, `user_id`, `wilayah`, `code`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'cb76b01a-96c6-4ea3-829b-2e27848c24c7', 'SULSEL 2', 'SLS2', NULL, '2025-05-05 11:43:34', '2025-05-05 11:43:34'),
('9ed60d4a-3c78-4c84-b5ff-c0d2482af4cd', '9ed5f165-fd0d-406c-bfba-e12577712e51', 'SUMUT 5', 'SUM5', NULL, '2025-05-05 12:10:31', '2025-05-05 12:10:31'),
('9ed6c08f-b189-434a-9839-edb9c14f5b23', 'cb76b01a-96c6-4ea3-829b-2e27848c24c7', 'Vacant', 'DKI5', '2025-05-05 20:32:46', '2025-05-05 20:31:48', '2025-05-05 20:32:46'),
('9ed6c158-9f21-41ed-b03c-0b3748f760b6', 'cb76b01a-96c6-4ea3-829b-2e27848c24c7', 'DKI 5', 'DKI5', NULL, '2025-05-05 20:34:00', '2025-05-05 20:34:00'),
('9ed6dc0c-fe9b-443a-9c92-19bcf08a2f3b', '9ed6d5ad-9167-4727-b2de-bcb9fdec8e17', 'Sumatera Barat', 'PDG1', NULL, '2025-05-05 21:48:40', '2025-05-05 21:48:40'),
('9ed9b3a1-e6f0-4d08-bbdc-37dcb61e2d0f', 'cb76b01a-96c6-4ea3-829b-2e27848c24c7', 'Vacant', 'vacant', NULL, '2025-05-07 07:43:08', '2025-05-07 07:43:08'),
('9eddbbb6-af52-476c-bf63-b4a6fa45b448', '1fa11c51-f704-4be4-8a1a-7ee9dbc46306', 'tes', 'tes', '2025-05-09 07:50:45', '2025-05-09 07:49:02', '2025-05-09 07:50:45'),
('9eddbd4f-5431-42f9-ac82-ddc5120938f3', '9eddbd31-8c4f-4347-9887-d541c502a1db', 'BANGKA BELITUNG', 'BBL', NULL, '2025-05-09 07:53:30', '2025-05-09 07:53:30'),
('9ee1019d-0681-4db0-8830-f51b9f2954c1', '9ee1017f-7364-4ae3-8c57-14dd2bb25e91', 'RENGASDENGKLOK', 'RDK', '2025-05-10 16:40:25', '2025-05-10 15:51:58', '2025-05-10 16:40:25'),
('9ee11337-12c3-4760-b245-cd2765c09aa4', '9ee1017f-7364-4ae3-8c57-14dd2bb25e91', 'RENGASDENGKLOK', 'RDK', NULL, '2025-05-10 16:41:12', '2025-05-10 16:41:12'),
('c415a158-2969-11f0-bda6-bc2411c0ee13', '5e184039-e25d-49e8-b344-f6a4d1c1bf3c', 'SULSEL 1', 'SLS1', NULL, NULL, NULL),
('c415a452-2969-11f0-bda6-bc2411c0ee13', 'f5a15f54-423f-4404-983b-e64aa760211e', 'Sulsel 3', 'SLS3', NULL, NULL, NULL),
('c415a561-2969-11f0-bda6-bc2411c0ee13', 'c4b90b9b-f4f1-4674-9692-48dd2c467b84', 'SULTRA', 'SLT1', NULL, NULL, NULL),
('c415a5fa-2969-11f0-bda6-bc2411c0ee13', '8b2a3fb6-fa12-4130-8eda-62f572e90de4', 'MALUKU', 'MLK1', NULL, NULL, NULL),
('c415a628-2969-11f0-bda6-bc2411c0ee13', '939cd1e3-1fcf-43ea-b117-bd32c7f826c4', 'SULUT', 'SLU1', NULL, NULL, NULL),
('c415a657-2969-11f0-bda6-bc2411c0ee13', '9e5077b2-ec34-44de-a963-5f5b586d3008', 'GORONTALO', 'GTL1', NULL, NULL, NULL),
('c415a685-2969-11f0-bda6-bc2411c0ee13', '0e9da98c-b11d-4038-a45b-2945f692a805', 'Sulteng', 'Palu 1', NULL, NULL, NULL),
('c415a6ae-2969-11f0-bda6-bc2411c0ee13', '01a18c50-203b-410e-ab18-a1f02d799045', 'JATIM 5', 'JTM5', NULL, NULL, NULL),
('c415a6dd-2969-11f0-bda6-bc2411c0ee13', 'f7fa6f1c-40b1-49f6-be6e-6ac3738437e0', 'JATIM 6', 'JTM6', NULL, NULL, NULL),
('c415a706-2969-11f0-bda6-bc2411c0ee13', '4c4c3772-3a4c-4531-b990-4ed9b4116685', 'JATIM 7', 'JTM7', NULL, NULL, NULL),
('c415a730-2969-11f0-bda6-bc2411c0ee13', '7f68146c-0971-4a44-a44b-aa2a5bf2829a', 'BALI', 'BLI1', NULL, NULL, NULL),
('c415a75a-2969-11f0-bda6-bc2411c0ee13', '7d296490-fcf2-4e36-8b12-e282fc6d0ba8', 'NUSRA 1', 'NSR1', NULL, NULL, NULL),
('c415a796-2969-11f0-bda6-bc2411c0ee13', '6608e417-26b5-477a-bb8c-84ccb0776d81', 'NUSRA 2', 'NSR2', NULL, NULL, NULL),
('c415a7bf-2969-11f0-bda6-bc2411c0ee13', 'e931fda8-c4cf-4df2-bda3-84b70492d9ed', 'KALSEL 1', 'KLS1', NULL, NULL, NULL),
('c415a7e8-2969-11f0-bda6-bc2411c0ee13', '9d4e23aa-1c54-41a3-b3ba-bef9a5715690', 'KALSEL 2', 'KLS2', NULL, NULL, NULL),
('c415a810-2969-11f0-bda6-bc2411c0ee13', 'addadfad-ce3e-4c3f-8a68-20454bcfbdfb', 'KALSEL 3', 'KLS3', NULL, NULL, NULL),
('c415a83a-2969-11f0-bda6-bc2411c0ee13', 'eab7109e-2ead-41a3-91a1-0b880fda3ca1', 'KALTENG 1', 'KLT1', NULL, NULL, NULL),
('c415a862-2969-11f0-bda6-bc2411c0ee13', 'f1fc38bf-3f2c-4044-bfb0-567be6857fdd', 'KALTENG 2', 'KLT2', NULL, NULL, NULL),
('c415a88b-2969-11f0-bda6-bc2411c0ee13', '7ecae3b5-dc01-4179-8f7a-8e41be857912', 'KALTIM', 'KLM1', NULL, NULL, NULL),
('c415a8b8-2969-11f0-bda6-bc2411c0ee13', '16861de3-f6f4-4b2e-ab0c-dbe0963b1b8c', 'JATENG 1', 'JTG1', NULL, NULL, NULL),
('c415a8df-2969-11f0-bda6-bc2411c0ee13', 'd4a109e5-fe52-4ba1-89ec-e186228a26a3', 'JATENG 2', 'JTG2', NULL, NULL, NULL),
('c415a906-2969-11f0-bda6-bc2411c0ee13', '571ad588-9d63-45cd-8ebf-95fe54f838cd', 'JATENG 3', 'JTG3', NULL, NULL, NULL),
('c415a92a-2969-11f0-bda6-bc2411c0ee13', 'ca2e6119-2fa4-463c-a1d1-e116ba2a353a', 'JATENG 4', 'JTG4', NULL, NULL, NULL),
('c415a95f-2969-11f0-bda6-bc2411c0ee13', '395b0a87-62ec-4e8c-8d4a-6ae78ad24857', 'JATENG 5', 'JTG5', NULL, NULL, NULL),
('c415a986-2969-11f0-bda6-bc2411c0ee13', 'a2f14314-ec61-4220-8f9d-a3188f5196d4', 'JATENG 6', 'JTG6', NULL, NULL, NULL),
('c415a9aa-2969-11f0-bda6-bc2411c0ee13', 'a27a1ca2-2aaa-4a3e-be5f-15063de17851', 'JABAR 1', 'JBR1', NULL, NULL, NULL),
('c415a9cf-2969-11f0-bda6-bc2411c0ee13', '0ee705e9-6522-4883-a8ee-54e7e0c45e25', 'JABAR 2', 'JBR2', NULL, NULL, NULL),
('c415a9f4-2969-11f0-bda6-bc2411c0ee13', 'eab7109e-2ead-41a3-91a1-0b880fda3ca1', 'JABAR 3', 'JBR3', NULL, NULL, NULL),
('c415aa1b-2969-11f0-bda6-bc2411c0ee13', '31683a1c-7e64-4a05-807e-a12b59abdc45', 'DKI 1', 'DKI1', NULL, NULL, NULL),
('c415aa41-2969-11f0-bda6-bc2411c0ee13', '634251fe-6982-410f-bff6-305acb9c7287', 'DKI 2', 'DKI2', NULL, NULL, NULL),
('c415aa66-2969-11f0-bda6-bc2411c0ee13', 'd2df89ca-eeb8-43e7-86a8-9283411f6dfd', 'DKI 3', 'DKI3', NULL, NULL, NULL),
('c415aa8b-2969-11f0-bda6-bc2411c0ee13', 'ccfbffce-dd3c-45cf-ba52-3d2d2ea09f47', 'DKI 4', 'DKI4', NULL, NULL, NULL),
('c415aaae-2969-11f0-bda6-bc2411c0ee13', '4b9e7867-c050-4d78-9bd6-2f53d80d8b67', 'DKI 5', 'DKI5', '2025-05-05 20:33:38', NULL, '2025-05-05 20:33:38'),
('c415aad5-2969-11f0-bda6-bc2411c0ee13', '4e2234e9-fac9-44e7-bb7b-3236e28e5bf8', 'KALBAR', 'KLB.1', NULL, NULL, NULL),
('c415aafc-2969-11f0-bda6-bc2411c0ee13', '1bff6b3d-d74c-452f-a8bc-29272d0d8408', 'DKI 7', 'DKI 7', NULL, NULL, NULL),
('c415ab24-2969-11f0-bda6-bc2411c0ee13', 'a91d6401-3be6-4ea8-bf58-96ff480b7718', 'BANTEN 1', 'BTN1', NULL, NULL, NULL),
('c415ab4a-2969-11f0-bda6-bc2411c0ee13', 'd84e3610-3c9f-4779-a72a-e45e68268f02', 'BANTEN 2', ' BTN2', NULL, NULL, NULL),
('c415ab6f-2969-11f0-bda6-bc2411c0ee13', 'e6ff1c64-955a-4f33-8cc9-aea47e06ffec', 'LAMPUNG', 'LPG1', NULL, NULL, NULL),
('c415ab94-2969-11f0-bda6-bc2411c0ee13', 'a6d88de3-dc79-4d73-bdd2-9fb20a10f8fd', 'PALEMBANG', 'Palembang', NULL, NULL, NULL),
('c415abbb-2969-11f0-bda6-bc2411c0ee13', 'a6d88de3-dc79-4d73-bdd2-9fb20a10f8fd', 'SUMUT 4', 'SUM4', NULL, NULL, NULL),
('c415abe0-2969-11f0-bda6-bc2411c0ee13', '9ed5f0f5-9ee9-4935-b70c-dc08fca58e76', 'SUMUT 1', 'SUM1', NULL, NULL, NULL),
('c415ac05-2969-11f0-bda6-bc2411c0ee13', '9ed5f12d-eba0-4d6e-a2d2-01624ba5659c', 'SUMUT 2', 'SUM2', NULL, NULL, NULL),
('c415ac29-2969-11f0-bda6-bc2411c0ee13', '9ed5f26a-34ae-4ae7-bcfa-27cfff1aa281', 'SUMUT 3', 'SUM3', NULL, NULL, NULL),
('c415ac4d-2969-11f0-bda6-bc2411c0ee13', '9ed5f165-fd0d-406c-bfba-e12577712e51', 'SUMUT 4', 'SUM5', '2025-05-05 21:40:46', NULL, '2025-05-05 21:40:46'),
('c415ac74-2969-11f0-bda6-bc2411c0ee13', '9ed5f19d-7baf-421e-8f55-c36347e00523', 'ACEH', 'ACH1', NULL, NULL, NULL),
('c415ac99-2969-11f0-bda6-bc2411c0ee13', '9ed5f1ee-096f-4811-9078-e85fd9e78e15', 'PEKANBARU', 'PKB1', NULL, NULL, NULL),
('c415acca-2969-11f0-bda6-bc2411c0ee13', '9ed5f223-7149-4bc0-bd6b-e7fcf6d9d834', 'JAMBI', 'JBI 1 A', NULL, NULL, NULL),
('c415acee-2969-11f0-bda6-bc2411c0ee13', 'nan', 'NASIONAL', 'nan', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wilayah_details`
--

CREATE TABLE `wilayah_details` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wilayah_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_mr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `wilayah_details`
--

INSERT INTO `wilayah_details` (`id`, `wilayah_id`, `user_id`, `area_id`, `kode_mr`, `deleted_at`, `created_at`, `updated_at`) VALUES
('9ed61b39-ef51-459b-b7b4-6d69716580fd', 'c415a158-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed5a9bc-0cca-4918-865f-1b8bb3640371', 'SLS1.A', NULL, '2025-05-05 12:49:29', '2025-05-05 12:49:29'),
('9ed61b39-f242-40ae-9ee3-4dfc9038fb06', 'c415a158-2969-11f0-bda6-bc2411c0ee13', '29f8ed76-7966-4990-9915-17152282b315', '9ed5a9c5-f272-449d-986e-ac8ba9204ef7', 'SLS1.B', NULL, '2025-05-05 12:49:29', '2025-05-05 12:49:29'),
('9ed61b3a-08b2-4d5e-8330-51f1a658f9c8', 'c415a158-2969-11f0-bda6-bc2411c0ee13', '3ce182d8-a404-42c1-bae7-ba81b3cdb57a', '13373538-294c-11f0-bda6-bc2411c0ee13', 'SLS1.C', NULL, '2025-05-05 12:49:29', '2025-05-05 12:49:29'),
('9ed61b82-0d32-475e-8de8-ec8952a72819', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'f0eb8971-6d98-4acb-b515-8da44575eb31', '135ef723-294c-11f0-bda6-bc2411c0ee13', 'SLS2.A', NULL, '2025-05-05 12:50:16', '2025-05-05 12:50:16'),
('9ed61b82-105c-4c5f-87a1-1504445a1f5a', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', 'f4096295-5ccc-46b3-b541-42b04a229400', '1378f98c-294c-11f0-bda6-bc2411c0ee13', 'SLS2.B', NULL, '2025-05-05 12:50:16', '2025-05-05 12:50:16'),
('9ed61b9a-a126-40fb-b3e4-09110b64b7ba', '9ed603a5-fb0d-4d60-b916-0ab15a883fdf', '8b8a3c27-25bf-45d6-bfb8-4df149ce300c', '1353c5ec-294c-11f0-bda6-bc2411c0ee13', 'SLS2.C', NULL, '2025-05-05 12:50:33', '2025-05-05 12:50:33'),
('9ed61cc7-a527-44f5-a234-758fba36e004', 'c415a452-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed61c86-d9ec-4308-bbcc-a162b9620a12', 'SLS3.A', NULL, '2025-05-05 12:53:50', '2025-05-05 12:53:50'),
('9ed61cdc-d6c3-4406-ab98-c4fbf4565892', 'c415a452-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed61c8f-2d75-4cec-99bd-668a890fdd95', 'SLS3.B', NULL, '2025-05-05 12:54:04', '2025-05-05 12:54:04'),
('9ed61d2a-963b-4a2d-b19c-cb03178791f5', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'cd19f2cf-d972-46c8-ae5e-77c0dd5b9d32', '139490bc-294c-11f0-bda6-bc2411c0ee13', 'SLT1.A', NULL, '2025-05-05 12:54:55', '2025-05-05 12:54:55'),
('9ed61e2c-6d9e-4962-a95f-594e50ad0422', 'c415a561-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed61d3b-344f-42f5-b712-0a5e94706779', 'SLT1.B', NULL, '2025-05-05 12:57:44', '2025-05-05 12:57:44'),
('9ed61e3f-d556-411f-b1fb-8839ee8d0fc1', 'c415a561-2969-11f0-bda6-bc2411c0ee13', 'd1901e58-0a02-4ec9-99fc-dfe25c9e46bd', '138b60a2-294c-11f0-bda6-bc2411c0ee13', 'SLT1.C', NULL, '2025-05-05 12:57:56', '2025-05-05 12:57:56'),
('9ed61e81-bddf-4cd1-b0e0-0107fcd0341c', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', '1f32e6d1-2db4-49b2-9c72-0a80a018e7b8', '13b4bb62-294c-11f0-bda6-bc2411c0ee13', 'MLK1.A', NULL, '2025-05-05 12:58:40', '2025-05-05 12:58:40'),
('9ed61e81-c167-41b5-a308-cdd4e71873a8', 'c415a5fa-2969-11f0-bda6-bc2411c0ee13', '1af2daa2-d3c6-4126-b626-e6715a511fa2', '13bdef49-294c-11f0-bda6-bc2411c0ee13', 'MLK1.B', NULL, '2025-05-05 12:58:40', '2025-05-05 12:58:40'),
('9ed61ecd-ba37-4437-b1f7-28e57206bce0', 'c415a628-2969-11f0-bda6-bc2411c0ee13', 'baeaedf4-797b-45e9-b680-9c939dcdc5a8', '13d05742-294c-11f0-bda6-bc2411c0ee13', 'SLU1.A', NULL, '2025-05-05 12:59:29', '2025-05-05 12:59:29'),
('9ed61f1a-6bc4-4d53-8cb9-8ce82d5bfb1a', 'c415a628-2969-11f0-bda6-bc2411c0ee13', '48a1d223-3a7c-483d-bcbc-5c1a014dc25a', '9ed61ee2-abee-4e1a-958a-c84e43cb5e26', 'SLU1.B', NULL, '2025-05-05 13:00:20', '2025-05-05 13:00:20'),
('9ed61f1a-7268-4aef-bc3c-e015f13995c3', 'c415a628-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed61eea-5aff-4502-9f12-b8063a5a3e41', 'SLU1.C', NULL, '2025-05-05 13:00:20', '2025-05-05 13:00:20'),
('9ed61f95-2137-437e-801f-2f96eec47534', 'c415a657-2969-11f0-bda6-bc2411c0ee13', 'c0eaa26f-7249-4008-8de7-f54ba210fd20', '13ee6ffe-294c-11f0-bda6-bc2411c0ee13', 'GTL1.A', NULL, '2025-05-05 13:01:40', '2025-05-05 13:01:40'),
('9ed61f95-2420-47f1-8c8c-2300cd86c106', 'c415a657-2969-11f0-bda6-bc2411c0ee13', '9ef09cd6-892a-43cb-a2f5-f5e613543e7d', '13f9b7cf-294c-11f0-bda6-bc2411c0ee13', 'GTL1.B', NULL, '2025-05-05 13:01:40', '2025-05-05 13:01:40'),
('9ed6202f-ed4b-4ba9-a78e-9fa7c168ae0b', 'c415a685-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed61fdf-e646-4f3b-aacd-092af6d2add9', 'Palu 1.A', NULL, '2025-05-05 13:03:22', '2025-05-05 13:03:22'),
('9ed6203f-1f14-40a9-805e-7b6815c2630a', 'c415a685-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed62011-1be0-42ee-bfea-8cecc9fcdb63', 'Palu 1.B', NULL, '2025-05-05 13:03:31', '2025-05-05 13:03:31'),
('9ed62050-29f3-4d21-a52c-345fa2913c0f', 'c415a685-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed6201a-35fb-49e6-9f01-891be41d09a4', 'Palu 1.C', NULL, '2025-05-05 13:03:43', '2025-05-05 13:03:43'),
('9ed637c4-2a60-40f1-8cb0-e43a8c0cc937', 'c415a6ae-2969-11f0-bda6-bc2411c0ee13', '48c0323b-9a34-405a-acff-cc94b9b5701e', '14650bb4-294c-11f0-bda6-bc2411c0ee13', 'JTM5.A', NULL, '2025-05-05 14:09:17', '2025-05-05 14:09:17'),
('9ed637c4-2d44-49e7-aa27-245250a9cf3b', 'c415a6ae-2969-11f0-bda6-bc2411c0ee13', '18c8b286-dc6c-4826-b4ca-93380951b70b', '146e3ff4-294c-11f0-bda6-bc2411c0ee13', 'JTM5.B', NULL, '2025-05-05 14:09:17', '2025-05-05 14:09:17'),
('9ed637e9-15c9-42c7-a349-5bd9288a615b', 'c415a6ae-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed637d4-6234-4eb8-9b6b-d5e3346cfc31', 'JTM5.C', NULL, '2025-05-05 14:09:42', '2025-05-05 14:09:42'),
('9ed638c6-67a9-4a55-ab44-ddc9bfae8bf2', 'c415a6dd-2969-11f0-bda6-bc2411c0ee13', 'ae8304c2-7ada-49de-8b93-1160ae69406a', '1480a37c-294c-11f0-bda6-bc2411c0ee13', 'JTM6.A', NULL, '2025-05-05 14:12:07', '2025-05-05 14:12:07'),
('9ed638c6-6aae-4985-8579-164a5c9b5344', 'c415a6dd-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed63824-cdaa-48ff-8ef7-3ec579d8b8a2', 'JTM6.B', NULL, '2025-05-05 14:12:07', '2025-05-05 14:12:07'),
('9ed638d7-95a1-4f3d-9816-b2779a30d2e3', 'c415a6dd-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed6386c-515c-4954-ba2c-365518a64205', 'JTM6.C', NULL, '2025-05-05 14:12:18', '2025-05-05 14:12:18'),
('9ed63aaa-7326-4465-b6ee-527da181d90f', 'c415a706-2969-11f0-bda6-bc2411c0ee13', 'a5e0fbe8-469c-47b8-abf5-c11a949af0af', '148fff13-294c-11f0-bda6-bc2411c0ee13', 'JTM7.A', NULL, '2025-05-05 14:17:24', '2025-05-05 14:17:24'),
('9ed63aaa-761b-4155-bc43-bffa48f43b99', 'c415a706-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed639b1-3947-461f-a4ff-c8bbfb7a4315', 'JTM7.B', NULL, '2025-05-05 14:17:24', '2025-05-05 14:17:24'),
('9ed63aaa-7711-4b0d-9669-ab6d9136faa5', 'c415a706-2969-11f0-bda6-bc2411c0ee13', '6e9a2bbf-ce8a-47a8-b757-90a919f0d109', '9ed639b9-2cf9-44ae-a961-0c32cc572c31', 'JTM7.C', NULL, '2025-05-05 14:17:24', '2025-05-05 14:17:24'),
('9ed63b27-e54d-4aaa-8a89-329839b6e3f6', 'c415a730-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed63af2-912f-41c4-9786-efe57466ec37', 'BLI1.A', NULL, '2025-05-05 14:18:46', '2025-05-05 14:18:46'),
('9ed63b49-31d6-45b9-a7d2-6ad7e2378494', 'c415a730-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed63afc-01bd-4375-b703-8cdfa5c52226', 'BLI1.B', NULL, '2025-05-05 14:19:08', '2025-05-05 14:19:08'),
('9ed63c55-5ece-4f76-b741-13b65d07ac14', 'c415a75a-2969-11f0-bda6-bc2411c0ee13', '6f2f1abd-ee07-44dc-8fbf-f991db81c313', '14aea848-294c-11f0-bda6-bc2411c0ee13', 'NSR1.A', NULL, '2025-05-05 14:22:04', '2025-05-05 14:22:04'),
('9ed63c7e-52c4-4e91-ad5f-149f6a0ad5b9', 'c415a75a-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed63c4f-03ca-46a2-a414-3596a490be61', 'NSR1.B', NULL, '2025-05-05 14:22:31', '2025-05-05 14:22:31'),
('9ed63c7e-59c7-4969-8bdf-dbe54ee84a1f', 'c415a75a-2969-11f0-bda6-bc2411c0ee13', '2e092a9d-504a-48f6-b166-575e3fa0e9ad', '14b6560d-294c-11f0-bda6-bc2411c0ee13', 'NSR1.C', NULL, '2025-05-05 14:22:31', '2025-05-05 14:22:31'),
('9ed63c7e-5b6c-4d31-91a5-f5d1cab076ba', 'c415a75a-2969-11f0-bda6-bc2411c0ee13', '7c27dee7-37de-42c9-9266-b26fd09b46d0', '14be01e7-294c-11f0-bda6-bc2411c0ee13', 'NSR1.D', NULL, '2025-05-05 14:22:31', '2025-05-05 14:22:31'),
('9ed63d27-e5bf-404a-a0d1-a2e86725b612', 'c415a796-2969-11f0-bda6-bc2411c0ee13', 'f26b625e-3d3f-448f-8c65-c2526e2fe87e', '14cedf9e-294c-11f0-bda6-bc2411c0ee13', 'NSR2.A', NULL, '2025-05-05 14:24:22', '2025-05-05 14:24:22'),
('9ed63d27-e8d2-4786-a66c-7ec0cb448b50', 'c415a796-2969-11f0-bda6-bc2411c0ee13', '3d52c62c-ab56-4673-a987-21e11a99886e', '14d68acb-294c-11f0-bda6-bc2411c0ee13', 'NSR2.B', NULL, '2025-05-05 14:24:22', '2025-05-05 14:24:22'),
('9ed63d27-e9cc-4ac1-b2b4-0fec3aebd46c', 'c415a796-2969-11f0-bda6-bc2411c0ee13', 'dd10138f-55bd-4a50-9a8e-49d5c5f291c5', '14de37bc-294c-11f0-bda6-bc2411c0ee13', 'NSR2.C', NULL, '2025-05-05 14:24:22', '2025-05-05 14:24:22'),
('9ed63d27-ead7-4a03-9836-807601127e53', 'c415a796-2969-11f0-bda6-bc2411c0ee13', '6ad350b4-31ba-4b18-a59d-3bda92305b28', '14e5e2ca-294c-11f0-bda6-bc2411c0ee13', 'NSR2.D', NULL, '2025-05-05 14:24:22', '2025-05-05 14:24:22'),
('9ed63dd6-f88e-4b99-bd97-bfc999833cf6', 'c415a7bf-2969-11f0-bda6-bc2411c0ee13', '1a6133ba-16a2-4d15-83cb-247ef71dc6b6', '1507a20e-294c-11f0-bda6-bc2411c0ee13', 'KLS1.A', NULL, '2025-05-05 14:26:16', '2025-05-05 14:26:16'),
('9ed63dd6-fb87-4c99-8f5a-1a404bee3802', 'c415a7bf-2969-11f0-bda6-bc2411c0ee13', '43c12651-a1c7-434b-ab79-d770ae3c572e', '1510d1af-294c-11f0-bda6-bc2411c0ee13', 'KLS1.B', NULL, '2025-05-05 14:26:16', '2025-05-05 14:26:16'),
('9ed63dd6-fcbc-4908-a17e-a3d4233f5176', 'c415a7bf-2969-11f0-bda6-bc2411c0ee13', 'f9717b6f-ec8a-4a5e-91db-82aa82aeb797', '151a07a0-294c-11f0-bda6-bc2411c0ee13', 'KLS1.C', NULL, '2025-05-05 14:26:16', '2025-05-05 14:26:16'),
('9ed63dd7-127a-48ea-92cb-28fb6c58f6ad', 'c415a7bf-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '15328ef7-294c-11f0-bda6-bc2411c0ee13', 'KLS1.D', '2025-05-05 14:28:26', '2025-05-05 14:26:16', '2025-05-05 14:28:26'),
('9ed63f0b-968f-4cbf-8998-11b041974b97', 'c415a7e8-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '15328ef7-294c-11f0-bda6-bc2411c0ee13', 'KLS2.A', NULL, '2025-05-05 14:29:39', '2025-05-05 14:29:39'),
('9ed63f3f-6058-48c7-be35-3ef4488c8610', 'c415a7e8-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '15468c5b-294c-11f0-bda6-bc2411c0ee13', 'KLS2.B', NULL, '2025-05-05 14:30:13', '2025-05-05 14:30:13'),
('9ed6403d-3c9b-4c0e-b773-130e6b3741fb', 'c415a7e8-2969-11f0-bda6-bc2411c0ee13', '9ed6400e-a606-4362-ba14-83411f644386', '9ed63f76-37fa-4e2b-922c-50de0e8c47f3', 'KLS2.C', NULL, '2025-05-05 14:32:59', '2025-05-05 14:32:59'),
('9ed64415-5bff-447d-9718-67fe1c19fa1c', 'c415a810-2969-11f0-bda6-bc2411c0ee13', 'fde7033c-07bc-46ec-aca7-164badb21c31', '1583c8e5-294c-11f0-bda6-bc2411c0ee13', 'KLS3.A', NULL, '2025-05-05 14:43:44', '2025-05-05 14:43:44'),
('9ed64892-674e-4cbe-b58e-4947ce941fc7', 'c415a810-2969-11f0-bda6-bc2411c0ee13', '9ed64800-76d9-445a-8657-8c14d52ebacc', '9ed64836-406d-4c7e-8771-bd54392eabdd', 'KLS3.B', NULL, '2025-05-05 14:56:17', '2025-05-05 14:56:17'),
('9ed648b4-f404-46a8-b4c3-2c8900b24a4e', 'c415a810-2969-11f0-bda6-bc2411c0ee13', '9f720331-a3ae-4efd-b1ca-15ba36e89e52', '159f54a0-294c-11f0-bda6-bc2411c0ee13', 'KLS3.C', NULL, '2025-05-05 14:56:40', '2025-05-05 14:56:40'),
('9ed6495d-28f2-4148-ae8d-3849a7723612', 'c415a83a-2969-11f0-bda6-bc2411c0ee13', 'd16087c6-0308-400a-8777-01b624e3061d', '15b1bafc-294c-11f0-bda6-bc2411c0ee13', 'KLT1.A', NULL, '2025-05-05 14:58:30', '2025-05-05 14:58:30'),
('9ed64975-6f84-482b-bd53-452a07a426a2', 'c415a83a-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed64953-d402-45ec-b308-ca5fbe7dbf25', 'KLT1.B', NULL, '2025-05-05 14:58:46', '2025-05-05 14:58:46'),
('9ed64997-b1d5-4250-9bc5-6f6f137c814c', 'c415a83a-2969-11f0-bda6-bc2411c0ee13', 'aec468ba-b415-4397-acca-e91852c4dca8', '15baef9f-294c-11f0-bda6-bc2411c0ee13', 'KLT1.C', NULL, '2025-05-05 14:59:08', '2025-05-05 14:59:08'),
('9ed649c2-f506-4a22-ac18-551095722000', 'c415a862-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '15cd53ec-294c-11f0-bda6-bc2411c0ee13', 'KLT2.A', NULL, '2025-05-05 14:59:37', '2025-05-05 14:59:37'),
('9ed64a17-e240-45d1-a6da-0b2b20cd9bdb', 'c415a862-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed649ee-43d2-4642-99f1-2da61f05c0aa', 'KLT2.B', NULL, '2025-05-05 15:00:32', '2025-05-05 15:00:32'),
('9ed64a29-0df5-4594-8d0e-bab11629e6db', 'c415a862-2969-11f0-bda6-bc2411c0ee13', 'f9d82b7f-2ccd-4f2d-9b80-02e886051c32', '15d68926-294c-11f0-bda6-bc2411c0ee13', 'KLT2.C', NULL, '2025-05-05 15:00:43', '2025-05-05 15:00:43'),
('9ed64ad3-f63f-46ad-b32d-8090f6cf8e60', 'c415a88b-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed64a7c-5b75-4aa8-88cd-dc1a9436133c', 'KLM1.A', NULL, '2025-05-05 15:02:35', '2025-05-05 15:02:35'),
('9ed64ae3-b440-48df-9053-17b46a40327c', 'c415a88b-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed64aa1-ab9a-4ca8-8a6f-f217ca1db7f0', 'KLM1.B', '2025-05-05 15:03:29', '2025-05-05 15:02:46', '2025-05-05 15:03:29'),
('9ed64af8-ec9a-4859-9a43-e15623dbf4bf', 'c415a88b-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed64aab-c50c-4388-9524-263f73d51f39', 'KLM1.C', '2025-05-05 15:03:13', '2025-05-05 15:03:00', '2025-05-05 15:03:13'),
('9ed64b46-6577-4553-ae5e-c929daa06c83', 'c415a88b-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed64aa1-ab9a-4ca8-8a6f-f217ca1db7f0', 'KLM1.B', NULL, '2025-05-05 15:03:50', '2025-05-05 15:03:50'),
('9ed64b6f-fcf8-41a0-bbf8-d4573724e066', 'c415a88b-2969-11f0-bda6-bc2411c0ee13', '6ece317a-6635-4b8a-a585-e9a5182aa774', '9ed64aab-c50c-4388-9524-263f73d51f39', 'KLM1.C', NULL, '2025-05-05 15:04:18', '2025-05-05 15:04:18'),
('9ed64b6f-fff5-4624-b508-f1dc327354a0', 'c415a88b-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed64ab4-4911-428e-a5ce-c3845360bf2f', 'KLM1.D', NULL, '2025-05-05 15:04:18', '2025-05-05 15:04:18'),
('9ed6b294-86a3-4511-be2e-f6a6ecf32c25', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', '973e20f1-1361-4c77-b632-8c51866f544b', '1604875b-294c-11f0-bda6-bc2411c0ee13', 'JTG1.A', NULL, '2025-05-05 19:52:42', '2025-05-05 19:52:42'),
('9ed6b294-970e-48bc-b8e8-3f29fee0cb1b', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', '782df456-5e3c-4f3d-bdf2-b5b2cdddbc78', '1604875b-294c-11f0-bda6-bc2411c0ee13', 'JTG1.B', NULL, '2025-05-05 19:52:42', '2025-05-05 19:52:42'),
('9ed6b294-d2db-478a-aad7-672f2b805068', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', '24c687d1-bcc0-4c81-bdd4-40c4513b4754', '1604875b-294c-11f0-bda6-bc2411c0ee13', 'JTG1.C', NULL, '2025-05-05 19:52:42', '2025-05-05 19:52:42'),
('9ed6b294-d3b8-4574-a579-ea29ffeeabfd', 'c415a8b8-2969-11f0-bda6-bc2411c0ee13', '13671a3f-706b-4fb5-994f-4a608569cbbf', '1604875b-294c-11f0-bda6-bc2411c0ee13', 'JTG1.D', NULL, '2025-05-05 19:52:42', '2025-05-05 19:52:42'),
('9ed6b32b-bb65-4bee-bdfb-973f78ae9858', 'c415a8df-2969-11f0-bda6-bc2411c0ee13', '2459b7a0-8a0c-4dbd-891d-ef235a1289c6', '16328898-294c-11f0-bda6-bc2411c0ee13', 'JTG2.A', NULL, '2025-05-05 19:54:21', '2025-05-05 19:54:21'),
('9ed6b32b-be4d-4a1f-b228-6c8e3410904b', 'c415a8df-2969-11f0-bda6-bc2411c0ee13', 'bf51b396-abc3-4d4b-8c8e-7ad074f67d09', '16328898-294c-11f0-bda6-bc2411c0ee13', 'JTG2.B', NULL, '2025-05-05 19:54:21', '2025-05-05 19:54:21'),
('9ed6b32b-d91b-417f-a219-03d2426c4a50', 'c415a8df-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '16328898-294c-11f0-bda6-bc2411c0ee13', 'JTG2.C', NULL, '2025-05-05 19:54:21', '2025-05-05 19:54:21'),
('9ed6b32b-da04-435e-aec0-4e6361849dda', 'c415a8df-2969-11f0-bda6-bc2411c0ee13', 'ff269d4f-7734-4bae-adcd-5c389dda779a', '16328898-294c-11f0-bda6-bc2411c0ee13', 'JTG2.D', NULL, '2025-05-05 19:54:21', '2025-05-05 19:54:21'),
('9ed6b3a0-e705-4825-91f9-7f4f8acf3e11', 'c415a906-2969-11f0-bda6-bc2411c0ee13', '79feb234-c2f3-4ffc-9f90-23fce5937c22', '168e684e-294c-11f0-bda6-bc2411c0ee13', 'JTG3.A', NULL, '2025-05-05 19:55:38', '2025-05-05 19:55:38'),
('9ed6b3a0-ea05-4df7-8c65-008833d21c51', 'c415a906-2969-11f0-bda6-bc2411c0ee13', 'f974b99e-381f-40fd-b904-31d8819628c6', '168e684e-294c-11f0-bda6-bc2411c0ee13', 'JTG3.B', NULL, '2025-05-05 19:55:38', '2025-05-05 19:55:38'),
('9ed6b3a0-eb1b-4a1c-a170-c2ed452ed1e5', 'c415a906-2969-11f0-bda6-bc2411c0ee13', '6ad0214c-42de-4646-bd29-b377643b6030', '168e684e-294c-11f0-bda6-bc2411c0ee13', 'JTG3.C', NULL, '2025-05-05 19:55:38', '2025-05-05 19:55:38'),
('9ed6b400-5ccf-4f0d-83b9-da3020991b2d', 'c415a92a-2969-11f0-bda6-bc2411c0ee13', 'b039175a-9e65-41b1-a81e-03e87effb6a8', '16bada70-294c-11f0-bda6-bc2411c0ee13', 'JTG4.A', NULL, '2025-05-05 19:56:41', '2025-05-05 19:56:41'),
('9ed6b400-5fb8-46d7-b6f2-764132a95bf7', 'c415a92a-2969-11f0-bda6-bc2411c0ee13', '6e0092fe-a9d0-419a-8c75-f9c7c9fb4695', '16bada70-294c-11f0-bda6-bc2411c0ee13', 'JTG4.B', NULL, '2025-05-05 19:56:41', '2025-05-05 19:56:41'),
('9ed6b400-6096-482b-a062-1bb17f873443', 'c415a92a-2969-11f0-bda6-bc2411c0ee13', '0c91b69a-2520-4d59-9743-2879d0c24672', '16bada70-294c-11f0-bda6-bc2411c0ee13', 'JTG4.C', NULL, '2025-05-05 19:56:41', '2025-05-05 19:56:41'),
('9ed6b48d-4dda-4d37-af69-c891c4de3a7b', 'c415a95f-2969-11f0-bda6-bc2411c0ee13', '8e878e35-3ba9-466f-90a5-413ac898e6b7', '16dfa414-294c-11f0-bda6-bc2411c0ee13', 'JTG5.A', NULL, '2025-05-05 19:58:13', '2025-05-05 19:58:13'),
('9ed6b48d-55d1-4755-a1ca-91ec3d72819b', 'c415a95f-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '16dfa414-294c-11f0-bda6-bc2411c0ee13', 'JTG5.B', NULL, '2025-05-05 19:58:13', '2025-05-05 19:58:13'),
('9ed6b4e1-3bc8-4366-9648-7e3580fb75d5', 'c415a95f-2969-11f0-bda6-bc2411c0ee13', '9ed6b4b8-9a13-4041-a114-8505d08f9822', '16dfa414-294c-11f0-bda6-bc2411c0ee13', 'JTG5.C', NULL, '2025-05-05 19:59:08', '2025-05-05 19:59:08'),
('9ed6b5e8-2679-4698-8fc7-17dbe1a021e0', 'c415a986-2969-11f0-bda6-bc2411c0ee13', 'cd990395-2147-4fd0-817d-9cf87be53f0e', '16fe4e5e-294c-11f0-bda6-bc2411c0ee13', 'JTG6.A', NULL, '2025-05-05 20:02:00', '2025-05-05 20:02:00'),
('9ed6b5e8-29e4-4e37-a0ec-da7a473e0930', 'c415a986-2969-11f0-bda6-bc2411c0ee13', '786ab4ac-b000-434e-aed6-90eaa762fc70', '16fe4e5e-294c-11f0-bda6-bc2411c0ee13', 'JTG6.B', NULL, '2025-05-05 20:02:00', '2025-05-05 20:02:00'),
('9ed6b5e8-2ae6-4b52-926d-8c2bd5144387', 'c415a986-2969-11f0-bda6-bc2411c0ee13', '961c62d6-5746-439d-a72a-43d7d1ea66ed', '16fe4e5e-294c-11f0-bda6-bc2411c0ee13', 'JTG6.C', NULL, '2025-05-05 20:02:00', '2025-05-05 20:02:00'),
('9ed6b5e8-2c38-4037-ade0-62a830e8da48', 'c415a986-2969-11f0-bda6-bc2411c0ee13', '10c5b5f0-860c-49e8-8f61-a187363ac542', '16fe4e5e-294c-11f0-bda6-bc2411c0ee13', 'JTG6.D', NULL, '2025-05-05 20:02:00', '2025-05-05 20:02:00'),
('9ed6b718-fce7-4475-a786-986a90c9be28', 'c415a9aa-2969-11f0-bda6-bc2411c0ee13', '3f748a88-3949-406b-9db5-261c87e769c9', '173eb4da-294c-11f0-bda6-bc2411c0ee13', 'JBR1.A', NULL, '2025-05-05 20:05:20', '2025-05-05 20:05:20'),
('9ed6b719-0454-4878-acd7-0ef3e3bc7269', 'c415a9aa-2969-11f0-bda6-bc2411c0ee13', '1dcad18c-8e83-4a31-9759-ec171118f88e', '173eb4da-294c-11f0-bda6-bc2411c0ee13', 'JBR1.B', NULL, '2025-05-05 20:05:20', '2025-05-05 20:05:20'),
('9ed6b719-0532-4ee3-80ff-abd0a95dcb3a', 'c415a9aa-2969-11f0-bda6-bc2411c0ee13', '7c0c3d34-2962-4b3f-adee-d5c1d71ca928', '173eb4da-294c-11f0-bda6-bc2411c0ee13', 'JBR1.C', NULL, '2025-05-05 20:05:20', '2025-05-05 20:05:20'),
('9ed6b719-060c-49ca-b424-11c30d72a4cb', 'c415a9aa-2969-11f0-bda6-bc2411c0ee13', '8327054f-8069-4a49-a9b8-fd20609a85ec', '173eb4da-294c-11f0-bda6-bc2411c0ee13', 'JBR1.D', NULL, '2025-05-05 20:05:20', '2025-05-05 20:05:20'),
('9ed6b719-06fb-4d39-84a7-9453f886e269', 'c415a9aa-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '173eb4da-294c-11f0-bda6-bc2411c0ee13', 'JBR1.E', NULL, '2025-05-05 20:05:20', '2025-05-05 20:05:20'),
('9ed6b7e7-aae7-48a2-9ace-84498c30e212', 'c415a9cf-2969-11f0-bda6-bc2411c0ee13', '0306599a-920a-467a-b681-f84630057b62', '1783a6c1-294c-11f0-bda6-bc2411c0ee13', 'JBR2.A', NULL, '2025-05-05 20:07:36', '2025-05-05 20:07:36'),
('9ed6b7e7-ae61-45f1-a450-a3bdae2831b7', 'c415a9cf-2969-11f0-bda6-bc2411c0ee13', '100a30c3-577d-4ab6-a6f1-d0a614669e4c', '1783a6c1-294c-11f0-bda6-bc2411c0ee13', 'JBR2.B', NULL, '2025-05-05 20:07:36', '2025-05-05 20:07:36'),
('9ed6b7e7-af46-4f00-b16d-6ea77269ebac', 'c415a9cf-2969-11f0-bda6-bc2411c0ee13', 'cf2ce9cb-8052-4a71-89fb-bc31ea3429a9', '1783a6c1-294c-11f0-bda6-bc2411c0ee13', 'JBR2.C', NULL, '2025-05-05 20:07:36', '2025-05-05 20:07:36'),
('9ed6b7e7-b031-4eda-adee-5bbed3ee2a39', 'c415a9cf-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '1783a6c1-294c-11f0-bda6-bc2411c0ee13', 'JBR2.D', NULL, '2025-05-05 20:07:36', '2025-05-05 20:07:36'),
('9ed6b7e7-b10b-4794-816d-c25344ebb1ba', 'c415a9cf-2969-11f0-bda6-bc2411c0ee13', '2c01ddce-b52b-42e3-a68e-306d3d7c211f', '1783a6c1-294c-11f0-bda6-bc2411c0ee13', 'JBR2.E', NULL, '2025-05-05 20:07:36', '2025-05-05 20:07:36'),
('9ed6b886-e22d-4d47-96ea-43dbd8b4eb67', 'c415a9cf-2969-11f0-bda6-bc2411c0ee13', '52ef10be-e16b-4cf8-a42a-11b1cbf2c7f0', '17aa044e-294c-11f0-bda6-bc2411c0ee13', 'JBR2.F', '2025-05-05 20:09:47', '2025-05-05 20:09:20', '2025-05-05 20:09:47'),
('9ed6b886-e88f-47ba-8f2b-2f94b4f18e7b', 'c415a9cf-2969-11f0-bda6-bc2411c0ee13', 'e54a8edf-29e4-4eb1-ae4b-6227550f5ae2', '1783a6c1-294c-11f0-bda6-bc2411c0ee13', 'JBR2.G', '2025-05-05 20:09:52', '2025-05-05 20:09:20', '2025-05-05 20:09:52'),
('9ed6b886-e975-4ad5-b910-d01ed2aeeb8c', 'c415a9cf-2969-11f0-bda6-bc2411c0ee13', '40fd7483-791e-44a1-a1d5-fd267874a57d', '1783a6c1-294c-11f0-bda6-bc2411c0ee13', 'JBR2.H', '2025-05-05 20:09:56', '2025-05-05 20:09:20', '2025-05-05 20:09:56'),
('9ed6b972-68c2-457a-9d58-3106b9479fd0', 'c415a9f4-2969-11f0-bda6-bc2411c0ee13', '52ef10be-e16b-4cf8-a42a-11b1cbf2c7f0', '17aa044e-294c-11f0-bda6-bc2411c0ee13', 'JBR3.A', NULL, '2025-05-05 20:11:54', '2025-05-05 20:11:54'),
('9ed6b972-6fa8-4e99-980f-d1d81a319257', 'c415a9f4-2969-11f0-bda6-bc2411c0ee13', 'e54a8edf-29e4-4eb1-ae4b-6227550f5ae2', '17aa044e-294c-11f0-bda6-bc2411c0ee13', 'JBR3.B', NULL, '2025-05-05 20:11:54', '2025-05-05 20:11:54'),
('9ed6b972-7089-4d43-80ac-04ee9b415de3', 'c415a9f4-2969-11f0-bda6-bc2411c0ee13', '40fd7483-791e-44a1-a1d5-fd267874a57d', '17aa044e-294c-11f0-bda6-bc2411c0ee13', 'JBR3.C', NULL, '2025-05-05 20:11:54', '2025-05-05 20:11:54'),
('9ed6be73-e8f3-475f-b3e0-b9f8a7d08080', 'c415aa1b-2969-11f0-bda6-bc2411c0ee13', '9ed6bdcd-716b-4648-b1c0-8f3189bee096', '17d806bd-294c-11f0-bda6-bc2411c0ee13', 'DKI1.A', NULL, '2025-05-05 20:25:54', '2025-05-05 20:25:54'),
('9ed6beb5-b315-47d5-8ece-406b9baae7a1', 'c415aa41-2969-11f0-bda6-bc2411c0ee13', '982dd355-9218-4614-85a8-c7cac26c974b', '18079422-294c-11f0-bda6-bc2411c0ee13', 'DKI2.A', NULL, '2025-05-05 20:26:37', '2025-05-05 20:26:37'),
('9ed6beb5-b990-417b-a64a-bf9f0a67a157', 'c415aa41-2969-11f0-bda6-bc2411c0ee13', '6f11c687-2443-499e-b7f8-58a5cd4fe516', '18079422-294c-11f0-bda6-bc2411c0ee13', 'DKI2.B', NULL, '2025-05-05 20:26:37', '2025-05-05 20:26:37'),
('9ed6befe-0b5a-4b42-8127-2e91c6849e2e', 'c415aa41-2969-11f0-bda6-bc2411c0ee13', '9ed6bee5-cf9c-4749-9562-cc93bcb3ae9e', '18079422-294c-11f0-bda6-bc2411c0ee13', 'DKI2.C', NULL, '2025-05-05 20:27:25', '2025-05-05 20:27:25'),
('9ed6c273-2959-4d8c-af6d-32d3dcafbbd6', 'c415aafc-2969-11f0-bda6-bc2411c0ee13', '165c4e1a-6350-4e74-a55a-ce8f0e932052', '19296576-294c-11f0-bda6-bc2411c0ee13', 'DKI 7.A', NULL, '2025-05-05 20:37:05', '2025-05-05 20:37:05'),
('9ed6c2b3-2aa4-405e-bff2-ab348f44a808', 'c415ab24-2969-11f0-bda6-bc2411c0ee13', '296c4073-cf47-418d-9e3a-6f3f9cd1eecb', '18a89a07-294c-11f0-bda6-bc2411c0ee13', 'BTN1.A', '2025-05-05 20:38:32', '2025-05-05 20:37:47', '2025-05-05 20:38:32'),
('9ed6c2b3-344e-470f-9fec-ca505d5bcd16', 'c415ab24-2969-11f0-bda6-bc2411c0ee13', 'da5cae0e-b1cf-4aac-8c56-321bb8e0a4bb', '18a89a07-294c-11f0-bda6-bc2411c0ee13', 'BTN1.B', '2025-05-05 20:38:36', '2025-05-05 20:37:47', '2025-05-05 20:38:36'),
('9ed6c337-2d92-4707-83db-70acd07f278d', 'c415ab24-2969-11f0-bda6-bc2411c0ee13', '9ed6c24e-ab03-401d-aee4-5b62f9bb2f8c', '18a89a07-294c-11f0-bda6-bc2411c0ee13', 'BTN1.A', NULL, '2025-05-05 20:39:13', '2025-05-05 20:39:13'),
('9ed6c337-30d9-4155-bba5-e45b52cda687', 'c415ab24-2969-11f0-bda6-bc2411c0ee13', '296c4073-cf47-418d-9e3a-6f3f9cd1eecb', '18a89a07-294c-11f0-bda6-bc2411c0ee13', 'BTN1.B', NULL, '2025-05-05 20:39:13', '2025-05-05 20:39:13'),
('9ed6c3c3-cf44-4218-a4a7-cd3cae5ea26f', 'c415ab4a-2969-11f0-bda6-bc2411c0ee13', '9ed6c398-2a54-46f8-afa6-ad0bed509a36', '18c4335f-294c-11f0-bda6-bc2411c0ee13', 'BTN2.A', NULL, '2025-05-05 20:40:45', '2025-05-05 20:40:45'),
('9ed6c48b-8331-4c59-99ac-a441e186cf05', 'c415ab94-2969-11f0-bda6-bc2411c0ee13', '9ed6c438-4581-4b4d-8280-e95bd6762029', '19170290-294c-11f0-bda6-bc2411c0ee13', 'Palembang.A', NULL, '2025-05-05 20:42:56', '2025-05-05 20:42:56'),
('9ed6c48b-8648-459f-b827-fbbf3cc2edd9', 'c415ab94-2969-11f0-bda6-bc2411c0ee13', '88f124a5-ece1-44e9-ae37-7b03ed69544b', '19170290-294c-11f0-bda6-bc2411c0ee13', 'Palembang.B', NULL, '2025-05-05 20:42:56', '2025-05-05 20:42:56'),
('9ed6c48b-8733-47fb-8980-30fd6b6600d7', 'c415ab94-2969-11f0-bda6-bc2411c0ee13', '0c4aa59f-ee18-464e-a2eb-76503fed3de1', '19170290-294c-11f0-bda6-bc2411c0ee13', 'Palembang.C', NULL, '2025-05-05 20:42:56', '2025-05-05 20:42:56'),
('9ed6c5d5-4feb-45d4-a9ed-9bb7ac352ddc', 'c415ab6f-2969-11f0-bda6-bc2411c0ee13', '9ed6c523-ebf3-4578-8965-b9ef5ed0abad', '18dfcafa-294c-11f0-bda6-bc2411c0ee13', 'LPG1.A', NULL, '2025-05-05 20:46:32', '2025-05-05 20:46:32'),
('9ed6c5d5-5a5f-4459-bb94-5efeeb570b73', 'c415ab6f-2969-11f0-bda6-bc2411c0ee13', 'b35b454d-277d-453c-8029-d4480627d1e2', '18dfcafa-294c-11f0-bda6-bc2411c0ee13', 'LPG1.B', NULL, '2025-05-05 20:46:32', '2025-05-05 20:46:32'),
('9ed6c5d5-5b3b-41ab-8813-8a93245c0ccc', 'c415ab6f-2969-11f0-bda6-bc2411c0ee13', '55c1aba2-accd-49cb-8926-e03c5db72d45', '18dfcafa-294c-11f0-bda6-bc2411c0ee13', 'LPG1.C', NULL, '2025-05-05 20:46:32', '2025-05-05 20:46:32'),
('9ed6c5d5-5c91-4726-aef1-7e1f36ef0e5c', 'c415ab6f-2969-11f0-bda6-bc2411c0ee13', '2890e340-ce0d-487a-b8a0-aec7057098f0', '18dfcafa-294c-11f0-bda6-bc2411c0ee13', 'LPG1.D', NULL, '2025-05-05 20:46:32', '2025-05-05 20:46:32'),
('9ed6cbe0-391a-4e7f-915b-82ff655d8b0b', 'c415ac74-2969-11f0-bda6-bc2411c0ee13', '9ed6c86a-affa-44a5-ad27-39ad048016cd', '19e90ce4-294c-11f0-bda6-bc2411c0ee13', 'ACH1.A', NULL, '2025-05-05 21:03:26', '2025-05-05 21:03:26'),
('9ed6cbe0-3f97-4ec2-a18c-27abc935e538', 'c415ac74-2969-11f0-bda6-bc2411c0ee13', '9ed6c907-c92e-4bae-92fd-df12e040c056', '19e90ce4-294c-11f0-bda6-bc2411c0ee13', 'ACH1.B', NULL, '2025-05-05 21:03:26', '2025-05-05 21:03:26'),
('9ed6cbe0-407c-4557-8ebd-4ee1480273c4', 'c415ac74-2969-11f0-bda6-bc2411c0ee13', '9ed6c974-2024-4b70-a672-a287128004c4', '19e90ce4-294c-11f0-bda6-bc2411c0ee13', 'ACH1.C', NULL, '2025-05-05 21:03:26', '2025-05-05 21:03:26'),
('9ed6cbe0-4156-4015-a056-ec5a6234febf', 'c415ac74-2969-11f0-bda6-bc2411c0ee13', '9ed6c9ce-2202-4c25-b4bf-4ff907861bcc', '19e90ce4-294c-11f0-bda6-bc2411c0ee13', 'ACH1.D', NULL, '2025-05-05 21:03:26', '2025-05-05 21:03:26'),
('9ed6cbe0-4231-45cb-b32c-930df6f4bd72', 'c415ac74-2969-11f0-bda6-bc2411c0ee13', '9ed6ca1a-32ab-41c8-a851-61fafd4615a9', '19e90ce4-294c-11f0-bda6-bc2411c0ee13', 'ACH1.E', NULL, '2025-05-05 21:03:26', '2025-05-05 21:03:26'),
('9ed6cbe0-4309-4230-8680-abd6e4c83c57', 'c415ac74-2969-11f0-bda6-bc2411c0ee13', '9ed6ca72-5dd1-4486-9fd5-0f311f5ce297', '19e90ce4-294c-11f0-bda6-bc2411c0ee13', 'ACH1.F', NULL, '2025-05-05 21:03:26', '2025-05-05 21:03:26'),
('9ed6ce5d-0410-48cb-b0b7-ca3e914d9980', 'c415abe0-2969-11f0-bda6-bc2411c0ee13', '9ed6ccf0-29e3-4b88-80d1-d0e6d608d2f1', '9ed6cdc0-119d-4e71-a37e-79334205af23', 'SUM1.A', NULL, '2025-05-05 21:10:23', '2025-05-05 21:10:23'),
('9ed6ceb5-fb2d-4a70-b23f-d45db47211ba', 'c415abe0-2969-11f0-bda6-bc2411c0ee13', '9ed6cd4b-19b8-4699-bdb6-77484ea6edee', '9ed6cdc7-c6be-4dcd-9291-73fcd0f9953c', 'SUM1.B', NULL, '2025-05-05 21:11:22', '2025-05-05 21:11:22'),
('9ed6ceb5-fe38-46c6-aaa6-4a55f7ec4c19', 'c415abe0-2969-11f0-bda6-bc2411c0ee13', '9ed6ccc0-0d38-4b17-ae26-bee163095c31', '9ed6cdb8-f144-444e-b756-493f7f849a1b', 'SUM1.C', NULL, '2025-05-05 21:11:22', '2025-05-05 21:11:22'),
('9ed6ceb6-0fa9-43a4-ae34-95c1b3f467a3', 'c415abe0-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '19329616-294c-11f0-bda6-bc2411c0ee13', 'SUM1.D', NULL, '2025-05-05 21:11:22', '2025-05-05 21:11:22'),
('9ed6ced3-b221-4156-919a-3c9411311255', 'c415abe0-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed6cdd0-c884-4e14-9bd3-faec8d071963', 'SUM1.E', NULL, '2025-05-05 21:11:41', '2025-05-05 21:11:41'),
('9ed6d690-d6f5-4b2c-add7-45c0f6506e98', 'c415ac05-2969-11f0-bda6-bc2411c0ee13', '9ed6cffc-d460-4a3e-b3bd-e81a5ac6682a', '19609bc0-294c-11f0-bda6-bc2411c0ee13', 'SUM2.A', NULL, '2025-05-05 21:33:20', '2025-05-05 21:33:20'),
('9ed6d690-da45-4538-927f-6732df20b21b', 'c415ac05-2969-11f0-bda6-bc2411c0ee13', '9ed6d03b-6b93-403a-ab59-22d28524a456', '9ed6cde9-9ebf-46f3-b97f-08d168409eec', 'SUM2.B', NULL, '2025-05-05 21:33:20', '2025-05-05 21:33:20'),
('9ed6d690-db39-4647-a8e4-1f36a68dc177', 'c415ac05-2969-11f0-bda6-bc2411c0ee13', '9ed6d06d-9b10-4502-8cf4-3190ac3a26d1', '9ed6ce09-186c-468f-a31e-fad845a60abf', 'SUM2.C', NULL, '2025-05-05 21:33:20', '2025-05-05 21:33:20'),
('9ed6d690-dc20-4a70-90cd-1f246b874cb7', 'c415ac05-2969-11f0-bda6-bc2411c0ee13', '9ed6d0a3-a976-4c44-bcb9-7d9bcbcba522', '9ed6cf55-ddb6-4270-bc86-015e6f204f97', 'SUM2.D', NULL, '2025-05-05 21:33:20', '2025-05-05 21:33:20'),
('9ed6d6d1-1a1d-4456-839d-0e84cce27971', 'c415ac29-2969-11f0-bda6-bc2411c0ee13', '9ed6d0db-f43a-4c9b-bd0e-9ef7d4d2d777', '1996415d-294c-11f0-bda6-bc2411c0ee13', 'SUM3.A', NULL, '2025-05-05 21:34:02', '2025-05-05 21:34:02'),
('9ed6d6d1-1d7a-454e-b761-41328cf392f1', 'c415ac29-2969-11f0-bda6-bc2411c0ee13', '9ed6d110-727f-4cb4-8726-fe5bc84d8c17', '19a8a84b-294c-11f0-bda6-bc2411c0ee13', 'SUM3.B', NULL, '2025-05-05 21:34:02', '2025-05-05 21:34:02'),
('9ed6d75d-5271-4910-87b7-feaf3f16290c', 'c415ac29-2969-11f0-bda6-bc2411c0ee13', '9ed6d14f-c550-4c6a-895d-ad3e0dd924a3', '9ed6d70e-c596-40d7-a6ce-5de62b5558af', 'SUM3.C', NULL, '2025-05-05 21:35:34', '2025-05-05 21:35:34'),
('9ed6d75d-5552-420d-87b5-075a6159f89d', 'c415ac29-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed6d726-a04c-4e90-bf4b-0267df5eb869', 'SUM3.D', NULL, '2025-05-05 21:35:34', '2025-05-05 21:35:34'),
('9ed6d889-aea5-490e-8040-19ded4c1b483', 'c415abbb-2969-11f0-bda6-bc2411c0ee13', '9ed6d282-c1f1-4dd4-b208-74cc2a78d652', '9ed6d80d-2c25-4111-a738-d9d5ef15ab3a', 'SUM4.A', NULL, '2025-05-05 21:38:50', '2025-05-05 21:38:50'),
('9ed6d8dd-f407-469c-9d2a-dfa3c85a7831', 'c415abbb-2969-11f0-bda6-bc2411c0ee13', '9ed6d2b4-27d5-429d-9a60-91d9ffa2eb0f', '9ed6d87f-ab0d-4ccc-bf2c-ed71de09436d', 'SUM4.B', NULL, '2025-05-05 21:39:46', '2025-05-05 21:39:46'),
('9ed6d8dd-f78c-4cea-a84c-a8ab5d815120', 'c415abbb-2969-11f0-bda6-bc2411c0ee13', '9ed6d2f9-2920-4dc6-aa1e-8cce878ff337', '9ed6d8a3-fe00-4689-80f1-6117307b41d2', 'SUM4.C', NULL, '2025-05-05 21:39:46', '2025-05-05 21:39:46'),
('9ed6da0a-7efd-4f32-b09f-6cfcb8d6efef', '9ed60d4a-3c78-4c84-b5ff-c0d2482af4cd', '9ed6d324-b39a-4dc9-8d8e-15ae89bde6cb', '19d6a508-294c-11f0-bda6-bc2411c0ee13', 'SUM5.A', NULL, '2025-05-05 21:43:03', '2025-05-05 21:43:03'),
('9ed6da0a-81f7-4a58-b054-b45af1455d36', '9ed60d4a-3c78-4c84-b5ff-c0d2482af4cd', '0d8d367d-936e-4275-a305-7706bd93cde1', '19d6a508-294c-11f0-bda6-bc2411c0ee13', 'SUM5.B', NULL, '2025-05-05 21:43:03', '2025-05-05 21:43:03'),
('9ed6da0a-82d0-4624-9ae8-d94f4bbd1293', '9ed60d4a-3c78-4c84-b5ff-c0d2482af4cd', '9ed6d382-ee89-4b47-a137-26e1790dad66', '19dfdbc2-294c-11f0-bda6-bc2411c0ee13', 'SUM5.C', NULL, '2025-05-05 21:43:03', '2025-05-05 21:43:03'),
('9ed6db30-5ad1-457a-920c-d6d3372ae4d2', 'c415ac99-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed6daac-672b-4224-9b99-d8a2019aeccc', 'PKB1.A', NULL, '2025-05-05 21:46:15', '2025-05-05 21:46:15'),
('9ed6db3f-9b52-41df-b523-33020e76eae4', 'c415ac99-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed6dab3-a9dc-491d-9265-ef936a13a68f', 'PKB1.B', NULL, '2025-05-05 21:46:25', '2025-05-05 21:46:25'),
('9ed6db5d-b7a8-4fbd-bca5-2492da09db40', 'c415ac99-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed6dabb-04b4-41ed-bd1f-75511806c480', 'PKB1.C', NULL, '2025-05-05 21:46:45', '2025-05-05 21:46:45'),
('9ed6dbaa-e352-4edd-924e-a0b99fd1f271', 'c415acca-2969-11f0-bda6-bc2411c0ee13', '9ed6d3e6-525b-4029-9c23-ea5e1953faec', '1a5a8a76-294c-11f0-bda6-bc2411c0ee13', 'JBI 1 A.A', NULL, '2025-05-05 21:47:36', '2025-05-05 21:47:36'),
('9ed6dbaa-e631-4022-aea3-cdc6e2798796', 'c415acca-2969-11f0-bda6-bc2411c0ee13', '9ed6d436-3bba-4ad1-ae3e-3f092bf58b6e', '1a52e3c0-294c-11f0-bda6-bc2411c0ee13', 'JBI 1 A.B', NULL, '2025-05-05 21:47:36', '2025-05-05 21:47:36'),
('9ed6dbbf-86ae-4c15-a39b-320939cb3755', 'c415acca-2969-11f0-bda6-bc2411c0ee13', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed6dba7-5065-4341-82c2-9b8566833f2c', 'JBI 1 A.C', NULL, '2025-05-05 21:47:49', '2025-05-05 21:47:49'),
('9ed6dc40-8299-4803-ab2b-cb0f08f6db15', '9ed6dc0c-fe9b-443a-9c92-19bcf08a2f3b', '9ed6d48e-dc23-4940-98a1-b2a134048ec2', '1a4388c2-294c-11f0-bda6-bc2411c0ee13', 'PDG1.A', NULL, '2025-05-05 21:49:14', '2025-05-05 21:49:14'),
('9ed6dc40-8593-48d2-b070-c6fcfb064823', '9ed6dc0c-fe9b-443a-9c92-19bcf08a2f3b', '9ed6d4eb-5f82-47a2-adbc-f5e75876009d', '1a3bde28-294c-11f0-bda6-bc2411c0ee13', 'PDG1.B', NULL, '2025-05-05 21:49:14', '2025-05-05 21:49:14'),
('9ed6dc40-8680-422e-8680-4996ad5cac8f', '9ed6dc0c-fe9b-443a-9c92-19bcf08a2f3b', '9ed6d536-0031-422f-a4b0-32e154929cfb', '1a343389-294c-11f0-bda6-bc2411c0ee13', 'PDG1.C', NULL, '2025-05-05 21:49:14', '2025-05-05 21:49:14'),
('9ed9b3f7-e4a8-41a0-ae19-966469960620', '9ed9b3a1-e6f0-4d08-bbdc-37dcb61e2d0f', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed9b3e0-d5ce-401f-9061-5bdd6102a668', 'vacant.A', NULL, '2025-05-07 07:44:04', '2025-05-07 07:44:04'),
('9ed9b40a-759e-43ad-8c85-08213be9af7e', '9ed9b3a1-e6f0-4d08-bbdc-37dcb61e2d0f', '0d8d367d-936e-4275-a305-7706bd93cde1', '9ed9b3e0-d5ce-401f-9061-5bdd6102a668', 'vacant.B', NULL, '2025-05-07 07:44:16', '2025-05-07 07:44:16'),
('9ee0d575-4f4a-4b3d-8ff8-9282e64e3316', '9ee11337-12c3-4760-b245-cd2765c09aa4', '9ee0d4fb-cbfe-4b5c-aedd-5b73cdae09cb', '9ee0d547-4844-4001-94e7-b66dcd1a86ed', 'RDK.A', NULL, '2025-05-10 13:48:30', '2025-05-10 13:48:30');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensis`
--
ALTER TABLE `absensis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absensis_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `approval_histories`
--
ALTER TABLE `approval_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approval_histories_pengajuan_dokter_id_foreign` (`pengajuan_dokter_id`);

--
-- Indeks untuk tabel `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bug_reports`
--
ALTER TABLE `bug_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bug_reports_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `daily_visits`
--
ALTER TABLE `daily_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_visits_user_id_foreign` (`user_id`),
  ADD KEY `daily_visits_dokter_id_foreign` (`dokter_id`),
  ADD KEY `daily_visits_instansi_id_foreign` (`instansi_id`);

--
-- Indeks untuk tabel `dokters`
--
ALTER TABLE `dokters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dokters_email_unique` (`email`),
  ADD KEY `dokters_instansi_id_foreign` (`instansi_id`),
  ADD KEY `dokters_spesialis_id_foreign` (`spesialis_id`),
  ADD KEY `dokters_wilayah_id_foreign` (`wilayah_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `instansis`
--
ALTER TABLE `instansis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jabatans`
--
ALTER TABLE `jabatans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pengajuan_dokters`
--
ALTER TABLE `pengajuan_dokters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pengajuan_dokters_email_unique` (`email`),
  ADD KEY `pengajuan_dokters_instansi_id_foreign` (`instansi_id`),
  ADD KEY `pengajuan_dokters_spesialis_id_foreign` (`spesialis_id`),
  ADD KEY `pengajuan_dokters_wilayah_id_foreign` (`wilayah_id`),
  ADD KEY `pengajuan_dokters_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `pengumumen`
--
ALTER TABLE `pengumumen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengumumen_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regions_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `region_details`
--
ALTER TABLE `region_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_details_region_id_foreign` (`region_id`),
  ADD KEY `region_details_wilayah_id_foreign` (`wilayah_id`);

--
-- Indeks untuk tabel `self_schedules`
--
ALTER TABLE `self_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `self_schedules_user_id_foreign` (`user_id`),
  ADD KEY `self_schedules_daily_visit_id_foreign` (`daily_visit_id`);

--
-- Indeks untuk tabel `spesialis`
--
ALTER TABLE `spesialis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `whatsapps`
--
ALTER TABLE `whatsapps`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wilayahs`
--
ALTER TABLE `wilayahs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wilayah_details`
--
ALTER TABLE `wilayah_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wilayah_details_wilayah_id_foreign` (`wilayah_id`),
  ADD KEY `wilayah_details_user_id_foreign` (`user_id`),
  ADD KEY `wilayah_details_area_id_foreign` (`area_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensis`
--
ALTER TABLE `absensis`
  ADD CONSTRAINT `absensis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `approval_histories`
--
ALTER TABLE `approval_histories`
  ADD CONSTRAINT `approval_histories_pengajuan_dokter_id_foreign` FOREIGN KEY (`pengajuan_dokter_id`) REFERENCES `pengajuan_dokters` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bug_reports`
--
ALTER TABLE `bug_reports`
  ADD CONSTRAINT `bug_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `daily_visits`
--
ALTER TABLE `daily_visits`
  ADD CONSTRAINT `daily_visits_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokters` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `daily_visits_instansi_id_foreign` FOREIGN KEY (`instansi_id`) REFERENCES `instansis` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `daily_visits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `dokters`
--
ALTER TABLE `dokters`
  ADD CONSTRAINT `dokters_instansi_id_foreign` FOREIGN KEY (`instansi_id`) REFERENCES `instansis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dokters_spesialis_id_foreign` FOREIGN KEY (`spesialis_id`) REFERENCES `spesialis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dokters_wilayah_id_foreign` FOREIGN KEY (`wilayah_id`) REFERENCES `wilayahs` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengajuan_dokters`
--
ALTER TABLE `pengajuan_dokters`
  ADD CONSTRAINT `pengajuan_dokters_instansi_id_foreign` FOREIGN KEY (`instansi_id`) REFERENCES `instansis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengajuan_dokters_spesialis_id_foreign` FOREIGN KEY (`spesialis_id`) REFERENCES `spesialis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengajuan_dokters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengajuan_dokters_wilayah_id_foreign` FOREIGN KEY (`wilayah_id`) REFERENCES `wilayahs` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengumumen`
--
ALTER TABLE `pengumumen`
  ADD CONSTRAINT `pengumumen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `region_details`
--
ALTER TABLE `region_details`
  ADD CONSTRAINT `region_details_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `region_details_wilayah_id_foreign` FOREIGN KEY (`wilayah_id`) REFERENCES `wilayahs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
