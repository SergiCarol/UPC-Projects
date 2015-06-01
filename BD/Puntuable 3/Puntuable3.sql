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

--EXERCICI 1:
SELECT d.carrer FROM domicilis d, liniesComandes l, productes p
