/**
 * Fichier : Donnees - RPG Light Soul.sql
 * Auteur : Alexandre Ouellet
 * Date : 15 février 2021
 * Description : Permet la création des diverses données de la bd RPG Light Soul
 */
USE light_souls;

INSERT INTO Serveur (nom_serveur, zone_serveur) VALUES
('ADN1', 'amerique du nord'),
('ADN2', 'amerique du nord'),
('ADS1', 'amerique du sud'),
('EUR1', 'europe'),
('EUR2', 'europe'),
('EUR3', 'europe'),
('MOY1', 'moyen-orient'),
('AFR1', 'afrique'),
('ASI1', 'asie'),
('ASI2', 'asie'),
('ASI3', 'asie'),
('ASI4', 'asie'),
('OCE1', 'oceanie');
INSERT INTO Joueur (nom_utilisateur, mot_de_passe, date_creation, derniere_connection) VALUES
('le_destructeur', 'password', '2018-07-12 15:47:38', '2021-01-30 18:52:19'),
('petit_pingouin', 'tarte123', '2019-12-15 21:05:48', '2019-12-30 02:14:57'),
('tourtiere123', 'qwerty', '2020-02-07 07:15:07', '2020-04-30 09:04:07'),
('BiGbAbY', '987654', '2020-06-24 11:41:17', '2021-02-18 13:31:21'),
('nom_utilisateurX', 'admin', '2021-02-02 23:00:40', '2021-02-19 15:40:21');
INSERT INTO Personnage (id_serveur, id_joueur, nom_personnage, experience, niveau, argent, carac_force) VALUES
(2, 1, 'Bozzo', 138710, 99, 191559, 25),
(2, 2, 'Thormund', 53270, 53, 51359, 26),
(2, 1, 'Noob1234', 97530, 97, 87556, 28),
(4, 2, 'Glitch', 12150, 12, 17847, 23),
(4, 3, 'Fr0d0', 136860, 99, 107425, 28),
(4, 3, 'Assurancetourix', 58630, 58, 71190, 23),
(4, 2, 'Garou', 1400, 1, 1285, 18),
(7, 4, 'Kaaarl', 22900, 22, 13262, 15),
(7, 5, 'Chose', 50910, 50, 38603, 17),
(7, 5, 'Lupin', 9830, 9, 6861, 13),
(7, 4, 'Winner', 430, 0, 383, 20),
(7, 4, 'Alpha1', 36810, 36, 32175, 25),
(7, 5, 'NomPersonnage', 125410, 99, 110053, 26),
(7, 4, 'Bobby', 32490, 32, 38564, 25);
INSERT INTO Guilde (nom_guilde, id_serveur) VALUES
('Les dragons de l\'accalmie', 2),
('Les chanteurs du désastre', 4),
('Les champions de l\'appocalypse', 4),
('Les survivants de la COVID', 7);
INSERT INTO Role_guilde (nom_role, rang_role) VALUES
('Novice', 1),
('Initié', 3),
('Maître', 5),
('Grand maître', 7);
INSERT INTO Membre_guilde (id_personnage, id_guilde, id_role) VALUES
(1, 1, 1),
(2, 1, 4),
(6, 2, 4),
(7, 2, 3),
(5, 2, 1),
(4, 3, 4),
(10, 4, 4),
(12, 4, 3),
(13, 4, 2),
(14, 4, 2);
INSERT INTO Objet (nom, prix, poid) VALUES
('Épée vengeresse', 15000, 3.5),
('Dague de la douleur', 175, 1.75),
('Hâche rouillée', 300, 4),
('Bâton de magie mineure', 8000, 2),
('Arc du peureux', 2500, 1.5),
('Épieux épnieux', 45000, 7),
('Chaudière trouée', 125, 2),
('Casque aveuglant', 3500, 3.5),
('Haume du prestige', 15000, 5),
('Bandeau décoratif', 30, 0.5),
('Veste rapiécée', 50, 1),
('Armure de nain', 50000, 8),
('Harnois glorieux', 125000, 19),
('Onesie du voleur', 18000, 3),
('Potion de naturopathie', 25, 0.25),
('Potion de soin intensifs', 875, 0.25),
('Force du sanglier', 450, 0.25),
('Force de l\'éléphant', 2000, 0.25),
('Main de singe', 1400, 0.25),
('Constitution du mulet', 450, 0.25),
('Endurance de la fourmis', 2000, 0.25),
('Potion de QI', 600, 0.25),
('Potion de QI over 9000', 50000, 0.25);
INSERT INTO Arme (id_objet, dommage, vitesse_attaque) VALUES
(1, 30, 0.8),
(2, 5, 0.4),
(3, 14, 1),
(4, 2, 0.7),
(5, 9, 1.5),
(6, 55, 2);
INSERT INTO Armure (id_objet, protection, zone_protegee) VALUES
(7, 3, 'tete'),
(8, 5, 'tete'),
(9, 9, 'tete'),
(10, 1, 'tete'),
(11, 1, 'corps'),
(12, 15, 'corps'),
(13, 25, 'corps'),
(14, 3, 'corps');
INSERT INTO Potion (id_objet, force_effet, statistique_affectee, temps_effet) VALUES
(15, 1, 'sante', 1),
(16, 20, 'sante', 15),
(17, 10, 'force', 120),
(18, 15, 'force', 210),
(19, 12, 'agilite', 150),
(20, 10, 'endurance', 120),
(21, 15, 'endurance', 210),
(22, 25, 'intelligence', 30),
(23, 9001, 'intelligence', 9001);
INSERT INTO Inventaire_personnage (id_personnage, arme_equipee, casque_equipee, armure_equipee) VALUES
(1, 6, 3, 7),
(2, 5, 1, 6),
(3, 2, NULL, 8),
(4, 2, 4, 5),
(5, 1, 3, 7),
(6, 3, 2, 6);
INSERT INTO Ligne_inventaire (id_inventaire, id_objet, quantite) VALUES
(1, 6, 1),
(1, 9, 1),
(1, 13, 1),
(1, 23, 2),
(2, 7, 1),
(2, 12, 1),
(2, 5, 1),
(3, 14, 1),
(3, 17, 1),
(3, 2, 1),
(3, 15, 5),
(3, 22, 3),
(3, 3, 1),
(4, 10, 1),
(4, 11, 1),
(4, 2, 1),
(4, 19, 1),
(5, 6, 1),
(5, 1, 1),
(5, 9, 1),
(5, 13, 1),
(5, 18, 4),
(5, 21, 4),
(5, 16, 5),
(6, 3, 1),
(6, 8, 1),
(6, 12, 1),
(6, 19, 3),
(6, 20, 2);

