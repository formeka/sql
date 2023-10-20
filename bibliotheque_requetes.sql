
-- https://sql.sh/cours/where

-- 1. Afficher l'id_abonne de Laura ?
select id_abonne from abonne where prenom = 'Laura';

--2. Donner toutes les dates d'emprunt (date_sortie) de l'id_abonne 2 ?
select date_sortie from emprunt where id_abonne = 2;

--3. Combien d'emprunt ont été effectués en tout ?
select count(id_emprunt) from emprunt;

--4. Combien de livres sont sortis le 2011-12-19 ?

