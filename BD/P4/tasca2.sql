-- Tasca 2 

-- 1:

DELETE FROM productes WHERE estoc = null;

-- 2:

UPDATE clients SET descompte = 1.5 LIMIT 3;

-- 3:
	
SELECT codi FROM Productes WHERE descripcio = "Monitor" AND estoc > 0;

-- 4:

SELECT codiCentre FROM Venedors WHERE edat BETWEEN 21 AND 26 ORDER BY edat

-- 5:

SELECT 