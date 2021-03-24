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

-- afficher les titres des livres que cholé n'a pas emprunté
select titre from livre where id_livre not in
(select id_livre from emprunt where id_abonne =
(select id_abonne from abonne where prenom='chloe'));

--combien de livres benoit a emprunté a la bibilotheques
select count(id_emprunt) from emprunt where id_abonne in
(select id_abonne from abonne where prenom='benoit');

-- quel est le prenom de la personne qui a emprunte le plus de livre a la bibliotheque
select prenom from abonne where id_abonne =
(select id_abonne from emprunt group by id_abonne order by count(date_sortie) desc limit 0,1)

select prenom from abonne where id_abonne in(
select id_abonne from emprunt where date_sortie in (select max(date_sortie)from emprunt))


--jointures internes et externes
--interneon recupere le milieu des deux table lié par les PK
-- externes left join il prend tout et absorbe la premiere table
-- externes right join il prend tout et absorbe la seconde table

-- date de sortie et de rendu pour l'abonné guillaume
-- emprunt => e table abonne => a
select e.date_sortie, e.date_rendu, a.prenom-- ce que je souhaite afficher
from abonne a --la 1ere table d'ou viennent els informations
inner join emprunt e -- lier la premiere table a la seconde table
on a.id_abonne=e.id_abonne --la jointure qui lie les deux champs communs dans les 2 nom
where a.prenom='guillaume';--conditions pas obligatoire supplementaire sur le prenom

-- afficher les titres, dates de sorties et de rendu des livre ecrit par alphonse daudet
select e.date_sortie, e.date_rendu, l.titre
from livre l
inner join emprunt e
on l.id_livre= e.id_livre
where l.auteur = "alphonse daudet"

--qui (prenom ) a emprunté  "une vie" sur 2011
select a.prenom
from abonne a
inner join emprunt e
on a.id_abonne=e.id_abonne
inner join livre l
on e.id_livre= l.id_livre
where l.titre= 'une vie '
and e.date_sortie like '2011%'

-- le nombre de livre emprunté par chaque prenom
select a.prenom, count(e.id_livre) 
FROM abonne a 
inner join emprunt e
on a.id_abonne =e.id_abonne
group by e.id_abonne 

-- qui (prenom) a emprunté quoi (titre) et a quelle date (date_sortie)
select a.prenom, l.titre, e.date_sortie
from abonne a
inner join emprunt e
on a.id_abonne=e.id_abonne
inner join livre l
on e.id_livre=l.id_livre

-- afficher les prenoms des abonnes avec les id_livres qu'ils on emprunté
select a.prenom, e.id_livre
from abonne a
inner join emprunt e
on a.id_abonne=e.id_abonne

--inserez un prenom
use bibliotheque;
INSERT INTO abonne( prenom) VALUES 
('Michel')


-- afficher les prenoms des abonnes avec les id_livres qu'ils on emprunté en rajoutant 
select a.prenom, e.id_livre
from abonne a
left join emprunt e
on a.id_abonne=e.id_abonne

-- supprimer un id_livre
delete from livre where id_livre=100;

--
select emprunt .id_emprunt, livre.titre 
from emprunt
left join livre
on emprunt.id_livre= livre.id_livre