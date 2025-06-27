-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 27 juin 2025 à 09:59
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `club-canin2`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `niveau_acces` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_utilisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age_min_mois` int NOT NULL,
  `age_max_mois` int DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom_categorie`, `age_min_mois`, `age_max_mois`) VALUES
(1, 'Chiot (0 à 5 mois)', 0, 5),
(2, 'Junior (6 à 1an)', 6, 11),
(3, 'Adulte (1 à 2 ans)', 12, 23),
(4, 'Senior (2 ans et plus)', 24, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `chien`
--

DROP TABLE IF EXISTS `chien`;
CREATE TABLE IF NOT EXISTS `chien` (
  `id_dog` int NOT NULL AUTO_INCREMENT,
  `nom_dog` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age_dog` int DEFAULT NULL,
  `sexe_dog` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `categorie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_utilisateur` int DEFAULT NULL,
  `id_race` int DEFAULT NULL,
  `photo_dog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_categorie` int DEFAULT NULL,
  PRIMARY KEY (`id_dog`),
  KEY `fk_chien_race` (`id_race`),
  KEY `fk_chien_utilisateur` (`id_utilisateur`),
  KEY `fk_chien_categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chien`
--

INSERT INTO `chien` (`id_dog`, `nom_dog`, `age_dog`, `sexe_dog`, `date_inscription`, `date_naissance`, `categorie`, `id_utilisateur`, `id_race`, `photo_dog`, `id_categorie`) VALUES
(210, 'bibixl', 32, 'mâle?', '2025-06-13', '2022-10-10', 'Senior (2 ans et plus)', 1063, 1, 'club-canin1-bibi.webp', 4),
(211, 'medor', 252, 'mâle', '2025-06-14', '2004-06-22', 'Adulte (1 à 2 ans)', 1063, 1, 'club-canin1-medor.webp', 3),
(212, 'lassi', 12, 'mâle', '2025-06-15', NULL, 'Adulte (1 à 2 ans)', 1059, 1, 'club-canin36.webp', 3),
(213, 'dede', 55, 'mâle', '2025-06-15', NULL, 'Senior (2 ans et plus)', 1059, 1, 'club-canin1-dede.webp', 4),
(221, 'Jacky', 14, 'mâle', '2025-06-16', NULL, 'Adulte (1 à 2 ans)', 1061, 1, 'club-canin14-jack.webp', 3),
(222, 'ddd', 14, 'mâle', '2025-06-16', NULL, 'Adulte (1 à 2 ans)', 1061, 21, 'club-canin21-ddd.webp', 3),
(226, 'bibix', 123, 'mâle', '2025-06-20', '2015-02-24', 'Chiot (0 à 5 mois)', 1088, 1, 'club-canin1-bibixxxxxxxxxxxxxxxxxxxx.webp', 1),
(228, 'jul', 25, 'mâle', '2025-06-23', '2023-04-25', 'Senior (2 ans et plus)', 1063, 1, 'club-canin70-jul.webp', 4),
(229, 'zaza', 36, 'mâle', '2025-06-23', '2022-06-22', 'Senior (2 ans et plus)', 1063, 1, 'club-canin1-zaza.webp', 4),
(231, 'Jack', 43, 'mâle', '2025-06-23', '2021-11-10', 'Senior (2 ans et plus)', 1063, 22, 'club-canin22-jack.webp', 4),
(233, 'aaa', NULL, 'kkkkkkkkkk', NULL, NULL, NULL, 1090, NULL, NULL, NULL),
(235, 'tftf', NULL, 'pppp', NULL, NULL, NULL, 1090, NULL, NULL, NULL),
(236, 'jojo', NULL, 'jojo', NULL, NULL, NULL, 1091, NULL, NULL, NULL),
(237, 'azertymm', NULL, 'mlkjho', NULL, NULL, NULL, 1091, NULL, NULL, NULL),
(238, 'jklokj', NULL, 'jkkgkjb', NULL, NULL, NULL, 1091, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `coach`
--

DROP TABLE IF EXISTS `coach`;
CREATE TABLE IF NOT EXISTS `coach` (
  `id_coach` int NOT NULL AUTO_INCREMENT,
  `specialisation_coach` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `disponibilite_coach` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_utilisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_coach`),
  UNIQUE KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id_commentaire` int NOT NULL AUTO_INCREMENT,
  `id_dog` int NOT NULL,
  `id_utilisateur` int DEFAULT NULL,
  `id_reservation` int DEFAULT NULL,
  `commentaire` text NOT NULL,
  `date_commentaire` datetime DEFAULT CURRENT_TIMESTAMP,
  `note` tinyint UNSIGNED DEFAULT NULL,
  `nom_cours` text,
  `progres` text,
  `type_cours` varchar(100) DEFAULT NULL,
  `date_cours` date DEFAULT NULL,
  PRIMARY KEY (`id_commentaire`),
  KEY `id_dog` (`id_dog`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_reservation` (`id_reservation`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id_commentaire`, `id_dog`, `id_utilisateur`, `id_reservation`, `commentaire`, `date_commentaire`, `note`, `nom_cours`, `progres`, `type_cours`, `date_cours`) VALUES
(8, 211, 1058, NULL, 'tthsttrs', '2025-06-22 20:51:12', 8, 'musculation', 'trh', 'ddddd', NULL),
(9, 210, 1058, NULL, 'ioio', '2025-06-22 20:52:10', 4, 'lolo', 'ioii', 'ddddd', NULL),
(11, 211, 1058, NULL, 'sdfffffqd', '2025-06-22 21:15:39', 7, 'musculation', 'fgq', 'école du chiot', NULL),
(12, 210, 1058, NULL, 'hhhhhhhhhhhhh', '2025-06-22 21:30:25', 7, 'ballàdix', 'hhhhhhhhhhhhhhh', 'école du chiot', NULL),
(13, 211, 1058, NULL, 'mlll', '2025-06-22 21:30:47', 2, 'ballàdix', 'kkkk', 'école du chiot', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id_cours` int NOT NULL AUTO_INCREMENT,
  `nom_cours` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type_cours` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age_min` int DEFAULT NULL,
  `age_max` int DEFAULT NULL,
  `race_dog` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `sexe_dog` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_cours` date NOT NULL,
  `description_cours` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `places_disponibles` int DEFAULT NULL,
  `categorie_acceptee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_coach` int DEFAULT NULL,
  PRIMARY KEY (`id_cours`),
  KEY `fk_id_coach` (`id_coach`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `nom_cours`, `type_cours`, `age_min`, `age_max`, `race_dog`, `sexe_dog`, `date_cours`, `description_cours`, `places_disponibles`, `categorie_acceptee`, `id_coach`) VALUES
(157, 'ballàdix', 'Pistage', NULL, NULL, 'Berger du Caucase', 'male', '2025-06-16', 'cdSCQ', 44, 'Adulte (1 à 2 ans)', 1058),
(158, 'musc', 'Agilité', NULL, NULL, 'Bichon Frisé', 'male', '2025-06-23', 'fitness', 23, 'Chiot (0 à 5 mois)', 1065),
(159, 'muscula', '', NULL, NULL, '', '1090', '0000-00-00', NULL, NULL, '', NULL),
(161, 'lll', 'pistage', NULL, NULL, 'chiot', '1090', '0000-00-00', NULL, NULL, 'femelle', NULL),
(164, 'rrr', 'rrr', NULL, NULL, 'rrr', 'rrr', '0000-00-00', NULL, NULL, 'rrr', NULL),
(165, 'gggeeee', 'ggg', NULL, NULL, 'ggg', 'ggg', '0000-00-00', NULL, NULL, 'ggg', NULL),
(166, 'gggppp', 'ggg', NULL, NULL, 'ggg', 'ggg', '0000-00-00', NULL, NULL, 'ggg', NULL),
(167, 'vvv', 'vvv', NULL, NULL, 'vvv', 'vvv', '0000-00-00', NULL, NULL, 'vvv', NULL),
(183, 'dzza', '', NULL, NULL, '', '', '2025-06-27', NULL, NULL, '', NULL),
(184, 'eeeeeeeeeeeeeeeee', 'eeeeeeeeeee', NULL, NULL, '', '', '2025-06-29', NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `id_event` int NOT NULL AUTO_INCREMENT,
  `nom_event` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description_event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_event` date DEFAULT NULL,
  `heure_event` time DEFAULT NULL,
  `places_disponibles` int DEFAULT NULL,
  `places_reservees` int DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  PRIMARY KEY (`id_event`),
  KEY `id_admin` (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id_event`, `nom_event`, `description_event`, `date_event`, `heure_event`, `places_disponibles`, `places_reservees`, `id_admin`) VALUES
(29, 'sdfaezfz', NULL, '2025-07-01', '10:00:00', 220, NULL, NULL),
(30, 'fete', NULL, '2025-08-10', '10:00:00', 41, NULL, NULL),
(31, 'mmuu', NULL, '2025-10-10', '10:00:00', 16, NULL, NULL),
(32, 'dddddd', NULL, '2025-06-30', '10:00:00', 32, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inscription_evenement`
--

DROP TABLE IF EXISTS `inscription_evenement`;
CREATE TABLE IF NOT EXISTS `inscription_evenement` (
  `id_inscription` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int DEFAULT NULL,
  `id_event` int DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `id_dog` int DEFAULT NULL,
  PRIMARY KEY (`id_inscription`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `fk_id_dog` (`id_dog`),
  KEY `fk_inscription_event` (`id_event`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription_evenement`
--

INSERT INTO `inscription_evenement` (`id_inscription`, `id_utilisateur`, `id_event`, `date_inscription`, `id_dog`) VALUES
(57, 1061, 29, '2025-06-16', 221),
(61, 1063, 29, '2025-06-23', 231);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int NOT NULL AUTO_INCREMENT,
  `contenu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sujet_message` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_envoi` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lu` tinyint(1) NOT NULL DEFAULT '0',
  `id_expediteur` int DEFAULT NULL,
  `id_destinataire` int DEFAULT NULL,
  PRIMARY KEY (`id_message`),
  KEY `id_expediteur` (`id_expediteur`),
  KEY `id_destinataire` (`id_destinataire`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id_message`, `contenu`, `sujet_message`, `date_envoi`, `lu`, `id_expediteur`, `id_destinataire`) VALUES
(118, 'tttt', 'toto', '2025-06-13 10:48:58', 1, 53, 18),
(119, 'rrrr', 'RE: toto', '2025-06-13 10:49:15', 1, 18, 53),
(120, 'zzz', 'RE: RE: toto', '2025-06-13 10:49:39', 1, 53, 18),
(121, 'fff', 'RE: RE: RE: toto', '2025-06-13 10:50:02', 0, 18, 53),
(122, 'ggg', 'question chien', '2025-06-13 10:53:25', 1, 1036, 18),
(123, 'ffff', 'RE: question chien', '2025-06-13 10:53:44', 1, 18, 1036),
(124, 'ggg', 'RE: RE: question chien', '2025-06-13 10:54:07', 0, 1036, 18),
(125, 'ijiuiug', 'ppppp', '2025-06-13 11:11:22', 0, 18, 1060),
(126, 'fdgqdfg', 'dwfgsf', '2025-06-13 11:11:52', 1, 1060, 1064),
(127, 'jhihih', 'RE: dwfgsf', '2025-06-13 11:12:58', 1, 1064, 1060),
(128, 'ibijvhuvhvjv', 'RE: RE: dwfgsf', '2025-06-13 11:13:52', 1, 1060, 1064),
(129, 'hggvhgvghvhv', 'RE: RE: RE: dwfgsf', '2025-06-13 11:14:17', 1, 1064, 1060),
(130, 'mmmmmmmmmmmmmmmmm', 'yyyy', '2025-06-13 11:29:47', 1, 1063, 1064),
(131, 'kkkkkkkk', 'kkkkkk', '2025-06-13 11:30:04', 0, 1063, 1060),
(132, 'vndfgn', 'RE: yyyy', '2025-06-13 11:30:58', 1, 1064, 1063),
(133, 'fgqdsre', 'sddfdsfg', '2025-06-13 13:58:54', 1, 1063, 1064),
(134, 'fddsdrgsdhres', 'RE: sddfdsfg', '2025-06-13 14:01:13', 0, 1064, 1063),
(135, 'hvjvjv', 'dwfgsf', '2025-06-14 01:14:37', 1, 1059, 1064),
(136, 'sdqqqqqqqqqqqqqqqq', 'RE: dwfgsf', '2025-06-14 01:15:24', 0, 1064, 1059),
(138, 'ttttttttttttttttttt', 'RE: ddddddd', '2025-06-16 16:22:22', 1, 1064, 1061);

-- --------------------------------------------------------

--
-- Structure de la table `progression`
--

DROP TABLE IF EXISTS `progression`;
CREATE TABLE IF NOT EXISTS `progression` (
  `id_progression` int NOT NULL AUTO_INCREMENT,
  `date_progression` date DEFAULT NULL,
  `commentaire` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `niveau_atteint` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_chien` int DEFAULT NULL,
  `id_coach` int DEFAULT NULL,
  PRIMARY KEY (`id_progression`),
  KEY `id_chien` (`id_chien`),
  KEY `id_coach` (`id_coach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `race`
--

DROP TABLE IF EXISTS `race`;
CREATE TABLE IF NOT EXISTS `race` (
  `id_race` int NOT NULL AUTO_INCREMENT,
  `nom_race` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_race`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `race`
--

INSERT INTO `race` (`id_race`, `nom_race`, `date_creation`) VALUES
(1, 'Affenpinscher', '2025-05-20 14:53:37'),
(2, 'Akita Inu', '2025-05-20 14:53:37'),
(3, 'Akita Américain', '2025-05-20 14:53:37'),
(4, 'Alaskan Malamute', '2025-05-20 14:53:37'),
(5, 'American Staffordshire Terrier', '2025-05-20 14:53:37'),
(6, 'Azawakh', '2025-05-20 14:53:37'),
(7, 'Barbet', '2025-05-20 14:53:37'),
(8, 'Barzoï (Lévrier russe)', '2025-05-20 14:53:37'),
(9, 'Basenji', '2025-05-20 14:53:37'),
(10, 'Basset Hound', '2025-05-20 14:53:37'),
(11, 'Beagle', '2025-05-20 14:53:37'),
(12, 'Bearded Collie', '2025-05-20 14:53:37'),
(13, 'Beauceron (Berger de Beauce)', '2025-05-20 14:53:37'),
(14, 'Berger Allemand', '2025-05-20 14:53:37'),
(15, 'Berger Australien', '2025-05-20 14:53:37'),
(16, 'Berger Belge (Malinois, Tervueren, Groenendael, Laekenois)', '2025-05-20 14:53:37'),
(17, 'Berger Blanc Suisse', '2025-05-20 14:53:37'),
(18, 'Berger des Pyrénées', '2025-05-20 14:53:37'),
(19, 'Berger Hollandais', '2025-05-20 14:53:37'),
(20, 'Berger du Caucase', '2025-05-20 14:53:37'),
(21, 'Bichon Frisé', '2025-05-20 14:53:37'),
(22, 'Bichon Maltais', '2025-05-20 14:53:37'),
(23, 'Bichon Havanais', '2025-05-20 14:53:37'),
(24, 'Bichon Bolonais', '2025-05-20 14:53:37'),
(25, 'Billy', '2025-05-20 14:53:37'),
(26, 'Border Collie', '2025-05-20 14:53:37'),
(27, 'Bouledogue Français', '2025-05-20 14:53:37'),
(28, 'Bouledogue Anglais', '2025-05-20 14:53:37'),
(29, 'Bouvier Bernois', '2025-05-20 14:53:37'),
(30, 'Bouvier des Flandres', '2025-05-20 14:53:37'),
(31, 'Boxer', '2025-05-20 14:53:37'),
(32, 'Cairn Terrier', '2025-05-20 14:53:37'),
(33, 'Caniche', '2025-05-20 14:53:37'),
(34, 'Cane Corso', '2025-05-20 14:53:37'),
(35, 'Carlin (Pug)', '2025-05-20 14:53:37'),
(36, 'Chihuahua', '2025-05-20 14:53:37'),
(37, 'Chow-Chow', '2025-05-20 14:53:37'),
(38, 'Cocker Spaniel Anglais', '2025-05-20 14:53:37'),
(39, 'Cocker Spaniel Américain', '2025-05-20 14:53:37'),
(40, 'Colley (à poil long et court)', '2025-05-20 14:53:37'),
(41, 'Coton de Tuléar', '2025-05-20 14:53:37'),
(42, 'Cursinu', '2025-05-20 14:53:37'),
(43, 'Dalmatien', '2025-05-20 14:53:37'),
(44, 'Dandie Dinmont Terrier', '2025-05-20 14:53:37'),
(45, 'Dobermann', '2025-05-20 14:53:37'),
(46, 'Dogue Allemand', '2025-05-20 14:53:37'),
(47, 'Dogue Argentin', '2025-05-20 14:53:37'),
(48, 'Dogue de Bordeaux', '2025-05-20 14:53:37'),
(49, 'Dogue du Tibet', '2025-05-20 14:53:37'),
(50, 'Épagneul Breton', '2025-05-20 14:53:37'),
(51, 'Épagneul Français', '2025-05-20 14:53:37'),
(52, 'Épagneul Japonais', '2025-05-20 14:53:37'),
(53, 'Épagneul Picard', '2025-05-20 14:53:37'),
(54, 'Épagneul Tibétain', '2025-05-20 14:53:37'),
(55, 'Fila Brasileiro', '2025-05-20 14:53:37'),
(56, 'Fox Terrier (à poil lisse et dur)', '2025-05-20 14:53:37'),
(57, 'Golden Retriever', '2025-05-20 14:53:37'),
(58, 'Grand Basset Griffon Vendéen', '2025-05-20 14:53:37'),
(59, 'Grand Bleu de Gascogne', '2025-05-20 14:53:37'),
(60, 'Grand Danois', '2025-05-20 14:53:37'),
(61, 'Griffon Bruxellois', '2025-05-20 14:53:37'),
(62, 'Griffon Korthals', '2025-05-20 14:53:37'),
(63, 'Harrier', '2025-05-20 14:53:37'),
(64, 'Husky Sibérien', '2025-05-20 14:53:37'),
(65, 'Hovawart', '2025-05-20 14:53:37'),
(66, 'Irish Terrier', '2025-05-20 14:53:37'),
(67, 'Irish Wolfhound (Lévrier Irlandais)', '2025-05-20 14:53:37'),
(68, 'Jack Russell Terrier', '2025-05-20 14:53:37'),
(69, 'Japanese Chin (Épagneul Japonais)', '2025-05-20 14:53:37'),
(70, 'Kangal', '2025-05-20 14:53:37'),
(71, 'Kelpie Australien', '2025-05-20 14:53:37'),
(72, 'Kerry Blue Terrier', '2025-05-20 14:53:37'),
(73, 'King Charles Spaniel', '2025-05-20 14:53:37'),
(74, 'Labrador Retriever', '2025-05-20 14:53:37'),
(75, 'Laïka', '2025-05-20 14:53:37'),
(76, 'Landseer', '2025-05-20 14:53:37'),
(77, 'Leonberg', '2025-05-20 14:53:37'),
(78, 'Lhassa Apso', '2025-05-20 14:53:37'),
(79, 'Malamute d\'Alaska', '2025-05-20 14:53:37'),
(80, 'Mastiff', '2025-05-20 14:53:37'),
(81, 'Mâtin Napolitain', '2025-05-20 14:53:37'),
(82, 'Montagne des Pyrénées', '2025-05-20 14:53:37'),
(83, 'Norfolk Terrier', '2025-05-20 14:53:37'),
(84, 'Norwich Terrier', '2025-05-20 14:53:37'),
(85, 'Otterhound', '2025-05-20 14:53:37'),
(86, 'Papillon', '2025-05-20 14:53:37'),
(87, 'Pékinois', '2025-05-20 14:53:37'),
(88, 'Petit Basset Griffon Vendéen', '2025-05-20 14:53:37'),
(89, 'Pinscher Nain', '2025-05-20 14:53:37'),
(90, 'Pointer Anglais', '2025-05-20 14:53:37'),
(91, 'Puli', '2025-05-20 14:53:37'),
(92, 'Pumi', '2025-05-20 14:53:37'),
(93, 'Retriever de la Baie de Chesapeake', '2025-05-20 14:53:37'),
(94, 'Rhodesian Ridgeback', '2025-05-20 14:53:37'),
(95, 'Rottweiler', '2025-05-20 14:53:37'),
(96, 'Saint-Bernard', '2025-05-20 14:53:37'),
(97, 'Samoyède', '2025-05-20 14:53:37'),
(98, 'Schnauzer (nain, moyen, géant)', '2025-05-20 14:53:37'),
(99, 'Setter Anglais', '2025-05-20 14:53:37'),
(100, 'Setter Gordon', '2025-05-20 14:53:37'),
(101, 'Setter Irlandais', '2025-05-20 14:53:37'),
(102, 'Shar Pei', '2025-05-20 14:53:37'),
(103, 'Shiba Inu', '2025-05-20 14:53:37'),
(104, 'Shih Tzu', '2025-05-20 14:53:37'),
(105, 'Skye Terrier', '2025-05-20 14:53:37'),
(106, 'Spitz Allemand', '2025-05-20 14:53:37'),
(107, 'Staffordshire Bull Terrier', '2025-05-20 14:53:37'),
(108, 'Teckel', '2025-05-20 14:53:37'),
(109, 'Terrier de Boston', '2025-05-20 14:53:37'),
(110, 'Terrier Écossais', '2025-05-20 14:53:37'),
(111, 'Tosa Inu', '2025-05-20 14:53:37'),
(112, 'Vizsla (Braque Hongrois)', '2025-05-20 14:53:37'),
(113, 'Welsh Corgi (Cardigan et Pembroke)', '2025-05-20 14:53:37'),
(114, 'Welsh Terrier', '2025-05-20 14:53:37'),
(115, 'West Highland White Terrier', '2025-05-20 14:53:37'),
(116, 'Whippet', '2025-05-20 14:53:37'),
(117, 'Yorkshire Terrier', '2025-05-20 14:53:37');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `date_reservation` datetime DEFAULT NULL,
  `id_utilisateur` int DEFAULT NULL,
  `id_dog` int DEFAULT NULL,
  `id_seance` int DEFAULT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_chien` (`id_dog`),
  KEY `fk_reservation_seance` (`id_seance`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_reservation`, `id_utilisateur`, `id_dog`, `id_seance`) VALUES
(187, '2025-06-16 16:00:40', 1063, 210, 150),
(188, '2025-06-16 16:07:49', 1059, 213, 150),
(191, '2025-06-23 13:28:08', 1063, 210, 151);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description_role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `nom_role`, `description_role`) VALUES
(1, 'admin', NULL),
(2, 'coach', NULL),
(3, 'utilisateur', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id_seance` int NOT NULL AUTO_INCREMENT,
  `date_seance` date DEFAULT NULL,
  `heure_seance` time DEFAULT NULL,
  `places_disponibles` int DEFAULT NULL,
  `duree_seance` time DEFAULT NULL,
  `statut_seance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_cours` int DEFAULT NULL,
  `id_utilisateur` int DEFAULT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `fk_seance_utilisateur` (`id_utilisateur`),
  KEY `fk_seance_cours` (`id_cours`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id_seance`, `date_seance`, `heure_seance`, `places_disponibles`, `duree_seance`, `statut_seance`, `id_cours`, `id_utilisateur`) VALUES
(150, '2025-06-16', '10:00:00', 42, NULL, NULL, 157, 1058),
(151, '2025-06-23', '10:00:00', 22, NULL, NULL, 158, 1065);

-- --------------------------------------------------------

--
-- Structure de la table `type_cours`
--

DROP TABLE IF EXISTS `type_cours`;
CREATE TABLE IF NOT EXISTS `type_cours` (
  `id_type_cours` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_type_cours`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_cours`
--

INSERT INTO `type_cours` (`id_type_cours`, `nom`) VALUES
(1, 'Ecole du chiot'),
(2, 'Education canine'),
(3, 'Agilité'),
(4, 'Pistage'),
(5, 'Flyball'),
(6, 'Protection & Défense');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `nom_utilisateur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom_utilisateur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `admin_mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `admin_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telephone_utilisateur` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_inscription` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `admin_mail` (`admin_mail`),
  KEY `fk_utilisateur_role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=1095 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom_utilisateur`, `prenom_utilisateur`, `admin_mail`, `admin_password`, `telephone_utilisateur`, `date_inscription`, `id_role`) VALUES
(1058, 'Quirin', 'Franck', 'fran@gmail.com', '$2y$10$jxtSjFvPFwoqcpRUrO7Co.beIqf24w4859YfjmIkzVG22QpQNwbW2', '5555555555555', '2025-06-13 11:02:01', 2),
(1059, 'Mengus', 'Océane', 'oce@gmail.com', '$2y$10$dDz952nWdc.DW.b3UXLMy.Sa6al.znDGXYSTvb6K3rM4l1V/XJeYi', '888888888888', '2025-06-13 11:03:48', 3),
(1060, 'yannick', 'remy', 'yan@gmail.com', '$2y$10$NmI2hUnKBCVDZ6QEisJXdeyZpJyYb9jjC3XrpntsQgi8sBnmXYkvG', '999999', '2025-06-13 11:05:21', 2),
(1061, 'grini', 'samir', 'grini@gmail.com', '$2y$10$WAzPMvtJji7mUYgyakf4qOE6Cq3GEvq9NWvlo0deHgABCYRXpazOW', '2222222222222', '2025-06-13 11:06:29', 3),
(1062, 'Baummann', 'alexandra', 'alex@gmail.com', '$2y$10$6b2wwkz1fsRyzrEmi/5Sx.rBIIx9nE4QXy8T.Ra8lQ7upCqD9awuK', '333333333333', '2025-06-13 11:07:46', 2),
(1063, 'scrivo', 'arnaud', 'arnaud@gmail.com', '$2y$10$3RbQ9fPyYn8Nd.10PahLceUpTpDxHlMpp5K.Cx71XmZ/OuKAZ19ve', '7777777', '2025-06-13 11:08:38', 3),
(1064, 'admin', 'admin', 'admin@gmail.com', '$2y$10$9KhsP5ZZpYvvYwEyb8rqwu5tNBIvoT32mwgLLNfFKdhOX.uNlbtfW', '88888888888', '2025-06-13 11:09:39', 1),
(1065, 'retibi', 'nabil', 'nabil@gmail.com', '$2y$10$dD5j4n6KfvHlt3eTgAfJNeTTrun7un3.rrzJbzSmLE8D7esLoFgKm', '66666666666666666', '2025-06-13 11:34:22', 2),
(1069, 'admin2', 'admin2', 'admin2@gmail.com', '$2y$10$V9Rux4qA6my4fDszsyakte7fXGlPIrXStHCCwfsXfK9tFvJyhtuVu', '77777777777', '2025-06-13 11:51:46', 1),
(1087, 'yassine', 'el', 'abdel@gmail.com', '$2y$10$NrwR0zdXraLXn4w6jYMxtOOUdWrykTZmOqPc7QFCMTh5ZjO6KCsIu', '555555555', '2025-06-16 16:11:55', 3),
(1088, 'lulu', 'lu', 'luv@gmail.com', '$2y$10$yX79nWlD9gLCmC3z/ZBVzuCA341C3S6kZ6BuxnYTziFO/C7H2alp2', '555555555', '2025-06-20 08:47:00', 3),
(1089, NULL, NULL, 'a@a.fr', '$2b$10$Ei0sPwq4Bw8hgQdLKJ1Jd.e4Ik/3k15xn7Qjm.E8jy9bLOTjXJsxy', NULL, '2025-06-23 09:04:07', 3),
(1090, NULL, NULL, 'b@b.fr', '$2b$10$f4o0Dap8IU/rEzGdA4MOFuaJ7vMG.MhTbZHWm59goCgfEEd0x8RVK', NULL, '2025-06-23 09:07:30', 2),
(1091, NULL, NULL, 'c@c.fr', '$2b$10$3KwJO75UFcDESM/RKlro5eMrYb8Qtj1RgnwhE3WZhdiR.03mJNG4y', NULL, '2025-06-23 11:39:51', 2),
(1092, NULL, NULL, 'e@e.fr', '$2b$10$nUDamp0ap2hYqBSX57TU/.2S/gi6awTkDIIBnziSo.fJCiVbj3NCa', NULL, '2025-06-24 10:52:04', 3),
(1093, 'loil', 'liol', 'loil@gmail.com', '$2y$10$lNTnGyvNaWxxVEliaraI5Ole9zg2rOaCCekMYpGJn8NUGzE7M/pWO', '777777777777777', '2025-06-24 14:14:06', 3),
(1094, 'lululu', 'EFQEFQQQQQ', 'ty@gmail.com', '$2y$10$CWM.T2Rsm1rjpgf.Z793N.82jVdz7e8iIqfB7iDJLsLPIR7Yb8g8i', '444444444444', '2025-06-24 23:26:27', 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_role`
--

DROP TABLE IF EXISTS `utilisateur_role`;
CREATE TABLE IF NOT EXISTS `utilisateur_role` (
  `id_utilisateur` int NOT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_role`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur_role`
--

INSERT INTO `utilisateur_role` (`id_utilisateur`, `id_role`) VALUES
(1064, 1),
(1069, 1),
(1058, 2),
(1060, 2),
(1062, 2),
(1065, 2),
(1059, 3),
(1061, 3),
(1063, 3),
(1087, 3),
(1088, 3),
(1093, 3),
(1094, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chien`
--
ALTER TABLE `chien`
  ADD CONSTRAINT `fk_chien_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chien_race` FOREIGN KEY (`id_race`) REFERENCES `race` (`id_race`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chien_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`id_dog`) REFERENCES `chien` (`id_dog`) ON DELETE CASCADE,
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE SET NULL,
  ADD CONSTRAINT `commentaire_ibfk_3` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`) ON DELETE SET NULL;

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `fk_id_coach` FOREIGN KEY (`id_coach`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE SET NULL;

--
-- Contraintes pour la table `inscription_evenement`
--
ALTER TABLE `inscription_evenement`
  ADD CONSTRAINT `fk_id_dog` FOREIGN KEY (`id_dog`) REFERENCES `chien` (`id_dog`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscription_event` FOREIGN KEY (`id_event`) REFERENCES `evenement` (`id_event`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_seance` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`) ON DELETE CASCADE;

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `fk_seance_cours` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_seance_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

--
-- Contraintes pour la table `utilisateur_role`
--
ALTER TABLE `utilisateur_role`
  ADD CONSTRAINT `utilisateur_role_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE,
  ADD CONSTRAINT `utilisateur_role_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
