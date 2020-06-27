-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 27 juin 2020 à 15:37
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `wwsight`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_societe` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `code_postal` varchar(5) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `nom_contact` varchar(255) DEFAULT NULL,
  `prenom_contact` varchar(255) DEFAULT NULL,
  `mail_contact` varchar(255) DEFAULT NULL,
  `tel_contact` varchar(20) DEFAULT NULL,
  `poste` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom_societe`, `adresse`, `code_postal`, `ville`, `nom_contact`, `prenom_contact`, `mail_contact`, `tel_contact`, `poste`) VALUES
(1, 'Banque de France', 'poiuytr', '75001', 'Paris', 'Doe', 'John', 'john.doe@bdf.com', '0123456789', 'responsable RH');

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

DROP TABLE IF EXISTS `mission`;
CREATE TABLE IF NOT EXISTS `mission` (
  `idStaff` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  KEY `mission_fk_idClient` (`idClient`),
  KEY `mission_fk_idStaff` (`idStaff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

DROP TABLE IF EXISTS `poste`;
CREATE TABLE IF NOT EXISTS `poste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poste` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description_poste` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `poste`
--

INSERT INTO `poste` (`id`, `poste`, `description_poste`) VALUES
(1, 'CEO', 'fondateur et directeur de la société'),
(2, 'COO', NULL),
(3, 'Responsable développement commercial', NULL),
(4, 'Consultant WWSIGHT', NULL),
(5, 'Consultant WWSIGHT devOps', NULL),
(6, 'Lead développeur', NULL),
(7, 'Stagiaire', NULL),
(8, 'Apprenti', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idPoste` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `code_postal` varchar(5) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_fk_idPoste` (`idPoste`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `staff`
--

INSERT INTO `staff` (`id`, `nom`, `prenom`, `email`, `idPoste`, `adresse`, `code_postal`, `ville`) VALUES
(1, 'Guérineau', 'Hugo', 'hugo.guerineau@wwsight.com', 1, '143 bis rue de picpus', '75012', 'Paris'),
(3, 'Borne', 'Elodie', 'elodie.borne@gmail.com', 3, 'azertyui', '75012', 'Paris'),
(5, 'Tahri', 'Imen', 'imen.tahri@wwsight.com', 4, 'azertyu', '75012', 'Paris');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `mission`
--
ALTER TABLE `mission`
  ADD CONSTRAINT `mission_fk_idClient` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `mission_fk_idStaff` FOREIGN KEY (`idStaff`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_fk_idPoste` FOREIGN KEY (`idPoste`) REFERENCES `poste` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
