table: abonne
+-----------+-----------+
| id_abonne | prenom    |
+-----------+-----------+
|         1 | Guillaume |
|         2 | Benoit    |
|         3 | Chloe     |
|         4 | Laura     |
+-----------+-----------+

table: emprunt
+------------+----------+-----------+--------------+------------+
| id_emprunt | id_livre | id_abonne |  date_sortie | date_rendu |
+------------+----------+-----------+--------------+------------+
|          1 |      100 |         1 | 2011-12-17   | 2011-12-18 |
|          2 |      101 |         2 | 2011-12-18   | 2011-12-20 |
|          3 |      100 |         3 | 2011-12-19   | 2011-12-22 |
|          4 |      103 |         4 | 2011-12-19   | 2011-12-22 |
|          5 |      104 |         1 | 2011-12-19   | 2011-12-28 |
|          6 |      105 |         2 | 2012-03-20   | 2012-03-26 |
|          7 |      105 |         3 | 2013-06-13   | NULL       |
|          8 |      100 |         2 | 2013-06-15   | NULL       |
+------------+----------+-----------+--------------+------------+

table: livre
+----------+-------------------+-------------------------+
| id_livre | auteur            | titre                   |
+----------+-------------------+-------------------------+
|      100 | GUY DE MAUPASSANT | Une vie                 |
|      101 | GUY DE MAUPASSANT | Bel-Ami                 |
|      102 | HONORE DE BALZAC  | Le pere Goriot          |
|      103 | ALPHONSE DAUDET   | Le Petit chose          |
|      104 | ALEXANDRE DUMAS   | La Reine Margot         |
|      105 | ALEXANDRE DUMAS   | Les Trois Mousquetaires |


--de a a z
create database if not exists bibliotheque
--creation de la table abonne

use bibliotheque;
CREATE Table abonne (
id_abonne int(4) 	NOT null AUTO_INCREMENT,
    prenom varchar(45) default null,
    PRIMARY KEY (id_abonne)
)ENGINE = INNODB;

--creation de la table livre
use bibliotheque;
CREATE Table livre (
id_livre int(4) 	NOT null AUTO_INCREMENT,
    auteur varchar(70) default null,
    titre varchar(255) default null,
    PRIMARY KEY (id_livre)
)ENGINE = INNODB;

--creation de la table emprunt

use bibliotheque;
CREATE Table emprunt (
id_emprunt int(4) 	NOT null AUTO_INCREMENT,
    id_livre  int(4) 	NOT null,
	id_abonne  int(4) 	NOT null,
    date_sortie date default null,
    date_rendu date default null,
    PRIMARY KEY (id_emprunt)
)ENGINE = INNODB;

-- remplir les valeurs abonne
use bibliotheque;
INSERT INTO abonne(id_abonne, prenom) VALUES 
(1,'Guillaume'),
(2,'benoit'),
(3,'Chloe'),
(4,'Laura');

-- remplir les valeurs livre
use bibliotheque;
INSERT INTO livre(id_livre, auteur, titre) VALUES 
(100,'GUY DE MAUPASSANT','Une vie'),
(101,'GUY DE MAUPASSANT', 'Bel-ami'),
(102,'HONORE DE BALZAC','le pere Goriot'),
(103,'ALPHONSE DAUDET','le Petit chose'),
(104,'ALEXANDRE DUMAS', 'la reine Margot'),
(105,'ALEXANDRE DUMAS', 'les Trois mousquetaires');


-- remplir les valeur emprunt
use bibliotheque;
INSERT INTO emprunt(id_emprunt,id_livre,id_abonne, date_sortie, date_rendu) VALUES 
(1,100,1,'2011-12-17','2011-12-18'),
(2,101,2,'2011-12-18','2011-12-20'),
(3,100,3,'2011-12-19','2011-12-22'),
(4,103,4,'2011-12-19','2011-12-22'),
(5,104,1,'2011-12-19','2011-12-28'),
(6,105,2,'2012-03-20','2011-12-26'),
(7,105,3,'2013-06-13',null),
(8,100,2,'2013-06-15',null);
