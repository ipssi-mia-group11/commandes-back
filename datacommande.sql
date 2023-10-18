-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 18 oct. 2023 à 16:28
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `datacommande`
--

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `ID` int(11) NOT NULL,
  `DateCommande` date DEFAULT NULL,
  `UtilisateurID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`ID`, `DateCommande`, `UtilisateurID`) VALUES
(1, '2023-10-01', 1),
(2, '2023-10-03', 2),
(3, '2023-10-05', 3),
(4, '2023-10-02', 6),
(5, '2023-09-20', 4),
(6, '2023-09-30', 2),
(7, '2023-09-16', 8),
(8, '2023-08-21', 1),
(9, '2023-08-01', 7),
(10, '2023-08-02', 6),
(11, '2023-07-12', 3),
(12, '2023-09-11', 8),
(13, '2023-05-05', 2),
(14, '2023-11-15', 1),
(16, '2023-07-12', 3),
(17, '2023-09-11', 8),
(18, '2023-05-05', 2),
(19, '2023-11-15', 1),
(20, '2023-10-01', 3);

-- --------------------------------------------------------

--
-- Structure de la table `detailscommande`
--

CREATE TABLE `detailscommande` (
  `ID` int(11) NOT NULL,
  `CommandeID` int(11) DEFAULT NULL,
  `ProduitID` int(11) DEFAULT NULL,
  `Quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `detailscommande`
--

INSERT INTO `detailscommande` (`ID`, `CommandeID`, `ProduitID`, `Quantite`) VALUES
(1, 1, 1, 2),
(2, 2, 3, 1),
(3, 3, 2, 3),
(4, 3, 15, 2),
(5, 2, 14, 5),
(6, 1, 4, 4),
(7, 3, 9, 5),
(8, 2, 21, 10),
(9, 2, 7, 17),
(10, 1, 12, 40),
(11, 2, 2, 35),
(12, 2, 15, 67),
(13, 6, 19, 78),
(14, 3, 9, 9);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `ID` int(11) NOT NULL,
  `NomProduit` varchar(100) DEFAULT NULL,
  `Prix` decimal(10,2) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`ID`, `NomProduit`, `Prix`, `Stock`) VALUES
(1, 'Ordinateur portable', 949.99, 50),
(2, 'Smartphone', 599.99, 65),
(3, 'Téléviseur LED', 799.99, 30),
(4, 'UnCableHMDI', 699.99, 16),
(5, 'UnGoogleHome', 899.99, 70),
(6, 'UneEnceinteJBL', 999.99, 10),
(7, 'TELEPHONE', 999.00, -10),
(8, 'TELEPHONE', 999.99, 7),
(9, 'CLE USB', 49.00, 56),
(11, 'CLAVIER', 29.99, 50),
(12, 'SOURIS', 39.99, 0),
(13, 'IMPRIMANTE', 129.99, 33),
(14, 'TABLETTE', 899.99, 81),
(15, 'CHARGEUR', 29.99, 51),
(16, 'AIRPODS', 399.99, 100),
(17, 'POWERBANG', 299.99, 90),
(18, 'CASQUE', 199.99, 40),
(19, 'COQUE', 19.99, 92),
(20, 'BATTERIE', 99.99, 40),
(21, 'IPAD', 899.99, 10),
(22, 'UNITECENTRAL', 289.99, 10),
(23, 'CASQUEFIL', 99.99, 70);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`ID`, `Nom`, `Prenom`, `Age`, `Email`) VALUES
(1, 'Doe', 'John', 30, 'john.doe@email.com'),
(2, 'Smith', 'Jane', 25, 'jane.smith@email.com'),
(3, 'Johnson', 'Robert', 40, 'robert.johnson@email.com'),
(4, 'BAILLET', 'JULIETTE', 25, 'BAILLETJULIETTE@GMAIL.COM'),
(6, 'BEHBAHANI', 'NICOLAS', 45, 'BEHBAHANINICOLAS@GMAIL.COM'),
(7, 'CHARLES', 'MATHIEU', 25, 'CHARLESMATHIEU@GMAIL.COM'),
(8, 'MAGAT', 'PAUL', 50, 'MAGATPAUL@GMAIL.COM'),
(9, 'DARCUZ', 'EMMA', 18, 'DARCUZEMMA@OUTLOOK.FR'),
(10, 'MARTIN', 'ALEXANDRE', 23, 'ALEXANDREMARTIN@OUTLOOK.FR'),
(11, 'KEVIN', 'DUBOIT', 54, 'DUBOITKEVIN@GMAIL.FR');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Index pour la table `detailscommande`
--
ALTER TABLE `detailscommande`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CommandeID` (`CommandeID`),
  ADD KEY `ProduitID` (`ProduitID`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `detailscommande`
--
ALTER TABLE `detailscommande`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateurs` (`ID`);

--
-- Contraintes pour la table `detailscommande`
--
ALTER TABLE `detailscommande`
  ADD CONSTRAINT `detailscommande_ibfk_1` FOREIGN KEY (`CommandeID`) REFERENCES `commandes` (`ID`),
  ADD CONSTRAINT `detailscommande_ibfk_2` FOREIGN KEY (`ProduitID`) REFERENCES `produits` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
