-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Mar 2023 pada 10.13
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dblearn`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `analisis`
--

CREATE TABLE `analisis` (
  `id_analisis` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `jawaban` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `analisis`
--

INSERT INTO `analisis` (`id_analisis`, `id_ujian`, `id_soal`, `id_siswa`, `jawaban`) VALUES
(11, 17, 113, 31, '1'),
(12, 20, 124, 98, '0'),
(13, 20, 125, 98, '0'),
(14, 20, 126, 98, '0'),
(15, 20, 127, 98, '0'),
(16, 20, 128, 98, '0'),
(17, 20, 129, 98, '0'),
(18, 20, 130, 98, '3'),
(19, 20, 131, 98, '3'),
(20, 20, 132, 98, '0'),
(21, 20, 133, 98, '0'),
(22, 20, 134, 98, '0'),
(23, 20, 135, 98, '0'),
(24, 20, 136, 98, '0'),
(25, 20, 137, 98, '0'),
(26, 20, 138, 98, '0'),
(27, 20, 139, 98, '0'),
(28, 20, 140, 98, '0'),
(29, 20, 141, 98, '0'),
(30, 20, 142, 98, '0'),
(31, 20, 143, 98, '0'),
(32, 20, 144, 98, '3'),
(33, 20, 145, 98, '0'),
(34, 20, 146, 98, '0'),
(35, 20, 147, 98, '0'),
(36, 20, 148, 98, '0'),
(37, 20, 149, 98, '0'),
(38, 20, 150, 98, '0'),
(39, 20, 151, 98, '0'),
(40, 20, 152, 98, '0'),
(41, 20, 153, 98, '0'),
(42, 20, 154, 98, '4'),
(43, 22, 161, 101, '1'),
(44, 22, 161, 106, '1'),
(45, 22, 161, 101, '1'),
(46, 22, 162, 101, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_tugas`
--

CREATE TABLE `kelas_tugas` (
  `id_klstugas` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kelas_tugas`
--

INSERT INTO `kelas_tugas` (`id_klstugas`, `id_tugas`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(13, 10, 19, 9, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_ujian`
--

CREATE TABLE `kelas_ujian` (
  `id_klsujian` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_klsujian`, `id_ujian`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(26, 16, 15, 0, 'N'),
(29, 20, 14, 9, 'N'),
(30, 22, 19, 9, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_ujianessay`
--

CREATE TABLE `kelas_ujianessay` (
  `id_klsessay` int(11) NOT NULL,
  `id_ujianessay` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_ujian` varchar(100) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `jml_benar` int(11) NOT NULL,
  `jml_kosong` int(11) NOT NULL,
  `jml_salah` int(11) NOT NULL,
  `nilai` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `waktu_selesai`, `jml_benar`, `jml_kosong`, `jml_salah`, `nilai`) VALUES
(14, 31, '17', '113', '1', '01:00:00', '13:45:36', 1, 0, 0, '100'),
(15, 98, '20', '144,130,131,154,134,132,137,153,133,125,152,136,129,148,126,127,143,150,135,149,146,124,138,140,145,151,142,141,147,139,128', '3,3,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0', '01:30:00', '11:44:31', 0, 27, 4, '0'),
(19, 102, '22', '161,162', '1,2', '01:00:00', '10:09:29', 2, 0, 0, '100'),
(18, 101, '22', '162,161', '1,2', '01:00:00', '10:09:29', 2, 0, 0, '100');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_pengirim` varchar(30) NOT NULL,
  `id_penerima` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `isi_pesan` longtext NOT NULL,
  `sudah_dibaca` enum('belum','sudah') NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_1` text NOT NULL,
  `pilihan_2` text NOT NULL,
  `pilihan_3` text NOT NULL,
  `pilihan_4` text NOT NULL,
  `pilihan_5` text NOT NULL,
  `kunci` int(11) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `pilihan_5`, `kunci`, `status`) VALUES
(113, 17, '<p>What is your name ?</p>\r\n', '<p>My name is ahmad</p>\r\n', '<p>Your name is ahmad</p>\r\n', '<p>Her name is ahmad</p>\r\n', '<p>His name is ahmad</p>\r\n', '<p>Them name is ahmad</p>\r\n', 1, 'Y'),
(114, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">Dibawah ini yang merupakan perbedaan antara kitab dan suhuf adalah&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">kitab berasal dari Allah Swt., suhuf berasal dari malaikat</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">isi kitab lebih benar dari pada suhuf</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">isi kitab lebih lengkap dari suhuf</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">mempelajari kitab lebih utama daripada mempelajari suhuf</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">kitab lebih tebal dari suhuf</span></span></span></span></p>\r\n', 3, 'Y'),
(115, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Isi dari kitab Al-Qur&rsquo;an itu tidak ada keraguan sama sekali. Hal ini dijelaskan Allah dalam firman-Nya yaitu&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Surah az-Zumar ayat 39</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Surah al-Furqan ayat 1</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Surah al-Maidah ayat 46</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Surah al-Baqarah ayat 2</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Surah at-Taubah ayat 9</span></span></span></span></p>\r\n', 4, 'Y'),
(116, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Beriman kepada kitab-kitab Allah termasuk dalam rukun iman, yaitu yang ke&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">satu</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">dua</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">tiga</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">empat</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">lima</span></span></span></span></p>\r\n', 3, 'Y'),
(117, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Dibawah ini yang tidak termasuk isi dari kitab Injil adalah&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">perintah kembali pada tauhid yang murni</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">ajaran yang menyempurnakan kitab Taurat</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">pembenaran terhadap kitab-kitab yang diturunkan sebelumnya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">ajaran agar hidup sederhana dan menjauhi sifat tamak</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">larangan berbuat zina</span></span></span></span></p>\r\n', 5, 'Y'),
(118, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Kitab Injil itu diturunkan Allah kepada putra Maryam yaitu&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Nabi Isa a.s.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Nabi Musa a.s.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Nabi Daud a.s.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Nabi Sulaiman a.s.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Nabi Muhammad saw.</span></span></span></span></p>\r\n', 1, 'Y'),
(119, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">Berikut ini seorang rasul yang menerima kitab dan juga menerima suhuf adalah&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">Nabi Ibrahim a.s.</span></span></span></span><br />\r\n<br />\r\n&nbsp;</p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">Nabi Nuh a.s.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">Nabi Musa a.s.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">Nabi Isa a.s.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span arial=\"\" style=\"font-family:\">Nabi Daud a.s.</span></span></span></span></p>\r\n', 3, 'Y'),
(121, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Sikap kita yang benar terhadap kitab Taurat, Zabur, dan Injil adalah&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">boleh mempelajarinya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">tidak boleh mengimaninya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">langsung mempercayainya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">mengamalkan ajarannya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">percaya dan tidak berkewajiban mengamalkannya</span></span></span></span></p>\r\n', 5, 'Y'),
(120, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Dibawah ini hikmah yang dimiliki oleh orang yang beriman kepada kitab-kitab Allah, kecuali&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">hidupnya menjadi lebih tertata</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">keimanannya menjadi lebih meningkat</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">terjaga ketakwaannya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">menumbuhkan sikap optimis</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">hatinya menjadi resah gelisah</span></span></span></span></p>\r\n', 5, 'Y'),
(122, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Tujuan Allah Swt. menurunkan kitab-kitab suci adalah&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">sebagai pedoman dalam menjalakan kehidupan dunia</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">mukjizat yang dapat mengubah kondisi umat yang dihadapi</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">pegangan dalam menjalankan tugas kenabian</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">memberikan kepercayaan penuh dalam membimbing umatnya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">menjadi petunjuk sesaat</span></span></span></span></p>\r\n', 1, 'Y'),
(123, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Kitab yang mempunyai nama lain kitab Mazmur adalah&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Kitab Taurat</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Kitab Zabur</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Kitab Injil</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Kitab Al-Qur&rsquo;an</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Kitab Kuning</span></span></span></span></p>\r\n', 2, 'Y'),
(124, 20, '', 'A', 'B', 'C', 'D', 'E', 1, 'Y'),
(125, 20, '', 'I', 'II', 'III', 'IV', 'V', 3, 'Y'),
(126, 20, '', 'V', 'IV', 'III', 'II', 'I', 4, 'Y'),
(127, 20, '', 'I', 'II', 'III', 'IV', 'V', 3, 'Y'),
(128, 20, '', '', '', '', '', '', 3, 'Y'),
(129, 20, '', 'A', 'B', 'C', 'D', 'E', 1, 'Y'),
(130, 20, '', 'A', 'B', 'C', 'D', 'E', 5, 'Y'),
(131, 20, '', 'Segitiga lancip ', 'segitiga sama sisi ', 'segitiga sembarang ', 'segitiga tumpul sama kaki ', 'segitiga siku-siku sama kaki ', 5, 'Y'),
(132, 20, '', '15', '16', '17', '18', '19', 3, 'Y'),
(133, 20, '', '6', '8', '10', '11', '14', 2, 'Y'),
(134, 20, '', '15', '18', '34', '40', '42', 4, 'Y'),
(135, 20, '', 'P', 'Q', 'R', 'S', 'T', 3, 'Y'),
(136, 20, '', '44 Satuan Luas ', '48 Satuan Luas ', '50 Satuan Luas ', '54 Satuan Luas ', '56 Satuan Luas ', 4, 'Y'),
(137, 20, '', 'A', 'B', 'C', 'D', 'E', 4, 'Y'),
(138, 20, '', '6', '8', '10', '12', '16', 3, 'Y'),
(139, 20, '', 'A', 'B', 'C', 'D', 'E', 2, 'Y'),
(140, 20, '', 'A', 'B', 'C', 'D', 'E', 2, 'Y'),
(141, 20, '', 'A', 'B', 'C', 'D', 'E', 4, 'Y'),
(142, 20, '', 'A', 'B', 'C', 'D', 'E', 1, 'Y'),
(143, 20, '', 'Rp. 300,000,00', 'Rp. 320,000,00', 'Rp. 340,000,00', 'Rp. 360,000,00', 'Rp. 400,000,00', 3, 'Y'),
(144, 20, '', 'Rp. 6,000,00', 'Rp. 6,700,00', 'Rp. 7,000,00', 'Rp. 20,000,00', 'Rp. 400,000,00', 4, 'Y'),
(145, 20, '', 'Rp. 176,000,00', 'Rp. 200,000,00', 'Rp. 260,000,00', 'Rp. 300,000,00', 'Rp.340,000,00', 3, 'Y'),
(146, 20, '', '7 Bus Jenis A ', '6 Bus Jenis B ', '4 Bus Jenis A dan 3 Bus Jenis B', '3 Bus Jenis B dan 4 Bus Jenis A ', '2 Bus Jenis A dan 3 Bus Jenis B ', 3, 'Y'),
(147, 20, '', 'Rp. 600.000.000,00', 'Rp. 720.000.000.00', 'Rp. 852.000.000.00', 'Rp. 900.000.000.00', 'Rp. 974.000.000.00', 3, 'Y'),
(148, 20, '', 'Rp. 3000,000,00', 'Rp. 3.200,000,00', 'Rp.3.400,000,00', 'Rp. 3.600.000.00', 'Rp. 4000,000,00', 3, 'Y'),
(149, 20, '', 'Rp. 1.400.000.00', 'Rp. 1.600.000.00', 'Rp. 1.800.000.00', 'Rp. 1.900.000.00', 'Rp. 2.000.000.00', 1, 'Y'),
(150, 20, '', 'Rp. 360.000.00', 'Rp. 435.000.00', 'Rp. 450.000.00', 'Rp. 540.000.00', 'Rp. 630.000.00', 2, 'Y'),
(151, 20, '', 'Rp. 1.575.000.00', 'Rp. 1.935.000.00', 'Rp. 2.580.000.00', 'Rp. 3.150.000.00', 'Rp. 3.510.000.00', 5, 'Y'),
(152, 20, '', 'Rp. 5.500.000.00', 'Rp. 5.000.000.00', 'Rp. 4.800.000.00', 'Rp. 4.500.000.00', 'Rp. 4.200.000.00', 4, 'Y'),
(153, 20, '', 'Rp. 10.000.000.00', 'Rp. 12.000.000.00', 'Rp. 18.000.000.00', 'RP. 21.000.000.00', 'Rp. 25.000.000.00', 3, 'Y'),
(154, 20, '', '', '', '', '', '', 0, 'Y'),
(155, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Firman Allah yang menjelaskan bahwa kitab Taurat itu diturunkan kepada Nabi Musa a.s. adalah&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Surah al-Baqarah ayat 2</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Surah al-Isra ayat 2</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Surah al-Maidah ayat 45</span></span></span></span><br />\r\n&nbsp;</p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Surat al-Furqan ayat 1</span></span></span></span><br />\r\n&nbsp;</p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Surat an-Nisa ayat 13</span></span></span></span></p>\r\n', 2, 'Y'),
(156, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Kewajiban kita terhadap Al-Qur&rsquo;an adalah&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">mempelajari karya sastranya</span></span></span></span><br />\r\n&nbsp;</p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">mempelajari dan memahami isinya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">hanya mempelajari isinya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">mempelajari, memahami, dan mengamalkan isinya</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">memahami bahasa dan susunan kalimatnya</span></span></span></span></p>\r\n', 4, 'Y'),
(157, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Persoalan hukum yang ditemui senantiasa ditanyakan dan dikembalikan kepada Al-Qur&rsquo;an. Hal ini karena Al-Qur&rsquo;an mempunyai kedudukan&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">wahyu yang diturunkan Allah Swt. kepada Nabi Muhammad saw.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">mukjizat terbesar Nabi Muhammad saw.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">sumber utama hukum Islam</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">prinsip dalam menjalani kehidupan</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">pedoman dalam menjalani kehidupan</span></span></span></span></p>\r\n', 3, 'Y'),
(158, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Kitab Allah Swt. yang dikenal oleh orang Kristen dengan nama Old Testatement adalah&hellip;.</span></span></span></span><br />\r\n&nbsp;</p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Taurat</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Injil</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Zabur</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Weda</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Suhuf</span></span></span></span><br />\r\n&nbsp;</p>\r\n', 1, 'Y'),
(159, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Kitab yang isi pokoknya ada dalam The Ten Commandement adalah&hellip;.</span></span></span></span><br />\r\n&nbsp;</p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Al-Qur&rsquo;an</span></span></span></span><br />\r\n&nbsp;</p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Perjanjian Baru</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Injil</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Taurat</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">Zabur</span></span></span></span></p>\r\n', 4, 'Y'),
(160, 19, '<p><span style=\"font-size:12.0pt\"><span style=\"background:white\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\">Perhatikan pernyataan-pernyataan dibawah ini!</span></span></span></span><br />\r\n<span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">1. Mengamalkan ajarannya dalam kehidupan.</span><br />\r\n<span style=\"background:white\">2. Meyakini kebenaran isinya.</span><br />\r\n<span style=\"background:white\">3. Mempelajari, memahami, dan mengamalkan isi kandungannya.</span><br />\r\n<span style=\"background:white\">4. Menyakini kitab-kitab tersebut berasal dari Allah Swt..</span><br />\r\n<span style=\"background:white\">Dari pernyataan-pernyataan di atas, yang merupakan penerapan iman kepada kitab Allah selain Al-Qur&rsquo;an adalah&hellip;.</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">1 dan 2</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">2 dan 4</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">1 dan 3</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">3 dan 4</span></span></span></span></p>\r\n', '<p><span style=\"font-size:12.0pt\"><span style=\"line-height:107%\"><span style=\"font-family:&quot;Arial&quot;,sans-serif\"><span style=\"background:white\">1 dan 4</span></span></span></span></p>\r\n', 2, 'Y'),
(161, 22, '<p>LAN kepanjangan dari?</p>\r\n', '<p>Local Area Network</p>\r\n', '<p>Local Area Nagrek</p>\r\n', '<p>Local Area Nanti</p>\r\n', '<p>Local Area Nanana</p>\r\n', '<p>Local Area Nunu</p>\r\n', 1, 'Y'),
(162, 22, '<p>WAN kepanjangan dari?</p>\r\n', '<p>Wide Area Network</p>\r\n', '<p>Wide Area Nagrek</p>\r\n', '<p>Wide Area Nanti</p>\r\n', '<p>Wide Area Nanana</p>\r\n', '<p>Wide Area Nunu</p>\r\n', 1, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `aktif` varchar(5) NOT NULL,
  `foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `username`, `password`, `aktif`, `foto`) VALUES
(1, 'Adminweb', 'admin', 'f865b53623b121fd34ee5426c792e5c33af8c227', 'Y', '512x512.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama_guru` varchar(120) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` varchar(5) NOT NULL,
  `date_created` date NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nik`, `nama_guru`, `email`, `password`, `foto`, `status`, `date_created`, `confirm`) VALUES
(17, '12345678', 'NOPIYANTO, S.Pd.', 'nopiyanto@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', NULL, 'Y', '2022-11-28', 'Yes'),
(18, '12345678', 'QOYIMAH, S.Pd.', 'qoyimah@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', NULL, 'Y', '2022-11-28', 'Yes'),
(19, '123456789', 'H. KAMALI NOOR', 'hkamalinoor@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(20, '123456789', 'AISYAH NUR HALIMATUSSADIYAH, S.Hum.', 'aisyahns@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(21, '123456789', 'TAUFIK HIDAYAT, S.Pd.', 'taufikhidayat@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(22, '123456789', 'AMINUDIN, S.Pd.I.', 'aminudin@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(23, '123456789', 'JULYANI DWI ASTUTI, S.Pd.', 'julyanida@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(24, '123456789', 'INDRA ADITYA, S.Pd.', 'indraaditya@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(25, '123456789', 'EDI, S.T.', 'edi@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(26, '123456789', 'RUDI, S.T.', 'rudi@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(27, '123456789', 'AGUS DWIYANTA, S.ST.', 'agusdwiyanta@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(28, '123456789', 'UMIYATI, S.Pd.', 'umiyati@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(29, '123456789', 'LINDA RATNAWATI, SH.', 'lindar@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(30, '123456789', 'CARIDAH, S.Pd.', 'caridah@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(31, '123456789', 'SITI NURAFIFAH, S.Pd.', 'sitinurafifah@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(32, '123456789', 'SATRIA SETIAWAN, M.Hum.', 'satriasetiawan@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(33, '123456789', 'NINING SETIANINGSIH, S.Pd.', 'ninings@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(34, '123456789', 'MAHBUB ATHOILLAH', 'mahbuba@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', NULL, 'Y', '2022-12-01', 'Yes'),
(35, '12345678910', 'febri', 'guru1@mail.com', '9048ead9080d9b27d6b2b6ed363cbf8cce795f7f', NULL, 'Y', '2023-03-24', 'Yes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenisperangkat`
--

CREATE TABLE `tb_jenisperangkat` (
  `id_jenisperangkat` int(11) NOT NULL,
  `jenis_perangkat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_jenisperangkat`
--

INSERT INTO `tb_jenisperangkat` (`id_jenisperangkat`, `jenis_perangkat`) VALUES
(6, 'Android');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenistugas`
--

CREATE TABLE `tb_jenistugas` (
  `id_jenistugas` int(11) NOT NULL,
  `jenis_tugas` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_jenistugas`
--

INSERT INTO `tb_jenistugas` (`id_jenistugas`, `jenis_tugas`) VALUES
(1, 'INDIVIDU'),
(2, 'KELOMPOK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenisujian`
--

CREATE TABLE `tb_jenisujian` (
  `id_jenis` int(11) NOT NULL,
  `jenis_ujian` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_jenisujian`
--

INSERT INTO `tb_jenisujian` (`id_jenis`, `jenis_ujian`) VALUES
(4, 'Tulis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master_jurusan`
--

CREATE TABLE `tb_master_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `jurusan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_master_jurusan`
--

INSERT INTO `tb_master_jurusan` (`id_jurusan`, `jurusan`) VALUES
(9, 'Teknik Komputer dan Jaringan'),
(10, 'Teknik Kendaraan Ringan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master_kelas`
--

CREATE TABLE `tb_master_kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_master_kelas`
--

INSERT INTO `tb_master_kelas` (`id_kelas`, `kelas`) VALUES
(14, 'X TKJ'),
(15, 'X TKR'),
(16, 'XI TKJ'),
(17, 'XI TKR'),
(18, 'XII TKJ'),
(19, 'XII TKR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master_mapel`
--

CREATE TABLE `tb_master_mapel` (
  `id_mapel` int(11) NOT NULL,
  `mapel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_master_mapel`
--

INSERT INTO `tb_master_mapel` (`id_mapel`, `mapel`) VALUES
(13, 'BAHASA INDONESIA'),
(14, 'BAHASA ARAB'),
(15, 'FISIKA'),
(16, 'KIMIA'),
(17, 'BAHASA INGGRIS'),
(18, 'PEMELIHARAAN SASIS DAN PEMINDAH TENAGA KENDARAAN RINGAN (PSP'),
(19, 'PEMELIHARAAN MESIN KENDARAAN RINGAN (PMKR)'),
(20, 'PEMELIHARAAN KELISTRIKAN KENDARAAN RINGAN (PKKR)'),
(21, 'ASWAJA'),
(22, 'PENDIDIKAN KEWIRAUSAHAAN (PKWU)'),
(23, 'PENDIDIKAN AGAMA ISLAM (PAI)'),
(24, 'PENDIDIKAN JASMANI OLAHRAGA DAN KESEHATAN (PJOK)'),
(25, 'GAMBAR TEKNIK OTOMOTIF (GTO)'),
(26, 'TEKNIK DASAR OTOMOTIF (TDO)'),
(27, 'PEKERJAAN DASAR TEKNIK OTOMOTIF (PDTO)'),
(28, 'TEKNOLOGI JARINGAN BERBASIS LUAS (TJBL)'),
(29, 'ADMINISTRASI INFRASTUKTUR JARINGAN (AIJ)'),
(30, 'ADMINISTRASI SERVER JARINGAN (ASJ)'),
(31, 'TEKNOLOGI LAYANAN JARINGAN (TLJ)'),
(32, 'PENDIDIKAN KEWARGANEGARAAN (PPKn)'),
(33, 'MATEMATIKA'),
(34, 'SEJARAH INDONESIA'),
(35, 'SENI BUDAYA'),
(36, 'SISTEM KOMPUTER'),
(37, 'DASAR DESAIN GRAFIS (DDG)'),
(38, 'KOMPUTER JARINGAN DASAR (KJD)'),
(39, 'PEMOGRAMAN DASAR (PD)'),
(40, 'SIMULASI DAN KOMUNIKASI DIGITAL (SIMDIG)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master_semester`
--

CREATE TABLE `tb_master_semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_master_semester`
--

INSERT INTO `tb_master_semester` (`id_semester`, `semester`) VALUES
(5, 'Semester 1'),
(6, 'Semester 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_materi`
--

CREATE TABLE `tb_materi` (
  `id_materi` int(11) NOT NULL,
  `judul_materi` varchar(120) NOT NULL,
  `materi` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_entry` date NOT NULL,
  `id_roleguru` int(11) NOT NULL,
  `public` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_perangkat`
--

CREATE TABLE `tb_perangkat` (
  `id_perangkat` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `isi_perangkat` text NOT NULL,
  `id_jenisperangkat` int(11) NOT NULL,
  `tgl_entry` date NOT NULL,
  `publish` int(11) NOT NULL,
  `id_roleguru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_roleguru`
--

CREATE TABLE `tb_roleguru` (
  `id_roleguru` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_roleguru`
--

INSERT INTO `tb_roleguru` (`id_roleguru`, `id_guru`, `id_kelas`, `id_mapel`, `id_semester`, `id_jurusan`) VALUES
(9, 17, 14, 13, 5, 9),
(10, 17, 15, 13, 5, 10),
(11, 17, 16, 13, 5, 9),
(12, 17, 17, 13, 5, 10),
(13, 17, 18, 13, 5, 9),
(14, 17, 19, 13, 5, 10),
(15, 18, 14, 17, 5, 9),
(16, 18, 15, 17, 5, 10),
(17, 18, 16, 17, 5, 9),
(18, 18, 17, 17, 5, 10),
(19, 18, 18, 17, 5, 9),
(20, 18, 19, 17, 5, 10),
(21, 19, 14, 21, 5, 9),
(22, 19, 15, 21, 5, 10),
(23, 19, 16, 21, 5, 9),
(24, 19, 17, 21, 5, 10),
(25, 19, 18, 21, 5, 9),
(26, 19, 19, 21, 5, 10),
(27, 30, 14, 33, 5, 9),
(28, 30, 15, 33, 5, 10),
(29, 30, 16, 33, 5, 9),
(30, 30, 17, 33, 5, 10),
(31, 30, 18, 33, 5, 9),
(32, 30, 19, 33, 5, 10),
(33, 31, 14, 23, 5, 9),
(34, 31, 15, 23, 5, 10),
(35, 31, 18, 23, 5, 9),
(36, 31, 19, 23, 5, 10),
(37, 22, 16, 23, 5, 9),
(38, 22, 17, 23, 5, 10),
(39, 20, 14, 14, 5, 9),
(40, 20, 15, 14, 5, 10),
(41, 20, 16, 14, 5, 9),
(42, 20, 17, 14, 5, 10),
(43, 20, 18, 14, 5, 9),
(44, 20, 19, 14, 5, 10),
(45, 21, 17, 22, 5, 10),
(46, 21, 19, 18, 5, 10),
(47, 21, 19, 19, 5, 10),
(48, 21, 19, 20, 5, 10),
(49, 23, 14, 16, 5, 9),
(50, 23, 15, 16, 5, 10),
(51, 24, 14, 24, 5, 9),
(52, 24, 15, 24, 5, 10),
(53, 24, 16, 24, 5, 9),
(54, 24, 17, 24, 5, 10),
(55, 25, 15, 25, 5, 10),
(56, 25, 15, 26, 5, 10),
(57, 25, 15, 27, 5, 10),
(58, 25, 14, 15, 5, 9),
(59, 25, 15, 15, 5, 10),
(60, 25, 17, 18, 5, 10),
(61, 25, 17, 19, 5, 10),
(62, 25, 17, 20, 5, 10),
(63, 26, 16, 28, 5, 9),
(64, 26, 16, 29, 5, 9),
(65, 26, 16, 30, 5, 9),
(66, 26, 16, 31, 5, 9),
(67, 26, 18, 29, 5, 9),
(68, 26, 18, 30, 5, 9),
(69, 26, 18, 31, 5, 9),
(70, 28, 18, 22, 5, 9),
(71, 28, 19, 22, 5, 10),
(72, 29, 14, 32, 5, 9),
(73, 29, 15, 32, 5, 10),
(74, 29, 16, 32, 5, 9),
(75, 29, 17, 32, 5, 10),
(76, 29, 18, 32, 5, 9),
(77, 29, 19, 32, 5, 10),
(78, 32, 14, 34, 5, 9),
(79, 32, 15, 34, 5, 10),
(80, 34, 14, 36, 5, 9),
(81, 34, 14, 37, 5, 9),
(82, 34, 14, 38, 5, 9),
(83, 34, 14, 39, 5, 9),
(84, 34, 14, 40, 5, 9),
(85, 34, 15, 40, 5, 10),
(86, 35, 19, 39, 6, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sekolah`
--

CREATE TABLE `tb_sekolah` (
  `id_sekolah` int(11) NOT NULL,
  `nama_sekolah` varchar(120) NOT NULL,
  `kepsek` varchar(120) NOT NULL,
  `textlogo` varchar(10) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `copyright` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_sekolah`
--

INSERT INTO `tb_sekolah` (`id_sekolah`, `nama_sekolah`, `kepsek`, `textlogo`, `logo`, `copyright`) VALUES
(1, 'SMK NAHDLATUL ULAMA LOSARANG', 'AGUNG ROHMADI, S.Pd.', 'e-learning', 'logo.png', ' Copyright ï¿½ 2022 <b>SMK NAHDLATUL ULAMA LOSARANG</b>. All rights reserved');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nama_siswa` varchar(120) NOT NULL,
  `jk` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL,
  `aktif` varchar(30) NOT NULL,
  `tingkat` varchar(20) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `jk`, `password`, `status`, `aktif`, `tingkat`, `foto`, `id_kelas`, `id_jurusan`, `confirm`) VALUES
(26, '123', 'Budi', 'L', '30a96cdbc1205b1ed4ae399350fe8f6d839f32cc', 'off', 'N', '0', 'default.png', 0, 0, 'No'),
(27, '12345', 'Budi', 'L', '8cb2237d0679ca88db6464eac60da96345513964', 'Online', 'Y', '0', '1643171139-Koala.jpg', 13, 8, 'Yes'),
(28, '123456789', 'Nugraha', 'L', '8cb2237d0679ca88db6464eac60da96345513964', 'off', 'Y', '0', 'default.png', 13, 8, 'Yes'),
(32, '222310001', 'DIANA SAFITRI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 14, 9, 'Yes'),
(33, '222310002', 'HABIBATUL AHYA', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 14, 9, 'Yes'),
(34, '222310003', 'INDAH AYU LESTARI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 14, 9, 'Yes'),
(35, '222310004', 'INTAN NURLIANA WIJAYA', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 14, 9, 'Yes'),
(36, '222310005', 'LIA WAHYUNI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 14, 9, 'Yes'),
(37, '222310018', 'NOVALDI ERMAWAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 14, 9, 'Yes'),
(38, '222310006', 'ROONEY AINUN NISSAH', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 14, 9, 'Yes'),
(39, '222310007', 'AHMAD BAHTIAR', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(40, '222310008', 'AHMAD ZAKARIA NURUL FAUZAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(41, '222310009', 'ALDI AHMAD SUSANTO', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(42, '222310011', 'AWAL RAMADHANI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(43, '222310012', 'HAPID MARUP', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(44, '222310013', 'JIDAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(45, '222310015', 'MOHAMMAD IKHWAN NURKAHFI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(46, '222310016', 'MAULANA ROSADI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(47, '222310017', 'MOHAMMAD HASAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(48, '222310019', 'RIFKI FAISAL', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(49, '222310020', 'RIKI RIANSYAH', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(50, '222310022', 'SISWANTO', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(51, '222310023', 'FIQIH NURROKHMAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 15, 10, 'Yes'),
(52, '212210001', 'ADZRA MAHDIYAH', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 16, 9, 'Yes'),
(53, '212210002', 'DONI SAPUTRA', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 16, 9, 'Yes'),
(54, '212210003', 'HERWIN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 16, 9, 'Yes'),
(55, '212210004', 'LEIXSA SILVIANA BALKIS', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 16, 9, 'Yes'),
(56, '212210005', 'RATU NUZULUNA AZZAHRA', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 16, 9, 'Yes'),
(57, '212210006', 'VRENCITA SALSA AMILIANTI PUTRI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 16, 9, 'Yes'),
(58, '212210020', 'DIVA SADINI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 16, 9, 'Yes'),
(59, '212210007', 'AHMAD ROHIM', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(60, '212210008', 'IBNU AQIL', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(61, '212210009', 'JAMALUDIN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(62, '212210010', 'MUHAMAD FAUJI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(63, '212210011', 'RIZKI HADI PRATAMA', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(64, '212210012', 'ABDUL AZIZ', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(65, '212210013', 'MUHAMMAD IQBAL MAULANA', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(66, '212210014', 'MUHAMMAD KRISNA RAMDHANI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(67, '212210015', 'MUHAMMAD NUR PADILAH', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(68, '212210016', 'SUGIARTO', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(69, '212210017', 'TIO ALAMSYAH', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(70, '212210018', 'RIZKI SYABANI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(71, '212210019', 'AKHMAD SILMI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 17, 10, 'Yes'),
(72, '202110001', 'AAN ANIYAH SHOLEHA', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(73, '202110002', 'AISYAH DWI ANJANI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(74, '202110003', 'CUCUN NOVITA', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(75, '202110004', 'DWI PUTRI NATALIA', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(76, '202110006', 'KIKI KOMALASARI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(77, '202110008', 'MUNTHIHA', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(78, '202110009', 'NABILA PUTRI AGUSTINA', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(79, '202110011', 'ROHENI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(80, '202110012', 'SUCI MUTHOHAROH', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(81, '202110013', 'TRI CIPTA MEGA LESTARI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(82, '202110014', 'IRFAN NUR ROHMAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(83, '202110015', 'DIMAS ISNAENI SAE PUTRA', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(84, '202110016', 'IMADA JULIENDI NIDAR', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(85, '202110017', 'YUSUF RAMADHANI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(86, '202110018', 'DITA SAFITRI', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(87, '202110019', 'KHOERUNNISA', 'P', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(88, '202110020', 'AHMAD FAJAR JUWANDA', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(89, '202110021', 'AHMAD ISMAIL', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(90, '202110022', 'AHMAD RIFAI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(91, '202110023', 'ALI NURDIN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(92, '202110024', 'DIYAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(93, '202110025', 'DONI SETIAWAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(94, '202110026', 'MOHAMMAD IQYA SAPUTRA', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(95, '202110027', 'MUHAMMAD RAVI ALBAHQORI', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(96, '202110028', 'MUHAMMAD JUAN FARHAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(97, '202110029', 'ADRIYAN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 19, 10, 'Yes'),
(98, '123456789', 'ADMIN', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'off', 'Y', '0', 'default.png', 14, 9, 'Yes'),
(99, '12345678910', 'febri', 'L', '9048ead9080d9b27d6b2b6ed363cbf8cce795f7f', 'off', 'Y', '0', NULL, 18, 9, 'Yes'),
(100, '12345678910', 'febrinur', 'L', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'off', 'Y', '0', 'default.png', 18, 9, 'Yes'),
(101, '12345678910', 'siswa1', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'Online', 'Y', '0', 'default.png', 19, 9, 'Yes'),
(102, '12345678911', 'siswa2', 'L', '7c222fb2927d828af22f592134e8932480637c0d', 'selesai', 'Y', '0', 'default.png', 19, 9, 'Yes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tugas`
--

CREATE TABLE `tb_tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_jenistugas` int(11) NOT NULL,
  `judul_tugas` varchar(100) NOT NULL,
  `isi_tugas` text NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` int(11) NOT NULL,
  `jml_anggota` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_tugas`
--

INSERT INTO `tb_tugas` (`id_tugas`, `id_jenistugas`, `judul_tugas`, `isi_tugas`, `tanggal`, `waktu`, `jml_anggota`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(10, 1, 'abc', '<p>ahahahah</p>\r\n', '2023-03-24', 1, 0, 35, 39, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas_siswa`
--

CREATE TABLE `tugas_siswa` (
  `id_tgssiswa` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `subjek` varchar(120) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kelompok` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(30) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_upload` date NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tugas_siswa`
--

INSERT INTO `tugas_siswa` (`id_tgssiswa`, `id_tugas`, `subjek`, `id_siswa`, `kelompok`, `nama_file`, `tipe_file`, `ukuran_file`, `file`, `tgl_upload`, `ket`) VALUES
(5, 10, ' Subjek', 101, '', '1679642767', 'pdf', '57406', '../vendor/file/tugasTUGAS-INDIVIDU_1679642767.pdf', '2023-03-24', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `jml_soal` int(11) NOT NULL,
  `acak` varchar(100) NOT NULL,
  `tipe` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `tanggal`, `waktu`, `jml_soal`, `acak`, `tipe`, `id_jenis`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(15, 'PAS BAHASA INDONESIA X', '2022-12-05', '01:00:00', 40, 'acak', 0, 4, 17, 13, 5),
(16, 'BAHASA INGGRIS X', '2022-12-06', '01:00:00', 35, 'acak', 0, 4, 18, 17, 5),
(18, 'PAS TJBL XI 2022', '2022-12-06', '01:00:00', 40, 'acak', 0, 4, 26, 28, 5),
(19, 'PAS PAI XI 2022', '2022-12-05', '01:30:00', 40, 'acak', 0, 4, 22, 23, 5),
(20, 'PAS MATEMATIKA XII 2022', '2022-12-02', '01:30:00', 35, 'acak', 0, 4, 30, 33, 5),
(21, 'PAS MATEMATIKA X 2022', '2022-12-05', '01:30:00', 30, 'acak', 0, 4, 30, 33, 5),
(22, 'Ini Ujian', '2023-03-25', '01:00:00', 5, 'acak', 0, 4, 35, 39, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian_essay`
--

CREATE TABLE `ujian_essay` (
  `id_ujianessay` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jml_soal` int(11) NOT NULL,
  `soal_essay` text NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `analisis`
--
ALTER TABLE `analisis`
  ADD PRIMARY KEY (`id_analisis`);

--
-- Indeks untuk tabel `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  ADD PRIMARY KEY (`id_klstugas`);

--
-- Indeks untuk tabel `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  ADD PRIMARY KEY (`id_klsujian`);

--
-- Indeks untuk tabel `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  ADD PRIMARY KEY (`id_klsessay`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  ADD PRIMARY KEY (`id_jenisperangkat`);

--
-- Indeks untuk tabel `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  ADD PRIMARY KEY (`id_jenistugas`);

--
-- Indeks untuk tabel `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indeks untuk tabel `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indeks untuk tabel `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD PRIMARY KEY (`id_perangkat`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indeks untuk tabel `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD PRIMARY KEY (`id_roleguru`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_semester` (`id_semester`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_tugas`
--
ALTER TABLE `tb_tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indeks untuk tabel `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  ADD PRIMARY KEY (`id_tgssiswa`);

--
-- Indeks untuk tabel `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- Indeks untuk tabel `ujian_essay`
--
ALTER TABLE `ujian_essay`
  ADD PRIMARY KEY (`id_ujianessay`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `analisis`
--
ALTER TABLE `analisis`
  MODIFY `id_analisis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  MODIFY `id_klstugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  MODIFY `id_klsujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  MODIFY `id_klsessay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  MODIFY `id_jenisperangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  MODIFY `id_jenistugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_materi`
--
ALTER TABLE `tb_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  MODIFY `id_perangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  MODIFY `id_roleguru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT untuk tabel `tb_tugas`
--
ALTER TABLE `tb_tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  MODIFY `id_tgssiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `ujian_essay`
--
ALTER TABLE `ujian_essay`
  MODIFY `id_ujianessay` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD CONSTRAINT `tb_materi_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD CONSTRAINT `tb_perangkat_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD CONSTRAINT `tb_roleguru_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_master_jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `tb_master_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_4` FOREIGN KEY (`id_mapel`) REFERENCES `tb_master_mapel` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_5` FOREIGN KEY (`id_semester`) REFERENCES `tb_master_semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
