-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: plasticum_cbd
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buy_parts`
--

DROP TABLE IF EXISTS `buy_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy_parts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projet_id` int NOT NULL,
  `ligne_no` int NOT NULL,
  `specification` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite` decimal(15,6) NOT NULL COMMENT 'Quantité en #/pièce',
  `prix_unitaire` decimal(15,6) NOT NULL COMMENT 'Prix en €/pc',
  `fournisseur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pays_origine` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_buy_projet` (`projet_id`),
  CONSTRAINT `fk_buy_projet` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_parts`
--

LOCK TABLES `buy_parts` WRITE;
/*!40000 ALTER TABLE `buy_parts` DISABLE KEYS */;
INSERT INTO `buy_parts` VALUES (13,26,1,'Vis M4 x 10',0.034000,34.000000,'Bosch',NULL);
/*!40000 ALTER TABLE `buy_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emballage`
--

DROP TABLE IF EXISTS `emballage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emballage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projet_id` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cout_unite` decimal(15,6) NOT NULL COMMENT 'Coût unitaire (ex: 0.20 €)',
  `pieces_unite` int NOT NULL COMMENT 'Pièces par unité (ex: 5000)',
  `cycles` int NOT NULL DEFAULT '1' COMMENT 'Nombre de cycles de réutilisation',
  PRIMARY KEY (`id`),
  KEY `idx_emballage_projet` (`projet_id`),
  CONSTRAINT `fk_emballage_projet` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emballage`
--

LOCK TABLES `emballage` WRITE;
/*!40000 ALTER TABLE `emballage` DISABLE KEYS */;
INSERT INTO `emballage` VALUES (50,21,'Boxes to be provided by KOSTAL',0.200000,5000,1),(51,22,'Boxes (KOSTAL)',1.000000,65,76),(57,26,'Boxes (KOSTAL)',0.200000,5000,1),(69,30,'Palette + handling (returnable)',5.500000,672,1),(75,32,'Boxes to be provided by KOSTAL',0.200000,800,1),(76,29,'Boxes to be provided by KOSTAL',0.210000,1200,1),(77,28,'Boxes to be provided by KOSTAL',0.200000,5000,1);
/*!40000 ALTER TABLE `emballage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matieres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projet_id` int NOT NULL COMMENT 'Référence vers le projet',
  `ligne_no` int NOT NULL COMMENT 'Numéro de ligne (01, 02, ...)',
  `specification` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nom de la matière',
  `poids_net` decimal(15,6) NOT NULL COMMENT 'Poids net en grammes',
  `poids_brut` decimal(15,6) NOT NULL COMMENT 'Poids brut en grammes (avec carotte)',
  `taux_matiere` decimal(15,6) NOT NULL COMMENT 'Prix en €/kg',
  PRIMARY KEY (`id`),
  KEY `idx_matiere_projet` (`projet_id`),
  CONSTRAINT `fk_matiere_projet` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matieres`
--

LOCK TABLES `matieres` WRITE;
/*!40000 ALTER TABLE `matieres` DISABLE KEYS */;
INSERT INTO `matieres` VALUES (47,21,1,'Tecodur PB70 BK 001 HS black BK 001 HS',0.090000,0.406000,2.929500),(48,22,1,'PC M15 WA03',55.000000,55.000000,2.880000),(49,25,1,'Tecodur PB70 BK',2.000000,22.000000,2.000000),(54,26,1,'Tecodur PB70 BK 001 HS',0.090000,0.406000,2.929500),(57,29,1,'Delrin 100 PE Black BK 602',1.850000,2.393000,7.400000),(59,30,1,'PC M15 WA03',55.000000,55.000000,2.880000),(61,32,1,'Polyfill PPH GF5030 HC VT2 PP/H-GF30',4.340000,5.113000,4.190000),(62,28,1,'Tecodur PB70 BK 001 HS black BK 001 HS',0.090000,0.406000,2.929500);
/*!40000 ALTER TABLE `matieres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametres`
--

DROP TABLE IF EXISTS `parametres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projet_id` int NOT NULL COMMENT 'Un seul paramètre par projet',
  `overhead_mat` decimal(5,2) NOT NULL DEFAULT '5.00' COMMENT '%',
  `overhead_prod` decimal(5,2) NOT NULL DEFAULT '5.00' COMMENT '%',
  `scrap_rate` decimal(5,2) NOT NULL DEFAULT '3.00' COMMENT '%',
  `sa_mat` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'S&A sur matière %',
  `sa_buy` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'S&A sur Buy-Parts %',
  `sa_prod` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'S&A sur Production %',
  `profit_mat` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Profit sur matière %',
  `profit_buy` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Profit sur Buy-Parts %',
  `profit_prod` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Profit sur Production %',
  `scrap_manuel_check` tinyint(1) DEFAULT '0',
  `scrap_manuel_valeur` decimal(15,6) DEFAULT '0.000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `projet_id` (`projet_id`),
  CONSTRAINT `fk_param_projet` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametres`
--

LOCK TABLES `parametres` WRITE;
/*!40000 ALTER TABLE `parametres` DISABLE KEYS */;
INSERT INTO `parametres` VALUES (72,21,5.00,5.00,3.00,6.00,0.00,6.00,6.00,0.00,6.00,0,0.000000),(103,22,5.00,5.00,2.00,5.00,0.00,5.00,0.00,0.00,0.00,0,0.000000),(115,25,5.00,5.00,3.00,6.00,0.00,6.00,6.00,0.00,6.00,0,0.000000),(119,26,5.00,5.00,3.00,6.00,0.00,6.00,6.00,0.00,6.00,0,0.000000),(130,28,5.00,5.00,3.00,6.00,0.00,6.00,6.00,0.00,6.00,1,0.380000),(134,29,5.00,5.00,3.00,1.00,0.00,1.00,1.00,0.00,2.00,0,0.000000),(148,30,5.00,5.00,2.00,5.00,0.00,5.00,0.00,0.00,0.00,0,0.000000),(153,32,5.00,5.00,3.00,4.80,0.00,5.00,4.80,0.00,5.00,0,0.000000);
/*!40000 ALTER TABLE `parametres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppap_supp_projet`
--

DROP TABLE IF EXISTS `ppap_supp_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ppap_supp_projet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projet_id` int NOT NULL,
  `ligne_no` int NOT NULL DEFAULT '1',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `montant` decimal(15,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id`),
  KEY `idx_ppap_projet` (`projet_id`),
  CONSTRAINT `fk_ppap_supp_projet` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppap_supp_projet`
--

LOCK TABLES `ppap_supp_projet` WRITE;
/*!40000 ALTER TABLE `ppap_supp_projet` DISABLE KEYS */;
INSERT INTO `ppap_supp_projet` VALUES (15,26,1,'Validation supplémentaire',444.000000);
/*!40000 ALTER TABLE `ppap_supp_projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processus`
--

DROP TABLE IF EXISTS `processus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projet_id` int NOT NULL,
  `process_no` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '01, 02 (setup), etc.',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Injection, Setup, etc.',
  `machine_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ex: 50T, 120T',
  `cycle_time` decimal(15,6) NOT NULL DEFAULT '0.000000' COMMENT 'Temps de cycle en secondes',
  `parts_per_cycle` int NOT NULL DEFAULT '1' COMMENT 'Nombre de pièces par cycle',
  `manning_level` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'Nombre d''opérateurs',
  `labour_rate` decimal(15,6) NOT NULL DEFAULT '0.000000' COMMENT 'Taux horaire en €/h',
  `machine_rate` decimal(15,6) NOT NULL DEFAULT '0.000000' COMMENT 'Taux machine en €/h',
  PRIMARY KEY (`id`),
  KEY `idx_process_projet` (`projet_id`),
  CONSTRAINT `fk_process_projet` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processus`
--

LOCK TABLES `processus` WRITE;
/*!40000 ALTER TABLE `processus` DISABLE KEYS */;
INSERT INTO `processus` VALUES (85,21,'01','Injection','50',12.500000,8,0.2500,6.000000,11.800000),(86,21,'02','setup _ 2 hours','--',0.000000,1,1.0000,6.000000,11.800000),(87,22,'01','Injection','50T',60.000000,1,0.0000,4.000000,15.000000),(88,22,'02','setup _ 0.3 hours','--',0.000000,1,1.0000,4.000000,15.000000),(89,25,'01','Injection','50T',2.000000,2,1.0000,2.000000,26.000000),(98,26,'01','Injection','50T',12.500000,8,0.2500,6.000000,11.800000),(99,26,'02','setup _ 2 hours','--',0.000000,1,1.0000,6.000000,11.800000),(104,29,'01','Injection','120',17.000000,4,0.2500,6.000000,12.000000),(105,29,'02','setup _ 2 hours','--',0.000000,1,1.0000,6.000000,12.000000),(112,30,'01','Injection','200T',60.000000,2,1.0000,4.000000,15.000000),(115,32,'01','Injection','120',24.000000,4,0.2500,6.000000,12.000000),(116,32,'02','setup _ 2 hours','--',0.000000,1,1.0000,6.000000,12.000000),(117,28,'01','Injection','50',12.500000,8,0.2500,6.000000,11.800000),(118,28,'02','setup _ 2 hours','--',0.000000,1,1.0000,6.000000,11.800000);
/*!40000 ALTER TABLE `processus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projets`
--

DROP TABLE IF EXISTS `projets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_projet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nom unique du devis',
  `fournisseur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Plasticum',
  `nom_piece` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `part_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Numéro de pièce',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_offre` date NOT NULL,
  `devise` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EUR',
  `taux_change` decimal(15,6) NOT NULL DEFAULT '1.000000',
  `quantite_vie` int NOT NULL,
  `quantite_an` int NOT NULL,
  `site_production` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_general` decimal(15,6) DEFAULT '0.000000' COMMENT 'Prix total calculé',
  `user_id` int NOT NULL DEFAULT '1' COMMENT 'Référence vers l''utilisateur',
  `ppap_total` decimal(15,6) DEFAULT '1000.000000' COMMENT 'Coût PPAP total en €',
  `quantite_amortissement` decimal(15,6) DEFAULT '0.000000' COMMENT 'Quantité pour amortissement PPAP',
  `delivery_lot_size` decimal(15,6) DEFAULT '0.000000',
  PRIMARY KEY (`id`),
  KEY `idx_projet_user` (`user_id`),
  CONSTRAINT `fk_projet_user` FOREIGN KEY (`user_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projets`
--

LOCK TABLES `projets` WRITE;
/*!40000 ALTER TABLE `projets` DISABLE KEYS */;
INSERT INTO `projets` VALUES (21,'Projet - Cam follower . 2D THP','Plasticum','Cam follower . 2D THP','12133392','Habib ZNAGUI','2025-11-20','EUR',1.000000,2931294,570910,'Plasticum Maroc Industries _Morocco - AFZ','2026-09-02 09:24:00',10.201576,1,1000.000000,1712730.000000,57091.000000),(22,'Projet - LIGHT GUIDE SUPPORT L','Plasticum Maroc Industries','LIGHT GUIDE SUPPORT L','410210509003 A','','2026-09-01','EUR',1.000000,100000,100000,'Plasticum Maroc Industries – AFZ','2026-09-02 19:32:12',466.028584,1,1000.000000,0.000000,10000.000000),(25,'Projet - Cam follower . 2D THP','Plasticum','Cam follower . 2D THP','12345','Habib ZNAGUI','3333-03-12','EUR',1.000000,100000,570910,'Plasticum Maroc Industries – AFZ','2026-09-02 21:20:18',63.862841,1,1000.000000,1712730.000000,57091.000000),(26,'Projet - Cam follower 2D THP','Plasticum','Cam follower 2D THP','12133392','Habib ZNAGUI','5443-06-06','EUR',1.000000,2931294,570910,'Plasticum Maroc Industries – AFZ','2026-09-02 22:09:53',1415.201262,1,1000.000000,1712730.000000,57091.000000),(28,'Projet - Cam follower . 2D THP','Plasticum','Cam follower . 2D THP','12133392','Habib ZNAGUI','2222-02-22','EUR',1.000000,2931294,570910,'Plasticum Maroc Industries _Morocco - AFZ','2026-09-03 10:00:47',10.175195,1,1000.000000,1712730.000000,57078.000000),(29,'Projet - Rocker . THP','Plasticum','Rocker . THP','12067877','Habib ZNAGUI','2025-01-06','EUR',1.000000,2931294,570910,'Plasticum Maroc Industries – AFZ','2026-09-03 10:27:38',39.591275,1,1000.000000,1712730.000000,57091.000000),(30,'Projet - LIGHT GUIDE SUPPORT L','Plasticum Maroc Industries','LIGHT GUIDE SUPPORT L','410210509003 A','','2026-09-01','EUR',1.000000,0,100000,'Plasticum Maroc Industries _Morocco - AFZ','2026-09-03 13:16:05',377.696994,1,NULL,300000.000000,0.000000),(32,'Projet - Socket . THP','Plasticum','Socket . THP','12067871','Habib ZNAGUI','2025-03-24','EUR',1.000000,2931294,570910,'Plasticum Maroc Industries _Morocco - AFZ','2026-09-03 18:03:21',55.125020,1,1000.000000,1712730.000000,57091.000000);
/*!40000 ALTER TABLE `projets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remises`
--

DROP TABLE IF EXISTS `remises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projet_id` int NOT NULL COMMENT 'Référence vers le projet',
  `type_remise` enum('prix_total','hors_matiere') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Type de remise appliquée',
  `pourcentage` decimal(10,2) NOT NULL COMMENT 'Pourcentage de réduction',
  `nom_remise` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Remise commerciale' COMMENT 'Nom de la remise',
  `prix_avant` decimal(15,6) NOT NULL COMMENT 'Prix avant réduction en €/1000pcs',
  `montant_reduction` decimal(15,6) NOT NULL COMMENT 'Montant de la réduction en €/1000pcs',
  `prix_apres` decimal(15,6) NOT NULL COMMENT 'Prix après réduction en €/1000pcs',
  `prix_total` decimal(15,6) NOT NULL COMMENT 'Prix total de référence',
  `prix_hors_matiere` decimal(15,6) NOT NULL COMMENT 'Prix hors matière de référence',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de création',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date de dernière mise à jour',
  PRIMARY KEY (`id`),
  KEY `idx_remise_projet` (`projet_id`),
  CONSTRAINT `fk_remise_projet` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remises`
--

LOCK TABLES `remises` WRITE;
/*!40000 ALTER TABLE `remises` DISABLE KEYS */;
INSERT INTO `remises` VALUES (3,28,'prix_total',3.00,'Remise commerciale',10.200000,0.306000,9.894000,10.200000,8.950000,'2026-09-03 14:47:51',NULL);
/*!40000 ALTER TABLE `remises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_ppap`
--

DROP TABLE IF EXISTS `transport_ppap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport_ppap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projet_id` int NOT NULL,
  `incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ex: DAP Tanger',
  `cout_transport` decimal(15,6) NOT NULL DEFAULT '0.000000' COMMENT '€/1000pcs',
  `cout_ppap` decimal(15,6) NOT NULL DEFAULT '0.000000' COMMENT 'Coût total PPAP en €',
  `laboratory_test` decimal(15,6) NOT NULL DEFAULT '0.000000' COMMENT 'Coût du laboratoire en €/1000pcs',
  PRIMARY KEY (`id`),
  UNIQUE KEY `projet_id` (`projet_id`),
  CONSTRAINT `fk_transport_projet` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_ppap`
--

LOCK TABLES `transport_ppap` WRITE;
/*!40000 ALTER TABLE `transport_ppap` DISABLE KEYS */;
INSERT INTO `transport_ppap` VALUES (33,21,'DAP',0.210000,0.000000,0.150000),(48,22,'DAP',0.000000,0.000000,0.150000),(51,25,'DAP',0.210000,0.000000,0.150000),(53,26,'DAP',0.210000,0.000000,0.150000),(59,28,'DAP',0.210000,0.000000,0.000000),(61,29,'DAP',0.870000,0.000000,0.000000),(72,30,'DAP',13.330000,0.000000,0.000000),(75,32,'DAP',1.300000,0.000000,0.000000);
/*!40000 ALTER TABLE `transport_ppap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique de l''utilisateur',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nom d''utilisateur (unique)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mot de passe hashé (généré par Werkzeug)',
  `full_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nom et prénom complet',
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Adresse email (unique)',
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT 'Rôle : admin ou utilisateur standard',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de création du compte',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'habib.znagui','scrypt:32768:8:1$AfREnCy5hc3JE3PW$3f71e6004dcf8569826e38c928ac5be72e020d42ff9bf157e1b951a0da2cddf9a37a064caa1d7987de69431de6c46253c4884484ae834109a5074b9f706d7c72','Habib ZNAGUI','habib@plasticum.com','admin','2026-07-13 08:44:31'),(2,'fatima.lachal','scrypt:32768:8:1$vj8XQ7p51QRfEh2x$ab3501dc7bfa64e80a528fe76c8b3017986253e35401dda648362c436ea2b63fc79fdd194d02924535be3717654cc2b11510522563424d98218961feb90c52ec','Fatima LACHAL','fatima.lachal@plasticum.com','user','2026-08-17 18:10:09');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-05 21:09:17
