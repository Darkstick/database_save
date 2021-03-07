USE light_souls;
/* 1 : Sélectionnez le nom d’utilisateur de tous les joueurs du serveur ayant l’identifiant 2 */
SELECT nom_utilisateur FROM joueur WHERE id_joueur = 2;

/* 2 : Sélectionnez le nombre de joueurs par zone de serveur. Affichez la zone du serveur et le nombre de joueurs.*/
SELECT zone_serveur, COUNT(zone_serveur) AS nombre_de_joueurs FROM serveur
INNER JOIN personnage ON serveur.id_serveur = personnage.id_serveur
GROUP BY zone_serveur;

/* 3 : Sélectionnez les joueurs qui ont joint le jeu il y a plus d’un an.*/
SELECT nom_utilisateur FROM joueur WHERE (date_creation > 2021);

/* 4 : Sélectionnez les joueurs qui ne sont pas connectés depuis 6 mois*/
SELECT nom_utilisateur FROM joueur WHERE (derniere_connection > 2021-6);

/* 5 :  Sélectionnez tous les noms de personnage de la guilde « Les dragons de l’accalmie ».*/
SELECT nom_personnage FROM membre_guilde 
INNER JOIN personnage ON personnage.id_personnage = membre_guilde.id_personnage
WHERE id_guilde = 1;

/* 6 : Comptez le nombre de membres des guildes comportant au moins 3 membres. */
SELECT COUNT(id_personnage) AS nombre_de_membres FROM membre_guilde 
HAVING nombre_de_membres >= 3;

/* 7 : Comptez le nombre de membres d’une guilde de chaque rang_role de la guilde « Les chanteurs du désastre ».*/
SELECT COUNT(id_personnage) AS membre_role FROM membre_guilde WHERE id_guilde = 2 GROUP BY id_role;

/* 8 : Sélectionnez le nom du personnage ayant le plus haut rang dans la guilde « Les chanteurs du désastre ». */
SELECT nom_personnage FROM personnage
INNER JOIN membre_guilde ON personnage.id_personnage = membre_guilde.id_personnage
INNER JOIN guilde ON guilde.id_guilde = membre_guilde.id_guilde
WHERE id_role = 1 AND nom_guilde = "Les chanteurs du désastre";

/* 9 : Sélectionnez la valeur de l’équipement d’un personnage ayant l’identifiant 4. 
	   Ne considérez pas les objets équipés.*/
SELECT SUM(prix) FROM ligne_inventaire
INNER JOIN objet ON ligne_inventaire.id_objet = objet.id_objet
WHERE id_inventaire = 4;

/* 10 : Sélectionnez le nombre de potions de santé que le personnage ayant l’identifiant 6
		transporte. Affichez le nom de chaque potion en plus du nombre.*/
SELECT quantite, statistique_affectee FROM ligne_inventaire
INNER JOIN potion ON ligne_inventaire.id_objet = potion.id_objet
WHERE id_inventaire = 6;

/* 11 : Sélectionnez le DPS (damage per seconds) que le personnage ayant l’identifiant 6 inflige avec
		son arme équipée. Cela correspond à la valeur d’attaque divisée par la vitesse d’attaque.*/
SELECT dommage/vitesse_attaque AS DPS FROM arme
INNER JOIN inventaire_personnage ON arme.id_arme = inventaire_personnage.arme_equipee
WHERE id_personnage = 6;

/* 12 : Trouvez la valeur minimale et maximale de DPS qu’une arme dans l’inventaire du personnage
		ayant l’identifiant 3 peut infliger. Ne considérez pas les objets équipés.*/
SELECT max(dommage/vitesse_attaque) AS MAX_DPS, min(dommage/vitesse_attaque) AS MIN_DPS FROM arme;

/* 13 : Sélectionnez le nombre potions par statistique dont la durée de l’effet est supérieure à 45 et
		qui affectent la force, l’agilité ou l’endurance*/
SELECT COUNT(statistique_affectee) AS potion, statistique_affectee FROM potion 
WHERE temps_effet > 45 AND ((statistique_affectee = "force") OR (statistique_affectee = "agilite") OR (statistique_affectee = "endurance"))
GROUP BY statistique_affectee;

/* 14 : Calculez le prix moyen des armes du jeu (tous types d’objets confondus) dont la valeur de
		dommage est supérieure à 10.*/
SELECT avg(prix) AS average_price FROM arme
INNER JOIN objet ON arme.id_objet = objet.id_objet
WHERE dommage > 10;

/* 15  : Indiquer le ratio de charge transporté par chaque personnage avec le nom du personnage. Un
personnage peut lever 2 unités de poids par point de force (carac_force). Le ratio de charge
est la charge portée divisée par la charge maximale pouvant être transportée. Renommez la
colonne du ratio en « Ratio charge ». Ne considérez pas les objets équipés. */
SELECT nom_personnage, ((carac_force * 2)/sum(poid)) AS ratio FROM personnage
INNER JOIN ligne_inventaire ON personnage.id_personnage = ligne_inventaire.id_inventaire
INNER JOIN objet ON ligne_inventaire.id_objet = objet.id_objet
GROUP BY id_personnage;

/* 16 : affiche l'ID de l'equipement du personnage */
SELECT nom_personnage, arme_equipee, armure_equipee FROM personnage
INNER JOIN inventaire_personnage ON personnage.id_personnage = inventaire_personnage.id_personnage;


/* 17 : affiche le personnage le plus riche */
SELECT nom_personnage, argent FROM personnage ORDER BY argent DESC LIMIT 1;