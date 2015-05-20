drop table if exists usuaris;
drop table if exists amistats;
drop table if exists preferencies;
drop table if exists amicPotencial;
create table amicPotencial(ID1 int, ID2 int);
create table usuaris(ID int, nom text, grau int);
create table amistats(ID1 int, ID2 int);
create table preferencies(ID1 int, ID2 int);

insert into usuaris values (1510, 'Jordan', 9);
insert into usuaris values (1689, 'Gabriel', 9);
insert into usuaris values (1381, 'Tiffany', 9);
insert into usuaris values (1709, 'Cassandra', 9);
insert into usuaris values (1101, 'Haley', 10);
insert into usuaris values (1782, 'Andrew', 10);
insert into usuaris values (1468, 'Kris', 10);
insert into usuaris values (1641, 'Brittany', 10);
insert into usuaris values (1247, 'Alexis', 11);
insert into usuaris values (1316, 'Austin', 11);
insert into usuaris values (1911, 'Gabriel', 11);
insert into usuaris values (1501, 'Jessica', 11);
insert into usuaris values (1304, 'Jordan', 12);
insert into usuaris values (1025, 'John', 12);
insert into usuaris values (1934, 'Kyle', 12);
insert into usuaris values (1661, 'Logan', 12);

insert into amistats values (1510, 1381);
insert into amistats values (1510, 1689);
insert into amistats values (1689, 1709);
insert into amistats values (1381, 1247);
insert into amistats values (1709, 1247);
insert into amistats values (1689, 1782);
insert into amistats values (1782, 1468);
insert into amistats values (1782, 1316);
insert into amistats values (1782, 1304);
insert into amistats values (1468, 1101);
insert into amistats values (1468, 1641);
insert into amistats values (1101, 1641);
insert into amistats values (1247, 1911);
insert into amistats values (1247, 1501);
insert into amistats values (1911, 1501);
insert into amistats values (1501, 1934);
insert into amistats values (1316, 1934);
insert into amistats values (1934, 1304);
insert into amistats values (1304, 1661);
insert into amistats values (1661, 1025);

insert into preferencies values(1689, 1709);
insert into preferencies values(1709, 1689);
insert into preferencies values(1782, 1709);
insert into preferencies values(1911, 1247);
insert into preferencies values(1247, 1468);
insert into preferencies values(1641, 1468);
insert into preferencies values(1316, 1304);
insert into preferencies values(1501, 1934);
insert into preferencies values(1934, 1501);
insert into preferencies values(1025, 1101);

/*
1. Escriure un trigger que gestioni una taula d'amicsPotencials, 
tal que automàticament quan s'insereixi un usuari, 
aquest sigui amicPotencial de tot alumne del seu mateix grau
*/

CREATE TRIGGER POTENCIAL 
AFTER INSERT ON USUARIS--actua quan detecta una insercio a la taula Usuaris
FOR EACH ROW
BEGIN 
   INSERT INTO AMICPOTENCIAL--inserim el nou usuari a AmicPotencial
   SELECT NEW.ID ,ID
   FROM USUARIS WHERE NEW.GRAU = GRAU;--comprovem que siguin del mateix grau
END;

/*
2. Escriure un o més triggers per gestionar el grau dels 
nous usuaris. Si el registre inserit és inferior a 9 o major a 12, 
cal canviar el valor a NULL. Addicionalment, si el registre 
inserit té un valor null a grau, cal canviar-lo per 9.
*/
--Trigger quan valor inferior a 9 o major a 12
CREATE TRIGGER R2
AFTER INSERT ON USUARIS
FOR EACH ROW--per a cada fila
BEGIN 
   UPDATE USUARIS SET GRAU = NULL--actualitzem el grau per NULL
   WHERE (NEW.GRAU < 9 OR NEW.GRAU > 12);--comprovem si compleix condicions
END;
--Trigger quan valor inserit te valor NULL
CREATE TRIGGER R2_2
AFTER INSERT ON USUARIS 
FOR EACH ROW
BEGIN
   UPDATE USUARIS SET GRAU = 9--actualitzem el grau per 9
   WHERE NEW.GRAU IS NULL;--NEW.GRAU=> grau introduit
END;

/* 
3. Escriure un o més triggers que mantinguin la relació de 
simetria en amics. Específicament, si s'elimina (A,B) de amistats, aleshores
també cal eliminar (B,A). Si s'insereix (A,B), també cal 
inserir (B,A). No cal mantenir modificacions.
*/
--Trigger elimina relaicions mutues
CREATE TRIGGER BORRAR
AFTER DELETE ON AMISTATS--activa quan detecta eliminacio en Amistats
FOR EACH ROW
BEGIN
   DELETE FROM AMISTATS--OLD.ID=>usuari de la taula
   WHERE (OLD.ID1=ID2 AND OLD.ID2=ID1);
END;

--Trigger que duplica amistat
CREATE TRIGGER INSEREIX
AFTER INSERT ON AMISTATS
FOR EACH ROW
BEGIN
   INSERT INTO amistats VALUES (NEW.ID2, NEW.ID1);--inserim amistat girada
END;

/*
4. Escriure un trigger que automàticament esborri estudiants quan 
aquests es graduin, és a dir, quan el grau superi el valor 12
*/

CREATE TRIGGER R3
AFTER UPDATE OF GRAU ON USUARIS
FOR EACH ROW
WHEN (NEW.GRAU > 12)--actua quan es compleixi GRAU>12
BEGIN 
   DELETE FROM USUARIS
   WHERE OLD.ID = ID;--ID=> identificador introduit
END;

/*
5. Escriure un trigger tal que quan un usuari incrementi un grau, 
també ho facin els seus amics.
*/

CREATE TRIGGER INCREMENT 
AFTER UPDATE OF GRAU ON USUARIS--actua al detectar modificacio de grau
FOR EACH ROW 
BEGIN
   UPDATE USUARIS SET GRAU = GRAU+1 --Incrementem el valor del grau
   WHERE ID IN (SELECT ID2 FROM AMISTATS
		WHERE ID1 = NEW.ID);--en funcio del usuari introduit
END;

/*
6. Escriure un trigger que forci el següent comportament: 
Si A té preferència per B, però es modifica a que A té preferència 
per C, i B i C són amics, aleshores B i C no poden ser amics. 
Per tant cal eliminar la relació d'amistat en els 2 sentits (B,C) 
i (C,B). Comproveu que el trigger únicament funciona quan és 
preferit (B) no el (A)
*/
--DELETE (B=OLD.ID2,C=ID2)

CREATE TRIGGER PREF
AFTER UPDATE OF ID2 ON PREFERENCIES
FOR EACH ROW
WHEN EXISTS (SELECT * FROM AMISTATS --Tenim en compte si són amics
	     WHERE (ID2=NEW.ID2 AND ID1=OLD.ID2)) 
BEGIN--Borrem les amistats simetricament 
   DELETE FROM AMISTATS WHERE (ID1=OLD.ID2 AND ID2=ID2);
   DELETE FROM AMISTATS WHERE (ID2=ID2 AND OLD.ID1=ID2);
END;
