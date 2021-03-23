--creation  d'une db
CREATE DATABASE ecole;
-- suprimer une db
DROP DATABASE ecole;
-- pointer vers
 USE ecole;
 use entreprise;

-- se mettre dans la db entreprise et creer une table
use entreprise;
CREATE Table employes (
id_employes int(4) 	NOT null AUTO_INCREMENT,
    prenom varchar(45) default null,
	nom varchar(45) default null,
    sex enum('m','f') NOT null,
    service varchar(45) default null,
    date_embauche date default null,
    salaire float default null,
    PRIMARY KEY (id_employes)
)ENGINE = INNODB;
-- aller voir quels sont les database
show DATABASES
-- remplir les valeurs
use entreprise;
INSERT INTO employes(id_employes, prenom,nom,sex,service,date_embauche,salaire) VALUES (350,'jean-pierre','laborde','m','direction','1999-12-09',5000),
(370,'clement','gallet','m','commercial','2000-01-15',2300),
(415,'thomas','winter','m','commercial','2000-05-03',1900),
(491,'Elodie','Fellier','f','production','2001-09-05',1600),
(509,'Fabrice','Grand','m','compatibilite','2003-02-20',1900),
(547,'Melanie','Collier','f','commercial','2004-09-08',3100);
-- vider la table
TRUNCATE employes;
--decrire la table
desc employes;

-- read db selectionne toute la table employés
use entreprise;
select * from employes;
-- ne pas avoir toutes la tables mais avoir qu'une categories
select nom from employes;
-- plusieurs champs en une requetes
select nom, prenom from employes;
-- pour afficherun champs service
select service from employes;
-- sans redondance
select distinct service from employes; 
-- selectionnez le nom, prenom dans la table employés dont le champs est = a commercial
select nom, prenom from employes where service = 'commercial';
-- trouvez le service ou travail clement dans la table employes
select service from employes where prenom='clement';
-- trouvez la date d'embauche d'elodie 
select date_embauche from employes where prenom='elodie';
-- trouver le nom prenom des employés qui on ete embauchés entre 1999 et 2001
select nom, prenom from employes where date_embauche BETWEEN '1999-01-01' and '2001-12-31';
-- selectionnez les personnes qui travail dans le service qui commence par un C
select nom, prenom from employes where service like "c%";
-- selectionnez les services des employés qui on un nom composé
select service, nom, prenom from employes where prenom like "%-%";
-- =egale  >superieur <inferieur <=inferieur ou egale  >= superieur= different != <>
select nom, prenom from employes where service != "direction";
-- selectionnez les personne ou le salaire est inferieur a 2000
select nom, prenom from employes where salaire < 2000;
-- ordonnez les personnes par ordre de salaire 
select * from employes order by salaire;
-- de l'autre coté 
select * from employes order by salaire desc;
--selectionnez le nom et le prenom avec un salaire asc et un prenom desc
select nom, prenom, salaire from employes order by salaire, prenom desc;
-- selectionnez la personne la mieux payes
select nom from employes where salaire = (select MAX(salaire) from employes) ;
select * from employes order by salaire desc limit 0,1;
-- rajouter un alias a tout le monde != update c'est juste une requete on modifie pas la base
SELECT nom, prenom, salaire+100 AS salaire_prime from employes;
-- la sommes des 12 mois de salaires patyés au employés
SELECT SUM(salaire*12) FROM employes;
--afficher le salaire max des employes
SELECT MAX(salaire) FROM employes;
--afficher le salaire minimum des employes
SELECT min(salaire) FROM employes;
-- moyennes des salaires
select avg(salaire) from employes; 
-- arondir les salaires
SELECT ROUND(salaire) FROM employes;
--arondir la moyennes de salaires
select round(avg(salaire)) from employes; 
--arondir la moyennes de salaires avec deux chiffres 
select round(avg(salaire),2) from employes;
-- compter le nombre d'occurence dans ma base
select count(id_employes) from employes 
--compter le nombre d'occurence dans ma base d'hommes
select count(id_employes) from employes where sex ='m';
-- trouver les employes qui bosser en commercial et en production
select * from employes where service in('commercial', 'production')
-- trouver les employes qui bosse sauf en commercial et en production
select * from employes where service not in('commercial', 'production')
-- trouvez les employes commercial et salaire < 2000
select * from employes where service = 'commercial' and salaire <2000;
-- trouver les employes en production ou sont salaire = 1900 soit salaire =2300
select * from employes where service ='production' and salaire ='1900' or salaire ='2300'
-- trouver une personne qui est en production et qui touche 1900 ou bien les personne qui touche 2300
select * from employes where (service ='production' and salaire ='1900') or salaire ='2300'
-- le nombre de personne par services
select service, count(id_employes) from employes group by service;
-- affciher les services qui sont superieur a une personne
select service, count(id_employes) as number from employes group by service having number > 1;
-- rajouter une ligne sans avoir tout les champs, seul l'id est obligatoire
insert into employes(id_employes, nom, service, prenom)VALUES (411, 'nina', 'production', 'tot');
-- rajouter des valeurs sans indiquer les clés
insert into employes VALUES(144, 'gg', 'm','f','f', null, 1455)

--update mettres a jour la table ;
update employes set salaire= 9000 where service ='direction';
-- update les salaires de toutes les femmes a 2500
update employes set salaire =2500 where sex = 'f';
-- update mettre a jour la date d'embauche a aujourdh'ui et salaire a 500;
update employes set salaire=500, date_embauche="22021-1-1" where id_employes=411;
-- mettre tout les salaires a 0
update employes set salaire =0;
-- creer un id si il le trouve pas et remplace si il le trouve
replace into employes(id_employes, prenom, nom, sex , service, date_embauche, salaire)values(222,'test', 'test', 'm', 'marketing','2010-07-05',2514);

-- delete
delete from employes where nom ='nina';
-- suprrimer l'employer du service commercial qui on un id =! 415
delete from employes where service ='commercial'and id_employes!=415;
-- supprimer les salaries qui on un salaire entre 1500 et 4000  
delete from employes where salaire between 1500 and 4000;     
-- equivalent a un truncate
delete from employes;
