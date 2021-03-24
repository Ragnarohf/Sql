-- quel id_abonnes a emprunté le plus de livre
select id_abonne from emprunt where date_sortie=(select max(date_sortie)from emprunt);
select id_abonne, count( date_sortie) from emprunt group by id_abonne order by count(date_sortie) desc limit 0,1;

-- recuperer les livres pas rendu 
select id_livre from emprunt where date_rendu is null;
-- recuperer les titres des livres pas rendu 
select titre from livre where id_livre  in(select id_livre from emprunt where date_rendu is null);