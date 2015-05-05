-- Tasca 2 

-- 1:

DELETE FROM productes WHERE estoc = null;

-- 2:

UPDATE clients SET descompte = 1.5 LIMIT 3;

-- 3:
	
SELECT codi FROM Productes WHERE descripcio like "%Monitor%" AND estoc > 0;

-- 4:

SELECT codiCentre FROM Venedors WHERE edat BETWEEN 21 AND 26 ORDER BY edat;

-- 5:

SELECT a.nif,sum(b.unitats*(c.preu-(c.preu*a.descompte))) AS import_amb_descompte FROM clients a, comandes b, productes c WHERE (a.nif=b.nif) AND (b.codiProducte=c.codi) AND year (b.data)=2002 GROUP BY a.nif

-- 6:

SELECT venedors.nom, sum(comandes.unitats) AS tot_unitats_venudes FROM venedors LEFT JOIN comandes ON (venedors.codi=comandes.codiVenedor) GROUP BY venedors.codi limit 10;
-- 7:
SELECT productes.codi, productes.descripció FROM productes LEFT JOIN comandes ON (productes.codi=comandes.codiProducte) WHERE comandes.codiProducte IS null