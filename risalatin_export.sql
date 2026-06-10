-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: safira_db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('16e46d69-ee2d-47e9-9820-3880e1a150aa','772db3b0c1bb887a229a950b20fd1eaeef9eca74a13ccd82435973b51a9cd797','2026-06-08 11:21:29.577','20260519000001_sirama_roles',NULL,NULL,'2026-06-08 11:21:28.887',1),('44a9324e-84b5-431c-8cc8-11e2ef09df20','1962b04ff0401a54ad245919d65afdf5c6de6d7594b8fcb4c9360b0ce98fd3d7','2026-06-08 11:21:28.845','20260519000000_init_mysql',NULL,NULL,'2026-06-08 11:21:26.066',1),('7cdd4ecf-806b-4cd2-9cb5-5cd2e580943b','18f5b948cdea270536025e1601bca8e0e037d6c4fe27d120688e31c4e5dbc676','2026-06-08 11:22:44.923','20260604000001_add_nuptk_user',NULL,NULL,'2026-06-08 11:22:44.676',1),('ab1d313a-a9ce-4987-a917-0cba5b7423a0','a48838e2916d3ecb34654bb08aeb11425c88dd9478d3faabfeca41fe0bc5b0b1','2026-06-08 11:22:44.563','20260602000000_add_kode_klasifikasi',NULL,NULL,'2026-06-08 11:22:44.549',1),('bea5b262-065c-41dd-87db-85c1644acedd','6c9b7a8e6fc4de0fa9c55aa30dc6b431bc7a9f85d68e98a749321575b2857d71','2026-06-08 11:22:44.654','20260604000000_add_template_surat',NULL,NULL,'2026-06-08 11:22:44.566',1),('f9f3b96e-6942-4a06-9d77-5d50b54d391c','60e656c7dc66aa030a60339851c1add6feae38f2bd7d4efa82a5b794810b0e2b','2026-06-08 13:29:16.951','20260608000000_add_nama_arab',NULL,NULL,'2026-06-08 13:29:16.736',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaAgenda` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penyelenggara` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` enum('MUSYAWARAH','RAPAT','PENGAJIAN','LAIN_LAIN') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RAPAT',
  `tipe` enum('LURING','DARING','HIBRID') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LURING',
  `tempat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` datetime(3) NOT NULL,
  `waktuMulai` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktuSelesai` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zonaWaktu` enum('WIB','WITA','WIT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'WIB',
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `qrToken` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembuatId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Agenda_qrToken_key` (`qrToken`),
  KEY `Agenda_pembuatId_fkey` (`pembuatId`),
  CONSTRAINT `Agenda_pembuatId_fkey` FOREIGN KEY (`pembuatId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disposisi`
--

DROP TABLE IF EXISTS `disposisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disposisi` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suratMasukId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dibuatOlehId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerimaId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instruksi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `sudahDibaca` tinyint(1) NOT NULL DEFAULT '0',
  `dibacaAt` datetime(3) DEFAULT NULL,
  `jawaban` text COLLATE utf8mb4_unicode_ci,
  `dijawabAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Disposisi_suratMasukId_fkey` (`suratMasukId`),
  KEY `Disposisi_dibuatOlehId_fkey` (`dibuatOlehId`),
  KEY `Disposisi_penerimaId_fkey` (`penerimaId`),
  CONSTRAINT `Disposisi_dibuatOlehId_fkey` FOREIGN KEY (`dibuatOlehId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Disposisi_penerimaId_fkey` FOREIGN KEY (`penerimaId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Disposisi_suratMasukId_fkey` FOREIGN KEY (`suratMasukId`) REFERENCES `suratmasuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disposisi`
--

LOCK TABLES `disposisi` WRITE;
/*!40000 ALTER TABLE `disposisi` DISABLE KEYS */;
/*!40000 ALTER TABLE `disposisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kehadiran`
--

DROP TABLE IF EXISTS `kehadiran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kehadiran` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agendaId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namaLengkap` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomorHp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instansi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metode` enum('APLIKASI','FORM') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'APLIKASI',
  `waktuHadir` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `Kehadiran_agendaId_fkey` (`agendaId`),
  KEY `Kehadiran_userId_fkey` (`userId`),
  CONSTRAINT `Kehadiran_agendaId_fkey` FOREIGN KEY (`agendaId`) REFERENCES `agenda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Kehadiran_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kehadiran`
--

LOCK TABLES `kehadiran` WRITE;
/*!40000 ALTER TABLE `kehadiran` DISABLE KEYS */;
/*!40000 ALTER TABLE `kehadiran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifikasi`
--

DROP TABLE IF EXISTS `notifikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifikasi` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pesan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/',
  `dibaca` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `Notifikasi_userId_fkey` (`userId`),
  CONSTRAINT `Notifikasi_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifikasi`
--

LOCK TABLES `notifikasi` WRITE;
/*!40000 ALTER TABLE `notifikasi` DISABLE KEYS */;
INSERT INTO `notifikasi` VALUES ('846e87fc-77bf-4bcf-9ec5-3d0136128249','3d36ce9b-4fe2-452e-abe5-a4d5258b25a5','Γ£ì∩╕Å Surat Menunggu Tanda Tangan','Surat \"Undangan\" perlu ditandatangani','/surat-keluar/d92fd41d-ca88-435f-8f10-2311a8776e24',1,'2026-06-09 02:27:09.610');
/*!40000 ALTER TABLE `notifikasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisasiprofil`
--

DROP TABLE IF EXISTS `organisasiprofil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organisasiprofil` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkatanOrg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pimpinan Cabang',
  `namaOrg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Fatayat Nahdlatul Ulama',
  `daerahOrg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Kota Bandung',
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `logoPath` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `namaArab` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisasiprofil`
--

LOCK TABLES `organisasiprofil` WRITE;
/*!40000 ALTER TABLE `organisasiprofil` DISABLE KEYS */;
INSERT INTO `organisasiprofil` VALUES ('f4c2b757-cece-40f3-8b35-fa16188a9f51','','YAYASAN PONDOK PESANTREN SUKAMISKIN','KOTA BANDUNG','Jl. Raya Timur (A. H. Nasution) Km. 8 No. 128 Kel. Sukamiskin Kec. Arcamanik Kota Bandung 40293 ','+62811863865','info@sukamiskin.ponpes.id','www.sukamiskin.ponpes.id','uploads/logos/logo-1780919205248.png','2026-06-08 11:26:15.047','2026-06-09 02:17:50.410','┘à╪╣┘ç┘Ç┘Ç┘Ç┘Ç┘Ç┘Ç╪»  ╪│┘ê┘é ┘à╪│┘Ç┘Ç┘Ç┘Ç┘Ç┘Ç┘â ╪º┘ä╪Ñ╪│┘Ç┘Ç┘Ç┘Ç┘Ç┘Ç┘ä╪º┘à┘ë ');
/*!40000 ALTER TABLE `organisasiprofil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerimainternal`
--

DROP TABLE IF EXISTS `penerimainternal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penerimainternal` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suratId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sudahDibaca` tinyint(1) NOT NULL DEFAULT '0',
  `dibacaAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `PenerimaInternal_suratId_fkey` (`suratId`),
  KEY `PenerimaInternal_userId_fkey` (`userId`),
  CONSTRAINT `PenerimaInternal_suratId_fkey` FOREIGN KEY (`suratId`) REFERENCES `suratkeluar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PenerimaInternal_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerimainternal`
--

LOCK TABLES `penerimainternal` WRITE;
/*!40000 ALTER TABLE `penerimainternal` DISABLE KEYS */;
/*!40000 ALTER TABLE `penerimainternal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesertaagenda`
--

DROP TABLE IF EXISTS `pesertaagenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesertaagenda` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agendaId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `PesertaAgenda_agendaId_userId_key` (`agendaId`,`userId`),
  KEY `PesertaAgenda_userId_fkey` (`userId`),
  CONSTRAINT `PesertaAgenda_agendaId_fkey` FOREIGN KEY (`agendaId`) REFERENCES `agenda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PesertaAgenda_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesertaagenda`
--

LOCK TABLES `pesertaagenda` WRITE;
/*!40000 ALTER TABLE `pesertaagenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesertaagenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pushsubscription`
--

DROP TABLE IF EXISTS `pushsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pushsubscription` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endpoint` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p256dh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `PushSubscription_endpoint_key` (`endpoint`),
  KEY `PushSubscription_userId_fkey` (`userId`),
  CONSTRAINT `PushSubscription_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pushsubscription`
--

LOCK TABLES `pushsubscription` WRITE;
/*!40000 ALTER TABLE `pushsubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `pushsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratkeluar`
--

DROP TABLE IF EXISTS `suratkeluar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suratkeluar` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomorSurat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenisSurat` enum('A','B','C','D','E','F','G','H','I','J','K','SK') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  `perihal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lampiran` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isiSurat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lampiranIsi` text COLLATE utf8mb4_unicode_ci,
  `tujuanSurat` text COLLATE utf8mb4_unicode_ci,
  `tanggalMasehi` datetime(3) NOT NULL,
  `tanggalHijriyah` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempatTerbit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bandung',
  `status` enum('DRAFT','MENUNGGU_TATA_USAHA','MENUNGGU_KEPALA','DITOLAK_TATA_USAHA','DITOLAK_KEPALA','SELESAI') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `tataUsahaId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kepalaId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parafTataUsaha` tinyint(1) NOT NULL DEFAULT '0',
  `ttdKepala` tinyint(1) NOT NULL DEFAULT '0',
  `tglParafTataUsaha` datetime(3) DEFAULT NULL,
  `tglTtdKepala` datetime(3) DEFAULT NULL,
  `catatanTolak` text COLLATE utf8mb4_unicode_ci,
  `ditolakOleh` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qrCodePath` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qrCodeToken` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pembuatId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerimaEksternal` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SuratKeluar_nomorSurat_key` (`nomorSurat`),
  UNIQUE KEY `SuratKeluar_qrCodeToken_key` (`qrCodeToken`),
  KEY `SuratKeluar_sekretarisId_fkey` (`tataUsahaId`),
  KEY `SuratKeluar_ketuaId_fkey` (`kepalaId`),
  KEY `SuratKeluar_pembuatId_fkey` (`pembuatId`),
  CONSTRAINT `SuratKeluar_ketuaId_fkey` FOREIGN KEY (`kepalaId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `SuratKeluar_pembuatId_fkey` FOREIGN KEY (`pembuatId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `SuratKeluar_sekretarisId_fkey` FOREIGN KEY (`tataUsahaId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratkeluar`
--

LOCK TABLES `suratkeluar` WRITE;
/*!40000 ALTER TABLE `suratkeluar` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratkeluar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suratmasuk`
--

DROP TABLE IF EXISTS `suratmasuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suratmasuk` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomorSurat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pengirim` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perihal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isiSurat` text COLLATE utf8mb4_unicode_ci,
  `lampiran` text COLLATE utf8mb4_unicode_ci,
  `tanggalSurat` datetime(3) NOT NULL,
  `tanggalTerima` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `status` enum('BARU','DIBACA','DIDISPOSISI') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BARU',
  `filePath` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaderId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SuratMasuk_uploaderId_fkey` (`uploaderId`),
  CONSTRAINT `SuratMasuk_uploaderId_fkey` FOREIGN KEY (`uploaderId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suratmasuk`
--

LOCK TABLES `suratmasuk` WRITE;
/*!40000 ALTER TABLE `suratmasuk` DISABLE KEYS */;
/*!40000 ALTER TABLE `suratmasuk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatesurat`
--

DROP TABLE IF EXISTS `templatesurat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatesurat` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenisSurat` enum('A','B','C','D','E','F','G','H','I','J','K','SK') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  `perihal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tujuanSurat` text COLLATE utf8mb4_unicode_ci,
  `lampiran` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isiSurat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lampiranIsi` text COLLATE utf8mb4_unicode_ci,
  `tempatTerbit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bandung',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatesurat`
--

LOCK TABLES `templatesurat` WRITE;
/*!40000 ALTER TABLE `templatesurat` DISABLE KEYS */;
INSERT INTO `templatesurat` VALUES ('806ba732-133f-49d7-9e6e-0b8f5ea275a0','Surat Tugas',NULL,'E',NULL,NULL,NULL,'<p style=\"text-align: center;\">╪¿╪│┘à ╪º┘ä┘ä┘ç ╪º┘ä╪▒╪¡┘à┘å ╪º┘ä╪▒╪¡┘è┘à</p><p>Yang bertanda tangan dibawah ini, Pimpinan Pondok Pesantren Sukamiskin Kota Bandung memberikan tugas kepada:</p><p></p><table data-borderless=\"true\" class=\"borderless-table\" style=\"min-width: 155px;\"><colgroup><col style=\"width: 105px;\"><col style=\"width: 25px;\"><col style=\"min-width: 25px;\"></colgroup><tbody><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>Nama</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>NIK</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>Alamat</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>No. Telepon</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr></tbody></table><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">Untuk ..............</p><p style=\"text-align: justify;\">Demikian Surat Tugas ini dibuat, untuk dilaksanakan dan dipergunakan sebagaimana mestinya.</p>',NULL,'Bandung','2026-06-09 09:40:58.426','2026-06-09 09:40:58.426'),('8489a6cb-28c9-4cb3-815a-4facd54eeebe','Surat Undangan Rapat',NULL,'A',NULL,NULL,NULL,'<p style=\"text-align: center;\">╪º┘ä╪│┘ä╪º┘à ╪╣┘ä┘è┘â┘à ┘ê╪▒∩║ú┘à╪⌐ ╪º∩╗ƒ∩╗á∩╗¬ ┘ê╪¿╪▒┘â╪º ╪¬┘ç</p><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">Salam silaturahmi kami sampaikan, semoga kita senantiasa dalam lindungan Allah SWT, dan diberi kekuatan serta <em>istiq├ómah </em>dalam berkhidmah untuk agama dan bangsa.<em> ├ém├«n y├ó rabbal \'├ólam├«n</em>.</p><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">Sehubungan akan dilaksanakannya Rapat Awal Tahun Ajaran 2026/2027 Pondok Pesantren Sukamiskin, kami mengundang Bapak/Ibu untuk hadir pada:</p><p style=\"text-align: justify;\"></p><table data-borderless=\"true\" class=\"borderless-table\" style=\"min-width: 151px;\"><colgroup><col style=\"width: 101px;\"><col style=\"width: 25px;\"><col style=\"min-width: 25px;\"></colgroup><tbody><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"101\"><p>Hari</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p>Kamis</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"101\"><p>Tanggal</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p>23 Mei 2026 M./15 Dzulqa\'dah 1445 H.</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"101\"><p>Waktu</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p>Pukul 08.00-12.00 WIB</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"101\"><p>Tempat</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p>Madrasah Pondok Pesantren Sukamiskin</p></td></tr></tbody></table><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">Demikian undangan ini kami sampaikan, atas perhatian dan kehadiran Bapak/Ibu kami haturkan terima kasih, <em>jaz├ókumull├óh ahsanal jaz├ó\'</em>.</p><p style=\"text-align: justify;\"></p><p style=\"text-align: center;\">┘ê╪º∩╗ƒ∩╗á∩╗¬ ╪º∩╗ƒ∩╗ñ┘ê┘ü┘é ╪º∩╗ƒ∩╗░ ╪ú┘é┘ê┘à ╪º┘ä╪╖╪▒┘è┘é</p><p style=\"text-align: center;\">┘ê╪º┘ä╪│┘ä╪º┘à ╪╣┘ä┘è┘â┘à ┘ê╪▒∩║ú┘à╪⌐ ╪º∩╗ƒ∩╗á∩╗¬ ┘ê╪¿╪▒┘â╪º ╪¬┘ç</p>',NULL,'Bandung','2026-06-09 08:37:55.040','2026-06-09 08:38:23.449'),('9d9241f4-c034-4b04-a788-9bf66c748c25','Surat Keterangan',NULL,'C',NULL,NULL,NULL,'<p style=\"text-align: center;\">╪¿╪│┘à ╪º┘ä┘ä┘ç ╪º┘ä╪▒╪¡┘à┘å ╪º┘ä╪▒╪¡┘è┘à</p><p>Yang bertanda tangan dibawah ini, Pimpinan Pondok Pesantren Sukamiskin Kota Bandung menerangkan bahwa:</p><p></p><table data-borderless=\"true\" class=\"borderless-table\" style=\"min-width: 155px;\"><colgroup><col style=\"width: 105px;\"><col style=\"width: 25px;\"><col style=\"min-width: 25px;\"></colgroup><tbody><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>Nama</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>NIK</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>Alamat</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>No. Telepon</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr></tbody></table><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">Nama tersebut diatas ..............</p><p style=\"text-align: justify;\">Demikian Surat Keterangan ini dibuat, untuk dipergunakan sebagaimana mestinya.</p>',NULL,'Bandung','2026-06-09 09:43:31.792','2026-06-09 09:43:31.792'),('a7f988e4-4f4b-4c4e-9d55-3544337110af','Surat Rekomendasi',NULL,'D',NULL,NULL,NULL,'<p style=\"text-align: center;\">╪¿╪│┘à ╪º┘ä┘ä┘ç ╪º┘ä╪▒╪¡┘à┘å ╪º┘ä╪▒╪¡┘è┘à</p><p>Yang bertanda tangan dibawah ini, Pimpinan Pondok Pesantren Sukamiskin Kota Bandung memberikan rekomendasi kepada:</p><p></p><table data-borderless=\"true\" class=\"borderless-table\" style=\"min-width: 155px;\"><colgroup><col style=\"width: 105px;\"><col style=\"width: 25px;\"><col style=\"min-width: 25px;\"></colgroup><tbody><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>Nama</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>NIK</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>Alamat</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"105\"><p>No. Telepon</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr></tbody></table><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">Untuk ..............</p><p style=\"text-align: justify;\">Demikian Surat Rekomendasi ini dibuat, untuk dipergunakan sebagaimana mestinya.</p>',NULL,'Bandung','2026-06-09 09:42:12.620','2026-06-09 09:42:12.620'),('c9c31a17-712c-42c6-a140-24633fc1e3f2','Surat Keputusan',NULL,'SK',NULL,NULL,NULL,'<p style=\"text-align: center;\">╪¿╪│┘à ╪º┘ä┘ä┘ç ╪º┘ä╪▒╪¡┘à┘å ╪º┘ä╪▒╪¡┘è┘à</p><p><span style=\"color: black;\">Ketua Yayasan Pondok Pesantren Sukamiskin, setelah:</span></p><table data-borderless=\"true\" class=\"borderless-table\" style=\"min-width: 182px;\"><colgroup><col style=\"width: 132px;\"><col style=\"width: 25px;\"><col style=\"min-width: 25px;\"></colgroup><tbody><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"132\"><p><span style=\"color: black;\">Menimbang</span></p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p><span style=\"color: black;\">:</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"132\"><p><span style=\"color: black;\">Mengigat</span></p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p><span style=\"color: black;\">:</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"132\"><p><span style=\"color: black;\">Memperhatikan</span></p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p><span style=\"color: black;\">:</span></p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"3\" rowspan=\"1\" colwidth=\"132,25,0\"><p style=\"text-align: center;\"></p><p style=\"text-align: center;\"><strong>MEMUTUSKAN</strong></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"132\"><p><span style=\"color: black;\">Menetapkan</span></p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p><span style=\"color: black;\">:</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\">&nbsp;</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"132\"><p><span style=\"color: black;\">Pertama</span></p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p><span style=\"color: black;\">:</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"132\"><p><span style=\"color: black;\">Kedua</span></p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p><span style=\"color: black;\">:</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"132\"><p><span style=\"color: black;\">Ketiga</span></p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p><span style=\"color: black;\">:</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"132\"><p><span style=\"color: black;\">Keempat</span></p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p><span style=\"color: black;\">:</span></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: justify;\"></p></td></tr></tbody></table>','<p style=\"text-align: center;\"><strong>JUDUL LAMPIRAN KEPUTUSAN</strong></p><p style=\"text-align: center;\"></p><p style=\"text-align: left;\"></p>','Bandung','2026-06-09 09:35:55.309','2026-06-09 09:36:15.276'),('e5b15036-b343-4695-af12-c01f08617e5e','Surat Undangan Kegiatan',NULL,'B',NULL,NULL,NULL,'<p style=\"text-align: center;\">╪º┘ä╪│┘ä╪º┘à ╪╣┘ä┘è┘â┘à ┘ê╪▒∩║ú┘à╪⌐ ╪º∩╗ƒ∩╗á∩╗¬ ┘ê╪¿╪▒┘â╪º ╪¬┘ç</p><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">Salam silaturahmi kami sampaikan, semoga kita senantiasa dalam lindungan Allah SWT, dan diberi kekuatan serta <em>istiq├ómah </em>dalam berkhidmah untuk agama dan bangsa.<em> ├ém├«n y├ó rabbal \'├ólam├«n</em>.</p><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">Sehubungan akan dilaksanakannya kegiatan Tasyakur Pelepasan dan Perpisahan Santri Pondok Pesantren Sukamiskin Tahun 2026, kami mengundang Bapak/Ibu untuk hadir pada:</p><p style=\"text-align: justify;\"></p><table data-borderless=\"true\" class=\"borderless-table\" style=\"min-width: 151px;\"><colgroup><col style=\"width: 101px;\"><col style=\"width: 25px;\"><col style=\"min-width: 25px;\"></colgroup><tbody><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"101\"><p>Hari</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p>Kamis</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"101\"><p>Tanggal</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p></p></td><td colspan=\"1\" rowspan=\"1\"><p>23 Mei 2026 M./15 Dzulqa\'dah 1445 H.</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"101\"><p>Waktu</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p>Pukul 08.00-12.00 WIB</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"101\"><p>Tempat</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"25\"><p>:</p></td><td colspan=\"1\" rowspan=\"1\"><p>Pondok Pesantren Sukamiskin</p></td></tr></tbody></table><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">Demikian undangan ini kami sampaikan, atas perhatian dan kehadiran Bapak/Ibu kami haturkan terima kasih, <em>jaz├ókumull├óh ahsanal jaz├ó\'</em>.</p><p style=\"text-align: justify;\"></p><p style=\"text-align: center;\">┘ê╪º∩╗ƒ∩╗á∩╗¬ ╪º∩╗ƒ∩╗ñ┘ê┘ü┘é ╪º∩╗ƒ∩╗░ ╪ú┘é┘ê┘à ╪º┘ä╪╖╪▒┘è┘é</p><p style=\"text-align: center;\">┘ê╪º┘ä╪│┘ä╪º┘à ╪╣┘ä┘è┘â┘à ┘ê╪▒∩║ú┘à╪⌐ ╪º∩╗ƒ∩╗á∩╗¬ ┘ê╪¿╪▒┘â╪º ╪¬┘ç</p>','<p style=\"text-align: center;\"></p><p style=\"text-align: center;\"><strong>SUSUNAN ACARA</strong></p><p style=\"text-align: center;\">&nbsp;</p><table style=\"min-width: 602px;\"><colgroup><col style=\"width: 125px;\"><col style=\"width: 452px;\"><col style=\"min-width: 25px;\"></colgroup><tbody><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\"><strong>Waktu</strong></p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p style=\"text-align: center;\"><strong>Acara</strong></p></td><td colspan=\"1\" rowspan=\"1\"><p style=\"text-align: center;\"><strong>Pengisi Acara/Keterangan</strong></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">09.30 ΓÇô 10.00</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Registrasi Peserta</p></td><td colspan=\"1\" rowspan=\"1\"><p>Kesekretariatan</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">10.00 ΓÇô 10.05</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Pembukaan</p></td><td colspan=\"1\" rowspan=\"1\"><p>MC</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">10.05 ΓÇô 10.10</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Pembacaan Ayat Suci Al-Quran dan Shalawat</p></td><td colspan=\"1\" rowspan=\"1\"><p>Qori</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">10.10 ΓÇô 10.15</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Menyanyikan Lagu Indonesia Raya dan Ya Lal Wathan</p></td><td colspan=\"1\" rowspan=\"1\"><p>Dirigen</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">10.15 ΓÇô 10.25</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Tawasul/Hadharah dan DoΓÇÖa</p></td><td colspan=\"1\" rowspan=\"1\"><p>Drs. KH. Abdul Qodir, S.E</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">10.25 ΓÇô 10.30</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Sambutan Atasnama Santri</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">10.30 ΓÇô 10.35</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Sambutan Atasnama Orang Tua Santri</p></td><td colspan=\"1\" rowspan=\"1\"><p>Willi Yudia Laksana, S.STP</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">10.35 ΓÇô 10.40</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Sambutan Dewan Guru</p></td><td colspan=\"1\" rowspan=\"1\"><p>Mina Aminah, S.S</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">10.40 ΓÇô 10.50</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Sambutan Pimpinan Pesantren</p></td><td colspan=\"1\" rowspan=\"1\"><p>KH. R. Abdul Aziz Haedar</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">10.50 ΓÇô 11.00</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Sambutan Kementerian Agama Kota Bandung</p></td><td colspan=\"1\" rowspan=\"1\"><p>Dr. H. Ridwan Fadhilah</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">11.00-12.00</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Prosesi Pelepasan Santri</p></td><td colspan=\"1\" rowspan=\"1\"><p>Seluruh Santri</p></td></tr><tr><td colspan=\"1\" rowspan=\"1\" colwidth=\"125\"><p style=\"text-align: center;\">12.00</p></td><td colspan=\"1\" rowspan=\"1\" colwidth=\"452\"><p>Tutup/Ramah Tamah</p></td><td colspan=\"1\" rowspan=\"1\"><p></p></td></tr></tbody></table><p style=\"text-align: center;\">&nbsp;</p>','Bandung','2026-06-09 09:47:11.019','2026-06-09 09:47:11.019');
/*!40000 ALTER TABLE `templatesurat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namaLengkap` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nomorHp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role` enum('ADMIN','TATA_USAHA','KEPALA','GURU') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'GURU',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `fotoProfil` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `nuptk` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1b78f3f7-85cd-4e09-b8d7-2736d3e41aeb','admin@sirama.com','$2a$12$B/QSwS/FNRWOc/0SEvvRPOt8OftMYpyDgvwN/4z0FoW8RZzi5ycN6','Administrator','Administrator Sistem','','ADMIN',1,NULL,'2026-06-08 11:26:15.572','2026-06-08 11:26:15.572',NULL),('3d36ce9b-4fe2-452e-abe5-a4d5258b25a5','kepala@sirama.com','$2a$12$i2hV/yLGxMzMytN7aXwOgeKY90f3fVfiXhxTJmHR0unzqd0klaCHG','KH. R. Abdul Aziz Haedar','Pimpinan Pesantren','','KEPALA',1,NULL,'2026-06-08 11:26:16.546','2026-06-08 11:49:56.291',NULL),('6de27320-d875-40cc-ae53-f42ee2deadf2','guru2@sirama.com','$2a$12$V8SV1DpJMtHO1mwZxqZCe.mWTGluxzcxRyo2vvFa9zQgbdd6buHae','Aisyah Putri','Guru Kelas 2','','GURU',1,NULL,'2026-06-08 11:26:17.553','2026-06-08 11:26:17.553',NULL),('9c9baeb5-c3b7-4097-98ac-01fcb202446a','tatausaha@sirama.com','$2a$12$Hpahn3cOvB3yvNbw4.GFXe3aBpYrbUZJExQFluH6qAMrnyNQZHQdK','Siti Aminah','Kepala Tata Usaha','','TATA_USAHA',1,NULL,'2026-06-08 11:26:16.049','2026-06-08 11:26:16.049',NULL),('c1d4df84-ce86-4677-abd8-6a8fa283ca97','guru1@sirama.com','$2a$12$aDBWLNa1QmdvUGhTh8JOleen32JmUCK4Ny4TE9wu5CbjzOp8jy8Pe','Nur Hidayah','Guru Kelas 1','','GURU',1,NULL,'2026-06-08 11:26:17.061','2026-06-08 11:26:17.061',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'safira_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-10  7:13:52
