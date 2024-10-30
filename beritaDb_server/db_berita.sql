-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 30 Okt 2024 pada 13.53
-- Versi server: 8.0.30
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_berita`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int NOT NULL,
  `judul` varchar(250) NOT NULL,
  `isi_berita` text NOT NULL,
  `gambar_berita` varchar(100) NOT NULL,
  `tgl_berita` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `judul`, `isi_berita`, `gambar_berita`, `tgl_berita`) VALUES
(1, 'Doa Lailatul Qadar Sesuai Sunnah yang Diajarkan Rasulullah', 'Doa lailatul qadar merupakan doa yang dibaca pada malam lailatul qadar, tepatnya sepuluh malam terakhir di bulan Ramadan. Rasulullah SAW sendiri dalam keterangan haditsnya menganjurkan pengerjaannya,\r\nArtinya: \"Barang siapa yang pada malam lailatul qadar mengerjakan ibadah dan berdoa dengan penuh keimanan yang dipersembahkan semata-mata untuk Allah, akan diampuni dari segala dosanya yang terdahulu dan yang akan datang,\" (HR Ahmad dan Thabrani).\r\n\r\nDi samping itu, malam lailatul qadar mengandung keutamaan di mana pada malam tersebut turun malaikat-malaikat ke bumi untuk mengatur segala urusan. Hal ini dijelaskan dalam surat Al Qadar ayat 3-5,\r\n\r\n(3) لَيْلَةُ الْقَدْرِ خَيْرٌ مِنْ أَلْفِ شَهْرٍ\r\n(4) تَنَزَّلُ الْمَلَائِكَةُ وَالرُّوحُ فِيهَا بِإِذْنِ رَبِّهِمْ مِنْ كُلِّ أَمْرٍ\r\n(5) سَلَامٌ هِيَ حَتَّىٰ مَطْلَعِ الْفَجْرِ\r\n\r\nArtinya: \"Malam kemuliaan itu lebih baik dari seribu bulan. Pada malam itu turun malaikat-malaikat dan malaikat Jibril dengan izin Tuhannya untuk mengatur segala urusan. Malam itu (penuh) kesejahteraan sampai terbit fajar,\"\r\n\r\nSebab itulah, kemuliaan lailatul qadar juga termasuk dalam waktu mustajab doa yang dikabulkan. Sebagaimana diungkap oleh Imam As Syaukain dalam Kitab Tuhfatud Dzakirin yang dikutip dari Induk Doa & Dzikir Terlengkap karya Nasrullah.\r\n\r\nAdapun bacaan doa lailatul qadar sesuai sunnah dapat dinukil dari bacaan yang pernah diajarkan oleh Rasulullah SAW. Doa lailatul qadar mengusung permohonan agar mendapat keselamatan dunia dan akhirat.\r\n\r\nDoa yang dimaksudkan adalah doa lailatul qadar yang diriwayatkan oleh Imam Tirmidzi, Imam Nasa\'i, dan Imam Ibnu Majah dalam Kitab Riyadhus Shalihin oleh Imam an-Nawawi. Dalam hadits tersebut, istri Rasulullah SAW Aisyah RA berkata,\r\n\r\nيَا رَسُولَ اللَّهِ أَرَأَيْتَ إِنْ عَلِمْتُ أَىُّ لَيْلَةٍ لَيْلَةُ الْقَدْرِ مَا أَقُولُ فِيهَا قَالَ قُولِى اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّى اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّي\r\n\r\nArtinya: \"Wahai Rasulullah, bagaimana bila aku mengetahui malam Lailatul Qadar, apa yang harus aku ucapkan?\" Beliau (Rasulullah SAW) menjawab, \"Ucapkanlah, Allahumma innaka \'afuwwun tuhibbul \'afwa fa\'fu \'anni (Ya, Allah sesungguhnya Engkau Maha Pemaaf, dan suka memberi maaf, maka maafkanlah aku),\'\" (HR Tirmidzi)', 'doa_lailatul_qadar.jpeg', '2022-08-10 10:38:33'),
(2, 'Jadwal Imsak dan Buka Puasa Wilayah Bali Hari Ini, 19 April 2022', 'Ramadan memasuki hari ke-17, pada Selasa 19 April 2022 hari ini. Kementerian Agama (Kemenag) RI merilis jadwal imsak di seluruh Indonesia, termasuk wilayah Bali dan sekitarnya.\r\nJadwal imsak berguna supaya Anda tidak terlambat melaksanakan kegiatan sahur dan buka puasa selama bulan Ramadan.\r\n\r\nBerikut informasi selengkapnya terkait jadwal imsak di 9 kabupaten/kota di Bali hari ini.\r\n\r\nSelanjutnya, jadwal buka puasa untuk wilayah 9 wilayah (kabupaten/kota) di Bali, merujuk situs resmi Bimas Islam Kementerian Agama (bimasislam.kemenag.go.id):\r\n\r\nKota Denpasar\r\nImsak: 04.56 WITA\r\nSubuh: 05.06 WITA\r\nMagrib: 18.18 WITA\r\n\r\nKabupaten Badung\r\nImsak: 04.56 WITA\r\nSubuh: 05.06 WITA\r\nMagrib: 18.19 WITA\r\n\r\nKabupaten Buleleng\r\nImsak: 04.56 WITA\r\nSubuh: 05.06 WITA\r\nMagrib: 18.19 WITA\r\n\r\nKabupaten Gianyar\r\nImsak: 04.55 WITA\r\nSubuh: 05.05 WITA\r\nMagrib: 18.18 WITA\r\n\r\nKabupaten Bangli\r\nImsak: 04.55 WITA\r\nSubuh:05.05 WITA\r\nMagrib: 18.18 WITA\r\n\r\nKabupaten Jembrana\r\nImsak: 04.58 WITA\r\nSubuh:05.08 WITA\r\nMagrib: 18.21 WITA\r\n\r\nKabupaten Karangasem\r\nImsak: 04.54 WITA\r\nSubuh: 05.04 WITA\r\nMagrib: 18.17 WITA\r\n\r\nKabupaten Klungkung\r\nImsak: 04.55 WITA\r\nSubuh: 05.05 WITA\r\nMagrib: 18.18 WITA\r\n\r\nKabupaten Tabanan\r\nImsak: 04.56 WITA\r\nSubuh:05.06 WITA\r\nMagrib: 18.19 WITA', 'jadwal_imsak.png', '2022-04-20 05:44:03'),
(3, 'Niat Membayar Zakat Fitrah untuk Diri Sendiri, Perlu Diucapkan?', 'Niat membayar zakat fitrah untuk diri sendiri atau pun keluarga termasuk dalam bagian syarat terlaksananya zakat fitrah. Hal ini disebutkan oleh Imam Ghazali yang dirangkum dalam Ringkasan Ihya Ulumuddin karya Abdul Rosyad Siddiq.\r\n\"Syarat (zakat fitrah) yang pertama adalah niat dalam hati untuk mengeluarkan zakat fitrah. Niat atas orang yang hilang ingatan maupun anak kecil bisa diwakili oleh walinya,\" tulis buku tersebut.\r\n\r\nDitambah lagi, zakat fitrah adalah amalan yang wajib ditunaikan bagi muslim yang mampu pada bulan Ramadan, khususnya menjelang Idul Fitri. Besaran zakat fitrah setiap orang yakni sebesar satu sha\' atau sekitar 2,5 kilogram makanan pokok.\r\n\r\nعَنِ اِبْنِ عُمَرَ رَضِيَ اَللَّهُ عَنْهُمَا قَالَ: - فَرَضَ رَسُولُ اَللَّهِ - صلى الله عليه وسلم - زَكَاةَ اَلْفِطْرِ, صَاعًا مِنْ تَمْرٍ, أَوْ صَاعًا مِنْ شَعِيرٍ: عَلَى اَلْعَبْدِ وَالْحُرِّ, وَالذَّكَرِ, وَالْأُنْثَى, وَالصَّغِيرِ, وَالْكَبِيرِ, مِنَ اَلْمُسْلِمِينَ, وَأَمَرَ بِهَا أَنْ تُؤَدَّى قَبْلَ خُرُوجِ اَلنَّاسِ إِلَى اَلصَّلَاةِ - مُتَّفَقٌ عَلَيْه\r\n\r\nArtinya: \"Dari Ibnu Umar RA, ia berkata bahwa Rasulullah SAW mewajibkan zakat fitrah sebanyak satu sha\' kurma atau satu sha\' gandum bagi setiap budak, orang merdeka, laki-laki, perempuan, anak-anak, dewasa dari kalangan muslimin. Rasulullah SAW memerintahkan pembayarannya sebelum orang-orang keluar rumah untuk salat Id,\" (HR Bukhari dan Muslim).\r\n\r\nUntuk itu, sudah menjadi kewajiban muslim memahami tata cara pelaksanaan zakat fitrag termasuk dengan memahami bacaan niat membayar zakat fitrah untuk diri sendiri atau pun keluarga. Berikut bacaannya.\r\n', 'niat_zakat.jpeg', '2022-04-20 05:45:20'),
(4, 'Terlambat Jadwal Imunisasi Anak, Bolehkah Imunisasi Rapel?', 'Meskipun cakupan vaksinasi dan booster covid-19 masih digalakkan, namun ini tak berarti orangtua bisa melupakan imunisasi wajib untuk anak-anak.\r\nNamun bagaimana kalau ternyata ada beberapa imunisasi yang terlambat? Bolehkah imunisasi anak ini dirapel alias suntik ganda?\r\n\r\nNyatanya hal ini diperbolehkan bahkan disarankan oleh ahli. Untuk meningkatkan cakupan imunisasi yang tertinggal, ahli menyarankan agar anak bisa diberi vaksin kombinasi atau suntikan ganda. Langkah ini pun dinilai tidak berbahaya.\r\n\r\n\r\nProfesor, dokter anak, dan Ketua Komite Penasehat Ahli Imunisasi Nasional (ITAGI) Sri Rezeki Hadinegoro, mengatakan vaksin kombinasi atau suntikan ganda berguna untuk mempercepat jadwal imunisasi yang sudah tertinggal.\r\n\r\n\"Imunisasi ganda itu pemberian secara bersama-sama. Ini sudah lama dipakai di luar negeri, WHO mengatakan sudah lama memberikan suntikan seperti ini di negara maju dan berkembang,\" ujarnya dikutip dari Antara.\r\n\r\nVaksin kombinasi terdiri lebih dari satu antigen dalam satu kemasan, misalnya DPT-HepB-Hib, MR, OPV. Pemberian vaksin ganda sangat aman, efektif dan efisien serta sudah dilakukan oleh negara-negara lain.\r\n', 'imunisasi.jpeg', '2022-04-20 05:47:11'),
(5, 'Niat Membayar Zakat Fitrah untuk Diri Sendiri, Perlu Diucapkan?', 'Niat membayar zakat fitrah untuk diri sendiri atau pun keluarga termasuk dalam bagian syarat terlaksananya zakat fitrah. Hal ini disebutkan oleh Imam Ghazali yang dirangkum dalam Ringkasan Ihya Ulumuddin karya Abdul Rosyad Siddiq.\r\n\"Syarat (zakat fitrah) yang pertama adalah niat dalam hati untuk mengeluarkan zakat fitrah. Niat atas orang yang hilang ingatan maupun anak kecil bisa diwakili oleh walinya,\" tulis buku tersebut.\r\n\r\nDitambah lagi, zakat fitrah adalah amalan yang wajib ditunaikan bagi muslim yang mampu pada bulan Ramadan, khususnya menjelang Idul Fitri. Besaran zakat fitrah setiap orang yakni sebesar satu sha\' atau sekitar 2,5 kilogram makanan pokok.\r\n\r\nعَنِ اِبْنِ عُمَرَ رَضِيَ اَللَّهُ عَنْهُمَا قَالَ: - فَرَضَ رَسُولُ اَللَّهِ - صلى الله عليه وسلم - زَكَاةَ اَلْفِطْرِ, صَاعًا مِنْ تَمْرٍ, أَوْ صَاعًا مِنْ شَعِيرٍ: عَلَى اَلْعَبْدِ وَالْحُرِّ, وَالذَّكَرِ, وَالْأُنْثَى, وَالصَّغِيرِ, وَالْكَبِيرِ, مِنَ اَلْمُسْلِمِينَ, وَأَمَرَ بِهَا أَنْ تُؤَدَّى قَبْلَ خُرُوجِ اَلنَّاسِ إِلَى اَلصَّلَاةِ - مُتَّفَقٌ عَلَيْه\r\n\r\nArtinya: \"Dari Ibnu Umar RA, ia berkata bahwa Rasulullah SAW mewajibkan zakat fitrah sebanyak satu sha\' kurma atau satu sha\' gandum bagi setiap budak, orang merdeka, laki-laki, perempuan, anak-anak, dewasa dari kalangan muslimin. Rasulullah SAW memerintahkan pembayarannya sebelum orang-orang keluar rumah untuk salat Id,\" (HR Bukhari dan Muslim).\r\n\r\nUntuk itu, sudah menjadi kewajiban muslim memahami tata cara pelaksanaan zakat fitrag termasuk dengan memahami bacaan niat membayar zakat fitrah untuk diri sendiri atau pun keluarga. Berikut bacaannya.\r\n', 'vaksinasi.jpeg', '2022-04-20 05:45:20'),
(6, 'Diego Simeone Jadi Inspirasi Pol Espargaro Terkait Kontrak Baru', 'Masa depan Pol Espargaro di Repsol Honda menjadi tanda tanya. Rider Spanyol itu menyinggung-nyinggung Diego Simeone saat membahas nasib di Honda.\r\nKontrak Pol Espargaro di Honda akan selesai pada akhir musim ini. Pebalap 30 tahun itu masih belum mendapat tawaran kontrak baru.\r\n\r\nBelakangan ini, Honda juga dikaitkan dengan pebalap asal Prancis, Fabio Quartararo. El Diablo juga belum memperpanjang kontrak dengan Yamaha.\r\n', 'diego.jpeg', '2022-04-20 05:53:56'),
(7, 'Top Skor Liga Inggris: Siapa Bisa Kejar Mohamed Salah?', 'Mohamed Salah menambah pundi-pundi golnya musim ini saat Liverpool mencukur Manchester United. Salah bertengger dengan nyaman di puncak daftar top skor Liga Inggris.\r\nMo Salah mencetak dua gol saat Liverpool menang telak 4-0 atas Man United di Anfield, Rabu (20/4) dini hari WIB. Pemain asal Mesir itu mencetak gol kedua dan keempat si Merah atas Setan Merah.\r\n\r\nDengan aksi teranyarnya tersebut, Mohamed Salah mencatatkan sebuah rekor baru. Opta mendaulatnya sebagai pemain pertama yang mencetak lima gol lawan Manchester United dalam satu musim Premier League.\r\n', 'mohammed_salah.jpeg', '2022-04-20 05:55:52'),
(8, 'Diego Simeone Jadi Inspirasi Pol Espargaro Terkait Kontrak Baru', 'Masa depan Pol Espargaro di Repsol Honda menjadi tanda tanya. Rider Spanyol itu menyinggung-nyinggung Diego Simeone saat membahas nasib di Honda.\r\nKontrak Pol Espargaro di Honda akan selesai pada akhir musim ini. Pebalap 30 tahun itu masih belum mendapat tawaran kontrak baru.\r\n\r\nBelakangan ini, Honda juga dikaitkan dengan pebalap asal Prancis, Fabio Quartararo. El Diablo juga belum memperpanjang kontrak dengan Yamaha.\r\n', 'diego.jpeg', '2022-04-20 05:53:56'),
(9, 'Terlambat Jadwal Imunisasi Anak, Bolehkah Imunisasi Rapel?', 'Meskipun cakupan vaksinasi dan booster covid-19 masih digalakkan, namun ini tak berarti orangtua bisa melupakan imunisasi wajib untuk anak-anak.\r\nNamun bagaimana kalau ternyata ada beberapa imunisasi yang terlambat? Bolehkah imunisasi anak ini dirapel alias suntik ganda?\r\n\r\nNyatanya hal ini diperbolehkan bahkan disarankan oleh ahli. Untuk meningkatkan cakupan imunisasi yang tertinggal, ahli menyarankan agar anak bisa diberi vaksin kombinasi atau suntikan ganda. Langkah ini pun dinilai tidak berbahaya.\r\n\r\n\r\nProfesor, dokter anak, dan Ketua Komite Penasehat Ahli Imunisasi Nasional (ITAGI) Sri Rezeki Hadinegoro, mengatakan vaksin kombinasi atau suntikan ganda berguna untuk mempercepat jadwal imunisasi yang sudah tertinggal.\r\n\r\n\"Imunisasi ganda itu pemberian secara bersama-sama. Ini sudah lama dipakai di luar negeri, WHO mengatakan sudah lama memberikan suntikan seperti ini di negara maju dan berkembang,\" ujarnya dikutip dari Antara.\r\n\r\nVaksin kombinasi terdiri lebih dari satu antigen dalam satu kemasan, misalnya DPT-HepB-Hib, MR, OPV. Pemberian vaksin ganda sangat aman, efektif dan efisien serta sudah dilakukan oleh negara-negara lain.\r\n', 'imunisasi.jpeg', '2022-04-20 05:47:11'),
(10, 'Doa Lailatul Qadar Sesuai Sunnah yang Diajarkan Rasulullah', 'Doa lailatul qadar merupakan doa yang dibaca pada malam lailatul qadar, tepatnya sepuluh malam terakhir di bulan Ramadan. Rasulullah SAW sendiri dalam keterangan haditsnya menganjurkan pengerjaannya,\r\nArtinya: \"Barang siapa yang pada malam lailatul qadar mengerjakan ibadah dan berdoa dengan penuh keimanan yang dipersembahkan semata-mata untuk Allah, akan diampuni dari segala dosanya yang terdahulu dan yang akan datang,\" (HR Ahmad dan Thabrani).\r\n\r\nDi samping itu, malam lailatul qadar mengandung keutamaan di mana pada malam tersebut turun malaikat-malaikat ke bumi untuk mengatur segala urusan. Hal ini dijelaskan dalam surat Al Qadar ayat 3-5,\r\n\r\n(3) لَيْلَةُ الْقَدْرِ خَيْرٌ مِنْ أَلْفِ شَهْرٍ\r\n(4) تَنَزَّلُ الْمَلَائِكَةُ وَالرُّوحُ فِيهَا بِإِذْنِ رَبِّهِمْ مِنْ كُلِّ أَمْرٍ\r\n(5) سَلَامٌ هِيَ حَتَّىٰ مَطْلَعِ الْفَجْرِ\r\n\r\nArtinya: \"Malam kemuliaan itu lebih baik dari seribu bulan. Pada malam itu turun malaikat-malaikat dan malaikat Jibril dengan izin Tuhannya untuk mengatur segala urusan. Malam itu (penuh) kesejahteraan sampai terbit fajar,\"\r\n\r\nSebab itulah, kemuliaan lailatul qadar juga termasuk dalam waktu mustajab doa yang dikabulkan. Sebagaimana diungkap oleh Imam As Syaukain dalam Kitab Tuhfatud Dzakirin yang dikutip dari Induk Doa & Dzikir Terlengkap karya Nasrullah.\r\n\r\nAdapun bacaan doa lailatul qadar sesuai sunnah dapat dinukil dari bacaan yang pernah diajarkan oleh Rasulullah SAW. Doa lailatul qadar mengusung permohonan agar mendapat keselamatan dunia dan akhirat.\r\n\r\nDoa yang dimaksudkan adalah doa lailatul qadar yang diriwayatkan oleh Imam Tirmidzi, Imam Nasa\'i, dan Imam Ibnu Majah dalam Kitab Riyadhus Shalihin oleh Imam an-Nawawi. Dalam hadits tersebut, istri Rasulullah SAW Aisyah RA berkata,\r\n\r\nيَا رَسُولَ اللَّهِ أَرَأَيْتَ إِنْ عَلِمْتُ أَىُّ لَيْلَةٍ لَيْلَةُ الْقَدْرِ مَا أَقُولُ فِيهَا قَالَ قُولِى اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّى اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّي\r\n\r\nArtinya: \"Wahai Rasulullah, bagaimana bila aku mengetahui malam Lailatul Qadar, apa yang harus aku ucapkan?\" Beliau (Rasulullah SAW) menjawab, \"Ucapkanlah, Allahumma innaka \'afuwwun tuhibbul \'afwa fa\'fu \'anni (Ya, Allah sesungguhnya Engkau Maha Pemaaf, dan suka memberi maaf, maka maafkanlah aku),\'\" (HR Tirmidzi)', 'doa_lailatul_qadar.jpeg', '2022-04-20 10:38:33'),
(11, 'Doa Lailatul Qadar Sesuai Sunnah yang Diajarkan Rasulullah', 'Doa lailatul qadar merupakan doa yang dibaca pada malam lailatul qadar, tepatnya sepuluh malam terakhir di bulan Ramadan. Rasulullah SAW sendiri dalam keterangan haditsnya menganjurkan pengerjaannya,\r\nArtinya: \"Barang siapa yang pada malam lailatul qadar mengerjakan ibadah dan berdoa dengan penuh keimanan yang dipersembahkan semata-mata untuk Allah, akan diampuni dari segala dosanya yang terdahulu dan yang akan datang,\" (HR Ahmad dan Thabrani).\r\n\r\nDi samping itu, malam lailatul qadar mengandung keutamaan di mana pada malam tersebut turun malaikat-malaikat ke bumi untuk mengatur segala urusan. Hal ini dijelaskan dalam surat Al Qadar ayat 3-5,\r\n\r\n(3) لَيْلَةُ الْقَدْرِ خَيْرٌ مِنْ أَلْفِ شَهْرٍ\r\n(4) تَنَزَّلُ الْمَلَائِكَةُ وَالرُّوحُ فِيهَا بِإِذْنِ رَبِّهِمْ مِنْ كُلِّ أَمْرٍ\r\n(5) سَلَامٌ هِيَ حَتَّىٰ مَطْلَعِ الْفَجْرِ\r\n\r\nArtinya: \"Malam kemuliaan itu lebih baik dari seribu bulan. Pada malam itu turun malaikat-malaikat dan malaikat Jibril dengan izin Tuhannya untuk mengatur segala urusan. Malam itu (penuh) kesejahteraan sampai terbit fajar,\"\r\n\r\nSebab itulah, kemuliaan lailatul qadar juga termasuk dalam waktu mustajab doa yang dikabulkan. Sebagaimana diungkap oleh Imam As Syaukain dalam Kitab Tuhfatud Dzakirin yang dikutip dari Induk Doa & Dzikir Terlengkap karya Nasrullah.\r\n\r\nAdapun bacaan doa lailatul qadar sesuai sunnah dapat dinukil dari bacaan yang pernah diajarkan oleh Rasulullah SAW. Doa lailatul qadar mengusung permohonan agar mendapat keselamatan dunia dan akhirat.\r\n\r\nDoa yang dimaksudkan adalah doa lailatul qadar yang diriwayatkan oleh Imam Tirmidzi, Imam Nasa\'i, dan Imam Ibnu Majah dalam Kitab Riyadhus Shalihin oleh Imam an-Nawawi. Dalam hadits tersebut, istri Rasulullah SAW Aisyah RA berkata,\r\n\r\nيَا رَسُولَ اللَّهِ أَرَأَيْتَ إِنْ عَلِمْتُ أَىُّ لَيْلَةٍ لَيْلَةُ الْقَدْرِ مَا أَقُولُ فِيهَا قَالَ قُولِى اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّى اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّي\r\n\r\nArtinya: \"Wahai Rasulullah, bagaimana bila aku mengetahui malam Lailatul Qadar, apa yang harus aku ucapkan?\" Beliau (Rasulullah SAW) menjawab, \"Ucapkanlah, Allahumma innaka \'afuwwun tuhibbul \'afwa fa\'fu \'anni (Ya, Allah sesungguhnya Engkau Maha Pemaaf, dan suka memberi maaf, maka maafkanlah aku),\'\" (HR Tirmidzi)', 'doa_lailatul_qadar.jpeg', '2022-04-20 10:38:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_bp` int NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `no_bp`, `no_hp`, `email`, `tgl_input`) VALUES
(1, 'Yanti Putri sarah', 2111081009, '823456754', 'yanti@gmail.com', '2024-10-07'),
(2, 'salsabila wardah', 2111345689, '821908409', 'salsa@gmail.com', '2024-10-17'),
(6, 'Yaser Husein', 2111083045, '083212345', 'husein@gmail.com', '2024-10-29'),
(7, 'Messy udacoding', 2111081009, '087654321223', 'mesi@gmail.com', '2024-10-30'),
(8, 'Dinda Gatya Rabbani', 2111082019, '085432453421', 'dinda@gmail.com', '2024-10-30'),
(13, 'Iqbal Ramadan', 2111234567, '082134565432', 'putra@gmail.com', '2024-10-30'),
(14, 'messy udacoding', 2111081009, '082190840915', 'mesi@gmail.com', '2024-10-30'),
(15, 'iqbal muhakim', 2111083012, '082134567321', 'iqbal16@gmail.com', '2024-10-30'),
(18, 'fadli surya', 2111081122, '087654321234', 'fadli@gmail.com', '2024-10-30'),
(20, 'sarah salsabil', 2111098765, '082134567654', 'salsabil@gmail.com', '2024-10-30'),
(21, 'sarah putri cantika', 2111098754, '082134567123', 'salsabilaputri@gmail.com', '2024-10-30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `tgl_daftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullname`, `tgl_daftar`) VALUES
(1, 'yusmiPutra', 'udayusmi9@gmail.com', '4297f44b13955235245b2497399d7a93', 'Yusmi Putra', '2023-04-03 14:29:15'),
(2, 'testNama', 'test@gmail.com', '4297f44b13955235245b2497399d7a93', 'test', '2023-04-03 16:45:02'),
(4, 'messy ', 'mesiwirdianti@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Messy Wirdianti', '2024-10-29 14:04:04'),
(5, 'nadila', 'nadilawirdianti@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Nadila Wirdianti ', '2024-10-29 14:10:46'),
(6, 'dinda', 'dinda@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'dinda gatya rabbani', '2024-10-29 15:07:28'),
(8, 'wirdianti17', 'wirdianti@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Messy Wirdianti', '2024-10-30 09:21:30'),
(10, 'udacoding', 'udacoding@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'udacoding batam', '2024-10-30 09:57:34'),
(11, 'udacoding batam', 'uda@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'udacodingg', '2024-10-30 10:06:03'),
(12, 'wirdianti', 'messywirdianti@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '', '2024-10-30 16:24:30'),
(14, 'rizky', 'rizky@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'UDC rizky saputra ', '2024-10-30 20:08:24'),
(15, 'sarah', 'sarah@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'sarah cantika putri', '2024-10-30 20:15:20');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
