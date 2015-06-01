-- SERGI CAROL I ENRIC LENARD

drop table if exists empleat;
drop table if exists tuplesEsborrades;
drop table if exists preTuplesEsborrades;
create table empleat( 
	nemp char(10) primary key,
	nom char(25),
	sou integer not null
);

create table tuplesEsborrades(
	dataiHora datetime,
	numTuples integer
);

create table preTuplesEsborrades(
	Hora datetime,
	num integer
);



INSERT INTO empleat VALUES ("id1","Sergi",10000);
INSERT INTO empleat VALUES ("id2","Enric",9000);
INSERT INTO empleat VALUES ("id3","Berta",1000);
INSERT INTO empleat VALUES ("id4","Dani",1500);
INSERT INTO empleat VALUES ("id5","Silvia",900);
INSERT INTO empleat VALUES ("id6","Nerea",5500);


--2.a)Només es pot modificar el sou si el numero d'empleats és més gran que 200
-- Les probes d'aquest trigger han sigut realitzades amb un limit de 2 i no de 200
CREATE TRIGGER R1
BEFORE UPDATE ON empleat
FOR EACH ROW
WHEN (SELECT count(*) FROM empleat )<200
BEGIN
	SELECT raise(ignore);
end;

--2.b) Despres de actulitzar el sou, el sou com a minim té que ser de 100€

CREATE TRIGGER R2
AFTER UPDATE ON empleat
FOR EACH ROW
WHEN (SELECT New.sou FROM empleat) < 100
BEGIN
	UPDATE empleat SET sou = 100;
end;

--2.c)Enregistrar el nombre de tuples esborrades i l'instant en que s'esborren a la taula
/*CREATE TRIGGER R3
AFTER DELETE ON empleat
FOR EACH ROW
BEGIN
	INSERT INTO tuplesEsborrades VALUES (datetime('now'),(SELECT changes()));
end;*/

CREATE TRIGGER R3
AFTER DELETE ON empleat
FOR EACH ROW
BEGIN
	INSERT INTO preTuplesEsborrades VALUES (datetime('now'),1);
end;

CREATE TRIGGER R4
AFTER INSERT ON preTuplesEsborrades
FOR EACH ROW
BEGIN
	INSERT INTO tuplesEsborrades (dataiHora,numTuples) SELECT Hora,count(num) FROM preTuplesEsborrades GROUP BY Hora;
	--DELETE FROM preTuplesEsborrades;
end;

/* Existeix un error en el que surten dues cerques al borrar les persones, ja que els triggers s'executen dos cops i no un
2015-06-01 11:08:39|1
2015-06-01 11:08:39|2
*/
DELETE FROM empleat WHERE nom = "Berta" or nom = "Sergi";
SELECT * FROM TuplesEsborrades;




