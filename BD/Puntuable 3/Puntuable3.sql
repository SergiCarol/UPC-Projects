create table productes
(idProducte char(9),
nom char (20),
mida char (20),
preu integer check(preu>0),
primary key (idProducte),
unique (nom, mida));

create table domicilis
(numero char(9),
carrer char (20),
numCarrer integer check(numCarrer>0),
pis char(2),
porta char(2),
primary key (numero));

create table comandes
(numComanda integer check(numComanda>0),
instantFeta integer not null check(instantFeta>0),
instantServida integer check(instantServida>0),
numTelf char(9),
import integer check(import>0),
primary key (numComanda),
foreign key (numTelf) references domicilis,
check(instantServida>instantFeta));

create table liniesComandes
(numComanda integer,
idProducte char(9),
quantitat integer check(quantitat>0),
primary key(numComanda,idProducte),
foreign key (numComanda) references comandes,
foreign key (idProducte) references productes);

/*create table regals
(idProdComprat char(9),
idProdRegalat char(9),
primary key (idProdComprat, idProdRegalat),
foreign key (idProdComprat) references productes),
foreign key (idProdRegalat) refreneces productes));*/

INSERT INTO productes VALUES(123456789, 'peperoni', 'gran', 21); 
INSERT INTO productes VALUES(123456788, 'peperoni', 'mitjana', 13); 
INSERT INTO productes VALUES(123456787, 'peperoni', 'petita', 9); 
INSERT INTO productes VALUES(123456786, 'bbq', 'gran', 21); 
INSERT INTO productes VALUES(123456785, 'bbq', 'mitjana', 13); 
INSERT INTO productes VALUES(123456784, 'bbq', 'petita', 9); 
INSERT INTO productes VALUES(123456783, 'formatge', 'gran', 21); 
INSERT INTO productes VALUES(123456782, 'formatge', 'mitjana', 13); 
INSERT INTO productes VALUES(123456781, 'formatge', 'petita', 9); 
INSERT INTO productes VALUES(123456780, 'tropical', 'gran', 21); 
INSERT INTO productes VALUES(123456779, 'tropical', 'mitjana', 13); 
INSERT INTO productes VALUES(123456769, 'tropical', 'petita', 9); 
INSERT INTO productes VALUES(123456759, 'pollo', 'gran', 21); 
INSERT INTO productes VALUES(123456749, 'pollo', 'mitjana', 13); 
INSERT INTO productes VALUES(123456739, 'pollo', 'petita', 9); 

INSERT INTO domicilis VALUES(938725479, 'Angel Guimera', 26, 2, NULL); 
INSERT INTO domicilis VALUES(938725478, 'Carrio', 15, 5, 2); 
INSERT INTO domicilis VALUES(938725477, 'Pl. Espanya', 8, 9, 1); 
INSERT INTO domicilis VALUES(938725476, 'Pl. Catalunya', 62, 7, 2); 
INSERT INTO domicilis VALUES(938725475, 'Pere III', 85, 8, NULL); 
INSERT INTO domicilis VALUES(938725474, 'Numancia', 1, 2, 1); 
INSERT INTO domicilis VALUES(938725473, 'Josep Tarres', 21, 4, NULL); 
INSERT INTO domicilis VALUES(938725472, 'Diagonal', 31, 5, 2); 
INSERT INTO domicilis VALUES(938725471, 'Alvenez', 54, 6, 1); 
INSERT INTO domicilis VALUES(938725470, 'Complex', 12, 2, 1);

INSERT INTO comandes VALUES(1, 10, 30, 938725479, 21); 
INSERT INTO comandes VALUES(2, 10, 30, 938725478, 21); 
INSERT INTO comandes VALUES(3, 10, 30, 938725477, 21); 
INSERT INTO comandes VALUES(4, 10, 30, 938725476, 21); 
INSERT INTO comandes VALUES(5, 10, 30, 938725475, 21); 
INSERT INTO comandes VALUES(6, 10, 30, 938725474, 21); 
INSERT INTO comandes VALUES(7, 10, 30, 938725473, 21); 
INSERT INTO comandes VALUES(8, 10, 30, 938725472, 21); 
INSERT INTO comandes VALUES(9, 10, 30, 938725471, 21); 
INSERT INTO comandes VALUES(0, 10, 30, 938725470, 21); 

INSERT INTO liniesComandes VALUES(1, 123456789, 2); 
INSERT INTO liniesComandes VALUES(2, 123456788, 1); 
INSERT INTO liniesComandes VALUES(3, 123456787, 4); 
INSERT INTO liniesComandes VALUES(4, 123456786, 5); 
INSERT INTO liniesComandes VALUES(5, 123456785, 2); 
INSERT INTO liniesComandes VALUES(6, 123456784, 3); 
INSERT INTO liniesComandes VALUES(7, 123456783, 1); 
INSERT INTO liniesComandes VALUES(8, 123456782, 2); 
INSERT INTO liniesComandes VALUES(9, 123456781, 4); 
INSERT INTO liniesComandes VALUES(0, 123456780, 3); 

 


--EXERCICI 1:

