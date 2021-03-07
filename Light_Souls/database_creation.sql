DROP DATABASE light_souls;
CREATE DATABASE IF NOT EXISTS light_souls;
USE light_souls;

CREATE TABLE joueur
(
	id_joueur int PRIMARY KEY AUTO_INCREMENT,
    nom_utilisateur VARCHAR(30),
    mot_de_passe CHAR(64),
    date_creation timestamp,
    derniere_connection timestamp
);

CREATE TABLE serveur
(
	id_serveur int PRIMARY KEY AUTO_INCREMENT,
    nom_serveur VARCHAR(30),
    zone_serveur ENUM('amérique du nord', 'amérique du sud', 'europe', 'moyen-orient', 'asie', 'afrique', 'océanie')
);

CREATE TABLE objet
(
	id_objet INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(30),
    prix MEDIUMINT,
    poid FLOAT
);

CREATE TABLE role_guilde
(
	id_role INT PRIMARY KEY AUTO_INCREMENT,
    nom_role VARCHAR(30),
    rang_role TINYINT
);

CREATE TABLE personnage
(
	id_personnage INT PRIMARY KEY AUTO_INCREMENT,
    nom_personnage VARCHAR(30),
    experience INT DEFAULT 0,
    niveau INT DEFAULT 1,
    argent INT DEFAULT 0,
    carac_force TINYINT,
    id_serveur INT,
    FOREIGN KEY(id_serveur) REFERENCES serveur(id_serveur),
    id_joueur INT,
    FOREIGN KEY(id_joueur) REFERENCES joueur(id_joueur)
);

CREATE TABLE guilde
(
	id_guilde INT PRIMARY KEY AUTO_INCREMENT,
    nom_guilde VARCHAR(50),
    id_serveur INT,
    FOREIGN KEY(id_serveur) REFERENCES serveur(id_serveur)
);

CREATE TABLE membre_guilde
(
	id_personnage INT PRIMARY KEY,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    id_guilde INT,
    FOREIGN KEY(id_guilde) REFERENCES guilde(id_guilde),
    id_role INT,
    FOREIGN KEY(id_role) REFERENCES role_guilde(id_role)
);

CREATE TABLE arme
(
	id_arme INT PRIMARY KEY AUTO_INCREMENT,
    dommage FLOAT,
    vitesse_attaque FLOAT,
    id_objet INT,
    FOREIGN KEY (id_objet) REFERENCES objet(id_objet)
);

CREATE TABLE armure
(
	id_armure INT PRIMARY KEY AUTO_INCREMENT,
    protection FLOAT,
    zone_protegee ENUM('tete', 'corps'),
    id_objet INT,
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet)
);

CREATE TABLE inventaire_personnage
(
	id_personnage INT PRIMARY KEY,
    FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage),
    arme_equipee INT,
    FOREIGN KEY(arme_equipee) REFERENCES arme(id_arme),
    armure_equipee INT,
    FOREIGN KEY(armure_equipee) REFERENCES armure(id_armure),
    casque_equipee INT,
    FOREIGN KEY(casque_equipee) REFERENCES armure(id_armure)
);

CREATE TABLE potion
(
	id_potion INT PRIMARY KEY AUTO_INCREMENT,
	id_objet INT,
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    force_effet FLOAT,
    temps_effet FLOAT,
    statistique_affectee ENUM('sante','force','agilite','endurance','intelligence')
);

CREATE TABLE ligne_inventaire
(
	id_inventaire INT,
    FOREIGN KEY(id_inventaire) REFERENCES inventaire_personnage(id_personnage),
    id_objet INT,
	PRIMARY KEY(id_inventaire, id_objet),
    FOREIGN KEY(id_objet) REFERENCES objet(id_objet),
    quantite INT
);