-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 21 nov. 2022 à 19:22
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `manu`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `libelle_article` varchar(100) NOT NULL,
  `poids_net` float NOT NULL,
  `code_article_fam` varchar(100) NOT NULL,
  `code_unite` varchar(10) NOT NULL,
  `poids_brut` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `libelle_article`, `poids_net`, `code_article_fam`, `code_unite`, `poids_brut`) VALUES
(1, 'FIBRE MARQUE 010', 11, 'FIBRE', 'Balle', 12),
(2, 'TABLES', 8, 'MOBILIERS', 'Unité', 9),
(3, 'HUILE DIAMAOR', 10, 'FIBRE', 'Carton', 11),
(4, 'COTON GRAINE', 10, 'GRAINES', 'KG', 15);

-- --------------------------------------------------------

--
-- Structure de la table `article_famille`
--

CREATE TABLE `article_famille` (
  `code_article_fam` varchar(100) NOT NULL,
  `libelle_article_fam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article_famille`
--

INSERT INTO `article_famille` (`code_article_fam`, `libelle_article_fam`) VALUES
('FIBRE', 'Fibres de coton'),
('GRAINES', 'Graines'),
('MOBILIERS', 'Mobiliers de bureau');

-- --------------------------------------------------------

--
-- Structure de la table `exercice`
--

CREATE TABLE `exercice` (
  `id_exercice` int(11) NOT NULL,
  `nm_exercice` varchar(100) NOT NULL,
  `dd_exercice` date NOT NULL,
  `df_exercice` date NOT NULL,
  `et_exercice` varchar(100) NOT NULL,
  `dc_exercice` varchar(100) NOT NULL,
  `pc_exercice` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `exercice`
--

INSERT INTO `exercice` (`id_exercice`, `nm_exercice`, `dd_exercice`, `df_exercice`, `et_exercice`, `dc_exercice`, `pc_exercice`) VALUES
(1, '2022', '2022-01-01', '2022-12-31', '365 Jours', '12', '12'),
(2, '2021', '2021-01-01', '2021-12-31', '365 Jours', '12', '12'),
(3, '2020', '2020-01-01', '2020-12-31', '365 Jours', '12', '12'),
(4, '2019', '2019-01-01', '2019-12-31', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id_facture` int(11) NOT NULL,
  `num_facture` varchar(20) NOT NULL,
  `dt_edit_facture` date NOT NULL,
  `mt_facture` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `edit` varchar(100) NOT NULL,
  `mt_facture_ttc` float NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_prestataire` int(11) NOT NULL,
  `id_site` int(11) NOT NULL,
  `id_exercice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `facture_detail`
--

CREATE TABLE `facture_detail` (
  `id_detail_facture` int(11) NOT NULL,
  `mt_detail_fact` float NOT NULL,
  `id_manutention` int(11) NOT NULL,
  `id_facture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `manutention`
--

CREATE TABLE `manutention` (
  `id_manutention` int(11) NOT NULL,
  `dt_manutention` timestamp NOT NULL DEFAULT current_timestamp(),
  `or_manutention` varchar(100) NOT NULL,
  `vf_manutention` varchar(100) DEFAULT NULL,
  `va_manutention` varchar(100) DEFAULT NULL,
  `en_manutention` varchar(100) DEFAULT NULL,
  `rf_manutention` varchar(100) DEFAULT NULL,
  `tt_manutention` float DEFAULT NULL,
  `pa_manutention` varchar(100) DEFAULT NULL,
  `id_exercice` int(11) NOT NULL,
  `id_prestataire` int(11) NOT NULL,
  `id_site` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `manutention`
--

INSERT INTO `manutention` (`id_manutention`, `dt_manutention`, `or_manutention`, `vf_manutention`, `va_manutention`, `en_manutention`, `rf_manutention`, `tt_manutention`, `pa_manutention`, `id_exercice`, `id_prestataire`, `id_site`) VALUES
(67, '2022-09-19 14:38:32', 'Hawaou', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(68, '2022-09-19 15:30:50', 'AHMADOU YASSINE', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2),
(69, '2022-09-20 08:02:32', 'Yass', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 2),
(70, '2022-09-20 08:02:34', 'Yass', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 2),
(71, '2022-09-20 09:56:30', 'Hawaou', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 1),
(72, '2022-09-21 15:19:06', 'YASS', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(73, '2022-09-21 16:43:49', 'BORIS', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 1),
(75, '2022-09-21 16:58:50', 'HASSANA', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(76, '2022-09-21 16:58:50', 'HASSANA', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(77, '2022-09-26 09:54:33', 'Jonathan Morisson', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(78, '2022-09-26 09:54:33', 'Jonathan Morisson', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(79, '2022-09-26 09:54:33', 'Jonathan Morisson', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(80, '2022-09-26 09:54:33', 'Jonathan Morisson', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(81, '2022-09-26 11:03:44', 'Yass', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(82, '2022-09-29 09:04:14', 'Hubert', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2),
(83, '2022-09-29 10:02:17', 'Aziz', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2),
(84, '2022-09-29 14:30:47', 'Moktar', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(85, '2022-10-04 11:56:41', 'yassine', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(86, '2022-10-05 10:28:48', 'ord', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(87, '2022-10-05 11:33:36', 'Iai', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 2),
(88, '2022-10-05 13:40:17', 'ord', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1),
(89, '2022-10-05 13:41:29', 'ord', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `manutention_detail`
--

CREATE TABLE `manutention_detail` (
  `id_detail_manu` int(11) NOT NULL,
  `id_manutention` int(11) DEFAULT NULL,
  `qt_manutention` int(11) NOT NULL,
  `pu_manutention` float DEFAULT NULL,
  `mt_manutention` float DEFAULT NULL,
  `ob_manutention` varchar(100) DEFAULT NULL,
  `qt_reel_manutention` int(11) DEFAULT NULL,
  `ref_manutention` varchar(100) DEFAULT NULL,
  `id_article` int(11) DEFAULT NULL,
  `id_operation` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `manutention_detail`
--

INSERT INTO `manutention_detail` (`id_detail_manu`, `id_manutention`, `qt_manutention`, `pu_manutention`, `mt_manutention`, `ob_manutention`, `qt_reel_manutention`, `ref_manutention`, `id_article`, `id_operation`, `id_utilisateur`) VALUES
(30, 67, 10, 50, NULL, '', NULL, NULL, 1, 1, 1),
(31, 68, 400, 35, NULL, '', NULL, NULL, 3, 4, 1),
(32, 69, 100, 1000, NULL, '', NULL, NULL, 3, 2, 1),
(33, 70, 100, 1000, NULL, '', NULL, NULL, 3, 2, 1),
(34, 71, 100, 35, NULL, 'RAS', 110, NULL, 4, 4, 1),
(35, 72, 24, 50, NULL, '', 33, NULL, 1, 1, 1),
(36, 73, 100, 35, NULL, 'RAS', 97, NULL, 3, 4, 1),
(38, 75, 50, 35, NULL, '', NULL, NULL, 4, 4, 1),
(39, 76, 50, 35, NULL, '', 49, NULL, 4, 4, 1),
(40, 80, 100, 35, NULL, '', NULL, NULL, 3, 4, 1),
(41, 78, 100, 35, NULL, '', NULL, NULL, 3, 4, 1),
(42, 77, 100, 35, NULL, '', NULL, NULL, 3, 4, 1),
(43, 79, 100, 35, NULL, '', NULL, NULL, 3, 4, 1),
(44, 81, 10, 50, NULL, '', NULL, NULL, 1, 1, 1),
(45, 82, 100, 35, NULL, '', NULL, NULL, 3, 4, 1),
(46, 83, 50, 50, NULL, 'RAS', NULL, NULL, 4, 1, 1),
(47, 84, 34, 50, NULL, '', 35, NULL, 1, 1, 1),
(48, 85, 5, 50, NULL, '', 5, NULL, 1, 1, 1),
(49, 86, 2, 50, NULL, '', NULL, NULL, 1, 1, 1),
(50, 87, 100, 50, NULL, 'RAS', 101, NULL, 4, 1, 1),
(51, 88, 5, 50, NULL, '', NULL, NULL, 1, 1, 1),
(52, 89, 5, 50, NULL, '', NULL, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE `operation` (
  `id_operation` int(11) NOT NULL,
  `libelle_oper` varchar(100) NOT NULL,
  `prix_unit` float NOT NULL,
  `code_unite` varchar(10) NOT NULL,
  `id_categorie_operation` int(11) NOT NULL,
  `id_exercice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `operation`
--

INSERT INTO `operation` (`id_operation`, `libelle_oper`, `prix_unit`, `code_unite`, `id_categorie_operation`, `id_exercice`) VALUES
(1, 'Reconditionnement balle', 50, 'Balle', 3, 1),
(2, 'Pliage et depliage des baches', 1000, 'Bâche', 3, 1),
(3, 'Chargement & Déchargement Coton', 1200, 'KG', 1, 1),
(4, 'Mise en stockage', 35, 'KG', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `operation_categorie`
--

CREATE TABLE `operation_categorie` (
  `id_categorie_operation` int(11) NOT NULL,
  `libelle_categrorie_operation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `operation_categorie`
--

INSERT INTO `operation_categorie` (`id_categorie_operation`, `libelle_categrorie_operation`) VALUES
(1, 'Chargement'),
(2, 'Deplacement'),
(3, 'Conditionnement');

-- --------------------------------------------------------

--
-- Structure de la table `prestataire`
--

CREATE TABLE `prestataire` (
  `id_prestataire` int(11) NOT NULL,
  `nm_prestataire` varchar(100) NOT NULL,
  `nc_prestataire` varchar(100) NOT NULL,
  `bq_prestataire` varchar(100) NOT NULL,
  `tl_prestataire` int(12) NOT NULL,
  `bp_prestataire` int(6) NOT NULL,
  `em_prestataire` varchar(100) NOT NULL,
  `ty_prestataire` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `prestataire`
--

INSERT INTO `prestataire` (`id_prestataire`, `nm_prestataire`, `nc_prestataire`, `bq_prestataire`, `tl_prestataire`, `bp_prestataire`, `em_prestataire`, `ty_prestataire`) VALUES
(1, 'Ets Bouba et Fils', '00200100304', 'ECOBANK', 698989898, 102, 'etshawaou@gmail.com', 'ETS'),
(2, 'Global Man', '10270180844', 'SGBC', 699999999, 289, 'globalman@gmail.com', 'ETS'),
(3, 'Ets Manu Plus', '040506080902', 'UBA', 687541235, 0, 'etsmanuplus123@gmail.com', 'ETS'),
(5, 'Golden Service', '181417151969', 'ECOBANK', 656789845, 0, '', '');

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE `profil` (
  `id_profil` int(11) NOT NULL,
  `nm_profil` varchar(45) NOT NULL,
  `desc_profil` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `profil`
--

INSERT INTO `profil` (`id_profil`, `nm_profil`, `desc_profil`) VALUES
(1, 'Agent de saisie', 'Enregistre les manutentions'),
(2, 'Vérificateur', 'Verifie les manutentions'),
(3, 'Ordonateur', 'Gere les manutentions et les factures');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id_site` int(11) NOT NULL,
  `nm_site` varchar(100) NOT NULL,
  `id_site_parent` int(11) NOT NULL,
  `rg_site` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id_site`, `nm_site`, `id_site_parent`, `rg_site`) VALUES
(1, 'EGRENAGE HOME', 1, 'GAROUA 1'),
(2, 'MAGASIN GRA II', 2, 'Garoua II');

-- --------------------------------------------------------

--
-- Structure de la table `unite`
--

CREATE TABLE `unite` (
  `code_unite` varchar(10) NOT NULL,
  `libelle_unite` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `unite`
--

INSERT INTO `unite` (`code_unite`, `libelle_unite`) VALUES
('Bâche', 'Bâche'),
('Balle', 'Balle'),
('Carton', 'Carton'),
('KG', 'Kilogramme'),
('T', 'Tonnes'),
('Unité', 'Unité');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(4) NOT NULL,
  `login` varchar(50) NOT NULL,
  `mdp` varchar(40) NOT NULL,
  `nm_utilisateur` varchar(40) NOT NULL,
  `id_site` int(4) DEFAULT NULL,
  `id_profil` int(4) NOT NULL,
  `id_exercice` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `login`, `mdp`, `nm_utilisateur`, `id_site`, `id_profil`, `id_exercice`) VALUES
(1, 'agent@sdcc.cm', '111111', 'Yassine', 1, 1, 1),
(2, 'verif@sdcc.cm', '222222', 'Hawaou', 1, 2, 1),
(3, 'ord@sdcc.cm', '333333', 'Chehou Ousmanou', 1, 3, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `code_unite` (`code_unite`),
  ADD KEY `code_article_fam` (`code_article_fam`);

--
-- Index pour la table `article_famille`
--
ALTER TABLE `article_famille`
  ADD PRIMARY KEY (`code_article_fam`);

--
-- Index pour la table `exercice`
--
ALTER TABLE `exercice`
  ADD PRIMARY KEY (`id_exercice`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id_facture`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_prestataire` (`id_prestataire`),
  ADD KEY `id_site` (`id_site`),
  ADD KEY `id_exercice` (`id_exercice`);

--
-- Index pour la table `facture_detail`
--
ALTER TABLE `facture_detail`
  ADD PRIMARY KEY (`id_detail_facture`),
  ADD KEY `id_manutention` (`id_manutention`),
  ADD KEY `id_facture` (`id_facture`);

--
-- Index pour la table `manutention`
--
ALTER TABLE `manutention`
  ADD PRIMARY KEY (`id_manutention`),
  ADD KEY `id_exercice` (`id_exercice`),
  ADD KEY `id_prestataire` (`id_prestataire`),
  ADD KEY `id_site` (`id_site`);

--
-- Index pour la table `manutention_detail`
--
ALTER TABLE `manutention_detail`
  ADD PRIMARY KEY (`id_detail_manu`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_manutention` (`id_manutention`),
  ADD KEY `id_operation` (`id_operation`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`id_operation`),
  ADD KEY `id_exercice` (`id_exercice`),
  ADD KEY `id_categorie_operation` (`id_categorie_operation`),
  ADD KEY `code_unite` (`code_unite`);

--
-- Index pour la table `operation_categorie`
--
ALTER TABLE `operation_categorie`
  ADD PRIMARY KEY (`id_categorie_operation`);

--
-- Index pour la table `prestataire`
--
ALTER TABLE `prestataire`
  ADD PRIMARY KEY (`id_prestataire`);

--
-- Index pour la table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id_site`);

--
-- Index pour la table `unite`
--
ALTER TABLE `unite`
  ADD PRIMARY KEY (`code_unite`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `id_profil` (`id_profil`),
  ADD KEY `id_site` (`id_site`),
  ADD KEY `id_exercice` (`id_exercice`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `exercice`
--
ALTER TABLE `exercice`
  MODIFY `id_exercice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `facture_detail`
--
ALTER TABLE `facture_detail`
  MODIFY `id_detail_facture` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `manutention`
--
ALTER TABLE `manutention`
  MODIFY `id_manutention` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT pour la table `manutention_detail`
--
ALTER TABLE `manutention_detail`
  MODIFY `id_detail_manu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `operation`
--
ALTER TABLE `operation`
  MODIFY `id_operation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `operation_categorie`
--
ALTER TABLE `operation_categorie`
  MODIFY `id_categorie_operation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `prestataire`
--
ALTER TABLE `prestataire`
  MODIFY `id_prestataire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `profil`
--
ALTER TABLE `profil`
  MODIFY `id_profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id_site` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`code_unite`) REFERENCES `unite` (`code_unite`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`code_article_fam`) REFERENCES `article_famille` (`code_article_fam`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `facture_ibfk_2` FOREIGN KEY (`id_prestataire`) REFERENCES `prestataire` (`id_prestataire`),
  ADD CONSTRAINT `facture_ibfk_3` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`),
  ADD CONSTRAINT `facture_ibfk_4` FOREIGN KEY (`id_exercice`) REFERENCES `exercice` (`id_exercice`);

--
-- Contraintes pour la table `facture_detail`
--
ALTER TABLE `facture_detail`
  ADD CONSTRAINT `facture_detail_ibfk_1` FOREIGN KEY (`id_manutention`) REFERENCES `manutention` (`id_manutention`),
  ADD CONSTRAINT `facture_detail_ibfk_2` FOREIGN KEY (`id_facture`) REFERENCES `facture` (`id_facture`);

--
-- Contraintes pour la table `manutention`
--
ALTER TABLE `manutention`
  ADD CONSTRAINT `manutention_ibfk_1` FOREIGN KEY (`id_exercice`) REFERENCES `exercice` (`id_exercice`),
  ADD CONSTRAINT `manutention_ibfk_2` FOREIGN KEY (`id_prestataire`) REFERENCES `prestataire` (`id_prestataire`),
  ADD CONSTRAINT `manutention_ibfk_3` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`);

--
-- Contraintes pour la table `manutention_detail`
--
ALTER TABLE `manutention_detail`
  ADD CONSTRAINT `manutention_detail_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `manutention_detail_ibfk_3` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `manutention_detail_ibfk_5` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `manutention_detail_ibfk_6` FOREIGN KEY (`id_manutention`) REFERENCES `manutention` (`id_manutention`),
  ADD CONSTRAINT `manutention_detail_ibfk_7` FOREIGN KEY (`id_operation`) REFERENCES `operation` (`id_operation`);

--
-- Contraintes pour la table `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `operation_ibfk_3` FOREIGN KEY (`id_exercice`) REFERENCES `exercice` (`id_exercice`),
  ADD CONSTRAINT `operation_ibfk_5` FOREIGN KEY (`id_categorie_operation`) REFERENCES `operation_categorie` (`id_categorie_operation`),
  ADD CONSTRAINT `operation_ibfk_6` FOREIGN KEY (`code_unite`) REFERENCES `unite` (`code_unite`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_profil`) REFERENCES `profil` (`id_profil`),
  ADD CONSTRAINT `utilisateur_ibfk_2` FOREIGN KEY (`id_site`) REFERENCES `site` (`id_site`),
  ADD CONSTRAINT `utilisateur_ibfk_3` FOREIGN KEY (`id_exercice`) REFERENCES `exercice` (`id_exercice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
