-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2023 pada 16.30
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kos_saw`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_admin` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('Laki - Laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif_kos`
--

CREATE TABLE `alternatif_kos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_kos` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kos` enum('Laki - Laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ukuran_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_perbulan` int(11) NOT NULL,
  `foto_kos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fasilitas_kos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pemilik_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasils`
--

CREATE TABLE `hasils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hasil` int(11) NOT NULL,
  `kos_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriterias`
--

CREATE TABLE `kriterias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kriteria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_04_06_021704_create_admins_table', 1),
(5, '2023_04_06_022447_create_pemiliks_table', 1),
(6, '2023_04_06_023103_create_pencari_kos_table', 1),
(7, '2023_04_06_023104_create_users_table', 1),
(8, '2023_04_06_023340_create_alternatif_kos_table', 1),
(9, '2023_04_06_023341_create_kriterias_table', 1),
(10, '2023_04_06_023350_create_penilaians_table', 1),
(11, '2023_04_06_025243_create_hasils_table', 1),
(12, '2023_04_06_025600_create_penyewaans_table', 1),
(13, '2023_04_06_030100_create_pembayarans_table', 1),
(14, '2023_04_06_030222_create_pilihans_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayarans`
--

CREATE TABLE `pembayarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `metode_bayar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_bayar` date NOT NULL,
  `sewa_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemiliks`
--

CREATE TABLE `pemiliks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pemilik_kos` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('Laki - Laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pencari_kos`
--

CREATE TABLE `pencari_kos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pencari_kos` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('Laki - Laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaians`
--

CREATE TABLE `penilaians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilai` int(11) NOT NULL,
  `kos_id` bigint(20) UNSIGNED NOT NULL,
  `kriteria_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewaans`
--

CREATE TABLE `penyewaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `tgl_sewa` date NOT NULL,
  `durasi_ngekos` date NOT NULL,
  `biaya_sewa` int(11) NOT NULL,
  `kos_id` bigint(20) UNSIGNED NOT NULL,
  `pemilik_kos_id` bigint(20) UNSIGNED NOT NULL,
  `pencari_kos_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pilihans`
--

CREATE TABLE `pilihans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pencari_kos_id` bigint(20) UNSIGNED NOT NULL,
  `kos_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `pemilik_id` bigint(20) UNSIGNED NOT NULL,
  `pencari_kos_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `alternatif_kos`
--
ALTER TABLE `alternatif_kos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alternatif_kos_pemilik_id_foreign` (`pemilik_id`);

--
-- Indeks untuk tabel `hasils`
--
ALTER TABLE `hasils`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hasils_kos_id_foreign` (`kos_id`);

--
-- Indeks untuk tabel `kriterias`
--
ALTER TABLE `kriterias`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembayarans_sewa_id_foreign` (`sewa_id`);

--
-- Indeks untuk tabel `pemiliks`
--
ALTER TABLE `pemiliks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pencari_kos`
--
ALTER TABLE `pencari_kos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penilaians`
--
ALTER TABLE `penilaians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penilaians_kos_id_foreign` (`kos_id`),
  ADD KEY `penilaians_kriteria_id_foreign` (`kriteria_id`);

--
-- Indeks untuk tabel `penyewaans`
--
ALTER TABLE `penyewaans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penyewaans_kos_id_foreign` (`kos_id`),
  ADD KEY `penyewaans_pemilik_kos_id_foreign` (`pemilik_kos_id`),
  ADD KEY `penyewaans_pencari_kos_id_foreign` (`pencari_kos_id`);

--
-- Indeks untuk tabel `pilihans`
--
ALTER TABLE `pilihans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pilihans_pencari_kos_id_foreign` (`pencari_kos_id`),
  ADD KEY `pilihans_kos_id_foreign` (`kos_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_admin_id_foreign` (`admin_id`),
  ADD KEY `users_pemilik_id_foreign` (`pemilik_id`),
  ADD KEY `users_pencari_kos_id_foreign` (`pencari_kos_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `alternatif_kos`
--
ALTER TABLE `alternatif_kos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hasils`
--
ALTER TABLE `hasils`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kriterias`
--
ALTER TABLE `kriterias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pembayarans`
--
ALTER TABLE `pembayarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pemiliks`
--
ALTER TABLE `pemiliks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pencari_kos`
--
ALTER TABLE `pencari_kos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penilaians`
--
ALTER TABLE `penilaians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `penyewaans`
--
ALTER TABLE `penyewaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pilihans`
--
ALTER TABLE `pilihans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alternatif_kos`
--
ALTER TABLE `alternatif_kos`
  ADD CONSTRAINT `alternatif_kos_pemilik_id_foreign` FOREIGN KEY (`pemilik_id`) REFERENCES `pemiliks` (`id`);

--
-- Ketidakleluasaan untuk tabel `hasils`
--
ALTER TABLE `hasils`
  ADD CONSTRAINT `hasils_kos_id_foreign` FOREIGN KEY (`kos_id`) REFERENCES `alternatif_kos` (`id`);

--
-- Ketidakleluasaan untuk tabel `pembayarans`
--
ALTER TABLE `pembayarans`
  ADD CONSTRAINT `pembayarans_sewa_id_foreign` FOREIGN KEY (`sewa_id`) REFERENCES `penyewaans` (`id`);

--
-- Ketidakleluasaan untuk tabel `penilaians`
--
ALTER TABLE `penilaians`
  ADD CONSTRAINT `penilaians_kos_id_foreign` FOREIGN KEY (`kos_id`) REFERENCES `alternatif_kos` (`id`),
  ADD CONSTRAINT `penilaians_kriteria_id_foreign` FOREIGN KEY (`kriteria_id`) REFERENCES `kriterias` (`id`);

--
-- Ketidakleluasaan untuk tabel `penyewaans`
--
ALTER TABLE `penyewaans`
  ADD CONSTRAINT `penyewaans_kos_id_foreign` FOREIGN KEY (`kos_id`) REFERENCES `alternatif_kos` (`id`),
  ADD CONSTRAINT `penyewaans_pemilik_kos_id_foreign` FOREIGN KEY (`pemilik_kos_id`) REFERENCES `pemiliks` (`id`),
  ADD CONSTRAINT `penyewaans_pencari_kos_id_foreign` FOREIGN KEY (`pencari_kos_id`) REFERENCES `pencari_kos` (`id`);

--
-- Ketidakleluasaan untuk tabel `pilihans`
--
ALTER TABLE `pilihans`
  ADD CONSTRAINT `pilihans_kos_id_foreign` FOREIGN KEY (`kos_id`) REFERENCES `alternatif_kos` (`id`),
  ADD CONSTRAINT `pilihans_pencari_kos_id_foreign` FOREIGN KEY (`pencari_kos_id`) REFERENCES `pencari_kos` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `users_pemilik_id_foreign` FOREIGN KEY (`pemilik_id`) REFERENCES `pemiliks` (`id`),
  ADD CONSTRAINT `users_pencari_kos_id_foreign` FOREIGN KEY (`pencari_kos_id`) REFERENCES `pencari_kos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
