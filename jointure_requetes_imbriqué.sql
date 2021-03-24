-- quel id_abonnes a emprunté le plus de livre
select id_abonne from emprunt where date_sortie=(select max(date_sortie)from emprunt);
select id_abonne, count( date_sortie) from emprunt group by id_abonne order by count(date_sortie) desc limit 0,1;

-- recuperer les livres pas rendu 
select id_livre from emprunt where date_rendu is null;
-- recuperer les titres des livres pas rendu 
select titre from livre where id_livre in (select id_livre from emprunt where date_rendu is null);

-- afficher le numero des livres que chloé a emprunté
select id_livre from emprunt where id_abonne in (select id_abonne from abonne where prenom="Chloe");

--afficher les prenoms des abonnes ayant empruntées un livre le '2011-12-19'
select prenom from abonne where id_abonne in ( select id_abonne from emprunt where date_sortie='2011-12-19' ) ;

-- afficher les prenoms des abonés ayant emprunté un livre d'alphonse d'audet
select prenom from abonne where id_abonne in
(select id_abonne from emprunt where id_livre in
(select id_livre from livre where auteur='ALPHONSE DAUDET') );

-- afficher le titre des livres que cholé a empruntés
select titre from livre where id_livre in
(select id_livre from emprunt where id_abonne =
(select id_abonne from abonne where prenom='chloe'));

