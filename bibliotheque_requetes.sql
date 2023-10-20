-- https://sql.sh/cours/WHERE

-- 1. Afficher l'id_abonne de Laura ?

SELECT id_abonne FROM abonne WHERE prenom = 'Laura';

--2. Donner toutes les dates d'emprunt (date_sortie) de l'id_abonne 2 ?

SELECT date_sortie FROM emprunt WHERE id_abonne = 2;

--3. Combien d'emprunt ont été effectués en tout ?

SELECT count(id_emprunt) FROM emprunt;

--4. Combien de livres sont sortis le 2011-12-19 ?

SELECT count(id_emprunt)
FROM emprunt
WHERE
    date_sortie = '2011-12-19';

--5. Quel est l'auteur du livre "Un vie" ?

SELECT auteur FROM livre WHERE titre = 'Une vie';

--6. De combien de livre d'Alexandre Dumas dispose t'on ?

SELECT count(id_livre) FROM livre WHERE auteur = 'ALEXANDRE DUMAS';

--7. Quel id_livre est le plus emprunté ?

SELECT
    id_livre,
    count(date_sortie) as nombre_emprunt_sortie
FROM emprunt
GROUP BY id_livre
ORDER BY
    nombre_emprunt_sortie DESC
LIMIT 0, 1;

--8. Quel id_abonne emprunte le plus de livre ?

SELECT
    id_abonne,
    count(date_sortie) as nombre_emprunt_sortie
FROM emprunt
GROUP BY id_abonne
ORDER BY
    nombre_emprunt_sortie DESC
LIMIT 0, 1;

--9. Afficher les id_livre non rendus ?

SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;

--10. Afficher le titre des livres non rendus ?

SELECT titre
FROM livre
WHERE id_livre in (
        SELECT id_livre
        FROM emprunt
        WHERE
            date_rendu IS NULL
    );

--11. Afficher les dates de sortie et de rendu pour l'abonné Guillaume ?

SELECT
    a.prenom,
    e.date_sortie,
    e.date_rendu
FROM abonne AS a
    INNER JOIN emprunt AS e ON a.id_abonne = e.id_abonne
WHERE a.prenom = 'Guillaume';

--12. Afficher les abonné(e)s et les titres et auteurs livres empruntés ?
SELECT a.prenom , l.titre , l.auteur
FROM abonne AS a
INNER JOIN emprunt AS e
ON a.id_abonne = e.id_abonne
INNER JOIN livre AS l
ON l.id_livre = e.id_livre
;
